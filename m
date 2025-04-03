Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA99C3601B
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 08:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10E010E066;
	Thu,  3 Apr 2025 08:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvSPIeCO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4164110E066
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743669284; x=1775205284;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uRpaQ5MRL2VlQ+GJ7mhDsrlppsD9Jj2VEEsX5weY0ME=;
 b=kvSPIeCO0tSl9E5TeEb4kD915rw99jeztJlFbMwfbZF+XNXYbUU9+zqF
 vMwYH0q1XsQIj9gJAl4aiujEapEyMXN3l1WcwrKccxN9WZLV/utyf7Pp/
 EEGYViK00TcK/02PnJm/OvOZu6D7I/fSw8DGgxI/JwmA3A9r82va5B3qB
 2EFFslBnnW3LdFaedoBFhYwCqNo4UJrHmcghNMcpf1+h2Z79Nil5xeqgK
 360utMrdFY/s6EaRzH9jBvtonZOlSiEgout1G5Ho5yF7zQh5bKl6FBMu3
 IPoYe4z9P5RceT9wMQqRlZi50rLd+aJ0K0tvoAJGGPOfRVDipIAtpH9I7 w==;
X-CSE-ConnectionGUID: FaNQnttNSoCCIbc2ZKdZ1Q==
X-CSE-MsgGUID: OQO8+ylHRXSw+DuaFDDi1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55733059"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="55733059"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 01:34:44 -0700
X-CSE-ConnectionGUID: Wc6cxjxGQO6//Sbt6ZhxXg==
X-CSE-MsgGUID: Ecn9Ycb4QDWFN0JhbgNa1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126746435"
Received: from opintica-mobl1 (HELO localhost) ([10.245.244.96])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 01:34:42 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] lib/intel_allocator: protect binding for multithreaded
 tests
Date: Thu,  3 Apr 2025 10:34:38 +0200
Message-Id: <20250403083438.132035-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Upcoming render-copy stress test reveals problem where multiple
threads enter binding code. Before binding/unbinding threads calls
alloc/free which collects operations to be executed in single vm_bind
ioctl. If first thread which fetches all binding operations from the
allocator will be interleaved by second thread which in turn sees no
operations are necessary to complete, it will start to execute jobs
without properly bounded offsets in the vm (it thinks addresses are
already there as there's no operations in the allocator).

Avoid this situation by migrating mutex lock to the place where thread
performing binding will finish its job. This will ensure any other
threads will wait until all binding operations are completed.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_allocator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 341db2a502..d22c70f1f7 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -1535,10 +1535,11 @@ static void __xe_op_bind(struct ahnd_info *ainfo, uint32_t sync_in, uint32_t syn
 			igt_map_remove(ainfo->bind_map, &obj->handle,
 				       map_entry_free_func);
 	}
-	pthread_mutex_unlock(&ainfo->bind_map_mutex);
 
 	xe_bind_unbind_async(ainfo->fd, ainfo->vm, 0, &obj_list, sync_in, sync_out);
 
+	pthread_mutex_unlock(&ainfo->bind_map_mutex);
+
 	igt_list_for_each_entry_safe(entry, tmp, &obj_list, link) {
 		igt_list_del(&entry->link);
 		free(entry);
-- 
2.34.1

