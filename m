Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9236CCC6B30
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 10:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3552110EA0A;
	Thu, 15 Oct 2026 10:32:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFE510EBC1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 10:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792060284; x=1823596284;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jzzh4frGwjlozBJpyR97Gwce7fPAdJyWrVPNyk5E2qU=;
 b=hQY/x7ChLIjuyZQ5/ri4NaOX6vRBl/dMHSgt4ae1kaxV+kk2wIVLNl9n
 zU8dIFpcCgzcZqXc8ShBPaZrC+WRL5OgkunosDPABxezRr2E5XADRobrI
 hJfFXmVRvjK5VL6onGmm8ypdBQA5+syos5Nh9PJOr9SamtUlNNQuab0S4
 L6sHlIU9iC+JB6A938zw05+srvbT1gEq4MzrlV1eK+BPa5O98fBHPMe2W
 WmQw0Ob7x8toDTE/76kIHytvdbhwIzhBRqITY3hhYQpWrkcipXpwmo676
 SCcMMtFyPn+GMXlJAXdnOVHYFoapxYnmrM3VopBLPY99jPJq/hEyC5Bjl Q==;
X-CSE-ConnectionGUID: DdOQK0ouRzGPdVjTAKQseA==
X-CSE-MsgGUID: aLwALyI/R6aOm7IplHJI9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="827323"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="827323"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:31:22 -0700
X-CSE-ConnectionGUID: IxxeH3nmSVGXHl2wNPbciQ==
X-CSE-MsgGUID: Pm035WhZQgKK9oRHk61jAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1593382"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:31:21 -0700
Date: Thu, 15 Oct 2026 12:31:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_vm: Validate host memory for
 overcommit tests
Message-ID: <20261015103101.w3mjezzplphmhm4d@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 kamil.konieczny@intel.com
References: <20261013073532.2885788-1-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013073532.2885788-1-sobin.thomas@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Sobin,
On 2026-10-13 at 07:35:32 +0000, Sobin Thomas wrote:

imho better subject:
tests/intel/xe_vm: skip overcommit tests when system memory is too low

as you are not calculating any crc of memory in VRAM and then in
system memory and comparing that, you effectivly skip when the
size of system memory is too low for tests.

Applied with modified subject.

> The amount of VRAM available for the overcommit tests varies
> across platforms. As a result, the host RAM space required to
> support the overcommit workload also varies based on eviction.
> 
> Query the platform RAM space and visible VRAM before running
> overcommit tests. Skip if the expected eviction footprint
> exceeds 50% of available RAM.
> 
> v2:
> - Base host-memory requirement based on the run time budget
> - Drop use vram and SRAM Handling; all the cases are VRAM
> 
> v3:
> - Moved BO calculation at the caller side of test_vm_overcommit
> - Modified the check keeping total bo size instead of swap
>   space check and multiplier (Nishit)
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_vm.c | 93 +++++++++++++++++++++++++++------------------
>  1 file changed, 55 insertions(+), 38 deletions(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index a0a6616c3..d1157803d 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -20,7 +20,9 @@
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
>  #include <string.h>
> +

Strange, please do not make unrelated changes, or if any, let make
them together with moving string.h above before igt headers.

Please correct this in future when you will make changes to this test.

Regards,
Kamil

>  #define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +#define OVERCOMMIT_BO_SIZE SZ_64M
>  
>  enum overcommit_stage {
>  	EXPECT_NONE,
> @@ -2385,10 +2387,10 @@ static void invalid_vm_id(int fd)
>  }
>  
>  static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos, int num_bos,
> -					     uint64_t nf_bo_size, bool use_vram, uint64_t data_addr,
> -					     uint32_t bo_flags, int gt_id, int *num_bound_out)
> +					     uint64_t data_addr, uint32_t bo_flags, int gt_id,
> +					     int *num_bound_out)
>  {
> -	uint32_t placement = use_vram ? vram_memory(fd, gt_id) : system_memory(fd);
> +	uint32_t placement = vram_memory(fd, gt_id);
>  
>  	*num_bound_out = 0;
>  
[cut]
