Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DDCCCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD1110E3B9;
	Mon, 10 Nov 2025 13:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ty9L4VNi";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F7510E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 53CBB4E41608;
 Mon, 10 Nov 2025 13:39:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11286606F5;
 Mon, 10 Nov 2025 13:39:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 579AA1037188A; Mon, 10 Nov 2025 14:39:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781973; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=8+H3gLwoBnZifSkGEn43ZUY3++dEB3E0ZWCecAPCfeI=;
 b=ty9L4VNiWBTJIwhdOYurGqj7jzSM1Mo62Ia2hQThAypJChTyaLbJG+b6QT0R/MIDFFlkwM
 ldukXpCn6MLttw4qhAVtkQgr3JiAA3Q21CwE8XsbOKiC64752g60CacMu3/1J5/8iS1hE6
 eoaZX/5ic/B7vzJYb5ngivqorBq8Wsp4suRIv+lZoNUckiiy+MrYF5/H+TJsV50REk4LU9
 caXiXYAsG1UM2gcp7QGEwDzHu9QsRi/AXdnep07WYPsYJwF2ijvT/MsZE3qDy79QLyEXrW
 7CxAUunXS8oCtEOVGz0LGQIzaVoC0us00E30lmb0pPBInzTSZd0WmZ52hZWP0A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v4 00/46] Unigraf integration
Date: Mon, 10 Nov 2025 13:39:02 +0000
Message-Id: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPbqEWkC/3XNSw6CMBAG4KuQrh3Tp0VX3sO4gLbAJNqaUomGc
 HebbkgUd/PP45uZjC6iG8mpmkl0E44YfA5yVxEzNL53gDZnwilXVHIFT499bDpAn1wuUt4Hxpw
 VgmqlrCL58hFdh6+iXghCD4lcc3vAMYX4Lr8mVoaFVUxvshMDBlTKxljOhLD23IaQbuj3JtyLO
 PFV0f8UDhS0tkbwo1O1NL+KWJWai21FZMVk5GBV17TfyrIsH+Dj5EVLAQAA
X-Change-ID: 20250425-unigraf-integration-11ed330755d5
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7263;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=5n3+Vm/sesjpqNCadLRoBtiNqng3dvu7Z1kLN9ess9w=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesLawEhX86MKDUR4ozyWMxK9KCvYhaOr2LgC
 UtIU24wpEKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrCwAKCRAgrS7GWxAs
 4sQmD/9nomjaY8KVsN4zqEbqFKlaVtpG8zzSPmAJ1KdqD/OzNSZW9tnZrHUqMEcu3u3mW74OqrE
 JD9os1Un9+R0JeyqJGviK8i6nzZiCARmBjtbqGZMdS7AysOFbY9cDjtc5ipTwpEPy93O3LYau1I
 M7CGub03hTTb4Cd1rhXXmCzKLFiqj84lSOzqdzRrOFTa5cFLL/USPXGPFHuaEXl4LtMfx0ntMCE
 lQ/f9PIVnICpAqjExr1vXFvvyaaig1HmjoDAMcgY5SeIAL1AeHrTqVvUlQ3mCqwCk4kBv0ARqgF
 3+tFwMsQLIuBYpqdiEDVvh1mVwHKies80OU4eVL89YBMHsOkja4TuKxkbpNqIJ8gPS9wOXZBe39
 NAolvK/0sGKJDLNanJyycwXNN9T0AITc7zBNi1ox3qU7dX4xdEwUm0SuxCkr4k2LijR/yopb1c3
 1GriykZPZ7Ef4mHktJ8ct03qUMlEvpl4/K/0Olf7sJV03E8yxmKwwykYBSbE1KNcyHFS52xC7Fx
 O3Xi7WNFQaMOiGoYnJpbRoGzZ1ARPqtN8WH0vLSotatLj9/1cjyPU1qnUObOsv67kQpA0D7J5jW
 9Sgj0sda1LQgiJ5P6BBNF3XGIZULM4jp362OkIgROxE5mhonkX/eNxwTw4EHBouvutF4cFXS1ec
 1NW0CfvSEy5c/8A==
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
Louis Chauvet (46):
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
      lib/unigraf: Add connector configuration
      tests/unigraf: Add basic unigraf tests
      lib/unigraf: Add unigraf CRC capture
      lib/unigraf: Add configuration for CRC usage
      lib/unigraf: add unigraf_get_connector_by_stream
      lib/unigraf: Add helper to check timings received by unigraf
      lib/igt_pipe_crc: Add ungiraf crc calculation
      lib/unigraf: Add lane count configuration
      docs/unigraf: Add unigraf documentation
      lib/unigraf: Add helpers to set maximum link rate
      lib/i915/dp: Move DP-related function for i915 to proper folder
      lib/i915/dp: Rename functions to avoid confusion
      lib/i915/dp: Add helper to get maximum supported rate
      lib/igt_dp: Create generic helpers for DP information
      lib/igt_kms: Add asserts to avoid null pointer dereference
      lib/igt_kms: Add helper to get a pipe from an output
      lib/unigraf: Add helpers to get the current LT status
      tests/unigraf/unigraf_lt: Add test for link training

 docs/unigraf.txt                         |  81 +++
 lib/i915/i915_dp.c                       | 354 +++++++++++++
 lib/i915/i915_dp.h                       |  23 +
 lib/igt_amd.c                            |   2 +-
 lib/igt_amd.h                            |   2 +-
 lib/igt_core.c                           |   4 +
 lib/igt_debugfs.c                        |  96 +++-
 lib/igt_debugfs.h                        |  15 +-
 lib/igt_dp.c                             | 101 ++++
 lib/igt_dp.h                             |  89 ++++
 lib/igt_kms.c                            | 825 ++++++++++++++++---------------
 lib/igt_kms.h                            |  58 ++-
 lib/igt_pipe_crc.c                       |  28 ++
 lib/meson.build                          |  12 +
 lib/monitor_edids/dp_edids.h             |   3 +
 lib/monitor_edids/hdmi_edids.h           |   3 +
 lib/monitor_edids/monitor_edids_helper.c | 126 +++++
 lib/monitor_edids/monitor_edids_helper.h |  10 +-
 lib/unigraf/TSI.h                        | 226 +++++++++
 lib/unigraf/TSI_types.h                  | 117 +++++
 lib/unigraf/unigraf.c                    | 758 ++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h                    | 257 ++++++++++
 meson.build                              |  14 +
 tests/intel/kms_dp_link_training.c       |  19 +-
 tests/intel/kms_dp_linktrain_fallback.c  |  57 +--
 tests/meson.build                        |   4 +
 tests/unigraf/meson.build                |  13 +
 tests/unigraf/unigraf_connectivity.c     | 123 +++++
 tests/unigraf/unigraf_lt.c               | 178 +++++++
 29 files changed, 3130 insertions(+), 468 deletions(-)
---
base-commit: bfab3ea5fab190f4ebf083db4dfe703f6d4f40c6
change-id: 20250425-unigraf-integration-11ed330755d5

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

