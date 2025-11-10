Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825C9CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E57110E3BD;
	Mon, 10 Nov 2025 13:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UZyFBwDl";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA4E10E3BF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A5B134E41609
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7D3A6606F5;
 Mon, 10 Nov 2025 13:39:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 801EA10371905; Mon, 10 Nov 2025 14:39:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HG7qZEXFzVCZd6tsIfMYLffa5goYC2eHdQVdeiFhOZQ=;
 b=UZyFBwDlfaMKSVvySWQiHStiRZAYcGOyUZDFmYt2gjjex8aY9rhfawi2XTx7tw7Z2MYkUI
 wnoL03F79FqPZgdvEIKsL8H1DaLOvsNGwUAQb3OISlk0o4genLkheF4ByUI8TVACAFqQ1E
 6Q8Vr7AdlrqU7EwbThZPkTcFbyPBQrty4HvjT0QRJ539OSg/WV7LgsBZ1ZekGN9ZtLju5w
 V3S/2eFWjusbx8Dpoyn9hoHGndm2Zw1RYikaPQYrUJqEV6wJmQC3NRH3OpScmDAzbmcpPH
 E46ihKOuISiQJZxDGlE96jZisp6/0B5pcUGILPz4rKSbSTGXk0O1PkWp5Bcx2A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:11 +0000
Subject: [PATCH i-g-t v4 09/46] lib/igt_kms: Expose connector_attr_set and
 igt_connector_attr_set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-9-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LqsoCOFroViF4b4Kr+45XLmWSMTFoRV0LhmGCeyL+OA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesNkCVrdlm9XraiYZQFjSICY/Z2si6467TAC
 1Sc7OQdWtmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDQAKCRAgrS7GWxAs
 4uQhD/0RQIpbc2A3E6PvXbaFyqW4F3iOloi6lwAs5phsFo6nA2GPsJSJLp1Hrcic1qTthN35MY9
 6wnucORHJpKE3zyiyOsFIQ+GX13EJb9ANa80YvVWvETtm3zhT1yxoXX52vJcWxVu6eeuBbDKqhy
 tL/rkbDGzu5MM+WPplrfA7TdHbDI3QoDD0UhLIekQ17z538ymzsjfC73e+Gz77qNyGsR9ErfTWA
 eYHdlUdgKxJ2+PumLIq1f0gHNKtHVIOtELpAcZDzw9C0Fh1Tr93MhCQSrjL0DfgCRumH8xiAVJG
 0AcCibjBFZYdR9c7NP+phdhXcVtUbasIto86bWf3f9YmK7wOL0bESPKnHjLg/iGQ7W4cTuabb2D
 NxXRWL1iw7r6BMnPcCR7Ia/sYy6op3FQZ/XyLeSdKElFOzMee40yBXSJMsZgawwYckHkdDGHX3d
 oHkLnL3+iWCK6fB2saCs5L2KkC77hVmQFJbNtqNyoWMq+HXDB1MJFycV6c13xZ1sOrHK2FhFMev
 z4rKpIIRXZtkTqRf5xaQlgtxJezLLeuhcczQ/XVMJTd45DJOrfvFt5sR9THGIyTAYSoexsFiz57
 CdhlAFKIj5aloWsFjqSwzFb5JrAEVjgob6txr2pgVqnuWnOMxubeTl4kh1EK8hKXjU2GfYixIqH
 HMrtHINZ2mlq5fQ==
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

Some debugfs helpers need to use connector attributes. Expose those helpers
to allow using them in igt_debugfs.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 12 +++++-------
 lib/igt_kms.h |  6 ++++++
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 473d35b373e5..4f6a07c06e9d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -98,8 +98,6 @@
  */
 #define IGT_KMS_CONNECTOR_NAME_SIZE 50
 
-typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
-
 struct igt_connector_attr {
 	uint32_t connector_type;
 	uint32_t connector_type_id;
@@ -1593,11 +1591,11 @@ static void connector_attr_free(struct igt_connector_attr *c)
 	memset(c, 0, sizeof(*c));
 }
 
-static bool connector_attr_set(int idx, drmModeConnector *connector,
-			       int dir, igt_connector_attr_set set,
-			       const char *attr, const char *value,
-			       const char *reset_value,
-			       bool force_reset)
+bool connector_attr_set(int idx, drmModeConnector *connector,
+			int dir, igt_connector_attr_set set,
+			const char *attr, const char *value,
+			const char *reset_value,
+			bool force_reset)
 {
 	struct igt_connector_attr *c;
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7caceec7c076..21057c62fc05 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1224,6 +1224,12 @@ void igt_parse_connector_tile_blob(drmModePropertyBlobPtr blob,
 
 int igt_connector_sysfs_open(int drm_fd,
 			     drmModeConnector *connector);
+typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
+bool connector_attr_set(int idx, drmModeConnector *connector,
+			int dir, igt_connector_attr_set set,
+			const char *attr, const char *value,
+			const char *reset_value,
+			bool force_reset);
 uint32_t igt_reduce_format(uint32_t format);
 
 

-- 
2.51.0

