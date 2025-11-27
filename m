Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F692D11183
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 12:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42F010E66B;
	Thu, 27 Nov 2025 12:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYiWpdYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B22910E66B
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764245652; x=1795781652;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0svem5WkVtU9vOuuDqkvDLgv0Ax9Z19Onc9vBFlCjXs=;
 b=cYiWpdYyJi2jr7RTYjpfXTFGfyvfmgLyy2BJM5TI714wlE8HlYm5S1iV
 JuogAm8N3QuHXK+EM/7+Bfk+zKXklXqVEhd4dt0/l5AMfjyHffR67ckv3
 nq6MraNnBIBTU15IETVnWKF3Ywc/UiPDnjSga02tuRNyMqH0vqkEuBIyE
 A/XGiGZ1IbdC9ewW4WN++7xlKa+983lpzrHiDpRKqd92f2uciNyjVIP+G
 yvPMmvCXGTT+0ZbH81Fobmr1YufFuYnfvCc0f3oXtAIVMvxmWuql6XvWh
 jNLMhiIGaN9DaBiudVdbIckLfTR8eTdQ/rJ3PIAYhHV46q1X5XRUGJfLS g==;
X-CSE-ConnectionGUID: 1ePPFm4sTbOY4YynfSHcGg==
X-CSE-MsgGUID: 3AbhaWrdTc2W/7a86DqsPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66184730"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66184730"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 04:14:12 -0800
X-CSE-ConnectionGUID: raDGTlHaQ36pw/oKiN1Guw==
X-CSE-MsgGUID: aqqpY1U4TX6y+pPjH2S6Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="193239842"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 04:14:10 -0800
Date: Thu, 27 Nov 2025 13:13:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH 2/2] tests/panthor: Add VM_BIND tests for partial huge
 page unmaps
Message-ID: <20251127121353.wod7q2kjrx3fa477@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
References: <20251127030145.585641-1-adrian.larumbe@collabora.com>
 <20251127030145.585641-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251127030145.585641-2-adrian.larumbe@collabora.com>
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

Hi Adrián,
On 2025-11-27 at 03:01:44 +0000, Adrián Larumbe wrote:
> Kernel commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
> behavior") made it illegal to perform partial unmaps of memory regions
> backed by huge (> 2MiB) pages. A workaround was written specifically for
> Panthor, but in order to test it, multiple scenarios and corner cases
> had to be considered.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  tests/panthor/meson.build              |   1 +
>  tests/panthor/panthor_hugepage_unmap.c | 210 +++++++++++++++++++++++++
>  2 files changed, 211 insertions(+)
>  create mode 100644 tests/panthor/panthor_hugepage_unmap.c
> 
> diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
> index 42a46e9934a9..78341b720912 100644
> --- a/tests/panthor/meson.build
> +++ b/tests/panthor/meson.build
> @@ -3,6 +3,7 @@ panthor_progs = [
>  	'panthor_group',
>  	'panthor_query',
>  	'panthor_vm',
> +        'panthor_hugepage_unmap',

Keep it sorted so move after panthor_group

>  ]
>  
>  foreach prog : panthor_progs
> diff --git a/tests/panthor/panthor_hugepage_unmap.c b/tests/panthor/panthor_hugepage_unmap.c
> new file mode 100644
> index 000000000000..1c712fb0d4f7
> --- /dev/null
> +++ b/tests/panthor/panthor_hugepage_unmap.c

Why not shorter name like pathor_hugepage.

Regards,
Kamil

> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_panthor.h"
> +#include "panthor_drm.h"
> +
> +igt_main {

[cut]
