Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC02C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 16:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B3110E2BC;
	Mon, 21 Jul 2025 16:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pxu1czSO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1687310E293;
 Mon, 21 Jul 2025 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753114617; x=1784650617;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tA0HPYCEU61ZFrAq6dcRvHKXVeO1TWkTgrLPhORp0Xc=;
 b=Pxu1czSOjQQLmbDZsQuXhiiWztqHKgqcM7YF/nMevouTJMPwyqYXo1yn
 mkM5QEdyTwL5uzmD68YnE1HD2+FKSTgn+hCfIRY/FPNbzqYkKm9J8gkgW
 GE8PWITP93ExMOlyX75TIdif27NVP3xBdgKaRrHYL1JDLNs6t52+elAtL
 o2sayiyCZkzXEXGXdWfw2XN1kcwYwVM0s+5hWt3pLN2+haoEZhUsht8u5
 qbWwnoBtwnBodqo2mPx7H2fpUYTlSsHw9fUN/wEJNPRDxUJpPEVsJs/wN
 pGyAb/0qCga+gSZI6waWSmubJJy/9JB5D1DPDzxDvnAEZB4UlZE13yNOl A==;
X-CSE-ConnectionGUID: lOIFUUZHQcaso0eeZI6f4g==
X-CSE-MsgGUID: 77JkOb3wQNeA67WDs8Zvlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55429033"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="55429033"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 09:16:57 -0700
X-CSE-ConnectionGUID: qkQWcflaSm2zv6KiBgtHGw==
X-CSE-MsgGUID: JjZGilkXSO6oei03O5yK3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="159608110"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 09:16:55 -0700
Date: Mon, 21 Jul 2025 18:16:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 I915-ci-infra@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 VKMS configfs tests (rev6)
Message-ID: <20250721161652.pvxfjibtcscjqo26@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 I915-ci-infra@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <175267563500.166774.6343866293656358908@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175267563500.166774.6343866293656358908@1538d3639d33>
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
On 2025-07-16 at 14:20:35 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: VKMS configfs tests (rev6)
> URL   : https://patchwork.freedesktop.org/series/145065/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8460_full -> IGTPW_13471_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13471_full absolutely need to be
>   verified manually.

Unlrelated, this is non-Intel vkms driver test.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13471_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13471/index.html
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13471_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@vkms/vkms_configfs@enable-encoder-no-crtcs (NEW):
>     - shard-mtlp:         NOTRUN -> [SKIP][1] +36 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13471/shard-mtlp-4/igt@vkms/vkms_configfs@enable-encoder-no-crtcs.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][2] +3 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13471/shard-dg2-9/igt@vkms/vkms_configfs@enable-encoder-no-crtcs.html
> 

Hmm, looks like we should add this to our blocklists.
+cc Karthik and Swati


>   * igt@vkms/vkms_configfs@enable-no-crtcs (NEW):
>     - shard-dg2:          NOTRUN -> [SKIP][3] +33 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13471/shard-dg2-1/igt@vkms/vkms_configfs@enable-no-crtcs.html
> 
>   * igt@vkms/vkms_configfs@enabled-plane-cannot-change (NEW):
>     - shard-tglu-1:       NOTRUN -> [SKIP][4] +4 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13471/shard-tglu-1/igt@vkms/vkms_configfs@enabled-plane-cannot-change.html
> 
>   * igt@vkms/vkms_configfs@plane-default-values (NEW):
>     - shard-tglu:         NOTRUN -> [SKIP][5] +31 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13471/shard-tglu-4/igt@vkms/vkms_configfs@plane-default-values.html
> 
>   * igt@vkms/vkms_configfs@plane-valid-values (NEW):
>     - shard-rkl:          NOTRUN -> [SKIP][6] +31 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13471/shard-rkl-4/igt@vkms/vkms_configfs@plane-valid-values.html
>     - shard-dg1:          NOTRUN -> [SKIP][7] +38 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13471/shard-dg1-19/igt@vkms/vkms_configfs@plane-valid-values.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8460_full and IGTPW_13471_full:
> 
> ### New IGT tests (39) ###
> 
>   * igt@vkms/vkms_configfs@attach-connector-to-encoder:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@attach-encoder-to-crtc:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@attach-plane-to-crtc:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@connector-default-files:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@connector-default-values:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@connector-valid-values:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@connector-wrong-values:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@crtc-default-files:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@crtc-default-values:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@crtc-valid-values:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@crtc-wrong-values:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@device-default-files:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@device-default-values:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@device-wrong-values:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-crtc-no-encoder:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-encoder-no-crtcs:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-multiple-cursor-planes:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-multiple-primary-planes:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-no-connectors:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-no-crtcs:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-no-encoders:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-no-pipeline-items:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-no-planes:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-no-primary-plane:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-plane-no-crtcs:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-too-many-connectors:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-too-many-crtcs:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-too-many-encoders:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enable-too-many-planes:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enabled-connector-cannot-change:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enabled-connector-hot-plug:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enabled-crtc-cannot-change:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enabled-encoder-cannot-change:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@enabled-plane-cannot-change:
>     - Statuses : 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@encoder-default-files:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@plane-default-files:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@plane-default-values:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@plane-valid-values:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vkms/vkms_configfs@plane-wrong-values:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13471_full that come from known issues:
> 

...cut...
