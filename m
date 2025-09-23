Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4190BCAC5A5
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 08:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E1E10E594;
	Tue, 23 Sep 2025 08:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARQN6LqY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AC310E594
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758616303; x=1790152303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cx81/g9F1JSgE+67PoGrTLHkOmsOhhRJ8y3wmyZmDt8=;
 b=ARQN6LqYmi0nLO7POmjXgg/3em5eKwuL0jr5dbLM+QKkZBVy3JoG7esM
 tBi3CIfRxqqGIHI6Eny7pPlOVlDQee14k6HAUre5slwtGDuZIruXQojYd
 K9Wn0EVrblX+Axp3nQyDnTAkmB9tUQF6VXBFtXRaDRCtl8t0XCLPlABbH
 tvekJdqyLxISMx5FjIyV9BHa2AvLpoWQXE1uf1aBrCNawFZ0S95uB5Gjn
 yZol4v16SLxeycgQRKZGUVC2jZwfIuyzkC33TSET8inHVoLnJdacD1/a2
 KEUX1rcr4xRQYekRWwL+nHD4RUaS4t1tkuw0EKr5O3UNt5aJ3ke8Yr2ZH A==;
X-CSE-ConnectionGUID: TPE9HO8cT9KTZ6BrgHbTlQ==
X-CSE-MsgGUID: 8z7z/zzgScCAtlxiyn5YOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61006052"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="61006052"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 01:31:43 -0700
X-CSE-ConnectionGUID: wcEAjm4nRJykvYRZLFrkHQ==
X-CSE-MsgGUID: hQ6mzfmESbmYQvl0mSYsdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="175841488"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.251])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 01:31:41 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>
Subject: [PATCH i-g-t] README: refer to lastest software version
Date: Tue, 23 Sep 2025 10:31:36 +0200
Message-ID: <20250923083136.16576-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

When talking about most recent source use 'version' word.

Cc: Pawel Sikora <pawel.sikora@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 README.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index ed6647726..c0382ce43 100644
--- a/README.md
+++ b/README.md
@@ -13,7 +13,7 @@ complicated build procedures or specific testing environments to get useful
 results. Therefore, IGT GPU Tools includes low-level tools and tests
 specifically for development and testing of the DRM Drivers.
 
-Generated documentation for the latest master is published under
+Generated documentation for the latest version is published under
 <https://drm.pages.freedesktop.org/igt-gpu-tools/>.
 
 
@@ -29,7 +29,7 @@ install the dependencies, e.g.:
     # dnf builddep igt-gpu-tools
 
 But keep in mind that this may be slightly outdated and miss some
-recently added dependencies for building the current master.
+recently added dependencies for building the current version.
 
 
 Building
@@ -113,7 +113,7 @@ IGT is packed into nifty docker-compatible containers for ease of execution
 and to avoid having to install all the dependencies. You can use
 podman/docker to to run it on your system.
 
-Oneliner to get you started with the latest master:
+Oneliner to get you started with the latest version:
 
     # podman run --rm --privileged registry.freedesktop.org/drm/igt-gpu-tools/igt:master
 
-- 
2.51.0

