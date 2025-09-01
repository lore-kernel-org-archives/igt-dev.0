Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162F5CA0FFD
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 11:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06FF10E433;
	Mon,  1 Sep 2025 11:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMi6VCzv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F79710E42F
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756724827; x=1788260827;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LQkmQk/VPs1te3PIdN49W9fFJs9JRYKK2HjB8kvjA34=;
 b=NMi6VCzvxUS8BPVSBCrEzfnstiHFFQzFRvuTeNuUcczzUlRWWeeyn2k2
 H+m7Q5VZzqZAPrvGp/R9B8BhKENjSZAYxRo/nkcG73YQMFnTObWfALOHC
 TX1jdZ/ZMVfVPdNY+64PUZlrONOppkRajx0XffMABHLwjLIzs2GigiuZO
 6k3sAjAcnEa27Vvjn2iHv17LnMNSoUQoCt3JUp37eO/23sHutQ1q6Q0Sb
 fLxI2jTRubbyZMaHVUWxKJmz7mhqaas95e7DLrnE254+/b1gAqZ/Sez02
 gWplorz4LgOw/mHMbd15y6J+DgNCErc6qhtQWkwvwTShACj1aOi7iqTcI Q==;
X-CSE-ConnectionGUID: w4HQFeiYTXWV+AXh4H7dsQ==
X-CSE-MsgGUID: nsAPYXCTRYOLGCtFQenl+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58931376"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58931376"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 04:07:06 -0700
X-CSE-ConnectionGUID: tDU4zOcsSwW0T/3J60RfJA==
X-CSE-MsgGUID: /O6DWAI3SmSsMfDXDTrYpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="170966519"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 04:07:05 -0700
Date: Mon, 1 Sep 2025 13:06:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Block unsupported test on chamelium v1
Message-ID: <20250901110654.kxu5hkaz2myqddvl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250901082130.1787813-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901082130.1787813-1-kunal1.joshi@intel.com>
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

Hi Kunal,
On 2025-09-01 at 13:51:30 +0530, Kunal Joshi wrote:
> Chamelium V1 HDMI reciever can support max 4k@30
> Test forces EDID with 4k@60 which isn't supported
> Blocklist test untill we have newer V3 boards
> 
> v2: Fix typo and rephrase (Swati)
>     Fix commit subject (Kamil/Swati)
>     Block i915 as well (Kamil)
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/i915.blocklist.txt | 8 ++++++++
>  tests/intel-ci/xe.blocklist.txt   | 7 +++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index ac9bb2f0b..b36015b53 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -178,3 +178,11 @@ igt@kms_fbc_dirty_rect.*
>  # platforms connected to different displays.
>  ###############################################
>  igt@kms_sysfs_edid_timing
> +##################################################################
> +# Chamelium V1 HDMI receiver supports a maximum resolution
> +# of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
> +# which exceeds the capabilities of V1 hardware and results
> +# in failures. Temporarily blocklist this test until V3 Chamelium
> +# boards (which support 4K @ 60Hz) are available in the test environment.
> +##################################################################
> +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 14e0b9482..2e1ebf299 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -117,3 +117,10 @@ igt@xe_evict@.*-multi-vm-cm.*
>  igt@xe_evict@.*-threads-.*
>  # igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
>  ##################################################################
> +# Chamelium V1 HDMI receiver supports a maximum resolution
> +# of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
> +# which exceeds the capabilities of V1 hardware and results
> +# in failures. Temporarily blocklist this test until V3 Chamelium
> +# boards (which support 4K @ 60Hz) are available in the test environment.
> +##################################################################
> +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> -- 
> 2.25.1
> 
