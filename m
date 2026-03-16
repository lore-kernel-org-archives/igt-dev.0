Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933E5F46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E51710E258;
	Mon, 16 Mar 2026 10:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="M2rfBRGO";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733D210E258
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F0641C415A5;
 Mon, 16 Mar 2026 10:24:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 71E9E5FC4A;
 Mon, 16 Mar 2026 10:23:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A592A10368615; Mon, 16 Mar 2026 11:23:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=AZNfIPu5z/i34OxnjivQekVauFQFhz9K+GMuVO7y+kk=;
 b=M2rfBRGOg+ffQKf03TT99pAU/NqvA+i/VjEcSIT8a29gs3/aHp9SaWkWMPFmz1seTVdjh0
 jaeChbKtSSkqHH7U+EVQU+O2TA4mvXG+HYxQmPvFopVWR58xRwq7ANaaMG0k0isNkf2Xl0
 /9DOazzIBSfWoD1VbbeE4XnUmz2fwB1zGHp1hWbW/tHQ3MYjlmLksFJ18k4OIFLVdNciKf
 BuFYhr++AsnOazIettxEeQEZY6STq077x2FAbKuMwBDi1lO4T+bxePr+H9YDmD1GiGKpEh
 5mKUf7UsqlEqNosSayieff1H4UcJyFHsOi5W9k/VW+y55l6jl04yTp/PKeK6rw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v8 00/49] Unigraf integration
Date: Mon, 16 Mar 2026 11:24:08 +0100
Message-Id: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQUU/EIAwA4L9y4VkMLTCYT/4P4wODsiPRzWxz0
 Vz2361LdMbjXhra0g/Si5hpKjSLh9NFTLSWuYwDJ/7uJOI5DD3JkjgXqNAqg1a+D6WfQpZlWIg
 PC9+XAJS0Vs7aZAVPvk2Uy8euPokie7mIZy6fy7yM0+f+1gp7c2ctuCq7ggSpjAkxIWid0mM3j
 stLGe7j+LqLKx6Ku6WgVNK5FDW2ZL2J14o+FI+6rmhWIiNNsjl0NcX8KgCg6ophReXoug46Awq
 uFfujNArQ1xXLSu4yUtu6oKCiNIfCoa40rHhtQvaIROSuFfdHubUX971dnWILRkcf//1l27Yvh
 VE4MWMCAAA=
X-Change-ID: 20250425-unigraf-integration-11ed330755d5
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8169;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=V6xyd3cNqrgbw/t6ZifdEUvvmG5x9+r1PBk/S6JvI7w=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pOPB9SCDofoFD2n/x5luJZXD9hBzY8xUaMS
 Kep4IlQFaKJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaThsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOL8ug//d8BrKJT5UT0jNUUGO0gPesDu8zspfUv
 b0f81AgmS8/hH8vUWbzHEB6cY3HHH4PzjgOyoKVtaq7tAAcWr4Pobb2bMRXt85S4D57C6NvsXHD
 M5VMCaBp0VmhJV2Q0v9wcitKMzksjbBAAUJn9oTP3y5cQGnRP4GSibCbPUPIksAX/kXyUDyhHxc
 5dqNOADYv+1dO+6fTsofUuErx4YHl284Y2R6PQ4kNfjU/2iaazgVN6BDYNhDXByZwdtHmrPv7qV
 RiwVAfKkCBxH6pER5PgHxW62WsRiJhiE3i5e6wi2FlfXiUg5R/ZGSog9wa0N3B5A+o/5vP07pqY
 AgcQGksEQiyVlRaDd3xdE4yijNGhwCtoMpW3xUf+NWPsaHQ3ZYU9yqxuO/urLOT/5idaH4CI2Dl
 3Uq7O9w7Vc3xEHmfE/CeXCREb+yGZB5sUF+M9/je/TLfwAjhLxyZJTZp+3DAo4GK15cV50vmAcb
 owWmLw2vVSKJNfkiNmp/TSzoPk3wOJzXw2QUv2ecFUGaIlnO+D/jPACpcFv8v06KVC3TIEQrYcm
 OeMEdlKdzkuxdB8aLArEtnqhHFoCZJl5ZZAiF1Y1BKbZUYJzhOzrv97XtRQwO27hw0ULOeiDGHh
 UY38T2226zaFG24sUy7nYvsZYULPWSErUNpO1b+JA7CALdmw8N5U=
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

