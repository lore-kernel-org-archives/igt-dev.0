Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1FCC5320E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 23:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C6710E541;
	Tue, 20 Aug 2024 23:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXFfoSNw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CC410E51B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724196582; x=1755732582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/2lFxfWYZfSXivNpVz1NZfZpLT3yGqeHHyLFXmF/W4=;
 b=fXFfoSNw0AAR+zfCgKmt6M7264Ua+xrPfcVYecMstWE69vC7LjHmzKRd
 5qNArTU8thOY/DFIinzj4jigyQHVcAqNe8RZM9bYpE5ltMJNs3OAEVdNP
 pxOOxzH1x/24vek7bg9rCbjg9n5Fw+ea7vgsLo2JCXh9YjPFe6uiMYZed
 xksM+Y5gQQeUA0JJGUey/qB6Ja5RMxMr0arV45oMkuKlWQPX2eyyG6dTo
 fiVUjv7f6P8GddJDdXUd6VOeB8frsehHxnkPm764ksstYj2kOLf+7KM7U
 2221ZkbuJiNj5SgDI4Bac7OaAK7+PJjmZXQMGxuO8LibQkHpIKk1jgw0B A==;
X-CSE-ConnectionGUID: atlNluTiQ+yZoE+/0Yxntg==
X-CSE-MsgGUID: PBqaK+uJR4GL9RJG54wTQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22339743"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="22339743"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:41 -0700
X-CSE-ConnectionGUID: CFGbStKtSPu3Ca6oNu+rCg==
X-CSE-MsgGUID: ql9hRFdnQsigbIsdvlAImg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="60599563"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 1/6] tools/intel-gfx-fw-info: Re-format with black
Date: Tue, 20 Aug 2024 16:29:23 -0700
Message-ID: <20240820232928.458248-2-lucas.demarchi@intel.com>
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

black tools/intel-gfx-fw-info

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index b0d41bbae..35555aab5 100755
--- a/tools/intel-gfx-fw-info
+++ b/tools/intel-gfx-fw-info
@@ -150,10 +150,12 @@ def parse_args(argv: typing.List[str]) -> argparse.Namespace:
     description = "Dump GuC/HuC firmware information"
     parser = argparse.ArgumentParser(prog="intel-gfx-fw-info", description=description)
 
-    parser.add_argument("-x", "--raw", action="store_true",
-                        help="Also print raw header content")
-    parser.add_argument("-c", "--checksum", action="store_true",
-                        help="Also print checksum")
+    parser.add_argument(
+        "-x", "--raw", action="store_true", help="Also print raw header content"
+    )
+    parser.add_argument(
+        "-c", "--checksum", action="store_true", help="Also print checksum"
+    )
 
     parser.add_argument("filename", help="GuC/HuC firmware file")
 
-- 
2.43.0

