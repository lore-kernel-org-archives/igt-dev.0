Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13FEC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 08:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4F210E5B3;
	Fri,  3 Jul 2026 08:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDRl38mz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B830410F6F0
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783066502; x=1814602502;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vlScUM6p6Nfp12jkAaxZEEJ2QM2PzsWvZqbhLAPriWM=;
 b=nDRl38mzYiW2drhxsgWUGG8AalsSsKALBphKT8xjp9n0+IyqMhcFLWnj
 ZQju4SXvVhOBr4RMR1RSjbS15LSKWAnx29CfKiJh4rk325DIBrY/lmbcL
 Cja6LedGMByxsJ/PaKqY1DBSjGyLM8qUl0c1Q7YfcdR8cVB9Dp8fOThLJ
 t5AnrImzzuFJgX792NVM0aN7DzQUEc8eEFR0FCzQd9EuLMqe+XhCkq/Si
 v7eAez6kX2PDod0jEs0iN3vlcRAtRtZQO2FAbNsjsRKCRyoAvA+pQ19dN
 Ecyb0/Ml4FEmUbee3TkXZqcALK2BEFnpxeA/mKCMoBctcK+y4LJuM9JdI A==;
X-CSE-ConnectionGUID: LNe4SHdtRCGgiinxvBkEXQ==
X-CSE-MsgGUID: a+McMg8IRVOomEyGt9G8XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="84008273"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="84008273"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 01:15:02 -0700
X-CSE-ConnectionGUID: Naiy8YJLQMuN2SneiYCoMw==
X-CSE-MsgGUID: XFZcosWjS1+B1HM96c9h8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="251331549"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 01:15:01 -0700
Date: Fri, 3 Jul 2026 10:14:59 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v5 i-g-t 0/7] Remove EUdebug tests
Message-ID: <p32e3o7a5xq5cmpwwbt5jqjbuoia6267mwvux6w35gnqlo3kcu@5lcugvvdaj4a>
References: <20260703063821.11560-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703063821.11560-1-dominik.karol.piatkowski@intel.com>
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

On Fri, Jul 03, 2026 at 08:38:14AM +0200, Dominik Karol Piątkowski wrote:
> Remove EUdebug tests due to lack of upstream kernel with EUdebug
> feature to be supported by them.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> 
> v2: Rebase on upstream
> v3: Remove xe_eudebug_sriov test and EUdebug section from tests/meson
> v4: Remove EUdebug library, experimental uapi and EUdebug section from meson
> v5: Don't remove xe_eudebug meson option yet - breaks CI pipelines' build

Ok, lets keep this option until CI will update these pipelines.

--
Zbigniew

> 
> Dominik Karol Piątkowski (7):
>   tests/xe_eudebug: Remove xe_eudebug test
>   tests/xe_exec_sip_eudebug: Remove xe_exec_sip_eudebug test
>   tests/xe_eudebug_online: Remove xe_eudebug_online test
>   tests/xe_eudebug_sriov: Remove xe_eudebug_sriov test
>   tests/meson: Remove Xe EUdebug
>   lib/xe_eudebug: Remove EUdebug library
>   drm-uapi-experimental/xe_drm_eudebug: Remove EUdebug uapi
> 
>  .../drm-uapi-experimental/xe_drm_eudebug.h    |  355 --
>  lib/meson.build                               |    7 +-
>  lib/xe/xe_eudebug.c                           | 2566 --------------
>  lib/xe/xe_eudebug.h                           |  273 --
>  tests/intel/xe_eudebug.c                      | 2986 -----------------
>  tests/intel/xe_eudebug_online.c               | 2819 ----------------
>  .../xe_eudebug_online.c.gen.iga64_codes.c     |   86 -
>  tests/intel/xe_eudebug_sriov.c                |  154 -
>  tests/intel/xe_exec_sip_eudebug.c             |  367 --
>  tests/meson.build                             |   12 -
>  10 files changed, 1 insertion(+), 9624 deletions(-)
>  delete mode 100644 include/drm-uapi-experimental/xe_drm_eudebug.h
>  delete mode 100644 lib/xe/xe_eudebug.c
>  delete mode 100644 lib/xe/xe_eudebug.h
>  delete mode 100644 tests/intel/xe_eudebug.c
>  delete mode 100644 tests/intel/xe_eudebug_online.c
>  delete mode 100644 tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
>  delete mode 100644 tests/intel/xe_eudebug_sriov.c
>  delete mode 100644 tests/intel/xe_exec_sip_eudebug.c
> 
> -- 
> 2.34.1
> 
