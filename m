Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AB6EEEC3B
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 13:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF40210E216;
	Fri, 13 Sep 2024 13:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJ310Qei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C709D10E216
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726233213; x=1757769213;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=j/mpDkeb7QT9RUXWYo6XkPze6h17O2b4o7Bv3bSICAg=;
 b=HJ310Qei7H2gjVfDWOcV3SFyxI3lEZrSnopPgC99b884AyVA8M0yCiJN
 cfHN6br+OsPY+m0HPZJ165yAs8GbKHYCeoGc3KSwGZxGga5v10Z2uPTDS
 ROpt0eQgZZo/3pj6AWbGmx/w2CF9dhcE0OEF3jhYKKNoSTxfNICaVl/cU
 /MRv/SQ/WZFGrT5yWnD6AmJB8sC5MiSyFFejuPMz27av3fZc9TBn9bqNV
 qERjDh2Crka5IQDwPw8daJEKwE++xJaV/iuAA8SfXjzA4Y3f7iZ9snJ7g
 HHBZOnN2//DTaCUeUrbaIGcGzAz5K1QKMFrH5Ze+aQ+0BTKRDIdwTSBYL w==;
X-CSE-ConnectionGUID: gnnI6eLIRgKzJkTz6XMksg==
X-CSE-MsgGUID: qXxb3NQ7QEKA2d8D1d/kKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25066504"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="25066504"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 06:13:31 -0700
X-CSE-ConnectionGUID: PBHlNIarR/uxk1cioPJyeg==
X-CSE-MsgGUID: NQGlUd7rSl6ZW7LhpVIxMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="67756041"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 06:13:29 -0700
Date: Fri, 13 Sep 2024 15:13:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/13] tools/intel_vbt_decode: Various improvement
Message-ID: <20240913131314.oc5qyjpi6gz5eipc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-03-22 at 22:41:12 +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> A pile of improvements to the VBT decoder.
> 
> Ville Syrjälä (13):
>   tools/intel_vbt_decode: update vbt defs from kernel
>   tools/intel_vbt_decode: Extract default_algorithm()
>   tools/intel_vbt_decode: Allow blocks to be named without full decoding
>   tools/intel_vbt_decode: Print the block min size
>   tools/intel_vbt_decode: Dump AIM offsets
>   tools/intel_vbt_decode: Decode the backlight i2c stuff
>   tools/intel_vbt_decode: Decode the obsolote DPST supported field
>   tools/intel_vbt_decode: Check version before decoding
>     lace_aggressiveness_profile
>   tools/intel_vbt_decode: Add version checks for backlight decoding
>   tools/intel_vbt_decode: Dump out the backlight entry size
>   tools/intel_vbt_decode: Dump MIPI sequences in the order they appear
>     in VBT
>   tools/intel_vbt_decode: Decode all the driver feature bits
>   tools/intel_vbt_decode: Decode the EFP index
> 
>  tools/intel_vbt_decode.c | 125 +++++++++++++++++++++++++++------------
>  tools/intel_vbt_defs.h   |  36 +++++------
>  2 files changed, 106 insertions(+), 55 deletions(-)
> 
> -- 
> 2.43.2
> 

Sorry for the late question, could you comment (or close if needed)
igt gitlab ticket #95 ?

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/95
Need intel_vbt_decode update for parsing VBT 234+

Regards,
Kamil

