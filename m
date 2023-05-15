Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C013710E278
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 20:23:12 +0000 (UTC)
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 15 May 2023 20:23:08 +0000
Message-ID: <BYAPR11MB2567ECD38D740E324C2EACCA9A789@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230512175108.1171586-1-fei.yang@intel.com>
 <20230512175108.1171586-2-fei.yang@intel.com>
 <4e39db9d-61ff-a5d1-6b68-d1f25e020d02@linux.intel.com>
In-Reply-To: <4e39db9d-61ff-a5d1-6b68-d1f25e020d02@linux.intel.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567ECD38D740E324C2EACCA9A789BYAPR11MB2567namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 1/1] test/gem_create: exercise
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

--_000_BYAPR11MB2567ECD38D740E324C2EACCA9A789BYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> On 12/05/2023 18:51, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> Gem_create uAPI has been extended with capability of setting PAT index.
>> Add a test case to exercise this new extension.
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>>   lib/i915/i915_drm_local.h | 34 ++++++++++++++++++++++++++++++
>>   tests/i915/gem_create.c   | 44 +++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 78 insertions(+)
>>
>> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
>> index af017650..35929a0c 100644
>> --- a/lib/i915/i915_drm_local.h
>> +++ b/lib/i915/i915_drm_local.h
>> @@ -26,6 +26,40 @@ extern "C" {
>>   #define DRM_I915_PERF_PROP_OA_ENGINE_CLASS 9
>>   #define DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE      10
>>
>> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>> +
>> +/**
>> + * struct drm_i915_gem_create_ext_set_pat - The
>> + * I915_GEM_CREATE_EXT_SET_PAT extension.
>> + *
>> + * If this extension is provided, the specified caching policy (PAT
>> +index) is
>> + * applied to the buffer object.
>> + *
>> + * Below is an example on how to create an object with specific caching=
 policy:
>> + *
>> + * .. code-block:: C
>> + *
>> + *  struct drm_i915_gem_create_ext_set_pat set_pat_ext =3D {
>> + *          .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>> + *          .pat_index =3D 0,
>> + *  };
>> + *  struct drm_i915_gem_create_ext create_ext =3D {
>> + *          .size =3D PAGE_SIZE,
>> + *          .extensions =3D (uintptr_t)&set_pat_ext,
>> + *  };
>> + *
>> + *  int err =3D ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
>> + *  if (err) ...
>> + */
>> +struct drm_i915_gem_create_ext_set_pat {
>> +    /** @base: Extension link. See struct i915_user_extension. */
>> +    struct i915_user_extension base;
>> +    /** @pat_index: PAT index to be set */
>> +    __u32 pat_index;
>> +    /** @rsvd: reserved for future use */
>> +    __u32 rsvd;
>> +};
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c index
>> c719ab6c..20c71afb 100644
>> --- a/tests/i915/gem_create.c
>> +++ b/tests/i915/gem_create.c
>> @@ -537,6 +537,45 @@ static void create_ext_placement_each(int fd)
>>      free(regions);
>>   }
>>
>> +static void create_ext_set_pat(int fd) {
>> +    struct drm_i915_gem_create_ext_set_pat setparam_pat =3D {
>> +            .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>> +            .pat_index =3D 0,
>> +    };
>> +    struct drm_i915_gem_create_ext_set_pat setparam_inv_pat =3D {
>> +            .base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },
>> +            .pat_index =3D 65,
>> +    };
>> +    struct drm_i915_gem_caching arg;
>> +    uint64_t size;
>> +    uint32_t handle;
>> +    int ret;
>> +
>> +    size =3D PAGE_SIZE;
>> +
>> +    ret =3D __gem_create_ext(fd, &size, 0, &handle, &setparam_pat.base)=
;
>> +
>> +    /* Returning -EFAULT indicates set_pat extension is not supported *=
/
>> +    if (ret =3D=3D -EFAULT)
>> +            igt_info("I915_GEM_CREATE_EXT_SET_PAT is not supported\n");
>
> Is this correct? EFAULT should be data access issues while unsupported ex=
tensions should be EINVAL.

Wil correct.

>> +    igt_assert(ret =3D=3D 0);
>
> Extension not supported should be a skip I would say.

Will replace igt_info with igt_skip.

> EFAULT test is then something else, ie. hitting this path from the kernel=
 ioctl handler:
>
> ext_set_pat()
> ...
> +     if (copy_from_user(&ext, base, sizeof(ext)))
> +             return -EFAULT;
>
>> +
>> +    /* {set|get}_caching ioctl should fail for objects created with set=
_pat */
>> +    igt_assert(__gem_set_caching(fd, handle, 1) =3D=3D -EOPNOTSUPP);
>
> Easy to test get too as the comment suggests?

The ioctl right below is exercising get_caching ioctl.
I couldn't use gem_get_caching() because it overwrites errno.

> Regards,
>
> Tvrtko
>
>> +
>> +    memset(&arg, 0, sizeof(arg));
>> +    arg.handle =3D handle;
>> +    igt_assert(ioctl(fd, DRM_IOCTL_I915_GEM_GET_CACHING, &arg) < 0 &&
>> +               errno =3D=3D EOPNOTSUPP);
>> +
>> +    /* gem_create should fail with -EINVAL if invalid pat index specifi=
ed */
>> +    igt_assert_eq(__gem_create_ext(fd, &size, 0, &handle, &setparam_inv=
_pat.base),
>> +                  -EINVAL);
>> +
>> +    gem_close(fd, handle);
>> +}
>> +
>>   static bool supports_needs_cpu_access(int fd)
>>   {
>>      struct drm_i915_gem_memory_class_instance regions[] =3D { @@ -897,6
>> +936,11 @@ igt_main
>>      igt_subtest("create-ext-placement-all")
>>              create_ext_placement_all(fd);
>>
>> +    igt_describe("Create objects with specific cache setting"
>> +                 " create-ext.");
>> +    igt_subtest("create-ext-set-pat")
>> +                create_ext_set_pat(fd);
>> +
>>      igt_describe("Verify the basic functionally and expected ABI contra=
ct around I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS");
>>      igt_subtest("create-ext-cpu-access-sanity-check") {
>>              igt_require(supports_needs_cpu_access(fd));

--_000_BYAPR11MB2567ECD38D740E324C2EACCA9A789BYAPR11MB2567namp_
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
tPasted1">
&gt; On 12/05/2023 18:51, fei.yang@intel.com wrote:
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
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; lib/i915/i915_drm_local.h | 3=
4 ++++++++++++++++++++++++++++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; tests/i915/gem_create.c &nbsp=
; | 44 +++++++++++++++++++++++++++++++++++++++</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; 2 files changed, 78 insertion=
s(+)</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; diff --git a/lib/i915/i915_drm_local=
.h b/lib/i915/i915_drm_local.h</div>
<div class=3D"ContentPasted0">&gt;&gt; index af017650..35929a0c 100644</div=
>
<div class=3D"ContentPasted0">&gt;&gt; --- a/lib/i915/i915_drm_local.h</div=
>
<div class=3D"ContentPasted0">&gt;&gt; +++ b/lib/i915/i915_drm_local.h</div=
>
<div class=3D"ContentPasted0">&gt;&gt; @@ -26,6 +26,40 @@ extern &quot;C&qu=
ot; {</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define DRM_I915_PERF_PROP_OA=
_ENGINE_CLASS 9</div>
<div class=3D"ContentPasted0">&gt;&gt; &nbsp; #define DRM_I915_PERF_PROP_OA=
_ENGINE_INSTANCE &nbsp; &nbsp; &nbsp;10</div>
<div class=3D"ContentPasted0">&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt; +#define I915_GEM_CREATE_EXT_SET_PAT=
 2</div>
<div class=3D"ContentPasted0">&gt;&gt; +</div>
<div class=3D"ContentPasted0">&gt;&gt; +/**</div>
<div class=3D"ContentPasted0">&gt;&gt; + * struct drm_i915_gem_create_ext_s=
et_pat - The</div>
<div class=3D"ContentPasted0">&gt;&gt; + * I915_GEM_CREATE_EXT_SET_PAT exte=
nsion.</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * If this extension is provided, t=
he specified caching policy (PAT</div>
<div class=3D"ContentPasted0">&gt;&gt; +index) is</div>
<div class=3D"ContentPasted0">&gt;&gt; + * applied to the buffer object.</d=
iv>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * Below is an example on how to cr=
eate an object with specific caching policy:</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * .. code-block:: C</div>
<div class=3D"ContentPasted0">&gt;&gt; + *</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp;struct drm_i915_gem_create=
_ext_set_pat set_pat_ext =3D {</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;.base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;.pat_index =3D 0,</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp;};</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp;struct drm_i915_gem_create=
_ext create_ext =3D {</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;.size =3D PAGE_SIZE,</div>
<div class=3D"ContentPasted0">&gt;&gt; + * &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;.extensions =3D (uintptr_t)&amp;set_pat_ext,</div>
&gt;&gt; + * &nbsp;};
<div class=3D"ContentPasted1">&gt;&gt; + *</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp;int err =3D ioctl(fd, DRM_=
IOCTL_I915_GEM_CREATE_EXT, &amp;create_ext);</div>
<div class=3D"ContentPasted1">&gt;&gt; + * &nbsp;if (err) ...</div>
<div class=3D"ContentPasted1">&gt;&gt; + */</div>
<div class=3D"ContentPasted1">&gt;&gt; +struct drm_i915_gem_create_ext_set_=
pat {</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;/** @base: Extension =
link. See struct i915_user_extension. */</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;struct i915_user_exte=
nsion base;</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;/** @pat_index: PAT i=
ndex to be set */</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;__u32 pat_index;</div=
>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;/** @rsvd: reserved f=
or future use */</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;__u32 rsvd;</div>
<div class=3D"ContentPasted1">&gt;&gt; +};</div>
<div class=3D"ContentPasted1">&gt;&gt; +</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; #if defined(__cplusplus)</div=
>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; #endif</div>
<div class=3D"ContentPasted1">&gt;&gt; diff --git a/tests/i915/gem_create.c=
 b/tests/i915/gem_create.c index</div>
<div class=3D"ContentPasted1">&gt;&gt; c719ab6c..20c71afb 100644</div>
<div class=3D"ContentPasted1">&gt;&gt; --- a/tests/i915/gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; +++ b/tests/i915/gem_create.c</div>
<div class=3D"ContentPasted1">&gt;&gt; @@ -537,6 +537,45 @@ static void cre=
ate_ext_placement_each(int fd)</div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; &nbsp; &nbsp;free(regions);</=
div>
<div class=3D"ContentPasted1">&gt;&gt; &nbsp; }</div>
<div class=3D"ContentPasted1">&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt; +static void create_ext_set_pat(int =
fd) {</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;struct drm_i915_gem_c=
reate_ext_set_pat setparam_pat =3D {</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;.base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;.pat_index =3D 0,</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;struct drm_i915_gem_c=
reate_ext_set_pat setparam_inv_pat =3D {</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;.base =3D { .name =3D I915_GEM_CREATE_EXT_SET_PAT },</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;.pat_index =3D 65,</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;};</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;struct drm_i915_gem_c=
aching arg;</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;uint64_t size;</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;uint32_t handle;</div=
>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;int ret;</div>
<div class=3D"ContentPasted1">&gt;&gt; +</div>
<div class=3D"ContentPasted1">&gt;&gt; + &nbsp; &nbsp;size =3D PAGE_SIZE;</=
div>
<div class=3D"ContentPasted1">&gt;&gt; +</div>
<div class=3D"ContentPasted1 ContentPasted2 ContentPasted3">&gt;&gt; + &nbs=
p; &nbsp;ret =3D __gem_create_ext(fd, &amp;size, 0, &amp;handle, &amp;setpa=
ram_pat.base);
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp;/* Returning -EFAULT =
indicates set_pat extension is not supported */</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp;if (ret =3D=3D -EFAUL=
T)</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;igt_info(&quot;I915_GEM_CREATE_EXT_SET_PAT is not supported\n&quot;)=
;</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; Is this correct? EFAULT should be data a=
ccess issues while unsupported extensions should be EINVAL.</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">Wil correct.</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp;igt_assert(ret =3D=3D=
 0);</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; Extension not supported should be a skip=
 I would say.</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">Will replace igt_info with igt_skip.</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">&gt; EFAULT test is then something else, ie. =
hitting this path from the kernel ioctl handler:</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; ext_set_pat()</div>
<div class=3D"ContentPasted2">&gt; ...</div>
<div class=3D"ContentPasted2">&gt; + &nbsp; &nbsp; if (copy_from_user(&amp;=
ext, base, sizeof(ext)))</div>
<div class=3D"ContentPasted2">&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; return -EFAULT;</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp;/* {set|get}_caching =
ioctl should fail for objects created with set_pat */</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp;igt_assert(__gem_set_=
caching(fd, handle, 1) =3D=3D -EOPNOTSUPP);</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; Easy to test get too as the comment sugg=
ests?</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">The ioctl right below is exercising get_cachi=
ng ioctl.</div>
<div class=3D"ContentPasted2">I couldn't use gem_get_caching() because it o=
verwrites errno.</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">&gt; Regards,</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; Tvrtko</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp;memset(&amp;arg, 0, s=
izeof(arg));</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp;arg.handle =3D handle=
;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp;igt_assert(ioctl(fd, =
DRM_IOCTL_I915_GEM_GET_CACHING, &amp;arg) &lt; 0 &amp;&amp;</div>
<div class=3D"ContentPasted2">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; errno =3D=3D EOPNOTSUPP);</div>
<div class=3D"ContentPasted2">&gt;&gt; +</div>
&gt;&gt; + &nbsp; &nbsp;/* gem_create should fail with -EINVAL if invalid p=
at index specified */
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp;igt_assert_eq(__gem_c=
reate_ext(fd, &amp;size, 0, &amp;handle, &amp;setparam_inv_pat.base),</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;-EINVAL);</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp;gem_close(fd, handle)=
;</div>
<div class=3D"ContentPasted3">&gt;&gt; +}</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; static bool supports_needs_cp=
u_access(int fd)</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; {</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp;struct drm_i915_=
gem_memory_class_instance regions[] =3D { @@ -897,6</div>
<div class=3D"ContentPasted3">&gt;&gt; +936,11 @@ igt_main</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp;igt_subtest(&quo=
t;create-ext-placement-all&quot;)</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;create_ext_placement_all(fd);</div>
<div class=3D"ContentPasted3">&gt;&gt;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp;igt_describe(&quot;Cr=
eate objects with specific cache setting&quot;</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &quot; create-ext.&quot;);</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp;igt_subtest(&quot;cre=
ate-ext-set-pat&quot;)</div>
<div class=3D"ContentPasted3">&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;create_ext_set_pat(fd);</div>
<div class=3D"ContentPasted3">&gt;&gt; +</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp;igt_describe(&qu=
ot;Verify the basic functionally and expected ABI contract around I915_GEM_=
CREATE_EXT_FLAG_NEEDS_CPU_ACCESS&quot;);</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp;igt_subtest(&quo=
t;create-ext-cpu-access-sanity-check&quot;) {</div>
<div class=3D"ContentPasted3">&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;igt_require(supports_needs_cpu_access(fd));</div>
</div>
</div>
</body>
</html>

--_000_BYAPR11MB2567ECD38D740E324C2EACCA9A789BYAPR11MB2567namp_--
