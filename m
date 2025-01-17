Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4582BC02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 14:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B5010E2E7;
	Fri, 17 Jan 2025 14:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eC76x05A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6556510E2E7
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737122747; x=1768658747;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zVSJgI+eqlsIOVVCuvCMl99ADAMEOgs8zJ7syFSWudw=;
 b=eC76x05Aoq8yiDxWOvrgEuFXl5cc7cfdIIYdjXHQSa7qbCuc6/snudZe
 JphyU/nmiRbgSXbixtCp6fjndnorE1ZsjkPOqKADeWarH6WHWUy5IxxHp
 9HRYSbXzRXHrHvwzUHyuKsCHSP4eA/cdeWxXEyTDsR2LB25lh+1HijN6Z
 gYJN7iLkSHsXatEelSoKuwV/e68/DNLvdf/IUmluSMnkuWk45nTUK9gfy
 y9zplWuztQTPPKpqP3RuAB+wpuJo4ncMHUE7D0D7LDxQ2nJiLkxBQt66i
 1EN0yLD1qJE8R5Rp+qntXI7KcRSI+ASeLYGucZ0iXtA4hBKRymqRDMgTQ A==;
X-CSE-ConnectionGUID: N5r2LlHKRT6aseqKZLXKiA==
X-CSE-MsgGUID: Tv3o8dEkTR6JkB8SbtZNKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48947882"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="48947882"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 06:05:47 -0800
X-CSE-ConnectionGUID: 5fjiI/OyTOuy0Gl8brnXew==
X-CSE-MsgGUID: ettIzNgEQbWhSicm78Is1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129077059"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:05:43 -0800
Date: Fri, 17 Jan 2025 15:05:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Clint Taylor <clinton.a.taylor@intel.com>,
 Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: Re: [PATCH i-g-t v5 0/7] Initial PTL support
Message-ID: <20250117140541.ugu4xgqnbdbgftkn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Clint Taylor <clinton.a.taylor@intel.com>,
 Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
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

Hi Clint,
On 2024-12-18 at 13:36:47 -0800, Clint Taylor wrote:
> Initial set of patches to enable testing Pantherlake.

Applied, thanks!

Regards,
Kamil

> 
> Juha-pekka Heikkila (4):
>   tests/kms_addfb_basic: fix x-tiled tests for case when there is no
>     x-tile
>   tests/intel/kms_draw_crc: fix x-tiled tests for case when there is no
>     x-tile
>   tests/kms_cursor_legacy: flip_vs_cursor_busy_crc was requiring any
>     driver but used intel x-tile
>   tests/intel/kms_frontbuffer_tracking: fix x-tiled tests for case when
>     there is no x-tile
> 
> Matt Atwood (1):
>   lib/intel_chipset: add pantherlake definition and support
> 
> Matthew Auld (2):
>   lib/intel_pat: extend for xe3
>   tests/intel/xe_pat: extend for xe3
> 
>  lib/intel_chipset.h                    |  2 ++
>  lib/intel_device_info.c                | 13 +++++++++++++
>  lib/intel_pat.c                        |  3 ++-
>  tests/intel/kms_draw_crc.c             |  6 ++++--
>  tests/intel/kms_frontbuffer_tracking.c | 20 ++++++++++++++++----
>  tests/intel/xe_pat.c                   |  4 ++--
>  tests/kms_addfb_basic.c                | 22 ++++++++++++----------
>  tests/kms_cursor_legacy.c              |  2 +-
>  8 files changed, 52 insertions(+), 20 deletions(-)
> 
> -- 
> 2.25.1
> 
