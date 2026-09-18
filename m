Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFF7C982DA
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 14:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A32810E3E8;
	Fri, 18 Sep 2026 14:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSGHfJ8a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4A010F3DF
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789741225; x=1821277225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gqn+Pls6HcAzSLXu2tJKZ6eplUTOYjH6w2Lpomvr6So=;
 b=RSGHfJ8aagZWKwx4DFl01cVzBzaZU1dvB9U8wo1/5hvli09MHmz2y79+
 BJzILcKJRSAeGrAQqK3dc1dLvkjCWPQieZWN18+jmUx28xOzUaFXd+S0f
 Y7DygMhXsVU2ZNolMgdCO8b9iT0xYg0QeJRGrgi4FYq+o78XQTb7TJZ3x
 vSuoYwBO6YoDir2JORX+CzWh+0jXzvuvuTgpgKTJVq0jOa/Lyq49QH/0q
 DOFT2JFIYZlqCrVM80RBBb/UhQ5g/1kNjzBaeMQVlslOSESZfLOO79oo1
 Q/jgwUbOhMveUju1fmdRgyROxqUF+Ck+R/bl7/CjPPXS84humsKpoHdgz A==;
X-CSE-ConnectionGUID: z3V8Hk4gR7+prvXC/4SHDw==
X-CSE-MsgGUID: Z3CUsSIcQ22AijT3OBwcwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="100913932"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="100913932"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 07:20:25 -0700
X-CSE-ConnectionGUID: C+PuESyFSImNtxH0zLD1KQ==
X-CSE-MsgGUID: Q76jdHCYQga1kpFMKPYLCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="268164368"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 07:20:24 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 2/2] HAX patch do not merge
Date: Fri, 18 Sep 2026 19:50:22 +0530
Message-ID: <20260918142022.4096908-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918142022.4096908-1-ramanaidu.naladala@intel.com>
References: <20260918142022.4096908-1-ramanaidu.naladala@intel.com>
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

HAX patch do not merge

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 59d1cff2e..0e30a7dc6 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -67,6 +67,8 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+igt@kms_vrr@lobf
+igt@kms_vrr@lobf-dc3co
 igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
 igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
 igt@xe_ccs@block-copy-compressed
-- 
2.43.0

