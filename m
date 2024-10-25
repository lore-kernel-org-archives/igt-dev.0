Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01604D149CD
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 17:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2D510EB28;
	Fri, 25 Oct 2024 17:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kuV9q61l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BAA10EB28
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 17:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729876381; x=1761412381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9nsPCiE4SHAwrIAoOiex+1AAwHVNuLBOew2QYQmNj7g=;
 b=kuV9q61lIzzZeetK+BKfikoAf/jxcehI6pB7ljGi2ttU4lNG6jHX3SDW
 uaCP/xrNmdZJX25My1BaCnKXvxgzBwx3iWH9NhbtCR9qXV9aSA9B8tUWv
 YJGqxeWM3FT4cBECXNwvPRYfOGeukGr0A/20JHHHPl/SKrfxRx9wfoUer
 HnRk3jsrXoiUYjzGUu3KBi85JpaCxL5jhzh7KMWCQ3t8ENEofjixU7P+j
 NVaX4sRdMqrYISKorDZzrI7nXMtsGfpiVdmmwGHQ/QjKl7WZb7laCZ8rp
 A0RYEIlWhAtPZzf3b4xJwKNamOaHgH4ehP6xzNEDTwSxGdUDsfLGaTHGh Q==;
X-CSE-ConnectionGUID: TMFzVX+EST2kp1ed2w7MnQ==
X-CSE-MsgGUID: ZDY4bVwtR/632UDmu/gCyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33461182"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="33461182"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:13:01 -0700
X-CSE-ConnectionGUID: 493jxap8TcmDb573JRhAUg==
X-CSE-MsgGUID: UqX+nQ1URL2JOpHq1q/Z5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="80893636"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.153])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:12:59 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/2] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_wedged
Date: Fri, 25 Oct 2024 19:12:40 +0200
Message-ID: <20241025171240.114267-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025171240.114267-1-kamil.konieczny@linux.intel.com>
References: <20241025171240.114267-1-kamil.konieczny@linux.intel.com>
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

