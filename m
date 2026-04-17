Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03B6F436B4
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 16:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8029310E2C4;
	Fri, 17 Apr 2026 16:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R02vWcfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A130110E2C4
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 16:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776442575; x=1807978575;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dLsqj/WlsyV1A9N18rTzLrxxUn1kyBh5PjctDsO4Mpo=;
 b=R02vWcflZ/c+Pbr9YarX0m2ZFgdtux2RGjg/Y/Fl/gVEyL61UnGQoH2l
 c96CNQloxu0nLFR523cf5ZG+vnhOlQKOQMaQT7zDH0PdHCJQOaQEpdP81
 nheRHjE8to1cfRfs/acxzitrCMbG0pEUCoGFkHU8b2IUUsoFsAFFEKxJ0
 6BScqoPePvJd5aVSkAI/Y/UJ6ZSyjaeQAYqwJPDpSklFg7j2L5tm8ngkk
 qk0I9yvT5Q31X6trvGhJdngM1XYBamGq2IGTSDfQztZM4YuAewRleaM+R
 B4S6s4g6sd9sJxFHWJr40YOjLsDmop7pHuhuPdfIRaTOOXdqTe2u5cGKs A==;
X-CSE-ConnectionGUID: Z+Xmfw72QuSI01da+uRkPA==
X-CSE-MsgGUID: U+nU9LzXR9OPXtkE4UstLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87759966"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="87759966"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 09:16:14 -0700
X-CSE-ConnectionGUID: gJqq1EJQR7enodz1FV3D9A==
X-CSE-MsgGUID: A8rwebTVTxetmciQGOHbDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230221494"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.245.211])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 09:16:13 -0700
Date: Fri, 17 Apr 2026 18:16:10 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Arvind Yadav <arvind.yadav@intel.com>, 
 Nishit Sharma <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_madvise: Fix armhf compilation
Message-ID: <va66uz77nq6evnwdiwzcbob3oy3j6oau7k35qrtkvkkxyrnyxa@jnctmtw6qge2>
References: <20260417124416.64731-1-kamil.konieczny@linux.intel.com>
 <20260417124416.64731-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417124416.64731-3-kamil.konieczny@linux.intel.com>
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

On Fri, Apr 17, 2026 at 02:44:16PM +0200, Kamil Konieczny wrote:
> There are a compiler errors on armhf, related to a cast from pointer
> to uint64_t:
> 
> ../tests/intel/xe_madvise.c:201:20: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>   201 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
>       |                    ^
> 
> Fix it by using igt_assert_eq_ptr() macro.
> 
> Cc: Arvind Yadav <arvind.yadav@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_madvise.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 805de793a..e9bf55ff5 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -198,7 +198,7 @@ static void test_purged_mmap_blocked(int fd)
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
>  
>  	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> -	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);

If you would user to_user_pointer(ptr), to_user_pointer(MAP_FAILED)
you could drop 1/2.

--
Zbigniew


> +	igt_assert_eq_ptr(ptr, MAP_FAILED);
>  	igt_assert_eq(errno, EINVAL);
>  
>  	gem_close(fd, bo);
> @@ -340,7 +340,7 @@ static void test_dontneed_before_mmap(int fd)
>  
>  	/* mmap() on a DONTNEED BO must fail with EBUSY. */
>  	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> -	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
> +	igt_assert_eq_ptr(ptr, MAP_FAILED);
>  	igt_assert_eq(errno, EBUSY);
>  
>  	/* Restore to WILLNEED before cleanup */
> -- 
> 2.53.0
> 
