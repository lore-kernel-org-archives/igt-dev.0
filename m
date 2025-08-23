Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F84CA0EFC
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEC710E30D;
	Sat, 23 Aug 2025 02:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bCsHSL5Q";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA4F10E191
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7FA6D4E40BFB
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:11:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3CED9606A7;
 Sat, 23 Aug 2025 02:11:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC2551C22D34F; 
 Sat, 23 Aug 2025 04:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=BAjUHwVtr8fDyzcd1blem8m2I+GIYMshJ24PJFLtPzg=;
 b=bCsHSL5Qgcb8aas5Vy635Nz5d+juwL49YOLo7CpDOTPtWqqO6AY0xQHBAYaCSAJ0KxfyGt
 f6n7vkz/AXDsnqDdazSdDBcO3dn6JlCQSbQ/k4eRTrjMkrg2wCHVv0VeFB09dlma9iXD9r
 CeH43Qvfr29wFUmG53xAZ5BgbrZytjIogsfN9vpXUvriYOl1aVF6FiJtLQccHkP7aunLTC
 PE0QRoMdAFd0REHVOBt2kDGXcic/pBbMz946pXZ9ouv65tZhVbmrXZE2kiO/FgQAwDDR/T
 J3uZQwXTJtczWo2w8hr6JV6V7B6IphQrNEigM0ONgyAmc/BlPw+2R8wYGrOV/g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v3 00/29] Unigraf integration
Date: Sat, 23 Aug 2025 04:11:20 +0200
Message-Id: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgjqWgC/3XNSw7CIBAG4Ks0s3YMjxLUlfcwLirQdhIFA0g0T
 e8uYWNMdDf/PL5ZILlILsGhWyC6QomCr0FuOjDz4CeHZGsGwYRivVD48DTFYUTy2dUi133k3Fk
 pmVbKKqiX9+hGejb1BIQTZjjX9kwph/hqvwpvw8Yqrn+yhSNH1veDsYJLae3xEkK+kt+acGtiE
 R9F/1MEMtTaGin2Tu16862s6/oGnHjJ3AUBAAA=
X-Change-ID: 20250425-unigraf-integration-11ed330755d5
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5466;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=45sRQZgkf8xZUZp56pBKJ8lWIGMFaWCYikd/+E6/HTs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNROmoOe8ee1iOudy0fqecIgzV7rYVxxBbGI
 jrBjNanMwaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjUQAKCRAgrS7GWxAs
 4hCNEACSa39c2QK3HG3CQ1y51xX+yiFEZjc049FONUWarJ3RoVMUTKPFfDx2QWCs9fz6VF1QARC
 IqhrKrV8s5Duh+S75B4hcb+99dEZ5r9+lo7NbFrRlVrLd5pywcXPDxUSO2jUSKSSufuSTyaydMZ
 fYEB/8R7uPsO/dPe3ObaOogT+Zffh6lKNMXY1a84BX8FGyV7stcH6QrEkEWlqrOZ+vpMoE6sMZv
 np9XUBigxasYWOEewkq+of8lu4QbB3g21JFvbaZoNl09jaxahEmFl9kFMJs4OyJ0j9MkjyNTTe0
 fBU4Hm6IqrgGRvGY8k4xJeW567dWiqnXZGfgCQrikPJ6NQHwB+lc8m6Wh/A6XfH2PzD+0+zPve5
 jFdpdZq9/d/vcs7cgXWLuzKBZ5S6o0sLBnMhnKPhN6mENFEfPQwn2liIhKkEaPbk8xmyS4M1rWq
 9J7oGW9biSOuARqCEnVEshz6i48GWXpQAKHz8XR+WmxPIBUnfgTKvqFWPXfX1vclIO1HuwOODke
 BRRdEoivkgBnDLQayNFq8e5hc6D+WPnSV+9ctCSkuhxqiSsIP7josKgEhsJR04L+nGnJMrzEU7t
 F5rpxmFiEOGw5i2Ep21L8Gb3ZWGHpHVJeMAgsWsh/CcYyjOvDBo+OvOgK6D/Gc2iCHq2POOvy/a
 Xe5x+BJg0ddM7eg==
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
RFC, I have not used the official TSI_types.h header because it was
incompatible with C, so I hardcoded some necessary values. The next
iteration will use the official TSI_types.h (they plan to fix it for the
next release).

This RFC is intentionally concise to gather initial feedback from the
community regarding the integration of a proprietary device into the test
suite. I plan to expand on this work by adding more features and pushing
the developments upstream.

I have also started to work on MST testing (hotplug, link training, 
bandwith limitation), but I have a big issue: connector detection is very 
strange when changing MST configurat (MST->SST, sink count...).

If I use the Unigraf GUI or my own C script outside IGT, everything seems 
fine: `watch -n0 modetest -c` update connector status almost immediatly 
after a HDP pulse, never hang and always have the correct result.

But if I do the same in IGT (same script in igt_main), igt have too 
much/not all connectors, and some of them are broken (no EDID property 
for example). I tried to run `watch -n0 modetest -c` in parallel, but 
modetest can:
- hang
- only update once igt test is finished.

Do you have any hint about something I missed in IGT to properly enumerate 
connectors? I tried close/open the DRM device, added a lot of delay 
everywhere, emulate plug/unplug... I used kms_wait_for_new_connectors (in 
this series) and for_each_connected_output to get list the connectors.

Looking forward to your thoughts and suggestions!

Thanks,
Louis Chauvet

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
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
Louis Chauvet (29):
      lib/igt_kms: Add a detect timeout value
      lib/igt_kms: Add helper to wait for a specific status on a connector
      lib/igt_kms: Add function to list connected connectors
      lib/igt_kms: Add helper to obtain a connector by its name or MST path
      lib/igt_kms: Add helper to wait for new connectors
      lib/igt_kms: Add helper to get a pipe from a connector
      lib/monitor_edids: Add helper functions for using monitor_edid objects
      lib/monitor_edids: Add helper to get an EDID by its name
      lib/monitor_edids: Add helper to print all available EDID names
      [DO NOT MERGE] lib/unigraf: Add used defines for TSI_Types
      lib/unigraf: Add TSI.h
      lib/unigraf: Initial Unigraf support
      lib/igt_kms: Automatically connect unigraf on display require
      lib/unigraf: Introduce device configuration
      lib/unigraf: Introduce role configuration
      lib/unigraf: Introduce input configuration
      lib/unigraf: Add unigraf assert and deassert helpers
      lib/unigraf: Add plug/unplug helpers
      lib/unigraf: Allows sst/mst configuration
      lib/unigraf: Add helpers to read and write edid
      lib/unigraf: Add connector configuration
      lib/unigraf: Add connector autodetection
      lib/unigraf: Add edid configuration
      tests/unigraf: Add basic unigraf tests
      lib/unigraf: Add unigraf CRC capture
      lib/unigraf: Add configuration for CRC usage
      lib/unigraf: add unigraf_get_connector_by_stream
      lib/igt_pipe_crc: Add ungiraf crc calculation
      docs/unigraf: Add unigraf documentation

 docs/unigraf.txt                         |  81 ++++
 lib/igt_core.c                           |   4 +
 lib/igt_kms.c                            | 381 +++++++++++++++++++
 lib/igt_kms.h                            |  31 ++
 lib/igt_pipe_crc.c                       |  27 ++
 lib/meson.build                          |  10 +
 lib/monitor_edids/dp_edids.h             |   3 +
 lib/monitor_edids/hdmi_edids.h           |   3 +
 lib/monitor_edids/monitor_edids_helper.c | 126 ++++++
 lib/monitor_edids/monitor_edids_helper.h |  10 +-
 lib/unigraf/TSI.h                        | 226 +++++++++++
 lib/unigraf/TSI_types.h                  |  50 +++
 lib/unigraf/unigraf.c                    | 631 +++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h                    | 182 +++++++++
 meson.build                              |  14 +
 tests/meson.build                        |   4 +
 tests/unigraf/meson.build                |  12 +
 tests/unigraf/unigraf_connectivity.c     | 123 ++++++
 18 files changed, 1917 insertions(+), 1 deletion(-)
---
base-commit: 131624097de9acfac3466e51198beb176d572f9f
change-id: 20250425-unigraf-integration-11ed330755d5

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

