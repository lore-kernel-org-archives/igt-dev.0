Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE81F588C1
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 12:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AF610E5AC;
	Mon, 20 Apr 2026 12:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHofC5Pz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DB810E5AC
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776689860; x=1808225860;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CKxz3JOi1hakkVRfcaUZ1kLmVhJWZbY0Dbp6PtaHIiw=;
 b=XHofC5PzSehilWDwoHNnZXnUmP6u/twKVGEzsZZVNVgYjAw8iUxyZbWj
 ixzSRt7TnumBGHOLMzpmZvge6EdR5gVTi4FIMj1BGe3x+smTENfM2bQx4
 f5iugGhvjtJq/zN1CGuNZ5penWLbzJR5BRcvOhHv0WX0xXx8hXgw/aB6o
 qie9vwInKQKpMKl3s+VAN+I3klIxQUKJjmZa1LabhhD789CuRfWxpmi7f
 Q3lDsXadFtlulZLnfZi0UNxkPAgdPYHJwJb9qSuu9XB1ZkYoIpyU9+rOb
 gWMSwwPvwDLGlf8rWyufo1JEuL3J5wLyxTWX33B+5aTd+Pp8NCoyDlcaH w==;
X-CSE-ConnectionGUID: 28gYtwAiSDinYLUu8SU/9Q==
X-CSE-MsgGUID: 0nr/OCVJT+uw23kLf3h4QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77579189"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77579189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 05:57:39 -0700
X-CSE-ConnectionGUID: j35HIkcvS+uPn5qWUksbfQ==
X-CSE-MsgGUID: egzwTEJLRduhqCnx4NWj8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="231622127"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 05:57:38 -0700
Date: Mon, 20 Apr 2026 14:57:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 varun.gupta@intel.com
Subject: Re: [PATCH] tests/xe_madvise: fix cross-compilation error on ARM
Message-ID: <20260420125723.zcnw7reersoi77sy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>,
 igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 varun.gupta@intel.com
References: <20260420044339.3171967-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420044339.3171967-1-arvind.yadav@intel.com>
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
On 2026-04-20 at 10:13:39 +0530, Arvind Yadav wrote:
> Casting a pointer to uint64_t triggers -Werror=pointer-to-int-cast
> on 32-bit ARM where sizeof(void *) is 4 but sizeof(uint64_t) is 8.
> 
> Use igt_assert(ptr == MAP_FAILED) instead of igt_assert_eq_u64()
> which avoids the cast entirely.
> 
> Suggested-by: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

Thank you for fix but it was already fixed by recent commit

06dab255d tests/intel/xe_madvise: Fix armhf compilation

Regards,
Kamil

> ---
>  tests/intel/xe_madvise.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 805de793a..c728cc5c0 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -198,7 +198,7 @@ static void test_purged_mmap_blocked(int fd)
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
>  
>  	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> -	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
> +	igt_assert(ptr == MAP_FAILED);
>  	igt_assert_eq(errno, EINVAL);
>  
>  	gem_close(fd, bo);
> @@ -340,7 +340,7 @@ static void test_dontneed_before_mmap(int fd)
>  
>  	/* mmap() on a DONTNEED BO must fail with EBUSY. */
>  	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> -	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
> +	igt_assert(ptr == MAP_FAILED);
>  	igt_assert_eq(errno, EBUSY);
>  
>  	/* Restore to WILLNEED before cleanup */
> -- 
> 2.43.0
> 
