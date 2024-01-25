Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F47C4828C
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 10:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5E410E231;
	Thu, 25 Jan 2024 10:57:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630FE10E231
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706180231; x=1737716231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ccab4pTSqUAZRPjFYcdxsDJUFfICNgXaJ0BYpAEhr6w=;
 b=XqEvxGWZvG0YJKfQ/6/0Hq4/Ilt2V1gCYcyHcQTdGyPTlmCf2+2EW0T/
 8KxYuYIjnL+uS36ZPP4WebIh772R5Rp3xGBt+hOuIoItPDyd3p4ls56rn
 wtQjLi3igwe/4uYONfBIDcL6JV+uQsCkIhsDNH1ES9cpjjmO7XvQxZkc9
 Nmqln4Qv5rntz6O1lswRhA0dHqd2EO+uWpP6wfnuDDkfS1Gyxpn9cR9+M
 lWoVssykwweHO1uPPwl+QClOxbOCE84VxlpG9v3MEPach6FXwzxfMZTZJ
 OKI8dLpExeDgD532UlgHa2zy2iPaP8wmQw9M5eiZtKLdtX6wQuF3LJo6S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="433283687"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="433283687"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2365540"
Received: from cdeburca-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.15.173])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:57:08 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/7] lib/xe/ioctl: introduce xe_bb_size() helper
Date: Thu, 25 Jan 2024 10:56:39 +0000
Message-ID: <20240125105646.313561-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
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

We have a number of tests open coding this, plus some tests lacking any
handling for the prefetch size, leading to CAT errors due to overfetch
hitting an invalid page. End goal is to fix all the tests that are
missing the overfetch handling first, using the new helper, and then
convert all the places that were open coding this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_ioctl.c | 6 ++++++
 lib/xe/xe_ioctl.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index d3f9905ee..da2a7af51 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -51,6 +51,12 @@ uint32_t xe_cs_prefetch_size(int fd)
 	return 4096;
 }
 
+uint64_t xe_bb_size(int fd, uint64_t reqsize)
+{
+	return ALIGN(reqsize + xe_cs_prefetch_size(fd),
+	             xe_get_default_alignment(fd));
+}
+
 uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
 {
 	struct drm_xe_vm_create create = {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 03932561d..2b30f1d98 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -18,6 +18,7 @@
 #define DRM_XE_UFENCE_WAIT_MASK_U64    0xffffffffffffffffu
 
 uint32_t xe_cs_prefetch_size(int fd);
+uint64_t xe_bb_size(int fd, uint64_t reqsize);
 uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
-- 
2.43.0

