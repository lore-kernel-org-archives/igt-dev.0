Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2087.outbound.protection.outlook.com [40.107.102.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED62610E046
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 20:38:23 +0000 (UTC)
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 6 Apr 2022 20:38:21 +0000
Message-ID: <CH0PR12MB52849899FCA588530FF50BFF8BE79@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20220406202829.456384-1-dingchen.zhang@amd.com>
 <20220406202829.456384-3-dingchen.zhang@amd.com>
In-Reply-To: <20220406202829.456384-3-dingchen.zhang@amd.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB52849899FCA588530FF50BFF8BE79CH0PR12MB5284namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] tests/amdgpu/amd_psr: drop the PSR state
 check for PSR-SU MPO test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_CH0PR12MB52849899FCA588530FF50BFF8BE79CH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--

Regards,
Jay
________________________________
From: Zhang, Dingchen (David) <Dingchen.Zhang@amd.com>
Sent: Wednesday, April 6, 2022 4:28 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Wentland, Harry <Harry.We=
ntland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Pillai, Aurabindo=
 <Aurabindo.Pillai@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
Subject: [PATCH 2/2] tests/amdgpu/amd_psr: drop the PSR state check for PSR=
-SU MPO test

[why & how]
Currently the enablement of PSR-SU for Linux kernel is still WIP
and the PSR state to check for PSR-SU MPO is not upstreamed yet.
In addition, all the PSR-SU test case currently by default is
validated with visual confirm.

Drop the PSR state check in MPO PSR-SU sub-test case in the loop.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 tests/amdgpu/amd_psr.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 83e44c4e..8ea73080 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -292,18 +292,6 @@ static void run_check_psr_su_mpo(data_t *data)
                                       flip_fb->fb_id, DRM_MODE_PAGE_FLIP_E=
VENT, NULL);
                 igt_require(ret =3D=3D 0);
                 kmstest_wait_for_pageflip(data->fd);
-
-               /* check PSR state */
-               if (i > PSR_SETTLE_DELAY * frame_rate) {
-                       psr_state =3D igt_amd_read_psr_state(data->fd, data=
->output->name);
-                       igt_fail_on_f(psr_state < 0, "Open PSR state debugf=
s failed\n");
-                       igt_fail_on_f(psr_state =3D=3D PSR_STATE0,
-                               "PSR was not enabled for connector %s\n", d=
ata->output->name);
-                       igt_fail_on_f(psr_state =3D=3D PSR_STATE_INVALID,
-                               "PSR is invalid for connector %s\n", data->=
output->name);
-                       igt_fail_on_f(psr_state !=3D PSR_STATE3,
-                               "PSR state is expected to be STATE_3 for co=
nnector %s\n", data->output->name);
-               }
         }

         /* fini */
--
2.25.1


--_000_CH0PR12MB52849899FCA588530FF50BFF8BE79CH0PR12MB5284namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Reviewed-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Zhang, Dingchen (Davi=
d) &lt;Dingchen.Zhang@amd.com&gt;<br>
<b>Sent:</b> Wednesday, April 6, 2022 4:28 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Wentland, Ha=
rry &lt;Harry.Wentland@amd.com&gt;; Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.c=
om&gt;; Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; Lin, Wayne &lt;=
Wayne.Lin@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] tests/amdgpu/amd_psr: drop the PSR state check =
for PSR-SU MPO test</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[why &amp; how]<br>
Currently the enablement of PSR-SU for Linux kernel is still WIP<br>
and the PSR state to check for PSR-SU MPO is not upstreamed yet.<br>
In addition, all the PSR-SU test case currently by default is<br>
validated with visual confirm.<br>
<br>
Drop the PSR state check in MPO PSR-SU sub-test case in the loop.<br>
<br>
Cc: Rodrigo Siqueira &lt;rodrigo.siqueira@amd.com&gt;<br>
Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Cc: Leo Li &lt;sunpeng.li@amd.com&gt;<br>
Cc: Jay Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
Cc: Wayne Lin &lt;wayne.lin@amd.com&gt;<br>
<br>
Signed-off-by: David Zhang &lt;dingchen.zhang@amd.com&gt;<br>
---<br>
&nbsp;tests/amdgpu/amd_psr.c | 12 ------------<br>
&nbsp;1 file changed, 12 deletions(-)<br>
<br>
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c<br>
index 83e44c4e..8ea73080 100644<br>
--- a/tests/amdgpu/amd_psr.c<br>
+++ b/tests/amdgpu/amd_psr.c<br>
@@ -292,18 +292,6 @@ static void run_check_psr_su_mpo(data_t *data)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; flip_fb-&gt;fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_require(ret =3D=3D 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kmstest_wait_for_pageflip(data-&gt;fd);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* check PSR state */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (i &gt; PSR_SETTLE_DELAY * frame_rate) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; psr_state =3D ig=
t_amd_read_psr_state(data-&gt;fd, data-&gt;output-&gt;name);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fail_on_f(ps=
r_state &lt; 0, &quot;Open PSR state debugfs failed\n&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fail_on_f(ps=
r_state =3D=3D PSR_STATE0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR was not enabled for connector %s\=
n&quot;, data-&gt;output-&gt;name);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fail_on_f(ps=
r_state =3D=3D PSR_STATE_INVALID,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR is invalid for connector %s\n&quo=
t;, data-&gt;output-&gt;name);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fail_on_f(ps=
r_state !=3D PSR_STATE3,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR state is expected to be STATE_3 f=
or connector %s\n&quot;, data-&gt;output-&gt;name);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* fini */<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB52849899FCA588530FF50BFF8BE79CH0PR12MB5284namp_--
