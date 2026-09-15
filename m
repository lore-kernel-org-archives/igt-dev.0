Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A59C88E53
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 12:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D933710E4F4;
	Tue, 15 Sep 2026 12:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NauTSMXG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4753510E4CD
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789476691; x=1821012691;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SbpK4Ze+8/L6QQ36iqN/YXD5kjO2/Hi/5OzkyT8G+W4=;
 b=NauTSMXGbSjhZh0bmWKdQxsxrM9BIfQb4p3UUXY/vZwbxru3Dbm/C9uC
 uSzJ6GfPmUYwANFTzNM35DFwvZRIVYJE0YRvTNfNfGGPux49In7CelBwy
 8ivwg5Anu18YnfqKYlTBp18i7gsjE8k8xZAvwXt6mE0rqBAhISt1Y8OpK
 3UYRR/wR939ECl4DrbnBgfprxg023G2yw5zIh89+UHyC9JGKAvQ3t278L
 XIgQ1r2xwFMAj/Lur4Eyi7sumrDCMkhrcjFPGonjP1s7WLiWr6Pt+SefG
 +5XDEQcmWfqbAL3Np9L6rNrerMGxUzObS/n+4hTf4HsALXOBecKWKLYzH A==;
X-CSE-ConnectionGUID: K8VkNkpmRcO9CXBrZO2clw==
X-CSE-MsgGUID: EV0N3D12SeuIwUsCY+L2dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107350077"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107350077"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:51:31 -0700
X-CSE-ConnectionGUID: Ar4HrvXzQaCdCFeu+P6TIQ==
X-CSE-MsgGUID: gpIguoezTPeKhNGPFHOaGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="302884596"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 05:51:29 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t] gitlab-ci: Fix computing sum for debian image
Date: Tue, 15 Sep 2026 14:51:23 +0200
Message-ID: <20260915125123.228545-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Debian container has a dependency on minimal image, so it should
also contribute to sum calculations.  It could make building fail
when minimal image contain new building requirement, so fix it
and calculate sum from both dockerfiles, base and minimal.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/201
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

