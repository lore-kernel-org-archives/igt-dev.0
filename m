Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDD9CA0EDC
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 08:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFA410E6BE;
	Wed, 20 Aug 2025 08:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UTBBZRZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4FE10E6BE
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755680287; x=1787216287;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3mcVNpc4/uFCX5zcXvoWI2AZtyvA/rcPml19w/7itm8=;
 b=UTBBZRZYAK0KnTHsoKw7KWm0/1nx5pXaL6+Dy4RftmcwMc4rdEcRIbxA
 tSQ9kUVwsCvWLIdjhJb2aAvStz+dF1brDAnKK46xQu6615zq/Mc1OTviC
 euvSecipnVapsE0dlI9wcF8emK9i1O+BdYiP8LTBo1txoeNdpxABVBlxO
 MgTRW+b0w+JYK2uylzZ823aEZZBWWluIkulQxE1lYoEFq3jYsEyXcGpia
 U5Xb5tmLuqUkw41ZLe4++RfFqnqphQuFzWR+kixc7EvzEODXEwBPAIgQ4
 4PMHIC1p4Y0W4phUpU4WFGGa7C3UPRwBT+2oPuIZfPalM8vTdzIA0QWzt w==;
X-CSE-ConnectionGUID: 6tTYiMb0R0Ofs8XrjWNvrQ==
X-CSE-MsgGUID: fWUGBUhqQnqFDjyexdIK/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68540621"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="68540621"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 01:58:07 -0700
X-CSE-ConnectionGUID: a0IbeaC3S5imy+c0xR6UXA==
X-CSE-MsgGUID: Sv17p8IfT9+3GwwV+N6pjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="191767870"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 01:58:05 -0700
Date: Wed, 20 Aug 2025 10:58:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tools/intel_vbt_decode: convert copyright signs
 from latin1 to utf8
Message-ID: <20250820085803.nryt4obuw5wgjkva@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <20250820072405.3518554-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820072405.3518554-1-jani.nikula@intel.com>
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
On 2025-08-20 at 10:24:05 +0300, Jani Nikula wrote:
> Various tools trip over with latin1 characters in the source, as
> nowadays everything pretty much expects utf8.
> 
> For example, [1] fails to apply in both Patchwork and b4, because
> somewhere along the way, the latin1 copyright sign has in fact been
> automagically converted to utf8, and the source still has latin1.
> 
> Instead of debugging legacy encodings and conversions, just convert the
> remaining latin1 files to utf8 using iconv.
> 
> [1] https://lore.kernel.org/all/7090e70d712c94aed53f52c49a8155eb4c6b966c.1755175663.git.jani.nikula@intel.com/
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thank you for a fix, I will merge it soon with small change in
subject, s/sings/sign/ as this is only one file and one char.

Regards,
Kamil

> 
> ---
> 
> v2: Rebase, intel_bios.h no longer exists.
> 
> I'll be trying 'git send-email --8bit-encoding=iso-8859-1' on this
> one. Fingers crossed.
> ---
>  tools/intel_vbt_decode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 6882ae1d2f63..a4e76b7559d2 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright © 2006 Intel Corporation
> + * Copyright Â© 2006 Intel Corporation
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a
>   * copy of this software and associated documentation files (the "Software"),
> -- 
> 2.47.2
> 
