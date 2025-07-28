Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4937FC83F17
	for <igt-dev@archiver.kernel.org>; Mon, 28 Jul 2025 17:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F2510E557;
	Mon, 28 Jul 2025 17:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVM20KAV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B0610E557
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jul 2025 17:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753723938; x=1785259938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5vsat8lc2JHEagklJFiZIOA52TVt7QGJpLHfbOTdmPU=;
 b=NVM20KAVv3xW5XEqoKW9XkVwFgXYF+caB52ZxNqJh4AKXYoK9om/KQm4
 +mnegY1kJpygVlXas7EbAZapFtM3cKN3Dbw4R9AjglzJImgZZZVTTMwKe
 /bWhxUSn0XgUUihmObNJUmzucrhG0D87pLlOJpTvrq2MCCOOMbifnWIRg
 2YNpEvAH9/vemdSuS6yVyonMN5CRfafvnvMg8Wg3JWbo5X9Viy8VzkS5q
 6KaObev1Tc5uMw2KIL4zFf419ZRoo9kAJB8cdB5+OKfUAMGozaa9ChypU
 NCuk6Ac21E8HjIpKZkLF4BHXt13kjFbSSz212BIIRdaT4QcVq7tKFd4dS A==;
X-CSE-ConnectionGUID: O7XD/0YxQSu7bjWFjaJYkA==
X-CSE-MsgGUID: 4XjonV/ARmyLo1v0l/pmJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66684108"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66684108"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:32:18 -0700
X-CSE-ConnectionGUID: hqnpf9vnQyKk9YSBgr4SwA==
X-CSE-MsgGUID: jkD6kvQBTu+oJSaiCZ8q0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161731606"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.236])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:32:17 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v1 4/4] scripts: Add symlink to verify
Date: Mon, 28 Jul 2025 19:31:52 +0200
Message-ID: <20250728173152.220113-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
References: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
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

Add a symlink to give CI time to change its flow.

Cc: Michal Czaplinski <michal.czaplinski@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/verify-blacklist.sh | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 scripts/verify-blacklist.sh

diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blacklist.sh
new file mode 120000
index 000000000..7f706d61b
--- /dev/null
+++ b/scripts/verify-blacklist.sh
@@ -0,0 +1 @@
+verify-blocklist.sh
\ No newline at end of file
-- 
2.50.1

