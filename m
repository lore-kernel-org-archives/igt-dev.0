Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39941C87FC5
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C783D10E892;
	Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bAEjaUM7";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4A810E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DECC442B0;
 Thu, 17 Jul 2025 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=umkRn6vYVas4AhXKOqRnKS7LnVK/KD21q7fwO872Md0=;
 b=bAEjaUM73mWnEyqV3xxgbv72b1pLOnQ5w6FbjA5uoLwykyUtWEdHFxAWb2rJRTbxIR4PiG
 vELABE5Vr+5htYxR8qZShjaFGZqDRcHVbaRgKOLfwtxbmRRqad2QV8Ymypn+XTU5Y9h+oJ
 5wYjqVFAvyH+ndX1buKEODzrXXqGPH+lTgGhgS4IzUb5Mp7XdyUZOQkA7i+v58nluaOpfz
 vk1igRhaa75WGOZ7IlbfGEO1Zadpkl8LysozaF+w1SCuEzWQ1y2RzfDATm0ALQOm9RJIWN
 ncu17KdeCQ/iCfYdLR1vkOJSf2eM6I/7E0+YgTrqRo3ETyFEmlMmlNjdQZyB2Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:39 +0200
Subject: [PATCH i-g-t v2 19/26] lib/unigraf: Add helpers to read and write edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-19-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2857;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=DvFUogc2aV0LBEOEOGboOiNVe2zfADE12KbvYi4sVLI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUMSm+Ox1ezmJT+d1UZss+YVdV294GKG6uGF
 3+YP7RGIVOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFDAAKCRAgrS7GWxAs
 4spnD/9s1Cyrl4ZQ6bB2suFUOq22Cd7IfQnohgyNu59HkgtUSxEUKP+I3EqpMAZXHfGQ0m8GlQx
 Nzv5aqA5H+pRy/l2ApPqk4r2ayIIFlH4eg9G4OTflMfCelJSKD2DoSpIa5fYX0/KWRRJI8crmsL
 czG8hXtLqkxL+PcAfVj/4QgI8fpbtPJrMqiwX63w9cteAnlU6qTQapGSxLJf3T1akXcf8lpH34Q
 uYGMaO4L15tGwN2d7IAH1nt/uNhSaqSvARsnQ8Rvsp+OKp2RyngyQNmsKeQmeXRgQmtt4Cp5hye
 +jVrt4FGMTGEv+964b0OI3ZmPJk03GVMqaktlbiijOo7uxa35oJ6z2DRowqWTxw6PofHfaL+Add
 HT/P3JCH8yh4reOE3L5gscpVl24xKE/6WN/OUOjyJis1oWLmfO+b0hWmZokc/nC0HO/c9rNBTrB
 Wd+2OoRMbiiyJ4E3/toEIxziXm+jyD+MTfNV4wKSaWRDM7E1CGerbpLoi7FKYjn+TClvlHWGZab
 vjY/Q246qM3eNnKMcmRO+xr5dn04Dm6ZzvrdzA4UT3vSODmvnSmvbSeI902a4nMjhZfOX8c+0Fm
 TOiBwr59m/P70JEupSeGi8aT+BdpnicFbdGwN6uKzvOrpfCyUl7Q1iO9b4r5WBkjpAP5tFGJ03B
 0HbRB+oYuQ5pAVw==
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

Read and writing EDID on unigraf can be useful to emulate different
screens, add helpers to read and write them.

There is a limitation on the libTSI.so, it is only possible to read EDID
using buffers of size multiple of 128 bytes, and there is no way to query
the actual EDID size. The current implementation can only read EDID up to
2048 bytes.
---
 lib/unigraf/unigraf.c | 25 +++++++++++++++++++++++++
 lib/unigraf/unigraf.h | 21 +++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 15ded642c2fc6900a6722bdeb62c7126b23e9cee..6df48da4672c1774bd85125076fcc63e9891b6cc 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -281,6 +281,31 @@ void unigraf_require_device(void)
 	igt_require(unigraf_open_device());
 }
 
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size)
+{
+	void *edid;
+
+	igt_assert(unigraf_device);
+	unigraf_debug("Read EDID for stream %d...\n", stream);
+
+	edid = malloc(2048);
+	memset(edid, 0, 2048);
+
+	unigraf_write(TSI_EDID_SELECT_STREAM, &stream, sizeof(stream));
+	*edid_size = unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_EDID_TE_INPUT, edid, 2048));
+
+	return edid;
+}
+
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size)
+{
+	igt_assert(unigraf_device);
+	unigraf_debug("Write EDID for stream %d...\n", stream);
+
+	unigraf_write(TSI_EDID_SELECT_STREAM, &stream, edid_size);
+	unigraf_write(TSI_EDID_TE_INPUT, edid, 2048);
+}
+
 void unigraf_hpd_assert(void)
 {
 	int d = 1;
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 6ecd1248cdd70a2af99ae09ae19f9fc8c061ff56..e843aa8f2badddcfaeceb8773d5ad19e572e37d9 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -45,6 +45,27 @@ bool unigraf_open_device(void);
  */
 void unigraf_require_device(void);
 
+/**
+ * unigraf_read_edid() - Read the EDID from the specified input
+ * @dev: The device handle
+ * @stream: The stream ID to read the EDID from
+ * @edid_size: Pointer to an integer where the size of the EDID will be stored
+ *
+ * Returns: A pointer to the EDID structure, or NULL if the operation failed. The caller
+ * is responsible to free this pointer.
+ */
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size);
+
+/**
+ * unigraf_write_edid() - Write EDID data to the specified stream
+ * @stream: The stream ID to write the EDID to
+ * @edid: Pointer to the EDID structure to write
+ * @edid_size: Size of the EDID data in bytes
+ *
+ * This function writes the provided EDID data to the specified stream.
+ */
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size);
+
 /**
  * unigraf_hpd_deassert() - Deassert Hot Plug Detect signal
  *

-- 
2.50.0

