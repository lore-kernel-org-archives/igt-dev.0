Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEF3E87851
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 17:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DB510E1F8;
	Tue,  3 Feb 2026 17:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPxAcrWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B5810E1F8
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 17:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770141135; x=1801677135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l+DjPWu8DqLQyqe+w+nIINot3yk/4Rf9ygisln1wG0U=;
 b=ZPxAcrWhVq/yorio7Qd2Rko8dArQ6MkLlos8FFGk5+Hi3OphqaU37k0Z
 lIx5L+Px0/6YBeQAmu+3JZxgy99MOrCzXI8x7hzI2fDc+S9+NpDBxZbp9
 Bw/lr9AYjoCw6kqXCnafYuHfkBq0sPsOhrTSWjdq6s04++4DVSy/xiuoh
 WDtAH6QGqdkIKoS5LlHIocUN0PMR2v5klaR4CMAIwxZgM4ZJFH5OXppco
 3WKH2dsSEFmX+4gujJr/8ajYxDM0spDPHWPl1x5C38D/03Ki7GVj0lrt/
 foGV12skczeLEazihLiXiUfwe19dw3zte/9F4YEf6Ws/uUCawPip7EXsQ g==;
X-CSE-ConnectionGUID: k93IzbqIT9OhHkZ7KTFpRw==
X-CSE-MsgGUID: K977+mjBRnqHDH8D07UrKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70340565"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="70340565"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 09:52:14 -0800
X-CSE-ConnectionGUID: +7NGMBNxTN2BXdBNzXRisg==
X-CSE-MsgGUID: FlApavPiTaKus2ePc6uUTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210047187"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 09:52:13 -0800
Date: Tue, 3 Feb 2026 18:52:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kunal1.joshi@intel.com, Karol Krol <karol.krol@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>
Subject: Re: [PATCH v2] intel-ci: Split chamelium-only testlist for i915 and xe
Message-ID: <20260203175210.23gjsvfutwmjz5ob@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kunal1.joshi@intel.com, Karol Krol <karol.krol@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>
References: <20260203082954.1797919-1-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260203082954.1797919-1-mohammed.bilal@intel.com>
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
On 2026-02-03 at 13:59:54 +0530, Mohammed Bilal wrote:
> v2:
> - Moved suspend resume tests to the end of the testlist (Kunal)
> - Commented out random-plane test (Kunal)
> 
> Split the common chamelium-only.testlist into driver-specific testlists
> - i915.chamelium-only.testlist
> - xe.chamelium-only.testlist
> 
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/intel-ci/chamelium-only.testlist      | 77 --------------------
>  tests/intel-ci/i915.chamelium-only.testlist | 80 ++++++++++++++++++++-
>  tests/intel-ci/meson.build                  |  3 +-
>  tests/intel-ci/xe.chamelium-only.testlist   | 71 +++++++++++++++++-
>  tests/intel/kms_test_config.json            |  7 +-
>  5 files changed, 155 insertions(+), 83 deletions(-)
>  delete mode 100644 tests/intel-ci/chamelium-only.testlist

Instead of del-add-add, make it: move-fix-add
for example:
# remove symlinks
git rm xe.chamelium-only.testlist
git rm i915.chamelium-only.testlist
make a commit

git mv tests/intel-ci/chamelium-only.testlist tests/intel-ci/i915.chamelium-only.testlist
make a commit

now fix i915 version and make separate commit, 
then add xe version with already applied changes.

This way in changelong there will be a move and a small fix. 
Add also CI devs to Cc.

Regards,
Kamil

+cc:
Cc: Karol Krol <karol.krol@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Michal Czaplinski <michal.czaplinski@intel.com>

>  mode change 120000 => 100644 tests/intel-ci/i915.chamelium-only.testlist
>  mode change 120000 => 100644 tests/intel-ci/xe.chamelium-only.testlist
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
> index 000000000..034478811
> --- /dev/null
> +++ b/tests/intel-ci/i915.chamelium-only.testlist
> @@ -0,0 +1,79 @@
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
> +igt@kms_chamelium_frames@hdmi-cmp-planes-random
> +igt@kms_chamelium_frames@hdmi-crc-fast
> +igt@kms_chamelium_frames@hdmi-crc-multiple
> +igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
> +# Test is exhaustive and not written for CI
> +#igt@kms_chamelium_frames@hdmi-crc-planes-random
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
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> +igt@kms_chamelium_hpd@vga-hpd-after-suspend
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
>  intelci_files = [
>    'README',
> -  'chamelium-only.testlist',
>    'fast-feedback.testlist',
>    'fast-feedback-chamelium-only.testlist',
>    'i915.blocklist.txt',
>    'i915.blocklist-pre-merge.txt',
> +  'i915.chamelium-only.testlist',
>    'i915.fast-feedback.testlist',
>    'i915.fast-feedback-chamelium-only.testlist',
>    'meta.testlist',
> @@ -14,6 +14,7 @@ intelci_files = [
>    'xe.bmg.core.blocklist.txt',
>    'xe.bmg.display.blocklist.txt',
>    'xe.bmg.eudebug.blocklist.txt',
> +  'xe.chamelium-only.testlist',
>    'xe.eudebug.blocklist.txt',
>    'xe.fast-feedback.testlist',
>    'xe-fast-feedback.testlist',
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
> index 000000000..ad86db1ff
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
> +# Test is exhaustive and not written for CI
> +#igt@kms_chamelium_frames@hdmi-crc-planes-random
> +igt@kms_chamelium_frames@hdmi-crc-single
> +igt@kms_chamelium_frames@hdmi-frame-dump
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
> +igt@kms_chamelium_sharpness_filter@filter-basic
> +igt@kms_tiled_display@basic-test-pattern-with-chamelium
> +#Place suspend tests at end
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
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
>                      "include": [
>                          { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
>                          { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
> -                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
> +                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
>  
>                          { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
> -                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
> +                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" },
> +                        { "Xe chamelium": "../intel-ci/xe.chamelium-only.testlist" }
>                      ],
>                      "exclude": [
>                          { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
> -                            { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
> +                            { "Xe BAT, Xe BAT chamelium, Xe chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
>                      ]
>                  }
>              },
> -- 
> 2.48.1
> 
