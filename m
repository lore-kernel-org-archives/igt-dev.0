Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189FDD2C54B
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 12:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC0A10E682;
	Tue, 22 Oct 2024 12:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZGkcCiNT";
	dkim-atps=neutral
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40BA10E67E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 12:53:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D31C56000D;
 Tue, 22 Oct 2024 12:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729601607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9qFf3Ick05gHQUG+nuZlQkLIl6vWI1DXcIAef1Va6k=;
 b=ZGkcCiNTmDRwePx1d/6qO2F93pGnBTWKcEviK85V5dKkWfYDxVw7KRT1aLtCFPXglJf+U/
 x0wnPBFB765lXLg39lTMPD2oWMSp/vvya9tNZBb0bYYQ+jJgDKZ6jVk1MlHv6NQ6mAxMV/
 3Rcu1fl9y7QCygTcDsg6QIKvrAlvITn7k7ExUNcU9KbK7XP2svl6ZxQbQ67MJcCFV5ABaG
 B59NfuFH+VPxBiASSa4i/TmXIb+Rq4TZbU0kf112aDSWxOGWoBSp2lp1/KHIouKToJt2lg
 N94Ak+gQGJQ43Nyy948ALCt7Ye+RKjuLHZ6hxJNlz8ynYXjIKEeUPphldForrQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 14:53:13 +0200
Subject: [PATCH i-g-t v2 4/5] lib/monitor_edids: Fix missing names in some
 monitor EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-02-monitor-edids-v2-4-7634786c21e6@bootlin.com>
References: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
In-Reply-To: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=c2Q+H4BXjR26e5k4WbZAPmvOShAm4mYHXlcXhhkeTZI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF6BCqGe/uvtGAfxL+X0vCNmaBz/VZFlEyozTK
 GM+v0dK1yuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxegQgAKCRAgrS7GWxAs
 4qERD/4pdnsHkBBWm4CB00mHGhzmVDLCJaP2sKOjSeNTZnTERGacGR3lHwRQSaL3icwTv7C1O8i
 YMBg0sO5PEvzJ1sC6SWjrhDIhB+3UlH0iC8BCEHZFK671onipYQ67BouD+C/p9o+H7pppEnYm8U
 FtSNhQRSyA/TLUnZmgYG01rB88HmIuX7orO8THRHoeNx2sW04bbNLJWln5TB5v5rmYlzq7nf3Ay
 GpDOXMdc0J/gDdlEB8AtrQ5MleYlZ6967b7UeCHLcXRlJu1Em78kMyyt34tr4OVAR7r9ea0Ll6k
 fqQ3CQvB6dXkAUltSkju+nakKYqPLCK6INgDKvDFQTT0o7idDeXXqzuP/WLpR0oGmVI/SI3uOqJ
 c3SI8hUG1Cb6s0XFT+cZ6Rgruywlyl5FhikMYImY6MjJHOlCdBnOv+RHiZTDoQK33CYSDLx/8Te
 yiBe0I4Oj/dIOop2x9VQBPWwK4vy84qqkFLSZwcey7gQIKhZ/k2fJURC5TAguaDT1P5dsWWKrvf
 YV4g72wi1erdmjoC/vM/TyGxKw2ZEUDjLj9SZfYhLhFx7psXupybmqGK3DV8rOSjZ3BBxXDFt8E
 6Z35UACC55kvbFx8gvgTyRTBpQNTfl+Gut6DA8T9k5EuqFXxWXw3JVJy/K2MvpRhEJyGvEdRNbF
 kobrtu6K30rYOdQ==
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

Some HDMI EDID did not have a good name identifier. Add one to avoid
confusion.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/hdmi_edids.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 573e2149d5d3..8bcd1f31b458 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -241,7 +241,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "33333633493056465320000000fc0044"
 		  "454c4c20323430354650570a000000fd"
 		  "00384c1e5111000a20202020202000e9" },
-	{ .name = "`",
+	{ .name = "DEL_DELL_2407WFP_HDMI",
 	  .edid = "00ffffffffffff0010ac17a053575930"
 		  "0511010380342178eeee91a3544c9926"
 		  "0f5054a54b008180a940714fb3000101"
@@ -438,7 +438,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "60350000003200001c011d8018711c16"
 		  "20582c2500c48e2100009e0000000000"
 		  "0000000000000000000000000000000a" },
-	{ .name = "",
+	{ .name = "GSM_50294_M3704C_HDMI",
 	  .edid = "00ffffffffffff001e6d76c401010101"
 		  "2514010380522e78eaac27a355499b25"
 		  "10474aa1080081807140614045403140"
@@ -490,7 +490,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "5011000a202020202020000000fc0048"
 		  "50205a5232343430770a2020000000ff"
 		  "00434e34333132303836580a2020007f" },
-	{ .name = "",
+	{ .name = "HWP_10582_HP_ZR2440w_HDMI",
 	  .edid = "00ffffffffffff0022f0562901010101"
 		  "0b170103803420782afc81a4554d9d25"
 		  "125054210800d1c081c0814081809500"

-- 
2.46.2

