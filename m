Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB2289704
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2019 20:10:39 +0000 (UTC)
References: <1565267697-19510-1-git-send-email-swati2.sharma@intel.com>
 <1b460e442e9c1761c81bd5b70c27e410904386d6.camel@intel.com>
 <156569270736.2301.12064025513824066940@skylake-alporthouse-com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <a80d1aaa-66fe-1167-6760-fab0ee109cf0@intel.com>
Date: Wed, 4 Sep 2019 01:40:36 +0530
MIME-Version: 1.0
In-Reply-To: <156569270736.2301.12064025513824066940@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Add assert for
 drm_intel_bufmgr and intel_batchbuffer before usage
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0631975024=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, "Ser, Simon" <simon.ser@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0631975024==
Content-Type: multipart/alternative;
 boundary="------------5E5F357BB8D37A11F6B567EF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5E5F357BB8D37A11F6B567EF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-Aug-19 4:08 PM, Chris Wilson wrote:
> Quoting Ser, Simon (2019-08-13 11:28:54)
>> On Thu, 2019-08-08 at 18:04 +0530, Swati Sharma wrote:
>>> if drm_intel_bufmgr_gem_init() or intel_batchbuffer_alloc()
>>> returns NULL, it leads to seg fault as below:
>>>
>>> root@testrunner:/home/testrunner/swati/otc_gen_graphics-intel-gpu-tools#
>>> ./tests/kms_big_fb
>>> IGT-Version: 1.24-g976db91 (x86_64) (Linux: 5.1.0-rc6+ x86_64)
>>> Max driver framebuffer size 8192x8192
>>> RAM: 2749 MiB, GPU address space: 134217728 MiB, GGTT mappable size: 256
>>> MiB
>>> Received signal SIGSEGV.
>>> Stack trace:
>>>   #0 [fatal_sig_handler+0x77]
>>>   #1 [killpg+0x40]
>>>   #2 [drm_intel_bo_alloc+0x0]
>>>   #3 [intel_batchbuffer_reset+0x33]
>>>   #4 [intel_batchbuffer_alloc+0x34]
>>>   #5 [__real_main603+0x3e9]
>>>   #6 [main+0x23]
>>>   #7 [__libc_start_main+0xf0]
>>>   #8 [_start+0x29]
>>>   #9 [<unknown>+0x29]
>>> Segmentation fault (core dumped)
>>>
>>> To prevent this igt_assert() is added for both the functions.
>> I'm not sure I understand why this segfault happens. Seems like
>> drm_intel_bufmgr_gem_init can return NULL in the following cases:
>>
>> * No compiled with libdrm_intel support, in which case the tests should
>>    be skipped
>> * Allocation failure or pthread mutex failure, which are unlikely to
>>    happen (but it would be nice to log something when those fail)
>> * DRM_IOCTL_I915_GEM_APERTURE fails (but something is printed to
>>    stderr, it doesn't seem like this is the case here)
>>
>> Am I missing something?
> Usual cause is unrecognised GPU by libdrm. In which case it should be an
> igt_require_f(data.bufmgr, "Update libdrm for %s support\n", intel_chipset_get_name(devid))
> Roll that up into an <somename>_wrapper and spread far and wide.
> (Although I prefer the option of not using libdrm_intel in the first
> place.)
> -Chris
Shouldn't we add igt_assert() and instead add wrapper func to check bufmgr?


-- 
~Swati Sharma


--------------5E5F357BB8D37A11F6B567EF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix"><tt>On 13-Aug-19 4:08 PM, Chris Wilson
        wrote:</tt><br>
    </div>
    <blockquote type="cite"
cite="mid:156569270736.2301.12064025513824066940@skylake-alporthouse-com">
      <pre class="moz-quote-pre" wrap="">Quoting Ser, Simon (2019-08-13 11:28:54)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Thu, 2019-08-08 at 18:04 +0530, Swati Sharma wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">if drm_intel_bufmgr_gem_init() or intel_batchbuffer_alloc()
returns NULL, it leads to seg fault as below:

root@testrunner:/home/testrunner/swati/otc_gen_graphics-intel-gpu-tools#
./tests/kms_big_fb
IGT-Version: 1.24-g976db91 (x86_64) (Linux: 5.1.0-rc6+ x86_64)
Max driver framebuffer size 8192x8192
RAM: 2749 MiB, GPU address space: 134217728 MiB, GGTT mappable size: 256
MiB
Received signal SIGSEGV.
Stack trace:
 #0 [fatal_sig_handler+0x77]
 #1 [killpg+0x40]
 #2 [drm_intel_bo_alloc+0x0]
 #3 [intel_batchbuffer_reset+0x33]
 #4 [intel_batchbuffer_alloc+0x34]
 #5 [__real_main603+0x3e9]
 #6 [main+0x23]
 #7 [__libc_start_main+0xf0]
 #8 [_start+0x29]
 #9 [&lt;unknown&gt;+0x29]
Segmentation fault (core dumped)

To prevent this igt_assert() is added for both the functions.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I'm not sure I understand why this segfault happens. Seems like
drm_intel_bufmgr_gem_init can return NULL in the following cases:

* No compiled with libdrm_intel support, in which case the tests should
  be skipped
* Allocation failure or pthread mutex failure, which are unlikely to
  happen (but it would be nice to log something when those fail)
* DRM_IOCTL_I915_GEM_APERTURE fails (but something is printed to
  stderr, it doesn't seem like this is the case here)

Am I missing something?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Usual cause is unrecognised GPU by libdrm. In which case it should be an
igt_require_f(data.bufmgr, "Update libdrm for %s support\n", intel_chipset_get_name(devid))
Roll that up into an &lt;somename&gt;_wrapper and spread far and wide.
(Although I prefer the option of not using libdrm_intel in the first
place.)
-Chris</pre>
    </blockquote>
    <tt>Shouldn't we add igt_assert() and instead add wrapper func to
      check bufmgr?</tt><br>
    <blockquote type="cite"
cite="mid:156569270736.2301.12064025513824066940@skylake-alporthouse-com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
~Swati Sharma
</pre>
  </body>
</html>

--------------5E5F357BB8D37A11F6B567EF--

--===============0631975024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0631975024==--
