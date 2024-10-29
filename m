Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8189FD3A678
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 17:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F76410E397;
	Tue, 29 Oct 2024 17:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3AcmJ1/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C112C10E395;
 Tue, 29 Oct 2024 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730223506; x=1761759506;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4wWJVlnX+wgQQFIUXiA514xCWfQl51XlLZPVwoYf2B8=;
 b=C3AcmJ1/OvvdOZP2VetKLz9xyv8IkY27VBLTvtailFOrpxI9OMlIAT+p
 QRctG/vmoq8DZ66dQW6nNKbfcP/lV2p7q9QQy5fc38zPP3vrFdUJavk34
 mDh9ryUDDlSSjqHnaAJL93sSpFGp+JzgoKLl22c2KedFPWpzqPtbSdYTg
 pn2XMLKuNizvQxBAabnFtB5K86E18yzgjJzR0P2RbOo8fCSgEP8Uwprok
 PTPd89KICytftC/SYpmn+ryjOYRP8d4Bg3XwId4qaq0RaOzdsD2Ii2ed4
 kzPLOyDK6z7UZnPEBtgAZ4bMXSxwV66PC4iBuzZKMt7ZMXC3fOkSK7i1Y w==;
X-CSE-ConnectionGUID: 0jgoWuEWR0m9XSqbdAWZ7w==
X-CSE-MsgGUID: K6QLgE1RR3eJyBKKBUzoDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40466884"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="40466884"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 10:38:19 -0700
X-CSE-ConnectionGUID: LBLk6sDWSP2Qq2ykLdFNGQ==
X-CSE-MsgGUID: T7v6mkORTRKqDa97hAcoDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="87169774"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 10:38:17 -0700
Date: Tue, 29 Oct 2024 18:38:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 rename drm_fdinfo into i915_fdinfo (rev3)
Message-ID: <20241029173815.b4oyc42fpldv2oyx@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241028174636.142662-1-kamil.konieczny@linux.intel.com>
 <173022092687.1359386.13285616359381787796@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173022092687.1359386.13285616359381787796@2413ebb6fbb6>
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
On 2024-10-29 at 16:55:26 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: rename drm_fdinfo into i915_fdinfo (rev3)
> URL   : https://patchwork.freedesktop.org/series/140053/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8087 -> IGTPW_11993
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11993 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11993, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11993/index.html
> 
> Participating hosts (47 -> 46)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11993:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-twl-1:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8087/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11993/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
> 

This is unrelated to a change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11993 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-kbl-7567u:       [PASS][3] -> [DMESG-WARN][4] ([i915#11621] / [i915#1982])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8087/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11993/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-twl-1:          [PASS][5] -> [INCOMPLETE][6] ([i915#12133])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8087/bat-twl-1/igt@i915_selftest@live.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11993/bat-twl-1/igt@i915_selftest@live.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
>     - fi-kbl-7567u:       [PASS][7] -> [DMESG-FAIL][8] ([i915#11621]) +6 other tests dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8087/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11993/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - fi-kbl-7567u:       [PASS][9] -> [DMESG-WARN][10] ([i915#11621]) +84 other tests dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8087/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11993/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   
>   [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
>   [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
>   [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8087 -> IGTPW_11993
>   * Linux: CI_DRM_15604 -> CI_DRM_15605
> 
>   CI-20190529: 20190529
>   CI_DRM_15604: 738c18d8599dce736da8b6958f96d2eac08a36ab @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15605: 95fd9af8bb5389f9b5a639d567ef5c3e43e25682 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11993: de88ef108822411b2a9bf88a9c9b7616f118934e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11993/index.html
