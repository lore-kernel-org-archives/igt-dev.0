Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C16C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 11:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A95E10E7EF;
	Thu, 12 Jun 2025 11:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJP88cjQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1E910E7EE
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749729464; x=1781265464;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=DeYdxrPuVeuS/qTV3ut9M7hdB1zXWAfZIGjfLaVqOjQ=;
 b=CJP88cjQtBnlWfnhrmRur5/f9MIP7UivFiWDd5Vb5wFV59DtyqtWXPB/
 5wulwWwFNQcc3HvFudebZyIuF6a+7g79piAd/btgwQ6DE29/W/Q/MLI6+
 X+/qhNeOzFhiyPrbE/OesG2NWOBM699lUeZmJpcqlM2mFQ6yETh3M+1/C
 FNEGn28VuvQRI+jNh+mktM+tk3dkCfOLPoWnvPxTaYzPVK3yixrQORfhd
 VzEHNScYw00PLoUNwgnrGlLPiVaO/mIs75dfAOKPit56WbXbJMSdNKieV
 mavnKZoJ+b3UlNb6fZV/iPgYXNPuFtVpstcpZ7F2vBet3/svLPcEsj+ny g==;
X-CSE-ConnectionGUID: d4vb3P+ERD6FZqlUAH4p8A==
X-CSE-MsgGUID: UiGXsgEkQ6StmmUfliw1GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69343063"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69343063"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:44 -0700
X-CSE-ConnectionGUID: 99ehr47CTfGW1Kaca8Ec7w==
X-CSE-MsgGUID: +ThpMXu9QguxctjHwgOgbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152644881"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:57:42 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 12 Jun 2025 13:56:30 +0200
Subject: [PATCH v3 5/6] meson: bump required and tested version of meson
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-bump_docker_distros-v3-5-78ceb39a71b1@intel.com>
References: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
In-Reply-To: <20250612-bump_docker_distros-v3-0-78ceb39a71b1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=DeYdxrPuVeuS/qTV3ut9M7hdB1zXWAfZIGjfLaVqOjQ=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoSsB/tKzf6bj3AX9/s9tM184/hq5qRUk37mMUo
 1BLE9yVWneJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaErAfwAKCRAjYrKT3hD9
 12zPC/9rHTfr8D5vSMA8K0qffmUzq/tAu0qvSnPyd/mRjsgBpuRMBUm3ehqjGgLnJFK7rQeFFMd
 YqaivDIowEN4/UP10J75wEhVLw3VN0STQIppj7voyqx3RZ/W56+C0wI1I532KbrmsIvJzWXEjrT
 /LrlbBBUS2jpS7ixm2WF959ooqRwOs1xZCN2WuPipmYM25BKivBFL39es34jsBJWgvhcmq2pCsM
 +ehjVl/W2kmrQiftH2wEKk3Pty+cjr1UEILgGxHMmxFuB7cxutNl5plZGw+TJLAWbv1cbvgsyYT
 vetLuVfEdB7fQj4w3BAPXixcyBdNIserir+EtDYIKKb7s78VxNy5oOcLh5pl/IouRz2rYlZWdOg
 MaRzP2j+2Vdv6B51n6ChhLxAxBRYfH0mUh8+HLmN+qh7vktliBl+5ztsIG+nk3s4W9mjjIAP8ue
 G31wSfvvxIlnfG/phvgX1X5Kpr4YdLcQ+9GWadrokZb0vpE1mmO6HYUgvUOTdXQuUEsCs=
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

Future patches will require meson 0.52. Let's set the oldest tested
and required release to 0.52.1.

v2: updated description

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Petri Latvala <adrinael@adrinael.net> #irc
---
 Dockerfile.build-fedora | 2 +-
 meson.build             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index fb0750783028b3a9aa834de3da8a64a6ed6e3792..d6d479f6ad6e4a79538b0e16cd348554dace8881 100644
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

