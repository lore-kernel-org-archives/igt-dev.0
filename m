Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23510C5321E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 23:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECE410E545;
	Tue, 20 Aug 2024 23:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1aqW3dG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8871710E541
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724196582; x=1755732582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q3XX1ojAt6iUPqnH4CXn0DzRRZt336g83Cj6xhtO7mo=;
 b=V1aqW3dG4jrhDYlqxZqdmU3GCOCYtRohg2iZoc4t+mV5BiWDBIXgs9xW
 mlYFCNtnOQKbeStnvBFCfI+Jm+SK3ofuhiXmxW7RkGZa9RpuZeGWbnfwX
 ePd18wxVO3Hujjd2hJhDexZxH9FtwSYMRLWP3+li8aURBVS/XPr23EbVp
 5aIIwp2hbloi58HJa+li7RDw+ps3O6NaG7uQ8yX8tOmnNJA8Jf6rx+PO0
 VkU7uWFqCb6HWtMqjSyZ1Qn7fxQwg0DFxELX/D5hlKJoZQd7t+Fp+NjRH
 BO0g0567IgYJGx/7YXxcfxFJan3U0lqSg9oFMCN1Sh8g6iSgAUM0WqSWj w==;
X-CSE-ConnectionGUID: kzysrxwRRsGGZHlrvrCcGQ==
X-CSE-MsgGUID: GZ2OCaG8SiWnp0L6TNA2Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22339745"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="22339745"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:42 -0700
X-CSE-ConnectionGUID: PikuzJZ9ShGCh52GxwwowA==
X-CSE-MsgGUID: uJHxGaEWScuwHTVJxUizgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; d="scan'208";a="60599569"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 16:29:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 3/6] tools/intel-gfx-fw-info: Embed fw decoding
Date: Tue, 20 Aug 2024 16:29:25 -0700
Message-ID: <20240820232928.458248-4-lucas.demarchi@intel.com>
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
index 3105144b7..0f1da8bff 100755
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
+    MAGIC = b"$CPD"
+
     def decode(self):
-        data = []
+        self.f.seek(0, 0)
+        self.fw = self.cparser.uc_huc_gsc_header(self.f)
+
+        data = ["header-type: GSC"]
 
         HUC_GSC_MINOR_VER_HI_MASK = 0xFF << 16
         HUC_GSC_MAJOR_VER_HI_MASK = 0xFF
@@ -167,40 +207,29 @@ def parse_args(argv: typing.List[str]) -> argparse.Namespace:
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

