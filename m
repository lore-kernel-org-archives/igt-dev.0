Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82727D78763
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368FB10E48D;
	Fri, 19 Dec 2025 12:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwqLHlPJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A40C10E48D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766146804; x=1797682804;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SX1efyXk86yVZk1noec/87fFzQVeADHQQ1x6RE+lupg=;
 b=mwqLHlPJ3UBs5Ikji5cyEdHpjwATst/eQojULyI7DPQY0NaJMY42kELk
 oHkiZWR7vme0Oa4WY8Ceft+I4/FeSqz2Wkvh8gWMPNRpkot0oYPekAzft
 Uwr6wlp4eEnDanWj3haHVgY1IpNKXAayqTEGK6P4fSWUNykIpk7zh07Hd
 HUQIlFOMMh5zd1b5lGsKQqIe2qdUsXbtNyFyxcmDBGfZDltWLty32WrDl
 fDIeNTbg91mGroio3Q1+ZPnEFbvXvP3PhrnesQ2ihMWdtdlK3qwe37Syy
 5NLkZq2Vj2D2q5/ben4uupwgqP5FqkpUFzDb7d45Yhn+NlaYwBD76/eCn g==;
X-CSE-ConnectionGUID: tIA1p+MrQgCNtkCeghzTwA==
X-CSE-MsgGUID: O0JWFHZvTDWjO+4w6PGNXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78741555"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="78741555"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:20:04 -0800
X-CSE-ConnectionGUID: OlrU6c5hR220nzFiGs7uog==
X-CSE-MsgGUID: NpsDxIuoQG6kWIGru2fp3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199105015"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.16])
 ([10.245.245.16])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:20:03 -0800
Message-ID: <bb75c258-7d85-4884-9f2b-a8f0b256cc90@intel.com>
Date: Fri, 19 Dec 2025 12:20:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_ccs: add VM_BIND DECOMPRESS flag and basic
 decompression tests
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20251219122623.1090551-2-nitin.r.gote@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251219122623.1090551-2-nitin.r.gote@intel.com>
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

On 19/12/2025 12:26, Nitin Gote wrote:
> Add new userspace uapi flag DRM_XE_VM_BIND_FLAG_DECOMPRESS to request a
> decompressed GPU view when mapping compressed BOs. These tests validate
> VM_BIND DECOMPRESS support. Corresponding KMD series:
> https://patchwork.freedesktop.org/series/154714/ (KMD patch required).
> 
> Add two tests to xe_ccs.c:
>   1. vm-bind-decompress:
>      - Map compressed BO with DECOMPRESS flag and verifies decompression.
>   2. vm-bind-fault-mode-decompress:
>      - Verifies decompression via the page_fault path in FAULT_MODE VMs.
> 
> Tests use the blitter to produce compressed surfaces and verify
> correctness via GPU operations; they also ensure allocator ordering
> to avoid implicit VM_BINDs that carry a signal (LR/FAULT mode).
> Requires XE2+ and compression support;
> Add small utilities (pattern fill, print, verify) used by tests.
> 
> v5:
>    - replace usleep with user-fence wait
> 
> v4: (Matthew Auld)
>    - Instead of mmap(), use xe_bo_map()
>    - Use __xe_vm_bind() lib function
>    - Add blt_platform_has_flat_ccs_enabled() check
>      at the beginning
>    - Remove beginning igt_assert
>    - use bb_size for the sizing
>    - Nits
> 
> v3: (Matthew Auld)
>    - Avoid manual edit in xe_drm.h, instead put change in
>      include/drm-uapi-experimental/intel_drm_local.h and after
>      official header is re-generated then drop this change.
>    - Add a comment to give idea about sparse pattern values
>    - Set pat_index to something well define before calling first
>      vm_bind ioctl.
>    - Nits
> 
> v2:
>      When unmapping a VM_BIND explicitly clear the DECOMPRESS flag
>      (bind_args.bind.flags &= ~DRM_XE_VM_BIND_FLAG_DECOMPRESS)
>      to ensure the unmap/update operation is not interpreted as a
>      decompression request. This prevents the kernel from attempting
>      a decompress on an unmap.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Assuming CI is happy:
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
