Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8477CC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 12:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3146510E64F;
	Tue,  3 Jun 2025 12:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3YRhjhm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9715C10E614
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748954489; x=1780490489;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=u+khzKQGhn7aG2QeRmWApPmiI7YxmlEHgoVq+Gy2XXU=;
 b=O3YRhjhmfD0Z6xqT1rKyTHQSsGHSDwMf4kXfq6CD5MquAzop+Hie5sr7
 5wt3QHJl3qkuw/49qjEn+2kFmlMVr151vpi6vJl4Hd9PoiFFGbk1RBebf
 gWSL2RJa2e4OT0E5Vi8qvsiky1rHN6Ep2htKTLmJtzwlGSI1CXA9Pg5yl
 88nbme4ZHl9F5U4ulL3bTwR+OhlNeSJJIjrku2ZEizZfkMTYIHkWBYFcO
 rn8ZBVbRR2AGxskQYLY6wllb3nEj0LbSWs1ewQZdQ4a/EbiAS+LPCNkUi
 uq7AuhFIrmLiLt37l62QNxAQnWrYkA9QMp7+kTrIu6LPJBTbAx7fE3ZUq Q==;
X-CSE-ConnectionGUID: B65gApjGT2+KCaLg5EoRMA==
X-CSE-MsgGUID: 9jFwKIs6TD61DvxrjZaoVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62045707"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="62045707"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:41:29 -0700
X-CSE-ConnectionGUID: ElI/t5fHQs29Mt9opfM/sA==
X-CSE-MsgGUID: mRKeY4B9SnysKk1nKpa+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149719714"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:41:28 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 03 Jun 2025 14:40:40 +0200
Subject: [PATCH 3/3] meson: update required version of meson
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-bump_docker_distros-v1-3-cf7e062e339c@intel.com>
References: <20250603-bump_docker_distros-v1-0-cf7e062e339c@intel.com>
In-Reply-To: <20250603-bump_docker_distros-v1-0-cf7e062e339c@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=u+khzKQGhn7aG2QeRmWApPmiI7YxmlEHgoVq+Gy2XXU=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoPu1Q91w96spI/cM8bf1S9u5NOUmvv+qw6P3Q2
 l94gXvLC6GJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaD7tUAAKCRAjYrKT3hD9
 1zvEDACLD5XQpBu4QEmACbmBczaOYzrGrUr+hn+lWOzXBexDydwO1cA9BB1xM+TDhYty3D+X6yF
 1iJH9oCpbI+Lr3d5eajFoxEca3VgP0NI3QFw/oqRFfZCg5oSTD77I39A93vYk8Jf7pm0WYELq+c
 kyZE7F7ghmRe1Iwv46bhSAnTWRE4fWdFGJPHtCkpD+RkLR4XALJgwOkJ6NLGvRmcAKpAiINatg8
 IUezE08MOgL1t413QKa8zcWaZe/Uj1PW1xuZlbGNIt3arsgDQACNXZaT+8XriCrqRgIxKcG9Bsy
 yIcBhDJ8VitjnReRV9gVvC7yATyzuAH8hkfR2Z8qogHKY829HlCUshr3d4MaRxbJrqstn9k1in6
 sGIrs4+yMIhG4Nh8QH5/cmoV6fnYGOINxPu71Mx+6hIVCMJB65XkHmpDK7zg8S3ii2ZF40t81Le
 9PcEYCHLtUijyeW1i5nwS79WOgo+WQWuERlVqGhBpS4GlQn6NZR53Y4vPemMsgKEXrcXE=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Future patches will require meson 0.52. Let's use the latest
release 0.52.1.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 Dockerfile.build-fedora | 2 +-
 meson.build             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index 00f45857c20f82320500e7230e72c9522527e7a9..588738ac423e0d274fa42dfa4043b44d4cb1bad7 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -45,6 +45,6 @@ RUN dnf install -y findutils
 
 # Meson version switching shenanigans
 RUN dnf install -y python3-pip
-RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/e8/ec/3e6a68c9e0fd4b4f4fb6877a3ccfb6f6e6d09f2b4fc87674e671bf64b7b8/{meson-0.47.2.tar.gz}"
+RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/43/9a/e0bcec70d290986c6265d32e0a2d16ace7ef38f58aa5a65308967129d094/{meson-0.52.1.tar.gz}"
 
 RUN dnf clean all
diff --git a/meson.build b/meson.build
index b88098234e6d72dd2ed4cf26972e7afed1b1aede..3d18267e652943c5984575498ddeacdec7e079da 100644
--- a/meson.build
+++ b/meson.build
@@ -7,7 +7,7 @@ project('igt-gpu-tools', 'c',
           'buildtype=debugoptimized',
         ],
 	license : 'MIT',
-	meson_version : '>=0.47.2')
+	meson_version : '>=0.52.1')
 
 if get_option('b_ndebug') != 'false'
 	error('Building without -Db_ndebug=false is not supported')

-- 
2.43.0

