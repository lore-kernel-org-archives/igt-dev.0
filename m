Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698E06E2F2
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 07:07:57 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Tue, 5 Oct 2021 07:07:49 +0000
Message-ID: <BYAPR11MB3784DC5B66156417CA223EC48AAF9@BYAPR11MB3784.namprd11.prod.outlook.com>
References: <20211004223949.2138370-1-alan.previn.teres.alexis@intel.com>
 <20211004223949.2138370-2-alan.previn.teres.alexis@intel.com>
 <YVv5LT+drUMOIxVG@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YVv5LT+drUMOIxVG@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB3784DC5B66156417CA223EC48AAF9BYAPR11MB3784namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v12 01/15] i915_drm.h sync
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_BYAPR11MB3784DC5B66156417CA223EC48AAF9BYAPR11MB3784namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My bad... yes I meant signed-off.
...alan
________________________________
From: Latvala, Petri <petri.latvala@intel.com>
Sent: Tuesday, October 5, 2021 12:05:17 AM
To: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Subject: Re: [igt-dev] [PATCH i-g-t v12 01/15] i915_drm.h sync

On Mon, Oct 04, 2021 at 03:39:35PM -0700, Alan Previn wrote:
> Sync UAPI for to get GEM_CREATE_EXT's I915_OBJECT_PARAM_PROTECTED_CONTENT
> and GEM_CONTEXT_CREATE's I915_CONTEXT_PARAM_PROTECTED_CONTENT
>
> Taken from kernel commit:
> commit d3ac8d42168a9be7380be8035df8b6d3780ec2a1
>        ("drm/i915/pxp: interfaces for using protected objects.")
>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>

You probably meant Signed-off-by.


--
Petri Latvala


> ---
>  include/drm-uapi/i915_drm.h | 94 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>
> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> index f4691fcc..6e81f6ea 100644
> --- a/include/drm-uapi/i915_drm.h
> +++ b/include/drm-uapi/i915_drm.h
> @@ -1815,6 +1815,55 @@ struct drm_i915_gem_context_param {
>   * attempted to use it, never re-use this context param number.
>   */
>  #define I915_CONTEXT_PARAM_RINGSIZE  0xc
> +
> +/*
> + * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
> + *
> + * Mark that the context makes use of protected content, which will resu=
lt
> + * in the context being invalidated when the protected content session i=
s.
> + * Given that the protected content session is killed on suspend, the de=
vice
> + * is kept awake for the lifetime of a protected context, so the user sh=
ould
> + * make sure to dispose of them once done.
> + * This flag can only be set at context creation time and, when set to t=
rue,
> + * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECOVER=
ABLE
> + * to false. This flag can't be set to true in conjunction with setting =
the
> + * I915_CONTEXT_PARAM_BANNABLE flag to false. Creation example:
> + *
> + * .. code-block:: C
> + *
> + *   struct drm_i915_gem_context_create_ext_setparam p_protected =3D {
> + *           .base =3D {
> + *                   .name =3D I915_CONTEXT_CREATE_EXT_SETPARAM,
> + *           },
> + *           .param =3D {
> + *                   .param =3D I915_CONTEXT_PARAM_PROTECTED_CONTENT,
> + *                   .value =3D 1,
> + *           }
> + *   };
> + *   struct drm_i915_gem_context_create_ext_setparam p_norecover =3D {
> + *           .base =3D {
> + *                   .name =3D I915_CONTEXT_CREATE_EXT_SETPARAM,
> + *                   .next_extension =3D to_user_pointer(&p_protected),
> + *           },
> + *           .param =3D {
> + *                   .param =3D I915_CONTEXT_PARAM_RECOVERABLE,
> + *                   .value =3D 0,
> + *           }
> + *   };
> + *   struct drm_i915_gem_context_create_ext create =3D {
> + *           .flags =3D I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> + *           .extensions =3D to_user_pointer(&p_norecover);
> + *   };
> + *
> + *   ctx_id =3D gem_context_create_ext(drm_fd, &create);
> + *
> + * In addition to the normal failure cases, setting this flag during con=
text
> + * creation can result in the following errors:
> + *
> + * -ENODEV: feature not available
> + * -EPERM: trying to mark a recoverable or not bannable context as prote=
cted
> + */
> +#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
>  /* Must be kept compact -- no holes and well documented */
>
>        __u64 value;
> @@ -2931,8 +2980,12 @@ struct drm_i915_gem_create_ext {
>         *
>         * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
>         * struct drm_i915_gem_create_ext_memory_regions.
> +      *
> +      * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
> +      * struct drm_i915_gem_create_ext_protected_content.
>         */
>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>        __u64 extensions;
>  };
>
> @@ -2990,6 +3043,47 @@ struct drm_i915_gem_create_ext_memory_regions {
>        __u64 regions;
>  };
>
> +/**
> + * struct drm_i915_gem_create_ext_protected_content - The
> + * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
> + *
> + * If this extension is provided, buffer contents are expected to be pro=
tected
> + * by PXP encryption and require decryption for scan out and processing.=
 This
> + * is only possible on platforms that have PXP enabled, on all other sce=
narios
> + * using this extension will cause the ioctl to fail and return -ENODEV.=
 The
> + * flags parameter is reserved for future expansion and must currently b=
e set
> + * to zero.
> + *
> + * The buffer contents are considered invalid after a PXP session teardo=
wn.
> + *
> + * The encryption is guaranteed to be processed correctly only if the ob=
ject
> + * is submitted with a context created using the
> + * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable extr=
a checks
> + * at submission time on the validity of the objects involved.
> + *
> + * Below is an example on how to create a protected object:
> + *
> + * .. code-block:: C
> + *
> + *      struct drm_i915_gem_create_ext_protected_content protected_ext =
=3D {
> + *              .base =3D { .name =3D I915_GEM_CREATE_EXT_PROTECTED_CONT=
ENT },
> + *              .flags =3D 0,
> + *      };
> + *      struct drm_i915_gem_create_ext create_ext =3D {
> + *              .size =3D PAGE_SIZE,
> + *              .extensions =3D (uintptr_t)&protected_ext,
> + *      };
> + *
> + *      int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext=
);
> + *      if (err) ...
> + */
> +struct drm_i915_gem_create_ext_protected_content {
> +     /** @base: Extension link. See struct i915_user_extension. */
> +     struct i915_user_extension base;
> +     /** @flags: reserved for future usage, currently MBZ */
> +     __u32 flags;
> +};
> +
>  /* ID of the protected content session managed by i915 when PXP is activ=
e */
>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>
> --
> 2.25.1
>

--_000_BYAPR11MB3784DC5B66156417CA223EC48AAF9BYAPR11MB3784namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
My bad... yes I meant signed-off.<span id=3D"ms-outlook-android-cursor"></s=
pan><br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
...alan</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Latvala, Petri &lt;pe=
tri.latvala@intel.com&gt;<br>
<b>Sent:</b> Tuesday, October 5, 2021 12:05:17 AM<br>
<b>To:</b> Teres Alexis, Alan Previn &lt;alan.previn.teres.alexis@intel.com=
&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> Re: [igt-dev] [PATCH i-g-t v12 01/15] i915_drm.h sync</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Oct 04, 2021 at 03:39:35PM -0700, Alan Pre=
vin wrote:<br>
&gt; Sync UAPI for to get GEM_CREATE_EXT's I915_OBJECT_PARAM_PROTECTED_CONT=
ENT<br>
&gt; and GEM_CONTEXT_CREATE's I915_CONTEXT_PARAM_PROTECTED_CONTENT<br>
&gt; <br>
&gt; Taken from kernel commit:<br>
&gt; commit d3ac8d42168a9be7380be8035df8b6d3780ec2a1<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (&quot;drm/i915/pxp: interfa=
ces for using protected objects.&quot;)<br>
&gt; <br>
&gt; Reviewed-by: Alan Previn &lt;alan.previn.teres.alexis@intel.com&gt;<br=
>
<br>
You probably meant Signed-off-by.<br>
<br>
<br>
-- <br>
Petri Latvala<br>
<br>
<br>
&gt; ---<br>
&gt;&nbsp; include/drm-uapi/i915_drm.h | 94 +++++++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; 1 file changed, 94 insertions(+)<br>
&gt; <br>
&gt; diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h=
<br>
&gt; index f4691fcc..6e81f6ea 100644<br>
&gt; --- a/include/drm-uapi/i915_drm.h<br>
&gt; +++ b/include/drm-uapi/i915_drm.h<br>
&gt; @@ -1815,6 +1815,55 @@ struct drm_i915_gem_context_param {<br>
&gt;&nbsp;&nbsp; * attempted to use it, never re-use this context param num=
ber.<br>
&gt;&nbsp;&nbsp; */<br>
&gt;&nbsp; #define I915_CONTEXT_PARAM_RINGSIZE&nbsp; 0xc<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * I915_CONTEXT_PARAM_PROTECTED_CONTENT:<br>
&gt; + *<br>
&gt; + * Mark that the context makes use of protected content, which will r=
esult<br>
&gt; + * in the context being invalidated when the protected content sessio=
n is.<br>
&gt; + * Given that the protected content session is killed on suspend, the=
 device<br>
&gt; + * is kept awake for the lifetime of a protected context, so the user=
 should<br>
&gt; + * make sure to dispose of them once done.<br>
&gt; + * This flag can only be set at context creation time and, when set t=
o true,<br>
&gt; + * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECO=
VERABLE<br>
&gt; + * to false. This flag can't be set to true in conjunction with setti=
ng the<br>
&gt; + * I915_CONTEXT_PARAM_BANNABLE flag to false. Creation example:<br>
&gt; + *<br>
&gt; + * .. code-block:: C<br>
&gt; + *<br>
&gt; + *&nbsp;&nbsp; struct drm_i915_gem_context_create_ext_setparam p_prot=
ected =3D {<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .base =
=3D {<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D I915_CONTEXT_CREATE_EXT=
_SETPARAM,<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .param=
 =3D {<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .param =3D I915_CONTEXT_PARAM_PRO=
TECTED_CONTENT,<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .value =3D 1,<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + *&nbsp;&nbsp; };<br>
&gt; + *&nbsp;&nbsp; struct drm_i915_gem_context_create_ext_setparam p_nore=
cover =3D {<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .base =
=3D {<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D I915_CONTEXT_CREATE_EXT=
_SETPARAM,<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .next_extension =3D to_user_point=
er(&amp;p_protected),<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .param=
 =3D {<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .param =3D I915_CONTEXT_PARAM_REC=
OVERABLE,<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .value =3D 0,<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + *&nbsp;&nbsp; };<br>
&gt; + *&nbsp;&nbsp; struct drm_i915_gem_context_create_ext create =3D {<br=
>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flags=
 =3D I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .exten=
sions =3D to_user_pointer(&amp;p_norecover);<br>
&gt; + *&nbsp;&nbsp; };<br>
&gt; + *<br>
&gt; + *&nbsp;&nbsp; ctx_id =3D gem_context_create_ext(drm_fd, &amp;create)=
;<br>
&gt; + *<br>
&gt; + * In addition to the normal failure cases, setting this flag during =
context<br>
&gt; + * creation can result in the following errors:<br>
&gt; + *<br>
&gt; + * -ENODEV: feature not available<br>
&gt; + * -EPERM: trying to mark a recoverable or not bannable context as pr=
otected<br>
&gt; + */<br>
&gt; +#define I915_CONTEXT_PARAM_PROTECTED_CONTENT&nbsp;&nbsp;&nbsp; 0xd<br=
>
&gt;&nbsp; /* Must be kept compact -- no holes and well documented */<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 value;<br>
&gt; @@ -2931,8 +2980,12 @@ struct drm_i915_gem_create_ext {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * For I915_GEM_CREATE_=
EXT_MEMORY_REGIONS usage see<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * struct drm_i915_gem_=
create_ext_memory_regions.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * For I915_GEM_CREATE_EXT_PROTECTED_CO=
NTENT usage see<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * struct drm_i915_gem_create_ext_prote=
cted_content.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp; #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0<br>
&gt; +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 extensions;<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt; @@ -2990,6 +3043,47 @@ struct drm_i915_gem_create_ext_memory_regions {=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 regions;<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt; +/**<br>
&gt; + * struct drm_i915_gem_create_ext_protected_content - The<br>
&gt; + * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.<br>
&gt; + *<br>
&gt; + * If this extension is provided, buffer contents are expected to be =
protected<br>
&gt; + * by PXP encryption and require decryption for scan out and processi=
ng. This<br>
&gt; + * is only possible on platforms that have PXP enabled, on all other =
scenarios<br>
&gt; + * using this extension will cause the ioctl to fail and return -ENOD=
EV. The<br>
&gt; + * flags parameter is reserved for future expansion and must currentl=
y be set<br>
&gt; + * to zero.<br>
&gt; + *<br>
&gt; + * The buffer contents are considered invalid after a PXP session tea=
rdown.<br>
&gt; + *<br>
&gt; + * The encryption is guaranteed to be processed correctly only if the=
 object<br>
&gt; + * is submitted with a context created using the<br>
&gt; + * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable e=
xtra checks<br>
&gt; + * at submission time on the validity of the objects involved.<br>
&gt; + *<br>
&gt; + * Below is an example on how to create a protected object:<br>
&gt; + *<br>
&gt; + * .. code-block:: C<br>
&gt; + *<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_i915_gem_create_ext_prote=
cted_content protected_ext =3D {<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; .base =3D { .name =3D I915_GEM_CREATE_EXT_PROTECTED_CONTENT },<=
br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; .flags =3D 0,<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_i915_gem_create_ext creat=
e_ext =3D {<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; .size =3D PAGE_SIZE,<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; .extensions =3D (uintptr_t)&amp;protected_ext,<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; + *<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err =3D ioctl(fd, DRM_IOCTL_I915=
_GEM_CREATE_EXT, &amp;create_ext);<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err) ...<br>
&gt; + */<br>
&gt; +struct drm_i915_gem_create_ext_protected_content {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /** @base: Extension link. See struct i915_u=
ser_extension. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct i915_user_extension base;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /** @flags: reserved for future usage, curre=
ntly MBZ */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; __u32 flags;<br>
&gt; +};<br>
&gt; +<br>
&gt;&nbsp; /* ID of the protected content session managed by i915 when PXP =
is active */<br>
&gt;&nbsp; #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf<br>
&gt;&nbsp; <br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB3784DC5B66156417CA223EC48AAF9BYAPR11MB3784namp_--
