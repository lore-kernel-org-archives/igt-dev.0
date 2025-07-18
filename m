Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F5EC83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 15:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB9B10E9F3;
	Fri, 18 Jul 2025 15:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0LI7nhI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8831310E9E6
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752851743; x=1784387743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kTlOXTWKAhwA6Fosmtcgw5IRIDwzMkwAAtOCSHrfBEc=;
 b=C0LI7nhInVgETyW3EndyFYHDDVyJqzIWQZWmUagVjIQOD9lDaAUmacXW
 4RKC5M/bttTMZ3E7tw6267qT1vlHZIndqp1GoLSBgEiWfgCZESRDgVixp
 31e73iIUeW+bMdoU0kEVzXB76fvepCbmUxjgrCZrFCFynpCQD6MS4u0Pb
 B/WS/aQw+XVQvb2mR6FIPIcs85ylUrQUPXVVu9l9R9wWHyueUHu+XHuZZ
 4sl3lbHgHSLOp0p0pT51KUv7Z13XH1bEjXBXVTmFmxG1LUFsc160cHGLZ
 A/3+tcttpG2w+YAq8K6L1gjDdFbLvMf2Ft42LXQvF2+TSyypP7XD59Jyy A==;
X-CSE-ConnectionGUID: YZ0aDjPaQmqvHVVMFJMagA==
X-CSE-MsgGUID: qiJeif0TQ0ew2Jysrvw8xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54860996"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54860996"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 08:15:42 -0700
X-CSE-ConnectionGUID: mHoaix9RRgWeGjclqqfTNg==
X-CSE-MsgGUID: sVsHuS9DRbmukErZFf+AAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="195213469"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 08:15:41 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t v1 1/3] intel-ci/meson: Use follow_symlinks only for new
 meson
Date: Fri, 18 Jul 2025 17:15:19 +0200
Message-ID: <20250718151521.105886-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
References: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
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

After adding symlinks to our CI files I also used an option
which makes meson to create actual symlinks at installation.
It looks like this option was added in recent version of
meson and brakes builds on older ones:

tests/intel-ci/meson.build:65:0: ERROR: install_data got unknown keyword arguments "follow_symlinks"

Use this option only when a new meson is present.

Suggested-by: Ryszard Knop <ryszard.knop@intel.com>
Reported-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 60d4e0eb8..58f340b57 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -27,4 +27,9 @@ intelci_files = [
   'xe-sriov-vm.blocklist.txt',
 ]
 
-install_data(sources : intelci_files, install_dir : datadir, follow_symlinks : false)
+if meson.version().version_compare('<1.3.0')
+  install_data(sources : intelci_files, install_dir : datadir)
+else
+  install_data(sources : intelci_files, install_dir : datadir, follow_symlinks : false)
+endif
+
-- 
2.50.1

