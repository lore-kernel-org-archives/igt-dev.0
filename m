Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85144D2C548
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 12:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B12910E319;
	Tue, 22 Oct 2024 12:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FLx8gIUW";
	dkim-atps=neutral
X-Greylist: delayed 8684 seconds by postgrey-1.36 at gabe;
 Tue, 22 Oct 2024 12:53:26 UTC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C8D10E319
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 12:53:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 370EA60005;
 Tue, 22 Oct 2024 12:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729601604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zq+Jsfhseebr+44M9w+OcmuvSPeNar/ampnuvv3ueuo=;
 b=FLx8gIUWNwaojDAD6NLkMs1t+4LwRh5tK8cgJNsaKnhPchqM8BdeSF/mc73fNhn83Ze7SW
 fTIs32n4VZyiiKCwWDjB9CM+beP1aEAVy/6gAZ3YkbzeFSHpjXrB+59oGUHf81yeR7i2e7
 cQunhcU4i3BXnn/BJa1J2ix0d7HE3FNUBwrxqSOa4Fpe2I4/hugLVioR6+ZdVWv0wJhPkm
 gCgoCC5WwsCRNxPgR/L42WBF2FYrQEPwTrVqFHeAZRxMJa08u587g7ercwLlScMj5QrDfo
 luvXzJLs1IYvvIS+lgLoeeh7Sf5xZWlFHDqlp2uiXejrTXLflQDJxjdfGcosng==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v2 0/5] lib/igt_kms: Helpers for monitor edid managment
Date: Tue, 22 Oct 2024 14:53:09 +0200
Message-Id: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADWgF2cC/4WPwU4EIRBEf2XC2VbohQmzJ//D7AEYZrajwAo40
 Wz2321H48GLx+pK1au+ihYrxSaOw1XUuFGjklng3SDC2eU1As2sBUrU0qIFryFsB5AIqWTqpUK
 caW5gJmcXo0ywVglOX2pc6H1vfhIEK3Rx4vOZGmc+dt6mdvPf6k2BBJyC1aMPCxr16EvpL5TvQ
 0nidPum1fj6xvP7D9K7FoH9RP04lEor5YfkWo/1a12Krbn9Of6V+Uoi/vIV0NrhOTEZmWyX0eh
 x0t6owx/y7RMIFNtlQAEAAA==
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=a5bMofV7qbNy+7VLM7WRoMvRfHHDquNGB9xY+lMNmxI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF6BBzICU+S+Havu9kO5b3+ZhY5oKX7kAGwe+e
 os11MSL836JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxegQQAKCRAgrS7GWxAs
 4sV/D/44DpA4eSxqW5i+GZgXg2PFtx8ppeo4QKs/jF5IKxhjYZXceT7wlCzJNSbhNxlxggWTFzq
 uIjo/QzdWTRpPI6m8svneAjX6qzOn27IP59j5S8Tg222MVkxLKZTZ3M/0Ax6obZCInD4xBFK4r1
 /TGOvYyj1d2FByFOzv0U+v86fhryJehdMVS59I/fY6SXCYOwp3wc8c7sICG6/4uN4pH9nznitV0
 VNkztlTpB/51j6j2eNbtWYZFleO5kECRrx8WwKFflDUflJL3kr8Si/t0gIgcgLELwubmDC4vkdj
 xgjTgikvV7bYE8fu79te45n2fsOxIb7u+/HYNjnyOhT0Fxv2Eaq/4NWe2i0Kc7CCsoNPBAhlrBf
 7G8UMmaOQZN0/AOA0Zez5M3q0lTKH+VCPdVktwtgXDvpMjlASRfkaWFM6iTe3YTB3rdtk+EVXio
 L4eFmfQbGz4a4SoBeBX5iQhwdunQf9xpWFVYwgMoArFLfZyG987XJ/FdLzaLeUgGryxsF+ZXPGD
 tfXbyfVDhpm6Z/n1Ye+LyPU4Ojy+HP2ahgYmN2ovzVj792/z2wgq3y4wyTcKC+23+TPaOdhKqIV
 gsHaEAyRbxpSmGo6l7lG4NlHvUW8xCbR26i7XRf3XYYtZTXWHoQibx4abm2mSq3fifgGGj1c5aP
 4nnx3pIjPP5JfEA==
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

 lib/monitor_edids/dp_edids.h             |  3 ++
 lib/monitor_edids/hdmi_edids.h           | 27 ++++++++--
 lib/monitor_edids/monitor_edids_helper.c | 92 +++++++++++++++++++++++++++++++-
 lib/monitor_edids/monitor_edids_helper.h |  8 +++
 4 files changed, 125 insertions(+), 5 deletions(-)
---
base-commit: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4
change-id: 20240828-b4-cv3-02-monitor-edids-59a8f515c881
prerequisite-message-id: 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
prerequisite-patch-id: 0562bbe57a0b489e7f46a51717c54ea26296cb8c
prerequisite-patch-id: a16d6fdd238eab5a91630d0934c9186669406fc7
prerequisite-patch-id: c7fcc64d709f283da748a0f9bbe3bd6143d76300
prerequisite-patch-id: 09fc5e2f569fa8287e767ceb353bc0a0f94ae2e1
prerequisite-patch-id: 63cf2f6323333bb8cbd0dbbd883b5c9fe373dea1

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

