Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD766E656
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2018 01:06:23 +0000 (UTC)
Received: by mail-wm0-x241.google.com with SMTP id z9so761950wmb.3
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2018 17:06:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180221231905.15580-6-jordan.l.justen@intel.com>
References: <20180221231905.15580-1-jordan.l.justen@intel.com>
 <20180221231905.15580-6-jordan.l.justen@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 21 Feb 2018 17:06:21 -0800
Message-ID: <CAOFGe94u4kE5BfrGNefXJLdUO6RrQ3c1c3GZyWUoj_KCd_WA8g@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] aubdump: Signal drm sync objects
 when device override is used
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0082616825=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jordan Justen <jordan.l.justen@intel.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0082616825==
Content-Type: multipart/alternative; boundary="001a1146ed96ecb08e0565c2a64a"

--001a1146ed96ecb08e0565c2a64a
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

On Wed, Feb 21, 2018 at 3:19 PM, Jordan Justen <jordan.l.justen@intel.com>
wrote:

> This prevents an infinite hang with crucible (vulkan) rendering tests
> when --device is used.
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
> ---
>  tools/aubdump.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/tools/aubdump.c b/tools/aubdump.c
> index 4ecba01a..ed90e91c 100644
> --- a/tools/aubdump.c
> +++ b/tools/aubdump.c
> @@ -996,6 +996,22 @@ dump_execbuffer2(int fd, struct
> drm_i915_gem_execbuffer2 *execbuffer2)
>                 if (files[i] != NULL)
>                         fflush(files[i]);
>         }
> +
> +       if (device_override &&
> +           (execbuffer2->flags & I915_EXEC_FENCE_ARRAY) != 0) {
> +               struct drm_i915_gem_exec_fence *fences =
> +                       (void*)(uintptr_t)execbuffer2->cliprects_ptr;
> +               for (uint32_t i = 0; i < execbuffer2->num_cliprects; i++) {
> +                       if ((fences[i].flags & I915_EXEC_FENCE_SIGNAL) !=
> 0) {
> +                               struct drm_syncobj_array arg = {
> +                                 .handles = (uintptr_t)&fences[i].handle,
> +                                       .count_handles = 1,
> +                                       .pad = 0,
> +                               };
> +                               libc_ioctl(fd, DRM_IOCTL_SYNCOBJ_SIGNAL,
> &arg);
> +                       }
> +               }
> +       }
>  }
>
>  static void
> --
> 2.16.1
>
>

--001a1146ed96ecb08e0565c2a64a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Jason Ekstrand &lt;<a href=3D"mailto:jason@jl=
ekstrand.net">jason@jlekstrand.net</a>&gt;<br></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Wed, Feb 21, 2018 at 3:19 PM, Jordan =
Justen <span dir=3D"ltr">&lt;<a href=3D"mailto:jordan.l.justen@intel.com" t=
arget=3D"_blank">jordan.l.justen@intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">This prevents an infinite hang with crucible (vulka=
n) rendering tests<br>
when --device is used.<br>
<br>
Cc: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.net">jason@jlekst=
rand.net</a>&gt;<br>
Signed-off-by: Jordan Justen &lt;<a href=3D"mailto:jordan.l.justen@intel.co=
m">jordan.l.justen@intel.com</a>&gt;<br>
---<br>
=C2=A0tools/aubdump.c | 16 ++++++++++++++++<br>
=C2=A01 file changed, 16 insertions(+)<br>
<br>
diff --git a/tools/aubdump.c b/tools/aubdump.c<br>
index 4ecba01a..ed90e91c 100644<br>
--- a/tools/aubdump.c<br>
+++ b/tools/aubdump.c<br>
@@ -996,6 +996,22 @@ dump_execbuffer2(int fd, struct drm_i915_gem_execbuffe=
r2 *execbuffer2)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (files[i] !=3D N=
ULL)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fflush(files[i]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (device_override &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(execbuffer2-&gt;flags &amp; I915=
_EXEC_FENCE_ARRAY) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_gem=
_exec_fence *fences =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(void*)(uintptr_t)execbuffer2-<wbr>&gt;cliprects_ptr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (uint32_t i =3D=
 0; i &lt; execbuffer2-&gt;num_cliprects; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ((fences[i].flags &amp; I915_EXEC_FENCE_SIGNAL) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_syncobj_array arg =3D {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.handles =3D (uintptr_t)&amp;f=
ences[i].handle,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.count_ha=
ndles =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pad =3D =
0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc_ioctl(fd, DRM_IOCTL_SYNCOBJ_SIGN=
AL, &amp;arg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
=C2=A0static void<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.16.1<br>
<br>
</font></span></blockquote></div><br></div>

--001a1146ed96ecb08e0565c2a64a--

--===============0082616825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0082616825==--
