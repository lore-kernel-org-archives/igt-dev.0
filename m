Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDBDC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9D210E93A;
	Wed, 16 Sep 2026 11:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfZt7whS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B1910E69C
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557560; x=1821093560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b80jILvFFFdFpjJr3kaEb7c62h5I8ReTVaz6YDmGu7o=;
 b=IfZt7whSyDTyiMsDG7QwPRoUKxS9D88dyTHWOnF9r2056o1rsz6GsMjM
 1w46PVFeT7WX8FC5lxJU8+5tUKPAkQQwiqCUIuhn0H8d0yCaE9PgdV9er
 eJOSM42OQEN2A+nKb1oZjAAZkIN8CIDe6r+KrazK23tv5Dz9BWvbIPsJc
 WJ/rvp8bicIupfiZgkWgVMK7gdtbEnP7p/cKQiP71LQ3wMPcQwMIglti5
 YrlCviXiPpthW527njtEdo+Xlb6lEWOL7U2PwLDPHHCpyzRyO1rZwVqqD
 3DzEvb0hf9HV7Q8K5TW+6Dp8kBnxlP8IqBHnhDdhfQQu+VvvAV6Ce7Ncc w==;
X-CSE-ConnectionGUID: b0TqivdhQyuapBw6XXeZJQ==
X-CSE-MsgGUID: kTLuSnQYTRWRilPFOBNL/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="441059"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="441059"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:19:19 -0700
X-CSE-ConnectionGUID: eRanNXvhQw6VFUoTvBCTlg==
X-CSE-MsgGUID: JT1r+KjYTK6Ee3mxTdgyyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296802312"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:19:18 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v2 3/3] gitlab-ci: Fix computing sum for debian image
Date: Wed, 16 Sep 2026 13:19:02 +0200
Message-ID: <20260916111902.73626-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
References: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
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

Debian container has a dependency on minimal image, so minimal
should also contribute to sum calculations.
Problem occurred when new lib needed for compilation was added
to debian-minimal. As sum of debian dockerfile didn't change, it
was not recreated and all compilations on debian container
failed.

Fix it and calculate sum from both dockerfiles, base and minimal.
When there is no minimal, keep old behaviour.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/201
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 .gitlab-ci/pull-or-rebuild.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci/pull-or-rebuild.sh b/.gitlab-ci/pull-or-rebuild.sh
index aa1bddcde..fd68ef1a9 100755
--- a/.gitlab-ci/pull-or-rebuild.sh
+++ b/.gitlab-ci/pull-or-rebuild.sh
@@ -28,7 +28,12 @@ REF=${4:-${CI_COMMIT_REF_NAME:-latest}}
 
 REF=$(echo $REF | tr / - )
 IMAGENAME=$CI_REGISTRY/$CI_PROJECT_PATH/$NAME
-DOCKERFILE_CHECKSUM=$(sha1sum $DOCKERFILE | cut -d ' ' -f1)
+if [ -f ${DOCKERFILE}-minimal ]; then
+	DOCKERFILE_MINIMAL=${DOCKERFILE}-minimal
+else
+	DOCKERFILE_MINIMAL=
+fi
+DOCKERFILE_CHECKSUM=$(cat ${DOCKERFILE} ${DOCKERFILE_MINIMAL} | sha1sum - | cut -d ' ' -f1)
 
 REFNAME=$IMAGENAME:$REF
 DOCKERNAME=$IMAGENAME:dockerfile-$DOCKERFILE_CHECKSUM
-- 
2.55.0

