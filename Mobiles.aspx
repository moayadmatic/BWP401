<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mobiles.aspx.cs" Inherits="WebApplication9.Mobiles" %>

<!DOCTYPE html>

<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <title>تلفونك</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    
</head>

<body>
    <header>
    <nav>
        <div class="logo">
            <i class="fas fa-mobile"></i>
            <h4>تلفونك</h4>
            <p>&nbsp;</p>
        </div>
        <ul class="nav-items">
            <li class="nav-item">
        <i class="fas fa-bars"></i>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">الصفحة الرئيسية</a>
            </li>
            <li class="nav-item">
                <a href="#features" class="nav-link">مميزاتنا</a>
            </li>
            <li class="nav-item">
                <a href="#phones" class="nav-link">أحدث الهواتف</a>
            </li>
            <li class="nav-item">
                <a href="#" class="fa-solid fa-cart-shopping"></a>
            </li>
        </ul>
    </nav>
        </header>
<section class="hero">
    <div class="hero-section">
        <div class="content">
            <h4>تسوق بأمان،تسوق بسرعة</h4>
            <h1>اكتشف أحدث الهواتف وبأفضل الأسعار ولتقدر توفر على حالك وتكسب راحة بالك</h1>
            <p>هاتفك هو أكبر متجر لشراء كل ما هو متعلق بالهواتف،
                <span>جودة وسرعة وأمان</span>
                 أثناء تسوقك</p>
                 <button class="btn"><a href="#features">إعرف أكثر</a></button>
        </div>
        <div class="hero-image">
            <img src="./images/smartphone.png" alt="">
        </div>
    </div>
</section>
<section class="features" id="features">
    <div class="features-section">
        <h4>لماذا نحن أفضل خيار</h4>
        <div class="qualities">
            <div class="quality">
                <i class="fas fa-shipping-fast"></i>
                <h3>سرعة بالتوصيل</h3>
                <p>طلبك رح يوصل خلال 2-5 أيام</p>
            </div>
            <div class="quality">
                <i class="fas fa-user-shield"></i>
                <h3>حماية وأمان</h3>
                <p>حماية أثناء الدفع الالكتروني</p>
            </div>
            <div class="quality">
                <i class="fas fa-sort-amount-up-alt"></i>
                <h3>تشكيلة واسعة</h3>
                <p>أحدث الهواتف متوفرة لدينا</p>
            </div>
            <div class="quality">
                <i class="fas fa-phone-square"></i>
                <h3>دعم فني</h3>
                <p>دعم فني على مدار الساعة لحل مشاكلك</p>
            </div>
        </div>
    </div>
</section>
    <form id="form1" runat="server">
        <div>
            <ul id="GridView1">
                <asp:Repeater runat="server" ID="Repeater1" DataSourceID="SqlDataSource3">
                    <ItemTemplate>
                        <li>
                            <a href='<%# "ProductDetails.aspx?ProductID=" + Eval("ProductID") %>'>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' AlternateText="Product Image" />
                                <h3><%# Eval("Names") %></h3>
                            </a>
                            <span><%# Eval("Brand") %></span>
                            <span><%# Eval("Price", "SP {0:N0}") %></span>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:myConnectionString %>' SelectCommand="SELECT [Brand], [Price], [Names], [ImageUrl], [ProductID] FROM [Mobiles]"></asp:SqlDataSource>
            </ul>
        </div>
    </form>
<footer>
    <div class="footer-section">
        <p>جميع الحقوق محفوظة لشركة تلفونك 2023</p>
        <p>moayad_191060        batol_192550        Yazan_154417        </p>
        <div class="socials">
            <i class="fab fa-twitter"></i>
            <i class="fab fa-facebook"></i>
            <i class="fab fa-instagram"></i>
            
        </div>
    </div>
</footer>
</body>
</html>

