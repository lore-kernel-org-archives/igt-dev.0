Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5B6C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D434110E043;
	Wed, 16 Sep 2026 11:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUbDdUO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD21010E69C
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557092; x=1821093092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u/2VVoKMDVP21VUj6UJNxDHCcvqnkWM18DvQ8kHW9Nc=;
 b=TUbDdUO5Z6Z4E3Hw4l4sD0eyPQ9neY/6OjqB9z7OUflhChxviTBx44xe
 fYDaMo28+C6ry+viqGWjw5NzJchc9Ia/FA8+I+KVByKtQKI5VjPzZrXZu
 0tXW44/hVz9NwRFBhHIqg7jakvcQY084HAZd5iwrIQ73ufUHLgmtw8EYt
 0FqvUnfj+IXzBP+saD2XbpYSuYLtNax+J4bmqlEl1836aWczRNim0Hl9m
 bypVlFdfQ7ecMa+QBkzqiqgq8TAxmhAeyslXzLE5U+U8BkcakhAR/2WSu
 3lXTKlAaXTIZz2H51L4pKI7uLNYqp+JQkOrLvGmAdAOkEkTSVcYnNKr8r g==;
X-CSE-ConnectionGUID: 3AHtkYWmSHGzcyfcZhhh7w==
X-CSE-MsgGUID: 2GadmrxpT82X3M2HZgCvVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440510"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440510"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:32 -0700
X-CSE-ConnectionGUID: F5poKwvbSjyrIncuSza59Q==
X-CSE-MsgGUID: UPzcIevwTxq5M5/7dqZoQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296800642"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:29 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 01/16] tools/intel_hdcp: Don't set HDCP Content Type
 unconditionally
Date: Wed, 16 Sep 2026 16:36:54 +0530
Message-ID: <20260916110718.596603-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
References: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
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

HDCP Content Type is optional and is not exposed by HDCP1.4-only
connectors. Do not set it when it is missing, and reject Type 1 requests
without it.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 336ea70e1e..65a25503e6 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -119,6 +119,7 @@ static void set_hdcp_prop(data_t *data, int property, int type, int connector_id
 {
 	igt_output_t *output;
 	bool is_valid;
+	uint64_t content_type;
 
 	output = get_hdcp_output(data, connector_id, &is_valid);
 	if (!output || !is_valid) {
@@ -131,19 +132,38 @@ static void set_hdcp_prop(data_t *data, int property, int type, int connector_id
 		igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION, CP_UNDESIRED);
 		break;
 	case CP_DESIRED:
-		igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
 		switch (type) {
 		case HDCP_TYPE_1_4:
 		case HDCP_TYPE_2_2_TYPE_0:
-			igt_output_set_prop_value(output, IGT_CONNECTOR_HDCP_CONTENT_TYPE, 0);
+			content_type = 0;
 			break;
 		case HDCP_TYPE_2_2_TYPE_1:
-			igt_output_set_prop_value(output, IGT_CONNECTOR_HDCP_CONTENT_TYPE, 1);
+			content_type = 1;
 			break;
 		default:
 			fprintf(stderr, "Invalid HDCP type\n");
 			return;
 		}
+
+		/*
+		 * HDCP Content Type is optional: a connector that only
+		 * supports HDCP1.4 does not expose it. Requesting Type 1
+		 * there cannot work, and setting the property at all would
+		 * fail the atomic commit.
+		 */
+		if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE]) {
+			if (content_type) {
+				fprintf(stderr,
+					"%s has no HDCP Content Type property; cannot request Type 1\n",
+					igt_output_name(output));
+				return;
+			}
+		} else {
+			igt_output_set_prop_value(output, IGT_CONNECTOR_HDCP_CONTENT_TYPE,
+						  content_type);
+		}
+
+		igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
 		break;
 	default:
 		fprintf(stderr, "Invalid property value\n");
-- 
2.43.0

