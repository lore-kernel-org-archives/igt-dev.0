Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7AEC3DA41
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C1A10E5C7;
	Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FHEOVH0v";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6760910E5C2
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBF6F2000B;
 Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sjyvhtKVjWV+c4EnPMbehwknaD45+NVRU/rOPQM57GQ=;
 b=FHEOVH0vU0lMzwEYosvzicmpJt/P/6JtA8jPmQkhfSfMear3+xiyQuZdDcj4yZiYE6xJ5o
 8kjnR696LgFsPuRgM3jSY6Wm3LZtl+r5hDNo0xISfWrD+BVZta0K+vJdHnqQu2barMiEwp
 Cms24L1tR5MymPZGLBeIa7oC2VfbNYxm4J8xemSeItGouHU2faG8l6u9gPB/J2YHRoofEY
 kLL7ZPr0COibSb9Q1H+AJDnqWpzgdLgdscZOyahKtWImodzI5oGUWxyi4DkLd3VHshBp/h
 tcomBR5Ck1gwzssSHfy7/FoD1s0ioI+e04fqug/uwdKzLwYbH+1U2PyWw5LLWA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:42 +0200
Subject: [PATCH i-g-t v2 26/39] lib/chamelium/v3: Implement helper function
 to get port mapping from Chameleon port id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-26-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2414;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=z/Nz/k4MV6l2fOb19+fka17LxdNoR80xSccyj99zXik=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViZHyabol3VN44R48QlZB2HxDmnrwaVRYN5F
 IQx8k9+P4eJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmQAKCRAgrS7GWxAs
 4gAkEADR/iLuC/gVLMVhQBGCkOYrIAbeCNezEAvOg0WMjADpzu/vJIlRCS1xzMn3Ep2i3skXRBM
 zITU+IDJvszq0HRgJeNZSpUHYikT2i6cWGpM/dBMOJZCCbQfOSCOsk2wwYyhxt40fja5IExfTAO
 pyd7g8Iv0J++gFzKVacl9ES/tGxJbbXlWbi/mTXjS03XX11CGpM5TNl1+UsS1PW4SlyVxgqxnkg
 qKUt6DTkS5UzAUMdcjJVR4wNdHfOVS5s+3QiIdac9wlNrGClVAQz1EeSHrk7yWeQS/gR59aOwzv
 GAcipFEU+JNbeEcRKhScNUeDBIOHGOrl4vP/+pKcJVi2vlTOvvIV0aHI88PViUxfL7Ck1FmUqsT
 LCTrXUeOog24JGQwTt4MSlRnV52/F/89oLG3x2Fpvq0CACXuYF7qg/NESwOhekUSb6PRsFgW+AE
 VM9NSIa11/g9bRG+IYyxEDNqN5iFsvAbrUVUQ7rYbSlMsiSz+UimETPbhsnpL7DCFgCQC0JUPTT
 6KRaZuF0fQvRDWMyYBNf0uXbTdUgpvLzFV12Q2wKGKjjQJXkMnxwdKpMaOILQ1LRheLWDVh2RRC
 ynlADBgETjO8IA11EiOUCu6LMEI2/ZrSmhvjqAZkiA+epxhSmpYj5Z6FZWg6r1TTVtCzM9bAd9H
 +ylFq6jmUDFbOwQ==
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

Introduces a new helper function in the Chameleon V3 wrapper to retrieve
the port mapping from a Chameleon port id. This function is useful for
certain tests, such as when listing MST children, as it simplifies the
process of obtaining the port mapping based on the Chameleon port id.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 23 +++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |  4 +++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index fb559f29a72e..fc9520466de5 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -341,6 +341,29 @@ void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium)
 	chamelium_v3_port_mapping_info_list(&chamelium->port_mapping);
 }
 
+/**
+ * chamelium_v3_get_port_mapping_for_chamelium_port_id() - Get a port mapping from a chamelium port
+ * id
+ *
+ * @chamelium: Chamelium to search the port ID
+ * @port_id: Port ID to search for
+ *
+ * Returns the pointer to a port mapping
+ */
+struct chamelium_v3_port_mapping *
+chamelium_v3_get_port_mapping_for_chamelium_port_id(struct igt_chamelium_v3 *chamelium,
+						    chamelium_v3_port_id port_id)
+{
+	struct chamelium_v3_port_mapping *port_mapping, *tmp;
+
+	igt_list_for_each_entry_safe(port_mapping, tmp, &chamelium->port_mapping, link) {
+		if (port_mapping->port_id == port_id)
+			return port_mapping;
+	}
+
+	return NULL;
+}
+
 /**
  * chamelium_v3_uninit() - Free the resources used by a chamelium
  *
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index b29221c460f0..5e035bdd10bf 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -46,7 +46,9 @@ struct igt_chamelium_v3 *chamelium_v3_init_from_config(void);
 
 void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium);
 struct igt_list_head *chamelium_v3_get_port_mapping(struct igt_chamelium_v3 *chamelium);
-
+struct chamelium_v3_port_mapping *
+chamelium_v3_get_port_mapping_for_chamelium_port_id(struct igt_chamelium_v3 *chamelium,
+						    chamelium_v3_port_id port_id);
 void chamelium_v3_uninit(struct igt_chamelium_v3 *chamelium);
 
 void chamelium_v3_reset(struct igt_chamelium_v3 *chamelium);

-- 
2.44.2

