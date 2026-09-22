Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A8AC982FA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 15:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D45310EDAE;
	Tue, 22 Sep 2026 15:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyP731mR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5993B10E727;
 Tue, 22 Sep 2026 15:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790092684; x=1821628684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CsbKIBiXcSdnHU0seYAl8WZxhzIFBF139F4LRgbLnnE=;
 b=YyP731mRr3Vw7hglv3t5dvu0FDwGKv4t6iDX6vqR5FgftsKSUD+XH/ob
 /1cyAeQr3Ge5mgQOv4M8E/Bsok5PtnuiaZ5Akkjkb9R48pwRWYLRyoikN
 Sj1mozP7JhA16gCwVOEZDt1ZkuOxeeyTX1b4fgzFS6f+cVZ6GWJndhnkV
 UUCS5dHHqtLeQahokUFfb8ICp8te8I0rcgW5S/fXrOcosl6V30XhbhHo6
 5qpUr5/qyEm8nup/VK1cyi/F8rHQu1X93SbC2BDJhXZuWD2+f6h3PbkAS
 P/Yzw5VBwotXW1LhVkkyB7Z/fb2u/HexslA7icRIGCFo1At6W49vrBZnc Q==;
X-CSE-ConnectionGUID: rHWiysOdS+ahsGUn894+WQ==
X-CSE-MsgGUID: jliO+ODmRN+QuFEkw+9nLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94538140"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="94538140"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:58:04 -0700
X-CSE-ConnectionGUID: uBnCFRrXTYCdmzVRzZ6NYw==
X-CSE-MsgGUID: EGaEimr5T0aN7ZjX+iHzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="271766896"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 08:58:03 -0700
Date: Tue, 22 Sep 2026 17:58:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_fo?=
 =?utf-8?Q?r?= tests/panthor: skip sparse VM_BIND tests before v1.9 (rev2)
Message-ID: <20260922155800.vvacucf5ydxrbubz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260921-b4-panthor_version_sparse-v3-1-c0af288ca073@collabora.com>
 <179008042431.193041.16111083203654643693@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179008042431.193041.16111083203654643693@61270ab9df2a>
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
On 2026-09-22 at 12:33:44 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/panthor: skip sparse VM_BIND tests before v1.9 (rev2)
> URL   : https://patchwork.freedesktop.org/series/174552/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19197_full -> IGTPW_15878_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15878_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15878_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15878/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15878_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
>     - shard-dg1:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15878/shard-dg1-16/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-1:
>     - shard-glk10:        NOTRUN -> [FAIL][2] +6 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15878/shard-glk10/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-1.html
> 

Unrelated, this is non-Intel test change. 

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15878_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#14544] / [i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15878/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
...cut...
