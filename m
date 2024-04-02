Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D88DCD1284
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 05:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86DA10F9C6;
	Tue,  2 Apr 2024 05:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHQDTeYZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2347E10F9C6
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 05:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712035901; x=1743571901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CJMiRLC3VP8xVYdkBjv5mzfxdT7joxn7XoXEhw/htco=;
 b=lHQDTeYZG0aONZkcMI4WHShXMb5Jlf3pbzwUjeBW+dWTu44r/7AqgMko
 UoqtuAJwLmSck2Jhim6zy5neqWWkP/F+QxJ5aiKnQD9B0qjfzwcamG15I
 pm1Ph4PgLiKT2uMryADANgR97lECCu0y4eTR6YKacfSr6rnuH2rQnrssj
 XobYmGYcZlqkCj+U1N9SW8t718Mox79B7CHr3+k5s7IHHttRPa0nlfqT2
 jECMItT5EwfvITEzoGynHeyDqLG04MlupPOAAhrbFJlXsXJLfo9wFE9+n
 67T1mN940muWz7EmDDo0D/5bnvnoGVnoR5q1uGLNaeQWxmjqY9GywfKG7 Q==;
X-CSE-ConnectionGUID: GdC9JWyvSQakxX/CKOsPkg==
X-CSE-MsgGUID: cYljdqgXT4GokvlnnybTAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="11003681"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="11003681"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 22:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="41110095"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 22:31:39 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t] lib/igt_kms: adapt to boolean debugfs for
 i915_bigjoiner_force_enable
Date: Tue,  2 Apr 2024 11:12:31 +0530
Message-Id: <20240402054231.1499492-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

adapt to boolean debugfs for i915_bigjoiner_force_enable

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c38021dd7..2a518eb8d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6218,8 +6218,8 @@ bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool
 	close(debugfs_fd);
 	igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
 
-	return enable ? strstr(buf, "Bigjoiner enable: 1") :
-		    strstr(buf, "Bigjoiner enable: 0");
+	return enable ? strstr(buf, "Y") :
+			strstr(buf, "N");
 }
 
 /**
-- 
2.25.1

