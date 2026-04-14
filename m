Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AE4F531F8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E3810E28D;
	Tue, 14 Apr 2026 07:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRs5REeH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E9410E28D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150917; x=1807686917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YpfQ+IIKDSYYgpPADjqeyevVCIo9NSQYWIqPh98NSeU=;
 b=KRs5REeH37t2W2T3Hu5FwdXnNcgxxai1JZdd0BpQbJLPTCtMttpGGTIQ
 /G3UnrCBI6UK2dha1Mpt77/+GA6fYfLvGk7GYbngH2GovGxIPMHaoswKX
 SoW9Uuod+xmaJQ9Q6bPGNt2UYBSTDSpDgMsLOIzOGINLPLWS2mTGB480y
 UEKjURADY0Zj7TanfLhZi53OKXIyLDHXSDBJF+Uq4B//M4cGaaMey9cd9
 el6glAdzWJYf+sANIoXOJ/a8LUAvDjY6gu1uIngZOAvR72YVnyc4sgUZl
 hNM3Gb31g03jrDuWn0rdimxR3u9YRlUUhWCxuX3swQ321IwyP+ULc3jb8 Q==;
X-CSE-ConnectionGUID: VZlTHRRfRhC6P+X/PX3VnA==
X-CSE-MsgGUID: OEE7B+6nSH65q74e6Qssqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80690972"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="80690972"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:17 -0700
X-CSE-ConnectionGUID: 1jT39p5xRRm0bXjNkpFVvA==
X-CSE-MsgGUID: 7NmXXzEtTGiA0jotXKOv9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225712390"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 07/16] tests/amdgpu/amd_abm: use for_each_output()
Date: Tue, 14 Apr 2026 10:14:27 +0300
Message-ID: <c63cf4e59cab5bd574bf89f63d3bc1e8a928335a.1776150714.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776150714.git.jani.nikula@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Use for_each_output() instead of manually iterating display->outputs[i].

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/amdgpu/amd_abm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 1752a7e5c48d..d36044aabfaf 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -112,13 +112,13 @@ static void fbmem_draw_smpte_pattern(uint32_t *fbmem, int width, int height)
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	drmModeConnectorPtr conn;
+	igt_output_t *output;
 	bool has_edp = false;
-	int i, fb_id;
+	int fb_id;
 
 	/* Skip test if no eDP connected. */
-	for (i = 0; i < display->n_outputs; i++) {
-		conn = display->outputs[i].config.connector;
+	for_each_output(display, output) {
+		drmModeConnectorPtr conn = output->config.connector;
 
 		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP &&
 		    conn->connection == DRM_MODE_CONNECTED) {
-- 
2.47.3

