Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A8CC52D7F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 15:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B7E10E37F;
	Tue, 13 Aug 2024 15:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/MVF8Ov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9D410E37F
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723562540; x=1755098540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lgryV0jZs2lWMyY+nEcpgcRUMEkEX2J9VMorQk1DMqg=;
 b=F/MVF8Ovwa2qX9ZkMSVIaj5G1LdrZ45dna6o1DaW0xPZD4CDGOT9Y9yf
 MaSOpWjd44dDi3KDW0EJobb9J+NMSShWYW5ciY+L7PpZZTrn7YPbFTo8A
 FgGRfm4Yv1Jm/QnW6OiM+czT9elFR5gWKMdf7i16k+ApT6PCmGoH7xbcd
 SAEIf+85i197OOIo4zJxJ9q7M/HBrTnbzUpoGAVV/OEPvkAQ8JFh13o4f
 IsNJedS3jhmxflLHsDAOYdE+ObBAfrhomITiKa8fs9RpO19bfGBRqPOde
 mlud0irvH15EAzrUW0/54FtXfePzjatGxP8wGNKTLTh0s+9e5FpDYWkwn Q==;
X-CSE-ConnectionGUID: dHxja0EuSpi8e596unCJDA==
X-CSE-MsgGUID: G3AukfEoSyiqye9F+kcSgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21900108"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="21900108"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 08:22:20 -0700
X-CSE-ConnectionGUID: YhtwCbaCQZqneXwZ6Mtwug==
X-CSE-MsgGUID: 1XG5TWaiRE+lUCLq13/BOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="89374321"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 08:22:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/2] intel-gfx-fw-info: Hide raw dump behind a flag
Date: Tue, 13 Aug 2024 08:21:40 -0700
Message-ID: <20240813152141.3151865-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Usually the decoded part is the useful one. Hide the raw dump.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index 5eb733120..c0d9b00ac 100755
--- a/tools/intel-gfx-fw-info
+++ b/tools/intel-gfx-fw-info
@@ -149,6 +149,9 @@ def parse_args(argv: typing.List[str]) -> argparse.Namespace:
     description = "Dump GuC/HuC firmware header"
     parser = argparse.ArgumentParser(prog="intel-gfx-fw-info", description=description)
 
+    parser.add_argument("-x", "--raw", action="store_true",
+                        help="Also print raw header content")
+
     parser.add_argument("filename", help="GuC/HuC firmware file")
 
     return parser.parse_args(argv)
@@ -173,8 +176,10 @@ def main(argv: typing.List[str]) -> int:
         return 1
 
     print(*fw.decode(), sep="\n")
-    print("raw dump:", end="")
-    cstruct.dumpstruct(fw.fw, color=sys.stdout.isatty())
+
+    if args.raw:
+        print("raw dump:", end="")
+        cstruct.dumpstruct(fw.fw, color=sys.stdout.isatty())
 
     return 0
 
-- 
2.43.0

