import React , { useState, useEffect } from 'react';

const Progress = ({percent = 0}) => {
	const [style, setStyle] = useState({});
	
	useEffect(() => {
		const newStyle = {
			opacity: 1,
			width: `${percent >= 100 ? 100 : percent}%`
		}	
		setStyle(newStyle);
	},[]);
	
	return (
		<div className="progress">
			<span className='progress-percent'>{percent}%</span>
			<div className="progress-done" style={style}>
			</div>
		</div>
	)
}

export default Progress;