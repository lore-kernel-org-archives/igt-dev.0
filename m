Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A998DC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 15:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF21F10E2D8;
	Fri, 31 May 2024 15:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Io99lhTy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5B610E2D8
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717168296; x=1748704296;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=uUQ2TDy5pM11QOiM/lUiRqVF5kD3MgDJxGacSj3KML8=;
 b=Io99lhTyK/SNhZov0abK6KiJyoiH86QgcC7k8JS4veBM6EYMRRQcW+GJ
 utSjjdLrqF2PoUgjbl3PAFWpTJpwCbkap6tnv/5hs+MFlwoGin5kSU1hf
 R3I6IXt3oMimLDypEVtsc4dhpDz16Wf9ALKHRyfHxp3cV3X2O3qG9iZVQ
 pU3/1TjQM/XcT52wN6A3w2+sTj6POkBJvIFSlEYoFs3j7iPP83gFQ8sXT
 iu9yhlq/L7gjEm7Plq2wD6ExotpReekefpAoM+lOkezMzQzhjr34V3+Xm
 2TAT7RFVXpt0GR9h4qxwxDQ0729I/6XfQMd08i+P0gDnuxKMMdK/4ba6s A==;
X-CSE-ConnectionGUID: qF0lZyLrQhCvovYHwNtCFw==
X-CSE-MsgGUID: +UHNWNyaT1+0SPzTc75n5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24291874"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="24291874"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 08:11:30 -0700
X-CSE-ConnectionGUID: P+OAv3IyQBeTYmf6OHCTzw==
X-CSE-MsgGUID: HVegfJkuRguN+fYw3ge/Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36130233"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 08:11:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/20] tools/intel_vbt_decode: Refactoring and
 prep work for decoding more blocks
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
Date: Fri, 31 May 2024 18:11:22 +0300
Message-ID: <87bk4mdnj9.fsf@intel.com>
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

On Fri, 31 May 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> A bunch of refactoring/cleanups/etc. to intel_vbt_decode. I have
> a followup also lined up that implementes decoding of nearly all
> known blocks, but figured I'll get all the other stuff out of the
> way first.

Some minor nitpicks that can be ignored or clean up later, series is

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Ville Syrj=C3=A4l=C3=A4 (20):
>   tools/intel_vbt_decode: Finish the s/lvds/lfp/ rename
>   tools/intel_vbt_decode: s/dump_sdvo_panel_dtd()/dump_sdvo_lvds_dtd()/
>   lib: Define DIV_ROUND_CLOSEST()
>   tools/intel_vbt_decode: Fix some tabs
>   tools/intel_vbt_decode: Add missing newline
>   tools/intel_vbt_decode: Indent ALS dump
>   tools/intel_vbt_decode: Use "(LFP<n>)" to indicate LFP panel type
>   tools/intel_vbt_decode: Decode the "not HDMI" bit right way up
>   tools/intel_vbt_decode: Extract dump_pnp_id()
>   tools/intel_vbt_decode: Reuse print_detail_timing_data()
>   tools/intel_vbt_decode: Dump the new eDP DSC disable bit
>   tools/intel_vbt_decode: Allow dumpers to delcate min version for the
>     block
>   tools/intel_vbt_decode: Use .min_bdb_version to filter out PSR block
>     on pre-165 VBTs
>   tools/intel_vbt_decode: Sort dumper table
>   tools/intel_vbt_decode: Use struct bdb_sdvo_lvds_dtd
>   tools/intel_vbt_decode: Track the SDVO panel type
>   tools/intel_vbt_decode: Use find_raw_section() to determine block
>     presence
>   tools/intel_vbt_decode: Make device handle names more compact
>   tools/intel_vbt_decode: Declare min/max version for child dev handles
>   tools/intel_vbt_decode: Decode device handle as a bitmask
>
>  lib/igt_aux.h            |   1 +
>  tools/intel_vbt_decode.c | 395 ++++++++++++++++++++++-----------------
>  2 files changed, 224 insertions(+), 172 deletions(-)

--=20
Jani Nikula, Intel
