Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D0CC48BC4
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 03:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2929610E5F6;
	Wed, 21 Feb 2024 03:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/myalH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D9F10E5F2
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 03:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708486224; x=1740022224;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U2R/N5Kwup4Ze6d1fXONqM/HOidjHsw9khdTi4YRLAM=;
 b=H/myalH664a0yVDp6uIM0mCmLlQnYeyBhaccj4VML3u+UCaguc/VIRoy
 i/4/RK+htbBbKUJGnO8tWiVXDrUDZsy2/ytlP/71eeynU1vQstw9F7zxg
 Ba080u6YI/iLKbMgPq68dX7kpclYRDq6N37/HMi9HUPe3xMHzW1HEV8u7
 jNB3KnR4yt0NY8gkMGTSdQphr9mDxCa/zPzM+L4+C9kc/Rxh6sf6kTJP4
 Pl3CMHETMrp8DLxGryUJLOTMY/IpKu99ZsssTyU0wLNSEbMRmzEiZ9o3L
 MWrQzQwoUH3BB3BNA8o7JDjGj9JIZ3UUANUAvkwQV9oFEzOSGJeeF0XMq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13745934"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="13745934"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 19:30:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9639428"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 19:30:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/1] 64k page test coverage
Date: Tue, 20 Feb 2024 19:31:06 -0800
Message-Id: <20240221033107.3731001-1-matthew.brost@intel.com>
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

Exposed bugs fixed in already merged series [1].

Matt

[1] https://patchwork.freedesktop.org/series/130097/

Matthew Brost (1):
  tests/intel/xe_vm: Add test for 64k page corners

 tests/intel/xe_vm.c | 129 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

-- 
2.34.1

