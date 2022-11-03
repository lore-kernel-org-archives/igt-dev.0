Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223F910E596
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Nov 2022 05:08:44 +0000 (UTC)
Date: Wed, 2 Nov 2022 22:08:38 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <Y2NM1o8yOME2/PrN@nvishwa1-DESK>
References: <20221102052956.27662-1-niranjana.vishwanathapura@intel.com>
 <63597673-c16b-be0f-7242-6736b44a7275@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <63597673-c16b-be0f-7242-6736b44a7275@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_shrink: Fix alloc_size
 unit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 10:32:44AM +0000, Matthew Auld wrote:
>On 02/11/2022 05:29, Niranjana Vishwanathapura wrote:
>>alloc_size is in MBs, but functions are expecting bytes.
>>Convert alloc_size to bytes before using it.
>>
>>TODO: Needs some testing
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Most of this test is blacklisted for some reason. CI looks to only run 
>the reclaim subtest.

Yah, I did run into some issues while running this test
with and without this fix. Looks like there are other issues
with these tests and hence blacklisted.
I hope get this patch merged anyway as it is the right thing anyway.

>
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks,
Niranjana

>
>>---
>>  tests/i915/gem_shrink.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>>diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
>>index 49df35c29..e3e20dfc9 100644
>>--- a/tests/i915/gem_shrink.c
>>+++ b/tests/i915/gem_shrink.c
>>@@ -455,6 +455,7 @@ igt_main
>>  		igt_info("Using %d processes and %'"PRIu64"MiB per process\n",
>>  			 num_processes, alloc_size);
>>+		alloc_size <<= 20;
>>  		igt_require_memory(num_processes, alloc_size,
>>  				   CHECK_SWAP | CHECK_RAM);
