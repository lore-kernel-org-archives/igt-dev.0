Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F6ECA5FFF
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 18:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F4110E3A1;
	Tue,  6 Oct 2026 18:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTLrGzFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C3010E3A1
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 18:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791310682; x=1822846682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pXPZaYFWWoPh4sR/gq/b/0BMLL8pY/TSCPNlxcGnugY=;
 b=NTLrGzFBjLr0dr2HIyOV0ietZRwAz1OT599cxrCwSThNaCqpg/wlM0g8
 bz3xe2kR60YgiJkw1Q6grEuRnc3t3NaYe/sbhkNJPssGZhgHbiJJ92vTA
 S/NtD6mYto5HUzNV5QWW+WnSqStU5nopb46kotWrFNpSLml+CUkE6+jiO
 s/Z9dY6+uSj5iGmtZl2rSTwL+A3xnfBBmNBnqn/vcwWOL4WZhbyXvi2FX
 veLnpkb8FKbwgBPSuYxLNCP0Ky5hdsS/QoE2WXd7EuULa5K8NV04WX1lc
 evGsMXnLk6mWVSKCuXQjlA2QUL2Qhju4qlwVi22tx2XAV1By0dinJ0ur3 A==;
X-CSE-ConnectionGUID: LB9neq6fRJqt/DLKLHBeug==
X-CSE-MsgGUID: v2g55lsjTeS1/j3m6aZixw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="95828449"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="95828449"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 11:18:02 -0700
X-CSE-ConnectionGUID: NKaK0wY0TpWiZl9aWK0uUA==
X-CSE-MsgGUID: QoEYGraDRbuOQXcz7ZH5NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="305176392"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2026 11:18:01 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 2/2] tests/intel/xe_exec_atomic: Destroy the bind exec queue
Date: Tue,  6 Oct 2026 18:17:33 +0000
Message-Id: <20261006181733.1291713-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006181733.1291713-1-shuicheng.lin@intel.com>
References: <20261006181733.1291713-1-shuicheng.lin@intel.com>
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

The bind exec queue created in basic_inst() is never destroyed, leaking
one queue per dynamic subtest until the fd is closed. Destroy it before
destroying the VM.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_exec_atomic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index 0aa44740b..795d7b549 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -112,6 +112,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	gem_close(fd, bo);
 
 	xe_exec_queue_destroy(fd, exec_queue);
+	xe_exec_queue_destroy(fd, bind_engine);
 	xe_vm_destroy(fd, vm);
 }
 
-- 
2.43.0

