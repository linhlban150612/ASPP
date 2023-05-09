<div id="loader">
    <div class="pageloader">OBDG</div>
</div>
<style>
@import url(/fonts.css);
    @keyframes rotate {
	100% {
		transform: rotate(1turn);
	}
}
#loader{
    position: absolute;
    width:100vw;
    height:100vh;
    top:0;
    left:0;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
}
.pageloader{
	position: relative;
	z-index: 0;
	width: 400px;
	height: 300px;
	border-radius: 10px;
	overflow: hidden;
	padding: 2rem;
	display: flex;
	justify-content: center;
	align-items: center;
    font-family:Josefin;
    font-size: 5rem;
}
	
.pageloader::before {
    box-sizing: border-box;
    content: '';
    position: absolute;
    z-index: -2;
    left: -50%;
    top: -50%;
    width: 200%;
    height: 200%;
    background-color: #fff;
    background-repeat: no-repeat;
    background-size: 50% 50%;
    background-position: 0 0;
    background-image: conic-gradient(#252526, #252526);
    animation: rotate 4s linear infinite;
}
.pageloader::after {
    box-sizing: border-box;
    content: '';
    position: absolute;
    z-index: -1;
    left: 20px;
    top: 20px;
    width: calc(100% - 40px);
    height: calc(100% - 40px);
    background: white;
    border-radius: 5px;
}
</style>
<script>
    const loader = document.getElementById("loader");
		// Show the loader when the page starts loading
    window.addEventListener("load", () => {
        loader.style.display = "none";
    });
</script>