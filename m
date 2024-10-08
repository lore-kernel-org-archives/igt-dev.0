Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AF6CFB421
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 09:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6A810E4B1;
	Tue,  8 Oct 2024 09:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGhsJBaB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E5C10E4B0
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 09:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728378500; x=1759914500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ROHU108urmLzZH51Q+ohEaXjzLyG3FBT3yemxRc4LNI=;
 b=IGhsJBaB+uxGDYV2vM1ceiZy3y+Z9ezmD6hGyZgE3j6MNnmUEXhbIE1Z
 wo5vNzbEm1a9J1o6dBABUbRTVMzxbGnDQmWP/Ysw+6/kUucHqOU8C8feO
 WAkDc8F9KmX91B3QDW3YXGYP6TPjogEFafCfZ9VZyNEg3KyGpeMwFkKBX
 2LVqrfZMp7rL9N0KgVFsvwz2QQ7h5j4YXqEHUQkEPcxCVJKw43F1T/wAE
 +a8wYJ9n6ybed4ZG8dUoiNpFBfe/oFoVSk6rtbhF0MQbF9fT5eYd1oD7t
 RhWCdUdKOM5F9oA0NIuKgklqs/sASaajL8/f9qIJPXMCqF+TKu2JR17Xi g==;
X-CSE-ConnectionGUID: huQsentUSSmDsoSf6FFnEw==
X-CSE-MsgGUID: UDgSwY+ETD2rK9VwEMYrGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27442785"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="27442785"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 02:08:19 -0700
X-CSE-ConnectionGUID: 3Z47cYiETru6j0mng0hHjw==
X-CSE-MsgGUID: +ly5birtR3CuLzvvqsaLYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="80750456"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.25])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 02:08:13 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/xe_eudebug_online: Remove redundant space
Date: Tue,  8 Oct 2024 11:07:27 +0200
Message-Id: <20241008090727.4057-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008090727.4057-1-dominik.karol.piatkowski@intel.com>
References: <20241008090727.4057-1-dominik.karol.piatkowski@intel.com>
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

Remove redundant space preceding create.vm_id in
xe_eudebug_client_vm_destroy function call.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index e5aaaea22..01ccf45eb 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1091,7 +1091,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	intel_bb_destroy(ibb);
 
 	xe_eudebug_client_exec_queue_destroy(c, fd, &create);
-	xe_eudebug_client_vm_destroy(c, fd,  create.vm_id);
+	xe_eudebug_client_vm_destroy(c, fd, create.vm_id);
 
 	xe_eudebug_client_metadata_destroy(c, fd, metadata_id[0], DRM_XE_DEBUG_METADATA_ELF_BINARY,
 					   2 * sizeof(*metadata));
-- 
2.34.1

