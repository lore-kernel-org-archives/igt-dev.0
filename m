Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1781AFD88EF
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 10:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65C610E9D3;
	Thu, 12 Mar 2026 10:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kiMn7eZx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D994B10E9CF
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 10:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773310927; x=1804846927;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qPouLZb2WeP/eMZwO+bDcWh7nD4eV8Itwuee0INWJjc=;
 b=kiMn7eZxDST05UR4nmlbOMn3GlASnz1I5kOZWCi5RpUvMFCrdPfKjXO7
 bBzZ6NsM2x+u7LraGa/QEIre9Rqcz86P4vjCuRQj0lVkY65TlAgS+YlRu
 2PE+k7EEsvANOxbKMyarIVEyp3joqlchNEjN8eVxWOWXF475JEFPHmqsm
 WDB2UevnnpuwndGxzfIOzWcIADZurYxXnVebLOUYJdo9scssJ7bmIoOJL
 PrzHkKTtUl2HA03SwYp4kdyGUXR1x6zRjBlpJco8DO+iyU62WtOEMM6tA
 3138aZRPgBVkVjnkML5MkgoW0R8bK2ZYMe3EiHIip2+ptuAqQsUuNsexO g==;
X-CSE-ConnectionGUID: QvLW9SLtRmWBedhoGOH1vA==
X-CSE-MsgGUID: nPo2OmxPRmy0ym4Z9lEj/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74310495"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74310495"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:22:07 -0700
X-CSE-ConnectionGUID: axjPX0RKQ3Ku6wU29FZq3A==
X-CSE-MsgGUID: 0dX9njyWTxe/SVpL5/2XgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="246181022"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by fmviesa001.fm.intel.com with ESMTP; 12 Mar 2026 03:22:06 -0700
From: Aditya Chauhan <aditya.chauhan@intel.com>
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v3 i-g-t 2/2] intel-ci: Add NVL Display blocklist to
 meson.build
Date: Thu, 12 Mar 2026 15:52:01 +0530
Message-Id: <20260312102201.53909-3-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312102201.53909-1-aditya.chauhan@intel.com>
References: <20260312102201.53909-1-aditya.chauhan@intel.com>
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
Fixes: 04db3b26c52b ("intel-ci: Add NVL display blocklist")

v2: Make commit message more descriptive(Swati Sharma)
v3: Use correct subject(intel-ci) and take care of
Alphabetical order while adding to meson.build(Swati Sharma)

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

