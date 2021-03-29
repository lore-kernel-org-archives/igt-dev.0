Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680043.outbound.protection.outlook.com [40.107.68.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE0E6E420
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Mar 2021 14:05:10 +0000 (UTC)
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Date: Mon, 29 Mar 2021 14:05:07 +0000
Message-ID: <CH0PR12MB528433F12819F7AEB3BEB89C8B7E9@CH0PR12MB5284.namprd12.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: Add test description for amd_abm
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1977265789=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, Aurabindo Pillai <mail@aurabindo.in>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1977265789==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH0PR12MB528433F12819F7AEB3BEB89C8B7E9CH0PR12MB5284namp_"

--_000_CH0PR12MB528433F12819F7AEB3BEB89C8B7E9CH0PR12MB5284namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Hi Siqueira,

Sorry about the change id, posted a v2

--

Thanks & Regards,
Aurabindo Pillai

________________________________
From: Siqueira, Rodrigo
Sent: Monday, March 29, 2021 9:44 AM
To: Aurabindo Pillai
Cc: igt-dev@lists.freedesktop.org; Pillai, Aurabindo
Subject: Re: [PATCH] tests/amdgpu: Add test description for amd_abm

Hi Aurabindo,

On 03/29, Aurabindo Pillai wrote:
> From: Aurabindo Pillai <aurabindo.pillai@amd.com>
>
> Add overall test description for amd_abm
>
> Change-Id: I4baa52ea66189688b12a82befbbd842ba3d3a24d

We don't need this Change-id in IGT.

Aside from the above comment, everything LGTM.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Let me know if you need help for applying this change in IGT.

Thanks
Siqueira

> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>  tests/amdgpu/amd_abm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 0505f17e..a1e48533 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -32,6 +32,8 @@
>  #include <fcntl.h>
>  #include <time.h>
>
> +IGT_TEST_DESCRIPTION("Tests Adaptive Backlight Modulation on supported h=
ardware");
> +
>  #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
>
>  typedef struct data {
> --
> 2.31.0
>

--
Rodrigo Siqueira
https://siqueira.tech

--_000_CH0PR12MB528433F12819F7AEB3BEB89C8B7E9CH0PR12MB5284namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi Siqueira,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
Sorry about the change id, posted a v2<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks &amp; Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Aurabindo Pillai<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>From:</b> Siqueira, Rodrigo<br>
<b>Sent:</b> Monday, March 29, 2021 9:44 AM<br>
<b>To:</b> Aurabindo Pillai<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org; Pillai, Aurabindo<br>
<b>Subject:</b> Re: [PATCH] tests/amdgpu: Add test description for amd_abm
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Aurabindo,<br>
<br>
On 03/29, Aurabindo Pillai wrote:<br>
&gt; From: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
&gt; <br>
&gt; Add overall test description for amd_abm<br>
&gt; <br>
&gt; Change-Id: I4baa52ea66189688b12a82befbbd842ba3d3a24d<br>
<br>
We don't need this Change-id in IGT.<br>
<br>
Aside from the above comment, everything LGTM.<br>
<br>
Reviewed-by: Rodrigo Siqueira &lt;Rodrigo.Siqueira@amd.com&gt;<br>
<br>
Let me know if you need help for applying this change in IGT.<br>
<br>
Thanks<br>
Siqueira<br>
<br>
&gt; Signed-off-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/amdgpu/amd_abm.c | 2 ++<br>
&gt;&nbsp; 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c<br>
&gt; index 0505f17e..a1e48533 100644<br>
&gt; --- a/tests/amdgpu/amd_abm.c<br>
&gt; +++ b/tests/amdgpu/amd_abm.c<br>
&gt; @@ -32,6 +32,8 @@<br>
&gt;&nbsp; #include &lt;fcntl.h&gt;<br>
&gt;&nbsp; #include &lt;time.h&gt;<br>
&gt;&nbsp; <br>
&gt; +IGT_TEST_DESCRIPTION(&quot;Tests Adaptive Backlight Modulation on sup=
ported hardware&quot;);<br>
&gt; +<br>
&gt;&nbsp; #define BACKLIGHT_PATH &quot;/sys/class/backlight/amdgpu_bl0&quo=
t;<br>
&gt;&nbsp; <br>
&gt;&nbsp; typedef struct data {<br>
&gt; -- <br>
&gt; 2.31.0<br>
&gt; <br>
<br>
-- <br>
Rodrigo Siqueira<br>
<a href=3D"https://siqueira.tech" target=3D"_blank" rel=3D"noopener norefer=
rer" data-auth=3D"NotApplicable">https://siqueira.tech</a><br>
</div>
</span></font></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CH0PR12MB528433F12819F7AEB3BEB89C8B7E9CH0PR12MB5284namp_--

--===============1977265789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1977265789==--
