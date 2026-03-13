Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F93105F7A2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 12:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379ED10EBD8;
	Fri, 13 Mar 2026 12:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8JvOhuZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F9B10EBD7
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 12:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773405311; x=1804941311;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cHlrbtIRVJBpkSmrpFFgaYROvI8nxRQ+WH/bRmF4pMc=;
 b=g8JvOhuZewPXMG4475Fn66B6ETYaYLQL9+HthEpds9Q+nwZ8posokDKP
 kZZF9l0iaVcDu26p0NSAnKMUd33xPI/DR9XCvFb2OcfTJBOwfA16daWPT
 m4yCV+jcU08odLlC94Q4E9xqAf6XFzgGNkXtauzqFCARCU3QFngYOc0RC
 V+YImHFYKpOOIQtlTovgT1viRkqhme1kuR2BpJglR97KirpzP4kdktDLa
 3Wh8ydzYOTVuAwjqXY0eu+u2KIFS1VW29aIU11s5MR32rtx+l1coLAED8
 fvQ7utRW/hZd6tJO1RH/CUzI9jMEN2YHvYnF5OIfFBygNz320lyAaPimg g==;
X-CSE-ConnectionGUID: UNxFX+39QkCmav26Ny+oaQ==
X-CSE-MsgGUID: dRZ6DAFoS0SGpq3to5p9DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="97121045"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="97121045"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 05:35:06 -0700
X-CSE-ConnectionGUID: I/zZn39mS1uK3pXqNaZh2Q==
X-CSE-MsgGUID: ZLTl8C/QQBKwLxQkeIDLWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="225608857"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by orviesa004.jf.intel.com with ESMTP; 13 Mar 2026 05:35:04 -0700
From: Aditya Chauhan <aditya.chauhan@intel.com>
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v4 i-g-t 2/2] intel-ci: Add NVL Display blocklist to
 meson.build
Date: Fri, 13 Mar 2026 18:04:59 +0530
Message-Id: <20260313123459.64815-3-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313123459.64815-1-aditya.chauhan@intel.com>
References: <20260313123459.64815-1-aditya.chauhan@intel.com>
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

Add NVL display blocklist to meson.build which was earlier missing.

v2: Make commit message more descriptive (Swati Sharma)
v3:
 - Use correct subject (intel-ci) (Swati Sharma)
 - Add blocklist in alphabetical order in meson.build (Swati Sharma)

Fixes: 04db3b26c52b ("intel-ci: Add NVL display blocklist")
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 3c7fa28b7..2b3266bbd 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -24,6 +24,7 @@ intelci_files = [
   'xe.lnl.eudebug.blocklist.txt',
   'xe.multigpu.blocklist.txt',
   'xe.nvl.core.blocklist.txt',
+  'xe.nvl.display.blocklist.txt',
   'xe.ptl.core.blocklist.txt',
   'xe.ptl.display.blocklist.txt',
   'xe.sriov-vf.blocklist.txt',
-- 
2.34.1

