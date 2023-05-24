Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B5510E095
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 19:38:22 +0000 (UTC)
From: "Yang, Fei" <fei.yang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Date: Wed, 24 May 2023 19:37:51 +0000
Message-ID: <BYAPR11MB2567BAB296B37CA4B65A2FDB9A419@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230524155610.360748-1-fei.yang@intel.com>
 <20230524155610.360748-2-fei.yang@intel.com>
 <ZG5SMFirVWSDgWEa@ashyti-mobl2.lan>
In-Reply-To: <ZG5SMFirVWSDgWEa@ashyti-mobl2.lan>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567BAB296B37CA4B65A2FDB9A419BYAPR11MB2567namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v5 1/1] test/gem_create: exercise
 gem_create_ext_set_pat
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_BYAPR11MB2567BAB296B37CA4B65A2FDB9A419BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Hi Fei,
>
> On Wed, May 24, 2023 at 08:56:10AM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> Gem_create uAPI has been extended with capability of setting PAT index.
>> Add a test case to exercise it.
>
> As we discussed offline, can we:
>
> /PAT/PAT (Page Attribute Table)/

I did explain "PAT is a page attribute" below. If that's not good enough I
have no objection to add what you proposed above.

> But I think Kamil can fix this before pushing it.
>
>> PAT index is a page attribute that gets programmed into Page Table
>> Entry (PTE) for caching policy control. Please refer to kernel patch
>> for implementation details.
>>
>> https://patchwork.freedesktop.org/series/116870/
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>>  lib/i915/i915_drm_local.h | 34 +++++++++++++++++++++++
>>  tests/i915/gem_create.c   | 58 +++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 92 insertions(+)
>>
>> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
>> index bb2ebef3..0f47578c 100644
>> --- a/lib/i915/i915_drm_local.h
>> +++ b/lib/i915/i915_drm_local.h
>> @@ -41,6 +41,40 @@ extern "C" {
>>  #define __I915_PMU_RC6_RESIDENCY(gt)         ___I915_PMU_OTHER(gt, 3)
>>  #define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)        ___I915_PMU_OTHER(=
gt, 4)
>>
>> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>> +
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
>> + *   struct drm_i915_gem_create_ext_set_pat set_pat_ext =3D {
>> + *           .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>> + *           .pat_index =3D 0,
>> + *   };
>> + *   struct drm_i915_gem_create_ext create_ext =3D {
>> + *           .size =3D PAGE_SIZE,
>> + *           .extensions =3D (uintptr_t)&set_pat_ext,
>> + *   };
>> + *
>> + *   int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
>> + *   if (err) ...
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
>> index fc991894..2e0c0ab9 100644
>> --- a/tests/i915/gem_create.c
>> +++ b/tests/i915/gem_create.c
>> @@ -587,6 +587,60 @@ static void create_ext_placement_each(int fd)
>>        free(regions);
>>  }
>>
>> +/**
>> +  * TEST: GEM create uAPI
>> +  * Category: Infrastructure
>> +  * Description: Tests the DRM_IOCTL_I915_GEM_CREATE_EXT ioctl.
>> +  * Feature: core
>> +  * Functionality: Create GEM object with specific PAT index
>> +  * Run type: BAT
>> +  * Sub-category: i915
>> +  * Test category: GEM_Legacy
>> +  *
>> +  * SUBTEST: create-ext-set-pat
>> +  */
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
>
> Tvrtko was talking about a -EFAULT path that can come only from
> the use extention, unless I missed any other path.
>
> I'm OK if we skip it as it would triggered by setting:
>
>        "name =3D <something_random>"
>
> right?

The point is that we want specifically check if a failure here is due to
kernel not up-to-date. Otherwise any none-zero return should be
treated as failure.

> In any case:
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
> Andi
>
>> +     /*
>> +      * With a valid PAT index specified, returning -EINVAL here
>> +      * indicates set_pat extension is not supported
>> +      */
>> +     if (ret =3D=3D -EINVAL)
>> +             igt_skip("I915_GEM_CREATE_EXT_SET_PAT is not supported\n")=
;
>> +     igt_assert(ret =3D=3D 0);
>> +
>> +     /* {set|get}_caching ioctl should fail for objects created with se=
t_pat */
>> +     igt_assert_eq(__gem_set_caching(fd, handle, 1), -EOPNOTSUPP);
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
>> @@ -947,6 +1001,10 @@ igt_main
>>        igt_subtest("create-ext-placement-all")
>>                create_ext_placement_all(fd);
>>
>> +     igt_describe("Validate basic creation of objects with PAT cache se=
tting.");
>> +     igt_subtest("create-ext-set-pat")
>> +             create_ext_set_pat(fd);
>> +
>>        igt_describe("Verify the basic functionally and expected ABI cont=
ract around I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS");
>>        igt_subtest("create-ext-cpu-access-sanity-check") {
>>                igt_require(supports_needs_cpu_access(fd));
>> --
>> 2.25.1


--_000_BYAPR11MB2567BAB296B37CA4B65A2FDB9A419BYAPR11MB2567namp_
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
&gt; Hi Fei,
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; On Wed, May 24, 2023 at 08:56:10AM -0700=
, fei.yang@intel.com wrote:</div>
<div class=3D"ContentPasted0">&gt;&gt; From: Fei Yang &lt;fei.yang@intel.co=
m&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Gem_create uAPI has been extended wi=
th capability of setting PAT index.</div>
<div class=3D"ContentPasted0">&gt;&gt; Add a test case to exercise it.</div=
>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; As we discussed offline, can we:</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; /PAT/PAT (Page Attribute Table)/</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">I did explain &quot;PAT is a page attribute&q=
uot; below. If that's not good enough I</div>
<div class=3D"ContentPasted0">have no objection to add what you proposed ab=
ove.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; But I think Kamil can fix this before pu=
shing it.</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; PAT index is a page attribute that g=
ets programmed into Page Table</div>
<div class=3D"ContentPasted0">&gt;&gt; Entry (PTE) for caching policy contr=
ol. Please refer to kernel patch</div>
<div class=3D"ContentPasted0">&gt;&gt; for implementation details.</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; https://patchwork.freedesktop.org/se=
ries/116870/</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; Signed-off-by: Fei Yang &lt;fei.yang=
@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; ---</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;lib/i915/i915_drm_local.h | 34=
 +++++++++++++++++++++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;tests/i915/gem_create.c &nbsp;=
 | 58 +++++++++++++++++++++++++++++++++++++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;2 files changed, 92 insertions=
(+)</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/lib/i915/i915_drm_local=
.h b/lib/i915/i915_drm_local.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index bb2ebef3..0f47578c 100644</div=
>
<div class=3D"ContentPasted0">&gt;&gt; --- a/lib/i915/i915_drm_local.h</div=
>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/lib/i915/i915_drm_local.h</div=
>
<div class=3D"ContentPasted0">&gt;&gt; @@ -41,6 +41,40 @@ extern &quot;C&qu=
ot; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;#define __I915_PMU_RC6_RESIDEN=
CY(gt) &nbsp; &nbsp; &nbsp; &nbsp; ___I915_PMU_OTHER(gt, 3)</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp;#define __I915_PMU_SOFTWARE_GT=
_AWAKE_TIME(gt) &nbsp; &nbsp; &nbsp; &nbsp;___I915_PMU_OTHER(gt, 4)</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define I915_GEM_CREATE_EXT_SET_PAT=
 2</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; +/**</div>
<div class=3D"ContentPasted0">&gt;&gt; + * struct drm_i915_gem_create_ext_s=
et_pat - The</div>
&gt;&gt; + * I915_GEM_CREATE_EXT_SET_PAT extension.
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
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; struct drm_i915_gem_creat=
e_ext_set_pat set_pat_ext =3D {</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; .pat_index =3D 0,</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; };</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; struct drm_i915_gem_creat=
e_ext create_ext =3D {</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; .size =3D PAGE_SIZE,</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; .extensions =3D (uintptr_t)&amp;set_pat_ext,</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; };</div>
<div class=3D"ContentPasted1">&gt;&gt; + *</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; int err =3D ioctl(fd, DRM=
_IOCTL_I915_GEM_CREATE_EXT, &amp;create_ext);</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp; if (err) ...</div>
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
<div class=3D"ContentPasted1">&gt;&gt; index fc991894..2e0c0ab9 100644</div=
>
<div class=3D"ContentPasted1">&gt;&gt; --- a/tests/i915/gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; +++ b/tests/i915/gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; @@ -587,6 +587,60 @@ static void cre=
ate_ext_placement_each(int fd)</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;free(regi=
ons);</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp;}</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
&gt;&gt; +/**
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp;* TEST: GEM create uAPI</div=
>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp;* Category: Infrastructure</=
div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp;* Description: Tests the DRM=
_IOCTL_I915_GEM_CREATE_EXT ioctl.</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp;* Feature: core</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp;* Functionality: Create GEM =
object with specific PAT index</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp;* Run type: BAT</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp;* Sub-category: i915</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp;* Test category: GEM_Legacy<=
/div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp;*</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp;* SUBTEST: create-ext-set-pa=
t</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp;*/</div>
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
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; Tvrtko was talking about a -EFAULT path =
that can come only from</div>
<div class=3D"ContentPasted2">&gt; the use extention, unless I missed any o=
ther path.</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; I'm OK if we skip it as it would trigger=
ed by setting:</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; &nbsp; &nbsp; &nbsp; &nbsp;&quot;name =
=3D &lt;something_random&gt;&quot;</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; right?</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">The point is that we want specifically check =
if a failure here is due to</div>
kernel not up-to-date. Otherwise any none-zero return should be</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2 ContentPasted3 ContentPasted4">
treated as failure.
<div><br class=3D"ContentPasted3">
</div>
<div class=3D"ContentPasted3">&gt; In any case:</div>
<div class=3D"ContentPasted3">&gt;</div>
<div class=3D"ContentPasted3">&gt; Reviewed-by: Andi Shyti &lt;andi.shyti@l=
inux.intel.com&gt;</div>
<div class=3D"ContentPasted3">&gt;</div>
<div class=3D"ContentPasted3">&gt; Andi</div>
<div class=3D"ContentPasted3">&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; /*</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp;* With a valid=
 PAT index specified, returning -EINVAL here</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp;* indicates se=
t_pat extension is not supported</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; if (ret =3D=3D -EINV=
AL)</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; igt_skip(&quot;I915_GEM_CREATE_EXT_SET_PAT is not supported\n&quot;=
);</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; igt_assert(ret =3D=
=3D 0);</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; /* {set|get}_caching=
 ioctl should fail for objects created with set_pat */</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; igt_assert_eq(__gem_=
set_caching(fd, handle, 1), -EOPNOTSUPP);</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; memset(&amp;arg, 0, =
sizeof(arg));</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; arg.handle =3D handl=
e;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; igt_assert(ioctl(fd,=
 DRM_IOCTL_I915_GEM_GET_CACHING, &amp;arg) &lt; 0 &amp;&amp;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;errno =3D=3D EOPNOTSUPP);</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; /* gem_create should=
 fail with -EINVAL if invalid pat index specified */</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; igt_assert_eq(__gem_=
create_ext(fd, &amp;size, 0, &amp;handle, &amp;setparam_inv_pat.base),</div=
>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; -EINVAL);</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; gem_close(fd, handle=
);</div>
<div class=3D"ContentPasted3">&gt;&gt; +}</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp;static bool supports_needs_cpu=
_access(int fd)</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp;{</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;struct dr=
m_i915_gem_memory_class_instance regions[] =3D {</div>
<div class=3D"ContentPasted3">&gt;&gt; @@ -947,6 +1001,10 @@ igt_main</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;igt_subte=
st(&quot;create-ext-placement-all&quot;)</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;create_ext_placement_all(fd);</div>
<div class=3D"ContentPasted3">&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; igt_describe(&quot;V=
alidate basic creation of objects with PAT cache setting.&quot;);</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; igt_subtest(&quot;cr=
eate-ext-set-pat&quot;)</div>
&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; create_ext_set_pat(fd)=
;
<div class=3D"ContentPasted4">&gt;&gt; +</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;igt_descr=
ibe(&quot;Verify the basic functionally and expected ABI contract around I9=
15_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS&quot;);</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;igt_subte=
st(&quot;create-ext-cpu-access-sanity-check&quot;) {</div>
<div class=3D"ContentPasted4">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;igt_require(supports_needs_cpu_access(fd));</div>
<div class=3D"ContentPasted4">&gt;&gt; --</div>
<div class=3D"ContentPasted4">&gt;&gt; 2.25.1</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567BAB296B37CA4B65A2FDB9A419BYAPR11MB2567namp_--
