Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FC8E7DEE3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB0110E410;
	Mon,  2 Feb 2026 14:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OzxHWWRC";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD2710E410
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 297271A2C16
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E8EB460767;
 Mon,  2 Feb 2026 14:32:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1ECBA119A8888; Mon,  2 Feb 2026 15:32:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=RLcStP02XzAUzrmYIvjkxZ8gwjQBaVPBNAx7bpQGPtE=;
 b=OzxHWWRC7NJoHdkDaALmsjYKXfHpS1WNoWBNpuV6imxj5cvhlBgVNyanDdHYn2C8NAsgsO
 3J8In+kzDcbbufePLxMsPZxeikkbnXI2fzREhFZDcN4R+Rdcz0lJLua08P+CqhaiWKYlB/
 JXxQ5KLOFiLhZ+Fyh7CJza98QQI8urITUrJfRayuHVhHqFgU3G0+9aPTlruvRfsYQNqwgr
 toLG2lZV3t4lRz3nDddKm42pl8j6lsSDN8iEk9/Cpvsyw7yHrc1XCFss91hmDh8T1BQFFP
 nCW6jfQm//Uu0KbK1VAX0RGq4XGVgX8KPP/s6lnyskYj6fg4SQXausQouy+EKQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v6 00/48] Unigraf integration
Date: Mon, 02 Feb 2026 15:32:39 +0100
Message-Id: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNyUoEMRAG4FcZcjaSytLp9uR7iIesPQWaDOnYK
 EO/uyGgA0681V/LV1eyhYJhI0+nKylhxw1zamF6OBF3NmkNFH3LhDOumOSKfiRci4kUUw2tqG2
 fAgQvBNNKeUXa5aWEiJ9dfSFIV1rJa2ufcau5fPVfO/RhZxXoIbsDBcqkNM5zEML7Z5tzfcP06
 PJ7F3d+U/R/CqeMau2d4EtQs3T3irgpMxdjRTTFNWTyKho7UuSvAgBsrMimsOi0tWAlMLhX1I8
 yMeDzWFFNiTbysCzaMPijHMfxDTeSP3jXAQAA
X-Change-ID: 20250425-unigraf-integration-11ed330755d5
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7437;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=04O7+xkoQMe89FTYAWkS7aHaYGmauzrXSo1JBfIaVpU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWOVZAP3oAQz1lwB23LePtVQRIPZn8fX2mcQ
 Jo0GsG7I56JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIV5g//QJea2+s/ewf0kanu3+GEH3Il+QsNr7G
 TJigSEN7Ufy8zMZQMU3wS7zrw19ow1KWoY5rYzUr+v2twkzeWhMByKsEKE428gYHkRRevgaXoHa
 cz4eLQGmabnISWiRn0hKS77xfso8XRKRY+2V2Xxv17f+23qFQhoLS+PiU+ezQH2c242VOHu0QG7
 TFpS+P4O1psF1Zl/7Wts3uZnDDBPEyoNmV5KW1+P8yT6MqzIJGzzTSGiJTyDeb/MRLUWXyZJQ85
 wUqQwTGMiHYkLAxIqUOmD3JZu1bZMtHYglTyrp8DCofG67ME8oCrNMnXCoA2oPhmytBnoG3ojQK
 p+Qsfngin+qxDIOYG+raFGJlWhFFRlPb8/OMrsdnylEW7t37dtsxFLDmvhpw81ggGvB4iMohhqu
 i7PZaLAgfXSp3xc/FHTY/gWIulv7cR+7sbOrkJQkb6eDqLEowRhW3Pep+hDMRIFCBeYuzveyd6s
 cS6eID+Liwh0CbwkqVIkqUmzajZCn30n+qxpcAPJJl8tskkQ7zGAML68aIfQkE5gSTJdFVlGbew
 mOretnZPbElVi8WZlK7CwZjDdB9CA8Ksk0HCCScuuS3Y5gnK1psrtQYrmgB54UaDtA3uPzlU1TJ
 3PW142DCDwziYqPWcIiEumtX+IU6foOdJSNoIOpF8zfdV9L9gvPE=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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
-  PATCHES 1..16: Preparation for the series, I decided to move them at the
                  start to avoid mixing unigraf and igt modifications
-  PATCHES 17..19: Add basic unigraf configuration
- *PATCH       20: Autoconnect unigraf when configured
- *PATCHES 21..23: Add more unigraf configuration
-  PATCHES 24..29: Add basic unigraf helpers
- *PATCH       30: First basic unigraf test (connection, MST stream count)
- *PATCHES 31..35: Add CRC calculation using unigraf instead of GPU CRC
-  PATCHES 36..43: Move i915-specific helpers and create generic ones,
                   clean some code
-  PATCHES 44..47: Add unigraf configuration for link configuration
- *PATCHES     48: Add link training tests

Each * is a new feature and the series can be partially applied to this
point.

Thanks,
Louis Chauvet

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
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
Louis Chauvet (48):
      lib/igt_kms: Add a detect timeout value
      lib/igt_kms: Add helper to wait for a specific status on a connector
      lib/igt_kms: Add function to list connected connectors
      lib/igt_kms: Add helper to obtain a connector by its name or MST path
      lib/igt_kms: Add helper to wait for new connectors
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
      lib/igt_pipe_crc: Add ungiraf crc calculation
      lib/i915/dp: Move DP-related function for i915 to proper folder
      lib/i915/dp: Rename functions to avoid confusion
      lib/i915/dp: Add helper to get maximum supported rate
      lib/i915/dp: Properly check sscanf results
      lib/i915/dp: Use igt_output_name instead of private field
      lib/igt_dp: Create generic helpers for DP information
      lib/igt_kms: Add asserts to avoid null pointer dereference
      lib/igt_kms: Add helper to get a pipe from an output
      lib/unigraf: Add lane count configuration
      docs/unigraf: Add unigraf documentation
      lib/unigraf: Add helpers to set maximum link rate
      lib/unigraf: Add helpers to get the current LT status
      tests/unigraf/unigraf_lt: Add test for link training

 docs/unigraf.txt                         |  81 +++
 lib/i915/i915_dp.c                       | 365 ++++++++++++
 lib/i915/i915_dp.h                       |  23 +
 lib/igt_amd.c                            |   2 +-
 lib/igt_amd.h                            |   2 +-
 lib/igt_core.c                           |   4 +
 lib/igt_debugfs.c                        |  96 +++-
 lib/igt_debugfs.h                        |  15 +-
 lib/igt_dp.c                             | 164 ++++++
 lib/igt_dp.h                             |  24 +
 lib/igt_kms.c                            | 865 ++++++++++++++--------------
 lib/igt_kms.h                            |  50 +-
 lib/igt_pipe_crc.c                       |  35 ++
 lib/meson.build                          |  12 +
 lib/monitor_edids/dp_edids.h             |   3 +
 lib/monitor_edids/hdmi_edids.h           |   3 +
 lib/monitor_edids/monitor_edids_helper.c | 126 +++++
 lib/monitor_edids/monitor_edids_helper.h |  10 +-
 lib/unigraf/TSI.h                        | 228 ++++++++
 lib/unigraf/TSI_types.h                  | 126 +++++
 lib/unigraf/unigraf.c                    | 928 +++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h                    |  99 ++++
 meson.build                              |  14 +
 tests/intel/kms_dp_link_training.c       |  19 +-
 tests/intel/kms_dp_linktrain_fallback.c  |  57 +-
 tests/meson.build                        |   4 +
 tests/unigraf/meson.build                |  13 +
 tests/unigraf/unigraf_connectivity.c     | 129 +++++
 tests/unigraf/unigraf_lt.c               | 178 ++++++
 29 files changed, 3206 insertions(+), 469 deletions(-)
---
base-commit: c6cd0883bf3e46ab3439d27e59d4b4fb1eae3a68
change-id: 20250425-unigraf-integration-11ed330755d5

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

