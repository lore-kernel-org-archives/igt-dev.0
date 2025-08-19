Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19479CA0EED
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 10:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42EC10E588;
	Tue, 19 Aug 2025 10:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2jwWmet";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C429A10E588
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 10:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755597784; x=1787133784;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2P+gk26vjpdpNxpycyTukdmFMB+wsryLCe822Ri4Rus=;
 b=E2jwWmetiq8llthX6o5A79pMppILrPM1K0WHwlh3bc1/1Jk85igj10Jm
 PGSXeJd7aoLrUnPgEDuTOSX6cUV7cJDHPY8iZaGFeQR8Gqaul1p/XYoH9
 4vuLi+b/m8xWQedIQVuadC/DyKv+W+9h3Y84UBvB4DrRsrCCt+GrVN5Jb
 aZSOshdS/v1L153VTkhBGWZYFNP6ElTQ5kNbMp6XVes/nuCll4LCQKSyA
 00adtYEwHfYaS+cd1I0QzkXODJs0SKGT3GPoXuHKMNdeta4U2zLlfFyD6
 1H56ReDwkeYENFhjjqBXMQzLDWFPgpHu0GZ/3UEbCw66dy2zmmMOoCUeq A==;
X-CSE-ConnectionGUID: NlXnLq0RRHaB4DHVZr2kIA==
X-CSE-MsgGUID: I8l9SykFTgSJZx4Ocd7Ryw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68932674"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="68932674"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 03:03:04 -0700
X-CSE-ConnectionGUID: 0HJLEtBqTOmg3Ds+Fg8ehQ==
X-CSE-MsgGUID: oO4EsZQCTwKFYtAsbwP1Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="198827232"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.251])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 03:03:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/5] tools/intel_vbt_decode: Split up DSI VBT defs
 to a separate file
In-Reply-To: <20250818163448.eachnfxobihzatuk@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1755175663.git.jani.nikula@intel.com>
 <d22624e2bd28cf074708b9ca76dada6438422e9d.1755175663.git.jani.nikula@intel.com>
 <20250818163448.eachnfxobihzatuk@kamilkon-DESK.igk.intel.com>
Date: Tue, 19 Aug 2025 13:02:58 +0300
Message-ID: <0e51d9c0b629240cb3a2687ddb79a164ddb02443@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 18 Aug 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> Hi Jani,
> On 2025-08-14 at 15:48:52 +0300, Jani Nikula wrote:
>> diff --git a/tools/intel_dsi_vbt_defs.h b/tools/intel_dsi_vbt_defs.h
>> new file mode 100644
>> index 000000000000..f83d42ed0c5a
>> --- /dev/null
>> +++ b/tools/intel_dsi_vbt_defs.h
>> @@ -0,0 +1,183 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/* Copyright =C2=A9 2025 Intel Corporation */
>> +
>> +#ifndef __INTEL_DSI_VBT_DEFS_H__
>> +#define __INTEL_DSI_VBT_DEFS_H__
>> +
>> +#include <linux/types.h>
>
> This could be igt header linux_scaffold.h so it will be:
> #include "linux_scaffold.h"
>
> Up to you if you want to change it now or later.

The file's now verbatim copy from kernel, similar to intel_vbt_defs.h
and pciids.h, so it'll have to remain as it is.

BR,
Jani.


--=20
Jani Nikula, Intel
