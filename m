Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE260C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 05:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BA010E751;
	Thu, 12 Jun 2025 05:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtABxZ0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B4E10E729
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 05:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749705302; x=1781241302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6EdA2ZcgH0zYnApfanNTzvNs6P/oWnzncQL8zXjV0q8=;
 b=GtABxZ0tFhMEdrakJ0E9TSych6kwlX9Q4QCuxiZs63NtzuaoV/r4z/OL
 OLRY3DT7ma76TCmXsjO3AFgshhgE9KVrTO+iZsvgMWZuAb1WJlmRJd53c
 tgdr7yTfihRjWfZvr62XJ29PQwik6/grfvsM7rrYL5ihUMbNnLnMIhwl+
 cUiUiJt9EScQmznJabe8hi7FXYgCZc0arSU12DDO7qphl0b1Qzyu/7Itl
 Km/ZhnMkRuUrfnSaCcAGyHOBMtgFCuKvHtxyJpCKIPUaPWlc7eJBV62kp
 bspy/nVFuZhpT0pRZSZFyRujfhy06HSLCS+KZcTKdC3TwoTnCjSUMZmb8 w==;
X-CSE-ConnectionGUID: vTwA6otHSlK/J9jSUyHeiw==
X-CSE-MsgGUID: 5CSgs4yARq6OBrK3loF5oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="50974851"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="50974851"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:15:02 -0700
X-CSE-ConnectionGUID: DTApyJGGQR64eSG4HA89IQ==
X-CSE-MsgGUID: ecC1yxsYSVKl+v9UDC/5Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="151210272"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:15:00 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/kms_content_protection: Skip empty vendor
 names in blocklist
Date: Thu, 12 Jun 2025 10:43:26 +0530
Message-Id: <20250612051326.430330-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250612051326.430330-1-santhosh.reddy.guddati@intel.com>
References: <20250612051326.430330-1-santhosh.reddy.guddati@intel.com>
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

Move the blocklist check after hdcp support check on a connector.
This will avoid unnecessary skips when multi displays are connected
and one of the outputs is blocklisted.

V2: Add Fixes tag (Suraj)
V3: Split to separate commits and fix indentation (Kamil)

Fixes: 6a256bfe3025 ("tests/kms_content_protection: Whitelist check for panel support")
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index b0d0b0234..51fc1d3be 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -637,9 +637,6 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 	}
 
 	for_each_connected_output(display, output) {
-		igt_require_f(!is_output_hdcp_test_exempt(output),
-			      "Skipped as the panel is blacklisted");
-
 		for_each_pipe(display, pipe) {
 			igt_display_reset(display);
 
@@ -652,6 +649,12 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (!output_hdcp_capable(output, content_type))
 				continue;
 
+			if (is_output_hdcp_test_exempt(output)) {
+				igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
+					  output->name);
+				continue;
+			}
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_content_protection_on_output(output, pipe, commit_style, content_type);
 
-- 
2.34.1

