Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA39CEFCE21
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 17:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7331810EA79;
	Wed,  4 Mar 2026 17:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgyQymMs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEC810EA79
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772644357; x=1804180357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W1AcMShy9/SYksybeHKLRxv9WzMjXf6jLJGUbE9A3RY=;
 b=AgyQymMsQ8kn224tl6u+XhtJOEtmZzFyhdPWSXET9XU9YxEDgtA2+DxD
 HCQW+ldedLWoYKdY6sNRSeotCd8hAOY642zKrr6TCy4bRPO2uy/vD9uJu
 XhKHi2pRHbo/fspm/jnNFTnNe3SiFkvcqBhe/PkTbku5aWxwtQV37W/YU
 6qja9VwPMYffvt9c5EByEqO40FfP2sZHaxYGorhFkvB42ENBa/R3YA6vw
 Fi8tYF2Bhlaa6ze40RcIzIF0NokFSHZ2juoD5tbAHENsuYojg9Krg4ee2
 nva5tyEYWyqyVa66LmMXB4STEZYBnGd9Bg1a0SSTkP/djTg+pFj+7E1iB A==;
X-CSE-ConnectionGUID: mvG4acGNTFyHcUKOT52fGQ==
X-CSE-MsgGUID: 4alrXASYThyRSjvc1HvmkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73410504"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73410504"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:12:37 -0800
X-CSE-ConnectionGUID: w4JpWruGQPCKhKszkgjFug==
X-CSE-MsgGUID: PP946P46QrGUXjYFynQLKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241421406"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 09:12:35 -0800
Date: Wed, 4 Mar 2026 18:12:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com
Subject: Re: [PATCH v4 5/5] intel-ci: Apply xe chamelium delta changes
Message-ID: <20260304171233.edtlepgq4mttioie@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
 <20260302101926.3015380-6-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302101926.3015380-6-mohammed.bilal@intel.com>
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
On 2026-03-02 at 15:49:26 +0530, Mohammed Bilal wrote:

here also subject could be more descriptive.

Regards,
Kamil

> Apply xe-specific delta updates to the FULL chamelium testlist by
> removing VGA-related subtests and keeping the remaining entries
> aligned with the i915-based baseline.
> 
> v2:
> - Move suspend resume tests to the end of the testlist (Kunal)
> - Comment out random-plane test (Kunal)
> 
> v3:
> -Use move-fix-add approach (Kamil)
> 
> v4:
> -Restructure move-fix-add approach (Kamil)
> 
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/intel-ci/xe.chamelium-only.testlist | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
> index 56bffd8de..4428fb48e 100644
> --- a/tests/intel-ci/xe.chamelium-only.testlist
> +++ b/tests/intel-ci/xe.chamelium-only.testlist
> @@ -24,7 +24,6 @@ igt@kms_chamelium_edid@hdmi-edid-read
>  #igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
>  igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
>  igt@kms_chamelium_edid@hdmi-mode-timings
> -igt@kms_chamelium_edid@vga-edid-read
>  igt@kms_chamelium_frames@dp-crc-fast
>  igt@kms_chamelium_frames@dp-crc-multiple
>  igt@kms_chamelium_frames@dp-crc-single
> @@ -40,7 +39,6 @@ igt@kms_chamelium_frames@hdmi-crc-multiple
>  igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
>  igt@kms_chamelium_frames@hdmi-crc-single
>  igt@kms_chamelium_frames@hdmi-frame-dump
> -igt@kms_chamelium_frames@vga-frame-dump
>  igt@kms_chamelium_hpd@dp-hpd
>  igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
>  igt@kms_chamelium_hpd@dp-hpd-fast
> @@ -57,19 +55,12 @@ igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
>  igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
>  igt@kms_chamelium_audio@hdmi-audio
>  igt@kms_chamelium_audio@hdmi-audio-edid
> -igt@kms_chamelium_hpd@vga-hpd
> -igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
> -igt@kms_chamelium_hpd@vga-hpd-fast
> -igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> -igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
> -igt@kms_chamelium_hpd@vga-hpd-without-ddc
>  igt@kms_chamelium_sharpness_filter@filter-basic
>  igt@kms_tiled_display@basic-test-pattern-with-chamelium
>  #Place suspend tests at end
>  igt@kms_chamelium_hpd@common-hpd-after-suspend
>  igt@kms_chamelium_hpd@dp-hpd-after-suspend
>  igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> -igt@kms_chamelium_hpd@vga-hpd-after-suspend
>  igt@kms_chamelium_edid@dp-edid-change-during-suspend
>  igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>  #Place hibernate tests at end
> -- 
> 2.48.1
> 
