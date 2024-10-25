Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A010D0C601
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 12:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35AA10EA8C;
	Fri, 25 Oct 2024 12:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUsebDL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C3D10EA85;
 Fri, 25 Oct 2024 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729859335; x=1761395335;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2/pLOPOfEFGiuMLvPQ4qe3z7Plx5hThl+OkuIk5fyP8=;
 b=CUsebDL0EsKCjD4bBTLAPymcwNznU6hShadvDdUmteDGmiJmZbKA3kp8
 ipHsTjs7PuF23dvUbxn9dd78wZ/3DwctIOlzMbOoboFceaQb/VWY965Ce
 7vxbgR09KBTgcFQ7g3fg/pgzQ4pN6nCaj8E1YYHE7l3XZ78Mh4Rx3ikeo
 IgOGh1OxXOPSrq0WEcagcCeZS/fKUDo65hsk6zj5KJhicKVVU/b0LSsLJ
 C0X1vrHi04V4pX1XExusBqI8ST/dBKZsMA0JIRptDqmiwARMSNmRKIhkq
 XhWb2lXNzi+6aZYL9i1vGh1zawGzU+g+IU/R65GgcgkBEwGSVvpYaKrpl A==;
X-CSE-ConnectionGUID: IVuwM6cBTtmTVbYGzCTuRA==
X-CSE-MsgGUID: ZsONqd5VQwCZQuKo/UF0kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="28969061"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="28969061"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 05:28:54 -0700
X-CSE-ConnectionGUID: wO0MB7ohRlaK4U/MAabNMQ==
X-CSE-MsgGUID: 6CS7OyKJQPi1S036xjkR8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80822757"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 05:28:52 -0700
Date: Fri, 25 Oct 2024 14:28:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 tests/intel/psr: fix documentation
Message-ID: <20241025122850.e3jhhvapap2x4gfs@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241024112011.1387980-1-swati2.sharma@intel.com>
 <172978580740.1328167.1570529542119447734@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172978580740.1328167.1570529542119447734@2413ebb6fbb6>
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
On 2024-10-24 at 16:03:27 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/psr: fix documentation
> URL   : https://patchwork.freedesktop.org/series/140433/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15588_full -> IGTPW_11972_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11972_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11972_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11972/index.html
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): shard-glk 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11972_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@crc@pipe-b-edp-1:
>     - shard-mtlp:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15588/shard-mtlp-3/igt@kms_async_flips@crc@pipe-b-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11972/shard-mtlp-1/igt@kms_async_flips@crc@pipe-b-edp-1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3:
>     - shard-dg1:          NOTRUN -> [FAIL][3] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11972/shard-dg1-12/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-dg1:          [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15588/shard-dg1-17/igt@kms_rotation_crc@multiplane-rotation.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11972/shard-dg1-19/igt@kms_rotation_crc@multiplane-rotation.html
>     - shard-dg2:          [PASS][6] -> [INCOMPLETE][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15588/shard-dg2-6/igt@kms_rotation_crc@multiplane-rotation.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11972/shard-dg2-8/igt@kms_rotation_crc@multiplane-rotation.html
> 

These are unrelated to change in doc in intel/kms_psr2_sf.c

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_15588_full and IGTPW_11972_full:
> 
> ### New IGT tests (4) ###
> 
>   * igt@kms_async_flips@test-cursor@pipe-a-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.25] s
> 
>   * igt@kms_async_flips@test-cursor@pipe-b-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.14] s
> 
>   * igt@kms_async_flips@test-cursor@pipe-c-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_async_flips@test-cursor@pipe-d-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.11] s
> 

Patch didn't touch this?!

Regards,
Kamil

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11972_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#6230])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11972/shard-tglu-8/igt@api_intel_bb@crc32.html
> 
...cut...
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11972/index.html
