Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFAED25B5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD1910E119;
	Wed, 28 Jan 2026 13:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jN1SkMVU";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF31610E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 57D4A1A2AC0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 24A736071F;
 Wed, 28 Jan 2026 13:14:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6025A119A8801; Wed, 28 Jan 2026 14:14:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=tGOY7A0J4+I2Ttw6TM2RcNotJMFl/Uporgde7O4L0+A=;
 b=jN1SkMVUjDMUakUXPtv5H8hzXiCXCO6jyNG0KA6X/R18NCt7zhNk6co540N3qK+SHPb6gi
 UY735w+CfiTFyLpIYon5+BGvmia6a2XdIAF6CPWDhICpjj5YtVZRFu+vij2lgyjMl48C+G
 rMb7jeT1QyWpcJkinKUopG8UA5/v8yXpwtDtOWZVrU0tcrogjI/je8LD92SgDlUnAJ6AOi
 L7uad295eCDGsUSeM6ta0ISvxU7HKu7HTrteaJfCJSGzjWR0xsyEiVB/s74i+TzA2C6+fZ
 JcHXi3a67syhOwIOd9VBGaigODkaxPfzW1DZol+ubIF+wedQChrFOqN+9taaCw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v5 00/48] Unigraf integration
Date: Wed, 28 Jan 2026 14:14:31 +0100
Message-Id: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNSW7DMAwF0KsEWpeFqKFKs8o9iiyswQ6BVgpk1
 UgR+O4ltGgQxN3xc3i8iTlVSrM47G6ipoVmKpmDfdmJcB7ylIAiZ6GkstIoC9+ZpjqMQLklLhr
 vA2KKWktnbbSCLy81jXTt6ocgmKCJE7fPNLdSf/qvBfuwsxbdJrsgIEhjhhAVah3j0ZfSPim/h
 vLVxUXdFfefokCCczFo9Z7s3oRnRd+VvdLbimYlMPIW7Tj4LcX8KYgotxXDihyD8x69QYmPyrq
 uv9BM1r6RAQAA
X-Change-ID: 20250425-unigraf-integration-11ed330755d5
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7246;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Dju8v90vgu/DalHIlCilYdsfzqLSnrC4D1/Dx8iT3uc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvHYtONR/b+GOdcfiIMpxlROGgu9z4unQ5Gs
 t2kW9PMZcCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLxxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKkfhAAmCDM41j0JrerFQj9wO4J+CXWYIR+Fvh
 U2qFtoUZeHGIOS8gMoO2F+CxCEUGLZQ6LNtejv47xyfEBjCz/wrD9imkSmCKQby+UjljJW/DwgZ
 xdcngj9DQRawdm1CmJxW8NTZmxi0XY2MtbRsyR2xro4piz4ID2FEscAsHWgToaNpcT7l6n0dM2e
 0ULPXFVx4c/KtcZDFV5VyTPz71IGeZfXEBfwDBNJRf4of/k3rJwDsFVK/h5AtLhJN6qrEb8QTTY
 sNQGMcP9tMqEkxot0uc469r+kiJo4WV16Ux/+og2TY2BxEIqVa2hOoKq7tCL8YDFOaqo5Xx4YgQ
 pOTdz3o9ExLMfIgfnY73wZ/eVdadgAOmFs7b6FGNVA1NE92RVTt+LDWZerjvjqMN6NVOjZtWxf9
 8by5q1JPbTZDfWmopYOerdbwrW6qlfXy55VZmtddYLo/Uhw9st3KE2audEHzvVFmAhJtN/HDEPF
 bv6bMlbKD5PWW2+J/WbTJ5RFsZXzh/3PaIsF36VP3SXQCVaj2g6Kg+hZn0f47qSHB3AnLsItgTf
 l1EC9TLNVU3jpfNreHBKNbnB/woDgbK5JOb8X5illHHARGzu+fE0poG2h+wlZxoB3XaOQTDG3zk
 tTW96ABNcF497aSO54haaw67kjrjMKJ06sNbEIZ5/u88Oq3CR0Ks=
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
base-commit: 33d772ed2d772fee329e6200cd968962f695a927
change-id: 20250425-unigraf-integration-11ed330755d5

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

