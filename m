Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD40EB26F6
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 17:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DDE10E5E9;
	Tue, 10 Feb 2026 17:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPX3Hn/H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF98510E5ED
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770745587; x=1802281587;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jfka7jFmImAnFvdU0nYPY2lvzcBFMuvV7E+wKMyrxNk=;
 b=DPX3Hn/HGy6+/0O9lwdfbPpZwMSezqUNNUPsaMY2qgmp3sjTja6zk28A
 EEUDBUxBPa7BMav8tY+W4G8GnXK9QcFX51eX+4COkBlkkfviWzCsQTG7Q
 csrEp3unl7UuZYAJJUwQkome7BHuRaIYf+LcMgLJrzEDgiu6j/cGe9Qc5
 vJWMOm6bUxnTZecN/j6CJgAvCUyNZ0pYam8DOJXmuznDPs/+MEGTXz3KF
 yG2ruf3ovLf9+4m1KBy1sxsgOS3ZpR2/12MOQqo9+aR481O84ecZ44Osc
 ySCKtnqUTlolmTNU0wyWwvwa54aO5G0hNJvVF3DDKHAZWeNab9thAj9Ry A==;
X-CSE-ConnectionGUID: lN7KkpsiQmeO6wsRHX0CCA==
X-CSE-MsgGUID: wyUET1cPTwK9RBlsSwyC9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89295338"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89295338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 09:46:23 -0800
X-CSE-ConnectionGUID: 10bEv9x2TU+L7UiLCyvpRg==
X-CSE-MsgGUID: cYX3QxCPRumj2iDKgJVI7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211130983"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.136])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 09:46:22 -0800
Date: Tue, 10 Feb 2026 19:46:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/11] igt pipe vs crtc_index cleanups
Message-ID: <aYtu6_aJSRtQwPtp@intel.com>
References: <cover.1770736961.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1770736961.git.jani.nikula@intel.com>
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

On Tue, Feb 10, 2026 at 05:23:41PM +0200, Jani Nikula wrote:
> While Ville's been focusing on mass conversions with cocci, here are
> some specific manual pipe vs. crtc_index cleanups.
> 
> 
> Jani Nikula (11):
>   lib/igt_kms: rename igt_crtc_t crtc_offset member to crtc_index
>   lib/igt_kms: rename the rest of crtc_offset to crtc_index
>   lib/kms: rename struct kmstest_connector_config pipe member to
>     crtc_index
>   lib/igt_kms: rename _kmstest_connector_config_find_encoder() pipe
>     parameter to crtc_index
>   tests/kms_flip: switch to CRTC index terminology
>   tests/testdisplay: switch to CRTC index terminology
>   lib/igt_kms: use for_each_crtc() for iterating CRTCs
>   lib/igt_kms: rename kmstest_get_vblank() param to crtc_index
>   lib/igt_kms: remove __get_crtc_mask_for_pipe()
>   lib/igt_kms: pass crtc to igt_crtc_init()
>   lib/igt_kms: use for_each_crtc() for cleaning up CRTCs

Apart from the missing 1<< in one patch the rest look reasonable to me:

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  lib/igt_kms.c       | 106 ++++++++++++++++++--------------------------
>  lib/igt_kms.h       |  19 ++++----
>  tests/kms_flip.c    |  56 +++++++++++------------
>  tests/testdisplay.c |   6 +--
>  4 files changed, 80 insertions(+), 107 deletions(-)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
