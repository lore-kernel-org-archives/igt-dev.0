Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B6DC48BC3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 17:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0BB10E135;
	Mon, 19 Feb 2024 17:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFxGWHh/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8958010E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 17:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708364713; x=1739900713;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Mbfb0bSrc/hrPAQezhp57xBL/W7Zbxhirrw1TWu4vGs=;
 b=JFxGWHh/JBtdPoblqRrtpBJic6m/7wpR+zCbkEn0AJB1K3iCX9amYWSz
 7AT8sGYUd8SnfTGLXuw+jgFul8d/4Bm3cQiP5b17VZCPIdLpCc5ftgiuE
 Zcu7IPhkZWeNXEQdMZik2oKjHGwHRU+7yotoBJYfXVdx2OSrqF0ZoMrOh
 LsfqGVoV+PFH2jlqjRYTIf0fWwARbGnQ+Dce06T9206U2UO9pf1e3hynE
 BW8ShR5kZS6ZOmfWtodGHcY0EQ+zIaBnmPJtXZqJNDfUy4+LNPrJd7Btx
 I4z4bujtzSdffh6swHSQGDP9ugzavCcNeypqjz0fx0JOjJAUpjypIFOKk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2904513"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2904513"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 09:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="936319390"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="936319390"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 09:45:11 -0800
Date: Mon, 19 Feb 2024 18:45:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH i-g-t v9 4/7] lib/intel_multigpu: Introduced
 gem_multigpu_count_class and igt_multi_fork_foreach_gpu
Message-ID: <20240219174508.hv5bksvxbycazsh7@kamilkon-desk.igk.intel.com>
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

One more thing I spotted recently, instead of close() it would be
better to use drm_close_driver(__fd), also using __chipset would
make clear what a second parameter should be.

Regards,
Kamil

> >  
> >  #endif /* __INTEL_MULTIGPU_H */
> > -- 
> > 2.42.0
> > 
> 
> For me those helpers looks correct, so:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> --
> Zbigniew
