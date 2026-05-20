Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60451CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 15:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005AF10E40B;
	Wed, 20 May 2026 15:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNrW8vKi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C4210E40B
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 15:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779292203; x=1810828203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6I9zyfZXWO8KJwF00fImRmSiUIx4VXfWqgrHzJv/uyw=;
 b=aNrW8vKijSuZekOKsznAPrwgqcg5AtJg7zhr268ohBbOQfkd+ytl9VC1
 gJcJmFO+ZPUxfkmp04kWNfOoyT+FJPhIqd4DMlWALKC/AlkccqqqIuzp7
 o0VehO20BclKzwY1NwAwQtXi6EFKmkVAVK+f2wCnp7/mQnLrFYtejiez2
 FLcksF/f/05dez6yfKii5IdIPXZcSD06BSDE7iUv5D5eXLgvqcMsJGRz9
 TW/1n/W/UO7hlfNc7agjMJm521wlAHz3Xvc2j1T/BLQicy+6AMe32Brkg
 vYuIjzlQUOXmObuqE+uhU+wE6ppCgUSO8PA3Sn4Wh2jYXlWudMYh1AvFo A==;
X-CSE-ConnectionGUID: DN99m+kWRbOYN34mX4ySMg==
X-CSE-MsgGUID: /yf9QE1yTZ6ssEhZ8eu40w==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="105657025"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="105657025"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:50:02 -0700
X-CSE-ConnectionGUID: L1PYz6+uRyifTD2EpqmVUw==
X-CSE-MsgGUID: Grmm3FgFRACny7zEvW3CBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="237219154"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.126])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:50:02 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 3/4] tests/intel/xe_exec_system_allocator: Lower
 dmesg size collected
Date: Wed, 20 May 2026 17:49:45 +0200
Message-ID: <20260520154947.116726-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
References: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
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

Allow igt_runner to lower dmesg size collected during a run.
This will drop lines matched with regex, also in success runs
only small 4KB portion of beginning and end will be collected.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 0f1d6ee9c..1f1482a97 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2565,6 +2565,7 @@ int igt_main()
 		va_bits = xe->va_bits;
 		open_sync_file();
 		dev_id = intel_get_drm_devid(fd);
+		igt_emit_ulimit_dmesg(4096, 4096, "drm:drm_pagemap_migrate_to_devmem|Skipping madvise reset for vma");
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
-- 
2.54.0

