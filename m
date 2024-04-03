Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EE8CD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 15:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4DB112BB3;
	Wed,  3 Apr 2024 15:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="M2tD8O9p";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B0C112BB3
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EYOclmlCI3SGeYjN0zWEaDocPluUV2Mis4OsKm8LRZ4=; b=M2tD8O9pz9Gq7wfA+kUbLPhDei
 z/kQCKpsU/shz7LgNbVgLgib+EJZTwQwoeqyLKELiZOn5pdgiyaP7NnpIYmK3ftWcB9ByEQjWAbSW
 uOuhXhQ3DrB0yo+xlSlVvDs51ICoSuqDqaeDDDlzd+vdsbAPHM4rfFhOpV/sCBfsb5sQXTHjbbgca
 8Ff0Tt59Xgp+0GN+Jiq5PemDOiDm8jaXuvwlusLdK9KO9QSnmqPnlzTZZdOWI7RgZltSamQI/IQdq
 484V1b0SmDaLJtgxi+GrqeLCYKgg+mArLjD9lgi1sXqYD6jsXoJaFMLwXJO2da4HwoAzXI+dOE0K/
 NVnDL2NQ==;
Received: from [84.65.0.132] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rs26m-000vuW-PA; Wed, 03 Apr 2024 17:01:00 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t] tools/gputop: Fix engine columns with amdgpu
Date: Wed,  3 Apr 2024 16:00:57 +0100
Message-ID: <20240403150057.25765-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Amdgpu kernel driver skips output of fdinfo keys for unused engines. That
is completely legal but corrupts the column formatting in the current
code.

Fix it by simply treating change in detected engines used by a client
as trigger to re-emit a new header. This ensures columns are always
correctly aligned, albeit with a cost of potentially duplicating the
header for the same DRM minor.

This is considered good enough for a reference implementation. The
alternative would be to add some real per DRM minor state tracking which
sounds like an overkill, at least until gputop gains a nicer (any) UI.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 tools/gputop.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 71e28f43ee4c..76075c5dde8b 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -119,11 +119,36 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
 	return lines;
 }
 
+static bool
+engines_identical(const struct igt_drm_client *c,
+		  const struct igt_drm_client *pc)
+{
+	unsigned int i;
+
+	if (c->engines->num_engines != pc->engines->num_engines ||
+	    c->engines->max_engine_id != pc->engines->max_engine_id)
+		return false;
+
+	for (i = 0; i <= c->engines->max_engine_id; i++)
+		if (c->engines->capacity[i] != pc->engines->capacity[i] ||
+		    !!c->engines->names[i] != !!pc->engines->names[i] ||
+		    strcmp(c->engines->names[i], pc->engines->names[i]))
+			return false;
+
+	return true;
+}
 
 static bool
 newheader(const struct igt_drm_client *c, const struct igt_drm_client *pc)
 {
-	return !pc || c->drm_minor != pc->drm_minor;
+	return !pc || c->drm_minor != pc->drm_minor ||
+	       /*
+		* Below is a a hack for drivers like amdgpu which omit listing
+		* unused engines. Simply treat them as separate minors which
+		* will ensure the per-engine columns are correctly sized in all
+		* cases.
+		*/
+	       !engines_identical(c, pc);
 }
 
 static int
-- 
2.44.0

