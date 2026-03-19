Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CC91075262
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 06:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD9C10E8A7;
	Thu, 19 Mar 2026 06:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAYQtVgh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6048910E8A9
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773902621; x=1805438621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u1cW3qh1gjDLJRWKDxtYHB6hn86e1b+idpE5tdSjrjk=;
 b=oAYQtVghpSl5lT6KGLdhEBPgiIJpLWK8DWAuUGoLKDrNYX+IfH14JCRs
 3+ggCRRFjieNDfDfUL3PXnmsxZzOTML2TCoiK+fhHLj69Pg4if7r+cKrT
 z/OAZGLdcRBtzsDNQ1/A8jV8cwoj/jh07CAvuDWuj8+qJ09xxihjhWMI8
 rOCk77xB0pq8WE0Bzeof/QsPg/fnXl4bAFOOJobio93v8rg3nHKZSe/t3
 kYJOagNv+yRRRvfTOJoXU/+5XuJpB+4oHMefkDci1jHKTHrN/3Q2yrCl2
 nMf2VajHu2Haz4itF2TL34MMqrmhJWVkXAi2OiPrZEOhah6Mas+t2vruM w==;
X-CSE-ConnectionGUID: R86I/q9AR9ekE+xsDKCCgQ==
X-CSE-MsgGUID: /wm+RfidQseX07x9IG6HXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74854265"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="74854265"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:43:41 -0700
X-CSE-ConnectionGUID: AYkBj4vaSqSE3o/Dpg9igg==
X-CSE-MsgGUID: EyobEqv2SeSOz0/kG6W0ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="222851108"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 23:43:32 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, karthik.b.s@intel.com,
 mohammed.thasleem@intel.com, sowmiya.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 2/2] tests/kms_content_protection: Handle EDID lookup
 failures
Date: Thu, 19 Mar 2026 12:11:15 +0530
Message-Id: <20260319064115.72836-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319064115.72836-1-santhosh.reddy.guddati@intel.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
 <20260319064115.72836-1-santhosh.reddy.guddati@intel.com>
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

During output selection, connectors may disconnect or AUX reads may
timeout. In that cases, EDID blob read fails instead of assert log
the failure so test dont asserts.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index caf3d7a56..006aeb510 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -683,13 +683,24 @@ static bool is_output_hdcp_test_exempt(igt_output_t *output)
 	const struct edid *edid;
 	char edid_vendor[4];
 	char sink_name[20];
+	bool ok;
+
+	ok = kmstest_get_property(data.drm_fd,
+				  output->config.connector->connector_id,
+				  DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
+				  &edid_blob_id, NULL);
+	if (!ok || !edid_blob_id) {
+		igt_debug("Unable to get EDID blob id for %s\n",
+			  output->name);
+		return false;
+	}
 
-	igt_assert(kmstest_get_property(data.drm_fd,
-					output->config.connector->connector_id,
-					DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
-					&edid_blob_id, NULL));
-
-	igt_assert(edid_blob = drmModeGetPropertyBlob(data.drm_fd, edid_blob_id));
+	edid_blob = drmModeGetPropertyBlob(data.drm_fd, edid_blob_id);
+	if (!edid_blob) {
+		igt_debug("Unable to fetch EDID blob for %s (blob id=%" PRIu64 ")\n",
+			  output->name, edid_blob_id);
+		return false;
+	}
 
 	edid = (const struct edid *)edid_blob->data;
 	edid_get_mfg(edid, edid_vendor);
@@ -724,7 +735,6 @@ static int get_hdcp_outputs(igt_display_t *display, int content_type,
 			continue;
 		}
 
-
 		if (count < MAX_HDCP_OUTPUTS)
 			hdcp_outputs[count++] = output;
 	}
-- 
2.34.1

