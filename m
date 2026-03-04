Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54934EFCE21
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 17:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9D210EA6F;
	Wed,  4 Mar 2026 17:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/V/MIkZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3231F10EA6F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 17:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772644309; x=1804180309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4BDXIC/rvcz4OCjDfguweyM6uwRtdDa5Gv74gI//2wU=;
 b=b/V/MIkZDhLzhFLcjifCSWz+RX6ETmGAICZlYDLadfqFU8QUkbi38zoD
 VjMkkH83b6HrsTwFQkw2rGQm8qU+6KPhUBWQKZsQRXYxlsdkCFAqPsv4z
 dwrmeVJhhpXHmeCVvrzSLDtnMMZCchtR8JoQs4wQCCPiJfWNNh44dARiL
 bcCuAvLmEljz3sSv69deqr5shaPPeoK/uwiTJvhaR20/PmLvidzgS3vY1
 gs9yGDeKtuJ8wzn+g92MuiKlkrgdX1+3/JK3Yq5OzxHHc79juBEro/SB0
 UeQbdZZroz4tJvTHz3zvMNn9JR1/lijXXf7p8Y1ICXnlL0LAeJuckwFyt A==;
X-CSE-ConnectionGUID: fMuAMEHZSyu9NzCUPsHGww==
X-CSE-MsgGUID: tuG0PMWbTV21mvSwt5Hjxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73619978"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73619978"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:11:49 -0800
X-CSE-ConnectionGUID: 4c33tQHHS3SlY5uhI4WHbQ==
X-CSE-MsgGUID: ZhK1mjoWRDivJwBLOwxXhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="215319066"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 09:11:47 -0800
Date: Wed, 4 Mar 2026 18:11:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com
Subject: Re: [PATCH v4 3/5] intel-ci: Apply i915 chamelium delta changes
Message-ID: <20260304171144.uyyc6u4uw4ufephj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
 <20260302101926.3015380-4-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302101926.3015380-4-mohammed.bilal@intel.com>
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
On 2026-03-02 at 15:49:24 +0530, Mohammed Bilal wrote:

could you be more specific about changes here? imho:

[PATCH v4 3/5] intel-ci: Apply i915 chamelium delta changes

is a little to vague. What about: Remove random tests

[PATCH v4 3/5] intel-ci: Remove *-random tests

and then describe that you also moved suspend to end
and cleaned up descriptions?

> Apply i915-specific delta updates to the FULL chamelium
> testlist by commenting out non-deterministic random-plane
> subtests and moving suspend related subtests to the end
> for stable ordering.
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

I will wait with merge for ack or r-b from KMS team and also CI.

Regards,
Kamil

> ---
>  tests/intel-ci/i915.chamelium-only.testlist | 23 ++++++++++++---------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> index 9adace28c..56bffd8de 100644
> --- a/tests/intel-ci/i915.chamelium-only.testlist
> +++ b/tests/intel-ci/i915.chamelium-only.testlist
> @@ -12,16 +12,14 @@ igt@kms_chamelium_color@ctm-negative
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
> -# Chamelium v1 board HDMI receiver supports max 4k@30 resolution 
> -# removed test as its having a mode 4k@60 resulting 
> +# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
> +# removed test as its having a mode 4k@60 resulting
>  # TMDS config errors on v1 board
>  #igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
>  igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
> @@ -33,17 +31,17 @@ igt@kms_chamelium_frames@dp-crc-single
>  igt@kms_chamelium_frames@dp-frame-dump
>  igt@kms_chamelium_frames@hdmi-aspect-ratio
>  igt@kms_chamelium_frames@hdmi-cmp-planar-formats
> -igt@kms_chamelium_frames@hdmi-cmp-planes-random
> +# Tests are exhaustive and pick random configurations
> +# removed tests as results are non-deterministic on each run
> +#igt@kms_chamelium_frames@hdmi-cmp-planes-random
> +#igt@kms_chamelium_frames@hdmi-crc-planes-random
>  igt@kms_chamelium_frames@hdmi-crc-fast
>  igt@kms_chamelium_frames@hdmi-crc-multiple
>  igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
> -igt@kms_chamelium_frames@hdmi-crc-planes-random
>  igt@kms_chamelium_frames@hdmi-crc-single
>  igt@kms_chamelium_frames@hdmi-frame-dump
>  igt@kms_chamelium_frames@vga-frame-dump
> -igt@kms_chamelium_hpd@common-hpd-after-suspend
>  igt@kms_chamelium_hpd@dp-hpd
> -igt@kms_chamelium_hpd@dp-hpd-after-suspend
>  igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
>  igt@kms_chamelium_hpd@dp-hpd-fast
>  igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> @@ -51,7 +49,6 @@ igt@kms_chamelium_hpd@dp-hpd-storm
>  igt@kms_chamelium_hpd@dp-hpd-storm-disable
>  igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
>  igt@kms_chamelium_hpd@hdmi-hpd
> -igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
>  igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
>  igt@kms_chamelium_hpd@hdmi-hpd-fast
>  igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> @@ -61,7 +58,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
>  igt@kms_chamelium_audio@hdmi-audio
>  igt@kms_chamelium_audio@hdmi-audio-edid
>  igt@kms_chamelium_hpd@vga-hpd
> -igt@kms_chamelium_hpd@vga-hpd-after-suspend
>  igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
>  igt@kms_chamelium_hpd@vga-hpd-fast
>  igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> @@ -69,6 +65,13 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
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
>  #Place hibernate tests at end
>  igt@kms_chamelium_edid@dp-edid-change-during-hibernate
>  igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
> -- 
> 2.48.1
> 
