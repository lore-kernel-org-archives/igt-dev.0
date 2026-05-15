Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F77CD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 10:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BA910F4E8;
	Fri, 15 May 2026 10:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgAQ+iS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7769F10E0EF
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 10:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778840535; x=1810376535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zn7P4rPprGqq3H4MFWyl3zIUGlockszMYntLj+Ql/+M=;
 b=YgAQ+iS6v3qT17bat8McE3DH0K2WXVj+kg++1yugh/+WXhcTIJ+M7vxJ
 mRdbLmnaRMOLpwqCgLaskoU9KoyWWGwA9BWwPOQnEHLmvrWKhjJwZMRQZ
 hjoTYswTwDVBGYm2XnFWYzlotujpKy6pm4A3XBHda4v6290kYogeqp5LQ
 oDUdEiW7N2hFExdLMfBMkzEnfHMyzxo9Do9UCsBcKnPZ5Wy6cXgdQRuLs
 gKpsJoIdjI0GoNOAGElCigT2A4EYZykE6mLKXt8zipDgkdgnoWVZCZ8Lg
 1+fJkmTu86avi8PevLR0V5XwawuvJGra5UcC8lPR6a3D7PT8QvtpED2uP Q==;
X-CSE-ConnectionGUID: FHQyew1QTtOEsFlxl8Thow==
X-CSE-MsgGUID: MXNsi4MxRrW1Nf7F+9h7AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="82361533"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="82361533"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 03:22:15 -0700
X-CSE-ConnectionGUID: 2dDbhMWtQb6R71ema4gDGA==
X-CSE-MsgGUID: UuGeUONGTq2uBVXfmzaGjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="234406511"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.102])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 03:22:13 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3] scripts: Add new script for verbatim sync with kernel
Date: Fri, 15 May 2026 12:22:08 +0200
Message-ID: <20260515102209.11275-1-kamil.konieczny@linux.intel.com>
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

v3: removed 'Author:' as this is in git history (Jani)
  updated commit hash to match last pciids.h sync (Kamil)

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/sync_with_kernel.sh | 55 +++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100755 scripts/sync_with_kernel.sh

diff --git a/scripts/sync_with_kernel.sh b/scripts/sync_with_kernel.sh
new file mode 100755
index 000000000..469e3edd8
--- /dev/null
+++ b/scripts/sync_with_kernel.sh
@@ -0,0 +1,55 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+#
+# Copyright © 2026 Intel Corporation
+#
+# Use this for verbatim copies from kernel into igt-dev-tools
+# Change paths to yours, update the repos, cd to IGT, and run.
+
+SINCE=e68a60f9e6a6
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

