Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A2EC5321D
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 23:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522BA10E550;
	Tue, 20 Aug 2024 23:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HB9vw4OI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C02510E4E6
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724196582; x=1755732582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6n0RxCoChCQcbz5BGp6BfsbiN8YA2ANQG2oWbhD3KpE=;
 b=HB9vw4OIHzJEKix0NdiMX9/ObLIIzP1YAsxG9pszgNnlNHhoF+eDfI+3
 bUEMzRYRyL2TC0eJV/zCiNPedsd+tRI4B51HFJmw07kD6H4yLKDNwHUZ2
 nU/bGYfRrbiJ0Ou9AhmQn0iqWB4MggA/3AlnEI8ivVDEbwVk+piTXlQKC
 IYXly2aaX158iduLwty73GPUCW9Yzzmt7yApFWuJWdU7HT0nMpgBLTB31
 B2FisLMrhgLPgl8PTeY9l8+f5JFVyHRQDtYsRJzbcHLZkXVU71tpdhN0r
 2rfRpMGXFYaysgsF4oloioLW5Whl7Cbj9tKo5FZFfhGnFYVteWCDaqZEE Q==;
X-CSE-ConnectionGUID: o9hpLR5ISFWlSnU+X833BQ==
X-CSE-MsgGUID: zxD3+i1GTJK4we4nLc3ZEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22339744"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="22339744"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:41 -0700
X-CSE-ConnectionGUID: TiDwFsNOQwK8mFj0/krMog==
X-CSE-MsgGUID: F73F6wZbQeK8hMFE+a6sIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="60599566"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 2/6] tools/intel-gfx-fw-info: Annotate abstract method
Date: Tue, 20 Aug 2024 16:29:24 -0700
Message-ID: <20240820232928.458248-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820232928.458248-1-lucas.demarchi@intel.com>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
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

Make the FW an abstract class and annotate the decode() method.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index 35555aab5..3105144b7 100755
--- a/tools/intel-gfx-fw-info
+++ b/tools/intel-gfx-fw-info
@@ -4,6 +4,7 @@
 #
 # Copyright (C) 2023 Intel Corporation
 
+import abc
 import argparse
 import logging
 import hashlib
@@ -103,10 +104,14 @@ def FIELD_GET(mask: int, value: int) -> int:
     return (value & mask) >> ffs(mask)
 
 
-class Fw:
+class Fw(abc.ABC):
     def __init__(self, fw):
         self.fw = fw
 
+    @abc.abstractmethod
+    def decode(self):
+        raise NotImplementedError()
+
 
 class FwCss(Fw):
     def decode(self):
-- 
2.43.0

