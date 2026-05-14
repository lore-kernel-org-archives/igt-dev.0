Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C99CD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 13:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B0910E06D;
	Thu, 14 May 2026 13:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdWwMvqu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC0610E06D
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778765000; x=1810301000;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4bbErv/H2xNhz/2FgqF5y+8p/N4NYdCHx1vj2BLHpwg=;
 b=KdWwMvqukLkQMOGJe75OAk6SI+E7TvrQaMFk3uDmXIf9EICqLjWlHJ/I
 DZHELD4xkzgQS1FQd3Td6HEzI4N7KPTNM6UJWMcgqTPlMVXzU2E7CJxuZ
 c+/h7aWmViwuqc2fC1LS7EdWZErWINhW0Njal1G1lB9jenbAuJJohe2Gt
 7smhhKl38JHGf+4cJWrdntcL1qt8Y9/swec8r2eRJbG2Ey8k9smRHfylj
 fBN/xNypqL491kEzXnEHSAIMiaVsMVpFn47tR+In/i71PWrVKHHJOqxMC
 tuip25cKYaL+NPKqt5LUbDzTDE+cli7aNOJFQiEYjnQN+cX51UQOzsotH g==;
X-CSE-ConnectionGUID: QM/I8ObzRWaUV2TLGJBrbQ==
X-CSE-MsgGUID: kfYESwvOTDKfUjkESkfgaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="82272960"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="82272960"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 06:23:19 -0700
X-CSE-ConnectionGUID: SsJzOnAiQVmoMuYVY/SkFQ==
X-CSE-MsgGUID: 1QmufRSoQ6SE989NjJeYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="243350659"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.225])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 06:23:17 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1] scripts: Add new script for verbatim sync with kernel
Date: Thu, 14 May 2026 15:23:04 +0200
Message-ID: <20260514132309.35409-1-kamil.konieczny@linux.intel.com>
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

