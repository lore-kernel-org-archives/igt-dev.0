Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B944C83F38
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0507510E889;
	Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Be8n2qeH";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F79510E883
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42A5E441C4;
 Thu, 17 Jul 2025 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBEqD4Y/6PlHlGr0AUR1l0L/dzhN59HyaRH3vJW28aU=;
 b=Be8n2qeHPMTW9r7QRq/Wad7Rleyl+qvyVcVdRjwzPiI8I7+oR75F10T4M2SxqBr0eeQkJS
 n9bdfqKZjIl8bSo9aiM4LH7mtM4Ew6MS/sdUBg5VB3MInRaArRPXrHNKm2CAZ0JdtQXyyk
 8C0H4s3tKSZD8A25zOgmUYbT+3xq1AYh1Ci5a33+XnkzP89miZvmqNJ8Nt6Qj4g5Ix5TB5
 aRbvALz3AEmSVYRWtHAa/C9Oir6sYEoO1qeQ9V3z3u/2fnNTZi0JM1zO6L3DfLaS/7y0ES
 aAGN9tbCDgkXTeexP3xgEw53Qil8x98GU54OK2Ov6otqdyxbFCZOySreqnlkDA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:36 +0200
Subject: [PATCH i-g-t v2 16/26] lib/unigraf: Add unigraf assert and
 deassert helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-16-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2800;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vC8230lcylr51/GiaGF8yzw5A2a5YrijIMTDizeHiis=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUULsZP/x9Hel1zQUuiA791ePO/bjv6ZZWdNl
 7pRexS/lZGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFCwAKCRAgrS7GWxAs
 4hJ/EACwm4kp7OvgKAxyjFoDSf0RpqqDjtYXA24PLkkT/V12bWXQXhyHR2cudYL/kt8sxNfcKTw
 YpqCJypednf81gh5npK/oSxCNU7iZnXW1yiHAV7RR9se2tn+5KOaIEJQNfTRDzSWgxGeM8iruH2
 zq6KGo1EIjd2naIuebpA+lR4Xprqx4skjzN2j5OxQasu7SX7EVv834IRTMaAXWDsVA3zUhPiM1l
 G1Zsh736l9i3PUlVc9NQ2FJgMfCitay7UEMaCqgvcfxYNYHuaUUKwN0YkiNZoZqDHtwL3SFFTHr
 f/S8i+nsdV9APNTTwfMDgqmOxBmUBJBFNv2ad2b08QNHEKGaprw3Hhji9WLNSwG5MD1Oz8h0T5H
 +lMUsGDzI5Fj50EFu67IO9+3EOAMSrq2OAtyCQF91pLcsMYQmVr9mfdO7ERN3LDUetyBQcNoo+C
 JHF6QtfesKTpOzGRWD6nhi1YpKDMAplJj5/TJ1IZ7iTO1I6MK3Uq1/o/DJyIVB6Oq9nUkVA2Tge
 dR37fp+MHxLOtKIe6AbxuKK7dN+htZKUAxvwFqzxeUKBww5VpUavA5ZQe8nZCXQZm7bIxlcQOHv
 aR794J/dH7NtFg74U5KwR6RUOGxDEyv7xiQ+co3XUjEWglL2B3XwkyXpe0g175OuffSVsL78BE5
 We6Wn+4g3/rJ9jw==
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

Unigraf is able to manipulate the HPD line of the connector, add few
helpers to manipulate them.
---
 lib/unigraf/unigraf.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h | 22 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index d9e9d80a4cf19c6be67977050ef2a17f2cb489d7..3998a3af1bef4490bf9d3c796876d268957e87e2 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -88,6 +88,25 @@ static void unigraf_init(void)
 	igt_install_exit_handler(unigraf_exit_handler);
 }
 
+/**
+ * unigraf_write() - Helper to write a value to unigraf
+ * @dev: device handle, can be null for some config id
+ * @config: config id to write
+ * @data: data to write
+ * @data_len: length of the data
+ * Returns
+ */
+static void unigraf_write(TSI_CONFIG_ID config, const void *data, size_t data_len)
+{
+	unigraf_debug("Writing %zu bytes to 0x%x\n", data_len, config);
+
+	if (data_len == 4) {
+		unigraf_debug("Value = 0x%x\n", *(int*)data);
+	}
+
+	unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config, data, data_len));
+}
+
 /**
  * unigraf_device_count() - Return the number of scanned devices
  *
@@ -261,3 +280,22 @@ void unigraf_require_device(void)
 {
 	igt_require(unigraf_open_device());
 }
+
+void unigraf_hpd_assert(void)
+{
+	int d = 1;
+	igt_assert(unigraf_device);
+	unigraf_write(TSI_FORCE_HOT_PLUG_STATE_W, &d, sizeof(d));
+}
+
+void unigraf_hpd_pulse(int duration)
+{
+       igt_assert(unigraf_device);
+       unigraf_write(TSI_DPRX_HPD_PULSE_W, &duration, sizeof(duration));
+}
+
+void unigraf_hpd_deassert(void) {
+	int d = 0;
+	igt_assert(unigraf_device);
+	unigraf_write(TSI_FORCE_HOT_PLUG_STATE_W, &d, sizeof(d));
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 8e0137ce30ed1bc0b334540561f93c7ade38e386..0a872b6e5859347be371b6a28db5516f4c854d2f 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -45,4 +45,26 @@ bool unigraf_open_device(void);
  */
 void unigraf_require_device(void);
 
+/**
+ * unigraf_hpd_deassert() - Deassert Hot Plug Detect signal
+ *
+ * This function deasserts the HPD signal, simulating a device disconnection.
+ */
+void unigraf_hpd_deassert(void);
+
+/**
+ * unigraf_hpd_pulse() - Pulse the Hot Plug Detect signal
+ * @duration: The duration in milliseconds for which the HPD signal should be pulsed
+ *
+ * This function pulses the HPD signal for the specified duration.
+ */
+void unigraf_hpd_pulse(int duration);
+
+/**
+ * unigraf_hpd_assert() - Assert Hot Plug Detect signal
+ *
+ * This function asserts the HPD signal, simulating a device connection.
+ */
+void unigraf_hpd_assert(void);
+
 #endif // UNIGRAF_H

-- 
2.50.0

