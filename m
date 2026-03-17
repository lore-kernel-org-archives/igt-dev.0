Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD333FED9EF
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 17:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D88F10E5A5;
	Tue, 17 Mar 2026 17:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NH+he+Td";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7535010E5A8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 17:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773769324; x=1805305324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CIS0au2hBQYyQSz2Mua61H3M1/JzbTsh/XXpK9Dx4bg=;
 b=NH+he+Td2YgE3ahnLD8eCjsNJCQDPRG2pyHGgZOQo/JklZ2C5orSQ8aJ
 JFj5rOyKzahAZIXOS6U9tGI3tgR5ELy5uoHrRtrnm2kD9xOnkFeBBiZpz
 MjfYFfpCPzQB2N2ZfYLTEWVckzFTRVy4Cosa0dDUVxpSv0CuYvzpE6oIy
 2PBu8v0HUR+Qlfi/jszKK/PgrIfhtjhn4A9s+gKGwvtXboaxmDRU1d40B
 gEChzOGA12wBpdyOoCWb5AUhBMPkBgMFEWlgpGdbXeCo0hxvuQuCteBeI
 21dqBZe7Rb7kiDEDJhYleKjvN1gSoojBihmYGxUvFkp/+W3UIlu+srivQ w==;
X-CSE-ConnectionGUID: 3h3hG2WPS+Skh15TCZ/72g==
X-CSE-MsgGUID: KK1zKDo6To+1ZaiQwsijVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92381650"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="92381650"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 10:42:04 -0700
X-CSE-ConnectionGUID: mnqVLK50Ts6Y1fR0A5i9GQ==
X-CSE-MsgGUID: U6cGRCLFSPuqhxWuj7Is6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="222396205"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:42:02 -0700
Date: Tue, 17 Mar 2026 18:41:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Skip
 madvise-pat-idx-uc-comp-* compression tests on PVC
Message-ID: <20260317174146.hivif4jo2cdizd7t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260317152132.744204-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317152132.744204-1-nishit.sharma@intel.com>
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

Hi Nishit,
On 2026-03-17 at 15:21:32 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 

imho subject could be shorter, like
[PATCH i-g-t] tests/intel/xe_exec_system_allocator: Skip madvise-pat-idx-uc-comp-* on PVC

> Add a check to skip "madvise-pat-idx-uc-comp-*" compression-related PAT
> index subtests on Ponte Vecchio (PVC) platforms.
> This prevents running unsupported or problematic compression tests for
> the "uc-comp" variant on PVC hardware.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index c645f6491..e0217c9d5 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2517,6 +2517,7 @@ int igt_main()
>  	};
>  
>  	int fd, svm_compute_loops = getenv_int("IGT_SVM_COMPUTE_LOOPS", 1);
> +	uint16_t dev_id;
>  
>  	igt_fixture() {
>  		struct xe_device *xe;
> @@ -2527,6 +2528,7 @@ int igt_main()
>  		xe = xe_device_get(fd);
>  		va_bits = xe->va_bits;
>  		open_sync_file();
> +		dev_id = intel_get_drm_devid(fd);
>  	}
>  
>  	for (const struct section *s = sections; s->name; s++) {
> @@ -2727,6 +2729,9 @@ int igt_main()
>  			     !xe_has_vram(fd)) {
>  				igt_skip("Skipping compression-related PAT index\n");
>  			}
> +			if (IS_PONTEVECCHIO(dev_id) &&
> +			    strstr(s->name, "madvise-pat-idx-uc-comp-"))
> +				igt_skip("Skipping compression test on PVC\n");

imho use pattern from line above and add PVC, so it will be:
  				igt_skip("Skipping compression-related PAT index on PVC\n");

With this corrected (could be at merge time)
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  			xe_for_each_engine(fd, hwe)
>  				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
>  		}
> -- 
> 2.34.1
> 
