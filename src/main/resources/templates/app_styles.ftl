<style>
    #landing {
        height: 100vh;
        padding-top: 64px;
        background: center center no-repeat url("/img/landing_bg.jpeg");
        background-size: cover;
    }

    #logo-container {
        position: relative;
        top: 50%;
        transform: translateY(-50%);
    }

    #logo-container > img {
        width: 75%;
        display: block;
        margin: 0 auto;
        opacity: 0.8;
    }

    .thumbnail-container:hover .overlay {
        opacity: 0.5;
    }

    .overlay {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        height: 100%;
        width: 100%;
        opacity: 0;
        transition: .5s ease;
        background-color: #ffffff;
    }

    .carousel-indicators li, .carousel-indicators .active {
        opacity: 0.5;
        height: 1px;
        width: 20px;
        margin-right: 5px;
        margin-top: 0px;
        margin-bottom: 0px;
    }

    .carousel-indicators .active {
        opacity: 1;
    }

    .thumbnail-container .carousel-indicators li {
        opacity: 1;
        width: 12px;
    }

    .thumbnail-container .carousel-indicators {
        bottom: 0px;
    }

    .description-footer {
        text-align: center;
    }
</style>