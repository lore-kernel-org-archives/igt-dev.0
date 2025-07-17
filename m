Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B38AC83F34
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C335110E15A;
	Thu, 17 Jul 2025 18:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jaViNi/R";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE55010E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83C89442A9;
 Thu, 17 Jul 2025 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5ab6Edczrqfil2mkk7oS1UNXPEMl6IlS86/B9AU+aU=;
 b=jaViNi/RihusX4NRPX7WBJy7EgQwm4scIxPYLRvCBb5aei2q1FruZzzQK950m4z6dOH491
 ou/Da6nsCTRW4D65dO32CZdfJQ32bAPKC/oUJJjstsCAHUm67phJE307EiUTh3z13yrCd2
 2CU6Eh+dmT7UZw+TcrR39JET6yD0nT/fubvFVt+yO91r13QcHes2yjXNUclZStOBgZm3Zv
 6yNtVPhVsKDDFnKs9QJ6KKjbgv5/0NaDDjcOHilv8U6T0YZvPPGl1BOKkXvVDhP86zAxHV
 O40ycjO6cTj38NhX5IcbYM5dyYOvopee3rfTqWpAsvEwFu+fmsvl627ohCd2Tg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:37 +0200
Subject: [PATCH i-g-t v2 17/26] lib/unigraf: Add plug/unplug helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-17-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=arZGxUyehIHkdqMB6vZOsoj1e7xR3ybw6JX0wtUADQI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUMPkW5KeTgh6NhdjBa5OTQYKkzDZcSii4cE
 yrYhv8tNG+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFDAAKCRAgrS7GWxAs
 4ohwEACeMgV0K8G3OBcB7uzOeYmbJ8V2H0vH73GGCUNwc/GYNJFgHDbgL4e5yEaueIv0ERtErWt
 6UcK6QDV45yAAaCskJXiuUt/v+F6EL8eLL078sb5eANLM6Hg1s17uj03mjYgYakg80dM8Mobz9Y
 m7H5RYZLYgF/Vht2Y2DGeXufEaZ7YanrWUS2ah4TUeJtFzJg8DTiPpkCx+mqCZiFM/vLf3rS+rx
 xIAuUIm08OEWw1izCdpKssLEBVE4oLI7mdbgaWWI79AyHEZr6fnG5GGhp+imSgFXdF47g0VyXUG
 KjOVGwIpU3BUOrZEEFaxMIMPLled6fIF8qfsjPh5BVkPSLYsX0oujNCxM2P45kOGQ1ZxVXK1nHR
 pxI2xF17GhHG7P1msyXDInr2ka5MHg7uGPGN57QpQoipooOfnoYrGTb2bEwxU0oKy0FWFA7yByK
 53Y0druWdaoXiJEhpNKoXlU6QqXiYRqD85pOkYwcK3rYgYe5SSjaLWKJSOUFyaErxTWermnP3M2
 ObBTy1afaI/E0k9GeW7ZElGlIN++CVdCA93fPybsnw6onzo0Esq5hrjWJ4mJ3x+07ORCSTJkO5i
 1gG9DPOYI02aaEan2kHvYj5RiODA8KBJqzBmn7wUO6miUg1M1hM8za90ZpH76XmwY0hmqAGsujG
 DGzaMB5EGtG/GMA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
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

The unigraf can emulate a full cable plug/unplug, so add helper to emulate
this.
---
 lib/unigraf/unigraf.c | 14 ++++++++++++++
 lib/unigraf/unigraf.h | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 3998a3af1bef4490bf9d3c796876d268957e87e2..565d63d985b1ea99e839c377d7b87876ba2a12c4 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -299,3 +299,17 @@ void unigraf_hpd_deassert(void) {
 	igt_assert(unigraf_device);
 	unigraf_write(TSI_FORCE_HOT_PLUG_STATE_W, &d, sizeof(d));
 }
+
+void unigraf_unplug(void)
+{
+       int d = 2 << 2;
+       igt_assert(unigraf_device);
+       unigraf_write(TSI_DPRX_HPD_FORCE, &d, sizeof(d));
+}
+
+void unigraf_plug(void)
+{
+       int d = 3 << 2;
+       igt_assert(unigraf_device);
+       unigraf_write(TSI_DPRX_HPD_FORCE, &d, sizeof(d));
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 0a872b6e5859347be371b6a28db5516f4c854d2f..7f6438da66b688b4b7d8aaa6f124474bd2c1d042 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -67,4 +67,18 @@ void unigraf_hpd_pulse(int duration);
  */
 void unigraf_hpd_assert(void);
 
+/**
+ * unigraf_plug() - Emulate a cable plug
+ *
+ * This function will emulate a full cable plug (not a simple HPD line change)
+ */
+void unigraf_plug(void);
+
+/**
+ * unigraf_plug() - Emulate a cable unplug
+ *
+ * This function will emulate a full cable unplug (not a simple HPD line change)
+ */
+void unigraf_unplug(void);
+
 #endif // UNIGRAF_H

-- 
2.50.0

