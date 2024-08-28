Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB69CC5B548
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785D910E543;
	Wed, 28 Aug 2024 14:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iG2/j29i";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6E610E546
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:31:58 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 3CC2DC821B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:31:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28EC3C0002;
 Wed, 28 Aug 2024 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724855515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qkeS9xrTUR454cTTCwPIU3N2eqOcQZ+8Aa12V/H206M=;
 b=iG2/j29iG/JINOsUU1ux5ElVPqDe2lz8Fj1q4FMcWDTmzYoozptu9vKTHvprXJuqOlZ9Ut
 jHjDKBVhGs5Pbcs6ECJK5yqeU3bs+yj0dKhEFUquoEkuM4cIeWJRrrxseojG7OWckfP7dU
 mB32eFaYPJUdaHhrQaXtkOHfnlTK1rmXHSLOrg4bDUjviUrPK5eXPHoTvIIE8xIb+vRRKk
 Lm/lFtsLBi2WoGt/urCxykc+YPyAfEBWnPgc+Oep1KiP8lT0SFy9MiEfU6ShiI071LPMA3
 8cQJ49EtZ/x3px1VrzgHzVPBAUCpvTRfKwQLFU4e/FTZlCHEMvF076MwlMelzQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t 0/5] lib/igt_kms: Helpers for connector managment
Date: Wed, 28 Aug 2024 16:31:49 +0200
Message-Id: <20240828-b4-cv3-01-igt-kms-v1-0-d6e21b1e5d04@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANU0z2YC/x3MOwqAMBBF0a3I1D6IMYq4FbGIcYyD+CEREcS9G
 yxPce9DkYNwpDZ7KPAlUfYtocgzcrPdPEPGZNJKG9XoBoOBu0qoAuJPLGtEyZWdamucqphSdwS
 e5P6fHQk8Turf9wNIGqxOagAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=fAPM4L2gxtE/uSu0Cz2VzzdF0igEOYSWpUWXQbkUNI8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzzTZNXzpuTOjdj82tN9R/dTe+TrildwFGYUxl
 iPcnWyhk2GJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs802QAKCRAgrS7GWxAs
 4sHeEACYwTQR1ySKASktBR4jrZnd/x9uFcQcvApDgLx7Ert1C5MglDU17N8coKWM3qg2skEl94e
 WI5qYD3H8cmJjBzQigZVrBuhsAQYWiwORh3ANx6LRaul0p0aV51SVWgITdwCFInHl+WosqZmCV1
 gk4LlUTht15xWBXL+ctBWdYADqolpv47B3Y5PaxVyNGobncxtUQpA8izdX3irx972WdvASLFOmG
 U5ui9HzG9JLqbdvXBjeokRtxccVhdQ/Sg8mT58bMhVZAXIKoi/4Xjhb4oEjnTZlPtAB2qmpSguW
 8NamqJ/7crvrxUnZMv31R/y0Xvk8bngo56hFdkWPtPN5+LWSBW3X8QPZh2UXekSRpagzMprkPSO
 aMrGyGK2ipFWWYNqvZtAufabAHXqrGbDHa56GTHRpW+x9oQmdneJ7Lpf4YNm+dyUtzYGc2xemPB
 c9lOsSRqge54LP8nAoxrmeTvx/urruf6taEIZ3bGfA9bbbRBNeqMUPuRqOyeEhn8Lml7X0G6RyB
 TA2xbFFvU/1uk2HbhGkV0xrHlc/+ae9y/XP0qtuu/paCy1QYtnkel1DJs0Ku32ykvUcDFCaP5bZ
 PCyt6YFfVrQlgJFq8i9nJ5LF7HFLnJLYjA2Vofdu8v85OSIelG5IrQnVhiTNp3oZd6eb4St6gR0
 kJdN11GyXuK+Kvw==
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
base-commit: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d
change-id: 20240828-b4-cv3-01-igt-kms-3e5af6a4c05e

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

