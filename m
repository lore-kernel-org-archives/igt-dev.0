Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9933C36017
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 16:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D28B10E823;
	Wed,  2 Apr 2025 16:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVJM1WOs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFDA10E201
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 16:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743610357; x=1775146357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z/WIhFE/JpEbMADtbbkNjelkrRua8GoeecilWMvNAmk=;
 b=AVJM1WOswmro9/LKZB8aywH6yxsOM7KGVwSBFcD/PIdTCVMsiBghZx+S
 jJ7iJ2YJ4JKj5NxzCcgtgkgJAluSudDiMmhAa6hgYtnihOLtsEQZX4Nxu
 6p+/nAccZmLtS7UTRHHs184IuCdUn8YCK6D9gaThdqTTCpO6A4fn3qXOw
 E9Spj18TyjmMP05eN+CXK+7gvl1R9pzb9dz1j8zZbvIlRspP2ZUFktYOv
 4V3jz+sDV0D44WG8OnmFqvd7D21Id8cMIyDQuBGBCneNZfar2qnTOoGgm
 xa8AyJjVfe8dqBmedoIJjTSWyh/bIH7TwpJMH+aFpyg+JIu5QWhs6niTb Q==;
X-CSE-ConnectionGUID: gZMiHGEHQrmA7dW9KHW+qQ==
X-CSE-MsgGUID: MWGF/xJ0TzCfX+8wDRsX1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="32594206"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="32594206"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 09:12:23 -0700
X-CSE-ConnectionGUID: Fyk1EnHkQnSNN+Ar5a373Q==
X-CSE-MsgGUID: xYydc8kqRRCrMuJBtkMNlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="126503255"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.233])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 09:12:21 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v1 2/2] intel-ci/xe: Block more i915 tests in Xe runs
Date: Wed,  2 Apr 2025 18:12:06 +0200
Message-ID: <20250402161207.66601-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402161207.66601-1-kamil.konieczny@linux.intel.com>
References: <20250402161207.66601-1-kamil.konieczny@linux.intel.com>
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

There was added new generic Intel test intel_sysfs_debugfs
which checks sysfs and debugfs for both i915 and Xe.
Lets block i915 ones for Xe runs.

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 80ceba9a5..d02d0f73e 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -20,6 +20,7 @@ igt@gen.*
 igt@i915_.*
 igt@perf.*
 igt@sysfs_.*
+igt@.*@i915.*
 ##################################################################
 # Exclude mock DRM KUnit from IGT, as those already run at build
 # time on Intel CI
-- 
2.49.0

