Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E62BCC6B03
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 13:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFA710E84B;
	Tue, 13 Oct 2026 13:24:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA48910E832
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 13:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791897833; x=1823433833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e7ooELltRzun+O43r1MV/l1711Ftr4rtxHUcMSqEreg=;
 b=DYy8cc+tBWu0Y8qjoH6Xg+cP8htpZsHuzyom1pdj9XpN64JZDbMdMJlE
 4XdLW2gYr7vQJ6WYPJm95Xi29Fifl808AW0yJu+JDB74fVBQCEmppB2ca
 s9EGfUuU/s009QRUwFvCP8wgWt1hwYiNFwFfa/wWF40xlxaMzsq1rQF73
 0rrupcYQHzh2P6ovaH9IH8IOMGloOi/IjnKwO7uUUYNcxDKgVj9Ay4ZLR
 S6m1vc/RH4hTnIWFp3KET/zXg7RXlTpNm0eaNY03KtkNE4cTxQ4urLQyd
 DQWXaH0R73XF7oaZ3+9x77lLyhOGcLl8VHFs6KmCam6kBe6sEXD4+3aZS Q==;
X-CSE-ConnectionGUID: eNYK9vIaTKGA4Qkf83bc8w==
X-CSE-MsgGUID: Dptt2u7yS6asHJxAasRz4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="717518"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="717518"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 06:23:53 -0700
X-CSE-ConnectionGUID: T4VXd6ReSme8Tv946qizjQ==
X-CSE-MsgGUID: EGSHkQZsQGu793Fwp5O+Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1091525"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 06:23:51 -0700
Date: Tue, 13 Oct 2026 15:23:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 Fix dmesg ignore regexes with backslash escapes (rev2)
Message-ID: <20261013132349.cgxp2ewwxbm3xs7j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Shuicheng Lin <shuicheng.lin@intel.com>
References: <20261009002912.1391610-1-shuicheng.lin@intel.com>
 <179151724762.1236.16072073024582747538@221881a7231d>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179151724762.1236.16072073024582747538@221881a7231d>
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
On 2026-10-09 at 03:40:47 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix dmesg ignore regexes with backslash escapes (rev2)
> URL   : https://patchwork.freedesktop.org/series/175714/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19303_full -> IGTPW_15965_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15965_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15965_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15965/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15965_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_flush@basic-wb-ro-before-default:
>     - shard-rkl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19303/shard-rkl-5/igt@gem_exec_flush@basic-wb-ro-before-default.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15965/shard-rkl-7/igt@gem_exec_flush@basic-wb-ro-before-default.html
> 
>   * igt@gem_mmap_gtt@big-copy:
>     - shard-tglu:         [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19303/shard-tglu-8/igt@gem_mmap_gtt@big-copy.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15965/shard-tglu-2/igt@gem_mmap_gtt@big-copy.html
> 
>   * igt@kms_color_pipeline@plane-lut1d@pipe-a-plane-4:
>     - shard-dg1:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19303/shard-dg1-15/igt@kms_color_pipeline@plane-lut1d@pipe-a-plane-4.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15965/shard-dg1-14/igt@kms_color_pipeline@plane-lut1d@pipe-a-plane-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
>     - shard-tglu-1:       NOTRUN -> [INCOMPLETE][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15965/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15965/shard-tglu-8/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
>     - shard-glk11:        NOTRUN -> [ABORT][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15965/shard-glk11/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html
> 
>   * igt@syncobj_timeline@etime-multi-wait-for-submit-submitted:
>     - shard-snb:          [PASS][10] -> [INCOMPLETE][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19303/shard-snb1/igt@syncobj_timeline@etime-multi-wait-for-submit-submitted.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15965/shard-snb4/igt@syncobj_timeline@etime-multi-wait-for-submit-submitted.html
> 

Unrelated,

Regards,
Kamil


>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_19303_full and IGTPW_15965_full:
> 
> ### New IGT tests (36) ###
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
>     - Statuses : 5 pass(s)
>     - Exec time: [1.15, 4.28] s
> 
...cut...
