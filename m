Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F060FD7F95
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 11:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFEE10EAFB;
	Fri, 27 Feb 2026 11:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbCPEgIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE22B10EAFB
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 11:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772190522; x=1803726522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l6gNeR38ZuSA3eNL/Fr2aX8eyTG5Fg8cflnLhgIiH9g=;
 b=UbCPEgIMZ1I7TRMIZyENTlk4sOOTjNb6chBgRotsvofPT916GaKr7FUE
 VMInHzmSCgFzJpaLYf2DpK/kmHVYashpjnEpcTEyD79QJfsO41ZbVl+JJ
 sxJLFE8/oDmGZzVu3rNergL4NGCprcRosCL0e9Avr+iXh8pvf64JEOrIU
 7fqQGVHE+VSB/SJLkXzosT/sBpGXuf0NY728lLG2AXaYss+DV9ZxWlHrB
 A8k4SKTvESQH0D6AU4r3uQX4n0R6rC7L2f6DZHXurITtludVRw4MkDuMR
 yXeAVb4dnCwJ3XkBK2/TDYnE5QtQltjFp2x/0akPG+dB0xu7Dhm167ZM/ g==;
X-CSE-ConnectionGUID: 1BavQlccSDe5xc3ZvVdPvw==
X-CSE-MsgGUID: sBHkbEQdSeKC+TCIyu0O3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72472569"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="72472569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 03:08:41 -0800
X-CSE-ConnectionGUID: jAKiHXVaS8e4RnBup59eRw==
X-CSE-MsgGUID: HdzfYFHSTXCRZ5MQvn1CJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216884402"
Received: from skishor1-nuc12snki73.iind.intel.com ([10.227.88.189])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 03:08:40 -0800
From: sumit kishore <sumit.kishore@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, santhosh.reddy.guddati@intel.com,
 sumit kishore <sumit.kishore@intel.com>
Subject: [PATCH i-g-t v1] test/kms_content_protection: add debug prints and
 remove non-traceable check
Date: Fri, 27 Feb 2026 16:37:45 +0530
Message-ID: <20260227110745.203101-1-sumit.kishore@intel.com>
X-Mailer: git-send-email 2.43.0
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

improve the debug logging, when tests are skipping and remove the non-traceable check

Signed-off-by: sumit kishore <sumit.kishore@intel.com>
---
 tests/kms_content_protection.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index f35c9fa73..034c2439c 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -597,12 +597,11 @@ static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
 
 static bool output_hdcp_capable(igt_output_t *output, int content_type)
 {
-		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
-			return false;
-
-		if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] &&
-		    content_type)
+		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION]) {
+			igt_info("\tSkip %s (Connector does not supports HDCP protocol)\n",
+				output->name);
 			return false;
+		}
 
 		if (content_type && !sink_hdcp2_capable(output)) {
 			igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
@@ -614,7 +613,11 @@ static bool output_hdcp_capable(igt_output_t *output, int content_type)
 			return false;
 		}
 
+		igt_info("\t%s (Connector supports HDCP protocol)\n",
+			output->name);
+
 		return true;
+
 }
 
 static void set_i915_force_hdcp14(igt_output_t *output)
-- 
2.43.0

