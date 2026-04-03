Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F53D3940A
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 01:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA1F10F394;
	Fri,  3 Apr 2026 01:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5s9j1EA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B8010F333
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775180444; x=1806716444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xdc+TnegXXE7NFSSarjILyuaYbZS3XAiqBPqXqUrvUQ=;
 b=K5s9j1EAx12z/oWlexOAjUw0hHCB8jRI8lh3eMoxtFLHGxloFgq0STIW
 59iz9yRw84Xf0S9rhs4GdOHq45GgU2fYEDs1VODq6T4Xm7/f/6WJPp90T
 e5foNY0jFuEuhhMPVfK5igQMF2OknwocpjPAcdkWOnmKnNnnCNTleH2QW
 9RDyIyY32LUV2Inr9Pat9DHnuYUdacE30TbK5Vhb/JabMJzVaXlKHR9Qk
 aO6Za8fRuX8nUYv7DUrgvT14ordfWr+5V5f7ANkwsBO9QgMG4vxRJG8RT
 atuxEf24hlkGTXl/uVPkf7PIPzeWwfCjJ48xc25x+6KB5TmjzLl96+sG7 g==;
X-CSE-ConnectionGUID: frlnl/vlRuquqw1osRbzpg==
X-CSE-MsgGUID: qJflO6XuQo+vRAYTyScCPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="98861873"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="98861873"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 18:40:43 -0700
X-CSE-ConnectionGUID: pTb0zFKSRmG1gUvpHwpvyg==
X-CSE-MsgGUID: QRtwgaIVTwmyXbD8glQeyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="224291586"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2026 18:40:41 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH 4/5] tests/intel/xe_exec_multi_queue: fix expected error for
 parallel queue creation
Date: Thu,  2 Apr 2026 18:40:39 -0700
Message-ID: <20260403014040.310758-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403014040.310758-1-x.wang@intel.com>
References: <20260403014040.310758-1-x.wang@intel.com>
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

Multi-LRC capable engine classes (vcs, vecs) are able to process the
multi-queue create request and reject it with -EINVAL when num_placements
is greater than 1.  Engine classes that do not support multi-LRC cannot
form a parallel queue at all and return -EOPNOTSUPP instead.

Use xe_engine_class_supports_multi_lrc() to pick the correct expected
error code rather than hard-coding -EINVAL for every engine class.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index b5ded0633..dca791fb5 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -113,7 +113,8 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	/* Multi-Queue can't be a parallel queue */
 	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
 	if (n > 1)
-		igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, &val), -EINVAL);
+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, &val),
+			      xe_engine_class_supports_multi_lrc(fd, class) ? -EINVAL : -EOPNOTSUPP);
 
 	/* Specifying multiple MULTI_GROUP property is invalid */
 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
-- 
2.43.0

