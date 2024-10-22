Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87915D2CDFA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 16:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D9A10E6C6;
	Tue, 22 Oct 2024 16:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pZ/Nr28h";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4613F10E6C7
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 16:31:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFF82E0006;
 Tue, 22 Oct 2024 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729614717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L9C/IaV3OA6OeWGxFtQZnrPsVtGyLDdRD9bZh5vB8IM=;
 b=pZ/Nr28hYxxbb2vbF/JJOKSU0KnaEM9vaUOcFB9OeEJbvZOFR3rR8i3S52dvZklJHlCqnx
 XZjvJMfmd28J0C3wMNJtDyfAEz7y5yu7dwUCCrMQdhu/F3cG7jk2t3mJgvexcZk1UT1v2x
 6g4J66TqO/92FWR2NP2B8ds4vk2s+a4iHUXBcQ1rZm2Seqlyk9xUF9uuurPLKvlbV/5T8C
 RpNwblpVQsFIv4oCDS1HPlJn2uDNoBjazR4gwTErznGKzmEFpbTL/VZye9rH92TmordT2w
 Zm+uhS9xi3UK3J7i5SJsyEMsJHJgx8BT5U1tqrbUy0M6S/9jOEHo/BiYxfODpA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v3 0/5] tests/chamelium: Integrate the chamelium v3
Date: Tue, 22 Oct 2024 18:31:49 +0200
Message-Id: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHXTF2cC/5WQwW7DIAyGXyXiPG+BBBJ62ntMOwRiUmtNyIChT
 VXffTStNHVSNe2EjOXvt78jixgII9tVRxYwUyS/lKJ5qJjdD8uEQGOpmahFW0shYMQMAWefEWI
 aEllYfUgRdNML54xxvFWsTK8BHX1u5BdGMEFir+V7TzH58LXlZb41N7Sq5V105lCDUtIJabqhH
 c2z8T4daHm0ft6oWfyQulrfJ4lCksPorNK97Lr+lnS67B3w/aOISNflzRARSn+mtKt8oImWp3m
 ICcP5zhljHDZNu+qcz+siybRgcwM1B5oSvM3X5N4p2SrdGsmbm+S/OAJmv1ARBzjSeKV1qmm7X
 lnBUf2L1pRHQFwPlC5uteus7aXmzulfRk7f4jd2pSICAAA=
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com, 
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com, 
 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4446;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cmQmyx4vS0Eg3HVRJQiInD2vUW6n58ZvGY/Z1SHco1w=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF9N6HVhY7uw/zF6dzIib+g4LOk33kDfH4cG/j
 7ONmK3RcNyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxfTegAKCRAgrS7GWxAs
 4o/fEACcOe//83hSA/YDq1VhwEivOIJDNgNWm61aGKJoPietCP76hrzjIHutIsOoLYl4XbM1DQK
 e3i/taz/IAewuLG2Fw6enl7y1t04lim56pJc3ABCbbA/jD0JVyyU2tz1c/TkfQ4laKVZZWtmG8m
 zd2Ni7dZxKZgx/M3NawJW+k99hvXnQWfWNOsatw0dCBG1NGz2c59kZ6jOVsz2NIic7fBLYM9n4D
 XxYT7b6E499bVcXR/0j1p/DEj/leZm3ZIbYr0n08aodyq1q1gym0pEfBoqY9XNcgnD/uP+gNGyB
 MoUyIL2/J9f7WUhmH8JpiHfrs9cSOkbTJ9J0SVUfwJqRz1x+zDKMVe02GkvYLLtAdMrhtVkkjjk
 oNJ65lYuExxAXI+jguLyHEdaQolj97CqtfFgVXan5mm98wKmbqP2yIDVUfiOK+FyPxKXCdHZFAN
 7nrGe0l9oEtLrP2HoK7duwEvLqg8WHFNptNhDIWoqntkjtMQl9V1TrnK32jXAM7iAo4tg/RyJOv
 2aS6aavni7Fk+YxPwc5i700ef8QCZs3bfiOXBOiXJIIcTaDO32dzLAulb2K2ZTyDSKDDn8JLEKM
 onPHOuM2L+lG00EYrprDq14XaNRdVASM2rmZv4Za/a9LTjR8peiyQwUHUscgCTYJ16/vHH6nZeZ
 OjotMHARJlq8ufw==
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

This series depends on:
-https://lore.kernel.org/igt-dev/20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
-https://lore.kernel.org/igt-dev/20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com
-https://lore.kernel.org/igt-dev/20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com

In addition, I will send more series to:
- add more methods to the chamelium wrapper
- add new options in the configuration file to configure the chamelium
- add tests for the cv3

---
Changes in v3:
- Rebased and splitted the series
- Fixed few build issues
- Link to v2: https://lore.kernel.org/r/20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com

Changes in v2:
- Mainly splitting and cleaning work since the RFC,
- Link to v1: https://lore.kernel.org/r/20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com

---
Louis Chauvet (5):
      lib/chamelium/v3: Introduce the foundation for the Chamelium v3 wrapper
      lib/chamelium/v3: Introduce initialization and cleanup of Chamelium-related structures
      lib/chamelium/v3: Add method to discover Chamelium ports
      lib/chamelium/v3: Implement method to retrieve Chamelium port names
      tests/chamelium/v3: Implement a basic Chamelium v3 accessibility test

 lib/chamelium/v3/igt_chamelium.c            | 309 ++++++++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h            |  52 +++++
 lib/igt_kms.c                               |   8 +
 lib/meson.build                             |  12 +-
 lib/tests/meson.build                       |   4 +
 meson.build                                 |  15 +-
 meson_options.txt                           |   4 +
 tests/chamelium/v3/kms_chamelium_v3_basic.c |  30 +++
 tests/meson.build                           |  26 +++
 9 files changed, 458 insertions(+), 2 deletions(-)
---
base-commit: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4
change-id: 20240522-dev-remove-static-ports-9382ffbbf146
prerequisite-message-id: 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
prerequisite-patch-id: 0562bbe57a0b489e7f46a51717c54ea26296cb8c
prerequisite-patch-id: a16d6fdd238eab5a91630d0934c9186669406fc7
prerequisite-patch-id: c7fcc64d709f283da748a0f9bbe3bd6143d76300
prerequisite-patch-id: 09fc5e2f569fa8287e767ceb353bc0a0f94ae2e1
prerequisite-patch-id: 63cf2f6323333bb8cbd0dbbd883b5c9fe373dea1
prerequisite-message-id: 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com
prerequisite-patch-id: 90ffdddeda6dd4cd2ae64e60fb31b0bbfee0250f
prerequisite-patch-id: d62e9d4981a68ac6e71544ab2a3dfec37dfa3299
prerequisite-patch-id: 3d898f58702cc303e18d3afc487e46f68641989b
prerequisite-patch-id: 57f5446073d42a01c29e6ff8a24f6609eedb49a1
prerequisite-patch-id: e6d6ee4ecd0e738a60091b19449c8622bb8bb6ae
prerequisite-message-id: 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com
prerequisite-patch-id: 4ac6bf11d25e80e99d5607d4864c3c7b4273dde3
prerequisite-patch-id: 2246b4289eca0b8e8b02519051af7564b0875a2a
prerequisite-patch-id: 394057bc39308265a03e026ac924f88d3d933d49
prerequisite-patch-id: ad1f0838e81fa620013313316afd35a3d5c146fa

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

