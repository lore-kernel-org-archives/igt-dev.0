Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA03C5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 07:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE4510E0FE;
	Tue, 27 Feb 2024 07:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1ihqeTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B5410E0FE
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 07:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709018075; x=1740554075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3XbHQCXpLIiAS5RbexQ+bFdK3UfBTzWUJG5vsI4UdRc=;
 b=m1ihqeTvAqwtOALr0NLuN6m1Zi+EBVhDhXEUIQk2flQl1Uph7FlRv6ui
 Fa+PFc2BLT00CKhXYrvbg4liV/s9LuMqhDT7KSo1yX+HJ8VUKRTBDewZV
 341URBFtVvvoX8s1XxvVZwSKR6ATMR53vQTwqk/sEx/fJQ2pXxE+0m512
 Ka7Frt8KgjWm2i9XGAAY5OAy/0ZCtBjy1NowVu7K2EDSt7ilZtdruDXYD
 SeWkYe7Z1hCOvBvJRY0TbwN+QVughHo0u+5MhSWnZ6i53McW4mjKSa7E4
 JfoUjNJ60rrQ2X5x4uBjlCKm0wiDUTqFe3BD0KUAgR+Qc+y1U0n3Huq6X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14769063"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="14769063"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 23:14:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7359549"
Received: from stemerk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.114.228])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 23:14:33 -0800
Date: Tue, 27 Feb 2024 08:14:30 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 lib/rendercopy: Fix Xe2 pixel shader (rev2)
Message-ID: <20240227071430.62jnhvyrn7xa5auy@zkempczy-mobl2>
References: <20240226114511.51753-1-zbigniew.kempczynski@intel.com>
 <170897547958.299097.12168422682141271065@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170897547958.299097.12168422682141271065@8e613ede5ea5>
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

On Mon, Feb 26, 2024 at 07:24:39PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/rendercopy: Fix Xe2 pixel shader (rev2)                     
>    URL:     https://patchwork.freedesktop.org/series/130379/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10735/index.html 
> 
>                CI Bug Log - changes from IGT_7731 -> IGTPW_10735
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_10735 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_10735, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10735/index.html
> 
> Participating hosts (40 -> 38)
> 
>    Missing (2): bat-mtlp-8 fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_10735:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@hangcheck:
> 
>           * bat-adln-1: PASS -> ABORT
>      * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
> 
>           * bat-dg2-8: PASS -> FAIL

Unrelated to the change, it touches LNL shader only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_10735 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_exec_create@basic@smem:
>           * bat-arls-1: PASS -> DMESG-WARN (i915#10194)
> 
>     Possible fixes
> 
>      * igt@gem_exec_fence@basic-busy@ccs0:
>           * bat-arls-1: DMESG-WARN (i915#10194) -> PASS
> 
>     Warnings
> 
>      * igt@i915_selftest@live@requests:
>           * bat-arls-2: DMESG-WARN (i915#10194) -> ABORT (i915#10194)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7731 -> IGTPW_10735
> 
>    CI-20190529: 20190529
>    CI_DRM_14344: c815c7fa9257eb8ff4433c43058dd292b16347eb @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_10735:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10735/index.html
>    IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> Testlist changes
> 
>    -igt@kms_vrr@max-min
