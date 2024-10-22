Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575F3D1CDD5
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D1810E309;
	Tue, 22 Oct 2024 10:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="auDPfINx";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F1910E30D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:29:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id BDFD8C2F8B
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:28:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2404640002;
 Tue, 22 Oct 2024 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729592920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fklvQy/9mTu8Yv0tDpb19wKJhwgx4s+Wh4C/XwZOHuQ=;
 b=auDPfINxyJ7GiYZAnWqRzDHhbYJZ6S8vYH0W5wBVHuRqaZR9y/rKxUhCMlfrqhvSR4qTy1
 p7fNupctRXC3Vj/JoJyXmDCRjo2VjjKmxxzAFTYwKG/U2eoJeiwXA4nDJDozMQvP1DKAkN
 Cc7nJTgkRU9j1OPmtF+uTXkgukbKKjUMATwQih81kbzf/AUd68c/wnq8gmXqQeJ5DT8kZx
 dJ22RVlonmp0KpQ3YYG8Qkdp+6pLaGyfxDIi5nCwXzsZjj8Kvuexy2YGzGj6N3/x4HjtnI
 c9L/rOrP/K3QlZpKTP96HdRgK3eX1o1QbYjpeYKnX02t/C5lWz9lC++8Yb1+dw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v2 0/5] lib/igt_kms: Helpers for connector managment
Date: Tue, 22 Oct 2024 12:28:34 +0200
Message-Id: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJ+F2cC/32NQQ6DIBBFr2Jm3WkA0Ziueo/GBeCok1ZpgJA2x
 ruXcIAu3//57x8QKTBFuDUHBMoc2e8F1KUBt5p9IeSpMCihtBjUgFajyy0KibwkfG4RW+rM3Bv
 tREdQdu9AM3+q8wGMCyYYS7xyTD5861OWtfwjzRIFTj0paSV1k9B363168X51foPxPM8fBMkYi
 rsAAAA=
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=g947aVh7tjf2+VcAcpzA1WeHry/gE/d9PCBo/kt5gw0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF35VBue3UAqeBQQU4XJxczU2F9fhjxZ8jlls6
 QF4t2VoE0qJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxd+VQAKCRAgrS7GWxAs
 4gQQD/9WSUL1fQnUa1ygXwbJeyz9VvzFXl0amXTyVL0x1JDAoT8/nIRLdauJCL2JykjYVdOAmay
 vvW49nJmL0EKXcckPe+4gOGO9tMdYYFrB7tBfnSwkoQgbupAaW1Uxc6nfz8St5ew4FHwnxN7We1
 qJUys7Vb7wPJdFsdbrgVx962mpnvAA2muvYZo/FPfoo+cxLUzpIyewnjyz/uB7F92hj7Gwzrj1k
 3iqHV7ltr6mfiGMMK5E9W9D88wGUax14iki+th/a53qN+liEY+i8WxGAZV2RGAwq8/KnXOqL6Qg
 TtjOEMjDusf+dmgVcsTjX4/HriKRJvm23rJ38rSofrJt5nlYGN0MkIwDllWrqKvduMVjq3+xbFy
 Ym63ZJEOHLn32MjBdoDH8S8tpfg4l0oL4S7xgsnNKaXdcq3FdjFXWDR5hkiY9yFxSQbnDBhMY4H
 5JuefJKnI04dYOvN2lJptk22WvKqlqBsMkX8F2QAOfE5k3UzKv45fgTSzlZTTUtxV8/j9ZiQJSA
 OOMjYPxU+iKvAbQGfVwh8bIMvexzgvJa8J2f/gaJvbLskEjUsYIIFMnVycQ/oxLxXsIvjqHnPVj
 7yJtxFpZRvOPmfrnOYyYRrofnfnh1zdTvufs8IPgVexNKsbMzWPk7Tc9CS5oVkRplGBWaLaFK5w
 4BKVZOJI7PFsOag==
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

In preparation for the introduction of Chameleon v3, this series will add 
a few helper functions that will be used:

 - A configurable timeout value, to be used by Chameleon's autodetection 
   algorithm and connector status detection
 - A helper function to wait for a specific connector status
 - A way to list all connected connectors
 - A way to get a connector object by its name or MST path
 - A helper function to get a valid pipe for a specific output"

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v2:
- Rebased
- Fix a warning during compilation
- Link to v1: https://lore.kernel.org/r/20240828-b4-cv3-01-igt-kms-v1-0-d6e21b1e5d04@bootlin.com

---
Louis Chauvet (5):
      lib/igt_kms: Add a detect timeout value
      lib/igt_kms: Add helper to wait for a specific status on a connector
      lib/igt_kms: Add function to list connected connectors
      lib/igt_kms: Add helper to obtain a connector by its name or MST path
      lib/igt_kms: Add function to get valid pipe for specific output

 lib/igt_core.c |   3 +
 lib/igt_kms.c  | 232 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h  |  17 +++++
 3 files changed, 252 insertions(+)
---
base-commit: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4
change-id: 20240828-b4-cv3-01-igt-kms-3e5af6a4c05e

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

