Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64561C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 19:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5E10E355;
	Mon, 19 Aug 2024 19:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T859N082";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE8510E356
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 19:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724097374; x=1755633374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L7/P3OpjwSgFIXXbzYfLEMeyJWzECpUqiG9BEaSnNfI=;
 b=T859N082spc/TV/lBLFMsxoEK4JFTLt3zts7mmsqg4cPM01DpBtwMF28
 Dw8T7FbiVL3EZPvFn15jrX3Gghls6sL2PFVjj6FFQvf0oLg2egU32a/hl
 qs8ZQpIMDHBtneXPBb8gRX7Nsc1V7l1PNeogQ/f8vnc0MtmGYLRZzcuba
 OFQ759w9TzKGAgEf6IBbKmu6sRjRBYuBYVCLxtcKf3JqfXEzgzdtNlOfK
 F2Pc+kqQWA3RiFp5n60j2v7v5ygk/CklciNy3JsQkW98prXUSGqU38afI
 neSww/iGMOmhhXqjoPg1/FYWQFQNZ0JydPCHved6BfNBgdhbhj4DdPlgI g==;
X-CSE-ConnectionGUID: h/NGz1IuTMWFEZzG5zhSmA==
X-CSE-MsgGUID: b/A4zdTASXKiNvsIWE/gng==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22251046"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="22251046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 12:56:13 -0700
X-CSE-ConnectionGUID: yC/wwVbVTROgJ5mZ0vs8mA==
X-CSE-MsgGUID: yLZSez7oTBiEgH+osRuVRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="60315546"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 12:56:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/4] tools/intel-gfx-fw-info: Annotate abstract method
Date: Mon, 19 Aug 2024 12:55:57 -0700
Message-ID: <20240819195600.242767-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819195600.242767-1-lucas.demarchi@intel.com>
References: <20240819195600.242767-1-lucas.demarchi@intel.com>
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
index b0d41bbae..5156c724c 100755
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

