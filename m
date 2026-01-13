Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5F4D2D0E0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 12:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B75010E4B7;
	Tue, 13 Jan 2026 12:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtHoLtaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2869710E4B7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 12:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768305913; x=1799841913;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0jsXIAOfoTyOybaJXKwxZX2m2GWWi9DvMhdGjn+q+B8=;
 b=mtHoLtaavSW09gPAWv7lFeOJCHfIXz2QBAAT9T8/Zn8EemU3qu8whDsr
 r78qIXaxaijKFd4j3MR0Rd1R2LHzByAMk1RfblPG4wbS7VwOrl2breJXC
 rMvsR1aURftpXIy4TwawCiFHsRdge0QvjIY6Ks5ydSb2Om07VDgl3Grc5
 roU+k+/IluBZrZdoHWSC5TWfPuImUOigadpwuE28Au8KNXfc9VAwnqCUA
 kUmrMdDUnazZBzXbrtzZRzqkqSd2fsllSgsnEuMdHPJA1i/XcG1Vnu+Ws
 aUluGPdGhU82R3beqXH2stKK96mZq4/Fomu5zms3Zs+VGszAlL/qMmgJU w==;
X-CSE-ConnectionGUID: GnHsUdO+QZmVyc2q5kSpMw==
X-CSE-MsgGUID: S2natb3gTGaEH59jAwWrTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92256405"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="92256405"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:05:12 -0800
X-CSE-ConnectionGUID: AIQHEHwmSf6qeXI+APQbpg==
X-CSE-MsgGUID: hNuOpp58RIGy5rG6wDVqCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208836145"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.220.52])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:05:11 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 8/8] lib/kms: Turn igt_pipe_connector_valid() into a
 function
Date: Tue, 13 Jan 2026 14:04:39 +0200
Message-ID: <20260113120439.12577-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

There is no need for igt_pipe_connector_valid() to be a macro,
just make it a function. This gets us type safety, and will
help us do more changes later using coccinelle.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e1044101707c..a271c94a97fd 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -669,9 +669,11 @@ static inline bool igt_output_is_connected(igt_output_t *output)
  *
  * Checks whether the given pipe and output can be used together.
  */
-#define igt_pipe_connector_valid(pipe, output) \
-	(igt_output_is_connected((output)) && \
-	       (output->config.valid_crtc_idx_mask & (1 << (pipe))))
+static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t *output)
+{
+	return igt_output_is_connected(output) &&
+		output->config.valid_crtc_idx_mask & (1 << (pipe));
+}
 
 #define for_each_if(condition) if (!(condition)) {} else
 
-- 
2.51.2

