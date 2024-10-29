Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFBED3A678
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 18:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F45410E6C3;
	Tue, 29 Oct 2024 18:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPdg9RVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC9A10E6C3
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 18:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730226194; x=1761762194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9nsPCiE4SHAwrIAoOiex+1AAwHVNuLBOew2QYQmNj7g=;
 b=nPdg9RVKHPyt4bkAP35tuhLodJY1IXXfou6HDb7tNjYmXSUccNZ2Zyrh
 Bipl1Yl/yGmK7OPexUtRXTJE6F9/hhiVmHhy+DDmkuU5P9BoaKZcqgupp
 K8nzrsRithHmvDVfw9isM6pRosALGmyJkhl3pnlS1M5kjqkAw7KqM1BD0
 g4iaeURVnJk93IKdLKEFXBiyf2itY7nlDZ1O9f1T8ZnnKsYKueWqfMu+X
 WwEJSyNKN5b/om+KjKXuYbtBsssa9p8gLPsIw6x5MeGTON5Ax9gQR8JM5
 /R+PboJ1Mo6auhWy8H60jWYWL+wgm3KU/bp5kFzjjcoe0wEsrmXylZDIv Q==;
X-CSE-ConnectionGUID: NzL4rP9pR1ukHuwVw8LsWQ==
X-CSE-MsgGUID: inRrlYa4Tt+6CYKFsOMaxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17524573"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="17524573"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 11:23:14 -0700
X-CSE-ConnectionGUID: HpdZ/cbTTKixj5bc4oe0dw==
X-CSE-MsgGUID: Ptp+m4lNTPyGKpXUJSoSAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="86604379"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.27])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 11:23:13 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/2] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_wedged
Date: Tue, 29 Oct 2024 19:22:59 +0100
Message-ID: <20241029182259.125117-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029182259.125117-1-kamil.konieczny@linux.intel.com>
References: <20241029182259.125117-1-kamil.konieczny@linux.intel.com>
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

Test solution which should allow igt runner to properly
classify xe_wedged tests as success, so adding two into
xe BAT runs:

igt@xe_wedged@basic-wedged

igt@xe_wedged@wedged-at-any-timeout

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..2bb7bebd9 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,12 +1,16 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@xe_wedged@basic-wedged
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
 igt@fbdev@read
 igt@fbdev@write
 
+igt@xe_wedged@wedged-at-any-timeout
+
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
-- 
2.47.0

