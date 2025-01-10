Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E77FE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 18:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A9610E50D;
	Fri, 10 Jan 2025 18:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NIw/nH2J";
	dkim-atps=neutral
X-Greylist: delayed 1371 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jan 2025 18:05:50 UTC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6F810E514
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 18:05:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E91DFF807;
 Fri, 10 Jan 2025 18:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736532348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nY8ntw7OWTYb++44NrzrGxaqOO/Gh+pQpUCgHBJGWOQ=;
 b=NIw/nH2Jd60Y1QdnY+JiknwPR3i687gWgmaSmnN6myhyPQIzBFyzje10ku8Omqd6mNJvq0
 Etd/Y5Bf1/RyJg5M0/BHeYCUy2ugjlppNJ/M4ySQ83EJ84rmNc/nKYfef86OjxH76BWybJ
 Ew+v/lTxpgc7TntxUPq8Ja9POQGL/w1D3hF+8hRmZQ5Fd6ilbaH1bPxDyLaXfB1Owr7YhP
 AL0aPbkfZFQZePyiqwWy+inTeRJjaDQQHCDz0vfVI+Gqjg4eDiTgl6gFulMIQO2rGbYSqZ
 Mh32msl3AeM0SL+WktUaGz0zM3TB0b7ZIP9jXdENx/P2OhT/KQEtIgKJRF/AtA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v4 0/5] lib/igt_kms: Helpers for monitor edid managment
Date: Fri, 10 Jan 2025 19:05:40 +0100
Message-Id: <20250110-b4-cv3-02-monitor-edids-v4-0-aef77d3e0f50@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHVhgWcC/4XQQU7EMAwF0KtUWWNo3LRNZ8U9Riza1O1YogkkI
 Ro0mrtjFQRCCFja1n9R/kUlikxJHaqLilQ4cfAymJtKudPoVwKeZVZYo6ktWpgMuNJAjbAFzzl
 EoJnnBO0w2qXVrbNWK0k/RVr4vMtHxbBCVg+yPnGSzOv+XtH78V+6aKgBB2dNN7kFW30/hZAf2
 d+6sO1qwU9J14i/SyhS3zWmt51DTd1PqfmS9F+S7ED3g/zZ6q6n5bt0fW8g0vOLVJo/apjGRCD
 3jfOhCpFX9nfbmDJFSVzfAI2YjcWMAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=0D2KoH0HmcPit0nOjAFYfkYwAb7CJpyVOrvke0fwCzI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngWF5X+XjdwtJBr8mJyORBqJGVtMEYwaOuEfES
 llX6Hfj2bCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FheQAKCRAgrS7GWxAs
 4jtmEACB2kpWqWhfKoW7h9ifCRC1h/sHeI5cJPFcGemQzRaOi+fDikfemqhA3QkjHeAqe3EoHu8
 lBbVfUKDrcmyHYjxaTL71rqy1r77ASa+UxKB0LCfUK/AY+chP2amSkPixYuJJY4DoxKjE5HrBbX
 5BR6iehZrARxzfe22MdVYNV8BoXwtBdkRPCXarlmzKQTPAtb2plIqPq47AV2RjctVqFvWg4f/LZ
 tTRgDIvEo5UcWwTktMG9sUShwjlLAbgrHkDolNVaZihjlH+b/B+E22KZ8cd3AcHefGo186AcMgU
 pnX/0Y6IUwI3Sa7eSUolI1/bhTrwKvF6QAvCvsxmXR2Z3a/mTTzZ2IUoG8+S/jB5OtvicLkTDi+
 7r81I2ut7dWxm3shzhUT/Uf61l8kmekPo6MhLJJhQKOk9MTBkJEMi22ZDsapMi2LrY2dsqGyFas
 U8CfMt0Ip2j5ddF0JqaDXYryCC8hogT1wmn6WGpXWvZocQc+wUf+8uDapL34z58fx51Azt3p7Lz
 z/52tGnN3NgBwPsRQD16Vweu+BbXDXgYgbcwyrU9Vw+E2ok8WFcPoa7wB5SCnyYtpDn05g7QuRn
 wOV74Yfos7nfNj99QgD5bWcoQDUrieokm38aECQnD9mvNHd04p+izeatHVqY7/Zh4jQwwidUPfD
 Bk+YvOYNbW3anbA==
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
Changes in v4:
- Fix documentations
- Style issues
- Link to v3: https://lore.kernel.org/r/20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com

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

 lib/monitor_edids/dp_edids.h             |   3 +
 lib/monitor_edids/hdmi_edids.h           |  27 ++++++-
 lib/monitor_edids/monitor_edids_helper.c | 127 +++++++++++++++++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  10 ++-
 4 files changed, 162 insertions(+), 5 deletions(-)
---
base-commit: fb343db7fc59c760ef0a0c19303e7bcec177dbd9
change-id: 20240828-b4-cv3-02-monitor-edids-59a8f515c881

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

