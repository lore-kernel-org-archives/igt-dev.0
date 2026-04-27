Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB70FFF8869
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 12:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A66710E720;
	Mon, 27 Apr 2026 12:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmADqAiG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7486A10E720
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 12:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777292393; x=1808828393;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YZ4rnFilZFG/KW9BSVpZdepLjmE9hRpyEv44L9IE6BE=;
 b=lmADqAiGWenufUsY69HBLRDWMV1yXb8n+38fTYu/mQMQWsIj+fMBTzYQ
 wCJaPrY5IxC4j+Xe82T1XIR98CMweJveKQEDLAhfGJLdzGY+ku7hCiixM
 uO9SABHZUDbNLocQjjiMNrUPm3qV2r7A4KPsefARGLkpqPcDMcXEq8cMq
 vGXYVCM4smkzquPYH8fivmloySLcbAw5qzFkLlLIN/TH6jd+pXsHCgb6M
 n3MjNdQDzlHrIMMSdOV+vYbFV/5EEqv3VI2aEqrt2NYiHGp+2eTfRRrLk
 N09GILIeWj2ngp7XbfHPDksc+/CQc1oeKj2L9BT4X+dqOOV5EhY01btFu w==;
X-CSE-ConnectionGUID: F2xJGI6sR+CBh5boa0BtTQ==
X-CSE-MsgGUID: l3n0e68wRZ+PgUqTkcPImA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="80753118"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="80753118"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:19:53 -0700
X-CSE-ConnectionGUID: IqclG4DhTWicjKdMmpwLjQ==
X-CSE-MsgGUID: RbZVUwyiRHK41aYLqoUD8Q==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.116])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:19:51 -0700
Date: Mon, 27 Apr 2026 15:19:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/3] lib/rendercopy: Convert rendercopy_gen9 to use
 genxml pack headers
Message-ID: <ae9UZAQuZeu3AMYK@intel.com>
References: <20260407132620.1397340-1-jan.maslak@intel.com>
 <20260407132620.1397340-3-jan.maslak@intel.com>
 <adUcIQUIfJxjvaSx@intel.com>
 <avcncasy2hs6unvhve3e6xh4vojhbbzsxt2lvs4vqjyx55ieet@g5fx4noqpogw>
 <aetKDptHSWxeaTQD@intel.com>
 <ygjjh6w6ljlb7jt3cpvwjleotcein6frzgniojrew2vqtbgaoh@4bsktacozbjq>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ygjjh6w6ljlb7jt3cpvwjleotcein6frzgniojrew2vqtbgaoh@4bsktacozbjq>
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

On Fri, Apr 24, 2026 at 05:37:37PM +0200, Zbigniew Kempczyński wrote:
> On Fri, Apr 24, 2026 at 01:46:38PM +0300, Ville Syrjälä wrote:
> > On Fri, Apr 24, 2026 at 12:21:37PM +0200, Zbigniew Kempczyński wrote:
> > > On Tue, Apr 07, 2026 at 06:00:49PM +0300, Ville Syrjälä wrote:
> > > 
> > > <cut>
> > > 
> > > > > +	/* MOCS encoding: genxml has a single 7-bit MOCS field (bits 30:24).
> > > > > +	 * The old struct had mocs_index:6 at bits 30:25 and pxp:1 at bit 24.
> > > > > +	 * Reproduce the same bit layout. */
> > > > > +	mocs = (buf->mocs_index << 1) | (intel_buf_pxp(buf) ? 1 : 0);
> > > > 
> > > > This annoying mocs_index stuff should be nuked throughout igt,
> > > > and replaced with the full mocs field. I've already gotten
> > > > confused by this multiple times when it looked like the 
> > > > relevant macros were off by one bit when compared to the spec.
> > > 
> > > IMO we can't stop using mocs index. BLOCK_COPY for Xe2+ has mocs index
> > > on bits[27:24] and encrypt is on bit[21]. Bits[23-22] are reserved.
> > 
> > If that's the exception then it would be better to handle it there.
> > Everything else just has a single MOCS field, and the encryption bit
> > (if it exists) is just part of it. The current thing makes zero sense
> > for platforms that don't have the encrypt bit, and for the platforms
> > where the encrypt bit is part of MOCS the whole thing is just
> > intentionally confusing.
> 
> I've found 4 exceptions in xe2.xml where MOCS doesn't use previous
> [7] or [6+1] bit arrangements.
> 
> Interesting is EXECUTE_INDIRECT_DISPATCH contains MOCS index only. We're
> not using this command in IGT, but this shows index also can appear
> standalone. I think IGT should provide both interfaces - for getting
> MOCS index standalone and for getting the full MOCS field and on
> usecase depends which interface should be used.

IIRC Mesa uses the full MOCS field. We should do the same, especially
if we now plan to start using genxml.

-- 
Ville Syrjälä
Intel
