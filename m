Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392E0CD4F39
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 13:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDB510E06D;
	Thu, 14 May 2026 13:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2QkjxRw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5466210E06D
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778765239; x=1810301239;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZBQJMSYpcFR276S4KdgWlCP4vyb8Xvu38qwpQK5OVy0=;
 b=I2QkjxRwONqKtTRUw/nwZxjQifIYZ8k8y+ug0A2VzlMvNTudLMmystXR
 GLGNn3rDraEIzJhYKzaFm+ib1DKYjzJAxD3ug+AwN0WUN/hCK7yAW+wnz
 5koERbpFrw1GXctpCrwKriGQ0nYitRwH1KcxY1IGSvTpjxpwzc5nx6BaQ
 yODIJGpjQC7PnGxsqRHvd2Rjxg+udoLxFoazUdktLZ+HpucgaHWSEWVdd
 Q/23vFguZDiukYabwAM4rKAERh4bhzKUaTX5yhAK3kdALdPhTplqwhwLb
 BMYtyj/wpZXUrylPrPr73cD/SnZ3VYvkF92pxR6PwP6F44uZEBlgPvD8L Q==;
X-CSE-ConnectionGUID: Sq56xfvJQ6CpIfuHdJIGUA==
X-CSE-MsgGUID: DmkDt9nETs27EhRPvRkxNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91168277"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91168277"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 06:27:19 -0700
X-CSE-ConnectionGUID: 7z2ymYq7TM6xDDgyOaCSyQ==
X-CSE-MsgGUID: x58gpA+FTmKQp7zB81S6yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="242380331"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.225])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 06:27:17 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2] scripts: Add new script for verbatim sync with kernel
Date: Thu, 14 May 2026 15:27:11 +0200
Message-ID: <20260514132713.35818-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

From: Jani Nikula <jani.nikula@intel.com>

This is a helper script used in cases when a verbatim kernel
file should be copied into igt-dev.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/sync_with_kernel.sh | 57 +++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100755 scripts/sync_with_kernel.sh

diff --git a/scripts/sync_with_kernel.sh b/scripts/sync_with_kernel.sh
new file mode 100755
index 000000000..65753677c
--- /dev/null
+++ b/scripts/sync_with_kernel.sh
@@ -0,0 +1,57 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+#
+# Copyright © 2026 Intel Corporation
+#
+# Author: Jani Nikula <jani.nikula@intel.com>
+#
+# Use this for verbatim copies from kernel into igt-dev-tools
+# Change paths to yours, update the repos, cd to IGT, and run.
+
+SINCE=962601ac4c78
+KERNEL=$HOME/src/linux
+IGT=$HOME/src/intel-gpu-tools
+
+declare -g -A map
+map["drivers/gpu/drm/i915/display/intel_vbt_defs.h"]="tools/intel_vbt_defs.h"
+map["drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h"]="tools/intel_dsi_vbt_defs.h"
+map["include/drm/intel/pciids.h"]="lib/pciids.h"
+
+cd $KERNEL
+
+for infile in "${!map[@]}"; do
+	outfile=${map[$infile]}
+
+	echo "processing $infile -> $outfile"
+
+	last=
+	for commit in $(git log --reverse --pretty=%h $SINCE..HEAD -- $infile); do
+		if ! git cat-file -e $commit:$infile 2>/dev/null; then
+			continue
+		fi
+		if git show $commit:$infile | diff -q $IGT/$outfile - >/dev/null; then
+			last=$commit
+			break
+		fi
+	done
+
+	if [[ -z "$last" ]]; then
+		echo "last update to $infile not found"
+		continue
+	fi
+
+	for commit in $(git log --reverse --pretty=%h $last..HEAD -- $infile); do
+		prefix="${outfile%.*}"
+		base="$(basename $outfile)"
+		# ref=$(git cite $commit)
+		# alias: cite = log -1 --abbrev=12 '--format=%h (\"%s\")'
+		ref=$(git log -1 --abbrev=12 '--format=%h (\"%s\")' $commit)
+		git show $commit:$infile > $IGT/$outfile
+		cd $IGT
+		git commit -as \
+		    -m "${prefix}: sync ${base} with kernel commit $commit" \
+		    -m "Synchronize ${base} with kernel commit:" \
+		    -m "$ref"
+		cd -
+	done
+done
-- 
2.54.0

