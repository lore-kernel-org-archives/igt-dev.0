Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09003C0218B
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 09:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B629E10E79C;
	Thu, 23 Jan 2025 09:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZ+WZ6GS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E40310E79C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737624146; x=1769160146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFjEpIbilUpwlMR88pxnhBFDIUtPKfM6Xkz3c8ai4Ks=;
 b=QZ+WZ6GS49hwGtLyBJdti73zjUG0xtolxV5XJh98iVQv8AHyTE2h7ywo
 R7soWa3Sn9maFH7+91tTZQugJjUoSNd3lxY05BTjRpYFDbEgnFn8HcMyb
 e2iIQqRSGAUswYF1vZBx9WhhJqfdT7kFfTToNiPH0vqBU9eam5yG+m93k
 GgZPj3o0P+4642vkXl4F/NEyRRVHVsXnRvqU1i91H66yNkkzplTPMm+A9
 lFQEcIPaKyXM4Vt4tMvRM9hQWLpuzCMbRa+wsRfB1OrTPEv1W6/5WtAa7
 7GGJ//UKuApzrecpfz9YAPuurNdODW3qGtoTy/T/QwhpaLo5x5dOIeiQC Q==;
X-CSE-ConnectionGUID: AG22q+S9RSWZebUonVnE+w==
X-CSE-MsgGUID: /XA9n+U1SIyB4960478n+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="63461480"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="63461480"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:22:25 -0800
X-CSE-ConnectionGUID: d9Lt6Ct2RW+2U/KMfwHeeA==
X-CSE-MsgGUID: SR7BzpOZTLuIfvuv8R4bIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107255316"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.85])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:22:23 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_device_scan: change device list variable
 visibility
Date: Thu, 23 Jan 2025 10:22:09 +0100
Message-Id: <20250123092210.48249-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123092210.48249-1-zbigniew.kempczynski@intel.com>
References: <20250123092210.48249-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In commit: 2e8f3e06fb (tests/xe_evict|exec_threads: Use fd reopen
to avoid corrupting global data) I simply changed tests which
corrupted device list global variable. i915 didn't use opening
devices in multithreaded tests but this changed with xe.

Device scan is now unconditional so we may change device list
variable visibility to TLS. With this reverting of above commit
should be safe (but I'm not sure is it worth to do this).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_device_scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 304cfa17a8..c1b0e0e5ff 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -247,7 +247,7 @@ struct igt_device {
 };
 
 /* Scanned devices */
-static struct {
+static __thread struct {
 	struct igt_list_head all;
 	struct igt_list_head filtered;
 	bool devs_scanned;
-- 
2.34.1

