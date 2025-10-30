Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E55DCCF9F0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 19:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C957710EA12;
	Thu, 30 Oct 2025 19:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QfReTb6k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7371F10EA12
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 19:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761852658; x=1793388658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KbbPjz4Bu7cUc7ijRO70mJKLnmUQfuPCarnLg9urYGM=;
 b=QfReTb6kpYTGCXWphmMCpi32uSgITAmB1WJTUXtHgPsbEUFjibmCPah9
 7O/qi5Y7mp24LlLP0foj7X+umO0ciYJwgry6K/eVBCJU4tqClRACCDSnk
 +NXfsivAkU1K7dgbso1hLkOTss8TvUpNhTDsGv2bxhfBgCOTQZPmZuF5x
 faX6B4uoxJQVL6bXT/2sv0qGSde5bvpfcNVymaiyefEj02JQ2xRD2jk7e
 nD4akkqTOLoXOqARO1rlKSi8z2l9cmM7NRj2R5yzHtiHBVss/XDCncuiJ
 ZMTSp9gXswbE6pzgezDPikdDirCxcBmRSkiddYLFezsaQ9cUhkqR/LDAz Q==;
X-CSE-ConnectionGUID: Mum1DnTTScqCYj7SZjC+TA==
X-CSE-MsgGUID: VpSVNoCKSgK8ZE+bFoMgxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63028424"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63028424"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:30:58 -0700
X-CSE-ConnectionGUID: jKDNfIG5TlKis9aYCn6Nzw==
X-CSE-MsgGUID: pmedDtUWQnSNIpyNS0VUxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185249333"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:30:55 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 2/2] HAX: Add gt-frequency test to fast feedback list
Date: Fri, 31 Oct 2025 00:56:29 +0530
Message-ID: <20251030192627.3810994-4-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030192627.3810994-3-sk.anirban@intel.com>
References: <20251030192627.3810994-3-sk.anirban@intel.com>
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

Add gt-frequency test to fast feedback list.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 017e3ba2a..a9a4f105c 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -163,6 +163,7 @@ igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pmu@gt-frequency
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.43.0

