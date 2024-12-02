Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CD9D78326
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 14:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4341910E77A;
	Mon,  2 Dec 2024 14:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TP+wLzkQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D4110E77A;
 Mon,  2 Dec 2024 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733150828; x=1764686828;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LW4AkPdkjlOyXIFDfrdthz2JvoCj13K9UIarQDPHSu4=;
 b=TP+wLzkQQl/J14BT65vQ57FsiVuT2k5ziEwiBIlhlijnftNuRqFebwTK
 HRnhlHfBU1pSuUoNzFS47SZjsN8cNlzI4WNxcveMIqnze//aHcRR25/Qx
 p3snwGTUfyQLmpa3q4J1SxON0/H1Hki2GcLGMMgBBPnC7Qty9ANI7V2Di
 6SEnQpGImlqVVARLR1L9bQLkUL/YnRXresoOvnl+fgkWJmJ8d2VOEWbj0
 5nhzrlx4J/ZgzmzJykWplH03we0FK+MIoZvYeKx2YW627REobkglbW0bd
 fPy5jjM2BHfhS6q0ZZiiEGqmWqaMsvRgmKCyFrMp98d9PJRJ9i62goipT g==;
X-CSE-ConnectionGUID: /JKMfquXSH2uhPlPMIrIVg==
X-CSE-MsgGUID: CZP61PikRruXqCfAp9yWxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="36182308"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="36182308"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 06:47:08 -0800
X-CSE-ConnectionGUID: PfXteuclRzm4GPKtk41UdA==
X-CSE-MsgGUID: KftFZf0aSCmh79Z5XBPCEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="93293774"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 06:47:06 -0800
Date: Mon, 2 Dec 2024 15:46:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 runner: Allow limits at dumping dmesg (rev3)
Message-ID: <20241202144648.gkr5uf5smbnmjhcz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241129204550.116355-1-kamil.konieczny@linux.intel.com>
 <173292328986.453084.9748469175261086008@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173292328986.453084.9748469175261086008@b555e5b46a47>
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
On 2024-11-29 at 23:34:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Allow limits at dumping dmesg (rev3)
> URL   : https://patchwork.freedesktop.org/series/140182/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8132_full -> IGTPW_12223_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12223_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12223_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12223_full:

Patchseries changes only igt_runner so below are unrelated,
no need for respin.

Btw there could be new runner messages seen in logs.

Regards,
Kamil

> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_isolation@preservation-s3@rcs0:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1] +3 other tests incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk9/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   * igt@i915_module_load@reload:
>     - shard-dg2:          [PASS][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-8/igt@i915_module_load@reload.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-11/igt@i915_module_load@reload.html
> 
>   * igt@i915_pm_rpm@system-suspend-execbuf:
>     - shard-glk:          [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
>     - shard-rkl:          [PASS][6] -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:
>     - shard-dg2:          [PASS][8] -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-rkl:          [SKIP][10] ([i915#9519]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - {shard-dg2-9}:      NOTRUN -> [SKIP][12]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-9/igt@kms_hdr@brightness-with-hdr.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12223_full that come from known issues:

...cut...

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/index.html
