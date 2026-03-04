Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60125EFCE21
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 17:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0599610EA6F;
	Wed,  4 Mar 2026 17:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mw8gM32l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B361310EA6F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772644014; x=1804180014;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4NgyXZxcbol5p6nBTYuIQ77tV1kgAk2AjIBfSfGb6kA=;
 b=Mw8gM32l4a30TfbyT55I8/O5bRwsRz9zwMwAWKEDdAOJUo7CbAJNa17z
 WhrXWsYPKSG/Gd36iuDoqkjoOo6nqta7YCNIvFyK9fbvxh0/1+/x97Qw7
 W2rqg3roHs3CZJtUpfOTsPhXgXih7lzEO7ifAAQwr6RYl3WJfGIOAIJOV
 DjXw++xRKKPSBthAVFIjOvpfoPTDNZqq/zSi4CeHkZNXRxKpCNwV7pr4L
 obq4ifnAxTxVcBjBdnXbGd5aPBu+w44lhvZLlbokpkDgbeW27ItOF3maa
 C1gaxq3ZtJla5hMbx8rE5TXd8X3V+WX085pSmVfgfqfMLHEQtvPUTJCOw A==;
X-CSE-ConnectionGUID: KYcL+iYzScKYG2wxi39H3w==
X-CSE-MsgGUID: roHudrFbSg64lSyB4vjM/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73409233"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73409233"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:06:53 -0800
X-CSE-ConnectionGUID: jFL6LeKNQJu3iOmxM4zwSA==
X-CSE-MsgGUID: xUSgOFbCRD205O44CW0xGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="222559608"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 09:06:52 -0800
Date: Wed, 4 Mar 2026 18:06:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com
Subject: Re: [PATCH v4 4/5] intel-ci: Copy i915 chamelium testlist for xe
Message-ID: <20260304170649.wctqrh76krgx2cze@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
 <20260302101926.3015380-5-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302101926.3015380-5-mohammed.bilal@intel.com>
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
On 2026-03-02 at 15:49:25 +0530, Mohammed Bilal wrote:
> Create driver-specific chamelium testlist for xe
> 
> v3:
> -Use move-fix-add approach (Kamil)
> 
> v4:
> -Restructure move-fix-add approach (Kamil)
> -Rename run-type labels(Swati)
> 
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>

This is 1:1 a copy of i915 file, meson also looks good.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/meson.build                |  1 +
>  tests/intel-ci/xe.chamelium-only.testlist | 80 +++++++++++++++++++++++
>  tests/intel/kms_test_config.json          |  5 +-
>  3 files changed, 84 insertions(+), 2 deletions(-)
>  create mode 100644 tests/intel-ci/xe.chamelium-only.testlist
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 1a13dd52a..36c6bc9c4 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -14,6 +14,7 @@ intelci_files = [
>    'xe.bmg.core.blocklist.txt',
>    'xe.bmg.display.blocklist.txt',
>    'xe.bmg.eudebug.blocklist.txt',
> +  'xe.chamelium-only.testlist',
>    'xe.eudebug.blocklist.txt',
>    'xe.fast-feedback.testlist',
>    'xe-fast-feedback.testlist',
> diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
> new file mode 100644
> index 000000000..56bffd8de
> --- /dev/null
> +++ b/tests/intel-ci/xe.chamelium-only.testlist
> @@ -0,0 +1,80 @@
> +igt@kms_feature_discovery@chamelium
> +igt@kms_chamelium_audio@dp-audio
> +igt@kms_chamelium_audio@dp-audio-edid
> +igt@kms_chamelium_color@ctm-0-25
> +igt@kms_chamelium_color@ctm-0-50
> +igt@kms_chamelium_color@ctm-0-75
> +igt@kms_chamelium_color@ctm-blue-to-red
> +igt@kms_chamelium_color@ctm-green-to-red
> +igt@kms_chamelium_color@ctm-limited-range
> +igt@kms_chamelium_color@ctm-max
> +igt@kms_chamelium_color@ctm-negative
> +igt@kms_chamelium_color@ctm-red-to-blue
> +igt@kms_chamelium_color@degamma
> +igt@kms_chamelium_color@gamma
> +igt@kms_chamelium_edid@dp-edid-read
> +igt@kms_chamelium_edid@dp-edid-resolution-list
> +igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
> +igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
> +igt@kms_chamelium_edid@dp-mode-timings
> +igt@kms_chamelium_edid@hdmi-edid-read
> +# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
> +# removed test as its having a mode 4k@60 resulting
> +# TMDS config errors on v1 board
> +#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
> +igt@kms_chamelium_edid@hdmi-mode-timings
> +igt@kms_chamelium_edid@vga-edid-read
> +igt@kms_chamelium_frames@dp-crc-fast
> +igt@kms_chamelium_frames@dp-crc-multiple
> +igt@kms_chamelium_frames@dp-crc-single
> +igt@kms_chamelium_frames@dp-frame-dump
> +igt@kms_chamelium_frames@hdmi-aspect-ratio
> +igt@kms_chamelium_frames@hdmi-cmp-planar-formats
> +# Tests are exhaustive and pick random configurations
> +# removed tests as results are non-deterministic on each run
> +#igt@kms_chamelium_frames@hdmi-cmp-planes-random
> +#igt@kms_chamelium_frames@hdmi-crc-planes-random
> +igt@kms_chamelium_frames@hdmi-crc-fast
> +igt@kms_chamelium_frames@hdmi-crc-multiple
> +igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
> +igt@kms_chamelium_frames@hdmi-crc-single
> +igt@kms_chamelium_frames@hdmi-frame-dump
> +igt@kms_chamelium_frames@vga-frame-dump
> +igt@kms_chamelium_hpd@dp-hpd
> +igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@dp-hpd-fast
> +igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@dp-hpd-storm
> +igt@kms_chamelium_hpd@dp-hpd-storm-disable
> +igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
> +igt@kms_chamelium_hpd@hdmi-hpd
> +igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@hdmi-hpd-fast
> +igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@hdmi-hpd-storm
> +igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
> +igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
> +igt@kms_chamelium_audio@hdmi-audio
> +igt@kms_chamelium_audio@hdmi-audio-edid
> +igt@kms_chamelium_hpd@vga-hpd
> +igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@vga-hpd-fast
> +igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
> +igt@kms_chamelium_hpd@vga-hpd-without-ddc
> +igt@kms_chamelium_sharpness_filter@filter-basic
> +igt@kms_tiled_display@basic-test-pattern-with-chamelium
> +#Place suspend tests at end
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> +igt@kms_chamelium_hpd@vga-hpd-after-suspend
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> +#Place hibernate tests at end
> +igt@kms_chamelium_edid@dp-edid-change-during-hibernate
> +igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
> +igt@kms_chamelium_hpd@common-hpd-after-hibernate
> +igt@kms_chamelium_hpd@dp-hpd-after-hibernate
> +igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 4ed6e5405..f40be218c 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -18,11 +18,12 @@
>                          { "i915 FULL chamelium": "../intel-ci/i915.chamelium-only.testlist" },
>  
>                          { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
> -                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
> +                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" },
> +                        { "Xe FULL chamelium": "../intel-ci/xe.chamelium-only.testlist" }
>                      ],
>                      "exclude": [
>                          { "i915 BAT, i915 BAT chamelium, i915 FULL chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
> -                            { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
> +                        { "Xe BAT, Xe BAT chamelium, Xe FULL chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
>                      ]
>                  }
>              },
> -- 
> 2.48.1
> 
