Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93AAC47258
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 00:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4A310FE00;
	Thu,  1 Feb 2024 00:47:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6002310FE00
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 00:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706748464; x=1738284464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PsCgW2q8gpJjgemvZFWwts3hPgh6KobXIfgV2DdxNHg=;
 b=ZucIVNYc3Q15QStx6aiYAKh31JP0rhs1UZluYkjMMyrlHyTTvzKcGcAY
 4j/XPOGD+xgAje7mtKa51eoS58zSoOLVl9L0GeT8lzyjOQV32MMKqTPHD
 OkbYIbxYZGzopRct1JwPFb0l/lCX6zLQdV0syuJxLrooPycsav3Vwen2V
 i2uAelmsn0ucHt1ppT10IrgFXAEWAHA72nDCk+y4xIeMGEE9196GPIaXy
 /ppZmpvShWv2h2HkHPz3CYMo5wQM6eaKbttKYgVU7YX3hS3fUsg0hjnJ6
 +EQFzrwG8fyn1e8ZkUSS35M9TuEUPQ9+iroicUjv1K15p27+QaTwYNx65 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3635848"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="3635848"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119789344"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="1119789344"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:47:37 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] lib/igt_drm_fdinfo: Use longest match first
Date: Wed, 31 Jan 2024 16:46:24 -0800
Message-ID: <20240201004744.352041-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201004744.352041-1-lucas.demarchi@intel.com>
References: <20240201004744.352041-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Instead of checking twice the match, just use longest match first.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 222ccbfb1..5c0ccf624 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -239,8 +239,15 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 					 strlen("drm-client-id")))) {
 			info->id = atol(v);
 			good++;
-		} else if (!strncmp(l, "drm-engine-", 11) &&
-			   strncmp(l, "drm-engine-capacity-", 20)) {
+		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
+			idx = parse_engine(l, info,
+					   strlen("drm-engine-capacity-"),
+					   name_map, map_entries, &val);
+			if (idx >= 0) {
+				info->capacity[idx] = val;
+				num_capacity++;
+			}
+		} else if (!strncmp(l, "drm-engine-", 11)) {
 			idx = parse_engine(l, info, strlen("drm-engine-"),
 					   name_map, map_entries, &val);
 			if (idx >= 0) {
@@ -251,14 +258,6 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 				if (idx > info->last_engine_index)
 					info->last_engine_index = idx;
 			}
-		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
-			idx = parse_engine(l, info,
-					   strlen("drm-engine-capacity-"),
-					   name_map, map_entries, &val);
-			if (idx >= 0) {
-				info->capacity[idx] = val;
-				num_capacity++;
-			}
 		} else if (!strncmp(l, "drm-total-", 10)) {
 			idx = parse_region(l, info, strlen("drm-total-"),
 					   region_map, region_entries, &val);
-- 
2.43.0

