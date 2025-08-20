Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CE5CA0EDC
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 07:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E7A10E162;
	Wed, 20 Aug 2025 07:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cx2PwrO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CAC10E162
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 07:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755674651; x=1787210651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x5NvyYaZPSIs6QOBz2BFqQnP0ddn81Ta4aym8KGNobk=;
 b=cx2PwrO1naIFlMSieUsOV3oF4jMVDd5kXnQuN3vq9WfiJ6hmlkyUWmDN
 PBMIpN9zXgSqWYk7+as6sEaWKrA+Cq1YUyRKQGuTSDgjafxZDsoWEPFng
 tYGA9PcdtlXK/TjeMMc0X+JtOKD/o+yMpV64yulpA8PQ76/nRzSPn/3Cg
 lUmRD5vEKDmv0PS8SP9Pek0dZ7dB4lsRdd3FESaMgoVAthkejbvZ+xWAh
 ESA5TCXeKBfpV2oiURubSn1HXQEEr+hBGgSnFEbEl29erUQnii7J6sFEj
 t80Wfjrq9SOpTlF0IDVo3RsEVqW8sAWZ0p1/eo4eabkgnucdVwmaE6usT Q==;
X-CSE-ConnectionGUID: qyu3R3sXTUGziX9SOisq9g==
X-CSE-MsgGUID: oHpJbtNKRnmvQKtYOkkL3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68203893"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="68203893"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 00:24:10 -0700
X-CSE-ConnectionGUID: hMvf/wl1TXyFGHlyt9HcHg==
X-CSE-MsgGUID: odX0K4WvQASF9Y9KgPMM2w==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 00:24:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2] tools/intel_vbt_decode: convert copyright signs from
 latin1 to utf8
Date: Wed, 20 Aug 2025 10:24:05 +0300
Message-ID: <20250820072405.3518554-1-jani.nikula@intel.com>
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

v2: Rebase, intel_bios.h no longer exists.

I'll be trying 'git send-email --8bit-encoding=iso-8859-1' on this
one. Fingers crossed.
---
 tools/intel_vbt_decode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 6882ae1d2f63..a4e76b7559d2 100644
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

