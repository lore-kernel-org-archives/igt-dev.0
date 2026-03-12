Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE45C1067045
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABB310EA57;
	Thu, 12 Mar 2026 15:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMpM1EM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D82510EA57
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773330555; x=1804866555;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ulnDjSXb+LpyBpoLo91GYFu7U57lRnlAUjxqnZEZH7c=;
 b=CMpM1EM6/eqna28R9MVorsKVjLqRlKKx856aLTE7v3L+X8kF1oXa78qn
 Mt2btrNaJugFcc0CxKYreGctF2fNVMJUQyy+bUYSVRYmsIFN3Y8isFXi2
 Xcov74WQzH/15dA3RCtw7XNEM0DtY1/NMANCFAkN0tAImDGYWm5M18vPf
 mvalLnbaYx9UCJhobn+q9/XvcvuWxRGnQiOW3EgS0aWaYWtt+iwZN/Gge
 ArH7Y4KoqqV3Id9Rb8d3hTMRBqpGTmrfxOv2GsWPAgdvmukySGouNLqkh
 X3P6dumzLCXQbpEqVl8nomcAm03cG/bYHOok8HwL6BX5XT7TD2dViuAN8 Q==;
X-CSE-ConnectionGUID: sDQDEbExSYS0NLsCNBuIHQ==
X-CSE-MsgGUID: U/ctg++/TxC3qQs/emiNrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="97038750"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="97038750"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:49:15 -0700
X-CSE-ConnectionGUID: BmzhaffCTZWsPGdBmy7qow==
X-CSE-MsgGUID: nJnRFNz5STSNnY7KzH8A9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225551358"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 08:49:12 -0700
Date: Thu, 12 Mar 2026 16:49:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, ryszard.knop@intel.com, karol.krol@intel.com
Subject: Re: [PATCH v5 4/6] intel-ci: Move i915 suspend/resume tests to end
Message-ID: <20260312154910.pqkxqjubalavj2bs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, ryszard.knop@intel.com,
 karol.krol@intel.com
References: <20260305083906.3098168-1-mohammed.bilal@intel.com>
 <20260305083906.3098168-5-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305083906.3098168-5-mohammed.bilal@intel.com>
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

Hi Mohammed,
On 2026-03-05 at 14:09:04 +0530, Mohammed Bilal wrote:
> Reorganize FULL chamelium testlist by moving suspend and resume tests to
> the end. Suspend operations can cause system hangs or connection timeouts,
> so isolating them at the tail ensures stability of main test execution.
> 
> v2:
> - Move suspend resume tests to the end of the testlist (Kunal)
> 
> v3:
> -Use move-fix-add approach (Kamil)
> 
> v4:
> -Restructure move-fix-add approach (Kamil)
> 
> v5:
> -Update commit message (Kamil)
> -Split commit (Swati)
> 
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/intel-ci/i915.chamelium-only.testlist | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> index 6ab9029a4..0db71f7ef 100644
> --- a/tests/intel-ci/i915.chamelium-only.testlist
> +++ b/tests/intel-ci/i915.chamelium-only.testlist
> @@ -12,13 +12,11 @@ igt@kms_chamelium_color@ctm-negative
>  igt@kms_chamelium_color@ctm-red-to-blue
>  igt@kms_chamelium_color@degamma
>  igt@kms_chamelium_color@gamma
> -igt@kms_chamelium_edid@dp-edid-change-during-suspend
>  igt@kms_chamelium_edid@dp-edid-read
>  igt@kms_chamelium_edid@dp-edid-resolution-list
>  igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
>  igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
>  igt@kms_chamelium_edid@dp-mode-timings
> -igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>  igt@kms_chamelium_edid@hdmi-edid-read
>  # Chamelium v1 board HDMI receiver supports max 4k@30 resolution 
>  # removed test as its having a mode 4k@60 resulting 
> @@ -43,9 +41,7 @@ igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
>  igt@kms_chamelium_frames@hdmi-crc-single
>  igt@kms_chamelium_frames@hdmi-frame-dump
>  igt@kms_chamelium_frames@vga-frame-dump
> -igt@kms_chamelium_hpd@common-hpd-after-suspend
>  igt@kms_chamelium_hpd@dp-hpd
> -igt@kms_chamelium_hpd@dp-hpd-after-suspend
>  igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
>  igt@kms_chamelium_hpd@dp-hpd-fast
>  igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> @@ -53,7 +49,6 @@ igt@kms_chamelium_hpd@dp-hpd-storm
>  igt@kms_chamelium_hpd@dp-hpd-storm-disable
>  igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
>  igt@kms_chamelium_hpd@hdmi-hpd
> -igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
>  igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
>  igt@kms_chamelium_hpd@hdmi-hpd-fast
>  igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> @@ -63,7 +58,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
>  igt@kms_chamelium_audio@hdmi-audio
>  igt@kms_chamelium_audio@hdmi-audio-edid
>  igt@kms_chamelium_hpd@vga-hpd
> -igt@kms_chamelium_hpd@vga-hpd-after-suspend
>  igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
>  igt@kms_chamelium_hpd@vga-hpd-fast
>  igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> @@ -71,6 +65,13 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
>  igt@kms_chamelium_hpd@vga-hpd-without-ddc
>  igt@kms_chamelium_sharpness_filter@filter-basic
>  igt@kms_tiled_display@basic-test-pattern-with-chamelium
> +#Place suspend tests at end
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> +igt@kms_chamelium_hpd@vga-hpd-after-suspend
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend

Any reason why is it not in alphabetical order?
imho chamelium_edid should be before chamelium_hpd.

Regards,
Kamil

>  #Place hibernate tests at end
>  igt@kms_chamelium_edid@dp-edid-change-during-hibernate
>  igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
> -- 
> 2.48.1
> 
