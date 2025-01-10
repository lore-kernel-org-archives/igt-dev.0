Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979F4E7719F
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 17:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957EB10F14C;
	Fri, 10 Jan 2025 17:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YCQdWX1+";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FDB10F147
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:46:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4A090C4A46
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:43:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D40E840006;
 Fri, 10 Jan 2025 17:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736530977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uT78wsV5CG4EXX23qChALcsqqouHEXkPLl67WHMofeE=;
 b=YCQdWX1+J6B35XaB6paZ2SJpPQL85wq+JvIWQ4y2N0Wa6tCloL5yzCF75lFpfAVzKjXPf3
 n+Xg0L2JeVyZpZOs3P/gqblWLmviBW66VGB7em00aPKtVyq0tyKgldvZVIjkxn7XsaRz/9
 i7amkpNcHlnpHuvMCwgkeKqxpyImCVgF8YK38EXotqFIdYokyRpXs+CzALs960caPI5a1k
 myrxFl7pYGwM/k789fjVJBAsF7dXBdAor9FmpuZo9EuhWv3Hl5PrC5pdQhNqFL3ai4J90x
 i8+LUptF5UiebGHoLkg1oF2FcNzJXYp8scJLntDHEgfzDcJpri9kb/Pc3ijAHg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v4 0/5] lib/igt_kms: Helpers for connector managment
Date: Fri, 10 Jan 2025 18:42:49 +0100
Message-Id: <20250110-b4-cv3-01-igt-kms-v4-0-0b0474708f9f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABlcgWcC/33NwQrCMAyA4VeRno00XVunJ99DPGxdNoO6SjuKM
 vbulh0UcXj8E/JlFJECUxT71SgCJY7s+xx6vRLuXPUdATe5hZJKy1KVUGtwqQCJwN0Al1uEgkz
 V2ko7aUjku3uglh+zeRQMHQzilMdnjoMPz/lTwnn5B00IEhpLCmsk00h9qL0frtxvnL/NXlJvA
 6VSS4bKRtlao+1O1waLX6P4GLhs5AJnHDV2t7WE+G1M0/QCHnPGsUMBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2445;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PL2Meo9VGcfcOko7FN1tOGMr0CZaXzwBYi8ddEQDv1o=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngVwdvBcIEeY0A0sHjX8eJMkPFfisOzOF/ZbOe
 l6rFpIvATKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FcHQAKCRAgrS7GWxAs
 4u7hD/4m2UX5T+1FmeyGfOWn17nE3wVFoytFtW3KTugtDD5anM1qXTtfuZIfdFq7SgEm7HbOBqw
 CVktGyWszoPA1sicAqvE9nvVm+dj5RwOKUXj4vhgjRNgQs1xDXTdUfoSOJzlZt2bSk0dEZ17NOL
 Uo0+G1PvA0TPylMsTEY+VCS6Y1P+lQvxrqIGrAgRhnVpNCBFlObZUSGesjhVklScAq/Gu3fauvi
 1Dtda7W3N5JdXS5QXbYZKDurDdcgRzIrpQmIFzxaWDTLkc6Yq4DeoiTRs0p+YLgQakh2mAR/03G
 eahdfKH2fA6wLAT6An8IdkM1ZBHaYAcT6T/Q6ITwLbp/wqpwXhrZWvpAz3Qqkv7Dw726wTeDoz1
 LldQxSMrrc7Iur4deD5w5x7wvBmkPLfl2n9fBzoIc25TQxIb+TOApOpfnbeibWO0l5K4fcIiusC
 ffwlSsmzt6d+CtRWpVI2qeXFAqp2KdIBtBVBvhs9fQ9zQLTpxCkXjOQQ+/1b3Uwn/CTh17iJIPF
 WBJnLuBf8H4K2Iml61jw9Ds1fYtVQxxmbKcbngxaF9kBbbm89/sl97fK4BOFeWwphFYZMdChdIY
 R3y5PNWdz0lJrhg9f2BqXaT96VBO9phd6sN9OwbLkcnRZg3VtLeZc5uGIjMEKTicwMHpirhvKmX
 UrrZi0uRFBRkPIg==
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
Changes in v4:
- Return double instead of float for igt_default_display_detect_timeout
- Remove useless warn
- Remove exact comparison with float, add timeouts
- Simplified the igt_get_connected_connectors with the suggestion of Kamil
- Remove asserts
- Fix style issues
- Link to v3: https://lore.kernel.org/r/20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com

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

 lib/igt_core.c |   4 +
 lib/igt_kms.c  | 270 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h  |  18 ++++
 3 files changed, 292 insertions(+)
---
base-commit: fb343db7fc59c760ef0a0c19303e7bcec177dbd9
change-id: 20240828-b4-cv3-01-igt-kms-3e5af6a4c05e

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

