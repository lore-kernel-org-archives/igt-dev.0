Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB5114A998
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 20:38:09 +0000 (UTC)
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 7 Jul 2022 20:38:07 +0000
Message-ID: <BL1PR12MB5144C46B3DD89991690CDB71F7839@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220707182207.3736-1-vitaly.prosyak@amd.com>
 <20220707182207.3736-6-vitaly.prosyak@amd.com>
In-Reply-To: <20220707182207.3736-6-vitaly.prosyak@amd.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB5144C46B3DD89991690CDB71F7839BL1PR12MB5144namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 6/7] lib/amdgpu: add shaders in binary form
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Olsak, Marek" <Marek.Olsak@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_BL1PR12MB5144C46B3DD89991690CDB71F7839BL1PR12MB5144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Maybe you want to name the file for the gfx family where the shaders are re=
levant?  E.g., gfx8_shaders.c, gfc9_shaders.c. etc.?

Alex

________________________________
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Thursday, July 7, 2022 2:22 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Olsak, Marek <Marek.Olsak@amd.com>; Koenig, Christian <Christian.Koenig=
@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Prosyak, Vitaly =
<Vitaly.Prosyak@amd.com>
Subject: [PATCH 6/7] lib/amdgpu: add shaders in binary form

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_shaders.c | 51 ++++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_shaders.h | 32 +++++++++++++++++++++++++
 lib/meson.build          |  1 +
 3 files changed, 84 insertions(+)
 create mode 100644 lib/amdgpu/amd_shaders.c
 create mode 100644 lib/amdgpu/amd_shaders.h

diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c
new file mode 100644
index 00000000..31722744
--- /dev/null
+++ b/lib/amdgpu/amd_shaders.c
@@ -0,0 +1,51 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *  *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software=
"),
+ * to deal in the Software without restriction, including without limitati=
on
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHAL=
L
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES O=
R
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+
+#include "amd_shaders.h"
+
+
+#define CODE_OFFSET 512
+#define DATA_OFFSET 1024
+
+#define SWAP_32(num) (((num & 0xff000000) >> 24) | \
+                     ((num & 0x0000ff00) << 8) | \
+                     ((num & 0x00ff0000) >> 8) | \
+                     ((num & 0x000000ff) << 24))
+
+
+static  uint32_t shader_bin[] =3D {
+       SWAP_32(0x800082be), SWAP_32(0x02ff08bf), SWAP_32(0x7f969800), SWAP=
_32(0x040085bf),
+       SWAP_32(0x02810281), SWAP_32(0x02ff08bf), SWAP_32(0x7f969800), SWAP=
_32(0xfcff84bf),
+       SWAP_32(0xff0083be), SWAP_32(0x00f00000), SWAP_32(0xc10082be), SWAP=
_32(0xaa02007e),
+       SWAP_32(0x000070e0), SWAP_32(0x00000080), SWAP_32(0x000081bf)
+};
+
+const uint32_t * get_shader_bin(uint32_t *size_bytes, uint32_t *code_offse=
t, uint32_t *data_offset)
+{
+       *size_bytes =3D sizeof(shader_bin);
+       *code_offset =3D  CODE_OFFSET;
+       *data_offset =3D DATA_OFFSET;
+       return shader_bin;
+}
diff --git a/lib/amdgpu/amd_shaders.h b/lib/amdgpu/amd_shaders.h
new file mode 100644
index 00000000..1abb23ac
--- /dev/null
+++ b/lib/amdgpu/amd_shaders.h
@@ -0,0 +1,32 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software=
"),
+ * to deal in the Software without restriction, including without limitati=
on
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHAL=
L
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES O=
R
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+#ifndef AMD_SHADERS_H
+#define AMD_SHADERS_H
+
+#include "drmtest.h"
+
+const uint32_t * get_shader_bin(uint32_t *size_bytes, uint32_t *code_offse=
t, uint32_t *data_offset);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 12b2cc5d..98c2803b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -132,6 +132,7 @@ if libdrm_amdgpu.found()
                 'amdgpu/amd_compute.c',
                 'amdgpu/amd_gfx.c',
                 'amdgpu/amd_ip_blocks.c',
+               'amdgpu/amd_shaders.c',
         ]
 endif

--
2.25.1


--_000_BL1PR12MB5144C46B3DD89991690CDB71F7839BL1PR12MB5144namp_
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
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Maybe you want to name the file for the gfx family where the shaders are re=
levant?&nbsp; E.g., gfx8_shaders.c, gfc9_shaders.c. etc.?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> vitaly.prosyak@amd.co=
m &lt;vitaly.prosyak@amd.com&gt;<br>
<b>Sent:</b> Thursday, July 7, 2022 2:22 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Olsak, Marek &lt;Marek.Olsak@amd.com&gt;; Koenig, Christian &lt;=
Christian.Koenig@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.=
com&gt;; Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;<br>
<b>Subject:</b> [PATCH 6/7] lib/amdgpu: add shaders in binary form</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt=
;<br>
<br>
Signed-off-by: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
---<br>
&nbsp;lib/amdgpu/amd_shaders.c | 51 +++++++++++++++++++++++++++++++++++++++=
+<br>
&nbsp;lib/amdgpu/amd_shaders.h | 32 +++++++++++++++++++++++++<br>
&nbsp;lib/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp; 1 +<br>
&nbsp;3 files changed, 84 insertions(+)<br>
&nbsp;create mode 100644 lib/amdgpu/amd_shaders.c<br>
&nbsp;create mode 100644 lib/amdgpu/amd_shaders.h<br>
<br>
diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c<br>
new file mode 100644<br>
index 00000000..31722744<br>
--- /dev/null<br>
+++ b/lib/amdgpu/amd_shaders.c<br>
@@ -0,0 +1,51 @@<br>
+/*<br>
+ * Copyright 2014 Advanced Micro Devices, Inc.<br>
+ * Copyright 2022 Advanced Micro Devices, Inc.<br>
+ *&nbsp; *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
<br>
+ * copy of this software and associated documentation files (the &quot;Sof=
tware&quot;),<br>
+ * to deal in the Software without restriction, including without limitati=
on<br>
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,<br>
+ * and/or sell copies of the Software, and to permit persons to whom the<b=
r>
+ * Software is furnished to do so, subject to the following conditions:<br=
>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO EVENT=
 SHALL<br>
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES O=
R<br>
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,<b=
r>
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR<b=
r>
+ * OTHER DEALINGS IN THE SOFTWARE.<br>
+ *<br>
+ *<br>
+ */<br>
+<br>
+#include &quot;amd_shaders.h&quot;<br>
+<br>
+<br>
+#define CODE_OFFSET 512<br>
+#define DATA_OFFSET 1024<br>
+<br>
+#define SWAP_32(num) (((num &amp; 0xff000000) &gt;&gt; 24) | \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((num &amp; 0x0000ff00) &lt;=
&lt; 8) | \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((num &amp; 0x00ff0000) &gt;=
&gt; 8) | \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((num &amp; 0x000000ff) &lt;=
&lt; 24))<br>
+<br>
+<br>
+static&nbsp; uint32_t shader_bin[] =3D {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SWAP_32(0x800082be), SWAP_32(0x02ff08=
bf), SWAP_32(0x7f969800), SWAP_32(0x040085bf),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SWAP_32(0x02810281), SWAP_32(0x02ff08=
bf), SWAP_32(0x7f969800), SWAP_32(0xfcff84bf),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SWAP_32(0xff0083be), SWAP_32(0x00f000=
00), SWAP_32(0xc10082be), SWAP_32(0xaa02007e),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SWAP_32(0x000070e0), SWAP_32(0x000000=
80), SWAP_32(0x000081bf)<br>
+};<br>
+<br>
+const uint32_t * get_shader_bin(uint32_t *size_bytes, uint32_t *code_offse=
t, uint32_t *data_offset)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *size_bytes =3D sizeof(shader_bin);<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *code_offset =3D&nbsp; CODE_OFFSET;<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *data_offset =3D DATA_OFFSET;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return shader_bin;<br>
+}<br>
diff --git a/lib/amdgpu/amd_shaders.h b/lib/amdgpu/amd_shaders.h<br>
new file mode 100644<br>
index 00000000..1abb23ac<br>
--- /dev/null<br>
+++ b/lib/amdgpu/amd_shaders.h<br>
@@ -0,0 +1,32 @@<br>
+/*<br>
+ * Copyright 2014 Advanced Micro Devices, Inc.<br>
+ * Copyright 2022 Advanced Micro Devices, Inc.<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
<br>
+ * copy of this software and associated documentation files (the &quot;Sof=
tware&quot;),<br>
+ * to deal in the Software without restriction, including without limitati=
on<br>
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense=
,<br>
+ * and/or sell copies of the Software, and to permit persons to whom the<b=
r>
+ * Software is furnished to do so, subject to the following conditions:<br=
>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO EVENT=
 SHALL<br>
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES O=
R<br>
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,<b=
r>
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR<b=
r>
+ * OTHER DEALINGS IN THE SOFTWARE.<br>
+ *<br>
+ *<br>
+ */<br>
+#ifndef AMD_SHADERS_H<br>
+#define AMD_SHADERS_H<br>
+<br>
+#include &quot;drmtest.h&quot;<br>
+<br>
+const uint32_t * get_shader_bin(uint32_t *size_bytes, uint32_t *code_offse=
t, uint32_t *data_offset);<br>
+<br>
+#endif<br>
diff --git a/lib/meson.build b/lib/meson.build<br>
index 12b2cc5d..98c2803b 100644<br>
--- a/lib/meson.build<br>
+++ b/lib/meson.build<br>
@@ -132,6 +132,7 @@ if libdrm_amdgpu.found()<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'amdgpu/amd_compute.c',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'amdgpu/amd_gfx.c',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'amdgpu/amd_ip_blocks.c',<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 'amdgpu/amd_shaders.c',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
&nbsp;endif<br>
&nbsp;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BL1PR12MB5144C46B3DD89991690CDB71F7839BL1PR12MB5144namp_--
