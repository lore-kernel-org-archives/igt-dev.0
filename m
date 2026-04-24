Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0005FE5200
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 10:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C4A10F51D;
	Fri, 24 Apr 2026 10:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HjX8/xEs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83D310F51D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 10:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777026105; x=1808562105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ypKoiG/s8TkdyDOVzQ9aTNjxQdpuV+dhkSXdl0BghzE=;
 b=HjX8/xEs7R/UESci+Z8/ofT7j6BGDSsLiLR1IFFcwe0WHhSl1WaT0SRH
 UPYlzjANJFCPUnZ4GnVpotfo47vfF60kLP7tqkxTV8/bV8BzppT4lqUqW
 9XtXljfP9PuX2a2ah+ydEVl1Vg/GdVodwfWKvo+eZR5JzjaE/0csU5Tad
 +YD6LNoWYPZ53PgVtoAIJO52KL0EKqfrA0xAcU7ZNHp9vg4unlgE+uZJb
 yfyRlR99/RtOIlS4mGjFk8BBLiTpINqPtTv2MdrDhJLxVIeFHnJ/v7poS
 yLrPYufC4Nx3qVKFP27JoFLW6GVpANhHGx0vOyJaM9dTXk9XAw+M+xM7+ g==;
X-CSE-ConnectionGUID: iB51xy+kQg+kbohXI1wy+Q==
X-CSE-MsgGUID: bVju8ZkbQ9+vHmnektt0+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81612258"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="81612258"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:21:41 -0700
X-CSE-ConnectionGUID: 7KOhqg7ERryvHIZ8i598ZQ==
X-CSE-MsgGUID: k02TPNLKSI2esLheEiIvOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="233222925"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.28])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 03:21:40 -0700
Date: Fri, 24 Apr 2026 12:21:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/3] lib/rendercopy: Convert rendercopy_gen9 to use
 genxml pack headers
Message-ID: <avcncasy2hs6unvhve3e6xh4vojhbbzsxt2lvs4vqjyx55ieet@g5fx4noqpogw>
References: <20260407132620.1397340-1-jan.maslak@intel.com>
 <20260407132620.1397340-3-jan.maslak@intel.com>
 <adUcIQUIfJxjvaSx@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adUcIQUIfJxjvaSx@intel.com>
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

On Tue, Apr 07, 2026 at 06:00:49PM +0300, Ville Syrjälä wrote:

<cut>

> > +	/* MOCS encoding: genxml has a single 7-bit MOCS field (bits 30:24).
> > +	 * The old struct had mocs_index:6 at bits 30:25 and pxp:1 at bit 24.
> > +	 * Reproduce the same bit layout. */
> > +	mocs = (buf->mocs_index << 1) | (intel_buf_pxp(buf) ? 1 : 0);
> 
> This annoying mocs_index stuff should be nuked throughout igt,
> and replaced with the full mocs field. I've already gotten
> confused by this multiple times when it looked like the 
> relevant macros were off by one bit when compared to the spec.

IMO we can't stop using mocs index. BLOCK_COPY for Xe2+ has mocs index
on bits[27:24] and encrypt is on bit[21]. Bits[23-22] are reserved.

--
Zbigniew
