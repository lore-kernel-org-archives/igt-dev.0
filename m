Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C00C54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 11:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F291610E86C;
	Thu, 22 May 2025 11:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFZm9zFM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D587410E0EF;
 Thu, 22 May 2025 11:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747914224; x=1779450224;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O7jDrx2nr7A5jWycAwQNn9stGvCE5ym+8dK+NDJvuow=;
 b=EFZm9zFM3G4Jl9hOCyMGrNcHxFQerOmC17IlIDX/piYXYNpVNBvtN8nC
 OzHKvJZAXF4FDnyGEGQFaRT5OD/DfFmmvEAYXx3wDyGyTFYZryCj6IjGI
 KjwRLuHFdbfd9zb4UUuZXysJO9oWFNLngUTdKE+pX7qEPHwpgUSOBnfUp
 cZVDZ33sqrZI6jzSq7yLf7uCzGyycArSf2dzXULa66/XGHSYvM2IAeOMf
 1sBvx8LiOF03qBTTeGAdPTKJlwvSw6ACV5sNy6m4CKyB8WLnkjFGjbAip
 ZRrSXuhEqxR+iScHNJ1E/R1JaaIkOXY/7u6ax4vjGJLxc9RzPdHMXVkSC w==;
X-CSE-ConnectionGUID: zZiipf+7S5GOqTmu2vCxgg==
X-CSE-MsgGUID: 2Fo6l6DEQSCQz/7NTNYxog==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49987685"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="49987685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:43:43 -0700
X-CSE-ConnectionGUID: uiuLOCKvRuaYM7Nblmhyaw==
X-CSE-MsgGUID: AM6LwfLjTyOr09nDsANVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="145284277"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 04:43:42 -0700
Date: Thu, 22 May 2025 13:43:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Extend IGT to support Android (rev9)
Message-ID: <20250522114339.caejqf44xqlmrlbs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
 <174771791950.2800.16626635156345922246@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174771791950.2800.16626635156345922246@1538d3639d33>
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

Hi igt-dev,
On 2025-05-20 at 05:11:59 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Extend IGT to support Android (rev9)
> URL   : https://patchwork.freedesktop.org/series/148432/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16569_full -> IGTPW_13146_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13146_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13146_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13146/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13146_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>     - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16569/shard-snb2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13146/shard-snb2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

Unrelated, this is a Xe/tools/lib change.
Lib changes should not cause this KMS test fail.

Regards,
Kamil

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13146_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-tglu-1:       NOTRUN -> [SKIP][3] ([i915#11078])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13146/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@gem_busy@semaphore:
>     - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#3936])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13146/shard-dg2-2/igt@gem_busy@semaphore.html
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8368 -> IGTPW_13146
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16569: 956a742459cff150a14f1d2f44b6294e646f208a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13146: 13146
>   IGT_8368: 8368
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13146/index.html
