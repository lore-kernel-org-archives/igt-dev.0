Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFE9CD042A
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 01:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600D210E3C4;
	Tue,  6 Jan 2026 01:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mv33zZMC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9071610E3C4
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 01:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767663024; x=1799199024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZWXkVEKpUQHO1Zo9NPfcOyr6JtaRHQ6KGFH/RgQf2ow=;
 b=Mv33zZMCYxC2pM+mngt+9Etamoio9imAGNOqFMeEmgRbD3C/c35Gin+N
 BbwmWwhx+om98SAnzPw6aaof7yXDcw0ajqElfl3xAmFf5bJtjZ/UiJMX1
 16uOJ5dE7YGaZ1sly5rIU4618zmsjmjpWPcWfohV9/MY+PdxoWlPlkJHb
 6b/1rtHbKiaEc+MbPsCuIGCjiLrq0izJBdKqTWwbTeLWG4P3iIENfmymh
 WxFbNU2gtWLETGMQXlwv6EicvRIF5lpzM3iGGd3RV6tPZiwom7Z/J0mSq
 AB9C5/TdmxHF5jiFpumY5lOf0df4224mSPak2tue3PYG6/dYfO7z0JvF4 A==;
X-CSE-ConnectionGUID: Dh/leflTTe+Ved3/MCm7mw==
X-CSE-MsgGUID: Dha8xQPJS5WKGiAG+jLKIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="80483738"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="80483738"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:30:23 -0800
X-CSE-ConnectionGUID: KkomR6/TQfm94fXIaxllrQ==
X-CSE-MsgGUID: ioy5SyfYQzCUNaS731kHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201756979"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:30:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com,
	stuart.summers@intel.com
Subject: [PATCH 0/3] Remove multi-queue KEEP_ACTIVE validation
Date: Mon,  5 Jan 2026 17:30:17 -0800
Message-ID: <20260106013018.2851521-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

The KEEP_ACTIVE feature is being reverted, remove validation support.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  Revert "tests/intel/xe_exec_multi_queue: Keep group active in
    exec-sanity"
  Revert "tests/intel/xe_exec_multi_queue: Sanity test KEEP_ACTIVE flag"
  drm-uapi/xe: Remove multi-queue KEEP_ACTIVE flag

 include/drm-uapi/xe_drm.h         |  4 ---
 tests/intel/xe_exec_multi_queue.c | 57 +++----------------------------
 2 files changed, 5 insertions(+), 56 deletions(-)

-- 
2.43.0

