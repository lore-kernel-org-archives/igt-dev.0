Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B3A10E170
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 19:05:04 +0000 (UTC)
Date: Fri, 18 Feb 2022 20:04:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yg/t2+PmWIcGlx31@kamilkon-DESK1>
References: <20220217054429.2687714-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220217054429.2687714-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v3] i915/gem_mmap: Added test description for test case
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

Hi Apoorva,

Dnia 2022-02-17 at 11:14:29 +0530, apoorva1.singh@intel.com napisał(a):
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2: Modified few descriptions to be more specific
> 
> v3: Rebase
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Dec, Katarzyna <katarzyna.dec@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_mmap.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
> index 61c9c5c1..1439c7bf 100644
> --- a/tests/i915/gem_mmap.c
> +++ b/tests/i915/gem_mmap.c
> @@ -39,6 +39,8 @@
>  #include "drm.h"
>  #include "i915/gem_create.h"
>  
> +IGT_TEST_DESCRIPTION("Basic MMAP IOCTL tests for memory regions\n");
> +

Remove "\n" and put dot at end. Please put dots at end of
descriptions below (if there are none).

>  #define OBJECT_SIZE 16384
>  #define PAGE_SIZE 4096
>  int fd;
> @@ -161,6 +163,7 @@ igt_main
>  		igt_require(gem_has_legacy_mmap(fd));
>  	}
>  
> +	igt_describe("Verify mapping to invalid gem objects won't be created");
>  	igt_subtest("bad-object") {
>  		uint32_t real_handle = gem_create(fd, 4096);
>  		uint32_t handles[20];
> @@ -185,6 +188,7 @@ igt_main
>  		gem_close(fd, real_handle);
>  	}
>  
> +	igt_describe("Verify mapping to gem object with invalid offset won't be created");
>  	igt_subtest("bad-offset") {
>  		struct bad_offset {
>  			uint64_t size;
> @@ -212,6 +216,7 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Verify mapping to gem object with invalid size won't be created");
>  	igt_subtest("bad-size") {
>  		uint64_t bad_size[] = {
>  			0,
> @@ -242,6 +247,8 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Test basics of newly mapped gem object like default content, write and read "
> +	       "coherency, mapping existence after gem_close and unmapping");
>  	igt_subtest("basic") {
>  		struct drm_i915_gem_mmap arg = {
>  			.handle = gem_create(fd, OBJECT_SIZE),
> @@ -269,6 +276,7 @@ igt_main
>  		munmap(addr, OBJECT_SIZE);
>  	}
>  
> +	igt_describe("Map small buffer object though direct CPU access, bypassing GPU.");
>  	igt_subtest("short-mmap") {
>  		uint32_t handle = gem_create(fd, OBJECT_SIZE);
>  
> @@ -281,15 +289,28 @@ igt_main
>  		gem_close(fd, handle);
>  	}
>  
> +	igt_describe("Verify that GTT page faults are asynchronous to GPU rendering and "
> +	       "completes within a specific time");
>  	igt_subtest("pf-nonblock")
>  		test_pf_nonblock(fd);
>  
> +	igt_describe("Test the write read coherency and simultaneous access of different pages "
> +	       "of a small buffer object");
>  	igt_subtest("basic-small-bo")
>  		test_huge_bo(-1);
> +
> +	igt_describe("Test the write read coherency and simultaneous access of different pages "
> +	       "of a big buffer object");
>  	igt_subtest("big-bo")
>  		test_huge_bo(0);
> +
> +	igt_describe("Test the write read coherency and simultaneous access of different pages "
> +	       "of a huge buffer object");
>  	igt_subtest("huge-bo")
>  		test_huge_bo(1);
> +
> +	igt_describe("Test the write read coherency and simultaneous access of different pages "
> +	       "of a swap buffer object");

Please describe it differently, there is no "swap bo",
test checks swapping during access.

>  	igt_subtest("swap-bo")
>  		test_huge_bo(2);
>  
> -- 
> 2.25.1
>
Regards,
Kamil 
