Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D007E9B365
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 11:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E6910E010;
	Mon,  2 Mar 2026 11:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmswhlhN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0BE10E010
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 11:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772450679; x=1803986679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BEeV9wnt0Fdi+mh+ejxBV/0cqTMx5WF40mB5nHaYYpE=;
 b=RmswhlhNeUszS4chGfcizgv0jtr3qeUNP+y+O5dUaAEBgpGExQ9oLHW0
 UhrhtI8PO9O3d+7AApTeVxC4lnps2uKF4S8UZVXw1ZZuodnefCQPetaql
 EQwKPJZgHy+Nq+nztLPpDA86TAs9695xDWgNTMR4tcMUYRYMC3ccNU3PD
 tNpKM1HwHUISMVNG7hAeEFYATUkSkp+LcefbMjdlhOMZGaE4Ew9hrKYDb
 CB/Ebbcaq67qu5RI2lLy4IMk2GfPeV6D33XqxxMFKSWCHwQcyzDGMVJOv
 Ps9DdCuJ36BZqJSIIFRJ4cJxsr75tPRruTOgySq3mIOLJbHsrEu3iE8xq w==;
X-CSE-ConnectionGUID: SNaA9b0aQW+Xnxw6DuWbJA==
X-CSE-MsgGUID: 7VfUOc2EQt2URiswj4L+gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73640290"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="73640290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 03:24:39 -0800
X-CSE-ConnectionGUID: h11okTGyQLSHGYnIsThRRQ==
X-CSE-MsgGUID: rQcaUQ+TQXCoIDnNEMkJ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="255482856"
Received: from skishor1-nuc12snki73.iind.intel.com ([10.227.88.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 03:24:38 -0800
From: sumit kishore <sumit.kishore@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	sumit kishore <sumit.kishore@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_invalid_mode: add prints when test skips
Date: Mon,  2 Mar 2026 16:53:39 +0530
Message-ID: <20260302112339.214912-1-sumit.kishore@intel.com>
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

add debug print to display the reason for test skip

Signed-off-by: sumit kishore <sumit.kishore@intel.com>
---
 tests/kms_invalid_mode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 5edffb649..8ba488812 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -266,7 +266,9 @@ test_output(data_t *data)
 	 * sure everything is really getting rejected?
 	 */
 	mode = *igt_output_get_mode(output);
-	igt_require(data->adjust_mode(data, &mode));
+	igt_require_f(data->adjust_mode(data, &mode),
+		"Skipping as %s has scaling properties\n", igt_output_name(output));
+
 
 	igt_create_fb(data->drm_fd,
 		      max_t(uint16_t, mode.hdisplay, 64),
-- 
2.43.0

