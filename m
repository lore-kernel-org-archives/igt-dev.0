Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C88C3DA60
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 12:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB9410E7AD;
	Thu, 18 Jul 2024 12:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSkVBlmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261D210E5C1;
 Thu, 18 Jul 2024 12:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721304068; x=1752840068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mQZLKsPve6bZtz8D0DXHOJAx2hMT7i7Czxv2YRPihtg=;
 b=ZSkVBlmIl83+oHxi3xQIcsmaoDcUp5nKibFi213fn0YinOspjtW/UJwo
 gg/7Psj7DQuitXr4xNt74cttUtChiTt1BgOC6Y6VVxB+KgWc/cCnDeC1K
 0lEpFtthAHnNGRzbNE5+BvrUH1SXnes9pgCKkLfDQ4myiTngkKWYRM4kl
 tjA0dMGEfzBtMqFDeixVrsjST1+rsa64VKfwIz3mtOxxi1vt0N2rToRCD
 bWshiC4lPF7nPMI6t5wR0gRX9FWIqH1j6JkA83cmC6axFobn5NPmjJjya
 cbbhjgu8NXnb2LtX4dGtbhQlXTbOXqSA34TptPjH56t3+OY1HXCyV2Gvh g==;
X-CSE-ConnectionGUID: 7n+epYIPRzeS1CrSnJhrVQ==
X-CSE-MsgGUID: i1RRuoewQiKzio+GK06kTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12607258"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="12607258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 05:01:08 -0700
X-CSE-ConnectionGUID: qkqGCr/qQgiOOKRaMZgTEg==
X-CSE-MsgGUID: /oQEEcXaSFio2m4MVY6lNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="73966660"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.26.184])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 05:01:07 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: =?UTF-8?B?4pyX?= CI.xeBAT: failure for tests/gem_ctx_exec: Fix
 failing preempt timeout updates
Date: Thu, 18 Jul 2024 14:01:04 +0200
Message-ID: <8398383.T7Z3S40VBb@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <172129767455.285786.10377245009692341486@2413ebb6fbb6>
References: <20240718085912.15434-7-janusz.krzysztofik@linux.intel.com>
 <172129767455.285786.10377245009692341486@2413ebb6fbb6>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Thursday, 18 July 2024 12:14:34 GMT+2 Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_ctx_exec: Fix failing preempt timeout updates
> URL   : https://patchwork.freedesktop.org/series/136228/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7929_BAT -> XEIGTPW_11425_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11425_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11425_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11425_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

Hi I915-ci-infra@lists.freedesktop.org,

That looks like a known issue to me, not related to my changes to IGT:
https://gfx-ci.igk.intel.com/cibuglog-ng/issue/8981

Please update filters.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11425_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-lnl-1:          [PASS][3] -> [FAIL][4] ([Intel XE#886]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
>     - bat-dg2-oem2:       [PASS][5] -> [INCOMPLETE][6] ([Intel XE#1169] / [Intel XE#1356])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
> 
>   * igt@xe_gt_freq@freq_basic_api:
>     - bat-adlp-7:         [PASS][7] -> [FAIL][8] ([Intel XE#2196])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_gt_freq@freq_basic_api:
>     - {bat-lnl-2}:        [FAIL][9] ([Intel XE#2196]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html
> 
>   * igt@xe_gt_freq@freq_fixed_idle:
>     - {bat-lnl-2}:        [FAIL][11] ([Intel XE#2262]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>   [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
>   [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196
>   [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7929 -> IGTPW_11425
>   * Linux: xe-1621-edeb340ae6172c699ea801a19d831d37cee9d2b3 -> xe-1623-66d3fbb024886f8fbbc15fe79222f046cccd18c7
> 
>   IGTPW_11425: eac9ea37cf3260872513fc310dde1efb3c2fdd0f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7929: 7929
>   xe-1621-edeb340ae6172c699ea801a19d831d37cee9d2b3: edeb340ae6172c699ea801a19d831d37cee9d2b3
>   xe-1623-66d3fbb024886f8fbbc15fe79222f046cccd18c7: 66d3fbb024886f8fbbc15fe79222f046cccd18c7
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/index.html
> 




