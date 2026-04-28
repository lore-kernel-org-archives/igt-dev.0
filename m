Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4A6FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7208910E0EB;
	Tue, 28 Apr 2026 04:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQiiIuK5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E39B10E0EB
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351619; x=1808887619;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o1hK/kXUM8LjtopB0qTLFDwicClHff+CKx/wAgh8YBo=;
 b=jQiiIuK5GXjFteJJaKSGYp8Xzmt13ZB/mKpkt6K2Z3u0pwVxPwWxYZtN
 mozT7ozFGjIkSNzDSun9TyuqzPP5+dck9zobnscmsx6c3yuQ+oUMz+Aqv
 0hCckCfLObeoEgPzHmQmKplPk9yz5ZxlaTLa+NyNtGVqzc8eq61ApiTg0
 k0PrYLjG+l1tLVUTKYwGDnonuEuknvOuGJEhnxhnzYCnDkr3i5TKixObT
 Zy04OihHMSV1Vw+xIq1nSwP0c/cxOWExLBMsuRcA3TvfGHm+p+Guc80rW
 zNUYOGNQyrQz8y/4JOBFK3SGE7lq7TCxPXqW5HFM9hgIQsuE+btTzgaCD A==;
X-CSE-ConnectionGUID: D5F1ZXT4TTKGefT+MHDlug==
X-CSE-MsgGUID: eUhvjByKTNax2oRR7Admvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167786"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:46:59 -0700
X-CSE-ConnectionGUID: /C035ipuTKWdJ6uChFq+Nw==
X-CSE-MsgGUID: 1Xmsw5JTT0Otb0IJauPm/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706230"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:46:57 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v1 00/25] Chamelium v3 Integration and Test Execution
Date: Tue, 28 Apr 2026 10:16:09 +0530
Message-ID: <20260428044644.257001-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Integrate Chamelium v3 hardware support for display testing. This includes
the Chamelium v3 library implementation, building with v3 support enabled,
and comprehensive display tests for HPD, EDID, frames, color, and audio.

Changes included:

1. Library helpers (patches 1-10):
   - Add connector detection and management helpers
   - Add monitor EDID management helpers
   - Add HDMI 4K EDID support

2. V2 reorganization (patches 11-14):
   - Move existing V2 code to lib/chamelium/v2/ and tests/chamelium/v2/
   - Rename V2 symbols to allow V2 and V3 to coexist

3. V3 library (patches 15-20):
   - Add Chamelium V3 library implementation
   - Support for HPD, EDID, frame capture, color and audio

4. V3 tests (patches 21-25):
   - kms_chamelium_v3_basic: Basic connectivity test
   - kms_chamelium_v3_hpd: Hot plug detect tests
   - kms_chamelium_v3_edid: EDID verification tests
   - kms_chamelium_v3_frames: Frame capture and CRC tests
   - kms_chamelium_v3_color: Color verification tests
   - kms_chamelium_v3_audio: Audio tests

Louis Chauvet (19):
  lib/igt_kms: Add a detect timeout value
  lib/igt_kms: Add helper to wait for a specific status on a connector
  lib/igt_kms: Add function to list connected connectors
  lib/igt_kms: Add helper to obtain a connector by its name or MST path
  lib/igt_kms: Add function to get valid pipe for specific output
  lib/monitor_edids: Add helper functions for using monitor_edid objects
  lib/monitor_edids: Add helper to get an EDID by its name
  lib/monitor_edids: Add helper to print all available EDID names
  lib/monitor_edids: Fix missing names in some monitor EDID
  lib/monitor_edids: Add new EDID for HDMI 4k
  tests/chamelium: Extract Chamelium v2 tests into a separate directory
  lib/chamelium/v2: Extract chamelium v2 wrapper into its own directory
  lib/chamelium/v2: Rename chamelium to chamelium_v2
  lib/chamelium/v2: Rename HAVE_CHAMELIUM to HAVE_CHAMELIUM_V2
  lib/chamelium/v3: Introduce the foundation for the Chamelium v3
    wrapper
  lib/chamelium/v3: Introduce initialization and cleanup of
    Chamelium-related structures
  lib/chamelium/v3: Add method to discover Chamelium ports
  lib/chamelium/v3: Implement method to retrieve Chamelium port names
  tests/chamelium/v3: Implement a basic Chamelium v3 accessibility test

Mohammed Bilal (6):
  lib/chamelium/v3: Add extended API for Chamelium v3 HPD, EDID, Frames,
    Color & Audio
  tests/chamelium/v3: Add HPD (Hot Plug Detect) tests for Chamelium v3
  tests/chamelium/v3: Add EDID tests for Chamelium v3
  tests/chamelium/v3: Add frame capture and CRC tests for Chamelium v3
  tests/chamelium/v3: Add color verification tests for Chamelium v3
  tests/chamelium/v3: Add audio tests for Chamelium v3

 .gitlab-ci.yml                                |    2 +-
 docs/testplan/meson.build                     |    4 +-
 lib/{ => chamelium/v2}/igt_chamelium.c        |    2 +-
 lib/{ => chamelium/v2}/igt_chamelium.h        |    0
 lib/{ => chamelium/v2}/igt_chamelium_stream.c |    2 +-
 lib/{ => chamelium/v2}/igt_chamelium_stream.h |    0
 lib/chamelium/v3/igt_chamelium.c              | 1267 ++++++++++++++
 lib/chamelium/v3/igt_chamelium.h              |  247 +++
 lib/igt.h                                     |    6 +-
 lib/igt_core.c                                |    4 +
 lib/igt_kms.c                                 |  371 +++-
 lib/igt_kms.h                                 |   18 +
 lib/meson.build                               |   21 +-
 lib/monitor_edids/dp_edids.h                  |    3 +
 lib/monitor_edids/hdmi_edids.h                |   27 +-
 lib/monitor_edids/monitor_edids_helper.c      |  127 ++
 lib/monitor_edids/monitor_edids_helper.h      |   12 +-
 lib/tests/meson.build                         |    8 +-
 meson.build                                   |   31 +-
 meson_options.txt                             |    8 +-
 .../chamelium/{ => v2}/kms_chamelium_audio.c  |    0
 .../chamelium/{ => v2}/kms_chamelium_color.c  |    0
 tests/chamelium/{ => v2}/kms_chamelium_edid.c |    2 +-
 .../chamelium/{ => v2}/kms_chamelium_frames.c |    0
 .../chamelium/{ => v2}/kms_chamelium_helper.c |    0
 .../chamelium/{ => v2}/kms_chamelium_helper.h |    0
 tests/chamelium/{ => v2}/kms_chamelium_hpd.c  |    0
 .../{ => v2}/kms_chamelium_sharpness_filter.c |    0
 tests/chamelium/v3/kms_chamelium_v3_audio.c   |  707 ++++++++
 tests/chamelium/v3/kms_chamelium_v3_basic.c   |   30 +
 tests/chamelium/v3/kms_chamelium_v3_color.c   | 1058 +++++++++++
 tests/chamelium/v3/kms_chamelium_v3_edid.c    | 1357 ++++++++++++++
 tests/chamelium/v3/kms_chamelium_v3_frames.c  | 1551 +++++++++++++++++
 tests/chamelium/v3/kms_chamelium_v3_hpd.c     |  928 ++++++++++
 tests/kms_color_helper.h                      |    2 +-
 tests/kms_feature_discovery.c                 |    6 +-
 tests/kms_tiled_display.c                     |    6 +-
 tests/meson.build                             |   53 +-
 38 files changed, 7762 insertions(+), 98 deletions(-)
 rename lib/{ => chamelium/v2}/igt_chamelium.c (99%)
 rename lib/{ => chamelium/v2}/igt_chamelium.h (100%)
 rename lib/{ => chamelium/v2}/igt_chamelium_stream.c (99%)
 rename lib/{ => chamelium/v2}/igt_chamelium_stream.h (100%)
 create mode 100644 lib/chamelium/v3/igt_chamelium.c
 create mode 100644 lib/chamelium/v3/igt_chamelium.h
 rename tests/chamelium/{ => v2}/kms_chamelium_audio.c (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_color.c (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_edid.c (99%)
 rename tests/chamelium/{ => v2}/kms_chamelium_frames.c (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_helper.c (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_helper.h (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_hpd.c (100%)
 rename tests/chamelium/{ => v2}/kms_chamelium_sharpness_filter.c (100%)
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_audio.c
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_basic.c
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_color.c
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_edid.c
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_frames.c
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_hpd.c

-- 
2.48.1

