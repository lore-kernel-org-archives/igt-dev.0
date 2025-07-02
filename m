Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4246AC83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 10:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEC710E335;
	Wed,  2 Jul 2025 10:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNoCcgKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248AA10E335
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751452858; x=1782988858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eG+F5PTGZkZkG8cjd/SymRB3LObmrYBVTt9iV8TPRug=;
 b=hNoCcgKkXUnwFDsUdNQtupeMgsCCRTiVmi7yCa3+mlSHxKp0M9er7sKE
 A8NkXO8M2WzOjcMnhPGTbCvyKfDTrr16OrgEyL6B8x66OZRREjyc7UkU3
 TySxMHvn8Yt9j4wFOeu8nTZBfcO+86JGaTSMhrd8tDatZaHkLXVNRpVGK
 8o9jj5UHLZ+6iUHF5jfS63r1tig0vmKqjrOqHC1vjt2BeTD10aAfDhRin
 0Bar5+icO6PidI1TtthACfvUg5hULRQdKCe1FPPTagMkUNvUbHHiBjjOe
 qVMEItOtoZGP7L0riebn3Y7N3R/ySsoP7tmOyDYMHVTju9TqxbE0sx5J4 Q==;
X-CSE-ConnectionGUID: okDrCV71RnuBv5hqgDBLSQ==
X-CSE-MsgGUID: ktlmSpTWTmy+DCHuDQffUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65197300"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="65197300"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 03:40:58 -0700
X-CSE-ConnectionGUID: bD7Ep0G5Rr+Bjz4ZkQVhXg==
X-CSE-MsgGUID: uJUsWWIkQJmVttAX2K4ClA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="177719064"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 03:40:56 -0700
Date: Wed, 2 Jul 2025 12:40:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] PVC: tests/intel/xe_multi_tile: Added Multi tile
 verification in available platform
Message-ID: <20250702104040.ye6mgwrs752mgajm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Nishit" <nishit.sharma@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
References: <20250318103740.124966-1-nishit.sharma@intel.com>
 <MW4PR11MB7151AA7B4EED5EA0FB7CB9F9E441A@MW4PR11MB7151.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MW4PR11MB7151AA7B4EED5EA0FB7CB9F9E441A@MW4PR11MB7151.namprd11.prod.outlook.com>
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

Hi Nishit,
On 2025-07-01 at 08:03:09 +0000, Sharma, Nishit wrote:
> 

I have few nits, see below.

If you will sent new revision please remove 'PVC: ' from subject,
so instead of:

[PATCH i-g-t] PVC: tests/intel/xe_multi_tile: Added Multi tile verification in available platform

it should be:

[PATCH i-g-t] tests/intel/xe_multi_tile: Add Multi-tile verification for PVC

or

[PATCH i-g-t] tests/intel: Add xe_multi_tile test

> This multi-tile test verifies whether platform supports multi-tile or not. If multi-tile supported then how many gt belongs to single tile%d and type of each gt.

Fold description lines, so:

This multi-tile test verifies whether platform supports
multi-tile or not. If it is, then check how many GTs
belongs to single Tile and type of each gt.

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_tile.c | 274 ++++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  2 files changed, 275 insertions(+)
>  create mode 100644 tests/intel/xe_multi_tile.c
> 
> diff --git a/tests/intel/xe_multi_tile.c b/tests/intel/xe_multi_tile.c new file mode 100644 index 000000000..d302dce28
> --- /dev/null
> +++ b/tests/intel/xe_multi_tile.c
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + * Authors:

Author:

> + *      Nishit Sharma <nishit.sharma@intel.com>
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Test to verify if multi-tile support available in platform
> + * Category: Core
> + * Mega feature: General Core features
> + * Functionality: Tile/GT operations

I am not sure about this 'Functionality' here,
please find some already existing so it is kept on minimum.

Regards,
Kamil

> + */
> +
> +/**
> + * SUBTEST: multi-tile-info
> + * Description: Test gathers Tile_ID/s, GT_ID/s, GT Type info
> + * Test category: functionality test
> + *
> + */
[...cut...]

