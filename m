Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0828FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 14:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCD410EBB5;
	Tue, 28 Apr 2026 14:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="E9bmIijA";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A2010EBB5
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 14:03:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 142B34E42B5C;
 Tue, 28 Apr 2026 14:03:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CDB62601D0;
 Tue, 28 Apr 2026 14:03:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4139310728C82; 
 Tue, 28 Apr 2026 16:03:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777385007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=8mit8xK8aXJJ7PcIPf6Tguwyq3E7tk8U6B3FY/kdC6o=;
 b=E9bmIijAt3GWEtyjrAYfwyxNRujukfg2AZpljCirge2dhn982v6eO27bvzZ+gxPCxNP63m
 ZrFUaLiBMxvMT4YHOg3N5MNI4/2kA9qWId8IAdXpaMS0GU0E0s/82U0Xx0VR/qwEaV39ql
 t0S6MJMFn3CkmfABzd+L3aFzYG37Op161W7CoB2sCbuFm/WMAyqIYcr20rq7rc93fN3VQq
 wFodV4Pd5plQJ0kKRrQLPl27U8mZ3iF47C/S7LFTVylJ2AmAtxrePvKJwJE9LXdBUDmTg4
 wGdC3fSMeHsxTVuvRlftjSzLmDek87xmFnziwzsyK56Cy46xHIlK+2p6kyvvvQ==
Message-ID: <befb0fea-e22a-491a-8a7a-123615956bff@bootlin.com>
Date: Tue, 28 Apr 2026 16:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 00/25] Chamelium v3 Integration and Test Execution
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Kory Maincent <kory.maincent@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

+CC: Kory, Luca, Jani, Kamil

Hello Mohammed,

I'm happy for you to reuse my series, as I no longer have the time to 
work on it (my priorities have shifted to Unigraf support). I'd be glad 
to review your series.

Before I do, could you double-check the patches you sent? I noticed a 
few issues with the igt_kms patches:
- Indentation and Signed-off-by issues reported by Jani.
- Some patches may not have been reviewed by Köry and Luca. Could you 
verify which version you used and ensure the correct reviews are 
included? For example, in [1], Luca's review appears valid (added in 
[2]), but Köry's review is not (added in [3], which is a different version).

@Jani, @Kamil, @Luca, and @Kory have already reviewed the 
igt_kms/monitor_edids patches [4] (newer revision). To avoid duplicate 
reviews, it would be great if we could streamline this. Did you need to 
make changes for your series? Can you underline them so I can integrate 
them in [4].

@Kamil, @Jani: You’ve already provided feedback in [4]. Would you be 
open to merging those patches so Mohammed can reuse them without 
duplicating the review process? Or would you prefer a separate series?

Thanks a lot,
Louis chauvet

[1]:https://lore.kernel.org/all/20260428044644.257001-2-mohammed.bilal@intel.com/
[2]:https://lore.kernel.org/all/20260128-unigraf-integration-v5-1-fbf2e997a011@bootlin.com/
[3]:https://lore.kernel.org/all/20260316-unigraf-integration-v8-1-4489bf8572be@bootlin.com/




On 4/28/26 06:46, Mohammed Bilal wrote:
> Integrate Chamelium v3 hardware support for display testing. This includes
> the Chamelium v3 library implementation, building with v3 support enabled,
> and comprehensive display tests for HPD, EDID, frames, color, and audio.
> 
> Changes included:
> 
> 1. Library helpers (patches 1-10):
>     - Add connector detection and management helpers
>     - Add monitor EDID management helpers
>     - Add HDMI 4K EDID support
> 
> 2. V2 reorganization (patches 11-14):
>     - Move existing V2 code to lib/chamelium/v2/ and tests/chamelium/v2/
>     - Rename V2 symbols to allow V2 and V3 to coexist
> 
> 3. V3 library (patches 15-20):
>     - Add Chamelium V3 library implementation
>     - Support for HPD, EDID, frame capture, color and audio
> 
> 4. V3 tests (patches 21-25):
>     - kms_chamelium_v3_basic: Basic connectivity test
>     - kms_chamelium_v3_hpd: Hot plug detect tests
>     - kms_chamelium_v3_edid: EDID verification tests
>     - kms_chamelium_v3_frames: Frame capture and CRC tests
>     - kms_chamelium_v3_color: Color verification tests
>     - kms_chamelium_v3_audio: Audio tests
> 
> Louis Chauvet (19):
>    lib/igt_kms: Add a detect timeout value
>    lib/igt_kms: Add helper to wait for a specific status on a connector
>    lib/igt_kms: Add function to list connected connectors
>    lib/igt_kms: Add helper to obtain a connector by its name or MST path
>    lib/igt_kms: Add function to get valid pipe for specific output
>    lib/monitor_edids: Add helper functions for using monitor_edid objects
>    lib/monitor_edids: Add helper to get an EDID by its name
>    lib/monitor_edids: Add helper to print all available EDID names
>    lib/monitor_edids: Fix missing names in some monitor EDID
>    lib/monitor_edids: Add new EDID for HDMI 4k
>    tests/chamelium: Extract Chamelium v2 tests into a separate directory
>    lib/chamelium/v2: Extract chamelium v2 wrapper into its own directory
>    lib/chamelium/v2: Rename chamelium to chamelium_v2
>    lib/chamelium/v2: Rename HAVE_CHAMELIUM to HAVE_CHAMELIUM_V2
>    lib/chamelium/v3: Introduce the foundation for the Chamelium v3
>      wrapper
>    lib/chamelium/v3: Introduce initialization and cleanup of
>      Chamelium-related structures
>    lib/chamelium/v3: Add method to discover Chamelium ports
>    lib/chamelium/v3: Implement method to retrieve Chamelium port names
>    tests/chamelium/v3: Implement a basic Chamelium v3 accessibility test
> 
> Mohammed Bilal (6):
>    lib/chamelium/v3: Add extended API for Chamelium v3 HPD, EDID, Frames,
>      Color & Audio
>    tests/chamelium/v3: Add HPD (Hot Plug Detect) tests for Chamelium v3
>    tests/chamelium/v3: Add EDID tests for Chamelium v3
>    tests/chamelium/v3: Add frame capture and CRC tests for Chamelium v3
>    tests/chamelium/v3: Add color verification tests for Chamelium v3
>    tests/chamelium/v3: Add audio tests for Chamelium v3
> 
>   .gitlab-ci.yml                                |    2 +-
>   docs/testplan/meson.build                     |    4 +-
>   lib/{ => chamelium/v2}/igt_chamelium.c        |    2 +-
>   lib/{ => chamelium/v2}/igt_chamelium.h        |    0
>   lib/{ => chamelium/v2}/igt_chamelium_stream.c |    2 +-
>   lib/{ => chamelium/v2}/igt_chamelium_stream.h |    0
>   lib/chamelium/v3/igt_chamelium.c              | 1267 ++++++++++++++
>   lib/chamelium/v3/igt_chamelium.h              |  247 +++
>   lib/igt.h                                     |    6 +-
>   lib/igt_core.c                                |    4 +
>   lib/igt_kms.c                                 |  371 +++-
>   lib/igt_kms.h                                 |   18 +
>   lib/meson.build                               |   21 +-
>   lib/monitor_edids/dp_edids.h                  |    3 +
>   lib/monitor_edids/hdmi_edids.h                |   27 +-
>   lib/monitor_edids/monitor_edids_helper.c      |  127 ++
>   lib/monitor_edids/monitor_edids_helper.h      |   12 +-
>   lib/tests/meson.build                         |    8 +-
>   meson.build                                   |   31 +-
>   meson_options.txt                             |    8 +-
>   .../chamelium/{ => v2}/kms_chamelium_audio.c  |    0
>   .../chamelium/{ => v2}/kms_chamelium_color.c  |    0
>   tests/chamelium/{ => v2}/kms_chamelium_edid.c |    2 +-
>   .../chamelium/{ => v2}/kms_chamelium_frames.c |    0
>   .../chamelium/{ => v2}/kms_chamelium_helper.c |    0
>   .../chamelium/{ => v2}/kms_chamelium_helper.h |    0
>   tests/chamelium/{ => v2}/kms_chamelium_hpd.c  |    0
>   .../{ => v2}/kms_chamelium_sharpness_filter.c |    0
>   tests/chamelium/v3/kms_chamelium_v3_audio.c   |  707 ++++++++
>   tests/chamelium/v3/kms_chamelium_v3_basic.c   |   30 +
>   tests/chamelium/v3/kms_chamelium_v3_color.c   | 1058 +++++++++++
>   tests/chamelium/v3/kms_chamelium_v3_edid.c    | 1357 ++++++++++++++
>   tests/chamelium/v3/kms_chamelium_v3_frames.c  | 1551 +++++++++++++++++
>   tests/chamelium/v3/kms_chamelium_v3_hpd.c     |  928 ++++++++++
>   tests/kms_color_helper.h                      |    2 +-
>   tests/kms_feature_discovery.c                 |    6 +-
>   tests/kms_tiled_display.c                     |    6 +-
>   tests/meson.build                             |   53 +-
>   38 files changed, 7762 insertions(+), 98 deletions(-)
>   rename lib/{ => chamelium/v2}/igt_chamelium.c (99%)
>   rename lib/{ => chamelium/v2}/igt_chamelium.h (100%)
>   rename lib/{ => chamelium/v2}/igt_chamelium_stream.c (99%)
>   rename lib/{ => chamelium/v2}/igt_chamelium_stream.h (100%)
>   create mode 100644 lib/chamelium/v3/igt_chamelium.c
>   create mode 100644 lib/chamelium/v3/igt_chamelium.h
>   rename tests/chamelium/{ => v2}/kms_chamelium_audio.c (100%)
>   rename tests/chamelium/{ => v2}/kms_chamelium_color.c (100%)
>   rename tests/chamelium/{ => v2}/kms_chamelium_edid.c (99%)
>   rename tests/chamelium/{ => v2}/kms_chamelium_frames.c (100%)
>   rename tests/chamelium/{ => v2}/kms_chamelium_helper.c (100%)
>   rename tests/chamelium/{ => v2}/kms_chamelium_helper.h (100%)
>   rename tests/chamelium/{ => v2}/kms_chamelium_hpd.c (100%)
>   rename tests/chamelium/{ => v2}/kms_chamelium_sharpness_filter.c (100%)
>   create mode 100644 tests/chamelium/v3/kms_chamelium_v3_audio.c
>   create mode 100644 tests/chamelium/v3/kms_chamelium_v3_basic.c
>   create mode 100644 tests/chamelium/v3/kms_chamelium_v3_color.c
>   create mode 100644 tests/chamelium/v3/kms_chamelium_v3_edid.c
>   create mode 100644 tests/chamelium/v3/kms_chamelium_v3_frames.c
>   create mode 100644 tests/chamelium/v3/kms_chamelium_v3_hpd.c
> 

