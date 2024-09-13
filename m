Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEEFFA3743
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 10:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC9910E24C;
	Fri, 13 Sep 2024 10:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YnJ2Ugwn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F3B10E24C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 10:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726224285; x=1757760285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6GPVzCJ9vYU2crphjTemua6qMPMfvQunatruhT3jeYA=;
 b=YnJ2Ugwnb4wb8UY9tZF96xdjrXR/ObPHcS3GDH7aF8PFfP2oVt/Xe1ev
 lumJHE7uGqvKPlwFETB8zofSXOEe3i/d1Knj2hqGkNn/pvMu0oo4S5RhN
 QRwzZS3inCHYItmrNOJOiCw2hp9HZA5CDwz27m7pSn83W51QSS+q57/a9
 eGp3VxJR1aW4xlwZUJ74V5d8nCAUnas8UbGMxtqQx906sCSxeuc/K0InM
 xMcHejwXVC8JLKi18HpEymjjGC+AZ+b7Qerp+sTuK4ED8Y8qlO0f7PPcC
 1LAW9fsg55Q96se1OB6OpvfqsMTIMyYyMi3x1mouV1BNzrdZLyLH75rn3 A==;
X-CSE-ConnectionGUID: 4mF0rC7BRayOUkJK37s4wQ==
X-CSE-MsgGUID: GU0Ul0KQQqyKnnWYnnNJjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35692488"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="35692488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 03:44:45 -0700
X-CSE-ConnectionGUID: 8a5RD+cdQziYoJqzxEmzQw==
X-CSE-MsgGUID: /YCyNCYySgO0LwRVqsyIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="98704224"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.162])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 03:44:44 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t 1/3] lib/uwildmat: Move to a dedicated vendored library
 directory
Date: Fri, 13 Sep 2024 12:44:32 +0200
Message-ID: <20240913104434.56529-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240913104434.56529-1-kamil.konieczny@linux.intel.com>
References: <20240913104434.56529-1-kamil.konieczny@linux.intel.com>
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

From: Ryszard Knop <ryszard.knop@intel.com>

This directory is in the igt tree for convenience. It's not immediately
clear that this is a vendored library, so move it into vendor/ and make
Meson add that directory for easy includes etc.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/meson.build                      | 6 +++++-
 lib/{ => vendor}/uwildmat/uwildmat.c | 0
 lib/{ => vendor}/uwildmat/uwildmat.h | 0
 3 files changed, 5 insertions(+), 1 deletion(-)
 rename lib/{ => vendor}/uwildmat/uwildmat.c (100%)
 rename lib/{ => vendor}/uwildmat/uwildmat.h (100%)

diff --git a/lib/meson.build b/lib/meson.build
index 1c83bc5c3..b10410c8a 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -95,7 +95,6 @@ lib_sources = [
 	'igt_pm.c',
 	'igt_dummyload.c',
 	'igt_store.c',
-	'uwildmat/uwildmat.c',
 	'igt_kmod.c',
 	'igt_ktap.c',
 	'igt_panfrost.c',
@@ -117,6 +116,9 @@ lib_sources = [
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
 	'xe/xe_util.c',
+
+	# Vendored libraries:
+	'vendor/uwildmat/uwildmat.c',
 ]
 
 lib_deps = [
@@ -135,6 +137,8 @@ lib_deps = [
 	zlib
 ]
 
+inc = [ inc, include_directories('vendor') ]
+
 if libdrm_nouveau.found()
 	lib_deps += libdrm_nouveau
 	lib_sources += [
diff --git a/lib/uwildmat/uwildmat.c b/lib/vendor/uwildmat/uwildmat.c
similarity index 100%
rename from lib/uwildmat/uwildmat.c
rename to lib/vendor/uwildmat/uwildmat.c
diff --git a/lib/uwildmat/uwildmat.h b/lib/vendor/uwildmat/uwildmat.h
similarity index 100%
rename from lib/uwildmat/uwildmat.h
rename to lib/vendor/uwildmat/uwildmat.h
-- 
2.43.0

