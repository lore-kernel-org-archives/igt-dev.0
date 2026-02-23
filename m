Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191C5EA4FB6
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B890110E372;
	Mon, 23 Feb 2026 12:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="twVlVRAE";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490D910E380
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3BC431A1171;
 Mon, 23 Feb 2026 12:08:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11C845FD43;
 Mon, 23 Feb 2026 12:08:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ECA0910368F7F; Mon, 23 Feb 2026 13:08:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nt7TFUgBhKgn+oSToC/QqiK2tyFbvXdWE1V45mtVM4A=;
 b=twVlVRAEJJxvULTsv3roHDUUoNz1PnM2TnUWFaDZ3Vv1CmG87W5ZQlZje175u28RyITRxL
 xVE3aBlzvppGuRJZIKQJxb6yGbvjPsC1Hnr/j03FNbW+N1wLqxQgHCwldJw0QuY0YRiN07
 IAq2z0egVJvNq1khVkqSsuTef9LNKtqSbkb2ZM5xKNe//Au2ERvXzOZgPFOqDT/T1pHhyZ
 ShIoI30LIWjHRb+q0YL5nohALuoIc48Oc8BW5ccumuGXZ4Dehy/LQDM7gtZPY4AsNghPQL
 DJyLRVCgHZQ+D05sUe0C03uuAt3xWTTEBSejMO9b59RrGv1AgobRgLUJQ9NqKA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:14 +0100
Subject: [PATCH i-g-t v7 07/48] lib/igt_kms: Expose dump_connector_attrs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-7-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=zASUlDIdkdcjIGncVVGmaPZP/s09v8GuLviqKtO7gN4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENnNPrcDAzFeCJ61LtO7Kn+wH9QXWzjAiFFK
 f9oj/xwpfiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDZxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK5Zw//V2o9j95va3e4708RpQVWstl+JjoMUI2
 38WVLJBAZvNMI4U8IfkVijpMduMZhF7PyesZSi6Fniz+BR6Q9rRX4fOIfk5O27QomZkwzD2iahA
 qQogmOKyfLcnTHqmJKwR/J/zOdYvN60BRgF+j423O42IGE6FFAXDJBHQyVvUZ0GEXjFMjAWvD76
 QFREH71eVTDMRUeRoWRCwAM66k53Z3q+BD90xp0RWPLT0ZtuixJIdlCj9BYBsVVhFPIUPuRyM/u
 uHZX/sRaFGEJAQZ5PCsFCAgdmtTP9ITaV6Dyd3nTByHMB2HZuVqKXECSYBbSW0Qw4ec7QQtJL6+
 beUZrRmajPwEmggLdRJ7Mvd1osuvW4ciNhsvOB+Uh9vU2RasL84B1frR1WQMTEVdvmzG4bFumtO
 1uA2MwQEz+nHq0PasOZQcpzoadMtC8QuAwEtD7tUyWhfU4Ar5AndkKNYYPrUww6aaHn4UKil8CR
 3GXHgnOTVMjr9c99Q46lRafNlLbz65qa4rSFUrhSpz9l8rRhDN3TntkaaEC+Kc5I1uLncQvuS6H
 Z406+D6zbKjVZVlMK5B/VYnAYNZDfJsipz/rbXa+E7adKCPIS6ixBsRc2A22erPGQD87GsDBOhl
 zBrfC2APfmQeOFM0Yc9zjQqY9IEQEFDF8O87BZZlf1EKGCVrka88=
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

dump_connector_attrs is used by i915 DP helpers, so expose it from igt_kms
to be able to reuse them.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 5 ++++-
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1c03542c87d7..d76ae3cccae4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1766,7 +1766,10 @@ static bool connector_attr_set_debugfs(int drm_fd,
 	return true;
 }
 
-static void dump_connector_attrs(void)
+/**
+ * dump_connector_attrs: Display on debug log all the connector attributes
+ */
+void dump_connector_attrs(void)
 {
 	char name[80];
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 86bdb4d5031c..a1da1b5a0dd7 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -258,6 +258,7 @@ enum joined_pipes {
 
 uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh);
 
+void dump_connector_attrs(void);
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
 bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);

-- 
2.52.0

