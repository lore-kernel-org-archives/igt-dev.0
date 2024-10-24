Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80B5D0BB6F
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 08:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7303710E8D5;
	Thu, 24 Oct 2024 08:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOlqiPuo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9247810E8D1;
 Thu, 24 Oct 2024 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729758579; x=1761294579;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YOr6uQRApXVr8aGqxQLUksZe6Q2D/vgQVZ3HICcUK3k=;
 b=lOlqiPuoP6N/85ZJDjxamCKIBPdftKgA1UTKC+dRKPM83BycCSw7PdPe
 HH7eMtIrd0Bu0Bjyn+RemsTPbAuVw1BdRmjOQ2dUcSU3ZNbFSmWNeOq8f
 k2deBBTzoCptI9NWHHQf3nCmuxocspFvdpg5GQOrN1eP4hb7mas2d/Nzg
 AmUAg+Z66uqULX4UXM/Yba07cujp405fFw9fvd1Hwp061c4xIqtYhOy7E
 QOQMrYioPj6CqokK9//C9WbDqTkMFRoxMZQNmEHfDiRBbp2LPxVOX1PBg
 eJpFcxhRqOy7X2Si3t74ozYzd32N+2To5yJYFvb7iiLV8xGvIf1g2ArXs Q==;
X-CSE-ConnectionGUID: lYg5HdQ2T8iC1lq2BFMzQQ==
X-CSE-MsgGUID: tlQj9IgeSd6eRWxPuRLMNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29239979"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29239979"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 01:29:39 -0700
X-CSE-ConnectionGUID: UcMoTN2JThGQATPQIlSEaA==
X-CSE-MsgGUID: sXJP7TNxSYmrAPj5fSJKJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80694211"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 01:29:39 -0700
Date: Thu, 24 Oct 2024 10:29:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlQkFU?= =?utf-8?Q?=3A?= failure for rename
 drm_fdinfo into i915_fdinfo (rev2)
Message-ID: <20241024082936.mvz4ybdr64xixx66@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241023164537.83876-1-kamil.konieczny@linux.intel.com>
 <172975477184.1325975.1935373149599298489@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172975477184.1325975.1935373149599298489@2413ebb6fbb6>
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
On 2024-10-24 at 07:26:11 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: rename drm_fdinfo into i915_fdinfo (rev2)
> URL   : https://patchwork.freedesktop.org/series/140053/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8082_BAT -> XEIGTPW_11967_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11967_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11967_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11967_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
>     - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11967/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-lnl-1:          [SKIP][3] ([Intel XE#599]) -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@kms_dsc@dsc-basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11967/bat-lnl-1/igt@kms_dsc@dsc-basic.html
> 

This is unrelated to rename of i915 test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11967_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>     - bat-bmg-2:          [INCOMPLETE][5] ([Intel XE#2874] / [Intel XE#2998]) -> [PASS][6] +1 other test pass
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11967/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
> 
>   
>   [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
>   [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8082 -> IGTPW_11967
> 
>   IGTPW_11967: cbdcb770dafad19d15b79ad1b4ff91819def477e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11967/index.html
