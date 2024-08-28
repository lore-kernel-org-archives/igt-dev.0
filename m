Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80135C63798
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 17:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3718F10E3DC;
	Wed, 28 Aug 2024 17:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L/JeXieD";
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E6710E384
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 17:27:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8571B240003;
 Wed, 28 Aug 2024 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724866021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zgS/Z4rjryfMDMbjbguyhRveXanRaoZPeBlUHKRATTc=;
 b=L/JeXieDYkMNW9xAFx+MVJObnSCxbmqOFzAUcgX2dbNEvOcQY0E55ehqN/TZBGYxTcb3o+
 +l+j9cS3v96M9e3/K9AdB3KE11tRVMeBw6zLjVjdZEEmupS3MnszGg7pVXfKjzxdlQoDmO
 4vczQ09hAH/AUoka4I2e6jHUOcay2YXV1w64QFnd1p44OVB4XL5rw5xav2kRvM6aYc9asZ
 EAtOstgcfs+XeB1DZnkOF2omAuoQmouKINc8T7IvqI8RZ0IykAwV+Ylyk/DW2s+oUmbKS8
 yU2FR7Tx98IE2nbE4PNjn87n+nzcoPC8+/Fz+0xhrt6QYHIPg1tQXhg/5/KFng==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t 0/5] lib/igt_kms: Helpers for monitor edid managment
Date: Wed, 28 Aug 2024 19:26:34 +0200
Message-Id: <20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpdz2YC/x3MQQqDMBBG4avIrPtDEg1MexXpQpPRzqKJJCKCe
 PeGLr/FexdVKSqVXt1FRQ6tmlODfXQUPlNaBRqbyRk3GHaMeUA4ehiHb0665wKJGiv8c+LFWx+
 YLbV6K7Lo+T+PpFix0/u+f1AfkAFwAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CqpNwzp760GldinhK16xoOT52epEvkKPPA3gaArk3y0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmz13Rdd/DDh9NadGsnoeVDCrvVIijeNbRL7LRL
 skbgrQHOCaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs9d0QAKCRAgrS7GWxAs
 4pfGD/9RaoGi6m1a7j+4+o2K1jf26yTmisiE/hyXMrrEyXssVyKspQA7AD7MmtrZTmXqI56T1ZK
 uILgSvyC1f8fnuQJAa9QSXg+u7d7HPdFigXETFu4Jmf+4hg+hBTJ6A+ea9TLfwGvaKBjLae6nJj
 zb6VwCbUympFAs8RRedqJCs4X97lX2wEGR318oELrcqkt5FoZvmpbaE+2AHPZ+Fr7YRJ5ldfJTk
 OZm/3di5D59bBO1xgPS8ODT96OfMFftZ4wgk1c37PT5Yqyi/hyxMQ8PHtz5O3rt8UMXSdOtivy9
 0tRMYjOPewVigRl6ANWs8MRpH7E4lUJkVrUJ3G+D5yt/osBwqO9w0IAOcMi1MYAa5CfVcyI9Au4
 iXAvziD0y56+mxTqLbUyzNszmD/rFGll2igF2WHpUBWvX4tm8jkYNU82HA8Y/fVXCPWYr4Tc13a
 Umhq4kfraEIphtZQPQTDXhXPMVeIpODMiMyH5E99WyWsVlbIgAKVjpvcAQ/QmM+EDEo+6oRKVdx
 0r8JolQXe8R3Ozv00UDjn96jw3ihBH422e2Aiy961AdqUxSlaGjyjevFIrRyuct3cI3L/RQoy4Z
 AJaQrcxP2DV/UlrCtGcPV9KdtR2vGlMMt4dCCTetXGHCQnPnNsLSymoMmZFuCZ4xaHZz/keOD6o
 E5bpjn1GHfCKlkg==
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
Louis Chauvet (5):
      lib/monitor_edids: Add helper functions for using monitor_edid objects
      lib/monitor_edids: Add helper to get an EDID by its name
      lib/monitor_edids: Add helper to print all available EDID names
      lib/monitor_edids: Fix missing names in some monitor EDID
      lib/monitor_edids: Add new EDID for HDMI 4k

 lib/monitor_edids/dp_edids.h             |  3 ++
 lib/monitor_edids/hdmi_edids.h           | 27 ++++++++--
 lib/monitor_edids/monitor_edids_helper.c | 92 +++++++++++++++++++++++++++++++-
 lib/monitor_edids/monitor_edids_helper.h |  8 +++
 4 files changed, 125 insertions(+), 5 deletions(-)
---
base-commit: 6221c94b3ce827206b26db6fd5ef36871385e6cd
change-id: 20240828-b4-cv3-02-monitor-edids-59a8f515c881

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

