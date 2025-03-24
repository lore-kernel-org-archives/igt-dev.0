Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE577C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 13:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6F810E413;
	Mon, 24 Mar 2025 13:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZVKAmA5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C6210E413
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823173; x=1774359173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=U/z44+ZgzWzI7hNaw2L3/2b6SJPQNxhuJnPMm0FJ13o=;
 b=fZVKAmA5G8fhz+1RvatfDNmPPzVz5O5u3825/ccNTFMdU5VWnlqi6H9c
 CKVD9ED02OVgLAKnP6lEjB1q7MoMQgp7igw/xTsTqxG0vOAAA2VB5GB2+
 dguLwGLLNfv/wIO4okoW3/TQDRbdjO9x4OT8Dahprq/ZzonbgD0/sIdFh
 G/CSDe2ZHjkv8LRHO3TxLR5eE5OqgidzzPD9mqZf9dhw9jg2g/yOvwIy9
 7Ibx1ppEaqS12BjMUaf0izDLrXbwJ0j0rmJ3q3gpnFDdvYTxnQTMUEWOd
 4PInPx8kiiPOh1/zeLMK0YWqH+hnntp7GIxSH87c2a5ZuhNEdb/Oi11ph A==;
X-CSE-ConnectionGUID: JcbrqSSFQdi08XPF21CVCA==
X-CSE-MsgGUID: TfySztTlRvKgcLSp49X1RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44191490"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="44191490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:32:52 -0700
X-CSE-ConnectionGUID: nzQLHITwRoKSerfD+b1jhw==
X-CSE-MsgGUID: ifqORsPMRkyqMWURMDkcxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="128227213"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 06:32:51 -0700
Date: Mon, 24 Mar 2025 14:32:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 1/4] lib/iga64: fix send macro for DG2 platforms
Message-ID: <20250324133248.mnrpzbd6qpn6zzav@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
 <20250314-iga64_misc-v1-1-b2d1337b808d@intel.com>
 <20250321125812.q33xgboxerstkpu5@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321125812.q33xgboxerstkpu5@zkempczy-mobl2>
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

Hi Zbigniew,
On 2025-03-21 at 13:58:12 +0100, Zbigniew Kempczyński wrote:
> On Fri, Mar 14, 2025 at 03:59:08PM +0100, Andrzej Hajda wrote:
> > src1 argument should be in form of null:0 for some platforms,
> > use special macro src1_null for it.
> > 
> > iga64 -Xauto-deps -Wall -p=12p71 lib/iga64_generated_codes.c.d/iga64_assembly_media_block_write_aip.12p71.asm
> > line 3.31: warning: Src1.Length should suffix src1 register (e.g. r10:4)
> > (W) send.dc1 (1) null r4 null 0x0 0x40A8000
> 
> LGTM:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> --
> Zbigniew

Thank you, all applied.

Regards,
Kamil

> 
> > 
> > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > ---
> >  lib/iga64_generated_codes.c | 2 +-
> >  lib/iga64_macros.h          | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> > index a74a8864e5ca..551dead2be17 100644
> > --- a/lib/iga64_generated_codes.c
> > +++ b/lib/iga64_generated_codes.c
> > @@ -3,7 +3,7 @@
> >  
> >  #include "gpgpu_shader.h"
> >  
> > -#define MD5_SUM_IGA64_ASMS 80bb609ce27131259d19629dc74e349f
> > +#define MD5_SUM_IGA64_ASMS 22a5a4671242c3257209f4051f1c0c7e
> >  
> >  struct iga64_template const iga64_code_gpgpu_fill[] = {
> >  	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> > diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
> > index ac482e47c05e..8e452cf634f9 100644
> > --- a/lib/iga64_macros.h
> > +++ b/lib/iga64_macros.h
> > @@ -70,7 +70,7 @@
> >  #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)
> >  #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)
> >  #define LOAD_SPACE_DW(dst, src) send.dc1 (1)	dst	src	src1_null 0x0	0x2190000
> > -#define STORE_SPACE_DW(dst, src) send.dc1 (1)	null	dst	null	0x0	0x40A8000
> > +#define STORE_SPACE_DW(dst, src) send.dc1 (1)	null	dst	src1_null 0x0	0x40A8000
> >  #else
> >  #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)
> >  #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)
> > 
> > -- 
> > 2.34.1
> > 
