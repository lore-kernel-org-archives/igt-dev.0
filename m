Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785BCE9A03B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 11:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E4E10E5AB;
	Wed, 18 Feb 2026 11:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNwrmZUf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605CE10E5A7
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 11:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771413761; x=1802949761;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=to1vt9D+INYvI5iUJgoBxy/fZbomxrScEtewZ1iziqU=;
 b=LNwrmZUfRO/Ww8eAocW3H+G683uF3Cgw2bbj9/Bxzyj8q7MOMkNW5r6M
 9zz8y+oZE8TTb3p5NVVuMWM+rH7mWZIxu08fhyDzhplCLv1jJ/61Lu5W8
 xetceihcXjfBxKXiq/iD/Z+zF39E3Dcb6eG8MVUdbmIB/cYKr9ddPibqL
 6+0ooiXdqCtjMS3cvf9SGGGM5+7DS84VUTE/yurpPsO814UFSWgzzQ+RA
 wj4Moh7mmYL+LfdGbdy1KtAJTPRl5rmtMnUrA3D2+K+JmrSo78CIteZDA
 jpmargofIvMj0utt6nFUPJaMUKnyJ4Q5vlsEeRdS/ajUkPwVZOtN/S8fX A==;
X-CSE-ConnectionGUID: aDL5xBoPRdOErKQPBbzGPg==
X-CSE-MsgGUID: wq+x7HpwQBe0rMfxbF/71w==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="71508107"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="71508107"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 03:22:41 -0800
X-CSE-ConnectionGUID: G+NwH8R+SpqcxvtubYt6GQ==
X-CSE-MsgGUID: eAAN1Tb7QHK8pLXTsVcNJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="214278402"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 03:22:39 -0800
Date: Wed, 18 Feb 2026 12:22:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 nishit.sharma@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH i-g-t v3 1/8] drm-uapi/xe_drm: Add UAPI support for
 purgeable buffer objects
Message-ID: <20260218112236.rjnw2lmhvlv3r3de@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>,
 igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 nishit.sharma@intel.com, pravalika.gurram@intel.com
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-2-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217023423.2632617-2-arvind.yadav@intel.com>
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

Hi Arvind,
On 2026-02-17 at 08:04:12 +0530, Arvind Yadav wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
> management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute type.
> 
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> - WILLNEED: Buffer is needed and should not be purged. If the BO was
>   previously purged, retained field returns 0 indicating backing store
>   was lost (once purged, always purged semantics matching i915).
> 
> - DONTNEED: Buffer is not currently needed and may be purged by the
>   kernel under memory pressure to free resources. Only applies to
>   non-shared BOs.
> 
> The implementation includes a 'retained' output field (matching i915's
> drm_i915_gem_madvise.retained) that indicates whether the BO's backing
> store still exists (1) or has been purged (0).
> 
> v2:
>   - Update UAPI documentation to clarify retained must be initialized
>     to 0(Thomas)

This should be a sync with a kernel commit from drm-next,
see git log.

Regards,
Kamil

> 
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 44 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 077e66a68..3dd1ba875 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -2099,6 +2099,7 @@ struct drm_xe_madvise {
>  #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
>  #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
>  #define DRM_XE_MEM_RANGE_ATTR_PAT		2
> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
>  	/** @type: type of attribute */
>  	__u32 type;
>  
> @@ -2189,6 +2190,49 @@ struct drm_xe_madvise {
>  			/** @pat_index.reserved: Reserved */
>  			__u64 reserved;
>  		} pat_index;
> +
> +		/**
> +		 * @purge_state_val: Purgeable state configuration
> +		 *
> +		 * Used when @type == DRM_XE_VMA_ATTR_PURGEABLE_STATE.
> +		 *
> +		 * Configures the purgeable state of buffer objects in the specified
> +		 * virtual address range. This allows applications to hint to the kernel
> +		 * about bo's usage patterns for better memory management.
> +		 *
> +		 * Supported values for @purge_state_val.val:
> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks BO as needed.
> +		 *    If BO was purged, returns retained=0 (backing store lost).
> +		 *
> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints that BO is not
> +		 *    currently needed. Kernel may purge it under memory pressure.
> +		 *    Only applies to non-shared BOs. Returns retained=1 if not purged.
> +		 */
> +		struct {
> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> +			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +			__u32 val;
> +
> +			/* @purge_state_val.pad */
> +			__u32 pad;
> +			/**
> +			 * @purge_state_val.retained: Pointer to output field for backing
> +			 * store status.
> +			 *
> +			 * Userspace must initialize this u32 field to 0 before the
> +			 * ioctl. Kernel writes to it after the operation:
> +			 * - 1 if backing store exists (not purged)
> +			 * - 0 if backing store was purged
> +			 *
> +			 * If userspace fails to initialize to 0, ioctl returns -EINVAL.
> +			 * This ensures a safe default (0 = assume purged) if kernel
> +			 * cannot write the result.
> +			 *
> +			 * Similar to i915's drm_i915_gem_madvise.retained field.
> +			 */
> +			__u64 retained;
> +		} purge_state_val;
>  	};
>  
>  	/** @reserved: Reserved */
> -- 
> 2.43.0
> 
