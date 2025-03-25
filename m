Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FFAC3600D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 20:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B81810E5EB;
	Tue, 25 Mar 2025 20:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEqCb4Ck";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE0E10E5EB
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 20:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742932951; x=1774468951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5RpJwpybctUUxsBLDu+DMykUXrXsDUwYm9CyfEAbEbo=;
 b=BEqCb4CkdU2xaBJjxtSp9fJfuYiWKnU44zfCrXydo64X704n+DWQudfM
 3VC6kOtYCEm/i8pmC+j8EyZ3Z0wXKcvMKNFwa/KnjaAAQuLoPBc5S20SY
 9UJvACd6NbSEer/1vIyWCEz4X0wU78bbTIT/u0EBi1SRSSP++TvY7eU60
 ngJBBaLma6aeFc8tU7zcteMo23Wgpz5GHnEsMnhC4v8Y9Ix2yl0JYQC+1
 Qj7xa2mZkaS9aZiFN8GZE1+Rl737H8nmub2FAzifk8PkLpRAsh669Bbxv
 a98zCI3otnV2G7e7E8QyWMvFgD9HAv8Bs8pwVYpab9rhiEDcJG3lHTkop g==;
X-CSE-ConnectionGUID: R6kx832cRgeEZ2zhWTUsCg==
X-CSE-MsgGUID: gPcZP4A+SrewV+/Kjh7pTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55565033"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="55565033"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 13:02:31 -0700
X-CSE-ConnectionGUID: ZyqUP8XWRdqAn2xGrvaiMw==
X-CSE-MsgGUID: ftDmVvrZSfWvssRvKJVK+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124201696"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 13:02:30 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/kms_vrr: Fix vrr multi-display issue
Date: Wed, 26 Mar 2025 01:32:08 +0530
Message-ID: <20250325200209.3329037-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325200209.3329037-1-ramanaidu.naladala@intel.com>
References: <20250325200209.3329037-1-ramanaidu.naladala@intel.com>
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

Ensure consistent output timing by changeing the conditional logic.

v2: Updat logic to set the default rate to the midpoint
    if unspecified or out of VRR range.

Closes : https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4227
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index c4bb30f6a..fd05ebc89 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -324,12 +324,19 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	int num_painted_fbs;
 
 	mode = *igt_output_get_mode(output);
+	data->range = get_vrr_range(data, output);
 
 	data->vtest_ns.min = igt_kms_frame_time_from_vrefresh(data->range.min);
 	data->vtest_ns.max = igt_kms_frame_time_from_vrefresh(data->range.max);
 
-	/* If unspecified on the command line, default rate to the midpoint */
-	if (data->vtest_ns.rate_ns == 0) {
+	/*
+	 * If unspecified on the command line or out of VRR range,
+	 * default rate to the midpoint.
+	 *
+	 */
+	if ((data->vtest_ns.rate_ns == 0) ||
+	    (data->vtest_ns.rate_ns < data->vtest_ns.min) ||
+	    (data->vtest_ns.rate_ns > data->vtest_ns.max)) {
 		range_t *range = &data->range;
 		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(
 						(range->min + range->max) / 2);
-- 
2.43.0

