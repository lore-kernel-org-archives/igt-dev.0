Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701EEC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 10:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9D710E5AF;
	Wed, 16 Sep 2026 10:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGAOoZTN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B19010E301
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 10:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789555112; x=1821091112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NpBrX/Un0fLvEBmXixc5w7FVRjN0EL88JZuPM/B7tUU=;
 b=VGAOoZTNoeQhx6as/BeqXKAQzO+MvrHwQPXSbow7xBj4lnVP2TgSP9LK
 kkxHBvWG1LQ5v0C8Roennu+ZzHwAy4I8QBFvtht9olDhweMcCZCJws4zS
 cOQPKFNHjNaAwK9Oxd1bcYTSMRCFDslouzfA6ROt0jzry12NM8RJe9Mol
 U4H4xD0u8aFnxtF2sq6uB5+KycRif0AYyeLgariQ81yr3ts1KEWo8oQ9q
 IfiCdCaSJ5VhY3tOO5nIX8hOBN6V/HGBSQ1LXCdXpeyPfZ1Er0opCKkle
 WycwWg1j0hJ48l1TfGbDWuJP+4BTo9f2vXuZB7HNpO+/foL1WzxGDVL9S w==;
X-CSE-ConnectionGUID: S7oCUJHsRJus++P+dIwygQ==
X-CSE-MsgGUID: rH6wUOEERZauKo1kLQktOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100525727"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100525727"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 03:38:32 -0700
X-CSE-ConnectionGUID: 4PEvJoCjQG+M40Hjn2hJ7A==
X-CSE-MsgGUID: 9QQ37cBsR++U8T6YIuik1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277052514"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 03:38:30 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v1 1/2] Dockerfile: bump debian version
Date: Wed, 16 Sep 2026 12:38:19 +0200
Message-ID: <20260916103820.68008-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916103820.68008-1-kamil.konieczny@linux.intel.com>
References: <20260916103820.68008-1-kamil.konieczny@linux.intel.com>
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

Bullseye is EOL so bump up debian to bookworm.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 Dockerfile.build-debian-arm64   | 2 +-
 Dockerfile.build-debian-armhf   | 2 +-
 Dockerfile.build-debian-minimal | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index e51ddca20..438c08e1b 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -1,4 +1,4 @@
-FROM debian:bullseye
+FROM debian:bookworm
 
 RUN apt-get update
 RUN apt-get install -y \
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index a7ad7aaa5..ac64058b5 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -1,4 +1,4 @@
-FROM debian:bullseye
+FROM debian:bookworm
 
 RUN apt-get update
 RUN apt-get install -y \
diff --git a/Dockerfile.build-debian-minimal b/Dockerfile.build-debian-minimal
index 808d2e32e..ebaec168c 100644
--- a/Dockerfile.build-debian-minimal
+++ b/Dockerfile.build-debian-minimal
@@ -1,4 +1,4 @@
-FROM debian:bullseye
+FROM debian:bookworm
 
 RUN apt-get update
 RUN apt-get install -y \
-- 
2.55.0

