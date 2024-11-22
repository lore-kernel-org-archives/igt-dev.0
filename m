Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D473AE6916D
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9501F10E01F;
	Fri, 22 Nov 2024 15:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="etWYcHMI";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849F410E01F
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:19:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A025A1C0010;
 Fri, 22 Nov 2024 15:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732288758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gVipcobF2JenISz+0rd7OPw6LBhHJpNVd56od95rtMo=;
 b=etWYcHMIVMFyg3exeB/WhV5ntsPChbeODwP3wP2yltSviEGzr/RYOOwaHYm3Sn3Nu0fbRU
 LNHGVLiygmM5jRnzgWWWwcyvupR6B0u7zowHB6BnubhDt+n0T7kUwZEgWopN5Xe9NouILi
 1QJVSH6yMuwkb6kcNS8BG+5rkScVj2hRBOp7/+DojU0iUP88MIhDNBUDfX88hv7ytd9ACr
 mZG8umLjZLWJ1lAlzpCEj42mQra5eAg5LI4wcCGpn31Y40c2NwKayOGdc8TRWhyzGIbxva
 3WwxTdRBEZ83zbkYU4opnLu6tTwwGMcmZro+jKST+XhE+kZpCjghD8i764wEFw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v3 0/5] lib/igt_kms: Helpers for connector managment
Date: Fri, 22 Nov 2024 16:19:03 +0100
Message-Id: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOegQGcC/33NTQrCMBAF4KuUrB3JP9WV9xAXbTptB7WRJASl9
 O6GLARBXL55zPdWFjEQRnZsVhYwUyS/lKB2DXNzt0wINJTMJJeat7KFXoPLCrgAmhJc7xEUmm6
 0nXbcICt/j4AjPat5ZgQTJHYp55li8uFVl7Ko5R80C+AwWJSiF2gGrk+99+lGy975e/Wy/BiCS
 /nLkMVoR2u0PejeCPVtbNv2BqkNGOb/AAAA
X-Change-ID: 20240828-b4-cv3-01-igt-kms-3e5af6a4c05e
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2067;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=wqcDH9FVg+BZuXm5U+cRa95EAU5u+YL91XkCKGhz2PE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKDz8tcSJbXoPzMXWloCW4DlG/LLYI49NmOnG
 E0DM3G1YHaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cg8wAKCRAgrS7GWxAs
 4tGYD/9bXByF/4+BmNcObsMuWucaRrdv/vZhPxN2ebJLFvQmkbyOg4RZ5wu3BgD/zcZm99oEG6m
 apJGZT3DzwKU52YpmMTKj/uE9THqRoUcVjLSt7ZrBRhb1MyR6w0AXGlPzBvdgjWYtIVnFg996pB
 C9spckPRDjd5X0vbuSHQfkdsQEJ4Eql0fKZBaKPhRjOr/9S+jYqdncGQzhDKPpduywXhC5V3K0x
 7Q22cfWd/tyzX8vXFHihShICPhYqdW/BM5JEKZMfmT5p9Lx5jSnLeg4tLL9hhv/X+YtTw8ff9rN
 Z9mnE5TpW8mqq8Z/xFcU9wDeh+AQ8GArc/ncSdcdwTUM5VaNR4V6E4NAh4oUktfHB1sBqcp0bjE
 hbVSKxYszNnG/sU70Yh3la3o1AVCjGbJ/VLgt5lx4nuG6IbXmRnk+lU2dGaqN3jz8u/isZTm9vM
 uz/02+jBmyd9sytHUVufP31Guobr1jjil+DzEAGoypjKsdBhoidEJtcaoUv7PwbYdHOOiKZM/6V
 ALpEsoIJEwNo0qHdFcXYvW6AIUIqLEwyE4svrxcljmQGnk0/NI2ClJXW51voiXpykZaIyObLoze
 vO28hN5GLuxqRvuIHi9uV+NRWVxIBZtJpBzAMVTOoPgw7pahkmkgoJsRgSYsvS4bumq4pv67jCP
 J9uvk1yc/OzjKpg==
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
Changes in v3:
- PATCH 5/5: Remove the igt_assert_f in library
- PATCH 4/5: Change hardcoded 50 size array with ARRAY_SIZE() macro
- PATCH 4/5: See PATCH 2/5
- PATCH 3/5: See PATCH 2/5
- PATCH 2/5: Use a different initialization for end so if timeout == 0.0, 
  there will be one attempt to get the connector
- PATCH 2/5: Use -1.0 as a special value instead of 0.0 to use 
igt_default_detect_timeout()
- PATCH 1/5: Change DetectTimeout to DisplayDetectTimeout
- PATCH 1/5: Handle errors while getting DisplayDetectTimeout value 
  from config file
- Link to v2: https://lore.kernel.org/r/20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com

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
 lib/igt_kms.c  | 254 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h  |  17 ++++
 3 files changed, 274 insertions(+)
---
base-commit: 84e42580f918da926481fd2fb37be01451d6ee9a
change-id: 20240828-b4-cv3-01-igt-kms-3e5af6a4c05e

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

