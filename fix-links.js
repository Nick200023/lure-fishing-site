// 修复首页链接的脚本
// 在浏览器控制台运行这个脚本可以临时修复

var links = document.querySelectorAll('a[href="#gear"], a[href="#guide"], a[href="#spots"], a[href="#community"]');
links.forEach(function(link) {
    var href = link.getAttribute('href');
    if (href === '#gear') {
        link.setAttribute('href', 'gear-working.html');
        link.textContent = '进入装备库';
    } else if (href === '#guide') {
        link.setAttribute('href', 'guide.html');
    } else if (href === '#spots') {
        link.setAttribute('href', 'spots.html');
    } else if (href === '#community') {
        link.setAttribute('href', '#');
        link.onclick = function() { alert('社区功能开发中，敬请期待！'); return false; };
    }
});
console.log('链接已修复');
