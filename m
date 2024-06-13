Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DE0C27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 09:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6E210E18E;
	Thu, 13 Jun 2024 09:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1MSNaMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7951610E18E
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718270230; x=1749806230;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=5dp/J39kIr1HQqZA+hWfrcv5NT58b2Zi+Kg+9J+6diA=;
 b=B1MSNaMgnnG50l/278lrj+JNhyx2IGFoQI4/24kf7W2kjNuVldHEZADS
 DBe2JtMkA1U0/b4Mk5eWXZHRdEG6JKwx95fqqKb/V4xR+XwwbmXpUbXFw
 5CtRRYNgWUwqcvTQWHs63r0l9d/nkavc/oJ792axEFCDL5AP4Bz6ofwyP
 zTB0+vWf6ifizNTeai75X3Gf9SpkDKkFCGBSVP5SyBuPGvLSc5N0kCzwv
 +7qx2678KrEB+kHxiaIwwJGa+QPV1XeGhnlJh6dPfP8G0jFo6VP2YlcHA
 5/VD5LK+AFiLh6BQr1hjM7INvIyYNsJsmsa2mQlF9IGOxPHLDo0AS2t2L w==;
X-CSE-ConnectionGUID: bHt+vQn/SRaXJ3rwGcoKbQ==
X-CSE-MsgGUID: c9EDno4YRYyOauZjCD68Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15245527"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="15245527"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:17:10 -0700
X-CSE-ConnectionGUID: Q1s6q5PqQIytBNstuZvovg==
X-CSE-MsgGUID: 1xFfY1l5R9Gfc5zxtc2tUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="44990985"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.112])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:17:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/27] tools/intel_vbt_decode: Decode almost
 everything
In-Reply-To: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
Date: Thu, 13 Jun 2024 12:17:05 +0300
Message-ID: <87le39i4mm.fsf@intel.com>
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

On Fri, 07 Jun 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Decode most of the known blocks, and at least name all the
> ones we know of but don't decode.
>
> Also fix an issue with the MIPI config block decoding.
>
> Note that I still have a few VBTs with completely unknown blocks:
> - VLV with blocks 60,61,62,63,64
> - ADL with block 212
> So far no idea what those might contain.

I'm not going to claim I reviewed this, but quickly eyeballed through
each patch. And I think that's enough.

Acked-by: Jani Nikula <jani.nikula@intel.com>

on the series.

>
> Ville Syrj=C3=A4l=C3=A4 (27):
>   tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
>     80c414772d93
>   tools/intel_vbt_decode: sync intel_vbt_defs.h with kernel commit
>     3e8daf14c47d
>   tools/intel_vbt_decode: Dump MIPI config for the correct panel
>   tools/intel_vbt_decode: Decode block 3 (Display Toggle Option)
>   tools/intel_vbt_decode: Decode block 4 (Mode Support List)
>   tools/intel_vbt_decode: Decode block 5 (Generic Mode Table)
>   tools/intel_vbt_decode: Decode blocks 6,7,8 (register tables)
>   tools/intel_vbt_decode: Decode block 10 (Mode Removal Table)
>   tools/intel_vbt_decode: Decode block 12 (Driver Persistent Algorithm)
>   tools/intel_vbt_decode: Decode block 15 (Dot Clock Override Table) and
>     block 9 (ALM only)
>   tools/intel_vbt_decode: Decode blocks 16,29,31 (Toggle List)
>   tools/intel_vbt_decode: Decode blocks 19,30,32 (Display Configuration
>     Removal Table)
>   tools/intel_vbt_decode: Decode block 18 (Driver Rotation)
>   tools/intel_vbt_decode: Decode block 20 (OEM Customizable Modes)
>   tools/intel_vbt_decode: Decode block 21 (EFP List)
>   tools/intel_vbt_decode: Decode block 24 (SDVO LVDS PnP ID)
>   tools/intel_vbt_decode: Decode block 25 (SDVO LVDS PPS)
>   tools/intel_vbt_decode: Decode block 26 (TV Options)
>   tools/intel_vbt_decode: Decode block 28 (EFP DTD)
>   tools/intel_vbt_decode: Decode block 45 (eDP BFI)
>   tools/intel_vbt_decode: Decode block 46 (Chromaticity For Narrow Gamut
>     Panel)
>   tools/intel_vbt_decode: Decode block 51 (Fixed Set Mode Table)
>   tools/intel_vbt_decode: Decode block 55 (RGB Palette Table)
>   tools/intel_vbt_decode: Decode block 57 (Vswing PreEmphasis Table)
>   tools/intel_vbt_decode: Decode block 58 (Generic DTD Block)
>   tools/intel_vbt_decode: Decode block 253 (PRD Table)
>   tools/intel_vbt_decode: Name a few more VBT blocks
>
>  tools/intel_vbt_decode.c | 1180 +++++++++++++++++++++++++++++++++++++-
>  tools/intel_vbt_defs.h   |   39 +-
>  2 files changed, 1179 insertions(+), 40 deletions(-)

--=20
Jani Nikula, Intel
