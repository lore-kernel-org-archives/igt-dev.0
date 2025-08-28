Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A73CA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 12:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391C310E9A0;
	Thu, 28 Aug 2025 12:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbLPvQJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FB510E9AF
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 12:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756383830; x=1787919830;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i9ybiFgLddknfFRz6pwYr4CBgldaGBzlN3Lqz7SuHuI=;
 b=JbLPvQJ8w7wgpNavWIr165MitVF+u4HhMuI+RKGJCJal/Obcn4IXt2VM
 uRKW0hBbNY7EtbXVlnXrF5hXG7OxS6TsDwpXI+pdHwvocGcCAFv5HQ6fT
 cWqEEatI0VvlRUssUmR2YFLAmMeSuXNZhHttLctF5XvmNyIghaMnmAVkQ
 DQDoal0W3z9D/3Tb3F4gdd2+zNFaOAODIMvK9yJacjJ2eF4b1ViRSfMM3
 DUrq/pddUseobnJBY9lCxA0Qqc/jJOdCxXUDMcnudbMCAXOw0tpG6tx5Y
 bzpQdL/jRKVrrKOqYAtvaataGEZS3gszRy7F/tndLwhfv5HZFKmL4DP3o Q==;
X-CSE-ConnectionGUID: LWM7KHToRR6rqMtOB+b9gg==
X-CSE-MsgGUID: 1AYfRAsfQSeiZ7D/vVbcHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57848877"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57848877"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 05:23:49 -0700
X-CSE-ConnectionGUID: eaxjKccPQ9+KXGlHFRdExg==
X-CSE-MsgGUID: CD2t1Uw9QkOoEcVaIB21jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="175392554"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.1.180])
 ([10.246.1.180])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 05:23:48 -0700
Message-ID: <0678359a-09d4-49a3-baa9-850c8a26f2d7@linux.intel.com>
Date: Thu, 28 Aug 2025 14:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/4] tests/intel/xe_sriov_flr: Use VRAM access
 helpers from intel_vram library
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com
References: <20250827144916.18558-1-lukasz.laguna@intel.com>
 <20250827144916.18558-4-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250827144916.18558-4-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 8/27/2025 4:49 PM, Lukasz Laguna wrote:
> Replace local VRAM access helper functions with the helpers provided by
> the intel_vram library.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2:
> - adjust the patch for lib changes
> ---
>   tests/intel/xe_sriov_flr.c | 104 +++++++------------------------------
>   1 file changed, 18 insertions(+), 86 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index fc08703c0..1a04c6891 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -11,6 +11,7 @@
>   #include "igt_device.h"
>   #include "igt_sriov_device.h"
>   #include "intel_chipset.h"
> +#include "intel_vram.h"
>   #include "linux_scaffold.h"
>   #include "xe/xe_mmio.h"
>   #include "xe/xe_query.h"
> @@ -676,94 +677,28 @@ struct lmem_data {
>   	size_t *vf_lmem_size;
>   };
>   
> -struct lmem_info {
> -	/* pointer to the mapped area */
> -	char *addr;
> -	/* size of mapped area */
> -	size_t size;
> -};
> -
>   const size_t STEP = SZ_1M;
>   
> -static void *mmap_vf_lmem(int pf_fd, int vf_num, size_t length, int prot, off_t offset)
> -{
> -	int open_flags = ((prot & PROT_WRITE) != 0) ? O_RDWR : O_RDONLY;
> -	struct stat st;
> -	int sysfs, fd;
> -	void *addr;
> -
> -	sysfs = igt_sriov_device_sysfs_open(pf_fd, vf_num);
> -	if (sysfs < 0) {
> -		igt_debug("Failed to open sysfs for VF%d: %s\n", vf_num, strerror(errno));
> -		return NULL;
> -	}
> -
> -	fd = openat(sysfs, "resource2", open_flags | O_SYNC);
> -	close(sysfs);
> -	if (fd < 0) {
> -		igt_debug("Failed to open resource2 for VF%d: %s\n", vf_num, strerror(errno));
> -		return NULL;
> -	}
> -
> -	if (fstat(fd, &st)) {
> -		igt_debug("Failed to stat resource2 for VF%d: %s\n", vf_num, strerror(errno));
> -		close(fd);
> -		return NULL;
> -	}
> -
> -	if (st.st_size < length) {
> -		igt_debug("Mapping length (%zu) exceeds BAR2 size (%" PRIu64 ")\n", length, (uint64_t)st.st_size);
> -		close(fd);
> -		return NULL;
> -	}
> -
> -	addr = mmap(NULL, length, prot, MAP_SHARED, fd, offset);
> -	close(fd);
> -	if (addr == MAP_FAILED) {
> -		igt_debug("Failed mmap resource2 for VF%d: %s\n", vf_num, strerror(errno));
> -		return NULL;
> -	}
> -
> -	return addr;
> -}
> -
> -static void munmap_vf_lmem(struct lmem_info *lmem)
> -{
> -	igt_debug_on_f(munmap(lmem->addr, lmem->size),
> -		       "Failed munmap %p: %s\n", lmem->addr, strerror(errno));
> -}
> -
> -static char lmem_read(const char *addr, size_t idx)
> -{
> -	return READ_ONCE(*(addr + idx));
> -}
> -
> -static char lmem_write_readback(char *addr, size_t idx, char value)
> -{
> -	WRITE_ONCE(*(addr + idx), value);
> -	return lmem_read(addr, idx);
> -}
> -
> -static bool lmem_write_pattern(struct lmem_info *lmem, char value, size_t start, size_t step)
> +static bool lmem_write_pattern(struct vram_mapping *m, uint8_t value, size_t start, size_t step)
>   {
> -	char read;
> +	uint8_t read;
>   
> -	for (; start < lmem->size; start += step) {
> -		read = lmem_write_readback(lmem->addr, start, value);
> +	for (; start < m->size; start += step) {
> +		read = intel_vram_write_readback8(m, start, value);
>   		if (igt_debug_on_f(read != value, "LMEM[%zu]=%u != %u\n", start, read, value))
>   			return false;
>   	}
>   	return true;
>   }
>   
> -static bool lmem_contains_expected_values_(struct lmem_info *lmem,
> -					   char expected, size_t start,
> +static bool lmem_contains_expected_values_(struct vram_mapping *m,
> +					   uint8_t expected, size_t start,
>   					   size_t step)
>   {
> -	char read;
> +	uint8_t read;
>   
> -	for (; start < lmem->size; start += step) {
> -		read = lmem_read(lmem->addr, start);
> +	for (; start < m->size; start += step) {
> +		read = intel_vram_read8(m, start);
>   		if (igt_debug_on_f(read != expected,
>   				   "LMEM[%zu]=%u != %u\n", start, read, expected))
>   			return false;
> @@ -774,30 +709,27 @@ static bool lmem_contains_expected_values_(struct lmem_info *lmem,
>   static bool lmem_contains_expected_values(int pf_fd, int vf_num, size_t length,
>   					  char expected)
>   {
> -	struct lmem_info lmem = { .size = length };
> +	struct vram_mapping vram;
>   	bool result;
>   
> -	lmem.addr = mmap_vf_lmem(pf_fd, vf_num, length, PROT_READ | PROT_WRITE, 0);
> -	if (igt_debug_on(!lmem.addr))
> +	if (igt_debug_on(intel_vram_mmap(pf_fd, vf_num, 0, length, PROT_READ | PROT_WRITE, &vram)))
>   		return false;
>   
> -	result = lmem_contains_expected_values_(&lmem, expected, 0, STEP);
> -	munmap_vf_lmem(&lmem);
> +	result = lmem_contains_expected_values_(&vram, expected, 0, STEP);
> +	intel_vram_munmap(&vram);
>   
>   	return result;
>   }
>   
>   static bool lmem_mmap_write_munmap(int pf_fd, int vf_num, size_t length, char value)
>   {
> -	struct lmem_info lmem;
> +	struct vram_mapping vram;
>   	bool result;
>   
> -	lmem.size = length;
> -	lmem.addr = mmap_vf_lmem(pf_fd, vf_num, length, PROT_READ | PROT_WRITE, 0);
> -	if (igt_debug_on(!lmem.addr))
> +	if (igt_debug_on(intel_vram_mmap(pf_fd, vf_num, 0, length, PROT_READ | PROT_WRITE, &vram)))
>   		return false;
> -	result = lmem_write_pattern(&lmem, value, 0, STEP);
> -	munmap_vf_lmem(&lmem);
> +	result = lmem_write_pattern(&vram, value, 0, STEP);
> +	intel_vram_munmap(&vram);
>   
>   	return result;
>   }
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

