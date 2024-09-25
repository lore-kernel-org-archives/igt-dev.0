Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4002AC369CA
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 10:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F413910E7E6;
	Wed, 25 Sep 2024 10:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRHr5m1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E776310E7E6
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 10:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727260436; x=1758796436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HghsmK2Ejzenjk1CZlXLzpEPMoN9RUG9zGYkLDxXjY8=;
 b=lRHr5m1DRoQBe5zvwvTSr+uxh7YwiMJ6XR82eDFrG4q/inYyNGPdKEKC
 T2DA74RWNAHITTIqi9qjpMh8+nOnSfDXOol6DKAFeFwqcM8E7DOOgiWhh
 qbFqpnQg8XiAcokCZ/XR30TcrJ98jDcR6SqcMK1/rKEBjTlHWj+7ju0sO
 LAyF6EBi0TE3YDU3SW9xyL+KLYaUOWWyJY15NWJSeAxYChLFzJK6o1wWC
 elTLWk4PxY7H9iZUqxDMYUD/4uDTzvMxheDa1LvC8AYUNvyM+loB1K4ew
 s8brVkhurKksaeY9s+KIuN4xoENQG8M+DjCV2O7hBY+cgDGnHTwrknmzc g==;
X-CSE-ConnectionGUID: guyjy77PTsG/jdGw94HdHw==
X-CSE-MsgGUID: /mU2h4xHQXGg++1bAF8Q6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26247941"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="26247941"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 03:33:56 -0700
X-CSE-ConnectionGUID: rCb+aI+SSRidS0+4scfe+Q==
X-CSE-MsgGUID: wicJ0CmrTe62YWug4WBu7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="76659005"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 03:33:54 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_plane_scaling: Add mode override in
 scaling test
Date: Wed, 25 Sep 2024 16:03:12 +0530
Message-ID: <20240925103313.2126359-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925103313.2126359-1-ramanaidu.naladala@intel.com>
References: <20240925103313.2126359-1-ramanaidu.naladala@intel.com>
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

Add a call to igt_output_override_mode to ensure the correct mode
is set for each connector. Modify check_scaling_pipe_plane_rot
function to include igt_output_override_mode. This change helps
in accurately testing the scaling functionality by explicitly
setting the mode before running the tests.

Fixes: 27926dd57 (tests/kms_plane_scaling: Find display mode fitting in BW for rotations)
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_plane_scaling.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index bc9114acd..96ceedee2 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -585,6 +585,7 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 
 	for_each_connector_mode(output) {
 		mode = &output->config.connector->modes[j__];
+		igt_output_override_mode(output, mode);
 		igt_debug("Trying mode %dx%d\n",
 			  mode->hdisplay, mode->vdisplay);
 
-- 
2.43.0

