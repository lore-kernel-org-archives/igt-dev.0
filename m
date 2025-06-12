Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBBEC71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 05:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5606E10E188;
	Thu, 12 Jun 2025 05:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIIxwFkN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D0B10E71F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 05:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749705298; x=1781241298;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T1Om7QZTkd7xteqUWB+VuAuAj+qSCRIcjk3cY47VQm4=;
 b=CIIxwFkNwUP0lrxHLPceJfqvb5oyUHDDwVk5yVdgFJJz1+uIOcoqSDob
 n4xatpzQ/vpj/rw+f09GgBQM18dhCfgv7VK37+wlDQ4LpsveCV8yXrPAa
 IfoA6TOZjaLshSkF48v/4RhqvruzEjcQDmscEz+K1S45BvtkxwSMyW7sL
 D1YfD8ZfNPOfHUKeJX4Ejg7EjYJB863E+Eb+v0YWC3HXsGFGQhgUZAm9D
 MTv8OjYcY8JOdMi2TsqPM8/XJtt8KYlIck6y1wvSWN4c3GePVJeJAQit9
 ex1QHZQHIz/0Us9JYBOWQe+ygpyA/jF0q3KhQulQEsWXdvTKXYRXxBkVa w==;
X-CSE-ConnectionGUID: NlkV7F4dRZ2ZRI/ZCnPXsw==
X-CSE-MsgGUID: ind1Oj7SQ3uNOlQRy8nwVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="50974843"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="50974843"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:14:58 -0700
X-CSE-ConnectionGUID: 4+YEl3K4THer9QxeLLAGuA==
X-CSE-MsgGUID: fxS8bNyVS02TLYEXZSgALQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="151210257"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:14:56 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/2] Fix Hdcp Blocklist
Date: Thu, 12 Jun 2025 10:43:24 +0530
Message-Id: <20250612051326.430330-1-santhosh.reddy.guddati@intel.com>
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

Fix hdcp tests skipping on valid outputs.
The issue started with the below patch and this series will address the
failures.

https://patchwork.freedesktop.org/series/149614/

Santhosh Reddy Guddati (2):
  lib/igt_panel: Validate vendor name in igt_is_panel_blocked
  tests/kms_content_protection: Skip empty vendor names in blocklist

 lib/igt_panel.c                | 8 ++++++--
 tests/kms_content_protection.c | 9 ++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.34.1

