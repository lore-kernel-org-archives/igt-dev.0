Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AC8C83F38
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D7F10E0B7;
	Thu, 17 Jul 2025 18:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FXuD+CSl";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8A910E0B7
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0617441C4;
 Thu, 17 Jul 2025 18:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tD2ouJRA1LIRZbRQKRjhNjIEsukHEfDGkTe8pjyLlWQ=;
 b=FXuD+CSlWGf6IYlOR5jyjx182pEaREeTCqYXwOoid6uYEBJT30zyu2wli8DtOszO+O9rY4
 /yFD4VTBxEypSZ5MhWWDHpxHnOQTHVkoG5wUxZ+1m0DIfLgElCMPHV5ChSN05C6tjFcsrE
 dOm43hZ2glK2gK5HUuI+hS+KB2xpxVGNqAzkw6FfkX6kaEfXtFsLowBPv3VaoUTgFoWOCg
 pZ3deQ0NizdqaqMDct7O1p94NV51Li1PDkYfb3ubyKOVH9VyuyzgtHIwST38sCsP4a6Pvn
 +Vp/pGJ6YKyYHQa4jVECSmmyC6lnpztxar6pu4dcVHMvAYO8qrxaUlEFd59/Gw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v2 00/26] Unigraf integration
Date: Thu, 17 Jul 2025 20:46:20 +0200
Message-Id: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP1EeWgC/22NywrCMBBFf6XM2pFM0lBw5X9IFzWZtgOaSBKLU
 vrvhqzd3TOPc3fInIQzXLodEm+SJYYK+tSBW6ewMIqvDFppq3pt8R1kSdOMEgrXUOo9ErE3Rg3
 Wegv185V4lk+z3kBwwQJjHa+SS0zf1rVRWzatpeGvdiMkVH0/Oa/JGO+v9xjLQ8LZxSeMx3H8A
 KO/Av2/AAAA
X-Change-ID: 20250425-unigraf-integration-11ed330755d5
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5050;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=oDb6Eix5FmSDEWx//y10taaTMLcVmeTYBKWErADlPg0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUGj3wR/nM2XbsmnRyaczO7BtuicVZGQHuv8
 hRO7cio6W2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFBgAKCRAgrS7GWxAs
 4lmkD/95QwCWHt+K1TxH16pJBVIFG8tFUzKqRBCbCdEy498Fj4ulgYoiVhpZ0GQ0aMAIycnd4lx
 uhkjTuyyNQd8d7P+aPUn+9VCUx1K6FK8XJWh39Sk8l27LNIGZFZwLPH7apif3mp60QF69rs9x7d
 pP1uDKlsCSaTIg43zl5oYYAOaIszHgHbpD+rzTHQM6DlgKBs9rHW9ZfU5YeE8ASUA6kTYnaU9gS
 LydJ7pz34+2Xm4nlbN9O/f54rC8rNwbu3uTni2HupMt96PRHDmEPscFu1lGKft6h4UEYca88HCs
 aYM9801TI4GN8nVW7nWtWTJQNDi347NXyzsO/TS97OHrn5sbhzz1wWZ0bg80YNmG+6/cMg0LNCN
 GmU18cARzgBMLLGkhMma0KIUHlzxrsajOql/n7bi1n+e2cMyoVWMprdmKN8yBuyJ1Hc8RNOSLXK
 fp+FGzNDF6OZgbUbNxbtokCqRLaJqzVpF/YdW72VamtU64vebtXCn/hrAuZ/ET0W/2rYJkrBqvR
 bKoMs5AWXIF4TCPO5lQQlVwQu6LADP4NltK2g1MnZ9ircNtE8l5zrTOZne/ztBTPiNyv7zIOscl
 e5KWuD1t+OBGr5BXyj6hcYa4792+iBbcy5ZX8ku14yog49lyD3GGykDF9EJhbD35LN+RtGxicmB
 jVP6GLXkpO67yyw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejleduffeikeefkeejvdejffffueevfeeigefhiefhudegkefhjeejvefhvdefjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdeijegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehighhtqdguvghvsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghrkhdrhigrtghouhgssehgohhoghhlvgdrtghomh
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

Hi everyone,

I am excited to share I currently have access to a Unigraf device,
which I believe could significantly enhance the capabilities within IGT.
This device has the potential to enable testing of low-level hardware
features that are currently not covered. Specifically, Unigraf devices can
assist in testing link training, signal integrity, HDCP, DSC, and more.

It's important to note that the Unigraf SDK is not open-source, and the
communication protocol with the device is proprietary. As a result, I have
utilized the libTSI.so library, which can be downloaded from [1]. In this
RFC, I have not used the official TSI_types.h header because it was
incompatible with C, so I hardcoded some necessary values. The next
iteration will use the official TSI_types.h (they plan to fix it for the
next release).

This RFC is intentionally concise to gather initial feedback from the
community regarding the integration of a proprietary device into the test
suite. I plan to expand on this work by adding more features and pushing
the developments upstream.

I have also started to work on MST testing (hotplug, link training, 
bandwith limitation), but I have a big issue: connector detection is very 
strange when changing MST configurat (MST->SST, sink count...).

If I use the Unigraf GUI or my own C script outside IGT, everything seems 
fine: `watch -n0 modetest -c` update connector status almost immediatly 
after a HDP pulse, never hang and always have the correct result.

But if I do the same in IGT (same script in igt_main), igt have too 
much/not all connectors, and some of them are broken (no EDID property 
for example). I tried to run `watch -n0 modetest -c` in parallel, but 
modetest can:
- hang
- only update once igt test is finished.

Do you have any hint about something I missed in IGT to properly enumerate 
connectors? I tried close/open the DRM device, added a lot of delay 
everywhere, emulate plug/unplug... I used kms_wait_for_new_connectors (in 
this series) and for_each_connected_output to get list the connectors.

Looking forward to your thoughts and suggestions!

Thanks,
Louis Chauvet

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v2:
- Splitted in many commits
- Add CRC support
- Link to v1: https://lore.kernel.org/r/20250517-unigraf-integration-v1-1-044acd2133dd@bootlin.com

---
Louis Chauvet (26):
      lib/igt_kms: Add a detect timeout value
      lib/igt_kms: Add helper to wait for a specific status on a connector
      lib/igt_kms: Add function to list connected connectors
      lib/igt_kms: Add helper to obtain a connector by its name or MST path
      lib/igt_kms: Add helper to wait for new connectors
      lib/monitor_edids: Add helper functions for using monitor_edid objects
      lib/monitor_edids: Add helper to get an EDID by its name
      lib/monitor_edids: Add helper to print all available EDID names
      [DO NOT MERGE] lib/unigraf: Add used defines for TSI_Types
      lib/unigraf: Add TSI.h
      lib/unigraf: Initial Unigraf support
      lib/igt_kms: Automatically connect unigraf on display require
      lib/unigraf: Introduce device configuration
      lib/unigraf: Introduce role configuration
      lib/unigraf: Introduce input configuration
      lib/unigraf: Add unigraf assert and deassert helpers
      lib/unigraf: Add plug/unplug helpers
      lib/unigraf: Allows sst/mst configuration
      lib/unigraf: Add helpers to read and write edid
      lib/unigraf: Add connector configuration
      lib/unigraf: Add connector autodetection
      lib/unigraf: Add edid configuration
      tests/unigraf: Add basic unigraf tests
      lib/unigraf: Add unigraf CRC grab
      lib/unigraf: Add configuration for CRC usage
      lib/igt_pipe_crc: Add ungiraf crc calculation

 lib/igt_core.c                           |   4 +
 lib/igt_kms.c                            | 346 ++++++++++++++++++++
 lib/igt_kms.h                            |  23 ++
 lib/igt_pipe_crc.c                       |  22 ++
 lib/meson.build                          |  10 +
 lib/monitor_edids/dp_edids.h             |   3 +
 lib/monitor_edids/hdmi_edids.h           |   3 +
 lib/monitor_edids/monitor_edids_helper.c | 127 ++++++++
 lib/monitor_edids/monitor_edids_helper.h |  10 +-
 lib/unigraf/TSI.h                        | 227 +++++++++++++
 lib/unigraf/TSI_types.h                  |  44 +++
 lib/unigraf/unigraf.c                    | 530 +++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h                    | 168 ++++++++++
 meson.build                              |  14 +
 tests/meson.build                        |   4 +
 tests/unigraf/meson.build                |  12 +
 tests/unigraf/unigraf_connectivity.c     | 126 ++++++++
 17 files changed, 1672 insertions(+), 1 deletion(-)
---
base-commit: b4e1ccd32037008012d5c41ac6bb04da22082302
change-id: 20250425-unigraf-integration-11ed330755d5

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

