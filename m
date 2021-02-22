Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85BA6E0F6
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Feb 2021 13:54:14 +0000 (UTC)
Date: Mon, 22 Feb 2021 14:54:09 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20210222135409.GB29585@kdec5-desk.ger.corp.intel.com>
References: <20200914192455.2107119-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914192455.2107119-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_mmap_wc: Added test
 description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 12:54:55AM +0530, apoorva1.singh@intel.com wrote:
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Added test description to all the available subtests.
> 
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> ---
>  tests/i915/gem_mmap_wc.c | 45 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
> index f44b406d..aa98d408 100644
> --- a/tests/i915/gem_mmap_wc.c
> +++ b/tests/i915/gem_mmap_wc.c
> @@ -38,6 +38,8 @@
>  #include <sys/ioctl.h>
>  #include "drm.h"
>  
> +IGT_TEST_DESCRIPTION("Tests the extended version of MMAP IOCTL (Write Combine)");
> +
>  struct local_i915_gem_mmap_v2 {
>  	uint32_t handle;
>  	uint32_t pad;
> @@ -505,6 +507,7 @@ igt_main
>  		gem_require_mmap_wc(fd);
>  	}
>  
> +	igt_describe("Verify mapping to invalid gem object won't be created");
>  	igt_subtest("bad-object") {
>  		uint32_t real_handle = gem_create(fd, 4096);
>  		uint32_t handles[20];
> @@ -528,6 +531,7 @@ igt_main
>  		gem_close(fd, real_handle);
>  	}
>  
> +	igt_describe("Verify mapping to gem object with invalid offset won't be created");
>  	igt_subtest("bad-offset") {
>  		struct bad_offset {
>  			uint64_t size;
> @@ -555,6 +559,7 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Verify mapping to gem object with invalid size won't be created");
>  	igt_subtest("bad-size") {
>  		uint64_t bad_size[] = {
>  			0,
> @@ -577,45 +582,85 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Verify mapping to gem object with invalid flag won't be created");
>  	igt_subtest("invalid-flags")
>  		test_invalid_flags(fd);
> +
> +	igt_describe("Verify memory mapping to gem object persists after gem_close");
>  	igt_subtest("close")
>  		test_close(fd);
> +
> +	igt_describe("Verify copying between two memory mapped gem objects works fine");
>  	igt_subtest("copy")
>  		test_copy(fd);
> +
> +	igt_describe("Verify reading from newly created gem obejct works fine");
>  	igt_subtest("read")
>  		test_read(fd);
> +
> +	igt_describe("Verify writing into newly created gem object works fine");
>  	igt_subtest("write")
>  		test_write(fd);
> +
> +	igt_describe("Tests that mmap and mmap(wc) mappings to a gem object are "
> +	       "coherent after cache flush");
>  	igt_subtest("coherency")
>  		test_coherency(fd);
> +
> +	igt_describe("Verify writing into prefaulted gem object works fine");
>  	igt_subtest("write-prefaulted")
>  		test_write_prefaulted(fd);
> +
> +	igt_describe("Tests read and subsequent write on buffer object");
>  	igt_subtest("read-write")
>  		test_read_write(fd, READ_BEFORE_WRITE);
> +
> +	igt_describe("Tests write and subsequent read on buffer object");
>  	igt_subtest("write-read")
>  		test_read_write(fd, READ_AFTER_WRITE);
> +
> +	igt_describe("Tests read before write using distinct mmap(wc) mappings to "
> +	       "same buffer object");
>  	igt_subtest("read-write-distinct")
>  		test_read_write2(fd, READ_BEFORE_WRITE);
> +
> +	igt_describe("Tests write before read using distinct mmap(wc) mappings to "
> +	       "same buffer object");
>  	igt_subtest("write-read-distinct")
>  		test_read_write2(fd, READ_AFTER_WRITE);
> +
> +	igt_describe("Verify concurrent access of a gem object by multiple threads work fine");
>  	igt_subtest("fault-concurrent")
>  		test_fault_concurrent(fd);
> +
> +	igt_describe("Checks the coherency of data written into gem object using cpu mmap and "
> +	       "read from it using write combine mmap, having WC domain set");
>  	igt_subtest("write-cpu-read-wc")
>  		test_write_cpu_read_wc(fd, 1);
> +
> +        igt_describe("Checks the coherency of data written into gem object using cpu mmap and "
> +               "read from it using write combine mmap, not having WC domain set");
>  	igt_subtest("write-cpu-read-wc-unflushed")
>  		test_write_cpu_read_wc(fd, 0);
>  
>  	igt_subtest_group {
>  		igt_fixture gem_require_mappable_ggtt(fd);
> +
> +	        igt_describe("Checks the coherency of data written into gem object using write "
> +		       "combine mmap and read from it using gtt mmap");
>  		igt_subtest("write-wc-read-gtt")
>  			test_write_wc_read_gtt(fd);
> +
> +		igt_describe("Checks the coherency of data written into gem object using gtt "
> +		       "mmap and read from it using write combine mmap");
>  		igt_subtest("write-gtt-read-gtt")
>  			test_write_gtt_read_wc(fd);
>  	}
>  
> +	igt_describe("Verify initial page faulting completes within a specified time");
>  	igt_subtest("pf-nonblock")
>  		test_pf_nonblock(fd);
> +
>  	igt_subtest("set-cache-level")
>  		test_set_cache_level(fd);
LGTM :)
Acked-by: Katarzyna Dec <katarzyna.dec@intel.com>

Kasia :)
>  
> -- 
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
