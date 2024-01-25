Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6CDC48286
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 10:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BE110E247;
	Thu, 25 Jan 2024 10:57:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8068510E247
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706180231; x=1737716231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fUKicmnz/G1uu9dG9p/Y0t3L/yq3MMi5vMHoSf10N10=;
 b=RFtTQpkc/GHDGxZwbvF6/doJ39has5uXIEarPo58EPty1UoR32CPG26z
 BYizmC0Ekrv93OjkWpJZjhHNIKVwB3Kcy5XcfsvJ9m4ZDEFqSkzrh6KsA
 zWO/mUE8PEn1k8Ae2HsGhTTjxHw24Mj/XheEQNjjYiyAAXZyt/Y4gNhng
 vbbXlszOoC9n2hLyDOjBBgGganRt1Xmad8vWOd0z4L9laieX7OJYqKz5f
 rcY8cbYT+bwelz6AX9JnSEDSer65BYqarNzfBzxIzJL3WlAwFRYd8/whW
 pHmfDmrcSiQZyaUcxVvXa6s4YOP7PnkmM0751xPV7uYBymGBJMa/c1jhq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="433283689"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="433283689"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:57:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2365547"
Received: from cdeburca-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.15.173])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:57:09 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 2/7] lib/xe_spin: account for prefetch
Date: Thu, 25 Jan 2024 10:56:40 +0000
Message-ID: <20240125105646.313561-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125105646.313561-1-matthew.auld@intel.com>
References: <20240125105646.313561-1-matthew.auld@intel.com>
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

Xe2 expects an extra page after the batch to avoid prefetch hitting an
invalid page. Not doing so can result in CAT errors.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_spin.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 243e97047..2c531e85e 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -186,7 +186,7 @@ void xe_spin_end(struct xe_spin *spin)
 igt_spin_t *
 xe_spin_create(int fd, const struct igt_spin_factory *opt)
 {
-	size_t bo_size = xe_get_default_alignment(fd);
+	size_t bo_size = xe_bb_size(fd, SZ_4K);
 	uint64_t ahnd = opt->ahnd, addr;
 	struct igt_spin *spin;
 	struct xe_spin *xe_spin;
@@ -285,7 +285,7 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
 		  struct xe_cork *cork)
 {
 	uint64_t addr = xe_get_default_alignment(fd);
-	size_t bo_size = xe_get_default_alignment(fd);
+	size_t bo_size = xe_bb_size(fd, SZ_4K);
 	uint32_t vm, bo, exec_queue, syncobj;
 	struct xe_spin *spin;
 	struct drm_xe_sync sync = {
-- 
2.43.0

