Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB79E69173
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB44710EBE7;
	Fri, 22 Nov 2024 15:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="itqe46iI";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BC110EBE0
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:51:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D46320004;
 Fri, 22 Nov 2024 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732290700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ABVJ+pdYWCviwLuu8jDFobDSfRUnQxs8h3ip9UYhBjg=;
 b=itqe46iIbPCq45+zhrP1VmKBaB5SeastRr2IPbQ/sE0GW2DRb/XKhbHQKzKoOIKRWJufT2
 +62zNhBBpzHuKCD+1BUsfe3+ssz/vUs1v5MOdIgFbqpn8Q63pkbqop1Df/j3g+uFo2mJL4
 dnCB7jN5fkvyz6wLZD0HhoXsTeXzJFZFoSKm93SWXPuF0sJy/tZUFAdJKyO4RD2XKkmNOz
 DAkIueHyNWELBWKfkDWoCFmIyOMLo7r5aEw1sc7OPYAJNVt0JYkGCYxxaQZFFIlBLhM/c3
 LEmvJf2PdA6AfK1v6MWXn8Ft0RGUNuvXti8veaBkUohlbQGKc707G/ugCtWVDA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v3 0/5] lib/igt_kms: Helpers for monitor edid managment
Date: Fri, 22 Nov 2024 16:51:33 +0100
Message-Id: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWoQGcC/4WQzWrDMBCEX8Xo3G2l9U/knPoeIQdbXjsLtZRKi
 kgJefcubgj0UHqcHebbYW4qUWRKal/dVKTCiYMXUb9Uyp0GvxDwJFqhxkZbtDA24EoNGmENnnO
 IQBNPCdp+sHNrWmetUZI+R5r5upEPimGBrI5yPnGSzNf2r5jN/BddDGjA3tmmG92MrXkfQ8gf7
 F9dWDdqwSfJaMS/SSikXVc3O9s5NNT9Jt1/ekf6vMgQ+VF+HBKB+CvnfRUiL+zf1iFlipK4fwP
 DG1kpQgEAAA==
X-Change-ID: 20240828-b4-cv3-02-monitor-edids-59a8f515c881
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=DQDX29Ro7k4pA/vU7OF96YaXd9vQcB1j0Dj6BhVnTo8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKiJFAhEB8bT0We1hC7t8Nck+mCJpqM/0Cile
 YfbhRRcPs2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CoiQAKCRAgrS7GWxAs
 4oHED/9jqH69N7kYsgXAbdFkDD1fPt/gPQLE+PiLLvFOAktHE9Y3zatq1fpPqLxD6ukQwqQ+zRP
 3rMwgL5LI04yRn8nt662tXzQF0Hgj/tBxIWS+YuZNbMnRnIQ3xiZTXFyXX1lhblKVVaItrwYSew
 3XTvrzT4RUY/29KSe8MMiuIty6Bw0PLrpS4LH036zamoUcEt9+QmJkFViCm8Rn/eSSsVoBrNK8x
 FWfiEtp1dFTxEp05xvzCIShwtIGo+iiaEZleg2IMozSOgq7sFCvrYx0qX6G5ux0Nm9yDkXqTKiL
 pyQTaU7MyCCST/a0aEQifoyiQbl+ctFQIR90CwPoA1PNhwPmstj8Q2QMCkSxLzV6e8EioRH8KXS
 +xLa9CdR0NjIGf6ZhWHfX736hDvpGtBSfQSTvYA6Z8C8JA+zZCphaxU+3e6lTgMQmNSc91L5o9+
 ZAAAd1W/W4FCpKsQzMaL0Lv7kVnjeV0nIv3s8su98HqSrgupti5VKd7WtLJDlVULdDl3LTu007B
 onkiS5ImjzInPhKjmjY5rRhhh2hmIxNiy0EYHwd17iVaZVnCDmS0gL+ghWgP/XFsRmvbsdbEvWH
 ptyHiIseVV1gOgMRxl+Qv47WTINaBQjIC79Tp+k6U0CbDeSo3tDd8MBhIT/mUP44jRz4PJpSU0w
 nRksESRxTMRLXqA==
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

- Helper to convert monitor edid to edid
- Helper to fetch monitor edid from its name
- Helper to display all monitor edids
- Few fixes and addition in edid list

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v3:
- PATCH 3/5: Add function documentation
- PATCH 1/5: Replace igt_assert_f by igt_debug
- PATCH 1/5: Add const to the returned monitor_edid list
- PATCH 1/5: Add documentation
- Link to v2: https://lore.kernel.org/r/20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com

Changes in v2:
- Rebased
- Link to v1: https://lore.kernel.org/r/20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com

---
Louis Chauvet (5):
      lib/monitor_edids: Add helper functions for using monitor_edid objects
      lib/monitor_edids: Add helper to get an EDID by its name
      lib/monitor_edids: Add helper to print all available EDID names
      lib/monitor_edids: Fix missing names in some monitor EDID
      lib/monitor_edids: Add new EDID for HDMI 4k

 lib/monitor_edids/dp_edids.h             |   4 ++
 lib/monitor_edids/hdmi_edids.h           |  28 ++++++--
 lib/monitor_edids/monitor_edids_helper.c | 120 +++++++++++++++++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  10 ++-
 4 files changed, 157 insertions(+), 5 deletions(-)
---
base-commit: fb343db7fc59c760ef0a0c19303e7bcec177dbd9
change-id: 20240828-b4-cv3-02-monitor-edids-59a8f515c881

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

