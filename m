Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821C9C47DB7
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 11:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7EB10E9B7;
	Fri, 19 Jan 2024 11:58:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9E510E9B7
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705665507; x=1737201507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oCv+AHYN0ShdBKzK8GiLIaC5cy+9YGD3+bigQXEGYGM=;
 b=KNR1TPA8FqxubnXRFf8aNrwCkk//i5A7GT8Tpw8m3TsdP6+oB2BzUGWJ
 Bc586tUj4kg6UBAIBvncEJ2qTBqgDuhfzCPqT8Q/yAkhXH9qWNwsIXt9J
 6acL34rQZBhDyt68Dy1W8osZKn9w6tq0hGnvRZ/5M4nq1BzJNPPdCvr9y
 5kKW63PPrqAibmO8+GQBV63CxZiugQOQV1qiQl+G46e9FHGNjDJmRiPE4
 EVbETgCWM809FfUs/aKk3d0ecjN/e80Jgu7tSO6/PVmjOjEjT27cNSKX3
 Qs6bD1jVmTUmI8u99MCuWzUPAJp0crlND4Bfd7LUxNKbsGcXsgFWOIRL9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="465008217"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="465008217"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 03:58:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="788346454"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="788346454"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 03:58:25 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 4/4] HAX: Add d3-mmap to xe-fast-feedback
Date: Fri, 19 Jan 2024 17:25:54 +0530
Message-Id: <20240119115554.1699060-5-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119115554.1699060-1-anshuman.gupta@intel.com>
References: <20240119115554.1699060-1-anshuman.gupta@intel.com>
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
Cc: kamil.konieczny@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Adding d3-mmap to xe-fast-feedback.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f297fe965..f35871dd1 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -115,6 +115,7 @@ igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pm@d3-mmap
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.25.1

