Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8C6C4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 11:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BDE10E21E;
	Wed,  7 Feb 2024 11:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lP439HvS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A48310E175
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707306857; x=1738842857;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3+HgPsy5TzRU9TXn9py/EbmAjTTjiewZaATOJN8zFzU=;
 b=lP439HvSElxEpq9rzk/S95tRaMf2TadkK4Z+BnK2ZlrptLaw9LdlVdBy
 2wPz1MuLvvmfLG0/I6wQ6lrKygrdyDcZneCHkMfGU/AGjKWKLqUnWOETo
 LW+WGbabMeZKMk+/0SfIJUyGJrE4HMGkqXIHWDmpMnRWR+jIu1M9Cf3iK
 osTrx/F8clOp2gh1sUA54vWCpAaX1+fqu5KxB1H05vRXWx0WjOM57GHIU
 rOn/9nluFfkpSrQqz8/hcbZbCecC5VvYl+7b77D7AvPPZsHeeiWJcGGxU
 lP/0sJth7nq04aVxJDzM34s8hZ3yX9lfT0YLT27voMupgF9kXPzRrkBSf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="436104643"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="436104643"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 03:54:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="824474331"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="824474331"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.145.169.80])
 by orsmga001.jf.intel.com with ESMTP; 07 Feb 2024 03:54:14 -0800
From: himanshu.girotra@intel.com
To: kamil.konieczny@intel.com,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2] tests/intel-ci: Add xe_vm large subtest to BAT
Date: Wed,  7 Feb 2024 17:24:13 +0530
Message-Id: <20240207115413.16995-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.40.0
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

From: Girotra Himanshu <himanshu.girotra@intel.com>

Add xe_vm large subtest to fast feedback to enhance our premerge testing

Signed-off-by: Girotra Himanshu <himanshu.girotra@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f297fe965..d8fd66a45 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -143,6 +143,7 @@ igt@xe_vm@shared-pde-page
 igt@xe_vm@shared-pde2-page
 igt@xe_vm@shared-pde3-page
 igt@xe_vm@bind-execqueues-independent
+igt@xe_vm@large-split-binds-268435456
 igt@xe_vm@munmap-style-unbind-one-partial
 igt@xe_vm@munmap-style-unbind-end
 igt@xe_vm@munmap-style-unbind-front
-- 
2.40.0

