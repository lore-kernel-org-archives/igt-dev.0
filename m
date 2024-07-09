Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C688DC3DA41
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6955B10E5A7;
	Tue,  9 Jul 2024 15:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fb+v27dd";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5D510E5AE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 538BE20005;
 Tue,  9 Jul 2024 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I/4yx7VgLnepYCJ35U3YFLIvqUjVci/AWz6KOjIZHcc=;
 b=fb+v27dd0Wh8PIws/fHDvlbq20XMXHX1XtSsBqmkPrcNlfJeqTyhdoClR6L5MGclBiaj5E
 FsLVD34tTrOXfLfGfmkiQtqlcnEA1SqD3azzFx0VzdfBMOg0ISSf28f5sKXEFvOsr9UpaM
 IcNxTt1+o9R1SHn/P47fxZIxeVfYrv4ea0V7ehOb+vLjZUjrV/NK1HJkEp7bBRO9qkc7d+
 afuTxmjX7Z/yOM7V0AYtDXmlGePyHQjtL2ARMVbA7vUYzET7Dmk6foQ4Rh+dvEE+IcLHS5
 EOCFETB+JE65ijCU6jkwMVThWKupENRitMLWQEaTtDxfLP5lrLI1ra93uW4MYg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v2 00/39] tests/chamelium: Integrate the chamelium v3
Date: Tue, 09 Jul 2024 17:34:16 +0200
Message-Id: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhYjWYC/3WNzQ6DIBCEX8XsudsgFfpz6ns0HkAX3aSKAULaG
 N+9hHuP30zmmx0iBaYIj2aHQJkj+7WAPDUwzGadCHksDFLITigpcaSMgRafCWMyiQfcfEgR75e
 bdM5a13YaynoL5PhTzS9gnDBBX+KZY/LhW/9yW8uq1kL9VecWBWqtnFT2arrRPq336c3refAL9
 Mdx/ACRPJwYxwAAAA==
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7262;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=B3eECCix2qrqZfTYkSzwuOuG4yioXRdzswywCnh9EhM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViRGyQfQvCxUWaMKCVAHHOr52Jy5GsRZLDBA
 /i5xkBtmvGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YkQAKCRAgrS7GWxAs
 4i3OEACnbXt32MsqviBCbvtAKOh5dryO9n0Y7M6teTtl+EOoTkrU/kojOM5yqQn4K5OsPkWvZ1E
 VXaNZOIR84JRFajWFyEqZA5t+Lpdx5reGWWaS0UNlIQOJQTNekBGx9xGVPzeLNFRjrKPUluZWv+
 v/J6t09GdPAUH2V/0xL3K2Yig3d8NRnybS3NcBZutFy7Kn4USRcG3XAdbCc4+whL8MBBvjY+MSr
 m0qhExdjpRN/rmh1NZ49MD2iuyWFt0+LPgl+Xj61dtm6/XSmT484z0vMv14Bd/k287pCqy/Aiyy
 +Qtnaj+na9hyfDQmGe9JcBfXKRsoGXjcRBwmM9slmztazuRpcuz1xk1nzBcyMpplxbbh2VqVzK+
 B9n6joVuxZri9SRXm4mn+7ZKCzrbAHY/JGKDnk0zkffuWUdLLVtge0AGj2Lp5jALiLVswC9k3tS
 mPiadAV3/dfFhdJbmIErTTwlNi4xcLPhltkFYxjBRfZaHbhNoCfqgmUApZ8EsPRbpv+vcEFOUOs
 czpv1HEqWhBTa0l/iFEZMQq+2SznHSlbbIKKazN2BmR6rQ5+qD+ADNlytLd7jGRpKhThiBsjVqR
 gFd55vBm841p9vF1cI9ohxaTIcotwep6NygGCjJbck68idErOXG+47WKkmvmPqy7UUPivSY+02Z
 iQZtLvQa4kbg5SA==
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

I will use this work to create many new tests (that will come in future
series):
- MST managment
- Tiled displays emulation
- Suspend/Resume
- Hardware overlay planes

This series can be divided in multiple parts:
 - PATCH 1-5: Adding few helpers to igt_kms
 - PATCH 6-10: Add few helpers to minotor_edid
 - PATCH 10-14: Split chamelium v2 and chamelium v3 support
 - PATCH 15-18: Create a basic test listing available port on the
   chamelium
 - PATCH 19-27: Add port mapping configuration and autodetection
 - PATCH 28-38: Add basic EDID tests
 - PATCH 39: Add documentation

As most of the series is preparation work, I sent all the patches today,
but if required I can split the series in multiple smallest series.

---
Changes in v2:
- Mainly splitting and cleaning work since the RFC,
EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com

---
Louis Chauvet (39):
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
      lib/chamelium/v2: Modify build options to separate Chamelium v2 and v3
      lib/chamelium/v3: Introduce the foundation for the Chamelium v3 wrapper
      lib/chamelium/v3: Introduce initialization and cleanup of Chamelium-related structures
      lib/chamelium/v3: Add method to discover Chamelium ports
      lib/chamelium/v3: Implement method to retrieve Chamelium port names
      tests/chamelium/v3: Implement a basic Chamelium v3 accessibility test
      lib/chamelium/v3: Implement Chamelium reinitialization via Reset RPC call
      lib/chamelium/v3: Implement methods for plugging Chamelium ports
      lib/chamelium/v3: Implement methods for managing Chamelium EDID
      lib/chamelium/v3: Implement Chamelium configuration parsing
      lib/chamelium/v3: Log port mapping for debugging purposes
      lib/chamelium/v3: Introduce new configuration format for MST support
      lib/chamelium/v3: Provide access to port_mapping via method call
      lib/chamelium/v3: Implement helper function to get port mapping from Chameleon port id
      lib/chamelium/v3: Implement helper function to retrieve connector from port mapping
      lib/chamelium/v3: Plug specific ports for all tests
      lib/chamelium/v3: Implement Chamelium port autodetection algorithm
      lib/chamelium/v3: Add save option to avoid doing autodetection every time
      tests/chamelium/v3: Implement basic EDID handling test
      tests/chamelium/v3: Implement 4K EDID stress test
      tests/chamelium/v3: Implement non-4K EDID stress test
      lib/chamelium/v3: Implement method to discover video signal status
      tests/chamelium/v3: Implement test for DRM device resolution
      lib/chamelium/v3: Implement hot plug toggle scheduling method
      tests/chamelium/v3: Add test for display change detection during sleep
      tests/chamelium/v3: Add MST EDID reading test
      docs: Add Chamelium v3

 docs/chamelium.txt                              |   90 +-
 docs/testplan/meson.build                       |    4 +-
 lib/{ => chamelium/v2}/igt_chamelium.c          |    2 +-
 lib/{ => chamelium/v2}/igt_chamelium.h          |    0
 lib/{ => chamelium/v2}/igt_chamelium_stream.c   |    2 +-
 lib/{ => chamelium/v2}/igt_chamelium_stream.h   |    0
 lib/chamelium/v3/igt_chamelium.c                | 1191 +++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h                |   89 ++
 lib/igt.h                                       |    6 +-
 lib/igt_core.c                                  |    3 +
 lib/igt_kms.c                                   |  287 +++++-
 lib/igt_kms.h                                   |   17 +
 lib/meson.build                                 |   16 +-
 lib/monitor_edids/dp_edids.h                    |    3 +
 lib/monitor_edids/hdmi_edids.h                  |   27 +-
 lib/monitor_edids/monitor_edids_helper.c        |   92 +-
 lib/monitor_edids/monitor_edids_helper.h        |   10 +-
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
 tests/chamelium/v3/kms_chamelium_v3_edid.c      |  419 ++++++++
 tests/kms_color_helper.h                        |    2 +-
 tests/kms_feature_discovery.c                   |    6 +-
 tests/kms_tiled_display.c                       |    6 +-
 tests/meson.build                               |   45 +-
 33 files changed, 2348 insertions(+), 62 deletions(-)
---
base-commit: 9683de1314f7fb9204fc4d8baf193a52adda9b59
change-id: 20240522-dev-remove-static-ports-9382ffbbf146

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

