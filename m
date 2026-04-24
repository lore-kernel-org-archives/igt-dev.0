Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D47FE5202
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 10:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD7A10F505;
	Fri, 24 Apr 2026 10:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0JjHrtV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A653D10E325
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777027603; x=1808563603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WRFZGphMoYisAyKDLoC40pb3TKMvLmxTVTrOUstFJ3A=;
 b=W0JjHrtVKaGOCP/zDEt+I8tTaEet7p6i3sz9dgyu5PB2+tsG3t+2eFbU
 7MnfDUhbxAQRD3mIWzS8UkWy02n0FTvZeiRrkeRoartkf4z/yrLYn1l3a
 cEcICWgfUHAeclxkGkD9sOWsKxKXz4Oy0XfJ+6bE0JZwk+BxDBRBdsZPE
 cmAciXYcegcEfBNPHRK0HTn3q3BmsiAbUkotVxUJj2IAyOutHGHgcLINE
 BoAQ4WlCVrhRy1GvQs017e5V+8SwPCKEoPflGzS1tQIPvOdhRj6jxZDKI
 al+NnnWeEgz6TUvb/fv8co19z7Peq6wjVc7VinmA4t5ynHOmX+EBgLPX0 A==;
X-CSE-ConnectionGUID: ss1Zv+YOR/2Awzpj4D57tQ==
X-CSE-MsgGUID: SiMzjPgPS9Kx5k9/SuPF9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77035909"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77035909"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:46:43 -0700
X-CSE-ConnectionGUID: 3blKxc1MSO+Z+GORYGqZoQ==
X-CSE-MsgGUID: wsbMIem0SM2/5wY6y2OCLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="237263557"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:46:42 -0700
Date: Fri, 24 Apr 2026 13:46:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/3] lib/rendercopy: Convert rendercopy_gen9 to use
 genxml pack headers
Message-ID: <aetKDptHSWxeaTQD@intel.com>
References: <20260407132620.1397340-1-jan.maslak@intel.com>
 <20260407132620.1397340-3-jan.maslak@intel.com>
 <adUcIQUIfJxjvaSx@intel.com>
 <avcncasy2hs6unvhve3e6xh4vojhbbzsxt2lvs4vqjyx55ieet@g5fx4noqpogw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avcncasy2hs6unvhve3e6xh4vojhbbzsxt2lvs4vqjyx55ieet@g5fx4noqpogw>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Apr 24, 2026 at 12:21:37PM +0200, Zbigniew Kempczyński wrote:
> On Tue, Apr 07, 2026 at 06:00:49PM +0300, Ville Syrjälä wrote:
> 
> <cut>
> 
> > > +	/* MOCS encoding: genxml has a single 7-bit MOCS field (bits 30:24).
> > > +	 * The old struct had mocs_index:6 at bits 30:25 and pxp:1 at bit 24.
> > > +	 * Reproduce the same bit layout. */
> > > +	mocs = (buf->mocs_index << 1) | (intel_buf_pxp(buf) ? 1 : 0);
> > 
> > This annoying mocs_index stuff should be nuked throughout igt,
> > and replaced with the full mocs field. I've already gotten
> > confused by this multiple times when it looked like the 
> > relevant macros were off by one bit when compared to the spec.
> 
> IMO we can't stop using mocs index. BLOCK_COPY for Xe2+ has mocs index
> on bits[27:24] and encrypt is on bit[21]. Bits[23-22] are reserved.

If that's the exception then it would be better to handle it there.
Everything else just has a single MOCS field, and the encryption bit
(if it exists) is just part of it. The current thing makes zero sense
for platforms that don't have the encrypt bit, and for the platforms
where the encrypt bit is part of MOCS the whole thing is just
intentionally confusing.

-- 
Ville Syrjälä
Intel
