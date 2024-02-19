Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA78C48BF8
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 17:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D331410E302;
	Mon, 19 Feb 2024 17:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAtzA6F2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FF610E302
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708364447; x=1739900447;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XyfjXynBaNJRPplPrplz2Q4RH7vEKS3/dNod4H19BMA=;
 b=XAtzA6F2Asnw9XIq4ktddZtEPXSUKkqOdJHByouGQa5zj0komwu/kZUE
 ntoqXtxmGwgYttpBM8T8ov1puwD24lWZvTCNZAwEDXAwzrDE7/D33pyd/
 Glvpv9FicX+g1G5IbYgoVjyEdJ2FvXBaSiY1ZeQz/TlFqTe0cIineObRq
 z5cqMhRQ83GaQILGzhrsyFTW79T7817bk9lhBK6NqLiv5ui9I2SPJ/Lg4
 gEIlwvk0Zkw1d3FvUkcY/UMG6eRbCR/riko3Lb34HzOlCHW+k6uqvWA9H
 6Zpwl9iEcazzXa85/ORct7rvuZ7vi8fskjf5zT4pxGwnKeL++7/E8GVWM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2316375"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2316375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 09:40:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="35578263"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 09:40:46 -0800
Date: Mon, 19 Feb 2024 18:40:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH i-g-t v9 4/7] lib/intel_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
Message-ID: <20240219174043.ft2yirn7eyu4g376@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20240215161014.60304-1-kamil.konieczny@linux.intel.com>
 <20240215161014.60304-5-kamil.konieczny@linux.intel.com>
 <20240219112030.3vcwjr35m6kcqxkt@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240219112030.3vcwjr35m6kcqxkt@zkempczy-mobl2>
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
On 2024-02-19 at 12:20:30 +0100, Zbigniew Kempczyński wrote:
> On Thu, Feb 15, 2024 at 05:10:11PM +0100, Kamil Konieczny wrote:
> > From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > 
> > Introduced gem_multigpu_count_class function that returns an actual
> > number of GPUs present in system, which allows for writing multi-GPU
> > test scenarios that does not require
> > --device pci:vendor=intel,device=discrete,card=all
> > to run as intended. Based on patch by Chris Wilson.
> > 
> > Introduced igt_multi_fork_foreach_gpu macro that helps with
> > writing multi-GPU test scenarios in idiomatic form:
> > 
> > igt_multi_fork_foreach_gpu(i915, DRIVER_INTEL)
> > 	test_function(i915);
> > igt_waitchildren();
> > 
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Signed-off-by: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
> > Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/intel_multigpu.c | 11 +++++++++++
> >  lib/intel_multigpu.h | 15 +++++++++++++++
> >  2 files changed, 26 insertions(+)
> > 
> > diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
> > index 34c9f936d..0e76d8aa3 100644
> > --- a/lib/intel_multigpu.c
> > +++ b/lib/intel_multigpu.c
> > @@ -3,10 +3,21 @@
> >   * Copyright © 2023 Intel Corporation
> >   */
> >  
> > +#include "drmtest.h"
> >  #include "igt_core.h"
> >  #include "igt_device_scan.h"
> >  #include "intel_multigpu.h"
> >  
> > +int gem_multigpu_count_class(int class)
> > +{
> > +	int count = 0;
> > +
> > +	igt_foreach_gpu(fd, class)
> > +		count++;
> > +
> > +	return count;
> > +}
> > +
> >  void gem_require_multigpu(int count)
> >  {
> >  	struct igt_devices_print_format fmt = {
> > diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h
> > index 98dc5a4ce..0ebc73e4a 100644
> > --- a/lib/intel_multigpu.h
> > +++ b/lib/intel_multigpu.h
> > @@ -6,6 +6,21 @@
> >  #ifndef __INTEL_MULTIGPU_H
> >  #define __INTEL_MULTIGPU_H
> >  
> > +#include "drmtest.h"
> > +#include "igt_core.h"
> > +
> >  void gem_require_multigpu(int count);
> > +int gem_multigpu_count_class(int class);
> > +
> > +#define igt_foreach_gpu(fd__, id__) \
> > +	for (int igt_unique(i) = 0, fd__; \
> > +		(fd__ = __drm_open_driver_another(igt_unique(i)++, id__)) >= 0; \
> > +		close(fd__))
> > +
> > +#define igt_multi_fork_foreach_gpu(__fd, __id) \
> > +	igt_multi_fork(igt_unique(__i), gem_multigpu_count_class(__id)) \
> > +		for (int __fd = drm_open_driver_another(igt_unique(__i), __id); \
> > +			__fd >= 0; \
> > +			close(__fd), __fd = -1) \
> >  
> >  #endif /* __INTEL_MULTIGPU_H */
> > -- 
> > 2.42.0
> > 
> 
> For me those helpers looks correct, so:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Should I squash it with previous patch? So it will be a complete
and it will be complete at once.

Regards,
Kamil

> 
> --
> Zbigniew
