Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61157C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 09:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C98C10E80D;
	Wed, 12 Feb 2025 09:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zmzu/TOt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F0210E80D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739351023; x=1770887023;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NSzuB+QpzgGs6xfHUsQu7iCMufX9OrIzsGphHQQmeY8=;
 b=Zmzu/TOttHqXbsCtu6qev1y7I0EQCOAsE2NZg6/ZcKjA3X25d/RFmj+e
 Oi7hCoZbr8v4PM0JpRvUA8zBtj2sYxnwXaPmVv4SxWEOim7tBQjdAX/qv
 NJzlWwqXOT1npDjQrHkSjPmgDS4BwPpjEkF0d3qqqexdhvkTsSlKk/H/Y
 O20wFRkbpplSxhtWs+OOSjDD5+EWZIZYeumYWdqsmLDAFABwFk3DPX1vT
 wsnAsIx+yS0BHQA83ZbXhXLhJ448PiyNcctCq89OHiSKDe7NO5Xkpogyu
 2jwUeMbLk8XGDSeaFaAazkDy9wbG72AbAiZge/eAt+iBnYLqQAD6TQFnS A==;
X-CSE-ConnectionGUID: KJbbmE5wSF2LDIUydhLZoQ==
X-CSE-MsgGUID: sR9mx2eyTa6AkDWVL7Un9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50631180"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="50631180"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 01:03:43 -0800
X-CSE-ConnectionGUID: qSN/9STHTQ+XJ2oviSYWFQ==
X-CSE-MsgGUID: R5tuH5GNSEqwsgBrBY1ZbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="117779571"
Received: from dut1069atsm.igk.intel.com ([10.211.176.182])
 by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 01:03:42 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, francois.dugast@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
Date: Wed, 12 Feb 2025 09:03:40 +0000
Message-Id: <20250212090340.3068899-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add fault injection for xe_sync_entry_parse to allow it to fail while
executing xe_vm_bind_ioctl().
This need to be added as it cannot be reached by injecting error through
IOCTL arguments.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 42f5bebd09e5..f87276df18f2 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -210,6 +210,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
 
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 {
-- 
2.34.1

