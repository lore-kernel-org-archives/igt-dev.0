Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFDFE69175
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C8610EBEC;
	Fri, 22 Nov 2024 15:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fEtacWkN";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F9F10EBEA
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:51:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1458A2000E;
 Fri, 22 Nov 2024 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732290703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mU6BxLdc7jwFnoXgg19gOKdToOdU+RtKhAMum3AlcU=;
 b=fEtacWkNiIG4MK6a+IP66h3WCGeEXf/f9HHrib4LJ0+iyIeFTjCLqzduD8nIgcms5vZAEM
 EQaRxPZxorQsoH6uwpXDq/w4WRkdjYcpnT0zhG3JuEJpzJeQzrpQaS657GiKmcTQij7FaM
 vz63sPrBLOnCPPoQG5qEp1hm1sw70DaaMWHpEXuUrnYP1DECrwEQfjPczwFAKmFSbAy8rm
 JNgqngQoi9Sk7MSDGLzWWmBKXXsWnrlpeUvTLssOjPR6yZORgqbt0tLN1fnP3B/ashpinv
 r44J4uHrjVFtOg3kcN6ygAorIO21y+Y+d1cBSNvdnUiUUcht3OVkKXMjNP+rQw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 16:51:37 +0100
Subject: [PATCH i-g-t v3 4/5] lib/monitor_edids: Fix missing names in some
 monitor EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-cv3-02-monitor-edids-v3-4-1798f58167ef@bootlin.com>
References: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
In-Reply-To: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=NzU/gWweyT5tbxX0Bc3Z0Rk6ufN0pPj094fp1NhwZVY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKiKMzprfdWiagn4hpQi0DCGfkrkjcFJRSr9s
 HC3K3RyJ2aJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CoigAKCRAgrS7GWxAs
 4gGaD/9lQ+c4ZFQ3whEuXKxlby2xGe2OOs8OrLA5BqBSzmkTESSbWUJkyjxhjQhcWyvoEZO6UBi
 Zk5mRPl+BX5T6MytIkbKakFVfjZjR6OaRMSKIkXlp8xs2dhUgD11lMfVesMWsNDZtiAM5tmaPK5
 MsH4tBQh+TJ1ndmotChZaQfp1gSUmqHfMztBEz1pCq33PXCjuijE+4+0QJekWBJkDg+XlTbehLO
 f1fv1yRnepmZpTJ9nCbSbo/32gn6hr1qeymR79+fFglUC6y87NNlvf1bRurEqVm4CYVc9vmGWO9
 At8h557SpEta57N0Q24soIc3omoFm5bb3YQhrXXSCatPNhruJPnubUW+vnItk+LmmcGNwy7hStP
 ZLgh5L2QJU3Vq9ygB7Mu+iFjHFKaE6kvtqZj4NfzXm9FAmhSegp7uAPtBuLFArqeLafeHiZismB
 rWNsHGvORy2RHxzSuqw+lLizenJphYYPbeGSw9sOO7qVJhturCL29wlwsao60pHfw1KfgTpaHo3
 4ckeC21YJ4TwN8Rh+BdxK2GWpg66wNXR4B0CrhpiByRKFa5Rm5iF/G3/vBDMCpeRX8uaIVCua4s
 8zTel7b6Ut9a2TDQrAQaQa/kMbR9ejoDsH+LASWR+cG08J2BgSqvPMVyTsmKQ4cB0KPED+MQl5v
 NeIK0maKhJ9ylMQ==
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

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/hdmi_edids.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 23ac04d94b6f672572e34b8059ff1b47d0730839..3ff331e9f7c2a48858359ca41f4aec1f7ec8204d 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -242,7 +242,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "33333633493056465320000000fc0044"
 		  "454c4c20323430354650570a000000fd"
 		  "00384c1e5111000a20202020202000e9" },
-	{ .name = "`",
+	{ .name = "DEL_DELL_2407WFP_HDMI",
 	  .edid = "00ffffffffffff0010ac17a053575930"
 		  "0511010380342178eeee91a3544c9926"
 		  "0f5054a54b008180a940714fb3000101"
@@ -431,7 +431,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "60350000003200001c011d8018711c16"
 		  "20582c2500c48e2100009e0000000000"
 		  "0000000000000000000000000000000a" },
-	{ .name = "",
+	{ .name = "GSM_50294_M3704C_HDMI",
 	  .edid = "00ffffffffffff001e6d76c401010101"
 		  "2514010380522e78eaac27a355499b25"
 		  "10474aa1080081807140614045403140"
@@ -483,7 +483,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "5011000a202020202020000000fc0048"
 		  "50205a5232343430770a2020000000ff"
 		  "00434e34333132303836580a2020007f" },
-	{ .name = "",
+	{ .name = "HWP_10582_HP_ZR2440w_HDMI",
 	  .edid = "00ffffffffffff0022f0562901010101"
 		  "0b170103803420782afc81a4554d9d25"
 		  "125054210800d1c081c0814081809500"

-- 
2.47.0

