Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBDFFED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF91890BE;
	Fri, 24 Apr 2026 16:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NkbZLAig";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38D5890BE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7215C1A3402;
 Fri, 24 Apr 2026 16:54:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4107C604EB;
 Fri, 24 Apr 2026 16:54:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2CF0310720A1A; 
 Fri, 24 Apr 2026 18:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=/cx6v8kJUz7wtXF2gO6qJapTq47ghSEEQnNCRuVInX8=;
 b=NkbZLAigBqAy12SkhCKkg09VG8L8VrNYtWfyzFiqwtMhrufMkpZHYg5nfuAEfrs+rv5bOA
 LliCdzQeOplxce59R1uvMndlBeD4CuofnLCzh5yZSGwESt6L1dmDaSjoUH8Uiy1s6ESyjU
 PTDhw5pn9S4urAYg7RAiVeXXiYWrYN0o1nXnzON4mnK9/n8ZTR0msGzJ1U0vUHmyg1Orh0
 1cFRqbhM1PA5mgwypb2kjQGIYSUX2NWZVghqh+rr+7rzqESeM6jgUYIWfY87AKeN5YrCNU
 c+xOvnhEZ8DP17qP0eSM2ZReOVhAmwF3E9b4drIU1JC379UF27Epm77IZub/iw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v11 00/49] Unigraf integration
Date: Fri, 24 Apr 2026 18:52:35 +0200
Message-Id: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANOf62kC/43SzUrEMBAA4FdZcjaSmUma1JPvIR6av92AttLWo
 iz77o4F7WKz4CUkE+abMJmzmNJY0iQeDmcxpqVMZej5AHB3EOHU9cckS+SAQIVGaTTyvS/Hscu
 y9HPizcwJEiBFImWNiUZw5tuYcvlY2SdR5FHO4pnDpzLNw/i5FltgvVxZA7bKLiBBKq27EBGIY
 nz0wzC/lP4+DK+ruOCm2FsKSiWtjYGwTcbpsFdoUxxSXSFWAiNNNLnzNUX/KgCg6opmReVgvQe
 vQcFeMT9KowBdXTGsZJ8xta3tFFSUZlN4qSsNK450lx1iSsnuFXul3OqL/e4uxdCCpuBC5S1uU
 wiauuJY0dq1Pjtj0ae90v5DaVnhfsScA3kV/F4BdcUQ3Bg7/iMJiE0TSIcAf+bucrl8AWqjXp8
 4AwAA
X-Change-ID: 20250425-unigraf-integration-11ed330755d5
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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

Hi everyone,

I am excited to share I currently have access to a Unigraf device,
which I believe could significantly enhance the capabilities within IGT.
This device has the potential to enable testing of low-level hardware
features that are currently not covered. Specifically, Unigraf devices can
assist in testing link training, signal integrity, HDCP, DSC, and more.

It's important to note that the Unigraf SDK is not open-source, and the
communication protocol with the device is proprietary. As a result, I have
utilized the libTSI.so library, which can be downloaded from [1]. In this
series, I have not used the official TSI_types.h header because it was
incompatible with C, so I hardcoded some necessary values.

This series is a bit longer than I expected, but can be splitted to be
merged faster:
-  PATCHES 1..17: Preparation for the series, I decided to move them at the
                  start to avoid mixing unigraf and igt modifications
-  PATCHES 18..20: Add basic unigraf configuration
- *PATCH       21: Autoconnect unigraf when configured
- *PATCHES 22..24: Add more unigraf configuration
-  PATCHES 25..30: Add basic unigraf helpers
- *PATCH       31: First basic unigraf test (connection, MST stream count)
- *PATCHES 32..36: Add CRC calculation using unigraf instead of GPU CRC
-  PATCHES 37..44: Move i915-specific helpers and create generic ones,
                   clean some code
-  PATCHES 45..48: Add unigraf configuration for link configuration
- *PATCHES     49: Add link training tests

Each * is a new feature and the series can be partially applied to this
point.

There is currently a crash *after* running IGT tests, I was not able to
find why, so I would be happy if someone can direct me to resources/explain
me how the igt_subtest and igt_fixture macro work.

Thanks,
Louis Chauvet

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v11:
- Add reviews and modifictions from Köry, thanks!
- Link to v10: https://patch.msgid.link/20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com

Changes in v10:
- Moved unigraf library to vendor subdirectory
- Fixed stuff reported by Kory and Kamil
- Link to v9: https://lore.kernel.org/r/20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com

Changes in v9:
- Fix numbering in cover letter
- Clarify authorship in array tests (file skeleton was generated by
  Mistral, but edited by me)
- Link to v8: https://lore.kernel.org/r/20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com

Changes in v8:
- Fixed memory leaks found by Köry
- Renamed list to array (I did not use the existing igt_list, it adds a
  layer of complexity: new structure to store int + link, custom free
  function...)
- Added test for array
- Link to v7: https://lore.kernel.org/r/20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com

Changes in v7:
- Applied Kory's comments (I forgot to update this list ...)
- Link to v6: https://lore.kernel.org/r/20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com

Changes in v6:
- Fix missed conflicts on master, I don't know how I missed them, sorry
- Link to v5: https://lore.kernel.org/r/20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com

Changes in v5:
- Fixed all feedback from Luca (thanks a lot!)
- Added PATCHES 39..40 to clean i915/dp (checkpatch warning)
- Reordered 31..48 to be able to apply partially the series if needed.
- Few modifications of 31..48 to rebase on master and apply some Luca's
  comments
- Link to v4: https://lore.kernel.org/r/20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com

Changes in v4:
- Rebased on master
- Fixed multiple unigraf callbacks
- Created link training tests
- Link to v3: https://lore.kernel.org/r/20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com

Changes in v3:
- Rebased on master
- Added support for MST
- Repair autodetection and CRC usage
- Link to v2: https://lore.kernel.org/r/20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com

Changes in v2:
- Splitted in many commits
- Add CRC support
- Link to v1: https://lore.kernel.org/r/20250517-unigraf-integration-v1-1-044acd2133dd@bootlin.com

---
Louis Chauvet (49):
      lib/igt_kms: Add a detect timeout value
      lib/igt_kms: Add helper to wait for a specific status on a connector
      lib/igt_kms: Add function to list connected connectors
      lib/igt_kms: Add helper to obtain a connector by its name or MST path
      lib/igt_kms: Add helper to wait for new connectors
      lib/tests: Add tests for array manipulations
      lib/igt_kms: Add helper to get a pipe from a connector
      lib/igt_kms: Expose dump_connector_attrs
      lib/igt_kms: Expose reset_connectors_at_exit
      lib/igt_kms: Expose connector_attr_set and igt_connector_attr_set
      lib/igt_debugfs: Move debugfs helpers to the proper location
      lib/igt_debugfs: Add const when make sense
      lib/igt_amd: Add const when make sense
      lib/igt_kms: Add const when make sense
      lib/monitor_edids: Add helper functions for using monitor_edid objects
      lib/monitor_edids: Add helper to get an EDID by its name
      lib/monitor_edids: Add helper to print all available EDID names
      lib/unigraf: Add used defines for TSI_Types
      lib/unigraf: Add TSI.h
      lib/unigraf: Initial Unigraf support
      lib/igt_kms: Automatically connect unigraf on display require
      lib/unigraf: Introduce device configuration
      lib/unigraf: Introduce role configuration
      lib/unigraf: Introduce input configuration
      lib/unigraf: Add reset function
      lib/unigraf: Add unigraf assert and deassert helpers
      lib/unigraf: Add plug/unplug helpers
      lib/unigraf: Allows sst/mst configuration
      lib/unigraf: Add helpers to read and write edid
      lib/unigraf: Add connector and EDID configuration
      tests/unigraf: Add basic unigraf tests
      lib/unigraf: Add unigraf CRC capture
      lib/unigraf: Add configuration for CRC usage
      lib/unigraf: add unigraf_get_connector_by_stream
      lib/unigraf: Add helper to check timings received by unigraf
      lib/igt_pipe_crc: Add unigraf crc calculation
      lib/i915/dp: Move DP-related function for i915 to proper folder
      lib/i915/dp: Rename functions to avoid confusion
      lib/i915/dp: Add helper to get maximum supported rate
      lib/i915/dp: Properly check sscanf results
      lib/i915/dp: Use igt_output_name instead of private field
      lib/igt_dp: Create generic helpers for DP information
      lib/igt_kms: Add asserts to avoid null pointer dereference
      lib/igt_kms: Add helper to get a CRTC from an output
      lib/unigraf: Add lane count configuration
      docs/unigraf: Add unigraf documentation
      lib/unigraf: Add helpers to set maximum link rate
      lib/unigraf: Add helpers to get the current LT status
      tests/unigraf/unigraf_lt: Add test for link training

 docs/unigraf.txt                         |  81 +++
 lib/i915/i915_dp.c                       | 392 +++++++++++++
 lib/i915/i915_dp.h                       |  23 +
 lib/igt_amd.c                            |   2 +-
 lib/igt_amd.h                            |   2 +-
 lib/igt_core.c                           |  32 ++
 lib/igt_core.h                           |  10 +
 lib/igt_debugfs.c                        |  96 +++-
 lib/igt_debugfs.h                        |  15 +-
 lib/igt_dp.c                             | 175 ++++++
 lib/igt_dp.h                             |  30 +
 lib/igt_kms.c                            | 857 +++++++++++++++--------------
 lib/igt_kms.h                            |  41 +-
 lib/igt_pipe_crc.c                       |  35 ++
 lib/meson.build                          |  12 +
 lib/monitor_edids/dp_edids.h             |   3 +
 lib/monitor_edids/hdmi_edids.h           |   3 +
 lib/monitor_edids/monitor_edids_helper.c | 126 +++++
 lib/monitor_edids/monitor_edids_helper.h |  10 +-
 lib/tests/igt_kms_array_diff.c           | 159 ++++++
 lib/tests/meson.build                    |   1 +
 lib/vendor/unigraf/TSI.h                 | 228 ++++++++
 lib/vendor/unigraf/TSI_types.h           | 126 +++++
 lib/vendor/unigraf/unigraf.c             | 913 +++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h             | 106 ++++
 meson.build                              |  14 +
 tests/intel/kms_dp_link_training.c       |  19 +-
 tests/intel/kms_dp_linktrain_fallback.c  |  57 +-
 tests/meson.build                        |   4 +
 tests/unigraf/meson.build                |  13 +
 tests/unigraf/unigraf_connectivity.c     | 138 +++++
 tests/unigraf/unigraf_lt.c               | 183 +++++++
 32 files changed, 3437 insertions(+), 469 deletions(-)
---
base-commit: a5c5d655807ead8204e01754b6434f0ecae40b96
change-id: 20250425-unigraf-integration-11ed330755d5

Best regards,
--  
Louis Chauvet <louis.chauvet@bootlin.com>

