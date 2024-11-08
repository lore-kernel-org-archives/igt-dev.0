Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BD4D64085
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 20:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120CE10EA3B;
	Fri,  8 Nov 2024 20:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2XR7olu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F59210EA3A
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 20:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731097134; x=1762633134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9nsPCiE4SHAwrIAoOiex+1AAwHVNuLBOew2QYQmNj7g=;
 b=m2XR7oluOeFhgObbTeG1Qm5aySiMElYyq12FeVOpZ5QWjeTqX61pxdUS
 y0h2tv5N6KVBPBEG7rWKopzAJNSlMHy+JPErv9osFtXq4MGHBjLPzCukR
 9shdjFLN2LwsKcOwtZZo/ugpnYBUn1R+YS1ZUAOKxrWJMm1KpD3wHOoun
 sKSk1jUBIWzmRXhcG0Y2Sav6BUMfm3p+lQBjjw6YVGv4PZhpQxghh38uz
 89/BNMtNqa/2yuGTOVBVgaZC5C4r17IV5QsBq7WkUlut2Baq418GoDKif
 dc9HFn1wxSn3IY4rfmNni4SZ1pXxboWy5CFH8DqrEuTWQk8uG5od3PXgx w==;
X-CSE-ConnectionGUID: AOVqGkqHSWW6OSWh3fwwwA==
X-CSE-MsgGUID: j33WpgJ/TWudIU0xnWWaMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30390942"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="30390942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:18:54 -0800
X-CSE-ConnectionGUID: 6mZkGALXQSKpS1vNmEq3Jw==
X-CSE-MsgGUID: NLLS8zv2TLyrtOKt7BnBYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85621328"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.135])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:18:53 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 2/4] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_wedged
Date: Fri,  8 Nov 2024 21:18:37 +0100
Message-ID: <20241108201839.119079-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
References: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
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

