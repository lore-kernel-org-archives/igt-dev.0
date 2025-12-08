Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AB8D3B7DE
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 10:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802FC10E2F1;
	Mon,  8 Dec 2025 10:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ea8Zrxv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D013710E2F1
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765188311; x=1796724311;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9hpN+MGxlDh2Jw8GMjuYigz3y8iLN72APwn3EPOoztk=;
 b=ea8Zrxv+o0AnRnIMkIz0FQic73A1e0u/SqCv+H9nQ+w96Uu98LsUaYjH
 5OmJ0W1+5nru7SfSNyXzV3y4iPxrd9bsF8JCdl/ewuozNwzsidYgW0INO
 ZOv4tlyHLS/Im0vivUXsWhfjUbZ22R5aHgRf9WKO8U4LAUeShBIorl5/B
 uaa9+LwxN0KAEeA3gXi1wUh7rKwr8xdqgC5fvfz4jBbxr9qVLEyoK7kms
 XqGuBAT2vFwnhaW7hxsaY3DJJPY7Hric8t1rEJccwqD85yw7cGnCpTG4P
 Uynl4vMr8kjBSCvoAN4QKce//42CvyLdpjiTs4iqSQfPfkKtLhq5oNj3p g==;
X-CSE-ConnectionGUID: Qs/cY3czRgabp8dwipOh1g==
X-CSE-MsgGUID: 0FBoL6FFT3aCT89ixnP1TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="70969784"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="70969784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 02:05:10 -0800
X-CSE-ConnectionGUID: rClB+j7kQzmoPiWQb3lf5w==
X-CSE-MsgGUID: qSxBEHu7QvuXcGaYXqEW8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195700094"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 02:05:08 -0800
Date: Mon, 8 Dec 2025 11:04:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t 2/2] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
Message-ID: <20251208100444.smz5sxa5k5tq4t5z@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Purkait, Soham" <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, kamil.konieczny@intel.com
References: <20251127094043.3916839-1-soham.purkait@intel.com>
 <20251127094043.3916839-3-soham.purkait@intel.com>
 <20251205170257.ziuhcoetjvxnr5xa@kamilkon-DESK.igk.intel.com>
 <e326c74a-a228-42fb-b748-94dc51e94fee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e326c74a-a228-42fb-b748-94dc51e94fee@intel.com>
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

Hi Purkait,,
On 2025-12-08 at 13:38:50 +0530, Purkait, Soham wrote:
> Hi Kamil,
> 
> On 05-12-2025 22:32, Kamil Konieczny wrote:
> > Hi Soham,
> > On 2025-11-27 at 15:10:43 +0530, Soham Purkait wrote:
> > > Introduce vendor-agnostic support for handling multiple GPUs and instances
> > > in gputop. Improve the tool's adaptability to various GPU configurations.
> > > 
> > > v1:
> > >   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
> > > v2:
> > >   - Add device filter to populate the array of cards for
> > >     all supported drivers. (Zbigniew)
> > > v3:
> > >   - Cosmetic changes. (Riana)
> > >   - Avoid three level indentation. (Riana)
> > > v4:
> > >   - Add user message for running without root privileges. (Kamil)
> > > 
> > > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > > ---
> > >   tools/{ => gputop}/gputop.c | 253 ++++++++++++++++++++++++++++++------
> > >   tools/gputop/meson.build    |   6 +
> > >   tools/meson.build           |   6 +-
> > >   3 files changed, 220 insertions(+), 45 deletions(-)
> > >   rename tools/{ => gputop}/gputop.c (63%)
> > >   create mode 100644 tools/gputop/meson.build
> > > 
> > > diff --git a/tools/gputop.c b/tools/gputop/gputop.c
> > > similarity index 63%
> > > rename from tools/gputop.c
> > > rename to tools/gputop/gputop.c
> > > index f577a1750..4d6c684b2 100644
> > > --- a/tools/gputop.c
> > > +++ b/tools/gputop/gputop.c
> > > @@ -1,6 +1,6 @@
> > >   // SPDX-License-Identifier: MIT
> > >   /*
> > > - * Copyright © 2023 Intel Corporation
> > > + * Copyright © 2023-2025 Intel Corporation
> > >    */
> > >   #include <assert.h>
> > > @@ -14,66 +14,149 @@
> > >   #include <math.h>
> > >   #include <poll.h>
> > >   #include <signal.h>
> > > +#include <stdbool.h>
> > >   #include <stdint.h>
> > >   #include <stdio.h>
> > >   #include <stdlib.h>
> > >   #include <string.h>
> > >   #include <sys/ioctl.h>
> > >   #include <sys/stat.h>
> > > +#include <sys/sysmacros.h>
> > >   #include <sys/types.h>
> > > -#include <unistd.h>
> > >   #include <termios.h>
> > > -#include <sys/sysmacros.h>
> > > -#include <stdbool.h>
> > > +#include <unistd.h>
> > > +#include "drmtest.h"
> > This tool should not use drmtest if possible. The main reason it
> > is a tool not a test, and drmtest is mainly for testing.

> This header is actually not being used. Let me remove it in the next rev.

> > 
> > Let me explain how it should work in pseudocode:
> > 
> > for each g in gpu_set
> > 	p = get_plugin(g)
> > 	if p and plugin_supports_gpu(p, g) and could_display(p, g)
> > 		display_workload_by_plugin(p, g)
> > 	else
> > 		display_using_old_gputop_method(g)
> > 	fi

> If you mean to call intel_gpu_top in case of i915 driver, yes it could be
> implemented as a workaround but in that case it world not work if
> capabilities are set to  gputop using setcap as execv() or similar call does
> not preserve capabilities even if the pid remains same. In my view, it would
> be best to incorporate i915 support for gputop.
> 
> Thanks,
> Soham

No, I mean gputop before your modifications, not intel_gpu_top.

Regards,
Kamil

> > 
> > This way you do not need to implement plugin for i915 as it will
> > just work by fall through. Plugin could just extend printed info
> > when someone calls it with root/sudo or group or with added
> > capabilities.
> > 
> > If this is hard, you could also consider creating new tool, for
> > example ngputop (n = new). In new tool you could make new
> > assumptions and ignore GPUs for which there is no plugin, also
> > demand having root or capabilities.
> > 
> > Regards,
> > Kamil
> > 

[cut]

