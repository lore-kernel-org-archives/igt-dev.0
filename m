Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8F1C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 09:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC3E10E8B9;
	Tue, 21 May 2024 09:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMcVTGdu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89C810E794;
 Tue, 21 May 2024 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716282846; x=1747818846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gDZ9hHQv7I4mGkL1wfBt1j8/8TWqLHD2CpVl/suH9VQ=;
 b=gMcVTGdumYCyVVEeafTlMyj+wUwDJqw10XdOgnNGcxYtytIi2PQukydX
 br7NmZn40ridOAhu7B3GvkSuvgzMyIvsKD2HH2iD6Xaf5GdUWXp0aJq9g
 U++gmQGRs93S5bEfAjupaX+GyDt6W/feYySdTMrTJBIr/0EXfn1AWFA6q
 GWNbhmv21XKwv1/nLoiC48tUTC9dDqj+8txBVr/zdQ/GF20udNeRYxp0g
 Cu+0NnVDTittcySdh77MTywu1YwR7imJ+ya51BY3rmK/kO2HxwMPa2a3J
 n6PiQ4m9CN+0erUus18HfykLoOIDdKMhnphI51PbTwd+by8s+22ixfc6J A==;
X-CSE-ConnectionGUID: I/Nb0DBiQsGyBKeo6i/RGA==
X-CSE-MsgGUID: hoYcGCEVQK2ornwo4emCfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34972308"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="34972308"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:14:06 -0700
X-CSE-ConnectionGUID: mqzUYXUIT4aGX0RUs6cMiA==
X-CSE-MsgGUID: l33IWbtnSuOmaqoc47aAMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37694779"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 02:14:04 -0700
Date: Tue, 21 May 2024 11:14:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/kms_big_fb: Restrict runs on simulation
Message-ID: <20240521091401.w3bvbz22fiilr6mi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pranay Samala <pranay.samala@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240520050155.435110-1-pranay.samala@intel.com>
 <171626706586.2162015.10902660744770114648@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171626706586.2162015.10902660744770114648@8e613ede5ea5>
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
On 2024-05-21 at 04:51:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_big_fb: Restrict runs on simulation
> URL   : https://patchwork.freedesktop.org/series/133797/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7864_full -> IGTPW_11158_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11158_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11158_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11158_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-mtlp:         NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/shard-mtlp-7/igt@kms_vrr@seamless-rr-switch-virtual.html
> 

This is unrelated, no need for respin (there is new version of patch).

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_7864_full and IGTPW_11158_full:
> 
> ### New IGT tests (5) ###
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.53] s
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.51] s
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.54] s
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [7.50] s
> 
>   * igt@perf@oa-exponents@1-vcs1:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.83] s
> 

This patch didn't add new tests, maybe testlist was changed?

Regards,
Kamil
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11158_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7864 -> IGTPW_11158
> 
>   CI-20190529: 20190529
>   CI_DRM_14785: 1ba62f8cea9c797427d45108df1d453f4b343240 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11158: 11158
>   IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11158/index.html
