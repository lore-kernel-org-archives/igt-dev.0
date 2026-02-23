Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97A4EA4FB2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C33C10E35F;
	Mon, 23 Feb 2026 12:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1K/eM2TH";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6DB10E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 410D2C143C5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0A7805FD43;
 Mon, 23 Feb 2026 12:08:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 24A3C10368F7F; Mon, 23 Feb 2026 13:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=wwws3na5zQDP4Wxv9MhkIw3DW5hvCI/zmF58UbdUBos=;
 b=1K/eM2THvwAIWbzIXMh2oEaoUHuPt66LPSNDUY9cUgRexMFZEwbXHaYUoZ1HMTK8nv+y9j
 p2MvnzXdoMxD15AyltHd4dWcqsT+Rc3F30TBXk4qGj3GIM1u1nCSsCn4gNdhiKerrK4uxm
 DKbqAgQSpqcr8i5+DkBPkoSoejEM/5jUy7OXAbbqJfEX2oVndVfCr80rSi6s8puNRhyk81
 u/Vk3F3FGl77PQtChuTedrUNhq3jUMHeFzUxz4911NBOfUK4HSBjpmF2xDH5yQqqbQnklc
 IGVPo1EwOMZXBLbpcBYLH4noRqTbJGYXEJGblKJscdV/K4JmYGN0BTA3at+auA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v7 00/48] Unigraf integration
Date: Mon, 23 Feb 2026 13:09:07 +0100
Message-Id: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNzWrDMAwA4FcpPs/Dku042WnvMXrwj5watqQkW
 egoefeJwBZGvYvQ76e7mGkqNIuX011MtJa5jAMX7ukk4sUPPcmSuBao0CqDVn4OpZ98lmVYiJO
 F9yUAJa2VszZZwZfXiXK57eqbKLKXizhz+1LmZZy+9l8r7MOdteCq7AoSpDLGx4SgdUqvYRyX9
 zI8x/FjF1c8FPefglJJ51LU2JFtTXxU9KG0qOuKZiUy0iSbfagp5lcBAFVXDCsqRxcCBAMKHhX
 7ozQKsK0rlpUcMlLXOa+gojSHwqGuNKy02vjcIhKR+6ts2/YNsI+xGR0CAAA=
X-Change-ID: 20250425-unigraf-integration-11ed330755d5
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7671;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mFPJ9jfzijrR7iM5EK0IwEa5sZASRrDrl/8FK/UtJ1k=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENmMiYZtH4Q5JDODborugnV16O7ilbfSh2FR
 DnixDN1SjeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDZhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLq+A//cCseqN5wnLjmtHaOb5B8jfjQuzqY2zY
 a13vrVP0zYqOwOkleywx504FFqtG3QVoxe1lndlp3BavVd3sbTB1yeVqi4f1rBp7DXqw/CpZMjW
 7hsIqQEi0JumglcsyvrZE2g0aABH/e+YPBy2QhKKLj/dV3UjIcCrGL6H8iV8PVbK3rAvllHITZ3
 g6745Vl8YcIjZHIDN0I6KWg2jO3e+Lrfs8662NY4gFHCUlhVxjpe+ogZguNTQJF0nIpU7N0A5U0
 ZMjIpDN8YrFEiUGyettjYLP3PW13YFPWM/sCXh/qLpFazOySxdNyMN7AP1p9TXp7JQRFvPtDCQb
 fpIXwmagRFK18QuThPjtnQzAtc5VO4pbetBdD1dp0XGA2cn2WzxA1pKAHnMCm0m3lS7rjGgM258
 XNIBrgfQuzRjyFie8ySgGjxfDYiZ6ibWYXPyyZPq247qkMikuaj3VnAJ9AhotMjh7VNwgeXJKQc
 AKyUyHnzfKbXAecvE8g1MPOocGEVj0AkGE2z0gecWSWBONQ2anf+SJcRQIWV4aJr0z1vt8orBLr
 805DXDvdg4P4uTUUnebRCp02wXyeboEYliaN2Cvu4NcEplwhKzNal2Z/GqOC7M3P8Z664NNx59G
 BZvtyGFX7UbR/d62HYn2tZwcYCL33kJtwpTEUJ3jS0M38uOJ9fwI=
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
 lib/igt_kms.c                            | 831 ++++++++++++++--------------
 lib/igt_kms.h                            |  41 +-
 lib/igt_pipe_crc.c                       |  35 ++
 lib/meson.build                          |  12 +
 lib/monitor_edids/dp_edids.h             |   3 +
 lib/monitor_edids/hdmi_edids.h           |   3 +
 lib/monitor_edids/monitor_edids_helper.c | 126 +++++
 lib/monitor_edids/monitor_edids_helper.h |  10 +-
 lib/unigraf/TSI.h                        | 228 ++++++++
 lib/unigraf/TSI_types.h                  | 126 +++++
 lib/unigraf/unigraf.c                    | 907 +++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h                    | 105 ++++
 meson.build                              |  14 +
 tests/intel/kms_dp_link_training.c       |  19 +-
 tests/intel/kms_dp_linktrain_fallback.c  |  57 +-
 tests/meson.build                        |   4 +
 tests/unigraf/meson.build                |  13 +
 tests/unigraf/unigraf_connectivity.c     | 135 +++++
 tests/unigraf/unigraf_lt.c               | 183 +++++++
 30 files changed, 3243 insertions(+), 469 deletions(-)
---
base-commit: 4987fcaab16c415042d0969743877a8141625589
change-id: 20250425-unigraf-integration-11ed330755d5

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

