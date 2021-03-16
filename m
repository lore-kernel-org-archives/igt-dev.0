Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD9E6E23F
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Mar 2021 09:16:19 +0000 (UTC)
References: <20210121083742.46592-1-ashutosh.dixit@intel.com>
 <e7f8ed82-a9a4-e2a6-5b59-f8391c7d8421@linux.intel.com>
 <87lfaohuol.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <c1e0796a-6970-c535-2080-a8ce4dd34f4b@linux.intel.com>
Date: Tue, 16 Mar 2021 09:16:14 +0000
MIME-Version: 1.0
In-Reply-To: <87lfaohuol.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/ioctl_wrappers: Keep IGT working
 without pread/pwrite ioctls
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 15/03/2021 23:19, Dixit, Ashutosh wrote:
> On Mon, 15 Mar 2021 09:51:04 -0700, Tvrtko Ursulin wrote:
>>
>>
>> On 21/01/2021 08:37, Ashutosh Dixit wrote:
>>> The general direction at this time is to phase out pread/write ioctls
>>> and not support them in future products. This means IGT must handle
>>> the absence of these ioctls. This patch does this by modifying
>>> gem_read() and gem_write() to do the read/write using the pread/pwrite
>>> ioctls first but when these ioctls are unavailable fall back to doing
>>> the read/write using a combination of mmap and memcpy.
>>>
>>> Callers who must absolutely use the pread/pwrite ioctls (such as tests
>>> which test these ioctls or must otherwise only use the pread/pwrite
>>> ioctls) must use gem_require_pread_pwrite() to skip when these ioctls
>>> are not available.
>>>
>>> v1: Removed __gem_pread, gem_pread, __gem_pwrite and gem_pwrite
>>>       introduced previously since they are not necessary,
>>>       gem_require_pread_pwrite is sufficient
>>> v2: Fix CI failures in gem_advise and gen9_exec_parse by introducing
>>>       gem_require_pread_pwrite
>>> v3: Skip mmap for 0 length read/write's
>>> v4: Remove redundant igt_assert's
>>> v5: Re-run
>>> v6: s/EOPNOTSUPP/-EOPNOTSUPP/
>>> v7: Rebase on latest master, skip gem_exec_parallel@userptr with
>>>       gem_require_pread_pwrite
>>>
>>> Reviewed-by: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> ---
>>>    lib/ioctl_wrappers.c                        | 135 ++++++++++++++++++=
+-
>>>    lib/ioctl_wrappers.h                        |   3 +
>>>    tests/i915/gem_exec_parallel.c              |   3 +
>>>    tests/i915/gem_madvise.c                    |   2 +
>>>    tests/i915/gem_partial_pwrite_pread.c       |   1 +
>>>    tests/i915/gem_pread.c                      |   1 +
>>>    tests/i915/gem_pread_after_blit.c           |   1 +
>>>    tests/i915/gem_pwrite.c                     |   1 +
>>>    tests/i915/gem_pwrite_snooped.c             |   1 +
>>>    tests/i915/gem_readwrite.c                  |   1 +
>>>    tests/i915/gem_set_tiling_vs_pwrite.c       |   1 +
>>>    tests/i915/gem_tiled_partial_pwrite_pread.c |   1 +
>>>    tests/i915/gem_tiled_pread_basic.c          |   1 +
>>>    tests/i915/gem_tiled_pread_pwrite.c         |   1 +
>>>    tests/i915/gem_userptr_blits.c              |   2 +
>>>    tests/i915/gen9_exec_parse.c                |   4 +-
>>>    16 files changed, 152 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
>>> index 45415621b7..4440004c42 100644
>>> --- a/lib/ioctl_wrappers.c
>>> +++ b/lib/ioctl_wrappers.c
>>> @@ -56,6 +56,7 @@
>>>    #include "igt_debugfs.h"
>>>    #include "igt_sysfs.h"
>>>    #include "config.h"
>>> +#include "i915/gem_mman.h"
>>>      #ifdef HAVE_VALGRIND
>>>    #include <valgrind/valgrind.h>
>>> @@ -324,6 +325,70 @@ void gem_close(int fd, uint32_t handle)
>>> 	do_ioctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo);
>>>    }
>>>    +static bool is_cache_coherent(int fd, uint32_t handle)
>>> +{
>>> +	return gem_get_caching(fd, handle) !=3D I915_CACHING_NONE;
>>> +}
>>> +
>>> +static void mmap_write(int fd, uint32_t handle, uint64_t offset,
>>> +		       const void *buf, uint64_t length)
>>> +{
>>> +	void *map =3D NULL;
>>> +
>>> +	if (!length)
>>> +		return;
>>> +
>>> +	if (is_cache_coherent(fd, handle)) {
>>> +		/* offset arg for mmap functions must be 0 */
>>
>> Offset and lenght I think. So I guess none of the tests used non-aligned
>> access? Might be worth putting those two as asserts at the top of
>> mmap_write and mmap_read.
> =

> Hi Tvrtko, sorry I think you missed the logic. offset and length coming
> into mmap_write() and mmap_read() are non-zero (so tests are using
> non-aligned access). However __gem_mmap_offset() (called from
> __gem_mmap__cpu_coherent() etc.) has an assert that needs the offset to be
> 0 (which is what the comment above refers to). Therefore instead of doing
> mmap(offset, length) below we do mmap(0, offset + length).

But is offset + length is guaranteed to be page aligned? I thought =

mmap(2) requires it. Well, if it works obviously I was thinking wrong..

Regards,

Tvrtko


> =

> A similar logic is used in mmap_write() in lib/intel_bufops.c.
> =

>> Patch looks good to me. I did not investigate which tests need pread/pwr=
ite
>> and which can just work. I trust that has been established through CI ru=
ns
>> and manual inspection.
> =

> Correct.
> =

>> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> =

> Thanks.
> =

>> Regards,
>>
>> Tvrtko
>>
>>> +		map =3D __gem_mmap__cpu_coherent(fd, handle, 0, offset + length,
>>> +					       PROT_READ | PROT_WRITE);
>>> +		if (map)
>>> +			gem_set_domain(fd, handle,
>>> +				       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
>>> +	}
>>> +
>>> +	if (!map) {
>>> +		map =3D __gem_mmap_offset__wc(fd, handle, 0, offset + length,
>>> +					    PROT_READ | PROT_WRITE);
>>> +		if (!map)
>>> +			map =3D gem_mmap__wc(fd, handle, 0, offset + length,
>>> +					   PROT_READ | PROT_WRITE);
>>> +		gem_set_domain(fd, handle,
>>> +			       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>>> +	}
>>> +
>>> +	memcpy(map + offset, buf, length);
>>> +	munmap(map, offset + length);
>>> +}
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
