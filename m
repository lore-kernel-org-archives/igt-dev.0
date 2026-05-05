Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF0DCD13DA
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 03:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629F710E021;
	Tue,  5 May 2026 03:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/RmJ0Hw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C47F10E021
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 03:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777953055; x=1809489055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xm4rgXSEaThR8Lkb8urKJdh+wmAOcUMiyAuaGqpK+nw=;
 b=Q/RmJ0HwI8JKb77/yurMiAQew3+PCl6epWo4LRc5/wwM4sKV8r411nsh
 UHpBj3uSH0XnJSCV07k/4Wozqs4hCL+k3jtjX7s+16XlDvU3PmVK6zNCP
 e66HNmlZsO8ok76arpmYljNZRJ4e/0qALOyrgg9VW+girFc4iJQ2Pt71V
 a8UCWJh2CsqgdQokVXaTuzZ+lNFzyJzzWpvWdl5mTeCsIUMF91CSs+6E9
 IUWWmkEOz9tsUznNIgIjcaA7Ifi8/W0H56Sqbgu6/YxbniA2GDDgimn+u
 W/dS4I3CkZXTqNOdwzNDVdFrOFoDsoxefUVsrEy7CaqdrqqtzJd1TuK+F A==;
X-CSE-ConnectionGUID: wYCYSLJQRxGp+US4E+QU7g==
X-CSE-MsgGUID: FKHwgEkkSfq9H8mW8RUfGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="104265456"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="104265456"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 20:50:55 -0700
X-CSE-ConnectionGUID: /0iU0VajRoeZV9/ax5wYxQ==
X-CSE-MsgGUID: 1OCiHnNsRUaFRrT6bDlElg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="259048890"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa002.fm.intel.com with ESMTP; 04 May 2026 20:50:53 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/3] Fix incorrect skips and improve cleanup
Date: Tue,  5 May 2026 09:31:41 +0530
Message-Id: <20260505040144.28354-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series fixes issues where tests were being skipped 
incorrectly and cleanup was not always happening.

Capability checks were earlier done outside dynamic subtests, 
which could cause valid cases to be skipped if a later output 
checks fails. Move these checks inside igt_dynamic_f() to ensure 
each case runs independently.

Cleanup is also improved by centralizing framebuffer handling 
and calling test_fini() after each dynamic subtest, so resources 
are always released even on early exits.

Pranay Samala (3):
  tests/kms_hdr: Move framebuffer into data_t for centralized cleanup
  tests/kms_hdr: Move test_fini() for proper cleanup
  tests/kms_hdr: Move capability checks inside dynamic subtests

 tests/kms_hdr.c | 210 +++++++++++++++++++++---------------------------
 1 file changed, 90 insertions(+), 120 deletions(-)

-- 
2.34.1

