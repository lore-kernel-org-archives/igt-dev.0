Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327EEC83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 16:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20D510E240;
	Tue, 15 Jul 2025 16:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnGLIwzy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FCE10E240
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752596699; x=1784132699;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r9JMOjvSjlHVzJCBQrj3z7PEhu4eZdpOeQR67xI7C2o=;
 b=UnGLIwzyBZKPudtEksemLlsU+WkJzxSNrf0b93415Co/5vLYUtb9eDQB
 5FcFfgTcHl0FUYIf8adprypY3IRatw4Q4INnAHr7vhG3VS8jhFmfyGo3J
 U47S8OTsLIZVYlml8pp0/ydBFSqBKDfJke3v3dDlOhscdHHBk1R1FXOwW
 7sNW3ih3jiY3+6dAmmWkxETgQ98Nqf6YoTvkoNqCDH0Ot7YKbF44yYCMg
 bEze1k4gv3QrpgJIfqu6wKuem0vdkKbpZkQY3r7w01SUDROxKKunTfqEi
 mLu0xbHTNKIHCjdLeE76kh/6Ty/W4H/oZnHyp7B7E1DofrYn/fWmErKHA g==;
X-CSE-ConnectionGUID: Y2IOR4ZuTx2yaLzhDoh6fg==
X-CSE-MsgGUID: 0NCMI8VFROi1zn49RS/lGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54977109"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54977109"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 09:24:47 -0700
X-CSE-ConnectionGUID: HmaQCnrdS76n32yo1bhcQA==
X-CSE-MsgGUID: g/0Kya/gRieLE1uYHsIWnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157816791"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.213])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 09:24:46 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH] scripts/igt_doc: fix a deprecation warning
Date: Tue, 15 Jul 2025 12:24:36 -0400
Message-ID: <20250715162436.130710-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
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

The regular expression usage has count as the third parameter,
which results in this error message:

DeprecationWarning: 'count' is passed as positional argument

So the current usage incorrectly uses the flag value as a count.

Specify the parameter name to get the correct usage.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 scripts/igt_doc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index fa2c2c7ca..3a37a9701 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -37,7 +37,7 @@ class IgtTestList(TestList):
                 run_type = "other"
             else:
                 for driver in self.drivers:
-                    result = re.sub(r"^" + driver + r"[\W_]*", "", run_type, re.IGNORECASE)
+                    result = re.sub(r"^" + driver + r"[\W_]*", "", run_type, flags = re.IGNORECASE)
                     if result != run_type:
                         driver_set = set([driver])
                         run_type = result
-- 
2.50.0

