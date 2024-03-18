Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62299C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 11:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A9D10F5C1;
	Mon, 18 Mar 2024 11:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7WFy/dh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B9F10EAB9
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 11:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710762751; x=1742298751;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4QYv4F6BlmmbcosjQW5Y4a7oWUBtRLGPz1lqApmBbGI=;
 b=i7WFy/dhOZWe3N1bK3/BDvf9f5fASl7Tbr4lby/Fd+zm9gbBB1lo7M1o
 x39tUB6ZDCmJcpYXLTOgfrpwwFMFKJLDIdz2CMoZEpBZwn+xq1D+Fm9RI
 oee7m6NeGCYcambh92yVM55UlPFNARIwqBqyQsBEOSmvON6AMCLT0rN+I
 neefi0oGYgD7wFwlMvIrmS7jRO58+sYdK+/Tjavi4ko221LZKEMdp6A0V
 szbfWJ6oLGPi51Sq8TkkXQPPL3UQdL4l134s2rHTeiQ4x6TUFKgYpJq/K
 w69q73tm4x+FD531o2S5lkAGkJjRtRBOE2IFLEM0mw9w5bLzTG17fhoc8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16966470"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16966470"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:52:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="44502619"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:52:29 -0700
Date: Mon, 18 Mar 2024 12:52:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 tests/amdgpu: add fuzzing tests
Message-ID: <20240318115226.dbt736hxcnxdr3ak@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com
References: <20240316023631.420131-1-vitaly.prosyak@amd.com>
 <171055929220.812644.1247440948160031324@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171055929220.812644.1247440948160031324@8e613ede5ea5>
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
On 2024-03-16 at 03:21:32 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/amdgpu: add fuzzing tests
> URL   : https://patchwork.freedesktop.org/series/131209/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14442 -> IGTPW_10849
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10849 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10849, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10849/index.html
> 
> Participating hosts (37 -> 36)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10849:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_addfb_basic@too-high:
>     - fi-kbl-8809g:       NOTRUN -> [FAIL][1] +2 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10849/fi-kbl-8809g/igt@kms_addfb_basic@too-high.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - fi-kbl-8809g:       NOTRUN -> [DMESG-FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10849/fi-kbl-8809g/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][3] +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10849/fi-kbl-8809g/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10849 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-kbl-8809g:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10849/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - fi-kbl-8809g:       NOTRUN -> [FAIL][5] ([IGT#3])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10849/fi-kbl-8809g/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
>     - fi-kbl-8809g:       NOTRUN -> [SKIP][6] +53 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10849/fi-kbl-8809g/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
>   [i915#10436]: https://gitlab.freedesktop.org/drm/intel/issues/10436
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
> 

These are unrelated to amdgpu test.

Regards,
Kamil

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7768 -> IGTPW_10849
> 
>   CI-20190529: 20190529
>   CI_DRM_14442: bb2b694350f7d997c90c0edff2d3409d9adc482a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10849: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10849/index.html
>   IGT_7768: 7768
> 
> 
> Testlist changes
> ----------------
> 
> -igt@kms_cursor_crc@cursor-size-hints
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10849/index.html
