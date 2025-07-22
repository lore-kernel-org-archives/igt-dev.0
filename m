Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD8DC83F27
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 12:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A94610E2FD;
	Tue, 22 Jul 2025 12:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9zidZnw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1396510E2FD
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 12:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753187975; x=1784723975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hmfj17/KiG3Gk1wXYtOpvqMDwE02X2QnjxMgH3uevao=;
 b=a9zidZnwNTE8GQDeZR86EmruB5zGqgwoFw7aDSF1U/olyiljU72c4vzy
 K5Wo4crvPPzNRXXdc1imU+lvIHIAEYpd4IMy94GVg+ka7B9IgSuaLf93F
 CoTw6S5apPXWe8Gy6+rHVz3Onp55cQ3sUgHtPzGnxMXIqZdtxvYGz/Ajb
 uwwKxccLihDHl4YSQu9lXvHM8+nMAUflfwFwa7RATX8fV6Z867BqMzmCA
 q3yE9XMRQovj5axqHdp4B8ePonGiSmSpgN9dZrizlhWbF00NkB5/CWK2F
 vx/ysXaVco5QKnW12YtRD2YcI+ek8CwM6WnQ+pMVoSOPIP1qGDbjEF9rW A==;
X-CSE-ConnectionGUID: L12UsyeaTHuw+a3/sInf6A==
X-CSE-MsgGUID: 83qRagMISJGwCcn9XCY/3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55377517"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55377517"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:39:35 -0700
X-CSE-ConnectionGUID: NgcjDlHQQqSt2q6NppmIrw==
X-CSE-MsgGUID: dnClGo/JQ8GvmO79sN/DnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="158448285"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.252])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:39:33 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/2] intel-ci: Block VKMS for i915 runs
Date: Tue, 22 Jul 2025 14:39:19 +0200
Message-ID: <20250722123920.78238-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722123920.78238-1-kamil.konieczny@linux.intel.com>
References: <20250722123920.78238-1-kamil.konieczny@linux.intel.com>
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

These are non-Intel tests so block them from running.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/i915.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index bb4b8dfec..ac9bb2f0b 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -126,6 +126,10 @@ igt@msm.*
 ###############################################
 igt@.*virtgpu.*
 ###############################################
+# VKMS
+###############################################
+igt@vkms.*
+###############################################
 # Hibernate: not configured correctly on CI
 ###############################################
 igt@.*@.*-hibernate
-- 
2.50.1

