Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F04CD25B5D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F87210E119;
	Wed, 28 Jan 2026 13:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xnO/EYCV";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466BF10E6DA
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2748B4E422FD
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EC6996071F;
 Wed, 28 Jan 2026 13:14:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E1D24119A880F; Wed, 28 Jan 2026 14:14:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=B6XJkaLr5H0MMcRkc5tpwbb2Yt+e4EEKaem1F/mPL6Y=;
 b=xnO/EYCVWJgglTQi8nTSXw4jjsTm60QOkDgeGgPsFzpK3ZMEJcE7LkjqRtniYKRuZC6bOt
 HNu48XIEVmPSrcn4jos1C0NXt72ZDCzUElco7mj62lYjpQEPdSbl1XWJI08xhSg+CdQxfj
 QGyF/UgJtziGV0I1xbxeN4QIgDxBa8IyWHnkfop1AMIbGWC+FEzql8me9nf0CF4pcQHHaq
 cVRk0CSQXDk2JVFKO5iVYYYSClfQkG1YflgSyjoHn7q3j8JSJ9MZ3xNdKTCOR4gCv/aMtJ
 0WzGqJ75EO/L2kYtehKZI5SXHPBt27kOBP/C5+F9YIenftw1vVCQCGtPxaeMKA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:38 +0100
Subject: [PATCH i-g-t v5 07/48] lib/igt_kms: Expose dump_connector_attrs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-7-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Plly5avrdWVgbAr1uICknFoOaYo5Bmul5FOg8SEKzZY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvI+rh3IENVb2KBODzcEzwuDMo8dYyH3EJ7w
 CpmHZbefHSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOL7ZxAAzMnbbhT4Tl0H1DiK0jD0V+QDsqivDwv
 RkXFGa5Dv+NupFMI6+uWReovxfHyxq7w4tnNXRucUwuXKI6btXwirRdyg6yhvELEAL2pdpPhFpX
 OXkDnRZAjEg9l+O0RpgzsL2uBz6t1DgbPspP7w39hxM3Pc0ZI80QZTa0/UjIys3wi6j3hf4Okh/
 peOLZTjNHVC/UZzlLSsZdKNA2RnMdyWpyNzRjDmhAs3b44Ct/hUB/bzLHyUZR0QlnIjNBaq+ABF
 RvJNk2YqW8RVXzkjhXy+k7K5lSKXCunxEv8uEVsfMF1eity6fYf4vRpiYQ6zdheLxZlKEUnAhyX
 hzEDhJxVXnzlq6umwySZh+ckhyvfw5rLl4hasMhFdL5p81zBD4nZBc7W3z/FsKUOqclA7Q+aEIm
 7q00dVPLLyG1//aQOWvnWTJKANPd6yc94srT1GQDCDDkTEsp8Uq6vCfuuHlBRfkiLqa3erPrXfD
 XGO5ls6CtZOJkGqHLCa4Brn9jAOrehG1hGLyXSK21nqTIG8eV0eC63bHvjjgEpILX36mnaVYr9P
 YR5r1oZccUmE9TOwOSuMGP6X4QTu66NHEGUL3S5e6/GacwuHylCwX2YBHwzbLbFaZ7qOvfm9909
 fv/3sHClcU2qQDkFx2LEZD3/pPnO9hxPGrDqkYpyVy8BvHSZ63Ro=
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
---
 lib/igt_kms.c | 5 ++++-
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 65c9b71be975..4d22ad71221c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1803,7 +1803,10 @@ static bool connector_attr_set_debugfs(int drm_fd,
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
index c1e5291af56c..584e05fd159d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -266,6 +266,7 @@ enum joined_pipes {
 
 uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh);
 
+void dump_connector_attrs(void);
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
 bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);

-- 
2.52.0

