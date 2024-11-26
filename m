Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48BBD6553E
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 18:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850D410E97B;
	Tue, 26 Nov 2024 18:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQQKHE9/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D2010E9A1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 18:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732644661; x=1764180661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hL2UElCPD3M/JmUAcblmB//Z605GDPW5oEpoNewhxNo=;
 b=NQQKHE9/pGXtcd027v9leV2JTZ1TaSo5FmUz2jYfsWXlqpLjNio56MY5
 c8twvFUv9dyTpwL2wGOw6dEbrVxVmHM/ruZlzgg0W9Js0q61PWeQsUB0S
 B4Ex8qJEfUfySgQgB2zaH5tog+w5mvbEv45igVw7nQyXA7P/4lf+HCHat
 Jd+JRLYCgDEhFoCIFlg040ISTJxnwaiwG+3qg3enXeYiMFxs4UsuXOSOm
 3BrAak0VR9utdCCvuVl/pUSE+x68HTRjK6RUqn/PTNJRl+YZ+KUSOXAIm
 DH/z+8KVSJeiqv20HWCWOJepZ7fR5I1J5JCTrq8+OBJK+jX3O5v6tQ1Us w==;
X-CSE-ConnectionGUID: YG5VwzqwRCKnVy4vhnb1Bg==
X-CSE-MsgGUID: 4gMjZHI8Qiu/Y63TjIVVtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32952190"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32952190"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 10:11:01 -0800
X-CSE-ConnectionGUID: rTCH4hxxTy2DHKWbZPMCng==
X-CSE-MsgGUID: XU4NZUImS/WuxqkZrX0lxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91583224"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:11:00 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 2/4] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_wedged
Date: Tue, 26 Nov 2024 19:10:21 +0100
Message-Id: <20241126181024.1398259-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
References: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
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
index 727be9230..05112b221 100644
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
2.34.1

