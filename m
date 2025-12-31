Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3D8EEB574
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 23:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF76910E6FB;
	Wed, 31 Dec 2025 23:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISt0muJt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6045A10E6BE
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767223316; x=1798759316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GWNiPPa5iUvLbcB/KqIgZRVqVrhCx5FzQF7wg17m968=;
 b=ISt0muJtS+v7BOYj/wdcoSyqVrZKyelq7xXxZXLpP+gsDogzLyVmvM8w
 WS+ckGWXvXuiCfDo8hajcbbyXhnEaFpsx5MBX5JEGQKnPkSrGfZ665QBs
 DLwtFc8Jt91+B71HkKX8FoBONxaphT2Tlp6Kf3I7XghMwZDMdn20+0b8/
 nqkS1UgbGID/rkH61+y+hjb+NNHgX+Xq1/8wcPIT52Q49CuMKlcV9mWjP
 8uIPrWBqwqjWeQ6Pj7fdYA/eCWx+Es4Tca9BxgydTtot6VMMtg7I0qJLH
 Ajl6SHFdg9bZHAjl01eKp6TTTmGDBkIei+O5VscOLoHrqLnpR9t3YQOlT Q==;
X-CSE-ConnectionGUID: PVHaYGdHTWW+xUIQDOjOQg==
X-CSE-MsgGUID: VjkKTSSBRPWs25TN6lkQ+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67792699"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="67792699"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 15:21:55 -0800
X-CSE-ConnectionGUID: XlxQseKPQ8S/G7ysXA5FnA==
X-CSE-MsgGUID: 6ic8Z0CfQaKjr5XXPyU1Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="206572342"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa005.jf.intel.com with ESMTP; 31 Dec 2025 15:21:56 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v11 5/5] intel-ci: add xe_pat pat-sanity
Date: Wed, 31 Dec 2025 23:21:52 +0000
Message-ID: <20251231232152.127555-6-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231232152.127555-1-x.wang@intel.com>
References: <20251231232152.127555-1-x.wang@intel.com>
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

Add the new igt@xe_pat@pat-sanity subtest to the Xe fast-feedback
testlist so PAT configuration sanity checks are exercised in CI.

Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 15fce6a42..acff025fa 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -202,6 +202,7 @@ igt@xe_vm@munmap-style-unbind-userptr-end
 igt@xe_vm@munmap-style-unbind-userptr-front
 igt@xe_vm@munmap-style-unbind-userptr-inval-end
 igt@xe_vm@munmap-style-unbind-userptr-inval-front
+igt@xe_pat@pat-sanity
 igt@xe_pat@userptr-coh-none
 igt@xe_pat@prime-self-import-coh
 igt@xe_pat@prime-external-import-coh
-- 
2.43.0

