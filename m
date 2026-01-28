Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB51D25B47
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 11:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CA510E6AA;
	Wed, 28 Jan 2026 11:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JkSSUVwM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AE310E6AA
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 11:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769600391; x=1801136391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=15VXvQTac1T1tOjIkcGI3lJlggF2ZgkaA5qHqsiZuqU=;
 b=JkSSUVwMmSe3aK4YmsSxRO8IeuEDSlpHYPQdm17KHHhFDatWlbiryDNL
 a35+7YkLxOqpcVhdlQuyxJTQ26GI8pkoF8mYtNYJ0Wl2wqYSezVt+3wd9
 XMhYnitHN7hSvGgZc85UPHAZbEz5bXL5sh7m/KiPoad7SqaMNRj6cg5YO
 b6lQk2DFZ5A955sQUlJsW/fw6cpPnhEE6Kqt0CDIaVQlzZonpOtBXFZBs
 pZy0o/+sZFBhWe3Cf/W+/fMGvt5ty4XF4UjYf8RjrnlYw2rmiRpHGMEVF
 +PtjAbwEmQH4qYm8CgZkhwice08iwJ6YZNpjADYdd4cGCvEK7G/3xt2J9 Q==;
X-CSE-ConnectionGUID: Y8DEe0mcT3yezou2J1zsUw==
X-CSE-MsgGUID: nCfe/PcvTqqttRoNI0Uefw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69825693"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="69825693"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 03:39:50 -0800
X-CSE-ConnectionGUID: R/rDZwn2RF6WkC+sg072BQ==
X-CSE-MsgGUID: x0vGxDTZSyukL0Xr6LE5Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208264064"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 03:39:49 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] tests/xe_eudebug_online: fix thread ID math in
 pagefault-one-of-many shader
Date: Wed, 28 Jan 2026 12:39:33 +0100
Message-Id: <20260128113934.707513-1-jan.maslak@intel.com>
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

v2: Reworded commit message.

Jan Maslak (1):
  tests/xe_eudebug_online: fix thread ID math in pagefault-one-of-many
    shader

 tests/intel/xe_eudebug_online.c                   | 5 +++--
 tests/intel/xe_eudebug_online.c.gen.iga64_codes.c | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.34.1

