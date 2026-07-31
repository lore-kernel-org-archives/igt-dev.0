Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F82C55173
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B0C10F38E;
	Fri, 31 Jul 2026 18:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="J8GQM7V/";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D6B10F38E
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:22:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1CA171A1370;
 Fri, 31 Jul 2026 18:22:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E06606039A;
 Fri, 31 Jul 2026 18:22:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE4FB11C16C3D; 
 Fri, 31 Jul 2026 20:21:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1785522118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=OrtHP+UoMdq4FXnm59UBL985SQmCZCJYpzTjhumo0V0=;
 b=J8GQM7V/SUWQfy/pkbp7jKBjq3jntNeyhNsUQwwIesVCIMuQLPgMXx39Le7J+Cmi+uirvj
 ArwLkPCaZWlhrZqYREa2wNqqZtHscPr1h8OxWb1Ad4JFWJQwYKylgajclL53FhuLiSZ2a3
 hslWI+lG554sEwgIB9tN5asWROZc92mzkNqdWf7g1EIcDK6nCJ0GouJ+xkCBde/idLiuci
 +v4H38RW5P2mCPB6fSglu0+G8pszDXCO89AxwQIEHFWJSYqRUS1UQjZ5MnowMLYeeBJ5S6
 qvVjgODsixhEmk16YB4oHYEv3Btp5Vo14jN+xW0Dhq3LdNNB5Z6jCUzGgIwfBw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t 0/4] Add HDCP support for unigraf
Date: Fri, 31 Jul 2026 20:21:53 +0200
Message-Id: <20260731-b4-unigraf-hdcp-v1-0-495df88ebbbd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMHnbGoC/yWMQQqDMBQFryJv3Q9JrBZ7leIiid/4u0glURHEu
 zetyxmYOZA5CWc8qwOJN8nyiQX0rYKfbAxMMhSGUaZVj1qTu9MaJSQ70jT4mVpVG910ml1nUao
 58Sj7//iCUKAF/aXz6t7sl98N5/kFTzLjCnoAAAA=
X-Change-ID: 20260731-b4-unigraf-hdcp-60321591eb9a
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, thomas.petazzoni@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, fomys <fomys@google.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=947; i=fomys@google.com;
 h=from:subject:message-id; bh=5b+61cChxbuGeyG5P9JR0r/NbyEZbsX7OVX7Pup6hgo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqbOfEcldv9xsi7PZf2EHNaS0uNf0cKYn5dYVsU
 UBXW8APjWyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCamznxBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOLBQA//YjRgaUs+Bkl1SWVRPy/0cPGM5UarJB/
 chE4Yn/6vFE8Gnc2PmJfZE51O5sMXlECTgfuLFaKycRf3azKO0SkdGVt3ug+vZW+XiVR9pCNrcq
 rP+dfpVxAX+/CnJj2Ycstd5ynsCy7WN8KIDO6KR+0l7jh5T0xzkihwBxajI2ahfwWlgsp74KNK9
 7F4s+DGEQa/dsNbclHdmZDI/d/P2w2o/F80Dq+0dxQp3otD5mfMLU7bFJN1HvaT+0axMN9unG8H
 kZu0icAtHhJOrJByHgomiapH4l+ROJsgnhVp91nYVSSERxQsq97IF4Z+wr9fMBklSSrrw4PFz+Y
 KwNKkINCF6H8+skSVUezi7oeTgQLEebMeGIH83yOVtBN2BY5YGWsRX6blsRbpmGQOgGDmP1eE2z
 oiuwHbNAGF/Or4XHsFEJdRZQeX2QSx8zsZKLbUBfxwoeX4X2pzaYHQssvAWxB/nOzA8XU9EToZ8
 0kyuFwauK4k/fvglfFX4N3jzTdYU3HnECrNv3LpXc4uccCgJ8fz6Zfmc8UkQRXkt27ipgGsAJXn
 WC5YVNdTBQpTK/UOuLnngUqVjT7SjMz/D2Bqcp3c9Ki/Q+9IRNmmKOPhYKF3OZ8JQgckCDkf9Xh
 ZpH+z4D+BKjlga9lMg4MPU6dTq2wSvUN/tDZ4cXWDGrUfltvEGLw=
X-Developer-Key: i=fomys@google.com; a=openpgp;
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

UCD-500 is able to emulate HDCP 2.2, so add the infrastructure to:
- test HDCP using UCD-500
- automatically enable HDCP for existing tests and avoid creating many more
tests.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (3):
      tests/kms_content_protection: Avoid using internal pointers
      tests/kms_content_protection: Enable HDCP for unigraf if available
      tests/kms_content_protection: Add test to ensure HDCP is properly detected  by the DUT

fomys (1):
      lib/unigraf: Add HDCP management

 lib/vendor/unigraf/unigraf.c   | 23 ++++++++++++++++-
 lib/vendor/unigraf/unigraf.h   |  4 +++
 tests/kms_content_protection.c | 56 +++++++++++++++++++++++++++++++-----------
 3 files changed, 68 insertions(+), 15 deletions(-)
---
base-commit: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf
change-id: 20260731-b4-unigraf-hdcp-60321591eb9a

Best regards,
--  
fomys <fomys@google.com>

