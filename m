Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EBAC04FF6
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA9410F53E;
	Fri, 12 Apr 2024 09:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0+ANnAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FA010F53E
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913327; x=1744449327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pwy40RAGaerf8pL1oHOi4HCwrf+V6v2dLYzmMsz5Zx0=;
 b=I0+ANnASHlzvtxfYFxxCr5G33JleMzrNVnsIG+oWEvI6JIckFIKmjo0u
 cWHTeM2nmz9cHFkXqZabRB94vge3wmLfH/tOPcVjYjTUSZABf5t6AT5Tg
 NmPK0W0xl3WG/ZQu7JhZiLJ4ZsSVKuwVozdDulSxbw46H5cSis0T7gZ8s
 d5C14C9DOs6C9+U0S02AZVaC9qt4Dt37okrqknqqSeiCLppfOgR0P9fCU
 4v1nP5frvN++oyrLyIs7COh30DBe5nx7+MFJqWFvmvMgRlSYjhKFbm7x6
 UQ5ZCV4xcVc2t8ZPxjUTd0lZNMNo4a3Gs1XteOV0ofidpL0aQZJJSYRcb A==;
X-CSE-ConnectionGUID: NRBpo1RWQIaAXCKlb5KkBQ==
X-CSE-MsgGUID: 9Ak4NCaYSvKm3F1OLKOBfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12146420"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="12146420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:15:20 -0700
X-CSE-ConnectionGUID: A4blPPzlQRufCg5bnrGapQ==
X-CSE-MsgGUID: IF3V6CxsSZ6Lnwo8HkUojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21165141"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:15:19 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 4/4] test/intel/xe_query: Print
 DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM
Date: Fri, 12 Apr 2024 11:01:17 +0200
Message-ID: <20240412090117.32727-5-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412090117.32727-1-nirmoy.das@intel.com>
References: <20240412090117.32727-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Print DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM query flag

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_query.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index a5a2dd7d4..f2aa577c5 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -434,6 +434,8 @@ test_query_config(int fd)
 		config->info[DRM_XE_QUERY_CONFIG_VA_BITS]);
 	igt_info("DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY\t%llu\n",
 		config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY]);
+	igt_info("DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM\t%llu\n",
+		 config->info[DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM]);
 	dump_hex_debug(config, query.size);
 
 	free(config);
-- 
2.42.0

