Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EDCF53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA89010E2A4;
	Mon, 16 Mar 2026 16:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AO1627mM";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC1510E292
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E53EA1A2E70;
 Mon, 16 Mar 2026 16:23:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BB5995FC4A;
 Mon, 16 Mar 2026 16:23:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F382A10372205; Mon, 16 Mar 2026 17:23:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=UZ2YqUnRpb6dNNo/ypf5iqG57RlbLCtY5jBjp6b9k+o=;
 b=AO1627mMTCyeobvPTO7Xyi1hwSpQ7zsbh2HS9fyJV2bzBd4zWiMXRdEl8iOtLvXKH0rfCI
 kz8yLw9z8Ce+ZornrAYetyOKzKXy4+9GyW+z+kl+lJCkHOeXSXxiLLHVWqD6JOZKi2qRne
 7dM9ovc4S2nnmN0Rz4qAXILIihygGqzTBlZUM8QBVx2VDxk/nkSTQX8511SMynOcQjWOHD
 LxZR7YCLH7APov61VoRyU1EdbgASeb+6t774/zcCI1M/3N5SDdCwHJzFglyzrR8u/ZNrMU
 sDkzZ7dlWl2TrHbUU8EZ0vlRRqTz1t5nWfBY5e5vixLyoGN9oef7h7e2tq3HBQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v9 00/49] Unigraf integration
Date: Mon, 16 Mar 2026 17:17:21 +0100
Message-Id: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQUU/EIAwA4L9y4VkMLTCYT/4P48OAsiPRzWxz0
 Vz2361LdJrjXhra0g/Si5hpKjSLh9NFTLSWuYwDJ+3dScRzN/QkS+JcoEKrDFr5PpR+6rIsw0J
 8WPi+BKCktXLWJit48m2iXD529UkU2ctFPHP5XOZlnD73t1bYmztrwVXZFSRIZUwXE4LWKT2Gc
 VxeynAfx9ddXPFQ3C0FpZLOpaixJetNvFb0oXjUdUWzEhlpks1dqCnmVwEAVVcMKypHFwIEAwq
 uFfujNArQ1xXLSg4ZqW1dp6CiNIfCoa40rHhtuuwRichdK+6Pcmsv7nu7OsUWjI4+Vv7iD0VDU
 1c8K8b4NmRvHQb6r2zb9gV0eHtmqQIAAA==
X-Change-ID: 20250425-unigraf-integration-11ed330755d5
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8506;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=iCJx9u2EZkt2ZQFdqoYzBURza28aSf7knNsSCPYlk3s=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6JzJeESmwXBfWIIV6cOH68EbrwXyMoQqt0o
 OZDBRkSoqqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguiRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLNshAAjWNbbV9Bno837E7jyTLebN0evyJK8tW
 VunL1P9LPELDJb4fdXyQRgyI6D2oamObgT7EwViLTOPhft94FXDX8PiDUyEdSudCfDPD/klohLJ
 V9VdU2PY6DWGUjC2Pxmhm+KCw2ImZlnnfjfMrAA+CjZ/WZkeZVflH8aTeqaAApLIb7q2aPT9dz4
 S6Nw8K8OcCS9Eae348Uwdcq0j8Bz7ur1vC1eSOqfDrcxaWOQ4aU5V5BqvUd/XzVfhO4zG6eQIP+
 LvsyqfVBwity/ePC8WK9o1lNiTPHPTOzjG03Wgb60Xz5Y/N1RB2E3UlQOFfcsk/DOviOFHOPLFM
 VllvmLVK/W0cV5X6cmb9yit8Z5Rep0RPbcFb8yoQEnQLwxS8SqD7R5kRqYGIHaObsPKA0wPLqw5
 tXEAzeVj3XqK01l2HPMzr6qwah7ZNaVqt8OujN6Fsl2y2a66Ff2FvBPGokrZ/j0iPsEWsDj/8cj
 HWcztWb3FSqjpz6I+ZwRx+/uCQyw4dM0rbRaQDJKdZR2ujwz3jDUYW9F2NHwuuOTNP+IzVBG4fy
 5Qz7ANEreEfdygoMSJUHJiK6CgmQTvZB+TYNdjUSEto5Pi0LRYi6ihY5VO86HMtPuo88n1RPDyO
 N44ldaToWY/t6Anv7Q3kjj8Fa7lWGECUlcHkHIo1lyWA6OrgeXZg=
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

Thanks,
Louis Chauvet

PS: sorry for the resend, I found a mistake in the cover and in a patch
authoship.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
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
 lib/igt_core.c                           |  33 ++
 lib/igt_core.h                           |   9 +
 lib/igt_debugfs.c                        |  96 +++-
 lib/igt_debugfs.h                        |  15 +-
 lib/igt_dp.c                             | 177 ++++++
 lib/igt_dp.h                             |  30 +
 lib/igt_kms.c                            | 844 ++++++++++++++--------------
 lib/igt_kms.h                            |  41 +-
 lib/igt_pipe_crc.c                       |  35 ++
 lib/meson.build                          |  12 +
 lib/monitor_edids/dp_edids.h             |   3 +
 lib/monitor_edids/hdmi_edids.h           |   3 +
 lib/monitor_edids/monitor_edids_helper.c | 126 +++++
 lib/monitor_edids/monitor_edids_helper.h |  10 +-
 lib/tests/igt_kms_array_diff.c           | 159 ++++++
 lib/tests/meson.build                    |   1 +
 lib/unigraf/TSI.h                        | 228 ++++++++
 lib/unigraf/TSI_types.h                  | 126 +++++
 lib/unigraf/unigraf.c                    | 909 +++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h                    | 105 ++++
 meson.build                              |  14 +
 tests/intel/kms_dp_link_training.c       |  19 +-
 tests/intel/kms_dp_linktrain_fallback.c  |  57 +-
 tests/meson.build                        |   4 +
 tests/unigraf/meson.build                |  13 +
 tests/unigraf/unigraf_connectivity.c     | 138 +++++
 tests/unigraf/unigraf_lt.c               | 183 +++++++
 32 files changed, 3421 insertions(+), 469 deletions(-)
---
base-commit: a7e8b577d5f590093bb2aeb65d73666f12941383
change-id: 20250425-unigraf-integration-11ed330755d5

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

