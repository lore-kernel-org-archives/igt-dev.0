Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB5ACA0EE6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 15:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91C610E62F;
	Tue, 19 Aug 2025 15:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJqmjiE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE3610E62F
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755618680; x=1787154680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=81w/aZ0nDN11uSXNDFmJ19zd2gaesFQ3wbZXUp/bAwc=;
 b=CJqmjiE0YjXCCeU8dI25ZA/CBJPfX+w0A8rG1fnQd3aUzTJoK0mbRPI4
 GFZWHWcBP0CTpVXkz7ul3F6ce5ZQODudQ+SGh6yneiOy/KnnZEMsv3RGA
 8Z0lrqNi9IYo30Rdd926h1AOzs1Dcj1nJTpQiW/ee/0T8LoI3J4ZnqwtA
 6Z88iyHZAO+WwZvJvde84cCq5Xmdki7O58jmAMvfeOgLu9XTonK4HBvcJ
 SjpKXvBz3+IdvKLYT/WhRngH264s7XFk1cwHT+yLA3BkRcTEErkt0Bh9t
 t3qhLznlkH0LkAha3BAL47ZLNpP/9kvxMTxoX6IANe1s5ZP6tFQgwuJEH w==;
X-CSE-ConnectionGUID: vH2JGlUJQhOJw1IAATcXHQ==
X-CSE-MsgGUID: z2IYojdFSveGJO6pyGYI9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57779698"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57779698"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:51:20 -0700
X-CSE-ConnectionGUID: FwNNzXyJRiq78M2BLFBLUg==
X-CSE-MsgGUID: qgz5k8ORTuqS9lJb86CQoQ==
X-ExtLoop1: 1
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.213])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:51:18 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 3/3] tests/kms_3d: Add resources cleanup
Date: Tue, 19 Aug 2025 17:50:58 +0200
Message-ID: <20250819155058.129794-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
References: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
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

Add resources cleanup at test end.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_3d.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index f9734ba38..86254cdcb 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -135,6 +135,9 @@ igt_main
 			drmModeFreeConnector(connector);
 		}
 
+		if (res)
+			drmModeFreeResources(res);
+
 		drm_close_driver(drm_fd);
 	}
 }
-- 
2.51.0

