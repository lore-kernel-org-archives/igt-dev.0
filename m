Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E7CC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 06:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F521127B6;
	Mon, 22 Apr 2024 06:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Njcp3uuU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFE01127B6
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 06:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713765736; x=1745301736;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ja/gcqBZnvoCkqdeP+JINYLMq7KTXA+P1fBPFQk0ukw=;
 b=Njcp3uuUPBrT6GMyPq+cNRTJyXd2ONjnFXowB073VZDDLvylA3df8RXm
 3sh62sGyBDZarhNbyPG7Hl19yvUG8a7WI26V5IxN/IuXjkgLo709u0qOB
 1/TRCv2N39SbaDpR36MdDw6ZQkYUd13g5xOizeDQeu9bDexxYDsBw/P5U
 +IZ+Nkpqo34Z8XYN0oBS0wWJfYEf8MIBOVYBxiqVkRs7AIxkfVYdQDLPi
 HGn9gMEiF5WWbNDvDD+vN92gXq2th+k7mARPtdVuUX/BDdRrE8gBy1LOB
 lXOuiTUTLLnGdpAoVdBvmVkeJZCFSTAzdufvTF95HUQ3HortOe3EBsReV Q==;
X-CSE-ConnectionGUID: /Tde+JdRQ8e26Wldi7/PuA==
X-CSE-MsgGUID: STdcLszRS8mk+SH5ZuonAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9146185"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9146185"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 23:02:15 -0700
X-CSE-ConnectionGUID: eAPOnpLlSbeUpuH/UbLR4w==
X-CSE-MsgGUID: /dbnbqPPS4Wa9BF81bi3TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; d="scan'208";a="28571811"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 23:02:13 -0700
Date: Mon, 22 Apr 2024 08:02:10 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t,v1 0/4] L3 bank mask
Message-ID: <20240422060210.kb22g6izuqmwnya5@zkempczy-mobl2>
References: <20240417145049.7-1-francois.dugast@intel.com>
 <sx44ek2wi3megbrlu5pxzny55n6didg7kwopygzzywgcjs5ic5@wq56mdm4s4wi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sx44ek2wi3megbrlu5pxzny55n6didg7kwopygzzywgcjs5ic5@wq56mdm4s4wi>
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

On Wed, Apr 17, 2024 at 11:07:54AM -0500, Lucas De Marchi wrote:

<cut>

> 
> include/drm-uapi/xe_drm.h should always and only be updated by copying
> from kernel from specific commits documented in the commit message.
> 
> WIP changes while the kernel side is not merged should be moved to
> another header. Traditionally we used LOCAL_* defines for that. But that
> comes with its own problems as it's more work to  go find them all and
> drop when we sync the headers.
> 
> What about doing this?
> 
> Add include/drm-uapi/local/ to -I in build system *before* the non-local
> one. Something like:
> 
> meson.build:
> 	inc = include_directories('include', 'include/drm-uapi/local' 'include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
> 
> Example content for
> include/drm-uapi/local/drm_xe.h:
> 	#pragma once
> 	#include_next <xe_drm.h>
> 
> 	/*
> 	 * Local definitions - delta with WIP UAPI while the upstream defines
> 	 * are not yet merged. These are supposed to conflict whenever the
> 	 * upstream header is updated and break the build. That is intended.
> 	 * Commit updating the upstream header should garbage collect these
> 	 * local definitions.
> 	 */
> 
> 	#ifdef DRM_XE_TOPO_L3_BANK
> 	#error "Already defined by upstream - remove"
> 	#define DRM_XE_TOPO_L3_BANK		3
> 	#endif
> 
> The ifdef + error could be optional as it's harmless (and allowed by
> compiler) to redefine it multiple times to the same value.

I like this solution and I vote for yes. As duplicates (definition
with same value) are allowed by the compiler, only drawback I see
is potentially have same definition across uapi headers - local
and global for some period. This is however not a problem, especially
same is with LOCAL_*.

--
Zbigniew

> 
> Thoughts?
> 
> If we don't want to decide on this and you only want to unblock this
> test for the kernel addition, then maybe just do the same LOCAL_
> approach currently being used. See e.g. lib/i915/i915_drm_local.h
> 
> Lucas De Marchi
> 
> >  lib/xe/xe_query: Add L3 bank mask test
> > 
> > include/drm-uapi/xe_drm.h | 27 +++-------------
> > tests/intel/xe_query.c    | 66 +++++++++++++++++++++++++++++++++++++++
> > 2 files changed, 71 insertions(+), 22 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
