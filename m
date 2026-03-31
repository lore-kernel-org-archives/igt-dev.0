Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DCBFF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F44E10ECA0;
	Tue, 31 Mar 2026 17:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zV/+uGGz";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C58010EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 99EDCC59955
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 021C96029D;
 Tue, 31 Mar 2026 17:11:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EB32C104505E2; 
 Tue, 31 Mar 2026 19:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977071; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OK1NE7aw2HQgx/9W0ZXtJ7kHhoMlwfIv927ys3oKsKg=;
 b=zV/+uGGz+8Gll8YRp1RG8q49L5nRNT4jVtLaLIzNbGJ/bpPKTpSVAJP4W5BbjhdvYNSGPP
 cYFfaDybSdfM6lB1Qlst3Eygye0wKO0wLue2Wu7kWCnArAZWc/HlDZ2VXwEWDBgLTHW6+e
 z/8smvbQYOulnixCt6SLTPV8YJZA0HjYfa5i5PX1IAGysK5+ldcV+csVtIQOiWbqsWbJGu
 2fFQ/uC2TEN0wcz+X0889PbHypaeh+Rv581VBL9P1ulZCQCAwQUIvfZp8apJkvP/vpFnPd
 xbjL5bz4duc87KNHJSFKOn2CYBsEsvUIs6lMflYoST1fFRK2qQJVCQw+0EPhTg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:42 +0200
Subject: [PATCH i-g-t v10 25/49] lib/unigraf: Add reset function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-25-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=2iWK6bU+FAyawE5RW1LnN4c0tXoF68CO7K5KX2DHD+8=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA+KSgxnOUTmforxFQW4pNxGF2RBvz0F6XKw
 kwU04/oVSqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJS5hAAopCld/n4kruP9T/qigl0NDxQCjHk89E
 v7sFVCLrKQn00PN5FHiDbK0LPDLTbeB+MXvYud5qIb8czj20WtXFSJSW4ueRnQfP+VwIuOxED4m
 4S0bqmrmlPRJA1GQuyvao7Upt5xkY/OERTivcbV9Ultr+GMD6O4i/KTaVmrrt8ay4uY1rlMm6Qb
 e4UR6PMpaHDY/hFNQ+dw4gabSjjvotUQ2/UL8HybjQh47a1Ez5+8myODCbPhpdqvnwRIV4TYHOD
 gX8qRaAmcaNQCDbKdFkIqzfbOxXMGmOgHyP/wdIPSUMevPiEp6gFsKJMizC+o1hKa9v2daMLhPc
 KOZomd6zppMxLny2VJLhAZK64ty3kQsGA0xfxZvbRm246PESzGBrlwHOcI2/iQRtT3XHH7ToR0A
 hYDszzRZQUmjxirYw+St2TA0nlKFTty26G2TYssQDkkcbWejFZg3qJ8NlZjz94Q0bYa22NckUW4
 oArgFy56dLJ27RgY+ouYXfCXiiRiqMS5cNfSlR79ZR9OSp16yNG4nwTILXzsdS1GznS096pJ/Th
 WhdNWlmzhQ06v9xi1LTu8kD+nHYJ+zwWXH9j40t92VQLhox5gfS1nxByzjQMfIQ5fN0V089Ndm5
 F/LUJsGNs5xfT1g2A6q4Q0/EnN4+PO3hKFZCB/uTiMr9bWmVmWBY=
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

To have a consistent state at the beginning of tests, add a unigraf_reset
function that will restore a known state.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 12 ++++++++++++
 lib/vendor/unigraf/unigraf.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 591e99e938b4..e6760ba84386 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -268,6 +268,8 @@ bool unigraf_open_device(int drm_fd)
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 
+	unigraf_reset();
+
 	return true;
 }
 
@@ -281,3 +283,13 @@ void unigraf_require_device(int drm_fd)
 {
 	igt_require(unigraf_open_device(drm_fd));
 }
+
+/**
+ * unigraf_reset() - Reset the Unigraf device
+ *
+ * This function performs a hardware reset of the Unigraf device, restoring it to a
+ * default state. This includes resetting all configuration parameters, stream settings,
+ * and link parameters to default values.
+ */
+void unigraf_reset(void)
+{}
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index c08ce62894c5..4c2cbd6b1aa5 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -40,4 +40,6 @@ bool unigraf_open_device(int drm_fd);
 
 void unigraf_require_device(int drm_fd);
 
+void unigraf_reset(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

