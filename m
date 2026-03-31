Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B93710F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D026A10ECF1;
	Tue, 31 Mar 2026 17:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="c5IGPYa4";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FB610EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 23F9C4E4288B;
 Tue, 31 Mar 2026 17:11:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F03826029D;
 Tue, 31 Mar 2026 17:11:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2BDE210450418; 
 Tue, 31 Mar 2026 19:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977078; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=T32bhyScTEyvHKLTyl3pig9pKYyskjeVSKuD21M/3q4=;
 b=c5IGPYa41qgRbbH4bQrjuBHWuKSNhNrP1hQSHa03PU40Npu7jHjYFwqfSqkKTFcWCOErQQ
 kH1pE8Dv11Ut8A1p6XmovGpoLQbAIF4FLR9M8tVKAmW1Fp5qQS2gw7gVVVl4VLsLhq/prh
 N1hHOEgqVffJfUDvZ/8L0PP9yNryyQgBzpIPri84EbM3zJ1ZsUi1cv2qbUm4ISV14r7T+h
 BZlEb9LvdFauX2mvwPsUAz1syZpU/fZF7+jO7LELc/J6rnVMbUbKYqjGpzQnI4NuQI+H5c
 MOtoJxc7Fkr5Sweohr9aX59sN/dywwvL7g26UKw5iRjeZutkCIUhbfnv86pTGg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:50 +0200
Subject: [PATCH i-g-t v10 33/49] lib/unigraf: Add configuration for CRC usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-33-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2445;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=qk1G7dvXLnqsZ3PDuUlPPWnO6f3BbW3zkNlHYxW41xE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABA0MFZfqRmv26cBFngnAV8745+6mfFGQ5t+
 MsNpNuJnSyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJgYg//bQTb9+NV+mdt1/tBDkJU56oRs1zkNUv
 rd1i1QNfwCgKjF5l3sNnAJ7gE0TD++a3lMzr/66L3GL7RmjkQVHN553ksxTpaJLcTkuDozHf0wI
 nxddu5pBzHP3eSEXdk/nR7rlTPBbiH2pBS8qGw4vz+ojYbEeT1anglWDAvCgmIWRnIJqFbVM1r8
 nL4ud8kcLX6pDw8yn7aIqFeA3bhGd6jZSzcNflf0Th7cqJJnQILHUtiyfE5QeQJLo++Lh585rlK
 ou5SO6x2jQQNtoMlPHuthVCtG6qGHAYGkBHTFgihPT8Siuz2vS5KgfR3zvebsl1V7PqD9gE5Kox
 z4runO0o+oiwJX2sCVpBLHDce3zPity+wS5mfMHwD1dNY4gcMuUvtbTEX9Ji8BbsLHYqTMCU/y6
 Hu3zCWGtglQyleWlvsSXD33+BqLv3lBMkgP3ZSvP88tScItkGNjgtx2B/MQP2xyPLlYt0lqtYQ9
 gsTdAABYElyqPC7QacOBUt9EOkq+NCmVzfiu543FeBA5lHHvSgeED6uPf7KSF/4Lznv3XLh/9/c
 GezMSnZeQrgasHAlIoah2cZGzZCKJoAb8NPKuMoaPbjdlV3H4G6Bk9YHp4HMFHHhuONc0V2cxd6
 OvpLceYF1J0NmHerKHrg/Jt6dI/idGZ1j6AmNMUrzMU4k9ab5eBc=
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

As Unigraf devices are able to compute a CRC for the input image, add a
configuration file option to use them.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 25 +++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 7af7ed07642f..d6e0c36062ae 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -26,6 +26,7 @@
 static TSI_HANDLE unigraf_device;
 static char *unigraf_default_edid;
 static char *unigraf_connector_name;
+static bool unigraf_crc;
 
 /**
  * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
@@ -62,6 +63,11 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_EDID_NAME "EDID"
 
+/**
+ * UNIGRAF_CONFIG_USE_CRC_NAME - Key of the CRC selection in the configuration file
+ */
+#define UNIGRAF_CONFIG_USE_CRC_NAME "UseCRC"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
@@ -368,6 +374,14 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No default EDID set, use IGT default.\n");
 			cfg_edid_name = NULL;
 		}
+
+		cfg_error = NULL;
+		unigraf_crc = g_key_file_get_boolean(igt_key_file, UNIGRAF_CONFIG_GROUP,
+						     UNIGRAF_CONFIG_USE_CRC_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
+			unigraf_crc = true;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -687,3 +701,14 @@ void unigraf_read_crc(int stream, igt_crc_t *out)
 	out->n_words = 3;
 	out->has_valid_frame = false;
 }
+
+/**
+ * unigraf_use_crc() - Check if Unigraf device should be used for CRC computation
+ *
+ * Returns: true if the Unigraf device should be used for CRC computation,
+ *          false otherwise.
+ */
+bool unigraf_use_crc(void)
+{
+	return unigraf_crc;
+}
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index 67fb44db107b..34bdf15ed04b 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -75,4 +75,6 @@ void unigraf_select_stream(int stream);
 
 void unigraf_read_crc(int stream, igt_crc_t *out);
 
+bool unigraf_use_crc(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

