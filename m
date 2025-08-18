Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00A3CA0EC6
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 10:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AE210E428;
	Mon, 18 Aug 2025 10:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0kFh5Sw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507DD10E428
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755514301; x=1787050301;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=maOvi26gCp2GhRbhgq/RzL7VJHL5j4YBQG5YgQhFh6I=;
 b=d0kFh5Sw9UOPQ/IznxjmultB6ezLKudxTnJeASRatAINxYvgjSiKjYve
 EUYYNHAKf0q97Y7me38MgsPG40dj8oi0YmsJa+NdMAmKrElL5FQ8hJFW9
 71bCDTe0MW3Z4x1kAg86Md+qR4PAduLDZfBwYXCk2vWYkCo17MvRW+O8I
 Cb4EQqNxY9A2391/x5TQDJsZtkcSZTqpjtprsfQLgJcoN1P5g/pzn8rJq
 eTGr/6Lrub5lFrwNo3gzhlWUZJpt2R9KHZX+aaP/ebj3nrc3OKJQarDs6
 Dm3bT+zHQGtLtijvqd37AzilDaNJzwIjnr7/YoWtUOePOx3viPE79CgBO g==;
X-CSE-ConnectionGUID: LowYFLvUS3OHCdmikIYPSw==
X-CSE-MsgGUID: T65cPueDTMyOvFBhuZ7d2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68000204"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="68000204"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 03:51:41 -0700
X-CSE-ConnectionGUID: Pzg9/MJHT+iSc8JgCU0WQA==
X-CSE-MsgGUID: Meecs4YcSw+lXS3JOKSrpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="204708886"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 03:51:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tools/intel_vbt_decode: convert copyright signs from
 latin1 to utf8
Date: Mon, 18 Aug 2025 13:51:33 +0300
Message-ID: <20250818105133.2676928-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=iso-8859-1
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

Various tools trip over with latin1 characters in the source, as
nowadays everything pretty much expects utf8.

For example, [1] fails to apply in both Patchwork and b4, because
somewhere along the way, the latin1 copyright sign has in fact been
automagically converted to utf8, and the source still has latin1.

Instead of debugging legacy encodings and conversions, just convert the
remaining latin1 files to utf8 using iconv.

[1] https://lore.kernel.org/all/7090e70d712c94aed53f52c49a8155eb4c6b966c.1755175663.git.jani.nikula@intel.com/

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

I'll be trying 'git send-email --8bit-encoding=iso-8859-1' on this
one. Fingers crossed.
---
 tools/intel_bios.h       | 2 +-
 tools/intel_vbt_decode.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/intel_bios.h b/tools/intel_bios.h
index 01de2246e147..d874a268fe70 100644
--- a/tools/intel_bios.h
+++ b/tools/intel_bios.h
@@ -1,5 +1,5 @@
 /*
- * Copyright © 2006 Intel Corporation
+ * Copyright Â© 2006 Intel Corporation
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 7bb3c19c3340..85bda78a2a54 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1,5 +1,5 @@
 /*
- * Copyright © 2006 Intel Corporation
+ * Copyright Â© 2006 Intel Corporation
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
-- 
2.47.2

