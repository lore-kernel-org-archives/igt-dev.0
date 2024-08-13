Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B91C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 15:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3743F10E381;
	Tue, 13 Aug 2024 15:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8xedx9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1C310E381
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723562540; x=1755098540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=btXAK7H5adFkoZ7KI55P6evLCY+hbZfp1YXCD5iAyno=;
 b=P8xedx9rGUxEXbM77y5O7/dz94bnYJRWIfp79FOY4qf2CMggqKORWtIY
 4esoWRBUX0c7GDPbmpDhnnH7DANMF/2eT6ZY0oK+3XhSsqsXevn0YFr6/
 dXSFJ+NL5emZwOkbQAXfJP9jkOG1bN3urDjfwFSPaLT/xZfdLKEELfkKQ
 wM4NUkjPwZFMmq2AwMy1YmeJiimBxSIEftTK6TiPXe+4bwSD3ZPe4bTVo
 qxbIJN2yVr9P8Uje4AvzYdof8g7JBOfULBYCTcv0XGBO9yLjRbw1dIlta
 GsDR4txEKRgjsHE1jLWB2cMMCwA2PPfRE9xL18KhCox4JcCGU/uPwfGG2 w==;
X-CSE-ConnectionGUID: lKInWpu+STmUn1COZQ6l0Q==
X-CSE-MsgGUID: jwcw5BxYRBWrZa4jRV9DNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21900109"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="21900109"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 08:22:20 -0700
X-CSE-ConnectionGUID: Y8GIQ6DwTgKj/F+6zNwaOg==
X-CSE-MsgGUID: QaZ+kbZ4StamxzSPvQsMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="89374332"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 08:22:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] intel-gfx-fw-info: Allow to print checksum
Date: Tue, 13 Aug 2024 08:21:41 -0700
Message-ID: <20240813152141.3151865-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813152141.3151865-1-lucas.demarchi@intel.com>
References: <20240813152141.3151865-1-lucas.demarchi@intel.com>
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

Choose a checksum algo and use it to print when parsing a firmware.
This may be useful in CI to dump what is the exact firmware used
and may also be useful when inspecting the firmware repo and making
sure mistakes are not introduced. Configuring intel-gfx-fw-info a diff
driver:

	firmware $ echo "*.bin   diff=intelfw" >> .git/info/attributes
	firmware $ git config --local \
		diff.intelfw.textconv \
		"<path-to-igt>/tools/intel-gfx-fw-info -c"

Example for the LNL update that happened recently:

	firmware $ git diff --text bc42cdc34bd8 b5bef5bdbab1 --  xe/lnl_guc_70.bin
	diff --git a/xe/lnl_guc_70.bin b/xe/lnl_guc_70.bin
	index 785763163..75a1958f7 100644
	--- a/xe/lnl_guc_70.bin
	+++ b/xe/lnl_guc_70.bin
	@@ -1,3 +1,3 @@
	-version: 70.20.0
	-date: 2024-02-09
	-checksum: 0809f459048a23716fd3019074f36812163e027835cbb43acfcfe72cd83fb0cc
	+version: 70.29.2
	+date: 2024-07-26
	+checksum: e7ceae28b06bd71c53fe177f4f6787aac88956d8944fa02b1ab2ec53b1e961e4

If for some reason there's only a checksum change, something went wrong,
and without it we wouldn't notice when using this tool as a diff driver.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index c0d9b00ac..31dc78776 100755
--- a/tools/intel-gfx-fw-info
+++ b/tools/intel-gfx-fw-info
@@ -6,6 +6,7 @@
 
 import argparse
 import logging
+import hashlib
 import sys
 import typing
 
@@ -151,18 +152,26 @@ def parse_args(argv: typing.List[str]) -> argparse.Namespace:
 
     parser.add_argument("-x", "--raw", action="store_true",
                         help="Also print raw header content")
+    parser.add_argument("-c", "--checksum", action="store_true",
+                        help="Also print checksum")
 
     parser.add_argument("filename", help="GuC/HuC firmware file")
 
     return parser.parse_args(argv)
 
 
+def calculate_checksum(f: typing.BinaryIO) -> str:
+    return hashlib.sha256(f.read()).hexdigest()
+
+
 def main(argv: typing.List[str]) -> int:
     args = parse_args(argv)
 
     cparser = cstruct.cstruct()
     cparser.load(CDEF)
 
+    checksum = None
+
     try:
         with open(args.filename, mode="rb") as f:
             magic = cparser.magic(f)
@@ -171,6 +180,11 @@ def main(argv: typing.List[str]) -> int:
                 fw = FwGsc(cparser.uc_huc_gsc_header(f))
             else:
                 fw = FwCss(cparser.uc_css_header(f))
+
+            if args.checksum:
+                f.seek(0, 0)
+                checksum = calculate_checksum(f)
+
     except FileNotFoundError as e:
         logging.fatal(e)
         return 1
@@ -181,6 +195,9 @@ def main(argv: typing.List[str]) -> int:
         print("raw dump:", end="")
         cstruct.dumpstruct(fw.fw, color=sys.stdout.isatty())
 
+    if checksum:
+        print(f"checksum: {checksum}")
+
     return 0
 
 
-- 
2.43.0

