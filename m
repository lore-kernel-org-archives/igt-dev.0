Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E36C54E5C
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C101113391;
	Wed,  6 Mar 2024 17:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Y7KmmkpJ";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6EC113392
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 17:28:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CF58E0003;
 Wed,  6 Mar 2024 17:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EA/SFOsDoIpgoUhS09HUS/LBW+Pa0vvb8KkvOKh4u8Q=;
 b=Y7KmmkpJazELSrZFOwiPnKS12ad+TFBr39cQCM3LzrdmVcMcyy+3pFhkj59+t7nHjOfwEo
 VyZDmR8cn7MSgp2kPEnpIBh5quplxC6hdGeiDbMpkCgX5NkQ1baUB2S6pERmzcodazySqv
 U5/iEGzztVOa+nitdfmkn4td7047sTtEU21uefBGzpR8tjQfioCGU0J0oUtyk/y/KXtKnM
 A84JRHrEq7uXC6zAdAbuwGzFL0mbrKAq7IJkRdGBtYrL+TFYPC6+2+yfwIdwpxogG2dCzH
 tBCha7IcZei8UztK53Er8io2qhn0U5s53iw2PLsGWkV3mipKkY6gKCVjAw4A8w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t 0/9] Enable more tests for VKMS
Date: Wed, 06 Mar 2024 18:28:34 +0100
Message-Id: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMKn6GUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYwMz3SQT3ezc4viS1OKSYl0DA/M04yRTM/OkZFMloJaCotS0zAqwcdG
 xtbUAvNRxSl4AAAA=
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1918;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tEyO6z9lNy/pMVzGfChf97NhCTATfGSwlOxmGT5hWPM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl6KfHfwM+sJSbDhIheqIQIxAje4Erjjrxylp8jpo3
 qw1bYveJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeinxwAKCRAgrS7GWxAs4opsD/
 9X+INmBgLu+VizirW0rJ9ITFP+6DCg0kMEts9eInc3sKAj1TDgY5chug+pcA//w83h5nCL9v8z+rma
 pK/GWDRTjSofpbkRnFNhdbnElHrq9YhGxGSPswVYoRqSV96o79+cNEuxOw8vlQwe0+PiT6c2prIsLh
 O5zIHMrS5WxDJqOOoB3qszD80bPcZJ1ZLQZdjcks4a9sLE3gF6GMxhIj5wAEqbUYUVROLk8uBRE+ZH
 WaZr4dTVh9hsGhb+n0blqxiHIcTdYrys3Z3mOaLooN+AoyJ1PqGjuHMxm93Beou9wTDmZq4QLKLNUU
 gQ39mJ/YU1aXcMiHdwrb3Zwy1y/YthUgXEfTXAlJxZ5WOFYOO7vD9LuTtpmGeSWKp2pPsn4IoHWuwG
 sne3P+bjOvs0DpzEX+bTkR8FFP5S6ue2jJBheP6owqDLdJvz8Uht6YNGvF43e/SfOGn2ikz+uiiuEN
 WQQXWGZ8e7+Snfm96p9r6pwZSKzU6Bn3On3olQPJAtx2K3GwEIdw7dPTmxtWEMqnyohanhcbx1YH8g
 5RVn5Ue5MW+VZiOH06btYuriXFSX+OjpsvkeYJacSRWqvnMQJbsLAesch4bK0ollToGeM5B834SlHf
 HgDt1d9dgC1WiXCdZFZZIXrKvkH2BHfRgApDQRL3G4zuPHzwK9Ngqlpipq4g==
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

This series was built while writing the vkms series [1]. All those 
modification were used to test VKMS more extensively.

This series:
- removes few intel guards on some tests;
- add support for DRM_FORMAT_NV24/NV42/R1
- increase the coverage of kms_plane for colored formats
- increase the coverage of kms_plane for black and white formats

[1]: https://lore.kernel.org/dri-devel/20240304-yuv-v4-0-76beac8e9793@bootlin.com

To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com
Cc: jeremie.dautheribes@bootlin.com
Cc: thomas.petazzoni@bootlin.com

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
This is my first (technically second) submission here, please let me know 
if I've done anything wrong. I've tried to follow the same rules as in 
the kernel.

---
Louis Chauvet (9):
      tests/kms_rotation_crc: Remove intel guards
      tests/kms_plane: Fix some formatting and alignment
      tests/kms_plane: Rename test_planar_settings to test_odd_size_with_yuv  and remove intel guards
      lib/color_encoding: Add support for NV24 and NV42 pixel formats
      tests/kms_plane: Use a complex pattern to test plane color conversion.
      tests/kms_plane: Use the square pattern even when using multiple planes
      lib/igt_fb: Add DRM_FORMAT_R1 support
      tests/kms_plane: Allow choosing the number of colors when drawing the color array
      tests/kms_plane: Add black and white test

 lib/igt_color_encoding.c |   2 +
 lib/igt_fb.c             | 127 ++++++++++++++++
 lib/igt_fb.h             |   1 +
 tests/kms_plane.c        | 376 +++++++++++++++++++++++++++++++++++------------
 tests/kms_rotation_crc.c |  23 +--
 5 files changed, 427 insertions(+), 102 deletions(-)
---
base-commit: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e
change-id: 20240306-b4-kms_tests-007f3b567bc5

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

