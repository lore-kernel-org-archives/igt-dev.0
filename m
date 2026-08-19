Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB561C5DF85
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 20:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8F8892AA;
	Wed, 19 Aug 2026 20:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLnqlq2U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF1F892AA
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787170323; x=1818706323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=od6G3GfgJxZOpZOl0XLbwofsNzjlhMPjPbzblI+lK9c=;
 b=XLnqlq2U5JdcsORqh84m+9wZAf0b1wvp3g0NnvYvfZ3XqNO4VnLjmgsP
 yIAQoTyV8HXoWEVCGMrUhmhelJ00JZAzE75zF4U5b73hrwwlvxoyG7f2G
 GcS0yzC1lJe40KtIs31tCiul+qSPG0T7DIOKzIxCeLpWAWfqY11u3RIDH
 i6+RaVXFsYJSYWD4X3t9yaJ2bl6vtp1hG2X/VhOS53mfGPa0zOq6+ncNj
 FsQtQKjCkjwrgbRfVxtdvA/0gxpEguy1MRD3178YonTycgZwr3wFmgeJ7
 bOe9SoCcA4xDnxDxBliW6C1Yj0LhYlYIxm39OnOQoHLxAY/qB5ZKaoSg0 w==;
X-CSE-ConnectionGUID: SUhgl3K2Qru1UBn6ceGFVQ==
X-CSE-MsgGUID: lW3+iOWdSJCOSptfOGU40w==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="113238864"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="113238864"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 13:12:02 -0700
X-CSE-ConnectionGUID: cjlFldzTQvarvg99TN19PA==
X-CSE-MsgGUID: vHeku2HXTRm/dRaqf0nZ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="266270972"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.250])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 13:12:01 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] scripts: Create script for installing build deps on
 Ubuntu
Date: Wed, 19 Aug 2026 22:11:55 +0200
Message-ID: <20260819201157.206653-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Create script that will help with installing packages on Ubuntu
for compilation of igt sources, based on already existing
container configuration files.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/install-ubuntu-build-deps.sh | 62 ++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100755 scripts/install-ubuntu-build-deps.sh

diff --git a/scripts/install-ubuntu-build-deps.sh b/scripts/install-ubuntu-build-deps.sh
new file mode 100755
index 000000000..8329120d2
--- /dev/null
+++ b/scripts/install-ubuntu-build-deps.sh
@@ -0,0 +1,62 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+#
+# Copyright © 2026 Intel Corporation
+#
+
+build=Dockerfile.build-debian
+#Dockerfile.build-debian-minimal
+minimal=${build}-minimal
+
+bpath=./
+
+get_help() {
+	bname=`basename $0`
+        echo "Install igt-dev build dependances on Ubuntu"
+        echo " "
+        echo " You can call this script from igt sources root dir or from scripts/"
+	echo " Usage example: \"./${bname}"
+        echo " You can find logs in igt-log.PACKAGE-NAME files"
+}
+
+check_build_file()
+{
+        if [ -f ${build} ]; then
+		bpath=.
+        else
+		if [ -f ../${build} ]; then
+			bpath=..
+		else
+                        printf "Warning: Cannot find path to container file %s\n" ${build}
+                        get_help
+                        exit 1
+                fi
+        fi
+}
+
+get_debs()
+{
+	nline=$(grep -n 'apt-get install' ${bpath}/${1} | sed -e 's/:/ /' | cut -f1 -d' ')
+	debs=$(tail -n+${nline} ${bpath}/${1} | sed -e /apt-get/d | sed -e /^$/d | sed -e 's/\\//')
+}
+
+deb_install()
+{
+	echo "================="
+	echo "Packages names taken from $1"
+	echo "${debs}"
+	echo "${debs}" | xargs -n1 apt-get install -y >> igt-log.$1 2>&1
+}
+
+
+do_install()
+{
+	get_debs $1
+	deb_install $1
+}
+
+check_build_file
+
+do_install ${build}
+do_install ${minimal}
+
-- 
2.55.0

