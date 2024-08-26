Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341E7C5472D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 15:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0D210E080;
	Mon, 26 Aug 2024 15:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHUjaegS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30B710E080
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724686021; x=1756222021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bGFiYXIM78ROfNC2UWBwyDqH3WyU31NOJSTYDadEFKQ=;
 b=dHUjaegSFXxW2OMXM6E/LB9m3cyQM7Jom/W3FVlm97xttXMlX/cFU0px
 VdSgjYGnIiK5bxDzS4+ZM8ZlrRv1muyINtOTWFNrg79hQmcYCzYSxs35u
 IgfsNljOkKFOFOrGvoaouEwf8EtF2XpsBBlkpAEFaoOFvcyTn3ElHWf1g
 dEPGgq9bdAej6JVeuT/A6tdpuYb5LNLd8W/Mgo7IIxF0qSQugkDJ5scQZ
 YRhaioEF8+PiqSd0tw103mtJM/Aa1eCYminzUDNP5Ypdd6uBbiG17HlQF
 lOFkFCvLAB+JOKZkb97tmum1sZgUYbTEuqX91UXDUykeCSUR2//JjFqCQ A==;
X-CSE-ConnectionGUID: bedmRsKVQ3a+O414WBudDw==
X-CSE-MsgGUID: 1j4K73cHSrSVl94VBXd69A==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26013835"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26013835"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:26:59 -0700
X-CSE-ConnectionGUID: njr4orYvQjSTcBpoon53MA==
X-CSE-MsgGUID: RpkaJCuOSrOJTsWBxB5AFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="63074295"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:26:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 2/6] tools/intel-gfx-fw-info: Annotate abstract method
Date: Mon, 26 Aug 2024 08:26:52 -0700
Message-ID: <20240826152656.1306490-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826152656.1306490-1-lucas.demarchi@intel.com>
References: <20240826152656.1306490-1-lucas.demarchi@intel.com>
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

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
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

