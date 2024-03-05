Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533E3C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 13:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E311C10E168;
	Tue,  5 Mar 2024 13:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QiCkq1vp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C65610E168
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709647194; x=1741183194;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=fu+v9AJxty0q1jaqH+lAYib+fslB2+pueWnkMzKQOxc=;
 b=QiCkq1vpBxgdN37KNrWOt9eHrl1XqLUCQM7kiHrl/QVWCavn/sqI2HkO
 /SQNp3BZdZAdoxJo++Dhtsr07NGb/dSUl0sxoB3e4GbM4ZeZbjQGvxlT6
 ++EoMd1lcmL5luDqCZYLq0N1Czbg6YbbuKrZci+hPHD4ISgoFVbmg/F3I
 n3UJ92WIHV4qSvp0XDZqIRWpWQvaCuLcharg5KwpVsxVx3qWoqR+oa7/5
 OHP/xBO8qVcg9fykWQpp0EIz1W43kkSBEves+2CgETHUUmqsSGZxcIOxF
 0X0kT0jcw5oDUj3OiKfKKtps3LxYG5IEsjVq84+UZ6gDiwGdg9bKLmimZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4060154"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4060154"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 05:59:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9960581"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 05:59:51 -0800
Date: Tue, 5 Mar 2024 14:59:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 tests/kms_atomic: fix musl compilation
Message-ID: <20240305135925.fautsex2eq6mj33o@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240304164354.112440-1-kamil.konieczny@linux.intel.com>
 <170958971529.502968.10435585257224165228@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170958971529.502968.10435585257224165228@8e613ede5ea5>
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
On 2024-03-04 at 22:01:55 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_atomic: fix musl compilation
> URL   : https://patchwork.freedesktop.org/series/130682/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14382 -> IGTPW_10772
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10772 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10772, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10772/index.html
> 
> Participating hosts (41 -> 37)
> ------------------------------
> 
>   Missing    (4): fi-cfl-8109u bat-jsl-1 fi-snb-2520m bat-arls-3 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10772:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@client:
>     - bat-dg2-8:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/bat-dg2-8/igt@i915_selftest@live@client.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10772/bat-dg2-8/igt@i915_selftest@live@client.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - bat-dg2-11:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/bat-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10772/bat-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
> 

This is unrelated to change in kms_atomic,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10772 that come from known issues:
> 
> ### IGT changes ###
> 

...cut...

> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - {bat-rpls-3}:       [DMESG-WARN][14] ([i915#5591]) -> [PASS][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10772/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
>   [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
>   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
>   [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7745 -> IGTPW_10772
> 
>   CI-20190529: 20190529
>   CI_DRM_14382: e8bc216572501440efb20e112bb5aa60599f1863 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10772: 10772
>   IGT_7745: 838ad56bf511c1caf56851c661fb5828c0440e3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10772/index.html
