Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8197CAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 19:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5846110E021;
	Thu,  2 Oct 2025 19:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzFrh6Ls";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F1910E021
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 19:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759434777; x=1790970777;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=3pgYeKZOapY1kJ71YQ9K2PXdi4t2BNA8UbZ/nVL/dS0=;
 b=UzFrh6LsUHbifybRuQ+TxSc3CZ/RxBWRombsFE9kMeZ5k6c3Q4WW4mfa
 Z7Bf6v2Ug82f3+s0/Cw90DCwmZMBQ2WVc5UZbYw4PzC1OtkWRPqVl1OO4
 OciJhk88IfC0g5v/mdoICp+KNxPXOZhHdNxvampIEbe2XL2CaBKRbAEvD
 /ln2Lk9ObkzXYtQUhgov86dLrC27xiz+F8yEwPuFC0JLBwvMenDioFv2q
 RSBrtUajRbUAgNi5sWQVSRVw/AlQfFrZ3ljLLN2yrmkooEkkAsDEO9EMl
 TmYSbuiKaRybxqnB0MjxeJkH12pP56A/Z7DBpZseXSUBwlsybtwiEgnfl A==;
X-CSE-ConnectionGUID: 7kmhkrmoT3OBY92bnK1FBA==
X-CSE-MsgGUID: zlDAD/WyQoGWeyge2E+kOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61642968"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61642968"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:52:42 -0700
X-CSE-ConnectionGUID: PbXELBJ3SQmIVG3lGjiP/Q==
X-CSE-MsgGUID: u4wCbC+wRRuYMmT1EseEAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="183526093"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:52:40 -0700
Date: Thu, 2 Oct 2025 21:52:38 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 1/7] lib/gt: Fix IGT_NO_FORCEWAKE handling
In-Reply-To: <20250922160950.27250-2-ville.syrjala@linux.intel.com>
Message-ID: <71ee78a3-3026-fbe0-3c60-cf26ab8c94f6@intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
 <20250922160950.27250-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="8323329-1096715663-1759404475=:1357965"
Content-ID: <c8c6f32c-f19c-a309-11d2-9d6f31064925@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1096715663-1759404475=:1357965
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <1067d3a8-f3f1-9aba-d538-527fe652d8ae@intel.com>

On Mon, 22 Sep 2025, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> igt_open_forcewake_handle_for_pcidev() forgets to check for
> the IGT_NO_FORCEWAKE environment variable, which is a real
> problem when one wants to frob the registers without forcing
> power state changes in the hardware (eg. to observe display
> low power watermark residencies/etc.)
>
> Add the missing IGT_NO_FORCEWAKE check.
>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Fixes: 114b9ff31d19 ("lib/igt_gt: Add igt_open_forcewake_handle_for_pcidev()")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1096715663-1759404475=:1357965--
