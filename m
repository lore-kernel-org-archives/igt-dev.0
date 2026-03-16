Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38ADF53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963A810E292;
	Mon, 16 Mar 2026 16:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lMLigIBw";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E675A10E2B5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DA9351A2CD4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B1E105FC4A;
 Mon, 16 Mar 2026 16:23:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9E8CE10372213; Mon, 16 Mar 2026 17:23:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678201; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=S87UgFzvvilr08SmPMFzsSjACHbvg/6oYzWUnTuX0/c=;
 b=lMLigIBww+l0r8Ri24XtBU8bB7yYrZ8UjoI2giE7TB5Mko/RhDwoLPZB/siHXCQtn0pe1E
 +UCpqHz8oWA8/EM95Qxt6K40W9GfT+vrfJkARQ+uYfdN7LeCYYqM1pDmGxenq9prnSaBbI
 WKAb9W5arKN6fMME9Uk3olpWcN08JANA0Z8+6zN9UoN2/heS4p5fr4QKiJioy1vYOuMc4Y
 AqirWaIzgoCETZTPDQL2rGdVMPpvmTiOA622UvRf2QcJp0T/XJTplHpqP0dXYRiPJjay4p
 38Urd6kRMeYXRxVLcjwoVmJNDxI6J7wKTOLp4r41sy5CnYnnCaAT1le6WPWi/g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:35 +0100
Subject: [PATCH i-g-t v9 14/49] lib/igt_kms: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-14-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vRZNBIzASKvXevrwcvO61P5bFt8T5yCdIFbFqTKHgFg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6LpSsX0Xw/tEoBFJ0GfuVxsJSb9n2R4ZEEW
 WdvZDMDtRKJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguixsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLS3RAAlxxyiUEOnCjAYf9Iycszl4g3zPfI5Sx
 ridKrxQzfAkSbqdI7gDcdxhACcmedoI1BijZhMUQN04V3Mmo6RBwuawjxfiEFv+8fiQ42LRpV8h
 rxGsVODJY2M6+afMpPREq55Q/F/OuwWTTl8WnNlmzSUIu0bPGRXAfHYDcpFiCEKTSSoZumvlemc
 WjSLgtpG05G4hSo2nTRq3f+AiwvPBkUgOg83Zf0tYDEYWpTaCwrb5wWlYP1+sxypwMuICsed4BG
 UZlZtAvRpKQ8ZxY7NTjsLIDNs9fdWio7YwLUuDbSm/hMUJ5kE9fUSYXvgc1H38/cP61Z/3oRCFO
 A7btF5Drktcm24jP0roo38tEJPFbzocB/A5s1NNqD3z74yoYZd39OK9L4Q80IUPnLhGy/Z09bFZ
 3MMzHYyqfdij+ugltHZ+hWtmgOw4mTJUa14z0IAg5mJTbj5NQf9KQ/QCwOC6jBNywkmXEe1zxhd
 h0VTf28VTwesy1RdswshAdJUn2RvKrKb9izy5N8schgCJnmO/jpR8b027iDoSzkFXG6WgYQqrIp
 FpFC2OZrd/0uxsSq8knYYaUcHuDtqjVQid/CmtOCay9sOretXn3IItsJPCF21ozHtQZFGAlMXMp
 U1SfvMpjsR1kgxPTqEYcM0LyP+nzQM/5FyvRjjnzXZrFLqLDZmV4=
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

Const qualifier helps to avoid unwanted modification of a pointer.
To help avoiding those errors, modify the function signature to
use const.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 97292c5c3dfa..f6ddf25756f1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5125,7 +5125,7 @@ int igt_display_drop_events(igt_display_t *display)
  *
  * Returns: String representing a connector's name, e.g. "DP-1".
  */
-const char *igt_output_name(igt_output_t *output)
+const char *igt_output_name(const igt_output_t *output)
 {
 	return output->name;
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6298738b452f..aa1599592e68 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -598,7 +598,7 @@ igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
 igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
 
 igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output);
-const char *igt_output_name(igt_output_t *output);
+const char *igt_output_name(const igt_output_t *output);
 bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);

-- 
2.52.0

