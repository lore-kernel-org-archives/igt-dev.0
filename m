Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661E7C2BD09
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 13:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6EF10E84E;
	Wed,  3 Jul 2024 13:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UatEYqZG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505F810E84E;
 Wed,  3 Jul 2024 13:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720012640; x=1751548640;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vVnBLafCPdvdrC1xUakYYRR0nyzEP+iXzXM57cz8ICI=;
 b=UatEYqZG2PZiq9TrPEWpWUUlO7m36ic/1zlRQvc2QPIKj78mL7WWbEZc
 /uIPEoXfKywsa+h6n0UcTdfWtFV77w12lLD4ofCO7rc9xCQ4XeocQ7bhy
 bAhYOEg7ohjV5mt+VBmMCEukudi08cRjhPAS4jbWkVxIf/EGNv5QErbtv
 ewAoaHk7aKiCw4WC3z4qr9EBgX0y83fj/cO2uo6UU7yx75UX5pDijKWrf
 l7KIAfCad0NAH06YW9yttE1zd4MdgIFU/XQ04Lkur0Ds3acTuOV2pSP33
 LBCFjB87sa9iFM144TTtmWltfTwnhoYHMaQxXL23DK1LeCUpecs9XTWtI g==;
X-CSE-ConnectionGUID: 7CfPKAjLSEK3BhXgkD2VTA==
X-CSE-MsgGUID: +T1UqzT0Te+NYA15BzGmeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28378419"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="28378419"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 06:17:20 -0700
X-CSE-ConnectionGUID: pDzXCEOfQO+5o3NvjMPmWA==
X-CSE-MsgGUID: EI/Ng+p2RVqWGoCSQBq5Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46225954"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Jul 2024 06:17:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 16:17:17 +0300
Date: Wed, 3 Jul 2024 16:17:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 Intel CCS + 10bpc/fp16 stuff
Message-ID: <ZoVPXbrzR180bZk3@intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
 <172001224456.24495.14126036622716074179@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172001224456.24495.14126036622716074179@2413ebb6fbb6>
X-Patchwork-Hint: comment
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

On Wed, Jul 03, 2024 at 01:10:44PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Intel CCS + 10bpc/fp16 stuff
> URL   : https://patchwork.freedesktop.org/series/135670/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7911 -> IGTPW_11352
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11352 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11352, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11352/index.html
> 
> Participating hosts (39 -> 41)
> ------------------------------
> 
>   Additional (3): bat-kbl-2 fi-cfl-8109u bat-jsl-3 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11352:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gem_contexts:
>     - bat-jsl-1:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7911/bat-jsl-1/igt@i915_selftest@live@gem_contexts.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11352/bat-jsl-1/igt@i915_selftest@live@gem_contexts.html

<4>[  520.753491] nvme nvme0: I/O tag 717 (72cd) QID 3 timeout, completion polled
<4>[  551.089459] nvme nvme0: I/O tag 718 (22ce) QID 3 timeout, completion polled

Is the disk dying?

-- 
Ville Syrjälä
Intel
