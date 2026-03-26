Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA12106F2FC
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 08:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1814210EA06;
	Thu, 26 Mar 2026 08:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlTOryac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A81B10E30A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774514597; x=1806050597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e0WOAGrM8SjmSAj3gyU/cl60R5dpDTpbVi0qk6vMzVo=;
 b=mlTOryacagYqtFV340lGptjeZtBK8/2P0x0WTkX/aRTKkT7SgDWdnpfk
 d66+C5rtBSb/IrViZxCfN7A3NwmrMl44U84Ked9GMsnFyPjeA3cSfqHY1
 IQgELveSpR9uquKLfbi6+9SFhXH3ntl3ZuixT8du4ShzLZ32BXaZYzSQq
 dKKG+7Nsnaz/P8q6QqQmHAiMVYm0FTJzCEibZwxZTbi4civHquyZSfESD
 c1uxezFj/yvFXaU7/0XEgmSHIfPItTXFrLbhnSbhiWCadx0t/ubd5gjDx
 H4i/WFS71sk+vg9IQfC4czrPRd2PNVnyGz1UuPDNSdMAx7GkgYiqvf0YH A==;
X-CSE-ConnectionGUID: aemcl2IIRyWK+k3AFMQkoA==
X-CSE-MsgGUID: yXAd/gfvQjeTau0NQgTC9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75450316"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75450316"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:43:17 -0700
X-CSE-ConnectionGUID: FEIVWt9uRq27uoy2phNJFg==
X-CSE-MsgGUID: wEdjXOoTRL2hf07/tTMvRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224874974"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:43:16 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v5 3/5] intel-ci: Add VGA chamelium exclusion to Xe
 blocklist
Date: Thu, 26 Mar 2026 14:34:15 +0530
Message-ID: <20260326090417.864673-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326090417.864673-1-sowmiya.s@intel.com>
References: <20260326090417.864673-1-sowmiya.s@intel.com>
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

From: Mohammed Bilal <mohammed.bilal@intel.com>

Remove VGA-related subtests from the Xe chamelium testlist as Xe
driver does not support VGA connector types.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index edc5039a9..80a0ee904 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -128,3 +128,7 @@ igt@xe_exec_compute_mode@non-blocking
 ##################################################################
 igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
 ##################################################################
+# Remove VGA-related subtests from the Xe chamelium testlist as Xe
+# driver does not support VGA connector types.
+##################################################################
+igt@kms_chamelium.*@.*vga.*
-- 
2.48.1

