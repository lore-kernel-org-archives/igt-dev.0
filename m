Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1686C636ED
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 17:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473D910E499;
	Wed, 28 Aug 2024 17:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cPHjBjlH";
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A739010E384
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 17:27:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9F44240009;
 Wed, 28 Aug 2024 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724866024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fD1OXzu3/mObBGIQJjcmILoxosKOK3Nx42x67b5s+XM=;
 b=cPHjBjlHojT+nT9xOE2y1DnUITqQbe/xFH3qN5rdpfHx9+C2XdWvcoebw14WdQmn2wSi34
 c7Ea7MFBdNV7Gpm+FMKk39Tc4V1RVanljsCLGPlF/UF67OT8sbjhIxke1gHSMQlqj679Xa
 yfo1SUkjp09oUBQUkCyIK8moO/ik9g5rx1/MV4xVXtOa68eWoR7MIFICrf4Cxbu2RF+abB
 daVvktspy//t8/AxmrlkKpzRJinQjGQDsJuAfMt2gvaW9QiGRpyGcTzdXzhm7H6sp2lJNn
 b9iCIk91iIiBDYm+Tu+BKSnVOGkGaq+ffkh5BV56mPHYICFptBNM5xmUhEBKgw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Aug 2024 19:26:38 +0200
Subject: [PATCH i-g-t 4/5] lib/monitor_edids: Fix missing names in some
 monitor EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-b4-cv3-02-monitor-edids-v1-4-29c846bcf251@bootlin.com>
References: <20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com>
In-Reply-To: <20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=aZiJ4OURHKoQiaNRRMc7VzrXBjvrN3YO4SIG9ZsKFwg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmz13k2kPFwY7clxSDgnOGpTjjCz69yDKmfKdQO
 9NibE7As+uJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs9d5AAKCRAgrS7GWxAs
 4vc/D/4+iBM7hYH1qOTZRBKtUxnba4PfpNXkLfmlnN2ImVLiDyGSLU6VDYPq9m+39KEFij25OxK
 +ok+IEULCa85BPNKgt5zOTzgtcnrKyqajAlxJt3hLp+kPis2Xb2FOpm/94WCiJBve8wGW0eYFsg
 hd2HV1Wt0fDqyTEMV+nvi9dn/XRzswjWvvcsPHVji63MCt2hk53Ud/2Tho3N99UkmcqUqqGr+Rz
 vpaWPB+QentlEf1eBNQmWd8Kuzi3HbS91eRebIUuVNg7WWxIxSNrJCmXNnejTzJ+KDRAoIj5EXF
 bhipHGSuKoyIcP6gcVDbXK2HmkIjFmTQh0UWFg2xNiWvQGRFcbFRUkCUiwk3wSVKxKM2rYnkEgZ
 2pYDMvoR1wUwKtQMwpYTnPkdf7P7VlqQHsXz8LPbCbeJwt1v2TOp/U5hSnkpLzb2s1kvHrdhbcD
 wT07JbYPn2QkNyo5nlbzN+8DKlyqfsVKOcXfvmRXKBFWLi41Zct0dvAqDu7tHUpWXY+PSB896t/
 uTso5g9UTA0H9rvDDxYY0IlwoHaO8lymKM0C3/z0QSaW/usCwmzyoZ4Z6myWlFyF9cXsTnJuNPc
 UqcKH6g9bZUUgWM8jI1Ph7AkVKVQnw8wBPFgcSoYZppXk4w1x+4uOlGfGIveh/ZTvl1fXVLnmBC
 s7KkgRvoMkoa0JA==
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
2.44.2

