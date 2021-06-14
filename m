Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2908289E8C
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:30:14 +0000 (UTC)
From: "Jacob, Anson" <Anson.Jacob@amd.com>
Date: Mon, 14 Jun 2021 16:30:12 +0000
Message-ID: <DM4PR12MB50722A79A0A6B8FEA0641201EB319@DM4PR12MB5072.namprd12.prod.outlook.com>
References: <20210614153557.19934-1-Anson.Jacob@amd.com>,
 <CAJUqKUovMqju5eFg9N52JR05oB-C2sbCAk=q8iMG9Yf1mnHbfA@mail.gmail.com>
In-Reply-To: <CAJUqKUovMqju5eFg9N52JR05oB-C2sbCAk=q8iMG9Yf1mnHbfA@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/amdgpu: Introduced new amdgpu
 module reload test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0235134148=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Lu,
 Victor Cheng Chi (Victor)" <VictorChengChi.Lu@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0235134148==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM4PR12MB50722A79A0A6B8FEA0641201EB319DM4PR12MB5072namp_"

--_000_DM4PR12MB50722A79A0A6B8FEA0641201EB319DM4PR12MB5072namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

> I see the i915 equivalent test having 2 more subtests, are those gonna
> be added in a follow up?
No. We do not have those tests yet.

-- Anson

________________________________
From: Mark Yacoub <markyacoub@chromium.org>
Sent: Monday, June 14, 2021 11:55 AM
To: Jacob, Anson <Anson.Jacob@amd.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Wentland=
, Harry <Harry.Wentland@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.c=
om>; Mark Yacoub <markyacoub@google.com>; Lu, Victor Cheng Chi (Victor) <Vi=
ctorChengChi.Lu@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/amdgpu: Introduced new amdgp=
u module reload test

On Mon, Jun 14, 2021 at 11:36 AM Anson Jacob <Anson.Jacob@amd.com> wrote:
>
> From: Victor Lu <victorchengchi.lu@amd.com>
>
> Based off of i915/i915_module_load, unloads and loads the
> amdgpu module.
>
> Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
> Acked-by: Anson Jacob <Anson.Jacob@amd.com>
> ---
>  lib/igt_kmod.c                 | 41 ++++++++++++++++++
>  lib/igt_kmod.h                 |  3 ++
>  tests/amdgpu/amd_module_load.c | 77 ++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build       |  1 +
>  4 files changed, 122 insertions(+)
>  create mode 100644 tests/amdgpu/amd_module_load.c
>
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 55295fa5..69bdc810 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -433,6 +433,47 @@ igt_i915_driver_unload(void)
>         return IGT_EXIT_SUCCESS;
>  }
>
> +int
> +igt_amdgpu_driver_load(const char *opts)
> +{
> +       if (opts)
> +               igt_info("Reloading amdgpu with %s\n\n", opts);
> +
> +       if (igt_kmod_load("amdgpu", opts)) {
> +               igt_warn("Could not load amdgpu\n");
> +               return IGT_EXIT_FAILURE;
> +       }
> +
> +       bind_fbcon(true);
> +
> +       return IGT_EXIT_SUCCESS;
> +}
> +
> +int
> +igt_amdgpu_driver_unload(void)
> +{
> +       bind_fbcon(false);
> +
> +       if (igt_kmod_is_loaded("amdgpu")) {
> +               if (igt_kmod_unload("amdgpu", 0)) {
> +                       igt_warn("Could not unload amdgpu\n");
> +                       igt_kmod_list_loaded();
> +                       igt_lsof("/dev/dri");
> +                       return IGT_EXIT_SKIP;
> +               }
> +       }
> +
> +       igt_kmod_unload("drm_kms_helper", 0);
> +       igt_kmod_unload("drm", 0);
> +
> +       if (igt_kmod_is_loaded("amdgpu")) {
> +               igt_warn("amdgpu.ko still loaded!\n");
> +               return IGT_EXIT_FAILURE;
> +       }
> +
> +       return IGT_EXIT_SUCCESS;
> +}
> +
>  static void kmsg_dump(int fd)
>  {
>         char record[4096 + 1];
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index c71ec147..04c87516 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -39,6 +39,9 @@ int igt_kmod_unload(const char *mod_name, unsigned int =
flags);
>  int igt_i915_driver_load(const char *opts);
>  int igt_i915_driver_unload(void);
>
> +int igt_amdgpu_driver_load(const char *opts);
> +int igt_amdgpu_driver_unload(void);
> +
>  void igt_kselftests(const char *module_name,
>                     const char *module_options,
>                     const char *result_option,
> diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_loa=
d.c
> new file mode 100644
> index 00000000..e682d2c5
> --- /dev/null
> +++ b/tests/amdgpu/amd_module_load.c
> @@ -0,0 +1,77 @@
> +/*
> + * Copyright 2020 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#include "igt.h"
> +#include "igt_kmod.h"
> +
> +#include <amdgpu.h>
> +#include <amdgpu_drm.h>
> +#include <sys/ioctl.h>
> +
> +/**
> + * Adapted from /tests/i915/i915_module_load.c
> + */
> +static void
> +sanity_check(void)
> +{
> +       int err =3D 0;
> +       int fd;
> +       int arg_ret;
> +       struct drm_amdgpu_info args =3D {0};
> +       args.return_pointer =3D (uintptr_t) &arg_ret;
> +       args.return_size =3D sizeof(int);
> +       args.query =3D AMDGPU_INFO_HW_IP_INFO;
> +
> +       fd =3D drm_open_driver(DRIVER_AMDGPU);
> +       igt_set_timeout(1, "Module reload timeout!");
> +
> +       if (ioctl(fd, DRM_IOCTL_AMDGPU_INFO, &args) < 0)
> +               err =3D -errno;
> +
> +       igt_set_timeout(0, NULL);
> +       close(fd);
> +
> +       igt_assert_f(err, 0);
> +}
> +
> +igt_main
> +{
> +       igt_subtest("reload") {
I see the i915 equivalent test having 2 more subtests, are those gonna
be added in a follow up?
> +               int err;
> +               igt_amdgpu_driver_unload();
> +
> +               err =3D igt_amdgpu_driver_load(NULL);
> +
> +               igt_assert_eq(err, 0);
> +
> +               sanity_check();
> +
> +               igt_amdgpu_driver_unload();
> +       }
> +
> +       igt_fixture
> +       {
> +               /* load the module back in */
> +               igt_amdgpu_driver_load(NULL);
> +       }
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index b92aa22b..84179410 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -9,6 +9,7 @@ if libdrm_amdgpu.found()
>                           'amd_cs_nop',
>                           'amd_info',
>                           'amd_prime',
> +                         'amd_module_load',
>                         ]
>         amdgpu_deps +=3D libdrm_amdgpu
>  endif
> --
> 2.25.1
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;data=3D04%7C01%7CAnson.=
Jacob%40amd.com%7C6748889419fa450691e308d92f4cd022%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637592829230568891%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
RFYYdhHiC5Ixzg20hK3UYdYXDgwdf8nbmTLpnXkcjAU%3D&amp;reserved=3D0

--_000_DM4PR12MB50722A79A0A6B8FEA0641201EB319DM4PR12MB5072namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; I see the i915 eq=
uivalent
 test having 2 more subtests, are those gonna</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt; be added in a fol=
low
 up?</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">No. We do not have tho=
se
 tests yet.&nbsp;</span></div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
-- Anson</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Mark Yacoub &lt;marky=
acoub@chromium.org&gt;<br>
<b>Sent:</b> Monday, June 14, 2021 11:55 AM<br>
<b>To:</b> Jacob, Anson &lt;Anson.Jacob@amd.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Siqueira, Rodrigo &lt;=
Rodrigo.Siqueira@amd.com&gt;; Mark Yacoub &lt;markyacoub@google.com&gt;; Lu=
, Victor Cheng Chi (Victor) &lt;VictorChengChi.Lu@amd.com&gt;<br>
<b>Subject:</b> Re: [igt-dev] [PATCH i-g-t 1/2] tests/amdgpu: Introduced ne=
w amdgpu module reload test</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Mon, Jun 14, 2021 at 11:36 AM Anson Jacob &lt;A=
nson.Jacob@amd.com&gt; wrote:<br>
&gt;<br>
&gt; From: Victor Lu &lt;victorchengchi.lu@amd.com&gt;<br>
&gt;<br>
&gt; Based off of i915/i915_module_load, unloads and loads the<br>
&gt; amdgpu module.<br>
&gt;<br>
&gt; Signed-off-by: Victor Lu &lt;victorchengchi.lu@amd.com&gt;<br>
&gt; Acked-by: Anson Jacob &lt;Anson.Jacob@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; lib/igt_kmod.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 41 ++++++++++++++++++<br>
&gt;&nbsp; lib/igt_kmod.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 ++<br>
&gt;&nbsp; tests/amdgpu/amd_module_load.c | 77 ++++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; tests/amdgpu/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 1 +<br>
&gt;&nbsp; 4 files changed, 122 insertions(+)<br>
&gt;&nbsp; create mode 100644 tests/amdgpu/amd_module_load.c<br>
&gt;<br>
&gt; diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c<br>
&gt; index 55295fa5..69bdc810 100644<br>
&gt; --- a/lib/igt_kmod.c<br>
&gt; +++ b/lib/igt_kmod.c<br>
&gt; @@ -433,6 +433,47 @@ igt_i915_driver_unload(void)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return IGT_EXIT_SUCCES=
S;<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt; +int<br>
&gt; +igt_amdgpu_driver_load(const char *opts)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (opts)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; igt_info(&quot;Reloading amdgpu with %s\n\n&quot;, opts);<b=
r>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (igt_kmod_load(&quot;amdgpu&q=
uot;, opts)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; igt_warn(&quot;Could not load amdgpu\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return IGT_EXIT_FAILURE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bind_fbcon(true);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return IGT_EXIT_SUCCESS;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int<br>
&gt; +igt_amdgpu_driver_unload(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bind_fbcon(false);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (igt_kmod_is_loaded(&quot;amd=
gpu&quot;)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (igt_kmod_unload(&quot;amdgpu&quot;, 0)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_warn(&q=
uot;Could not unload amdgpu\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_kmod_li=
st_loaded();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_lsof(&q=
uot;/dev/dri&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return IGT_=
EXIT_SKIP;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_kmod_unload(&quot;drm_kms_he=
lper&quot;, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_kmod_unload(&quot;drm&quot;,=
 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (igt_kmod_is_loaded(&quot;amd=
gpu&quot;)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; igt_warn(&quot;amdgpu.ko still loaded!\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return IGT_EXIT_FAILURE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return IGT_EXIT_SUCCESS;<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static void kmsg_dump(int fd)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char record[4096 + 1];=
<br>
&gt; diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h<br>
&gt; index c71ec147..04c87516 100644<br>
&gt; --- a/lib/igt_kmod.h<br>
&gt; +++ b/lib/igt_kmod.h<br>
&gt; @@ -39,6 +39,9 @@ int igt_kmod_unload(const char *mod_name, unsigned i=
nt flags);<br>
&gt;&nbsp; int igt_i915_driver_load(const char *opts);<br>
&gt;&nbsp; int igt_i915_driver_unload(void);<br>
&gt;<br>
&gt; +int igt_amdgpu_driver_load(const char *opts);<br>
&gt; +int igt_amdgpu_driver_unload(void);<br>
&gt; +<br>
&gt;&nbsp; void igt_kselftests(const char *module_name,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *module_option=
s,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *result_option=
,<br>
&gt; diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_=
load.c<br>
&gt; new file mode 100644<br>
&gt; index 00000000..e682d2c5<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/amdgpu/amd_module_load.c<br>
&gt; @@ -0,0 +1,77 @@<br>
&gt; +/*<br>
&gt; + * Copyright 2020 Advanced Micro Devices, Inc.<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
&gt; + * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&gt; + * to deal in the Software without restriction, including without lim=
itation<br>
&gt; + * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&gt; + * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&gt; + * Software is furnished to do so, subject to the following condition=
s:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO =
EVENT SHALL<br>
&gt; + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMA=
GES OR<br>
&gt; + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,<br>
&gt; + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR<br>
&gt; + * OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;igt.h&quot;<br>
&gt; +#include &quot;igt_kmod.h&quot;<br>
&gt; +<br>
&gt; +#include &lt;amdgpu.h&gt;<br>
&gt; +#include &lt;amdgpu_drm.h&gt;<br>
&gt; +#include &lt;sys/ioctl.h&gt;<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Adapted from /tests/i915/i915_module_load.c<br>
&gt; + */<br>
&gt; +static void<br>
&gt; +sanity_check(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int arg_ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_info args =3D =
{0};<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args.return_pointer =3D (uintptr=
_t) &amp;arg_ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args.return_size =3D sizeof(int)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args.query =3D AMDGPU_INFO_HW_IP=
_INFO;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D drm_open_driver(DRIVER_AM=
DGPU);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_set_timeout(1, &quot;Module =
reload timeout!&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ioctl(fd, DRM_IOCTL_AMDGPU_I=
NFO, &amp;args) &lt; 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; err =3D -errno;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_set_timeout(0, NULL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(err, 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +igt_main<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;reload&quot;) =
{<br>
I see the i915 equivalent test having 2 more subtests, are those gonna<br>
be added in a follow up?<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; int err;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; igt_amdgpu_driver_unload();<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; err =3D igt_amdgpu_driver_load(NULL);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; igt_assert_eq(err, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; sanity_check();<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; igt_amdgpu_driver_unload();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* load the module back in */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; igt_amdgpu_driver_load(NULL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build<br>
&gt; index b92aa22b..84179410 100644<br>
&gt; --- a/tests/amdgpu/meson.build<br>
&gt; +++ b/tests/amdgpu/meson.build<br>
&gt; @@ -9,6 +9,7 @@ if libdrm_amdgpu.found()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 'amd_cs_nop',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 'amd_info',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 'amd_prime',<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 'amd_module_load',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_deps +=3D libdr=
m_amdgpu<br>
&gt;&nbsp; endif<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; igt-dev mailing list<br>
&gt; igt-dev@lists.freedesktop.org<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;amp;data=
=3D04%7C01%7CAnson.Jacob%40amd.com%7C6748889419fa450691e308d92f4cd022%7C3dd=
8961fe4884e608e11a82d994e183d%7C0%7C0%7C637592829230568891%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;amp;sdata=3DRFYYdhHiC5Ixzg20hK3UYdYXDgwdf8nbmTLpnXkcjAU%3D&amp;a=
mp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;amp;data=3D04%7C01%7CAnso=
n.Jacob%40amd.com%7C6748889419fa450691e308d92f4cd022%7C3dd8961fe4884e608e11=
a82d994e183d%7C0%7C0%7C637592829230568891%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sd=
ata=3DRFYYdhHiC5Ixzg20hK3UYdYXDgwdf8nbmTLpnXkcjAU%3D&amp;amp;reserved=3D0</=
a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB50722A79A0A6B8FEA0641201EB319DM4PR12MB5072namp_--

--===============0235134148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0235134148==--
