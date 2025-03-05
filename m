Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39206C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 12:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5F210E08F;
	Wed,  5 Mar 2025 12:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPcio2/3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6065710E08F
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741177989; x=1772713989;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5Csq4O2IR5sj68YZ0vjctMEFqDDsmK6ZWP+ifaktUCg=;
 b=aPcio2/3ql7dPZAjMm4pFtMzDt0OMhvivYhhHm8eKyMpYVj6Jq8KuOZZ
 dFDKRyhKzovbx1KZ3ez/Bi4dQ6gKLuoacekiyHL9Tr0kWLuzH0mNOVZpq
 zw4o3Qc/JOnaaOgDF+cbpyTUNeJ/1SMFJ0KBnySVjAGXOSS7PYSkfKzva
 iRqbPf0QTcZjN/adrjT36GpKOaWYmpWvpevjqm866PfFrDdPDmSz+r6AC
 Mhfdu98To1euXrwlG3jyZmwG3dSqm3HToFulh/UGxz//+KJQvKsdilh4h
 B3eMs9kO8izwwYcybjH5Gw+GAfV4gLt79/gHsRwjyPvPlroHnyyjLZWEb w==;
X-CSE-ConnectionGUID: L25F++TsRMm21Ts0nZNq9g==
X-CSE-MsgGUID: any1XrfyQqKVMDB8PeIa2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41847758"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="41847758"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:33:09 -0800
X-CSE-ConnectionGUID: Gv5ZKu+OTgi6ChvvqEjOBw==
X-CSE-MsgGUID: JbRFNcsZTbCHq49anuOemQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="141924666"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:33:06 -0800
Date: Wed, 5 Mar 2025 13:33:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_eudebug: Add subtests for
 eudebug/SR-IOV exclusion
Message-ID: <20250305123303.nv2tz3ei4dmcqvf4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20250304163227.49986-1-christoph.manszewski@intel.com>
 <20250304163227.49986-3-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304163227.49986-3-christoph.manszewski@intel.com>
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

Hi Christoph,
On 2025-03-04 at 17:32:27 +0100, Christoph Manszewski wrote:

please change subject prefix (could be done at merge) to

tests/intel/xe_eudebug_sriov: Add subtests for eudebug/SR-IOV exclusion

or:

tests/intel/xe_eudebug_sriov: Add new test for eudebug/SR-IOV exclusion

Also before merge please reply to failures with Cc to bug-filing team.

Regards,
Kamil

> Eudebug is not supported in PF mode with VFs enabled and in VF mode.
> Provide subtests to ensure that:
>   1. enabling eudebug is not permitted in PF mode with VFs enabled
>   2. eudebug sysfs toggle is not available in VF mode
>   3. enabling VFs is not permitted when eudebug is enabled
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug_sriov.c | 148 +++++++++++++++++++++++++++++++++
>  tests/meson.build              |   1 +
>  2 files changed, 149 insertions(+)
>  create mode 100644 tests/intel/xe_eudebug_sriov.c
> 
> diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_sriov.c
> new file mode 100644
> index 000000000..eb13981bc
> --- /dev/null
> +++ b/tests/intel/xe_eudebug_sriov.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: Test EU Debugger and SR-IOV interaction
> + * Category: Core
> + * Mega feature: EUdebug/SR-IOV
> + * Sub-category: EUdebug tests
> + * Functionality: EU Debugger framework
> + * Test category: functionality test
> + */
> +
[...]

