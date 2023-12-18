Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DC010E27F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:28:37 +0000 (UTC)
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Hung, Alex" <Alex.Hung@amd.com>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] [i-g-t] tests/amdgpu/amd_link_settings: Fix run eDP link
 training with unsupported link rate
Date: Mon, 18 Dec 2023 14:48:04 +0000
Message-ID: <CH0PR12MB5284ED5A8C397679D17E911C8B90A@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20231218135928.35390-1-hersenxs.wu@amd.com>
In-Reply-To: <20231218135928.35390-1-hersenxs.wu@amd.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB5284ED5A8C397679D17E911C8B90ACH0PR12MB5284namp_"
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_CH0PR12MB5284ED5A8C397679D17E911C8B90ACH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--

Regards,
Jay
________________________________
From: Hersen Wu <hersenxs.wu@amd.com>
Sent: Monday, December 18, 2023 8:59 AM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Siqueira=
, Rodrigo <Rodrigo.Siqueira@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@a=
md.com>; Hung, Alex <Alex.Hung@amd.com>; Mahfooz, Hamza <Hamza.Mahfooz@amd.=
com>; Lin, Wayne <Wayne.Lin@amd.com>
Cc: markyacoub@google.com <markyacoub@google.com>; Wu, Hersen <hersenxs.wu@=
amd.com>; Wu, Hersen <hersenxs.wu@amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_link_settings: Fix run eDP link t=
raining with unsupported link rate

From: Hersen Wu <Hersenxs.Wu@amd.com>

Add check eDP intermedidate link rate caps from DPCD
offset 0x10 - 0x1f. Only run DP link training for link
rate supported by eDP.

Beside max link rate, eDP1.4b introduces intermediate link
rate. eDP reports ilr caps with DPCD register 0x10 - 0x1f.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 lib/igt_amd.h                    |  1 +
 tests/amdgpu/amd_ilr.c           |  2 --
 tests/amdgpu/amd_link_settings.c | 32 ++++++++++++++++++++++++++++----
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 1e66348ad..254b5d37b 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -46,6 +46,7 @@
 /* eDP related */
 #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
 #define MAX_SUPPORTED_ILR 8
+#define MULTIPLIER_TO_LR 270000
 #define DEBUGFS_EDP_PSR_CAP     "psr_capability"
 #define DEBUGFS_EDP_PSR_STATE   "psr_state"
 #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index 50ca93a14..b2c0f294d 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -29,8 +29,6 @@
 #include <sys/types.h>
 #include <sys/stat.h>

-#define MULTIPLIER_TO_LR 270000
-
 IGT_TEST_DESCRIPTION("This igt test validates ILR (Intermediate Link Rate)=
 "
         "feature from two perspective: "
         "1. Test if we can sucessfully train link rate at all supported IL=
Rs"
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_setti=
ngs.c
index 6a7e8cc53..226c94d73 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -34,6 +34,7 @@ typedef struct
         enum pipe pipe_id;
         int connector_type;
         int w, h;
+       int supported_ilr[MAX_SUPPORTED_ILR];
 } data_t;

 const enum dc_lane_count lane_count_values[] =3D
@@ -51,12 +52,17 @@ const enum dc_link_rate dp_link_rate_values[] =3D
         LINK_RATE_HIGH3
 };

+/* eDP 1.4b */
 const enum dc_link_rate edp_link_rate_values[] =3D
 {
-       LINK_RATE_LOW,
-       LINK_RATE_HIGH,
-       LINK_RATE_RBR2,
-       LINK_RATE_HIGH2
+       LINK_RATE_LOW,          /* 0x6 Rate_1 (RBR)     - 1.62 Gbps/Lane */
+       LINK_RATE_RATE_2,       /* 0x8 Rate_2           - 2.16 Gbps/Lane */
+       LINK_RATE_RATE_3,       /* 0x9 Rate_3           - 2.43 Gbps/Lane */
+       LINK_RATE_HIGH,         /* 0xA Rate_4 (HBR)     - 2.70 Gbps/Lane */
+       LINK_RATE_RBR2,         /* 0xC Rate_5 (RBR2)    - 3.24 Gbps/Lane */
+       LINK_RATE_RATE_6,       /* 0x10 Rate_6          - 4.32 Gbps/Lane */
+       LINK_RATE_HIGH2,        /* 0x14 Rate_7 (HBR2)   - 5.40 Gbps/Lane */
+       LINK_RATE_HIGH3         /* 0x1E Rate_8 (HBR3)   - 8.10 Gbps/Lane */
 };

 static void test_fini(data_t *data)
@@ -116,6 +122,8 @@ static void run_link_training_config(data_t *data, igt_=
output_t *output)
         } else if (data->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
                 link_rate_values =3D edp_link_rate_values;
                 num_link_rates =3D ARRAY_SIZE(edp_link_rate_values);
+               igt_amd_read_ilr_setting(data->drm_fd, connector_name,
+                       data->supported_ilr);
         } else {
                 igt_info("Not a DP or eDP connector\n");
                 return;
@@ -137,6 +145,22 @@ static void run_link_training_config(data_t *data, igt=
_output_t *output)
                         if (link_rate_values[j] > max_lr)
                                 continue;

+                       /* Check if ilr link rate is supported */
+                       if (data->connector_type =3D=3D DRM_MODE_CONNECTOR_=
eDP) {
+                               bool valid_link_rate =3D false;
+
+                               for (int k =3D 0; k < MAX_SUPPORTED_ILR; k+=
+) {
+                                       if (data->supported_ilr[k] =3D=3D
+                                               link_rate_values[j] * MULTI=
PLIER_TO_LR) {
+                                               valid_link_rate =3D true;
+                                               break;
+                                       } else if (data->supported_ilr[k] =
=3D=3D 0)
+                                               break;
+                               }
+                               if (!valid_link_rate)
+                                       continue;
+                       }
+
                         /* Write link settings */
                         igt_info("Applying lane count: %d, link rate 0x%02=
x, on default training\n",
                                   lane_count_values[i], link_rate_values[j=
]);
--
2.25.1


--_000_CH0PR12MB5284ED5A8C397679D17E911C8B90ACH0PR12MB5284namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Reviewed-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
</div>
<div class=3D"elementToProof">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hersen Wu &lt;hersenx=
s.wu@amd.com&gt;<br>
<b>Sent:</b> Monday, December 18, 2023 8:59 AM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Pillai, Aurabindo =
&lt;Aurabindo.Pillai@amd.com&gt;; Hung, Alex &lt;Alex.Hung@amd.com&gt;; Mah=
fooz, Hamza &lt;Hamza.Mahfooz@amd.com&gt;; Lin, Wayne &lt;Wayne.Lin@amd.com=
&gt;<br>
<b>Cc:</b> markyacoub@google.com &lt;markyacoub@google.com&gt;; Wu, Hersen =
&lt;hersenxs.wu@amd.com&gt;; Wu, Hersen &lt;hersenxs.wu@amd.com&gt;<br>
<b>Subject:</b> [PATCH] [i-g-t] tests/amdgpu/amd_link_settings: Fix run eDP=
 link training with unsupported link rate</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Hersen Wu &lt;Hersenxs.Wu@amd.com&gt;<br>
<br>
Add check eDP intermedidate link rate caps from DPCD<br>
offset 0x10 - 0x1f. Only run DP link training for link<br>
rate supported by eDP.<br>
<br>
Beside max link rate, eDP1.4b introduces intermediate link<br>
rate. eDP reports ilr caps with DPCD register 0x10 - 0x1f.<br>
<br>
Signed-off-by: Hersen Wu &lt;hersenxs.wu@amd.com&gt;<br>
---<br>
&nbsp;lib/igt_amd.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;tests/amdgpu/amd_ilr.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp; 2 --<br>
&nbsp;tests/amdgpu/amd_link_settings.c | 32 ++++++++++++++++++++++++++++---=
-<br>
&nbsp;3 files changed, 29 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/lib/igt_amd.h b/lib/igt_amd.h<br>
index 1e66348ad..254b5d37b 100644<br>
--- a/lib/igt_amd.h<br>
+++ b/lib/igt_amd.h<br>
@@ -46,6 +46,7 @@<br>
&nbsp;/* eDP related */<br>
&nbsp;#define DEBUGFS_EDP_ILR_SETTING &quot;ilr_setting&quot;<br>
&nbsp;#define MAX_SUPPORTED_ILR 8<br>
+#define MULTIPLIER_TO_LR 270000<br>
&nbsp;#define DEBUGFS_EDP_PSR_CAP&nbsp;&nbsp;&nbsp;&nbsp; &quot;psr_capabil=
ity&quot;<br>
&nbsp;#define DEBUGFS_EDP_PSR_STATE&nbsp;&nbsp; &quot;psr_state&quot;<br>
&nbsp;#define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT &quot;allow_edp_hotplug_dete=
ction&quot;<br>
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c<br>
index 50ca93a14..b2c0f294d 100644<br>
--- a/tests/amdgpu/amd_ilr.c<br>
+++ b/tests/amdgpu/amd_ilr.c<br>
@@ -29,8 +29,6 @@<br>
&nbsp;#include &lt;sys/types.h&gt;<br>
&nbsp;#include &lt;sys/stat.h&gt;<br>
&nbsp;<br>
-#define MULTIPLIER_TO_LR 270000<br>
-<br>
&nbsp;IGT_TEST_DESCRIPTION(&quot;This igt test validates ILR (Intermediate =
Link Rate) &quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;feature from two per=
spective: &quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;1. Test if we can su=
cessfully train link rate at all supported ILRs&quot;<br>
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_setti=
ngs.c<br>
index 6a7e8cc53..226c94d73 100644<br>
--- a/tests/amdgpu/amd_link_settings.c<br>
+++ b/tests/amdgpu/amd_link_settings.c<br>
@@ -34,6 +34,7 @@ typedef struct<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe_id;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int connector_type;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int w, h;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int supported_ilr[MAX_SUPPORTED_ILR];=
<br>
&nbsp;} data_t;<br>
&nbsp;<br>
&nbsp;const enum dc_lane_count lane_count_values[] =3D<br>
@@ -51,12 +52,17 @@ const enum dc_link_rate dp_link_rate_values[] =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_HIGH3<br>
&nbsp;};<br>
&nbsp;<br>
+/* eDP 1.4b */<br>
&nbsp;const enum dc_link_rate edp_link_rate_values[] =3D<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_LOW,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_HIGH,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_RBR2,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_HIGH2<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_LOW,&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 0x6 Rate_1 (RBR)&nbsp;&nbsp;&nbsp;&nbsp;=
 - 1.62 Gbps/Lane */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_RATE_2,&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* 0x8 Rate_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; - 2.16 Gbps/Lane */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_RATE_3,&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* 0x9 Rate_3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; - 2.43 Gbps/Lane */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_HIGH,&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /* 0xA Rate_4 (HBR)&nbsp;&nbsp;&nbsp;&nbsp; - 2.=
70 Gbps/Lane */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_RBR2,&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /* 0xC Rate_5 (RBR2)&nbsp;&nbsp;&nbsp; - 3.24 Gb=
ps/Lane */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_RATE_6,&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* 0x10 Rate_6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; - 4.32 Gbps/Lane */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_HIGH2,&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* 0x14 Rate_7 (HBR2)&nbsp;&nbsp; - 5.40 Gbps/Lane */=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINK_RATE_HIGH3&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /* 0x1E Rate_8 (HBR3)&nbsp;&nbsp; - 8.10 Gbps/La=
ne */<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;static void test_fini(data_t *data)<br>
@@ -116,6 +122,8 @@ static void run_link_training_config(data_t *data, igt_=
output_t *output)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (data-&gt;connec=
tor_type =3D=3D DRM_MODE_CONNECTOR_eDP) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; link_rate_values =3D edp_link_rate_values;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; num_link_rates =3D ARRAY_SIZE(edp_link_rate_values);<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_amd_read_ilr_setting(data-&gt;drm_fd, connector_name,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;support=
ed_ilr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_info(&quot;Not a DP or eDP connector\n&quot;);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return;<br>
@@ -137,6 +145,22 @@ static void run_link_training_config(data_t *data, igt=
_output_t *output)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (l=
ink_rate_values[j] &gt; max_lr)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Check if ilr =
link rate is supported */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (data-&gt;con=
nector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool valid_link_rate =3D false;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int k =3D 0; k &lt; MAX_SUPPORTED_ILR;=
 k++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; if (data-&gt;supported_ilr[k] =3D=3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; link_rate_values[j] * =
MULTIPLIER_TO_LR) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_link_rate =3D tr=
ue;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; } else if (data-&gt;supported_ilr[k] =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!valid_link_rate)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; continue;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Wr=
ite link settings */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_i=
nfo(&quot;Applying lane count: %d, link rate 0x%02x, on default training\n&=
quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lane_count_values[i]=
, link_rate_values[j]);<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB5284ED5A8C397679D17E911C8B90ACH0PR12MB5284namp_--
