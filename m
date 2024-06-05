Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1E5C27C5E
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8463710E694;
	Wed,  5 Jun 2024 14:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Wt+BaAbt";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C8810E2B0
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F088440008;
 Wed,  5 Jun 2024 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=el+l/VRtpiKbhlfEIJrf7NEa2n5V0beBj0L34CtlIsY=;
 b=Wt+BaAbtP/B0B5aUVc8iGwuml99eTmuxQNhAAb0l3FHzDtEmb78nXAbRD6AfW00qlDd1WO
 sU2JaMfI0Vqvmx5TF9Gkj7CVEEBiVmbQRBJtghuQ7K1Ghu/78UZPh5TCByxf4pFr535Kej
 leU6RmGPr0BD+H9MrUBpWuT1RQo0hm3aFds9Umw7Pnvucc5YDslEGcanaaFIRv6VTl8sAx
 2xL3s7ogkR9HrCrHWJJpxL+DY6jFqyatkzyBfsTIAmmD6CqeuhopHhA8awoOVd8c3Hbvhj
 qYP5ivJ4hyegNEDUY7Juj6qjGTnTEcA/reK4lnx6mAjC5Poc1FpRn+dW5WUkjQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t RFC 00/13] tests/chamelium: Integrate the chamelium
 v3
Date: Wed, 05 Jun 2024 16:30:12 +0200
Message-Id: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHR2YGYC/x2MywqDQAwAf0VybkBTFeu10A/otfTgI2tz0JVkW
 Qriv7t6nIGZDYxV2KDNNlCOYuKXBMUtg+HXLROjjImBcirzighHjqg8+8hooQsy4Oo1GD7uDTn
 X964oa0j1quzkf50/IDhhOO379YTvvh9If3BPdwAAAA==
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4525;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=YIrluNZPAhx+2trj+i45LJjZiKziDetf7/AEr+CN54s=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ2zJb0JhJb502c+iOW7d5WKcDX3JkZOBYht
 HzwgexslueJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2dgAKCRAgrS7GWxAs
 4lz+EACYVWLDQdqvrFRDwk9i1C1wUtwm4yDdE+H0tB+cZssWVnSL4JNcy1IhuZPpDiAYgf/iyMS
 LTW3JL/gPwpFsVAyq88yqdVMzRaEvAwwD5HbeFcftpZna8+FVBtcxzfaamsDbZe6Y9Af/2fHRM0
 MxcLatthT2yC3HJ1FXqk12ACTldxFkVzoOszx3x0cG0kTrSXpopKRWv/2qc02phyKiKLa35WyFV
 MqLI/EmLjc9unj6I2XITEywqURWLihjI6J1VqpM0R/3jR/r6/7AiXIX+vkoFVP6d1a9TKBvmd33
 c0VLN20c3d9p7IDvljxLwpcrW7GmW3vAt5Dr77PCEbehAE97dBw8MG7ans0owSB6LXJ34eLuqJT
 vHPshAWGAIgrd8ITyuWp+PXfSwoHO81lpAmecGyB7sR7e/VCkErI+UhBPU9/RFkTGkhRIDIy0P6
 Kuk6IUIcLKYaLGs+suFCT433rfqBwPwEG6v2h96oBVujIvd9hCS4x29vpiNQBE/2LNbfJVNDH9+
 qdQCSfyGWnsqgJzLGYVvGbVng0DcBBlzryKKeaLsDkTWO0tlrV4Z97nLNPbNzTrUdFXtzxSmBid
 yqxB/CfGec9RCMb/rIOQkCczy1/K0T6OWxssX0OXyaD1/YVo8RYNzUUUsoqATrIPejGSzosJOwA
 XZygnLsnni8/AQg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Hi all,

This patch series introduces a new wrapper for the Chameleon v3 board, a
testing tool used primarily for Chromebooks, but also by community members
to increase test coverage of graphic devices. The Chameleon v3 is an
upgrade from its predecessor, with the ability to emulate 2 HDMI and 2
DisplayPort devices, including MST devices.

The board can read and analyze any stream on the DisplayPort and HDMI
cables, and even take captures, making it an ideal tool for testing
hardware, driver, and user space behavior in specific situations, such as
screen hotplugging and multiple MST screens. However, the changes between
the v2 and v3, such as the addition of MST support and the removal of CRC
for screen captures, would require significant modifications to the
existing tests and wrappers.

To avoid this complexity and ensure that the Chameleon v3 is fully
supported and the v2 is not broken, I wrote a new wrapper with
simplicity and ease of use in mind. The Chameleon v3 wrapper should only
manage the Chameleon itself, without the need for DRM displays, EDID
caching/modifications, or state machines. This approach will make it
easier for developers to use the Chameleon v3 and contribute to its
development.

In this RFC, I did not merged the common code between the v2 and v3, but
it is planned for the next version.

Before I continue working on this series, I want to make sure that it
is up to the standard of the project and that I am heading in the right
direction.

This series can be splitted in three parts:
 - PATCH 1-3: extracting the v2 wrapper and tests in its own directory
 - PATCH 4-6: Introducing the RPC wrapper
 - PATCH 6-12: Introduce few tests on EDID and MST

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

---
Louis Chauvet (13):
      tests/chamelium: Extract chamelium v2 tests into its own directory
      lib/chamelium: Extract chamelium v2 wrapper into its own directory
      lib/chamelium: Change build options to split chamelium v2 and v3
      lib/chamelium: Introduce the foundation for the chamelium v3 library
      lib/chamelium: Implement all RPC calls for the chamelium v3
      lib/chamelium: Introduce a simple chamelium v3 test
      tests/chamelium: Introduce basic edid test
      lib/monitor_edids: Introduce helpers to get EDID from a monitor EDID
      tests/chamelium: Introduce 4k stress edid
      tests/chamelium: Introduce non-4k stress edid
      tests/chamelium: Introduce test resolution
      tests/chamelium: Introduce test sleep
      tests/chamelium: Add MST test

 docs/testplan/meson.build                       |    4 +-
 lib/{ => chamelium/v2}/igt_chamelium.c          |    2 +-
 lib/{ => chamelium/v2}/igt_chamelium.h          |    0
 lib/{ => chamelium/v2}/igt_chamelium_stream.c   |    2 +-
 lib/{ => chamelium/v2}/igt_chamelium_stream.h   |    0
 lib/chamelium/v3/igt_chamelium.c                | 1026 +++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h                |  120 +++
 lib/igt.h                                       |    6 +-
 lib/igt_kms.c                                   |   14 +-
 lib/meson.build                                 |   16 +-
 lib/monitor_edids/monitor_edids_helper.c        |   61 +-
 lib/monitor_edids/monitor_edids_helper.h        |    6 +-
 lib/tests/meson.build                           |    8 +-
 meson.build                                     |   45 +-
 meson_options.txt                               |    8 +-
 tests/chamelium/{ => v2}/kms_chamelium_audio.c  |    0
 tests/chamelium/{ => v2}/kms_chamelium_color.c  |    0
 tests/chamelium/{ => v2}/kms_chamelium_edid.c   |    2 +-
 tests/chamelium/{ => v2}/kms_chamelium_frames.c |    0
 tests/chamelium/{ => v2}/kms_chamelium_helper.c |    0
 tests/chamelium/{ => v2}/kms_chamelium_helper.h |    0
 tests/chamelium/{ => v2}/kms_chamelium_hpd.c    |    0
 tests/chamelium/v3/kms_chamelium_v3_basic.c     |   30 +
 tests/chamelium/v3/kms_chamelium_v3_edid.c      |  419 +++++++++
 tests/kms_color_helper.h                        |    2 +-
 tests/kms_feature_discovery.c                   |    6 +-
 tests/kms_tiled_display.c                       |    6 +-
 tests/meson.build                               |   61 +-
 28 files changed, 1785 insertions(+), 59 deletions(-)
---
base-commit: cea4eb0dae57dae8c21782c64ad8174c39d1df38
change-id: 20240522-dev-remove-static-ports-9382ffbbf146

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

