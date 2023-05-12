Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0626910E23B
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 18:15:51 +0000 (UTC)
From: "Yang, Fei" <fei.yang@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 12 May 2023 18:15:29 +0000
Message-ID: <BYAPR11MB2567A0FC85928DD0745728DC9A759@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230502051921.2183579-1-fei.yang@intel.com>
 <20230502051921.2183579-2-fei.yang@intel.com>
 <20230512121041.z5mw4qasnbw6de6h@kamilkon-desk1>
In-Reply-To: <20230512121041.z5mw4qasnbw6de6h@kamilkon-desk1>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567A0FC85928DD0745728DC9A759BYAPR11MB2567namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 1/1] test/gem_create: exercise
 gem_create_ext_set_pat
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

--_000_BYAPR11MB2567A0FC85928DD0745728DC9A759BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 2023-05-01 at 22:19:21 -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> Gem_create uAPI has been extended with capability of setting PAT index.
>> Add a test case to exercise this new extension.
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>>  include/drm-uapi/i915_drm.h | 33 ++++++++++++++++++++++++++++
>
> Please use lib/i915/i915_drm_local.h

Updated in v3, https://patchwork.freedesktop.org/series/117695/

> until this land in drm-tip ./include/uapi/drm/i915_drm.h
>
> After it will land there send separate patch to sync uapi.

Will do.

> Regards,
> Kamil
>
>>  tests/i915/gem_create.c     | 44 +++++++++++++++++++++++++++++++++++++
>>  2 files changed, 77 insertions(+)
>>
>> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
>> index a0876ee4..1fdaa372 100644
>> --- a/include/drm-uapi/i915_drm.h
>> +++ b/include/drm-uapi/i915_drm.h
>> @@ -3499,6 +3499,7 @@ struct drm_i915_gem_create_ext {
>>         */
>>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>>        __u64 extensions;
>>  };
>>
>> @@ -3616,6 +3617,38 @@ struct drm_i915_gem_create_ext_protected_content =
{
>>  /* ID of the protected content session managed by i915 when PXP is acti=
ve */
>>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>
>> +/**
>> + * struct drm_i915_gem_create_ext_set_pat - The
>> + * I915_GEM_CREATE_EXT_SET_PAT extension.
>> + *
>> + * If this extension is provided, the specified caching policy (PAT ind=
ex) is
>> + * applied to the buffer object.
>> + *
>> + * Below is an example on how to create an object with specific caching=
 policy:
>> + *
>> + * .. code-block:: C
>> + *
>> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext =3D {
>> + *              .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>> + *              .pat_index =3D 0,
>> + *      };
>> + *      struct drm_i915_gem_create_ext create_ext =3D {
>> + *              .size =3D PAGE_SIZE,
>> + *              .extensions =3D (uintptr_t)&set_pat_ext,
>> + *      };
>> + *
>> + *      int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ex=
t);
>> + *      if (err) ...
>> + */
>> +struct drm_i915_gem_create_ext_set_pat {
>> +     /** @base: Extension link. See struct i915_user_extension. */
>> +     struct i915_user_extension base;
>> +     /** @pat_index: PAT index to be set */
>> +     __u32 pat_index;
>> +     /** @rsvd: reserved for future use */
>> +     __u32 rsvd;
>> +};
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
>> index c719ab6c..20c71afb 100644
>> --- a/tests/i915/gem_create.c
>> +++ b/tests/i915/gem_create.c
>> @@ -537,6 +537,45 @@ static void create_ext_placement_each(int fd)
>>        free(regions);
>>  }
>>
>> +static void create_ext_set_pat(int fd)
>> +{
>> +     struct drm_i915_gem_create_ext_set_pat setparam_pat =3D {
>> +             .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>> +             .pat_index =3D 0,
>> +     };
>> +     struct drm_i915_gem_create_ext_set_pat setparam_inv_pat =3D {
>> +             .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>> +             .pat_index =3D 65,
>> +     };
>> +     struct drm_i915_gem_caching arg;
>> +     uint64_t size;
>> +     uint32_t handle;
>> +     int ret;
>> +
>> +     size =3D PAGE_SIZE;
>> +
>> +     ret =3D __gem_create_ext(fd, &size, 0, &handle, &setparam_pat.base=
);
>> +
>> +     /* Returning -EFAULT indicates set_pat extension is not supported =
*/
>> +     if (ret =3D=3D -EFAULT)
>> +             igt_info("I915_GEM_CREATE_EXT_SET_PAT is not supported\n")=
;
>> +     igt_assert(ret =3D=3D 0);
>> +
>> +     /* {set|get}_caching ioctl should fail for objects created with se=
t_pat */
>> +     igt_assert(__gem_set_caching(fd, handle, 1) =3D=3D -EOPNOTSUPP);
>> +
>> +     memset(&arg, 0, sizeof(arg));
>> +     arg.handle =3D handle;
>> +     igt_assert(ioctl(fd, DRM_IOCTL_I915_GEM_GET_CACHING, &arg) < 0 &&
>> +                errno =3D=3D EOPNOTSUPP);
>> +
>> +     /* gem_create should fail with -EINVAL if invalid pat index specif=
ied */
>> +     igt_assert_eq(__gem_create_ext(fd, &size, 0, &handle, &setparam_in=
v_pat.base),
>> +                   -EINVAL);
>> +
>> +     gem_close(fd, handle);
>> +}
>> +
>>  static bool supports_needs_cpu_access(int fd)
>>  {
>>        struct drm_i915_gem_memory_class_instance regions[] =3D {
>> @@ -897,6 +936,11 @@ igt_main
>>        igt_subtest("create-ext-placement-all")
>>                create_ext_placement_all(fd);
>>
>> +     igt_describe("Create objects with specific cache setting"
>> +                  " create-ext.");
>> +     igt_subtest("create-ext-set-pat")
>> +                 create_ext_set_pat(fd);
>> +
>>        igt_describe("Verify the basic functionally and expected ABI cont=
ract around I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS");
>>        igt_subtest("create-ext-cpu-access-sanity-check") {
>>                igt_require(supports_needs_cpu_access(fd));
>> --
>> 2.25.1


--_000_BYAPR11MB2567A0FC85928DD0745728DC9A759BYAPR11MB2567namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3">
&gt; On 2023-05-01 at 22:19:21 -0700, fei.yang@intel.com wrote:
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Gem_create uAPI has been extended wi=
th capability of setting PAT index.</div>
<div class=3D"ContentPasted0">&gt;&gt; Add a test case to exercise this new=
 extension.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Signed-off-by: Fei Yang &lt;fei.yang=
@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; ---</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;include/drm-uapi/i915_drm.h | =
33 ++++++++++++++++++++++++++++</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Please use lib/i915/i915_drm_local.h</di=
v>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Updated in v3, https://patchwork.freedesktop.=
org/series/117695/</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; until this land in drm-tip ./include/uap=
i/drm/i915_drm.h</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; After it will land there send separate p=
atch to sync uapi.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Will do.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; Regards,</div>
<div class=3D"ContentPasted0">&gt; Kamil</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;tests/i915/gem_create.c &nbsp;=
 &nbsp; | 44 +++++++++++++++++++++++++++++++++++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;2 files changed, 77 insertions=
(+)</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/include/drm-uapi/i915_d=
rm.h b/include/drm-uapi/i915_drm.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index a0876ee4..1fdaa372 100644</div=
>
<div class=3D"ContentPasted0">&gt;&gt; --- a/include/drm-uapi/i915_drm.h</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/include/drm-uapi/i915_drm.h</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; @@ -3499,6 +3499,7 @@ struct drm_i91=
5_gem_create_ext {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;#define I915_GEM_CREATE_EXT_ME=
MORY_REGIONS 0</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;#define I915_GEM_CREATE_EXT_PR=
OTECTED_CONTENT 1</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define I915_GEM_CREATE_EXT_SET_PAT=
 2</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;__u64 ext=
ensions;</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;};</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; @@ -3616,6 +3617,38 @@ struct drm_i9=
15_gem_create_ext_protected_content {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;/* ID of the protected content=
 session managed by i915 when PXP is active */</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;#define I915_PROTECTED_CONTENT=
_DEFAULT_SESSION 0xf</div>
&gt;&gt;
<div class=3D"ContentPasted1">&gt;&gt; +/**</div>
<div class=3D"ContentPasted1">&gt;&gt; + * struct drm_i915_gem_create_ext_s=
et_pat - The</div>
<div class=3D"ContentPasted1">&gt;&gt; + * I915_GEM_CREATE_EXT_SET_PAT exte=
nsion.</div>
<div class=3D"ContentPasted1">&gt;&gt; + *</div>
<div class=3D"ContentPasted1">&gt;&gt; + * If this extension is provided, t=
he specified caching policy (PAT index) is</div>
<div class=3D"ContentPasted1">&gt;&gt; + * applied to the buffer object.</d=
iv>
<div class=3D"ContentPasted1">&gt;&gt; + *</div>
<div class=3D"ContentPasted1">&gt;&gt; + * Below is an example on how to cr=
eate an object with specific caching policy:</div>
<div class=3D"ContentPasted1">&gt;&gt; + *</div>
<div class=3D"ContentPasted1">&gt;&gt; + * .. code-block:: C</div>
<div class=3D"ContentPasted1">&gt;&gt; + *</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct drm_i=
915_gem_create_ext_set_pat set_pat_ext =3D {</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.pat_index =3D 0,</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp;struct drm_i=
915_gem_create_ext create_ext =3D {</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.size =3D PAGE_SIZE,</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;.extensions =3D (uintptr_t)&amp;set_pat_ext,</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted1">&gt;&gt; + *</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp;int err =3D =
ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &amp;create_ext);</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp;if (err) ...=
</div>
<div class=3D"ContentPasted1">&gt;&gt; + */</div>
<div class=3D"ContentPasted1">&gt;&gt; +struct drm_i915_gem_create_ext_set_=
pat {</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; /** @base: Extension=
 link. See struct i915_user_extension. */</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; struct i915_user_ext=
ension base;</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; /** @pat_index: PAT =
index to be set */</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; __u32 pat_index;</di=
v>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; /** @rsvd: reserved =
for future use */</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; __u32 rsvd;</div>
<div class=3D"ContentPasted1">&gt;&gt; +};</div>
<div class=3D"ContentPasted1">&gt;&gt; +</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp;#if defined(__cplusplus)</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp;}</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp;#endif</div>
<div class=3D"ContentPasted1">&gt;&gt; diff --git a/tests/i915/gem_create.c=
 b/tests/i915/gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; index c719ab6c..20c71afb 100644</div=
>
<div class=3D"ContentPasted1">&gt;&gt; --- a/tests/i915/gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; +++ b/tests/i915/gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; @@ -537,6 +537,45 @@ static void cre=
ate_ext_placement_each(int fd)</div>
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;free(regions);
<div class=3D"ContentPasted2">&gt;&gt; &nbsp;}</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt; +static void create_ext_set_pat(int =
fd)</div>
<div class=3D"ContentPasted2">&gt;&gt; +{</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; struct drm_i915_gem_=
create_ext_set_pat setparam_pat =3D {</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .pat_index =3D 0,</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; };</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; struct drm_i915_gem_=
create_ext_set_pat setparam_inv_pat =3D {</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; .pat_index =3D 65,</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; };</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; struct drm_i915_gem_=
caching arg;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; uint64_t size;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; uint32_t handle;</di=
v>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; int ret;</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; size =3D PAGE_SIZE;<=
/div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; ret =3D __gem_create=
_ext(fd, &amp;size, 0, &amp;handle, &amp;setparam_pat.base);</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; /* Returning -EFAULT=
 indicates set_pat extension is not supported */</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; if (ret =3D=3D -EFAU=
LT)</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; igt_info(&quot;I915_GEM_CREATE_EXT_SET_PAT is not supported\n&quot;=
);</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; igt_assert(ret =3D=
=3D 0);</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; /* {set|get}_caching=
 ioctl should fail for objects created with set_pat */</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; igt_assert(__gem_set=
_caching(fd, handle, 1) =3D=3D -EOPNOTSUPP);</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; memset(&amp;arg, 0, =
sizeof(arg));</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; arg.handle =3D handl=
e;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; igt_assert(ioctl(fd,=
 DRM_IOCTL_I915_GEM_GET_CACHING, &amp;arg) &lt; 0 &amp;&amp;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;errno =3D=3D EOPNOTSUPP);</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; /* gem_create should=
 fail with -EINVAL if invalid pat index specified */</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; igt_assert_eq(__gem_=
create_ext(fd, &amp;size, 0, &amp;handle, &amp;setparam_inv_pat.base),</div=
>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; -EINVAL);</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; gem_close(fd, handle=
);</div>
<div class=3D"ContentPasted2">&gt;&gt; +}</div>
&gt;&gt; +
<div class=3D"ContentPasted3">&gt;&gt; &nbsp;static bool supports_needs_cpu=
_access(int fd)</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp;{</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_i915_gem_memory_class_instance regions[] =3D {</div>
<div class=3D"ContentPasted3">&gt;&gt; @@ -897,6 +936,11 @@ igt_main</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;igt_subte=
st(&quot;create-ext-placement-all&quot;)</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;create_ext_placement_all(fd);</div>
<div class=3D"ContentPasted3">&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; igt_describe(&quot;C=
reate objects with specific cache setting&quot;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;&quot; create-ext.&quot;);</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; igt_subtest(&quot;cr=
eate-ext-set-pat&quot;)</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; create_ext_set_pat(fd);</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;igt_descr=
ibe(&quot;Verify the basic functionally and expected ABI contract around I9=
15_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS&quot;);</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;igt_subte=
st(&quot;create-ext-cpu-access-sanity-check&quot;) {</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;igt_require(supports_needs_cpu_access(fd));</div>
<div class=3D"ContentPasted3">&gt;&gt; --</div>
<div class=3D"ContentPasted3">&gt;&gt; 2.25.1</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567A0FC85928DD0745728DC9A759BYAPR11MB2567namp_--
