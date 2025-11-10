Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93771CD13D3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD0A10E3BA;
	Mon, 10 Nov 2025 13:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JseZylXT";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4543210E3C9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 392401A19A7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 04491606F5;
 Mon, 10 Nov 2025 13:40:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0DA9910371921; Mon, 10 Nov 2025 14:40:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NYcfeBVwfiir9MaBCw4QQDAAmOnInfMpIgfyrA7cah4=;
 b=JseZylXTmqcsXXEUyWxJpwJ8AMykJoWvtH+FsPu4FhiACzJ/MmU2sdg123QDIGMCCLYiL8
 /xFN/DEotwEeQI+RgoJ35RbT+rO1AdEViFBR7hAHWI9g5htkmLiAaFE9dweSGQ65xXwEp8
 gjvWt9m1htjPQPvykinnv28oSxN339lMC1ItsOACIZVaOyevGC/zLUmXtq4yEjD7/K2zTy
 7//bkPaMNPfzjgg0YUPGrMaOEBRGsNPaNsxLFx91lmXVHDCMSWf4LJ6fhk5KqGYkjGBYBq
 FWH/+MHRCKlQ3AXyrKEoCAmjLNrKsIT2Z97Zgm5gP1cto5jaxtcY4bNA0FPC0g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:47 +0000
Subject: [PATCH i-g-t v4 45/46] lib/unigraf: Add helpers to get the current
 LT status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-45-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=TIoWGzKYP2CUP66TQH07bxu2Hofnsr0Bto9BshXVFSg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesU1NoszjlId0uKvUg+EB3kSWfYcsx+ASrEI
 PW7R+JIPeOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrFAAKCRAgrS7GWxAs
 4vTWD/4nlTMu9QssNHc6u8GUxBD1putQRSLbzgPWhDiIOQbDzUg15DQa9+4feherNaZo8HBKs3W
 SRXtaYvdnJz7v/7mcnSUi8sPe9+3eFCGlFn4HkW2Dz2VhsaxaS9MgY+Mb930wHfFsiiA5UdVInf
 yMSv/ZdZiWtQ5IyDR3gALAFWNJ5Ys0xQM3scBelO+TF3swL92pX3BxJiFzpk1tHgCj1XJ2eu37l
 uA9UkGRxw5SyuoU0dsLaZtMHrEdgR9JQWVdcG5jkNysVsLzg81KAiKc0WLyTeOfcskCGKfsBsM2
 P0ykrJWdEdEVjB9Un7Gdx0G3JW41Ayjgrc9mOL6oNfBraJqgg1BhLtg9EDMKTGJjhVi3srCFxGe
 qROZoyce6XwMeqIOzuJBEOogGCY6K89PRgIemrc/NU8NpBnKCYqy0WuWf+i7aqzeVOIkopCJLJO
 c+cnbvY0YyvhypHIYjAyaWOgkXSnQ4f4MaAYclHDsQ2CNCUeecfJ0u8eJcWroUc4BBEJxVGU8JP
 /v/8fYGj/6TwQ/MOxa3Eaj2xvfq9fxoHDj43Fi8ylVh9ArbCAwAKij7Vg9wA1Zr9DUdLJRrMtnL
 6O17doUvMh/cbPytuTMAkZaLWWzxhECqCgLdws/fvOjYHN68zZZVoIzDtXzMcA/Nf3r85WAtAQf
 dZpEf5WoDXbM+rQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

To ensure that the link training was correct, grab actual link
training status from unigraf.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 10 ++++++++++
 lib/unigraf/unigraf.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index f1d6d809e216..a8a42953bdf3 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -718,6 +718,16 @@ int unigraf_get_max_lane_count(void)
 	return max_lanes;
 }
 
+uint32_t unigraf_get_lt_rate(void)
+{
+	return unigraf_read_u32(TSI_DPRX_LT_RATE_R);
+}
+
+uint32_t unigraf_get_lt_lane_count(void)
+{
+	return unigraf_read_u32(TSI_DPRX_LT_LANE_COUNT_R);
+}
+
 void unigraf_set_max_link_rate(int bandwidth)
 {
 	unigraf_write_u32(TSI_DPRX_MAX_LINK_RATE, bandwidth);
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 721fd025924e..3b94eb9aca29 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -251,4 +251,7 @@ int unigraf_get_max_link_rate(void);
  */
 int unigraf_rate_to_kbs(enum unigraf_rate rate);
 
+uint32_t unigraf_get_lt_rate(void);
+uint32_t unigraf_get_lt_lane_count(void);
+
 #endif // UNIGRAF_H

-- 
2.51.0

