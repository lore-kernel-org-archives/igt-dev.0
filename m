Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1558C54E66
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 09:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC1510F349;
	Tue, 12 Mar 2024 09:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VywLO7Se";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38BB10F349
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 09:39:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF71D2000A;
 Tue, 12 Mar 2024 09:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710236343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vVW0a59tvzyo2uNJNRvo9B20XBAyQlIG/NcXCmIUibY=;
 b=VywLO7SeT8svWItUSQcRiMeO9skx2t/jTeiWD8SFT/As5H3QVZgyD7hpgx/kAxVW9dUDJJ
 Qx/kSev2syVi6MK5EAWqKFOpV++vN7VCmb2oFoLq/JSQZr6/aEGdtJnvrJlafZHlvp1EjE
 cVBs7WGUluwOOZ/hpQ3EwESTT6GTnJ+5aXoinWohCKPu/arFJkUHS9BBdKmuV3jOcZSvsf
 LLycsUL8uZWJGlb1NIJAqdwubyVM3/j9LVeFYNUqh1aWg6cPhe27K9bls4PWmz20kAbTIi
 P9/GxyiVYrN4Fl5SwMI/oi0H7M3ikAy2uPkU1X0uI/Gh0On33u0xmTZvxdC0Jw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t 0/3] New rotation test
Date: Tue, 12 Mar 2024 10:38:57 +0100
Message-Id: <20240312-new_rotation-v1-0-ed9fe82589df@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALEi8GUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDY0Mj3bzU8vii/JLEEqBC3WQDY5NEM4sk4yTLFCWgloKi1LTMCrBx0bG
 1tQCibv0hXgAAAA==
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, arthurgrillo@riseup.net, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Tu7Z5ZXru2mdrsZN+S30u9mhqtGNbIPwWioQqMDEzl4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8CK1TC7LH5E71UJe6ZRhwXHhUIgrfi0pdQvg4CkS
 k1/bHkWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfAitQAKCRAgrS7GWxAs4soUD/
 9ktpx1ufZpRbjCQwsul7LuxVt7CsNDV8ND8uIYHABbyNnxK1i19XNkL+aofTCe7ZtySBu8S8Uor3r0
 23NfsF1F77pp7yUyqjciioihJ37etW7lmfAfBYCnwoDXWtOe8ld6hxxhDkRHxdpcyL3BIy/J0iQ7eE
 13lDoBD/qfCm1tCn9b5WADM2cNWSfnQoJLA64V9qDxEhb0FegvMzDPLzwTKgl8l+WNEn28Q/AtINp7
 6OUMROyQ9+PtKDo0tMDG4ZsN001YHAwKZbW11LaAU5p+Q55zd+OkhcBbFOIYw59boI1W3mp8YOKUA9
 fiX+dXva0gM0RV3xqOzStEzMBnBqspV+3RejmGOltF6kB3fE082Y+A7WOufdoyTt8sL21NBrIhmUtn
 EzRsZ4oeMCa3WtvyVHROpxpeHezqq06BKAeSGJ2ktCnuumi+YEXsm8kE3nnn7QIkGgAClOR1QRNcsi
 x6VSJxqWeiHn9DfjlHXv9ZG+iZI3DF3HbVSUj9tXHesVgiwit+VSJZl3zrHdM9OFQ+5DcBU39IlNpk
 uKdyczOTwXPXudyjNeGrULr27vbmdyeab5JKIRngOCsclRguxrBX8pbDcsVi/eG5Vy1nJAcG3ZjFa5
 Lfch/xzdqsNG1uRpnccuqr7QJIF2jcGKjveFm5+fkLY8zi7XxhqM6TBcoxQA==
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

The actual kms_rotation_crc test does not test all the rotation with all 
the formats. Create the test kms_rotation, which only test "full plane 
rotation", but for all the formats, plane and rotations configuration.

This new test allows to detect issues in [1], where the YUV rotation is 
faulty for reflect_x and reflect_y cases.

[1]: https://lore.kernel.org/dri-devel/20240304-yuv-v4-11-76beac8e9793@bootlin.com/

To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com
Cc: jeremie.dautheribes@bootlin.com
Cc: thomas.petazzoni@bootlin.com
Cc: arthurgrillo@riseup.net

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (3):
      lib/igt_kms: Add reflection name and mask
      tests/kms_rotation: Add extensive rotation test
      tests/kms_rotation: Add command line option to reduce the number of tests

 lib/igt_kms.c        |  23 +++
 lib/igt_kms.h        |   3 +
 tests/kms_rotation.c | 434 +++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 4 files changed, 461 insertions(+)
---
base-commit: a44ebfe43edc96acab22a19b6a8850eef9202eea
change-id: 20240312-new_rotation-c034a68b3b9d

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

