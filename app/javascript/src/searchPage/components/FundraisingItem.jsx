import React ,{ useState, useEffect } from 'react';
import ProgressBar from './ProgressBar';
import DaysLeft from './DaysLeft';
import axios from '../../../lib/http/client'

const FundraisingItem = () => {
    let [projectItems, setProjectItems] = useState([])

    useEffect(() => {
        let fetchProject = () => {
            let querystring = (new URL(document.location)).searchParams;
            let keyword = querystring.get('keyword') 
            let type = querystring.get('type')
            axios.get('/api/search/projects', {
                    params: {
                        keyword: keyword,
                        type : type
                    }
                })
                .then(resp => {
                    setProjectItems(resp.data)
                })
                .catch( err => alert(err))
                };
        fetchProject();
    },[])

    return (
        <> 
            {projectItems.length > 0 ? projectItems.map((item , index)=> (
                <article className="col-span-3 p-3 mb-8 bg-white shadow-xl lg:mx-5 rounded-xl FundraisingItem">
                    <a href={`/projects/${item.id}`} className='flex flex-col h-365'>
                        <div className="projects-img-box">
                            <div className='fit-size'>
                                <img className='object-cover w-full h-full rounded-3xl' src={item.img} alt='專案照片'/>
                            </div>
                        </div>
                        <div className='flex-1'>
                            <h3 className='my-1 text-xl font-semibold break-all'>{item.title}</h3>
                            <p className='my-1'>提案者 <span className='primary-text-color'>{item.organizer}</span></p>
                        </div>
                        <div>
                            <span className='my-1'>NT$ {item.current_total}</span>
                        </div>
                        <ProgressBar percent={Math.round(item.current_total/item.amount_target*100)}/>
                        <div>
                            <DaysLeft endTime={item.end_time} />
                        </div>
                    </a>  
                </article>
            )) :
            <div className='col-span-9 text-gray-600 bg-white rounded-lg py-28'>
                <p className='text-center'>目前沒有專案，試試看重新探索吧！</p>
            </div>}
        </>
    )
}

export default FundraisingItem