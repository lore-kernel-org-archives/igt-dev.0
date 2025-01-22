Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE796C02182
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 14:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9E110E6F5;
	Wed, 22 Jan 2025 14:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HhiTXBmQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0380B10E6F5
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737557085; x=1769093085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3gj/hdliwM/AiqlPkNaBYjCHa3WOkch9mt0eTqQ3RPY=;
 b=HhiTXBmQ6jGwsXvWHXRf/EpoEu0cqs/NJoM5anSGxtAp13VIzhuq0u5F
 YMwXr4RpQbKPQOxjbEt0qARlu2EkPBOVZeko0V+3Z31E9WJEKJ8HBqfiM
 +rtF4D4doZ/NBttA8GbASichbUK6jV0i3ERKajL3JGmxfF+BoEoXwXXcE
 GxR5a5N0v9tZZiWyQxU0cG7B9LKIFMflxSPK6a9yhn7SYxKMzLHxZlYU6
 otP7Zs9r4b/uGYF853Nfw6zGORMifx/A76MKdGfdGijGUk9uLjbYwOBRo
 P2ZJRVgk+SV8tGOgDtWL1+s3m9sGtZdtpphb3TjrrT6n7oSy/MSqWMsQe Q==;
X-CSE-ConnectionGUID: xGxYvAnwT8i2oLOFsBx5mg==
X-CSE-MsgGUID: zTSqtiQXQIKp3M5p9dp9WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48612198"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48612198"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:44:45 -0800
X-CSE-ConnectionGUID: +rMzYyT+SamlmUjV4Vs6ZA==
X-CSE-MsgGUID: Lhv88cjdT++y4JJy4CMhWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="112175441"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO dgrzegor-mobl2..)
 ([10.245.244.100])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:44:42 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jordan.l.justen@intel.com, christoph.manszewski@intel.com,
 kamil.konieczny@linux.intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_eudebug_online: Fix 32b compilation
 errors
Date: Wed, 22 Jan 2025 15:44:19 +0100
Message-Id: <20250122144419.327706-3-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122144419.327706-1-dominik.grzegorzek@intel.com>
References: <20250122144419.327706-1-dominik.grzegorzek@intel.com>
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

Fix metadata allocation so it is properly sized on 32b and further
calculations of its size.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 1a146d8c4..726fc55b1 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1063,8 +1063,8 @@ static void run_online_client(struct xe_eudebug_client *c)
 	uint32_t *ptr;
 	int fd, vm_flags;
 
-	metadata[0] = calloc(2, sizeof(*metadata));
-	metadata[1] = calloc(2, sizeof(*metadata));
+	metadata[0] = calloc(2, sizeof(**metadata));
+	metadata[1] = calloc(2, sizeof(**metadata));
 	igt_assert(metadata[0]);
 	igt_assert(metadata[1]);
 
@@ -1086,10 +1086,10 @@ static void run_online_client(struct xe_eudebug_client *c)
 	metadata[1][0] = target_offset;
 	metadata[1][1] = buf->size;
 	metadata_id[0] = xe_eudebug_client_metadata_create(c, fd, DRM_XE_DEBUG_METADATA_ELF_BINARY,
-							   2 * sizeof(*metadata), metadata[0]);
+							   2 * sizeof(**metadata), metadata[0]);
 	metadata_id[1] = xe_eudebug_client_metadata_create(c, fd,
 							   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
-							   2 * sizeof(*metadata), metadata[1]);
+							   2 * sizeof(**metadata), metadata[1]);
 
 	vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
 	vm_flags |= c->flags & SHADER_PAGEFAULT ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
@@ -1144,10 +1144,10 @@ static void run_online_client(struct xe_eudebug_client *c)
 	xe_eudebug_client_vm_destroy(c, fd, create.vm_id);
 
 	xe_eudebug_client_metadata_destroy(c, fd, metadata_id[0], DRM_XE_DEBUG_METADATA_ELF_BINARY,
-					   2 * sizeof(*metadata));
+					   2 * sizeof(**metadata));
 	xe_eudebug_client_metadata_destroy(c, fd, metadata_id[1],
 					   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
-					   2 * sizeof(*metadata));
+					   2 * sizeof(**metadata));
 
 	intel_buf_destroy(buf);
 
-- 
2.34.1

