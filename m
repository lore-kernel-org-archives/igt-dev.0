Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C81C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF9810E63C;
	Wed, 31 Jul 2024 14:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kj+FIeCs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D10B10E63C
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722436215; x=1753972215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZSGBn3t44Ed1D8ywuO1jHfNVGa0CQhMy79KZUfLxwxw=;
 b=Kj+FIeCsNqlIu/bZutF1WGmy9wk4j4a6zHuQ5RpbV8ftt06Jke316rpZ
 pHWn5hgDf33bqnKS9wul4dBeJwo/bC9DaT+JvhiS3wXh8NSNwauAoGiyC
 FoJJw25peiLbonhiovJJrfDK6vNSkwKSzsj89JuBUx/cc8dG0GoZY8M4Y
 ziVo/CFDwZX4KH06PyQdZ6d6mf6v+0Ad+gKlAkrIxJMde2Tk+RslHYjqw
 qBxS/6I4fCFtBVPSXznX7T9LhH0N7h1+oOGHY0Of/o7P6sMa+GRp/817D
 PJQgSllV2Fh//ivfJPrnZGn49TEknhElDJ8XoJxhZy667CV+oscHBdnd5 A==;
X-CSE-ConnectionGUID: l4+/z1ETSAKbAgSGQZTWEQ==
X-CSE-MsgGUID: bbQBuDGkT/O9ggEn2OZ4iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20166075"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20166075"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:30:15 -0700
X-CSE-ConnectionGUID: uAYYZ41sQPe/CNS92q+96Q==
X-CSE-MsgGUID: Wz5T+XGdQUqkIssNQZuIPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54631912"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by orviesa010.jf.intel.com with ESMTP; 31 Jul 2024 07:30:13 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t, v4 2/2] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_sysfs_preempt_timeout
Date: Wed, 31 Jul 2024 20:00:29 +0530
Message-Id: <20240731143029.3661149-3-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240731143029.3661149-1-nakshtra.goyal@intel.com>
References: <20240731143029.3661149-1-nakshtra.goyal@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Test solution which should allow igt runner to properly
classify xe_sysfs_preempt_timeout, so adding it into
xe BAT runs

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..6316cc99e 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.34.1

