Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB5BC28B23
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 03:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2121A10E10A;
	Thu,  6 Mar 2025 03:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IE7iH90g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB7D10E10A
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 03:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741232664; x=1772768664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=awYxnLZ7LR2LO+YVGWJ/JL4/O9381IlSR8R+mXkFqBc=;
 b=IE7iH90gTuJDC86VXfa6XF0u2WzAfjVGqCqVVWUA/aUc8Q2VB6K8iMOr
 mt2NjXtoEqZeb5EA5Xethts76/VH51OzU6y2mkop/X044EwpOBTQC+nJ/
 XdHhYJ/qGO+czkEDcnIuYB0yGwr+jIoLmCqt0/Q0+VMD8/MtVvIMV+Vh5
 1IeItzzDvqEzGMMOJcmbQcYKMcNWTXiVH9Ev/B9+IxhSy03oR0m6trQtO
 VyT2UXM54O23uXwYhMaZmPRtP7wREwVsYV6xUC6zjNKkGIOpc23n/ch+O
 p5C5T633JWPp5UNRt4kfmlyR8tWR5qMtmD08aj/GgZ/DVOb/HLbM/INxq Q==;
X-CSE-ConnectionGUID: GEZ7vJuoQxuMsrommOfDOQ==
X-CSE-MsgGUID: 4Et6JOV8QlOn0UNQDSM3Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64673561"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="64673561"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 19:44:24 -0800
X-CSE-ConnectionGUID: CC2J7MPqQyKLsLfpMaZmCg==
X-CSE-MsgGUID: CtF9NKS0Si6/H9nKkMjEzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119403328"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 19:44:21 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, ramanaidu.naladala@intel.com, jouni.hogander@intel.com,
 kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 3/3] tests/intel/kms_psr2_su: Skip PSR2 su test on
 joiner
Date: Thu,  6 Mar 2025 09:09:52 +0530
Message-Id: <20250306033953.2519156-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306033953.2519156-1-santhosh.reddy.guddati@intel.com>
References: <20250306033953.2519156-1-santhosh.reddy.guddati@intel.com>
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

Joiner cannot be used along with PSR2. skip the selective update test
on the joiner outputs.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_psr2_su.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 0099daf1d..a4126b608 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -389,6 +389,11 @@ igt_main
 							 */
 							igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
 						}
+						if (is_joiner_mode(data.drm_fd, outputs[i])) {
+							igt_info("%s supports joiner mode, can't test PSR2 + joiner\n",
+								  igt_output_name(outputs[i]));
+							continue;
+						}
 						prepare(&data, outputs[i]);
 						run(&data, outputs[i]);
 						cleanup(&data, outputs[i]);
-- 
2.34.1

