Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10750FED3E6
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 15:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F95810E365;
	Fri, 24 Apr 2026 15:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DusFYzmr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CE210E365
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777045061; x=1808581061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=o5AGeSGRrBu32QBATCtSilEp0cBtv3khp8Ld5TstpNY=;
 b=DusFYzmrbQKp/kQexNFawMyDO4NRfDciicsDR7PS4wFPOv5P3q5ppE7k
 hDFGIpGRzAugai0cUR7yq2D74/roLzp8xM0nMKbGoM1COsk+vqKR23ZA5
 936IIkILtpHmFXiD95hWOVTk0nN5HE9LTJZ+jHfD/zRp7o9zp+qEmuHCp
 4Hgb00r8BZAFEzGcnrlJo/CR+zS5fhI3hVIqhdXqVImJWt0v8j8Ok+a2g
 t3xIggTVQWVZKwrN3iYkBd2bJT7lrWUleUweLbqxZNSuOAP605ok3d8/0
 frgmBckTR2Y/Gqg6P4TxIIAS4Xo6Roas8gIsP/aGqgRPA1/HuigkPar9c A==;
X-CSE-ConnectionGUID: VPptlw/CSSeUVXNI427jCw==
X-CSE-MsgGUID: VyMZnZTtS6+4feO4PZUjpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="81884245"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="81884245"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 08:37:41 -0700
X-CSE-ConnectionGUID: 7UHdjQBSRsuP0iULqa+5UA==
X-CSE-MsgGUID: H4s8N/aQQ2603ScWxQp+qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="232886212"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.28])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 08:37:39 -0700
Date: Fri, 24 Apr 2026 17:37:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/3] lib/rendercopy: Convert rendercopy_gen9 to use
 genxml pack headers
Message-ID: <ygjjh6w6ljlb7jt3cpvwjleotcein6frzgniojrew2vqtbgaoh@4bsktacozbjq>
References: <20260407132620.1397340-1-jan.maslak@intel.com>
 <20260407132620.1397340-3-jan.maslak@intel.com>
 <adUcIQUIfJxjvaSx@intel.com>
 <avcncasy2hs6unvhve3e6xh4vojhbbzsxt2lvs4vqjyx55ieet@g5fx4noqpogw>
 <aetKDptHSWxeaTQD@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aetKDptHSWxeaTQD@intel.com>
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

On Fri, Apr 24, 2026 at 01:46:38PM +0300, Ville Syrjälä wrote:
> On Fri, Apr 24, 2026 at 12:21:37PM +0200, Zbigniew Kempczyński wrote:
> > On Tue, Apr 07, 2026 at 06:00:49PM +0300, Ville Syrjälä wrote:
> > 
> > <cut>
> > 
> > > > +	/* MOCS encoding: genxml has a single 7-bit MOCS field (bits 30:24).
> > > > +	 * The old struct had mocs_index:6 at bits 30:25 and pxp:1 at bit 24.
> > > > +	 * Reproduce the same bit layout. */
> > > > +	mocs = (buf->mocs_index << 1) | (intel_buf_pxp(buf) ? 1 : 0);
> > > 
> > > This annoying mocs_index stuff should be nuked throughout igt,
> > > and replaced with the full mocs field. I've already gotten
> > > confused by this multiple times when it looked like the 
> > > relevant macros were off by one bit when compared to the spec.
> > 
> > IMO we can't stop using mocs index. BLOCK_COPY for Xe2+ has mocs index
> > on bits[27:24] and encrypt is on bit[21]. Bits[23-22] are reserved.
> 
> If that's the exception then it would be better to handle it there.
> Everything else just has a single MOCS field, and the encryption bit
> (if it exists) is just part of it. The current thing makes zero sense
> for platforms that don't have the encrypt bit, and for the platforms
> where the encrypt bit is part of MOCS the whole thing is just
> intentionally confusing.

I've found 4 exceptions in xe2.xml where MOCS doesn't use previous
[7] or [6+1] bit arrangements.

Interesting is EXECUTE_INDIRECT_DISPATCH contains MOCS index only. We're
not using this command in IGT, but this shows index also can appear
standalone. I think IGT should provide both interfaces - for getting
MOCS index standalone and for getting the full MOCS field and on
usecase depends which interface should be used.

--
Zbigniew

> 
> -- 
> Ville Syrjälä
> Intel
