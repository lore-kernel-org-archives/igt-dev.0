Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1469D46607
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 17:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB7710E7BC;
	Thu, 15 Jan 2026 17:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSvAhmGc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A3010E7BE
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768499914; x=1800035914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6xvljBWO0BK4zADO3XPV64jEDc30JjS52YT47/rvo1A=;
 b=OSvAhmGc/G7C2T+V1NnxJe5u2H4oIGuwc1oHjhxGLDcr48poWAf2eS3a
 V+zKpVui0V8lH0VORy81OvsJ1s2KQ0U4BQyI2J4IP0vmMoPeoxRCcHb4D
 zNxNH3W9sOC6k4TTm5ZZ2zxsaRmeRYRx6/i/L8PH2ooNZlYCUA7hNRlOl
 H2gxaQai7CBVoOe1vmph+IXl+XG5ajEXUIvRWJ59lORJiGcKkx8unRVdW
 kksRhAKDmPyhtm/78Y+Kf70KwuHyRv/CeYjtNZG+TNTaQK5rPmZCDreOi
 hPY75jByXPuMAVAhiqKfuU9HvCIX1XJOdX4qIg2/diTrDXy4+ZxkBqTjq w==;
X-CSE-ConnectionGUID: h3Vct9HHS7yEbrTyX/OSkw==
X-CSE-MsgGUID: 9kB1brMQQw2FbEC1vUVVFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69017170"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69017170"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 09:58:33 -0800
X-CSE-ConnectionGUID: SuR9JumDTiW3xyyPxww2Fg==
X-CSE-MsgGUID: KJGzCcv0Q16w19CsvNE8eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204627221"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 09:58:33 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 4/4] Dockerfile.build: Replace json-c with jansson
Date: Thu, 15 Jan 2026 18:58:10 +0100
Message-ID: <20260115175811.179898-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
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

After replacing json-c with Jansson library in igt runner, the
dokerfiles needs similar update.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 Dockerfile.build-debian       | 2 +-
 Dockerfile.build-debian-arm64 | 2 +-
 Dockerfile.build-debian-armhf | 2 +-
 Dockerfile.build-fedora       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Dockerfile.build-debian b/Dockerfile.build-debian
index 52d7c42d1..cbc12875d 100644
--- a/Dockerfile.build-debian
+++ b/Dockerfile.build-debian
@@ -13,7 +13,7 @@ RUN apt-get install -y \
 			libgsl-dev \
 			libasound2-dev \
 			libxmlrpc-core-c3-dev \
-			libjson-c-dev \
+			libjansson-dev \
 			libcurl4-openssl-dev \
 			python3-docutils \
 			valgrind \
diff --git a/Dockerfile.build-debian-arm64 b/Dockerfile.build-debian-arm64
index cf0625ac7..9bbcdde92 100644
--- a/Dockerfile.build-debian-arm64
+++ b/Dockerfile.build-debian-arm64
@@ -27,7 +27,7 @@ RUN apt-get install -y \
 			libudev-dev:arm64 \
 			libgsl-dev:arm64 \
 			libasound2-dev:arm64 \
-			libjson-c-dev:arm64 \
+			libjansson-dev:arm64 \
 			libcurl4-openssl-dev:arm64 \
 			libxrandr-dev:arm64 \
 			libxv-dev:arm64 \
diff --git a/Dockerfile.build-debian-armhf b/Dockerfile.build-debian-armhf
index 58b5be82a..e307fbedb 100644
--- a/Dockerfile.build-debian-armhf
+++ b/Dockerfile.build-debian-armhf
@@ -27,7 +27,7 @@ RUN apt-get install -y \
 			libudev-dev:armhf \
 			libgsl-dev:armhf \
 			libasound2-dev:armhf \
-			libjson-c-dev:armhf \
+			libjansson-dev:armhf \
 			libcurl4-openssl-dev:armhf \
 			libxrandr-dev:armhf \
 			libxv-dev:armhf \
diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index 9399c0a7d..4c3bdbbd0 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -19,7 +19,7 @@ RUN dnf install -y \
 	'pkgconfig(xmlrpc)' \
 	'pkgconfig(xmlrpc_util)' \
 	'pkgconfig(xmlrpc_client)' \
-	'pkgconfig(json-c)' \
+	'pkgconfig(jansson)' \
 	'pkgconfig(gtk-doc)' \
 	'pkgconfig(xv)' \
 	'pkgconfig(xrandr)' \
-- 
2.52.0

