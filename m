Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE6CCA0EF8
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 15:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6727210E9C4;
	Thu, 21 Aug 2025 15:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjnvzH4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A47A10E9C0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755788626; x=1787324626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oAuFL1qna9OT7NtdRwmf/PTcfGs0yRIfGGy3GKKSvIk=;
 b=GjnvzH4llLg8tcwrzaIuKeWedTlApze8Pvjqh0qbnjNePvuK+QncG3mb
 g3tzuD17YEAg2eqtL/E3+dABscT/QVohHdXqDOWhBhwwY7xjLffwFpQKx
 AZnaHUJoPL24cBIDy0wfHDHDrX81RaHRXm8Rz7yUQSjJEGhk4p2GAiqvr
 S0KV4v2urAqqN9vPcog71NAxvqiGCe4apR3kU824ppsgVsSV41fVhxXuv
 GVtJNg7W8+Qgtn4TtyE6+EJdgoLpPys9hUQQghSiSUVSM3A9Z5R2a7Zy1
 80bZqRw5iVsnkU2Uh9c4JbjrMD/7bFY7fiq3BrMm5d1liIYHNh3FwMuB3 A==;
X-CSE-ConnectionGUID: fuzC09T0RG+5C+3WrPzqVA==
X-CSE-MsgGUID: /c7UWjfdRpuV+2EdldWDUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58228289"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="58228289"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 08:03:46 -0700
X-CSE-ConnectionGUID: 4kAwHo7gSxO3yzPgEFA3MQ==
X-CSE-MsgGUID: JdHri9ocTHe12jz/x1ksYw==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 08:03:43 -0700
Date: Thu, 21 Aug 2025 17:03:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Santa, Carlos" <carlos.santa@intel.com>,
 "Sebinraj, S" <s.sebinraj@intel.com>,
 "B S, Karthik" <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t] tools/xe_gpu_frequency: Add tool to set/get Intel
 GPU frequency for Xe
Message-ID: <20250821150329.6ujm5eyh4oqujnea@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Santa, Carlos" <carlos.santa@intel.com>,
 "Sebinraj, S" <s.sebinraj@intel.com>,
 "B S, Karthik" <karthik.b.s@intel.com>
References: <20250820125121.1387843-1-jeevaka.badrappan@intel.com>
 <20250820163528.trzmxfbwojmg74p6@kamilkon-DESK.igk.intel.com>
 <IA1PR11MB6268A74F8E0560EDE84E03BBED32A@IA1PR11MB6268.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA1PR11MB6268A74F8E0560EDE84E03BBED32A@IA1PR11MB6268.namprd11.prod.outlook.com>
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

Hi Jeevaka,
On 2025-08-21 at 09:10:26 +0000, Badrappan, Jeevaka wrote:
> Hi Kamil,
> 
> > Please consider improving already existing tool intel_gpu_frequency instead of copy-paste.
> 
> There were 2 solutions considered:
> 1. Add support for Xe driver to the existing intel_gpu_frequency
> 2. Separate tool that will build on intel_gpu_frequency but specific to Xe driver
> 
> 2nd solution was chosen for the below reasons:
> - sysfs frequency path for i915 and Xe is different.

Please give example.

> - tile and gt needs to be taken into consideration.

Do we need more options here?

> - Might not be accepted due to readability because of device type checks, name based on device types, extending i915 tool to support Xe driver.
> 
> If the recommendation is to extend intel_gpu_frequency,
> can provide a patch that adds supports for Xe driver to
> existing intel_gpu_frequency tool. Please confirm.

From user point perspective, when there are two tools it becomes
more complicated which tool to use. This one is simple enough
and imho this should stay as a one tool. 

Please try to extend existing tool first. If it will become more
complicated you could then consider splitting sources into two or
three C files but first lets see how it will fit into one.

Regards,
Kamil

> 
> > Please do not write exact output here, it could be in cover
> 
> > letter but rather not in commit message. You could add how
> 
> > it could be called into examples, when program is called with
> 
> > --help
> 
> Will address in next patch set.
> 
> 
> > +/*
> 
> > + * Copyright © 2025 Intel Corporation
> 
> > + *
> 
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> 
> 
> 
> > We use SPDX licence, please look into few other tools/tests which uses them.
> 
> Will address in next patch set.
> 
> Regards,
> Jeevaka
