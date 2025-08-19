Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB60CA0EE6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 12:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC3B10E5D9;
	Tue, 19 Aug 2025 12:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbx/vSlR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1D10E5DA
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755606175; x=1787142175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=So252p0nPPOgarZj7LT+XFOKX8LuLxdIBmCOjqYtTMY=;
 b=mbx/vSlRa5akwZ18A+vh6IkQ7T/N7oK3rOIbwZ9hI3BXq7a0Ry1ucNwT
 KCexx0h1i8b56qosFzXpfk4VPjNHJa3Dg7dCyjQxvtSV/LgugBDsrc1iQ
 jL30KzsMj37NSylWH0AuinJFsRHjZFUdSqROyyFHr1nwH2U6L56s0Ibrk
 qH2ZMMszhNzhw7GLiJ9ICz0qaDxdQ2y7rX/To10HaeTUeZWqdKUG1ccYy
 Y4PyqTJYqW3F0rbkwOdPdRG8LuyaLIG7zAVHph5+qJhW9Ix2ZvTXnW8OL
 qAJ0biSnsZmWhH42ZHk9+eUGgoT/FdyTpcNlC80bAqnPb57G63WxSmzKM w==;
X-CSE-ConnectionGUID: h277h2qvTVSR7LlEhhYZSg==
X-CSE-MsgGUID: j5tODyTASZexlW+TwcLPag==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="60471500"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="60471500"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 05:22:55 -0700
X-CSE-ConnectionGUID: ICeuqS5WQ32Cp2rp0OSPNw==
X-CSE-MsgGUID: /VP8sf8PQdSgmByoRqN8bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167451523"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 05:22:53 -0700
Date: Tue, 19 Aug 2025 14:22:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/5] tools/intel_vbt_decode: Split up DSI VBT defs
 to a separate file
Message-ID: <20250819122251.vk7uhtkjp3rithtx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <cover.1755175663.git.jani.nikula@intel.com>
 <d22624e2bd28cf074708b9ca76dada6438422e9d.1755175663.git.jani.nikula@intel.com>
 <20250818163448.eachnfxobihzatuk@kamilkon-DESK.igk.intel.com>
 <0e51d9c0b629240cb3a2687ddb79a164ddb02443@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e51d9c0b629240cb3a2687ddb79a164ddb02443@intel.com>
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

Hi Jani,
On 2025-08-19 at 13:02:58 +0300, Jani Nikula wrote:
> On Mon, 18 Aug 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > Hi Jani,
> > On 2025-08-14 at 15:48:52 +0300, Jani Nikula wrote:
> >> diff --git a/tools/intel_dsi_vbt_defs.h b/tools/intel_dsi_vbt_defs.h
> >> new file mode 100644
> >> index 000000000000..f83d42ed0c5a
> >> --- /dev/null
> >> +++ b/tools/intel_dsi_vbt_defs.h
> >> @@ -0,0 +1,183 @@
> >> +/* SPDX-License-Identifier: MIT */
> >> +/* Copyright © 2025 Intel Corporation */
> >> +
> >> +#ifndef __INTEL_DSI_VBT_DEFS_H__
> >> +#define __INTEL_DSI_VBT_DEFS_H__
> >> +
> >> +#include <linux/types.h>
> >
> > This could be igt header linux_scaffold.h so it will be:
> > #include "linux_scaffold.h"
> >
> > Up to you if you want to change it now or later.
> 
> The file's now verbatim copy from kernel, similar to intel_vbt_defs.h
> and pciids.h, so it'll have to remain as it is.
> 
> BR,
> Jani.
> 

It could stay for now unless there will be another FreeBSD porting
effort.

Regards,
Kamil

> 
> -- 
> Jani Nikula, Intel
