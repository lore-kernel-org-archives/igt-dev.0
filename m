Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A60CD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 14:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA98610E4D8;
	Wed, 13 May 2026 14:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2L5fGl3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5E810E4D8
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 14:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778683706; x=1810219706;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ymamydMq3f/2Gaeolg6d3MlTu0fFfmBYi04ad0HYWXI=;
 b=e2L5fGl3zRFzOgkXd1toqr0fHo1XwIceC2K7einXNc9ugDhWCPBpoBQz
 Aq7MaxgiYRi68wOiHOShqnWxjfh8kivz8Lg/+BOpuUcDz7fmtFo0n7/HD
 GBq3y74drq721eb4d4FNUC/KV8AmiS39uD9pOc9ih1b8lrFVOgD+xmg6U
 ENqVhSX433GoLxtAqBFQ2dCyxbp1rIwH665SuEOeSlk4zmB3YdqoRm7Dn
 HWWNY5IESxCymWUR5uYy4PYOFIzLcAzBzIjNGBHQ2IYxld2It86SLhHY8
 KWz4rSIep0WrHFkUR3bFK3OrWW4uH7iQ8sgWcQNIANM5+Yry+XkqPPBHw A==;
X-CSE-ConnectionGUID: VxTopFnMTK2pnt9eezt3iw==
X-CSE-MsgGUID: L9ccfuPVQNSKsaQHj8jbhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79509106"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79509106"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 07:48:26 -0700
X-CSE-ConnectionGUID: cKKsCjANRyqIbpcn5WNNSw==
X-CSE-MsgGUID: qiUHgtUqTMyVGsku17ERtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="268443296"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:48:23 -0700
Date: Wed, 13 May 2026 16:48:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v2 3/3] tests/panthor: Add Panthor sparse VM_BIND tests
Message-ID: <20260513144820.anghyuq6fexafc2r@kamilkon-DESK.igk.intel.com>
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
References: <20260508172537.3456595-1-adrian.larumbe@collabora.com>
 <20260508172537.3456595-4-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508172537.3456595-4-adrian.larumbe@collabora.com>
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
On 2026-05-08 at 18:25:35 +0100, Adrián Larumbe wrote:
> In a separate file for the time being, but should eventually be
> incorporated into panthor_vm.c.

One more nit, there are missing igt_description(), see below.

> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  tests/panthor/meson.build         |   1 +
>  tests/panthor/panthor_vm_sparse.c | 316 ++++++++++++++++++++++++++++++
>  2 files changed, 317 insertions(+)
>  create mode 100644 tests/panthor/panthor_vm_sparse.c
> 
> diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
> index 42a46e9934a9..f9509ecd8816 100644
> --- a/tests/panthor/meson.build
> +++ b/tests/panthor/meson.build
> @@ -3,6 +3,7 @@ panthor_progs = [
>  	'panthor_group',
>  	'panthor_query',
>  	'panthor_vm',
> +        'panthor_vm_sparse',
>  ]
>  
>  foreach prog : panthor_progs
> diff --git a/tests/panthor/panthor_vm_sparse.c b/tests/panthor/panthor_vm_sparse.c
> new file mode 100644
> index 000000000000..fe7d25542f41
> --- /dev/null
> +++ b/tests/panthor/panthor_vm_sparse.c
> @@ -0,0 +1,316 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_panthor.h"
> +#include "panthor_drm.h"
> +
> +int
> +igt_main()
> +{
> +	int fd;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_PANTHOR);
> +	}
> +

Add igt_describe("a subtest description here") here
and in all places before new subtest.

Regards,
Kamil

> +	igt_subtest("vm_bind_sparse") {
[cut]
