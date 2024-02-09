Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A87C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 13:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055DB10F458;
	Fri,  9 Feb 2024 13:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ls8r45iH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB24410F459
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 13:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707486949; x=1739022949;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8d3dR/zo7c/k5oEmYI6wurmbKeXKjkz9g9P83WzM6Uw=;
 b=ls8r45iHt7bd9UgCdiGUQtz173ULSqT+n6RYkrECYJIOUCNYcO8GzO9A
 CC6ooA5BxeoYAqj5Do7oF9w3n+6Ttqf5V09pwzotG313XscbLG0uU82vM
 oCf5MBl4SLFy20U88UKQ7H7T4ItP7cxa3Q6XKQaq9Dv1o7RkmJnWMWSUg
 Cko8ZDNlq4qP6qwOzUfv59zuNHQoPppxPb/4yGH0/xMFUGapuZvkEUJOj
 An+odpKc65AQ6u2UXDUxEXPrDCtJcC6z5zgZACb4qIrNglreUyx9J3YLn
 OdktNEEXc791ldAog6r7xdbu4sML++yh9gp4Y3yPf1GFEWl3DFY3fwBwD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1322135"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1322135"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 05:55:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1928579"
Received: from ndcioban-mobl3.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.246.112.73])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 05:55:48 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Invalidate cached
 stuff
Date: Fri,  9 Feb 2024 10:55:27 -0300
Message-ID: <20240209135526.135380-2-gustavo.sousa@intel.com>
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

The test pipe-fbc-rte updates the primary mode parameters for each valid
dynamic test case. Because of that, we might endup with invalid cached
data due to differences between the initial state of prim_mode_params
defined from the beginning of the test program and the possibly changed
state after pipe-fbc-rte.

As an example, in a specific environment, the command

  ./build/tests/kms_frontbuffer_tracking \
      --run-subtest pipe-fbc-rte,fbc-1p-primscrn-pri-indfb-draw-mmap-wc

would result in fbc-1p-primscrn-pri-indfb-draw-mmap-wc failing because
it would try to read CRC from pipe B while the test was being actually
done in pipe A.

Another potential issue worth noting is that even pipe-fbc-rte could
similarly fail if the set of dynamic subtests spanned across multiple
pipes.

Let's fix that by making sure that cached stuff that would depend on the
primary mode parameters gets properly invalidated when prim_mode_params
is the target of init_mode_params(). This should fix the issues
mentioned above and also future-proof the code for any future test that
would need to modify the prim_mode_params.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 912cca3f8d45..17f74990979e 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1484,6 +1484,7 @@ static drmModeModeInfo *connector_get_mode(igt_output_t *output)
 static void init_mode_params(struct modeset_params *params,
 			     igt_output_t *output, enum pipe pipe)
 {
+	int i;
 	drmModeModeInfo *mode;
 
 	igt_output_override_mode(output, NULL);
@@ -1515,6 +1516,18 @@ static void init_mode_params(struct modeset_params *params,
 	params->sprite.w = 64;
 	params->sprite.h = 64;
 
+	/* If we endup changing the primary mode parameters, we need to
+	 * invalidate any existing cached stuff from a previous configuration. */
+	if (params == &prim_mode_params) {
+		if (pipe_crc) {
+			igt_pipe_crc_free(pipe_crc);
+			pipe_crc = NULL;
+		}
+
+		for (i = 0; i < FORMAT_COUNT; i++)
+			blue_crcs[i].initialized = false;
+	}
+
 	free(mode);
 }
 
-- 
2.43.0

