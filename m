Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31045E83040
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 03:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B4510E197;
	Tue,  3 Feb 2026 03:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtL3jfC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CC310E197
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 03:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770089762; x=1801625762;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vxF7cIjUSfaJmigMc+fenYn3BAA4bUQeSj9+8FW7HU4=;
 b=gtL3jfC8zOnyaFKifLP4dbKQuc96ZgRREgVIE2u5AX23ZE/9fTahnAkD
 GV1is0FRw3WUB4qMrjyunpV+78HxxnKNgxsrblU/lRsZyWTJKntK4mG2A
 kM5DCcO7MlTu8ddAKn5aTizcWb0UexR4wdTZJjiKFNFaFrbzeh36FG2jl
 UbygvAkklZ6KUEWqM7AScU/vppHRggWNG6guqEDvrg90Vjq4KGp4yQ4So
 VIr/X28G11fBEknbRBHKFjIFUIlYbAL+Wa9+S2ddTbLmp0Mvjm1Q9kDhK
 sXdbGnMme+irq1d+PwdDUWlCWvr9NtHe9piVKn56ks9TRqWKoA6HaFdWf g==;
X-CSE-ConnectionGUID: u0CrIrowRmK30arttktDMQ==
X-CSE-MsgGUID: rEghvzIyQAGJq0IRPnvtWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88675586"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="88675586"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:36:02 -0800
X-CSE-ConnectionGUID: Q0HmKI1pRL27ydabwF2v1Q==
X-CSE-MsgGUID: vMTA7CzVRkaQ4+jxvjI8eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209001391"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.113.248])
 ([10.66.113.248])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:36:00 -0800
Message-ID: <86ef9c3a-9c0c-43c4-b565-fde1e966b8d3@intel.com>
Date: Tue, 3 Feb 2026 09:06:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: intel-ci: Split chamelium-only testlist for i915 and xe
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com
References: <20260131134530.900928-1-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260131134530.900928-1-mohammed.bilal@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello Bilal,

On 31-01-2026 19:15, Mohammed Bilal wrote:
> Split the common chamelium-only.testlist into driver-specific testlists
> - i915.chamelium-only.testlist
> - xe.chamelium-only.testlist
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist      | 77 --------------------
>   tests/intel-ci/i915.chamelium-only.testlist | 78 ++++++++++++++++++++-
>   tests/intel-ci/meson.build                  |  3 +-
>   tests/intel-ci/xe.chamelium-only.testlist   | 71 ++++++++++++++++++-
>   tests/intel/kms_test_config.json            |  7 +-
>   5 files changed, 153 insertions(+), 83 deletions(-)
>   delete mode 100644 tests/intel-ci/chamelium-only.testlist
>   mode change 120000 => 100644 tests/intel-ci/i915.chamelium-only.testlist
>   mode change 120000 => 100644 tests/intel-ci/xe.chamelium-only.testlist
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> deleted file mode 100644
> index 9adace28c..000000000
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -igt@kms_feature_discovery@chamelium
> -igt@kms_chamelium_audio@dp-audio
> -igt@kms_chamelium_audio@dp-audio-edid
> -igt@kms_chamelium_color@ctm-0-25
> -igt@kms_chamelium_color@ctm-0-50
> -igt@kms_chamelium_color@ctm-0-75
> -igt@kms_chamelium_color@ctm-blue-to-red
> -igt@kms_chamelium_color@ctm-green-to-red
> -igt@kms_chamelium_color@ctm-limited-range
> -igt@kms_chamelium_color@ctm-max
> -igt@kms_chamelium_color@ctm-negative
> -igt@kms_chamelium_color@ctm-red-to-blue
> -igt@kms_chamelium_color@degamma
> -igt@kms_chamelium_color@gamma
> -igt@kms_chamelium_edid@dp-edid-change-during-suspend
> -igt@kms_chamelium_edid@dp-edid-read
> -igt@kms_chamelium_edid@dp-edid-resolution-list
> -igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
> -igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
> -igt@kms_chamelium_edid@dp-mode-timings
> -igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> -igt@kms_chamelium_edid@hdmi-edid-read
> -# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
> -# removed test as its having a mode 4k@60 resulting
> -# TMDS config errors on v1 board
> -#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> -igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
> -igt@kms_chamelium_edid@hdmi-mode-timings
> -igt@kms_chamelium_edid@vga-edid-read
> -igt@kms_chamelium_frames@dp-crc-fast
> -igt@kms_chamelium_frames@dp-crc-multiple
> -igt@kms_chamelium_frames@dp-crc-single
> -igt@kms_chamelium_frames@dp-frame-dump
> -igt@kms_chamelium_frames@hdmi-aspect-ratio
> -igt@kms_chamelium_frames@hdmi-cmp-planar-formats
> -igt@kms_chamelium_frames@hdmi-cmp-planes-random
> -igt@kms_chamelium_frames@hdmi-crc-fast
> -igt@kms_chamelium_frames@hdmi-crc-multiple
> -igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
> -igt@kms_chamelium_frames@hdmi-crc-planes-random
> -igt@kms_chamelium_frames@hdmi-crc-single
> -igt@kms_chamelium_frames@hdmi-frame-dump
> -igt@kms_chamelium_frames@vga-frame-dump
> -igt@kms_chamelium_hpd@common-hpd-after-suspend
> -igt@kms_chamelium_hpd@dp-hpd
> -igt@kms_chamelium_hpd@dp-hpd-after-suspend
> -igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
> -igt@kms_chamelium_hpd@dp-hpd-fast
> -igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> -igt@kms_chamelium_hpd@dp-hpd-storm
> -igt@kms_chamelium_hpd@dp-hpd-storm-disable
> -igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
> -igt@kms_chamelium_hpd@hdmi-hpd
> -igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> -igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
> -igt@kms_chamelium_hpd@hdmi-hpd-fast
> -igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> -igt@kms_chamelium_hpd@hdmi-hpd-storm
> -igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
> -igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
> -igt@kms_chamelium_audio@hdmi-audio
> -igt@kms_chamelium_audio@hdmi-audio-edid
> -igt@kms_chamelium_hpd@vga-hpd
> -igt@kms_chamelium_hpd@vga-hpd-after-suspend
> -igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
> -igt@kms_chamelium_hpd@vga-hpd-fast
> -igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> -igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
> -igt@kms_chamelium_hpd@vga-hpd-without-ddc
> -igt@kms_chamelium_sharpness_filter@filter-basic
> -igt@kms_tiled_display@basic-test-pattern-with-chamelium
> -#Place hibernate tests at end
> -igt@kms_chamelium_edid@dp-edid-change-during-hibernate
> -igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
> -igt@kms_chamelium_hpd@common-hpd-after-hibernate
> -igt@kms_chamelium_hpd@dp-hpd-after-hibernate
> -igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> deleted file mode 120000
> index d7c492973..000000000
> --- a/tests/intel-ci/i915.chamelium-only.testlist
> +++ /dev/null
> @@ -1 +0,0 @@
> -chamelium-only.testlist
> \ No newline at end of file
> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> new file mode 100644
> index 000000000..277eb8374
> --- /dev/null
> +++ b/tests/intel-ci/i915.chamelium-only.testlist
> @@ -0,0 +1,77 @@
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
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
> +igt@kms_chamelium_edid@dp-edid-read
> +igt@kms_chamelium_edid@dp-edid-resolution-list
> +igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
> +igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
> +igt@kms_chamelium_edid@dp-mode-timings
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
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
> +igt@kms_chamelium_frames@hdmi-cmp-planes-random
Comment random test in both as it's not exhaustive and written for CI
> +igt@kms_chamelium_frames@hdmi-crc-fast
> +igt@kms_chamelium_frames@hdmi-crc-multiple
> +igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
> +igt@kms_chamelium_frames@hdmi-crc-planes-random
> +igt@kms_chamelium_frames@hdmi-crc-single
> +igt@kms_chamelium_frames@hdmi-frame-dump
> +igt@kms_chamelium_frames@vga-frame-dump
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@dp-hpd-fast
> +igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@dp-hpd-storm
> +igt@kms_chamelium_hpd@dp-hpd-storm-disable
> +igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
> +igt@kms_chamelium_hpd@hdmi-hpd
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@hdmi-hpd-fast
> +igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@hdmi-hpd-storm
> +igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
> +igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
> +igt@kms_chamelium_audio@hdmi-audio
> +igt@kms_chamelium_audio@hdmi-audio-edid
> +igt@kms_chamelium_hpd@vga-hpd
> +igt@kms_chamelium_hpd@vga-hpd-after-suspend
> +igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@vga-hpd-fast
> +igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
> +igt@kms_chamelium_hpd@vga-hpd-without-ddc
> +igt@kms_chamelium_sharpness_filter@filter-basic
> +igt@kms_tiled_display@basic-test-pattern-with-chamelium
> +#Place hibernate tests at end
> +igt@kms_chamelium_edid@dp-edid-change-during-hibernate
> +igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
> +igt@kms_chamelium_hpd@common-hpd-after-hibernate
> +igt@kms_chamelium_hpd@dp-hpd-after-hibernate
> +igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index cf0023c63..54a9b6f5d 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -2,11 +2,11 @@
>   
>   intelci_files = [
>     'README',
> -  'chamelium-only.testlist',
>     'fast-feedback.testlist',
>     'fast-feedback-chamelium-only.testlist',
>     'i915.blocklist.txt',
>     'i915.blocklist-pre-merge.txt',
> +  'i915.chamelium-only.testlist',
>     'i915.fast-feedback.testlist',
>     'i915.fast-feedback-chamelium-only.testlist',
>     'meta.testlist',
> @@ -14,6 +14,7 @@ intelci_files = [
>     'xe.bmg.core.blocklist.txt',
>     'xe.bmg.display.blocklist.txt',
>     'xe.bmg.eudebug.blocklist.txt',
> +  'xe.chamelium-only.testlist',
>     'xe.eudebug.blocklist.txt',
>     'xe.fast-feedback.testlist',
>     'xe-fast-feedback.testlist',
> diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
> deleted file mode 120000
> index d7c492973..000000000
> --- a/tests/intel-ci/xe.chamelium-only.testlist
> +++ /dev/null
> @@ -1 +0,0 @@
> -chamelium-only.testlist
> \ No newline at end of file
> diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
> new file mode 100644
> index 000000000..eeca7729a
> --- /dev/null
> +++ b/tests/intel-ci/xe.chamelium-only.testlist
> @@ -0,0 +1,70 @@
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
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
Keep all suspend tests also at the end in both list
> +igt@kms_chamelium_edid@dp-edid-read
> +igt@kms_chamelium_edid@dp-edid-resolution-list
> +igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
> +igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
> +igt@kms_chamelium_edid@dp-mode-timings
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> +igt@kms_chamelium_edid@hdmi-edid-read
> +# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
> +# removed test as its having a mode 4k@60 resulting
> +# TMDS config errors on v1 board
> +#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
> +igt@kms_chamelium_edid@hdmi-mode-timings
> +igt@kms_chamelium_edid@vga-edid-read

Remove all vga tests from xe list,

Thanks and Regards
Kunal Joshi

> +igt@kms_chamelium_frames@dp-crc-fast
> +igt@kms_chamelium_frames@dp-crc-multiple
> +igt@kms_chamelium_frames@dp-crc-single
> +igt@kms_chamelium_frames@dp-frame-dump
> +igt@kms_chamelium_frames@hdmi-aspect-ratio
> +igt@kms_chamelium_frames@hdmi-cmp-planar-formats
> +igt@kms_chamelium_frames@hdmi-cmp-planes-random
> +igt@kms_chamelium_frames@hdmi-crc-fast
> +igt@kms_chamelium_frames@hdmi-crc-multiple
> +igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
> +igt@kms_chamelium_frames@hdmi-crc-planes-random
> +igt@kms_chamelium_frames@hdmi-crc-single
> +igt@kms_chamelium_frames@hdmi-frame-dump
> +igt@kms_chamelium_frames@vga-frame-dump
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@dp-hpd-fast
> +igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@dp-hpd-storm
> +igt@kms_chamelium_hpd@dp-hpd-storm-disable
> +igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
> +igt@kms_chamelium_hpd@hdmi-hpd
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@hdmi-hpd-fast
> +igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@hdmi-hpd-storm
> +igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
> +igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
> +igt@kms_chamelium_audio@hdmi-audio
> +igt@kms_chamelium_audio@hdmi-audio-edid
> +igt@kms_chamelium_sharpness_filter@filter-basic
> +igt@kms_tiled_display@basic-test-pattern-with-chamelium
> +#Place hibernate tests at end
> +igt@kms_chamelium_edid@dp-edid-change-during-hibernate
> +igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
> +igt@kms_chamelium_hpd@common-hpd-after-hibernate
> +igt@kms_chamelium_hpd@dp-hpd-after-hibernate
> +igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 61a70a9bb..ca243304f 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -15,14 +15,15 @@
>                       "include": [
>                           { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
>                           { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
> -                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
> +                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
>   
>                           { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
> -                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
> +                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" },
> +                        { "Xe chamelium": "../intel-ci/xe.chamelium-only.testlist" }
>                       ],
>                       "exclude": [
>                           { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
> -                            { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
> +                            { "Xe BAT, Xe BAT chamelium, Xe chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
>                       ]
>                   }
>               },
