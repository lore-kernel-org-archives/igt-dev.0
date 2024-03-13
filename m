Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA271C54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 17:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B76E10EDEF;
	Wed, 13 Mar 2024 17:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UTo76FXF";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB55610E943
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 17:10:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD0851C0002;
 Wed, 13 Mar 2024 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710349799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OwNN4hEaME+hTV3W7avH6HxRnEGs7eBaaNFQdwfKhYI=;
 b=UTo76FXFXEUDvpvFAPYrfPPK+7xtEky+eDPcTlpLGPTinmhCs9o9NLp7yWxTwv8QVDMnAQ
 qCBMt2kHetS4VQDE6v/o+CqusS0aGeIurX8bPRQt+Q0gRNn54Cl2efVySrevrAmZ5z0zLu
 feYA94ziqSnuhPyUakzyUpMOHQ9UHMPbmQOQEuk2UvE/e9usNuqlkn1Mfk/3bn8pStjHkQ
 JdIyHGNe09u41o9L9UQ9NtTcmliLjWpqqijAeF7J3+jk4yoCYpsu7FSXDRh2qGFocUokBr
 2jtGVltbRs+pCSetExxqvXZi3qVnP8w90YmPo6kN1KQAdbiQlF4ckZbruexSVw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v2 0/4] New rotation test
Date: Wed, 13 Mar 2024 18:09:39 +0100
Message-Id: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPd8WUC/3WMwQ7CIBAFf6XZsxgK1VBP/odpDJTFbqJggKCm4
 d/F3j3Oy5tZIWEkTHDqVohYKFHwDcSug3nR/oaMbGMQXAxc9oJ5fF1jyDq3I5u5HPRRGWlGC01
 5RnT03nKXqfFCKYf42eql/61/QqVnnKEdHSpxUKN1ZxNCvpPfz+EBU631C0eDAA+qAAAA
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, arthurgrillo@riseup.net, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=D3AqOHbmnYNxTybl6UiBs7H2+/KaaffOPPw7KjALXxM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8d3gK0aKzqKgxQFYBicGTey/gyobHrd2XVNnmRnB
 9rsQTwKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHd4AAKCRAgrS7GWxAs4ii4EA
 DB1Rd+i7gxFxGjgyiK5konWsq66B1RCgh7DjU3M80/9YAzRbnW3U8W7CKydJNdY45/45MNSya28K3G
 tUs4oT+Y7Jy1HDm/GUOVa8rQ8DzcWX1o3VVU4xn38aA+OcUAvnB2xuLfad9b93kjcUqBkRdSn2WKHX
 nkVpNQ+4NLHLoHOXaS8o3nl6NXLSwTb4R9V1O72ThXAGIUCuD9xwnvFrhhhKQJz+YNqpPndAy6CDWk
 Ry2w21gSBjfQl7WCibNE31Qxuh8XWiVVnekO9/OfWoj7xaSkMKIY+ibgGAnTS6Nxeq+A1bcxa7jPj2
 aPRW+USsDl/GJ+Fy5HDoiAS0GYLU+AUQSZjwT6v+NDnInb6kthksHopRkqPw8SWNnNQDmckK9nLtIP
 sgHqmGxbr+1Mczaukl8B7O5tvGkxVO5FpE8deku2/MmlkZxhKlu1594R3fHa12JJyufzsV/HYonvvr
 kM2ZZglQJza77zX17decA4IIg/drnfnqkrHExOcBm+fUkMX1LkPVhpV0nYOv3kP2YwhgglQAixNB6u
 8YRUmz33PGSelgYXBy6r03EHo4WvLT+Kn9s55RfcDZWSDoFGvpKP51B1fCSHw7euTrDVCIH00VUNaP
 bYm5bP0891ehI2xnmWC5NFwz1viCiHlxm51QCi99oJvpBvy9b/X6rMA+cM4g==
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
Changes in v2:
- Fix a typo in documentation
- Fix a bug when using subsampling with non compatible sizes 
- Fix a bug I found when using different color count.
- Add cli options to set specific plane size
- Link to v1: https://lore.kernel.org/r/20240312-new_rotation-v1-0-ed9fe82589df@bootlin.com

---
Louis Chauvet (4):
      lib/igt_kms: Add reflection name and mask
      lib/igt_fb: Expose lookup_drm_format to access format properties in tests
      tests/kms_rotation: Add extensive rotation test
      tests/kms_rotation: Add command line option to reduce the number of tests

 lib/igt_fb.c         |  15 +-
 lib/igt_fb.h         |  29 +++
 lib/igt_kms.c        |  23 +++
 lib/igt_kms.h        |   3 +
 tests/kms_rotation.c | 550 +++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 6 files changed, 608 insertions(+), 13 deletions(-)
---
base-commit: a44ebfe43edc96acab22a19b6a8850eef9202eea
change-id: 20240312-new_rotation-c034a68b3b9d

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

