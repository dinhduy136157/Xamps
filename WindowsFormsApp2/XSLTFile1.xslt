<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- Template chính áp dụng cho toàn bộ tài liệu -->
    <xsl:template match="/">
        <html>
            <head>
                <title></title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                    }
                    table {
                        width: 50%;
                        border-collapse: collapse;
                        margin: 20px 0;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 8px;
                        text-align: center;
                    }
                    th {
                        background-color: #4CAF50;
                        color: white;
                    }
                    tr:nth-child(even) {
                        background-color: #f2f2f2;
                    }
                    tr:hover {
                        background-color: #ddd;
                    }
                    h2, h3 {
                        color: #4CAF50;
                    }
                </style>
            </head>
            <body>
                <h2>Thời Tiết Trong Ngày</h2>
                <!-- Duyệt qua các thời gian khác nhau -->
                <xsl:apply-templates select="thoitiettrongtuan/thoigian"/>
            </body>
        </html>
    </xsl:template>

    <!-- Template hiển thị thông tin cho mỗi thời gian -->
    <xsl:template match="thoigian">
        <h3>Thời gian: <xsl:value-of select="gio"/></h3>
        <table>
            <tr>
                <th>STT</th>
                <th>Mã Khu Vực</th>
                <th>Kiểu Thời Tiết</th>
                <th>Nhiệt Độ</th>
                <th>Độ Ẩm</th>
            </tr>
            <!-- Vòng lặp for-each để duyệt qua các khu vực -->
            <xsl:for-each select="khuvuc">
                <tr>
                    <td><xsl:value-of select="position()"/></td>
                    <td><xsl:value-of select="khuvuc_ma"/></td>
                    <td><xsl:value-of select="kieuthoitiet"/></td>
                    <td><xsl:value-of select="nhietdo"/></td>
                    <td><xsl:value-of select="doam"/></td>
                </tr>
            </xsl:for-each>
        </table>
        <br/>
    </xsl:template>

</xsl:stylesheet>
