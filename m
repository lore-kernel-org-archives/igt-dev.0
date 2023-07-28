Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7E910E67A
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 07:57:17 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-34650d1dfd4so13030505ab.2
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 00:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230721130458.64856-1-aesteve@redhat.com>
 <20230721130458.64856-2-aesteve@redhat.com>
 <20230728074134.lwfhcg3diwpmsump@zkempczy-mobl2>
In-Reply-To: <20230728074134.lwfhcg3diwpmsump@zkempczy-mobl2>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 28 Jul 2023 09:57:02 +0200
Message-ID: <CADSE00+au-DrzV6VyUWwfjmjpfF9Oj+5U01907n3chPBhD_ZRw@mail.gmail.com>
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: multipart/alternative; boundary="000000000000bcc64f0601876d46"
Subject: Re: [igt-dev] [PATCH 1/3] drm header update: temp commit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, belmouss@redhat.com, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--000000000000bcc64f0601876d46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 9:42=E2=80=AFAM Zbigniew Kempczy=C5=84ski <
zbigniew.kempczynski@intel.com> wrote:

> On Fri, Jul 21, 2023 at 03:04:56PM +0200, Albert Esteve wrote:
> > Update the drm included header to obtain
> > VIRTUAL_CURSOR_PLANE capability and be
> > able to test cursor hotspot setting.
> >
> > This commit should be removed once the kernel
> > patch is applied and update the headers
> > as appropiate.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  include/drm-uapi/drm.h | 54 +++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 53 insertions(+), 1 deletion(-)
> >
>
> I'm sorry Albert but we don't allow to add not accepted changes
> upstream regarding uapi headers. Only verbatim copy of uapi
> headers may land in igt.
>
> In patch [PATCH 2/3] igt_kms: add hotspot plane property you're
> unconditionally using definition which doesn't exists upstream
> yet. Likely it will just return from ioctl but I got doubts it
> should be written this way.
>
> I would suggest to introduce:
>
> #define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT=E2=96=B8 6
>
> in igt_kms.h instead drm.h. And when drm.h will land in igt
> remove this localized definition replacing with official one.
>

Hi Zbigniew,

Sure, that is why I mention in the commit that it should be removed
once the kernel patch lands.

There is a dependency, and I was not expecting this patch to be
upstreamed before the kernel patch lands.

But I'm ok with your suggestion. It will result in a cleaner patch to
review :)

Thanks!


>
> --
> Zbigniew
>
> > diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
> > index 5e54c3aa4..57b261a45 100644
> > --- a/include/drm-uapi/drm.h
> > +++ b/include/drm-uapi/drm.h
> > @@ -35,7 +35,13 @@
> >  #ifndef _DRM_H_
> >  #define _DRM_H_
> >
> > -#if   defined(__linux__)
> > +#if defined(__KERNEL__)
> > +
> > +#include <linux/types.h>
> > +#include <asm/ioctl.h>
> > +typedef unsigned int drm_handle_t;
> > +
> > +#elif defined(__linux__)
> >
> >  #include <linux/types.h>
> >  #include <asm/ioctl.h>
> > @@ -830,6 +836,32 @@ struct drm_get_cap {
> >   */
> >  #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS  5
> >
> > +/**
> > + * DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
> > + *
> > + * Drivers for para-virtualized hardware (e.g. vmwgfx, qxl, virtio and
> > + * virtualbox) have additional restrictions for cursor planes (thus
> > + * making cursor planes on those drivers not truly universal,) e.g.
> > + * they need cursor planes to act like one would expect from a mouse
> > + * cursor and have correctly set hotspot properties.
> > + * If this client cap is not set the DRM core will hide cursor plane o=
n
> > + * those virtualized drivers because not setting it implies that the
> > + * client is not capable of dealing with those extra restictions.
> > + * Clients which do set cursor hotspot and treat the cursor plane
> > + * like a mouse cursor should set this property.
> > + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> > + *
> > + * Setting this property on drivers which do not special case
> > + * cursor planes (i.e. non-virtualized drivers) will return
> > + * EOPNOTSUPP, which can be used by userspace to gauge
> > + * requirements of the hardware/drivers they're running on.
> > + *
> > + * This capability is always supported for atomic-capable virtualized
> > + * drivers starting from kernel version 6.6.
> > + */
> > +#define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT  6
> > +
> > +
> >  /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
> >  struct drm_set_client_cap {
> >       __u64 capability;
> > @@ -1090,6 +1122,24 @@ extern "C" {
> >  #define DRM_IOCTL_SYNCOBJ_TRANSFER   DRM_IOWR(0xCC, struct
> drm_syncobj_transfer)
> >  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL    DRM_IOWR(0xCD, struct
> drm_syncobj_timeline_array)
> >
> > +/**
> > + * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
> > + *
> > + * This queries metadata about a framebuffer. User-space fills
> > + * &drm_mode_fb_cmd2.fb_id as the input, and the kernels fills the res=
t
> of the
> > + * struct as the output.
> > + *
> > + * If the client is DRM master or has &CAP_SYS_ADMIN,
> &drm_mode_fb_cmd2.handles
> > + * will be filled with GEM buffer handles. Planes are valid until one
> has a
> > + * zero handle -- this can be used to compute the number of planes.
> > + *
> > + * Otherwise, &drm_mode_fb_cmd2.handles will be zeroed and planes are
> valid
> > + * until one has a zero &drm_mode_fb_cmd2.pitches.
> > + *
> > + * If the framebuffer has a format modifier, &DRM_MODE_FB_MODIFIERS
> will be set
> > + * in &drm_mode_fb_cmd2.flags and &drm_mode_fb_cmd2.modifier will
> contain the
> > + * modifier. Otherwise, user-space must ignore
> &drm_mode_fb_cmd2.modifier.
> > + */
> >  #define DRM_IOCTL_MODE_GETFB2                DRM_IOWR(0xCE, struct
> drm_mode_fb_cmd2)
> >
> >  /*
> > @@ -1144,6 +1194,7 @@ struct drm_event_crtc_sequence {
> >  };
> >
> >  /* typedef area */
> > +#ifndef __KERNEL__
> >  typedef struct drm_clip_rect drm_clip_rect_t;
> >  typedef struct drm_drawable_info drm_drawable_info_t;
> >  typedef struct drm_tex_region drm_tex_region_t;
> > @@ -1185,6 +1236,7 @@ typedef struct drm_agp_binding drm_agp_binding_t;
> >  typedef struct drm_agp_info drm_agp_info_t;
> >  typedef struct drm_scatter_gather drm_scatter_gather_t;
> >  typedef struct drm_set_version drm_set_version_t;
> > +#endif
> >
> >  #if defined(__cplusplus)
> >  }
> > --
> > 2.40.0
> >
>
>

--000000000000bcc64f0601876d46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 28, 2023 at 9:42=
=E2=80=AFAM Zbigniew Kempczy=C5=84ski &lt;<a href=3D"mailto:zbigniew.kempcz=
ynski@intel.com">zbigniew.kempczynski@intel.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Jul 21, 2023 at 03:0=
4:56PM +0200, Albert Esteve wrote:<br>
&gt; Update the drm included header to obtain<br>
&gt; VIRTUAL_CURSOR_PLANE capability and be<br>
&gt; able to test cursor hotspot setting.<br>
&gt; <br>
&gt; This commit should be removed once the kernel<br>
&gt; patch is applied and update the headers<br>
&gt; as appropiate.<br>
&gt; <br>
&gt; Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com"=
 target=3D"_blank">aesteve@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/drm-uapi/drm.h | 54 ++++++++++++++++++++++++++++++++++++=
+++++-<br>
&gt;=C2=A0 1 file changed, 53 insertions(+), 1 deletion(-)<br>
&gt; <br>
<br>
I&#39;m sorry Albert but we don&#39;t allow to add not accepted changes<br>
upstream regarding uapi headers. Only verbatim copy of uapi<br>
headers may land in igt.<br>
<br>
In patch [PATCH 2/3] igt_kms: add hotspot plane property you&#39;re<br>
unconditionally using definition which doesn&#39;t exists upstream<br>
yet. Likely it will just return from ioctl but I got doubts it<br>
should be written this way.<br>
<br>
I would suggest to introduce:<br>
<br>
#define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT=E2=96=B8 6<br>
<br>
in igt_kms.h instead drm.h. And when drm.h will land in igt<br>
remove this localized definition replacing with official one.<br></blockquo=
te><div><br></div><div>Hi Zbigniew,</div><div><br></div><div>Sure, that is =
why I mention in the commit that it should be removed</div><div>once the ke=
rnel patch lands.</div><div><br></div><div>There is a dependency, and I was=
 not expecting this patch to be</div><div>upstreamed before the kernel patc=
h lands.</div><div><br></div><div>But I&#39;m ok with your suggestion. It w=
ill result in a cleaner patch to review :)</div><div><br></div><div>Thanks!=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
--<br>
Zbigniew<br>
<br>
&gt; diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h<br>
&gt; index 5e54c3aa4..57b261a45 100644<br>
&gt; --- a/include/drm-uapi/drm.h<br>
&gt; +++ b/include/drm-uapi/drm.h<br>
&gt; @@ -35,7 +35,13 @@<br>
&gt;=C2=A0 #ifndef _DRM_H_<br>
&gt;=C2=A0 #define _DRM_H_<br>
&gt;=C2=A0 <br>
&gt; -#if=C2=A0 =C2=A0defined(__linux__)<br>
&gt; +#if defined(__KERNEL__)<br>
&gt; +<br>
&gt; +#include &lt;linux/types.h&gt;<br>
&gt; +#include &lt;asm/ioctl.h&gt;<br>
&gt; +typedef unsigned int drm_handle_t;<br>
&gt; +<br>
&gt; +#elif defined(__linux__)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &lt;linux/types.h&gt;<br>
&gt;=C2=A0 #include &lt;asm/ioctl.h&gt;<br>
&gt; @@ -830,6 +836,32 @@ struct drm_get_cap {<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS=C2=A0 5<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT<br>
&gt; + *<br>
&gt; + * Drivers for para-virtualized hardware (e.g. vmwgfx, qxl, virtio an=
d<br>
&gt; + * virtualbox) have additional restrictions for cursor planes (thus<b=
r>
&gt; + * making cursor planes on those drivers not truly universal,) e.g.<b=
r>
&gt; + * they need cursor planes to act like one would expect from a mouse<=
br>
&gt; + * cursor and have correctly set hotspot properties.<br>
&gt; + * If this client cap is not set the DRM core will hide cursor plane =
on<br>
&gt; + * those virtualized drivers because not setting it implies that the<=
br>
&gt; + * client is not capable of dealing with those extra restictions.<br>
&gt; + * Clients which do set cursor hotspot and treat the cursor plane<br>
&gt; + * like a mouse cursor should set this property.<br>
&gt; + * The client must enable &amp;DRM_CLIENT_CAP_ATOMIC first.<br>
&gt; + *<br>
&gt; + * Setting this property on drivers which do not special case<br>
&gt; + * cursor planes (i.e. non-virtualized drivers) will return<br>
&gt; + * EOPNOTSUPP, which can be used by userspace to gauge<br>
&gt; + * requirements of the hardware/drivers they&#39;re running on.<br>
&gt; + *<br>
&gt; + * This capability is always supported for atomic-capable virtualized=
<br>
&gt; + * drivers starting from kernel version 6.6.<br>
&gt; + */<br>
&gt; +#define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT=C2=A0 6<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */<br>
&gt;=C2=A0 struct drm_set_client_cap {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 capability;<br>
&gt; @@ -1090,6 +1122,24 @@ extern &quot;C&quot; {<br>
&gt;=C2=A0 #define DRM_IOCTL_SYNCOBJ_TRANSFER=C2=A0 =C2=A0DRM_IOWR(0xCC, st=
ruct drm_syncobj_transfer)<br>
&gt;=C2=A0 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL=C2=A0 =C2=A0 DRM_IOWR(=
0xCD, struct drm_syncobj_timeline_array)<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.<br>
&gt; + *<br>
&gt; + * This queries metadata about a framebuffer. User-space fills<br>
&gt; + * &amp;drm_mode_fb_cmd2.fb_id as the input, and the kernels fills th=
e rest of the<br>
&gt; + * struct as the output.<br>
&gt; + *<br>
&gt; + * If the client is DRM master or has &amp;CAP_SYS_ADMIN, &amp;drm_mo=
de_fb_cmd2.handles<br>
&gt; + * will be filled with GEM buffer handles. Planes are valid until one=
 has a<br>
&gt; + * zero handle -- this can be used to compute the number of planes.<b=
r>
&gt; + *<br>
&gt; + * Otherwise, &amp;drm_mode_fb_cmd2.handles will be zeroed and planes=
 are valid<br>
&gt; + * until one has a zero &amp;drm_mode_fb_cmd2.pitches.<br>
&gt; + *<br>
&gt; + * If the framebuffer has a format modifier, &amp;DRM_MODE_FB_MODIFIE=
RS will be set<br>
&gt; + * in &amp;drm_mode_fb_cmd2.flags and &amp;drm_mode_fb_cmd2.modifier =
will contain the<br>
&gt; + * modifier. Otherwise, user-space must ignore &amp;drm_mode_fb_cmd2.=
modifier.<br>
&gt; + */<br>
&gt;=C2=A0 #define DRM_IOCTL_MODE_GETFB2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt; @@ -1144,6 +1194,7 @@ struct drm_event_crtc_sequence {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* typedef area */<br>
&gt; +#ifndef __KERNEL__<br>
&gt;=C2=A0 typedef struct drm_clip_rect drm_clip_rect_t;<br>
&gt;=C2=A0 typedef struct drm_drawable_info drm_drawable_info_t;<br>
&gt;=C2=A0 typedef struct drm_tex_region drm_tex_region_t;<br>
&gt; @@ -1185,6 +1236,7 @@ typedef struct drm_agp_binding drm_agp_binding_t=
;<br>
&gt;=C2=A0 typedef struct drm_agp_info drm_agp_info_t;<br>
&gt;=C2=A0 typedef struct drm_scatter_gather drm_scatter_gather_t;<br>
&gt;=C2=A0 typedef struct drm_set_version drm_set_version_t;<br>
&gt; +#endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #if defined(__cplusplus)<br>
&gt;=C2=A0 }<br>
&gt; -- <br>
&gt; 2.40.0<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000bcc64f0601876d46--
