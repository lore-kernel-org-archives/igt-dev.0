Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CB410EDB4
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Apr 2022 22:30:50 +0000 (UTC)
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 5 Apr 2022 22:30:47 +0000
Message-ID: <CH0PR12MB5284DEF851E2111C78AFA16F8BE49@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20220405201331.86829-1-dingchen.zhang@amd.com>
In-Reply-To: <20220405201331.86829-1-dingchen.zhang@amd.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB5284DEF851E2111C78AFA16F8BE49CH0PR12MB5284namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] lib/igt_amd: add helper to R/W DM visual
 confirm debug option
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

--_000_CH0PR12MB5284DEF851E2111C78AFA16F8BE49CH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--

Regards,
Jay
________________________________
From: Zhang, Dingchen (David) <Dingchen.Zhang@amd.com>
Sent: Tuesday, April 5, 2022 4:13 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Wentland, Harry <Harry.We=
ntland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Pillai, Aurabindo=
 <Aurabindo.Pillai@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
Subject: [PATCH] lib/igt_amd: add helper to R/W DM visual confirm debug opt=
ion

[why & how]
AMDGPU DM exposure a debugfs interface entry of visual confirm
debug option which is configured for debugging like surface
programming. It also supports the PSR feature visual confirm
debugging. We'd add helpers to read/write visual confirm debug
option from/to such interface entry.

The interface entry "amdgpu_dm_visual_confirm" is located in the
debugfs directory. We'd add the enumeration of visual confirm
option which is aligned to the amdgpu kernel driver.

Changes in v2:
--------------------
- close the file descriptor before return in helper of setting
  visual confirm
- drop the '_dm_' from helpers to check visual confirm debugfs
  existence, get/set option from/to the debugfs entry.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 lib/igt_amd.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_amd.h |  20 ++++++++++
 2 files changed, 120 insertions(+)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 664602da..f499ab46 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -25,6 +25,7 @@

 #include "igt_amd.h"
 #include "igt.h"
+#include "igt_sysfs.h"
 #include <amdgpu_drm.h>

 #define X0 1
@@ -250,6 +251,38 @@ bool igt_amd_is_tiled(uint64_t modifier)
                 return false;
 }

+/**
+ * @brief generic helper to check if the amdgpu dm debugfs entry defined
+ *
+ * @param drm_fd DRM file descriptor
+ * @param interface_name The debugfs interface entry name with prefix "amd=
gpu_"
+ * @return true if <debugfs_root>/interface_name exists and defined
+ * @return false otherwise
+ */
+static bool amd_has_debugfs(int drm_fd, const char *interface_name)
+{
+       int fd;
+       int res;
+       struct stat stat;
+
+       fd =3D igt_debugfs_dir(drm_fd);
+       if (fd < 0) {
+               igt_info("Couldn't open debugfs dir!\n");
+               return false;
+       }
+
+       res =3D fstatat(fd, interface_name, &stat, 0);
+       if (res !=3D 0) {
+               igt_info("debugfs %s not supported\n", interface_name);
+               close(fd);
+               return false;
+       }
+
+       close(fd);
+       return true;
+}
+
+
 /**
  * @brief generic helper to check if the debugfs entry of given connector =
has the
  *        debugfs interface defined.
@@ -1075,3 +1108,70 @@ int igt_amd_read_psr_state(int drm_fd, char *connect=
or_name)

         return strtol(buf, NULL, 10);
 }
+
+/**
+ * @brief check if AMDGPU DM visual confirm debugfs interface entry exist =
and defined
+ *
+ * @param drm_fd DRM file descriptor
+ * @return true if visual confirm debugfs interface exists and defined
+ * @return false otherwise
+ */
+bool igt_amd_has_visual_confirm(int drm_fd)
+{
+       return amd_has_debugfs(drm_fd, DEBUGFS_DM_VISUAL_CONFIRM);
+}
+
+/**
+ * @brief Read amdgpu DM visual confirm debugfs interface
+ *
+ * @param drm_fd DRM file descriptor
+ * @return int visual confirm debug option as integer
+ */
+int  igt_amd_get_visual_confirm(int drm_fd)
+{
+       char buf[4];    /* current 4 bytes are enough */
+       int fd, ret;
+
+       fd =3D igt_debugfs_dir(drm_fd);
+       if (fd < 0) {
+               igt_info("Couldn't open debugfs dir!\n");
+               return -1;
+       }
+
+       ret =3D igt_debugfs_simple_read(fd, DEBUGFS_DM_VISUAL_CONFIRM, buf,=
 sizeof(buf));
+       close(fd);
+
+       igt_assert_f(ret >=3D 0, "Reading %s failed.\n",
+                    DEBUGFS_DM_VISUAL_CONFIRM);
+
+       return strtol(buf, NULL, 10);
+}
+
+/**
+ * @brief Write amdgpu DM visual confirm debug option to debugfs interface
+ *
+ * @param drm_fd DRM file descriptor
+ * @param option amdgpu DC visual confirm debug option
+ * @return true if set visual confirm option success
+ * @return false otherwise
+ */
+bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confi=
rm option)
+{
+       char buf[4];
+       int fd;
+       bool res;
+
+       fd =3D igt_debugfs_dir(drm_fd);
+       if (fd < 0) {
+               igt_info("Couldn't open debugfs dir!\n");
+               return false;
+       }
+
+       memset(buf, '\0', sizeof(buf));
+       snprintf(buf, sizeof(buf), "%d\n", option);
+
+       res =3D igt_sysfs_set(fd, DEBUGFS_DM_VISUAL_CONFIRM, buf);
+       close(fd);
+
+       return res;
+}
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index e4e12ce5..428bfe6f 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -49,6 +49,9 @@
 #define DEBUGFS_EDP_PSR_CAP     "psr_capability"
 #define DEBUGFS_EDP_PSR_STATE   "psr_state"

+/* amdgpu DM interface entries */
+#define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
+
 enum amd_dsc_clock_force {
         DSC_AUTOMATIC =3D 0,
         DSC_FORCE_ON,
@@ -115,6 +118,19 @@ enum amdgpu_psr_state {
         PSR_STATE_INVALID =3D 0xFF
 };

+/*
+ * enumeration of amdgpu DC visual confirm debug option
+ * aligned to the upstreamed amdgpu kernel driver 'enum visual_confirm' in=
 dc.h
+ */
+enum amdgpu_debug_visual_confirm {
+       VISUAL_CONFIRM_DISABLE  =3D 0,
+       VISUAL_CONFIRM_SURFACE  =3D 1,
+       VISUAL_CONFIRM_HDR      =3D 2,
+       VISUAL_CONFIRM_MPCTREE  =3D 4,
+       VISUAL_CONFIRM_PSR      =3D 5,
+       VISUAL_CONFIRM_SWIZZLE  =3D 9
+};
+
 uint32_t igt_amd_create_bo(int fd, uint64_t size);
 void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot);
 unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,
@@ -172,4 +188,8 @@ bool igt_amd_psr_support_drv(int drm_fd, char *connecto=
r_name, enum psr_mode mod
 bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name);
 int  igt_amd_read_psr_state(int drm_fd, char *connector_name);

+/* DM interface helpers */
+bool igt_amd_has_visual_confirm(int drm_fd);
+int  igt_amd_get_visual_confirm(int drm_fd);
+bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confi=
rm option);
 #endif /* IGT_AMD_H */
--
2.25.1


--_000_CH0PR12MB5284DEF851E2111C78AFA16F8BE49CH0PR12MB5284namp_
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
<b>Sent:</b> Tuesday, April 5, 2022 4:13 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Wentland, Ha=
rry &lt;Harry.Wentland@amd.com&gt;; Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.c=
om&gt;; Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; Lin, Wayne &lt;=
Wayne.Lin@amd.com&gt;<br>
<b>Subject:</b> [PATCH] lib/igt_amd: add helper to R/W DM visual confirm de=
bug option</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[why &amp; how]<br>
AMDGPU DM exposure a debugfs interface entry of visual confirm<br>
debug option which is configured for debugging like surface<br>
programming. It also supports the PSR feature visual confirm<br>
debugging. We'd add helpers to read/write visual confirm debug<br>
option from/to such interface entry.<br>
<br>
The interface entry &quot;amdgpu_dm_visual_confirm&quot; is located in the<=
br>
debugfs directory. We'd add the enumeration of visual confirm<br>
option which is aligned to the amdgpu kernel driver.<br>
<br>
Changes in v2:<br>
--------------------<br>
- close the file descriptor before return in helper of setting<br>
&nbsp; visual confirm<br>
- drop the '_dm_' from helpers to check visual confirm debugfs<br>
&nbsp; existence, get/set option from/to the debugfs entry.<br>
<br>
Cc: Rodrigo Siqueira &lt;rodrigo.siqueira@amd.com&gt;<br>
Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Cc: Leo Li &lt;sunpeng.li@amd.com&gt;<br>
Cc: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
Cc: Wayne Lin &lt;wayne.lin@amd.com&gt;<br>
<br>
Signed-off-by: David Zhang &lt;dingchen.zhang@amd.com&gt;<br>
---<br>
&nbsp;lib/igt_amd.c | 100 +++++++++++++++++++++++++++++++++++++++++++++++++=
+<br>
&nbsp;lib/igt_amd.h |&nbsp; 20 ++++++++++<br>
&nbsp;2 files changed, 120 insertions(+)<br>
<br>
diff --git a/lib/igt_amd.c b/lib/igt_amd.c<br>
index 664602da..f499ab46 100644<br>
--- a/lib/igt_amd.c<br>
+++ b/lib/igt_amd.c<br>
@@ -25,6 +25,7 @@<br>
&nbsp;<br>
&nbsp;#include &quot;igt_amd.h&quot;<br>
&nbsp;#include &quot;igt.h&quot;<br>
+#include &quot;igt_sysfs.h&quot;<br>
&nbsp;#include &lt;amdgpu_drm.h&gt;<br>
&nbsp;<br>
&nbsp;#define X0 1<br>
@@ -250,6 +251,38 @@ bool igt_amd_is_tiled(uint64_t modifier)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return false;<br>
&nbsp;}<br>
&nbsp;<br>
+/**<br>
+ * @brief generic helper to check if the amdgpu dm debugfs entry defined<b=
r>
+ *<br>
+ * @param drm_fd DRM file descriptor<br>
+ * @param interface_name The debugfs interface entry name with prefix &quo=
t;amdgpu_&quot;<br>
+ * @return true if &lt;debugfs_root&gt;/interface_name exists and defined<=
br>
+ * @return false otherwise<br>
+ */<br>
+static bool amd_has_debugfs(int drm_fd, const char *interface_name)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int res;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct stat stat;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D igt_debugfs_dir(drm_fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_info(&quot;Couldn't open debugfs dir!\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res =3D fstatat(fd, interface_name, &=
amp;stat, 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (res !=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_info(&quot;debugfs %s not supported\n&quot;, interface_name)=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; close(fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
+}<br>
+<br>
+<br>
&nbsp;/**<br>
&nbsp; * @brief generic helper to check if the debugfs entry of given conne=
ctor has the<br>
&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugfs interface define=
d.<br>
@@ -1075,3 +1108,70 @@ int igt_amd_read_psr_state(int drm_fd, char *connect=
or_name)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return strtol(buf, NULL, 1=
0);<br>
&nbsp;}<br>
+<br>
+/**<br>
+ * @brief check if AMDGPU DM visual confirm debugfs interface entry exist =
and defined<br>
+ * <br>
+ * @param drm_fd DRM file descriptor<br>
+ * @return true if visual confirm debugfs interface exists and defined<br>
+ * @return false otherwise<br>
+ */<br>
+bool igt_amd_has_visual_confirm(int drm_fd)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return amd_has_debugfs(drm_fd, DEBUGF=
S_DM_VISUAL_CONFIRM);<br>
+}<br>
+<br>
+/**<br>
+ * @brief Read amdgpu DM visual confirm debugfs interface<br>
+ *<br>
+ * @param drm_fd DRM file descriptor<br>
+ * @return int visual confirm debug option as integer<br>
+ */<br>
+int&nbsp; igt_amd_get_visual_confirm(int drm_fd)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buf[4];&nbsp;&nbsp;&nbsp; /* cur=
rent 4 bytes are enough */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd, ret;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D igt_debugfs_dir(drm_fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_info(&quot;Couldn't open debugfs dir!\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_debugfs_simple_read(fd, D=
EBUGFS_DM_VISUAL_CONFIRM, buf, sizeof(buf));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(ret &gt;=3D 0, &quot;Rea=
ding %s failed.\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEBUGFS_DM_VISUAL_CONFIRM);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return strtol(buf, NULL, 10);<br>
+}<br>
+<br>
+/**<br>
+ * @brief Write amdgpu DM visual confirm debug option to debugfs interface=
<br>
+ *<br>
+ * @param drm_fd DRM file descriptor<br>
+ * @param option amdgpu DC visual confirm debug option<br>
+ * @return true if set visual confirm option success<br>
+ * @return false otherwise<br>
+ */<br>
+bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confi=
rm option)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buf[4];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool res;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D igt_debugfs_dir(drm_fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_info(&quot;Couldn't open debugfs dir!\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(buf, '\0', sizeof(buf));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(buf, sizeof(buf), &quot;%d\n=
&quot;, option);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res =3D igt_sysfs_set(fd, DEBUGFS_DM_=
VISUAL_CONFIRM, buf);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return res;<br>
+}<br>
diff --git a/lib/igt_amd.h b/lib/igt_amd.h<br>
index e4e12ce5..428bfe6f 100644<br>
--- a/lib/igt_amd.h<br>
+++ b/lib/igt_amd.h<br>
@@ -49,6 +49,9 @@<br>
&nbsp;#define DEBUGFS_EDP_PSR_CAP&nbsp;&nbsp;&nbsp;&nbsp; &quot;psr_capabil=
ity&quot;<br>
&nbsp;#define DEBUGFS_EDP_PSR_STATE&nbsp;&nbsp; &quot;psr_state&quot;<br>
&nbsp;<br>
+/* amdgpu DM interface entries */<br>
+#define DEBUGFS_DM_VISUAL_CONFIRM &quot;amdgpu_dm_visual_confirm&quot;<br>
+<br>
&nbsp;enum amd_dsc_clock_force {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DSC_AUTOMATIC =3D 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DSC_FORCE_ON,<br>
@@ -115,6 +118,19 @@ enum amdgpu_psr_state {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PSR_STATE_INVALID =3D 0xFF=
<br>
&nbsp;};<br>
&nbsp;<br>
+/*<br>
+ * enumeration of amdgpu DC visual confirm debug option<br>
+ * aligned to the upstreamed amdgpu kernel driver 'enum visual_confirm' in=
 dc.h<br>
+ */<br>
+enum amdgpu_debug_visual_confirm {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VISUAL_CONFIRM_DISABLE&nbsp; =3D 0,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VISUAL_CONFIRM_SURFACE&nbsp; =3D 1,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VISUAL_CONFIRM_HDR&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; =3D 2,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VISUAL_CONFIRM_MPCTREE&nbsp; =3D 4,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VISUAL_CONFIRM_PSR&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; =3D 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VISUAL_CONFIRM_SWIZZLE&nbsp; =3D 9<br=
>
+};<br>
+<br>
&nbsp;uint32_t igt_amd_create_bo(int fd, uint64_t size);<br>
&nbsp;void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int pro=
t);<br>
&nbsp;unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,<br=
>
@@ -172,4 +188,8 @@ bool igt_amd_psr_support_drv(int drm_fd, char *connecto=
r_name, enum psr_mode mod<br>
&nbsp;bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name);<=
br>
&nbsp;int&nbsp; igt_amd_read_psr_state(int drm_fd, char *connector_name);<b=
r>
&nbsp;<br>
+/* DM interface helpers */<br>
+bool igt_amd_has_visual_confirm(int drm_fd);<br>
+int&nbsp; igt_amd_get_visual_confirm(int drm_fd);<br>
+bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confi=
rm option);<br>
&nbsp;#endif /* IGT_AMD_H */<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB5284DEF851E2111C78AFA16F8BE49CH0PR12MB5284namp_--
