Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDCFC48BF8
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 17:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFA610E392;
	Mon, 19 Feb 2024 17:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kx3z1dCh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5822C10E3E6
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 17:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708364279; x=1739900279;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jQ0PuNFfTUHhUlKFaHZpSjovqRQ3bI3CDLvOdqIyIZE=;
 b=kx3z1dChX3kWRR1azEn4D6lS5DcFbGe/GE17do4416p0O6og05WaTaSb
 lJtM/z49ELjPqqhlK6zLM2J0NPwp82YN/hJmxbBB8SDIGsw90H84PUK0g
 unE1SsabADuBnE4ftPfXQChO2mhVrAH3Sh5nzbCRd7O0zESuDkjTcIMP+
 SY451TvIevA8IBAuOrI3m8di/wD+o8KkA0Qz4tg/gHov2P1NrqE454UP4
 1Hs/n2WfTwFf7ihr25yXC5TFuSU0Bc9tqWjbjnvFeO84LQ6KgoNBT3l3q
 XTP1Uq7ZX9C853gxlEtl82WamjeksiIZW3vhDS8V0pMJ/X270dLLQcEdE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="24912235"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="24912235"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 09:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="27716702"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 09:37:57 -0800
Date: Mon, 19 Feb 2024 18:37:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v9 3/7] lib/intel_multigpu: Introduce library for
 multi-GPU scenarios
Message-ID: <20240219173754.tgfmzdeh6bdyilne@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20240215161014.60304-1-kamil.konieczny@linux.intel.com>
 <20240215161014.60304-4-kamil.konieczny@linux.intel.com>
 <20240219111104.53sdorfempz6tp6i@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240219111104.53sdorfempz6tp6i@zkempczy-mobl2>
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

Hi Zbigniew,
On 2024-02-19 at 12:11:04 +0100, Zbigniew Kempczyński wrote:
> On Thu, Feb 15, 2024 at 05:10:10PM +0100, Kamil Konieczny wrote:
> > From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > 
> > Implemented gem_require_multigpu in order to replace
> > igt_require(gpu_count > 1), as well as printing available
> > PCI devices if requirement fails.
> > 
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Signed-off-by: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
> > [Kamil: fixed whitespace and tabs, moved to lib/intel_multigpu.*]
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/intel_multigpu.c | 28 ++++++++++++++++++++++++++++
> >  lib/intel_multigpu.h | 11 +++++++++++
> >  lib/meson.build      |  1 +
> >  3 files changed, 40 insertions(+)
> >  create mode 100644 lib/intel_multigpu.c
> >  create mode 100644 lib/intel_multigpu.h
> > 
> > diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
> > new file mode 100644
> > index 000000000..34c9f936d
> > --- /dev/null
> > +++ b/lib/intel_multigpu.c
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#include "igt_core.h"
> > +#include "igt_device_scan.h"
> > +#include "intel_multigpu.h"
> > +
> > +void gem_require_multigpu(int count)
> > +{
> > +	struct igt_devices_print_format fmt = {
> > +		.type = IGT_PRINT_SIMPLE,
> > +		.option = IGT_PRINT_PCI,
> > +	};
> > +	int devices;
> > +
> > +	if (igt_device_filter_count() >= count)
> > +		return;
> 
> If we have 2 filters and count == 2 we return?
> 

For two or more GPUs one can write:

gem_require_multigpu(2);

Regards,
Kamil

> --
> Zbigniew
> 
> > +
> > +	igt_info("PCI devices available in the system:\n");
> > +
> > +	igt_devices_scan(true);
> > +	devices = igt_device_filter_pci();
> > +	igt_devices_print(&fmt);
> > +
> > +	igt_skip("Test requires at least %d GPUs, %d available.\n", count, devices);
> > +}
> > diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h
> > new file mode 100644
> > index 000000000..98dc5a4ce
> > --- /dev/null
> > +++ b/lib/intel_multigpu.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#ifndef __INTEL_MULTIGPU_H
> > +#define __INTEL_MULTIGPU_H
> > +
> > +void gem_require_multigpu(int count);
> > +
> > +#endif /* __INTEL_MULTIGPU_H */
> > diff --git a/lib/meson.build b/lib/meson.build
> > index 6122861d8..8251695e1 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -65,6 +65,7 @@ lib_sources = [
> >  	'intel_device_info.c',
> >  	'intel_mmio.c',
> >  	'intel_mocs.c',
> > +	'intel_multigpu.c',
> >  	'intel_pat.c',
> >  	'ioctl_wrappers.c',
> >  	'media_spin.c',
> > -- 
> > 2.42.0
> > 
