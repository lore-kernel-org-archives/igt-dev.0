Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5825DFD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7F410E772;
	Wed, 25 Feb 2026 12:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMgZ7oA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BF510E772
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023922; x=1803559922;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QmNQUEblViqR7PlWlYwZJR9CXTiskifxwXYoK1P1GcE=;
 b=HMgZ7oA0zDU6Kt5TSDHDCyurqGFvDi9HtlwVCZ5tYPice8VHniyO60XJ
 XTt+ToqTueMpEfglxsXV4uj1qnmZ4CAdKokCVr3PZs6iyolB45AWx3NiE
 Mxu3ioAQFWbhoPW173fJZVMo4yh1Yhc2/IomJEMMu3G9s1k7IDOlMvKNn
 Wv3lbCkn2hUmO3B3pRKbu5o/4gr5m6gbMq+wfQm6lpB3w9FeISK96DX1G
 JiiAAoaqefYFWym88EG4fT949/c0DciCoxT7RoowAFnHNGtDnhzVA6UPs
 Bk0DCUPIN+t5xvx2j5aVroMtYHkjAs2uaKagTHrx3tvCLca3vnl0EaNBX A==;
X-CSE-ConnectionGUID: 0UFwbxmISwm7pOFHBOTahw==
X-CSE-MsgGUID: RDgahnI5TXClQWn0FcKkFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76927683"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="76927683"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:02 -0800
X-CSE-ConnectionGUID: 0vrgafV3TbieW0G5Wo7LSQ==
X-CSE-MsgGUID: x9uDNixxRMmcZgF9CUpFwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="221226992"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:01 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 14/19] tests/kms: Switch to
 for_each_valid_output_on_crtc_local()
Date: Wed, 25 Feb 2026 14:51:03 +0200
Message-ID: <20260225125108.31119-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

A few tests have a local copy of for_each_valid_output_on_pipe(),
due to aliasing issues with the iterator variable I assume.
Convert those local copies to be crtc based instead of pipe based.

We should probably fix the aliasing issues in a better way that
would avoid the duplicated macros, but too lazy to look into that
right now...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_display_modes.c  | 7 +++----
 tests/kms_plane_multiple.c | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 60585bed0218..608081ddd085 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -182,9 +182,9 @@ static void run_extendedmode_basic(data_t *data, igt_crtc_t *crtc1,
 		for_each_if ((((output) = &(display)->outputs[j__]), \
 			      igt_output_is_connected((output))))
 
-#define for_each_valid_output_on_pipe_local(display, pipe, output) \
+#define for_each_valid_output_on_crtc_local(display, crtc, output) \
 	for_each_connected_output_local((display), (output)) \
-		for_each_if (igt_pipe_connector_valid((pipe), (output)))
+		for_each_if (igt_crtc_connector_valid((crtc), (output)))
 
 static void run_extendedmode_test(data_t *data) {
 	igt_crtc_t *crtc2;
@@ -202,8 +202,7 @@ static void run_extendedmode_test(data_t *data) {
 				if (crtc->pipe == crtc2->pipe)
 					continue;
 
-				for_each_valid_output_on_pipe_local(display,
-								    crtc2->pipe,
+				for_each_valid_output_on_crtc_local(display, crtc2,
 								    output2) {
 					if (output1 == output2)
 						continue;
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 297ac7ec2ccf..70c2381953c7 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -527,9 +527,9 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 		for_each_if((((output) = &(display)->outputs[j__]), \
 			      igt_output_is_connected((output))))
 
-#define for_each_valid_output_on_pipe_local(display, pipe, output) \
+#define for_each_valid_output_on_crtc_local(display, crtc, output) \
 	for_each_connected_output_local((display), (output)) \
-		for_each_if(igt_pipe_connector_valid((pipe), (output)))
+		for_each_if(igt_crtc_connector_valid((crtc), (output)))
 
 static void run_2_display_test(data_t *data, uint64_t modifier, const char *name)
 {
@@ -549,8 +549,7 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 				if (crtc->pipe == crtc2->pipe)
 					continue;
 
-				for_each_valid_output_on_pipe_local(display,
-								    crtc2->pipe,
+				for_each_valid_output_on_crtc_local(display, crtc2,
 								    output2) {
 					if (output1 == output2)
 						continue;
-- 
2.52.0

