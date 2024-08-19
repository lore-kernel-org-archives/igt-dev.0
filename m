Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0958DC54722
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 19:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A7D10E358;
	Mon, 19 Aug 2024 19:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcjNeoDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD05510E355
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 19:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724097374; x=1755633374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cm5dhlqU0OFkT8eNNQfpyoOCtN1gFM/T9iaNrQHucsE=;
 b=HcjNeoDs6IHDbw8Mrv5liDUiqexOgCDddnYhyZ2AuwY9wXFyMP7ew3y/
 xYntdoJFOKlF9087pz1F8qaD0mLLO0Ym6oH+Us1Le3QWh81QuhoAt44zX
 B6KqeWHtwH9kz2DNT8B5pNTzYjn+jXNPSXxyzGWtZ0JBpNSrLffAPNRd8
 GYucXzup0CYoKDAl77001vM1qlmGn7yOK3IsUs5fEuvp9MX4oQt5iax7v
 Co24IVNgkRnqd6MdTCjiJrMiQSc66lkwF3sAWnRasa6DOP7ENunfPMoFB
 XUeE6tsOsKeoPLSrumERf1L504xeudctmniGZhqao3Jhd/4QF/K1Luiou w==;
X-CSE-ConnectionGUID: Qa950DJyQPmI7/eJoTpjHw==
X-CSE-MsgGUID: MKUfZcOBQsS+j98QM9OCxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22251047"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="22251047"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 12:56:13 -0700
X-CSE-ConnectionGUID: xU30AWcyQ/SxS1CZBCkHkQ==
X-CSE-MsgGUID: R1n8dJCoSnuUz6b7xD+WIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="60315550"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 12:56:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/4] tools/intel-gfx-fw-info: Embed fw decoding
Date: Mon, 19 Aug 2024 12:55:58 -0700
Message-ID: <20240819195600.242767-3-lucas.demarchi@intel.com>
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

Use a factory class method to decide what class to use depending on the
magic and embed the calls to cstruct in each of them. Main motivation is
that in future the decode method will need to seek the binary as it
can't really know the version just checking the beginning of the file.

For now, keep the open/close of the file in the main function, but
eventually can be migrated as well.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/intel-gfx-fw-info | 73 ++++++++++++++++++++++++++++-------------
 1 file changed, 51 insertions(+), 22 deletions(-)

diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
index 5156c724c..a2518aa0e 100755
--- a/tools/intel-gfx-fw-info
+++ b/tools/intel-gfx-fw-info
@@ -105,8 +105,38 @@ def FIELD_GET(mask: int, value: int) -> int:
 
 
 class Fw(abc.ABC):
-    def __init__(self, fw):
-        self.fw = fw
+    def __init__(self, cparser, f):
+        self.f = f
+        self.cparser = cparser
+        self.fw = None
+
+    def checksum(self):
+        self.f.seek(0, 0)
+        return hashlib.sha256(self.f.read()).hexdigest()
+
+    def dump(self, **kw):
+        cstruct.dumpstruct(self.fw, kw)
+
+    @classmethod
+    def create(cls, f):
+        cparser = cstruct.cstruct()
+        cparser.load(CDEF)
+
+        magic = cparser.magic(f).data
+        default = None
+
+        for s in cls.__subclasses__():
+            if s.MAGIC is None:
+                default = s
+            elif s.MAGIC == magic:
+                f.seek(0, 0)
+                return s(cparser, f)
+
+        if default:
+            f.seek(0, 0)
+            return default(cparser, f)
+
+        return None
 
     @abc.abstractmethod
     def decode(self):
@@ -114,8 +144,13 @@ class Fw(abc.ABC):
 
 
 class FwCss(Fw):
+    MAGIC = None
+
     def decode(self):
-        data = []
+        self.f.seek(0, 0)
+        self.fw = self.cparser.uc_css_header(self.f)
+
+        data = ["header-type: CSS"]
 
         CSS_SW_VERSION_UC_MAJOR = 0xFF << 16
         CSS_SW_VERSION_UC_MINOR = 0xFF << 8
@@ -137,8 +172,13 @@ class FwCss(Fw):
 
 
 class FwGsc(Fw):
+    MAGIC = b'$CPD'
+
     def decode(self):
-        data = []
+        self.f.seek(0, 0)
+        self.fw = self.cparser.uc_huc_gsc_header(self.f)
+
+        data = ["header-type: GSC"]
 
         HUC_GSC_MINOR_VER_HI_MASK = 0xFF << 16
         HUC_GSC_MAJOR_VER_HI_MASK = 0xFF
@@ -165,40 +205,29 @@ def parse_args(argv: typing.List[str]) -> argparse.Namespace:
     return parser.parse_args(argv)
 
 
-def calculate_checksum(f: typing.BinaryIO) -> str:
-    return hashlib.sha256(f.read()).hexdigest()
-
-
 def main(argv: typing.List[str]) -> int:
     args = parse_args(argv)
 
-    cparser = cstruct.cstruct()
-    cparser.load(CDEF)
-
     checksum = None
 
     try:
         with open(args.filename, mode="rb") as f:
-            magic = cparser.magic(f)
-            f.seek(0, 0)
-            if magic.data == b"$CPD":
-                fw = FwGsc(cparser.uc_huc_gsc_header(f))
-            else:
-                fw = FwCss(cparser.uc_css_header(f))
+            fw = Fw.create(f)
+            if not fw:
+                logging.fatal("Unknown firmware type in '{args.filename}'")
 
+            decoded_data = fw.decode()
             if args.checksum:
-                f.seek(0, 0)
-                checksum = calculate_checksum(f)
-
+                checksum = fw.checksum()
     except FileNotFoundError as e:
         logging.fatal(e)
         return 1
 
-    print(*fw.decode(), sep="\n")
+    print(*decoded_data, sep="\n")
 
     if args.raw:
         print("raw dump:", end="")
-        cstruct.dumpstruct(fw.fw, color=sys.stdout.isatty())
+        fw.dump(color=sys.stdout.isatty())
 
     if checksum:
         print(f"checksum: {checksum}")
-- 
2.43.0

