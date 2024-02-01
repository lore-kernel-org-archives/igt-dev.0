Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C018EC4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 16:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B3110F20D;
	Thu,  1 Feb 2024 16:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZaEzWbsy";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A6210F257
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 16:42:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9C2FFC32E1
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 16:36:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55893E000A;
 Thu,  1 Feb 2024 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706805364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K3QhBk4kddp6NXN1w7BG5YjLj+31lmt4J9prZ2ZV6jg=;
 b=ZaEzWbsyOO3ESPBWO/9aSnDqq0KH2k7YQA6o88qCXiTRfPUek8lTT3bgl5kw0dvLQp0QgH
 wuv/xLI1n/XKH+yH1W302/NW0b4dEbALJ9fFq5ln25vGfQCphlSZvm1Z+o6UQATWe/M9nA
 AVd/aZBofJxPNo0p/1ZnX8QQxY4V2nxgbh2L3njIr7SxDaGlKw5Q49qZvgP3OEpzc961cb
 Xr+qJ6dFTQ+8dMheXhKdQzCX8tX1idGiKnuf6UYKheyIo4rL2V+Yu0ONoltFdxPIRmGPpc
 HeJOePx6cvoWO5Ad2Q0EPmbo+sN3/cisaY+TjX7xyaBNLL4j1QxdfW7Uq0eCYw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t 0/3] Add tests for kms_plane and kms_rotation
Date: Thu, 01 Feb 2024 17:35:52 +0100
Message-Id: <20240201-kms_tests-v1-0-bc34c5d28b3f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGjIu2UC/22NTQ6CMBBGr0JmbU1bMVJX3MMQ0+JUJkJrOpVoC
 He3snb5Xr6fBRgTIcO5WiDhTEwxFFC7CvrBhjsKuhUGLXUttVTiMfE1I2cW9oRK+tofG2Og5J1
 lFC7Z0A+lEV7jWOQzoaf3dnDpCg/EOabP9jern/03PSshhTVee6cNYnNoXYx5pLDv4wTduq5fY
 Mg+d7kAAAA=
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, thomas.petazzoni@bootlin.com, 
 miquel.raynal@bootlin.com
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=wuj01KLAay76DU2/RE5As/cChOkQS1DBz1b7yxfXrcI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBlu8hzhZZ0R/PJz5mC36Fbn8LLSJsZr36HpLtCldND
 YtmSrF2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZbvIcwAKCRAgrS7GWxAs4j5oD/
 93vOAJ0/4O61TN7bxc/Dj+gbL3CJCFAuNMKNnUYllQGH5WRQFem/G6zVpJLjucTfgjhKlC5zs7ZN9a
 cs/2xExmaUQH4ef1/qN+jVYNeSZGAyJnNeF3RqHOwuCai41pUpLmyDpC9YXF71LTjueE4oGXKL96jr
 6RzqoOP+xfR/ryPGUSnS4WfLnbZLRSeB0fAdz39sOw2I82KpRt1xD0jrhVd9uUiNHcJXMhib4ZPhVC
 vVMu31T9+vfgEHh9xB9XCYbDYm9IOp+m6E/wsvkA5i7y37RGgo9XEhQ2akw0yW8aE3mOShNztp01qA
 99W2NoZncWjSSUPvzJkcgAN2S6QfsWdkmTuFvPsSvUskW4w4Pze8T8h4lV/Swow9rzUbrV4AFejCHq
 qbrsc//YLNlQM4G9y1L3tuDnab8e8vIhM4rWRMKPga+vo/b8LB7zphTVL+mJX1clRka5kGdmBRKUKN
 GTFUuQ7XvVuWJj3scuZwOs0fIxvGrx61K5jgrI7ug90RvLGbhay7EUtyz6RzsFah/kmAB/r57aDOc4
 gytJlYWsztsmWcyqYv8Nded1q84Tnl/0oxi0LdbNIb0mkX45tNb9AqcfUrADuhtdrr8PDVCibyyuXg
 hxlc8Z65jaDCL5Rd4lmAqtq5p23QWdN2wO2WIigIWnR18KjXH9s+b960NHlA==
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

This patchset mainly remove intel guards on kms tests to allow more tests 
to be run with vkms.

Patch 1/3: Rename a test to reflect what is really done and remove intel 
guards.
Patch 2/3: Add a more complex color test because "plain colors" and 
"lines" did not detect some issue in [1]
Patch 3/3: Remove some intel guards to allow more test to be run in the 
general case.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (3):
      tests/kms/plane: Rename test_planar_settings to test_odd_size_with_yuv
      tests/kms/plane: Use a complex pattern to test plane color conversion.
      tests/kms_rotation_crc: Remove intel guards

 tests/kms_plane.c        | 133 +++++++++++++++++++++++++----------------------
 tests/kms_rotation_crc.c |  23 ++++----
 2 files changed, 86 insertions(+), 70 deletions(-)
---
base-commit: bfa3db0cd9e9a11c0eeaf40a2743c5e2e0f24d2c
change-id: 20240201-kms_tests-a7e10f4f5899

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

