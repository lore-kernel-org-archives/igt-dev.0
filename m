Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF89C3ABC9
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5326910E867;
	Wed,  7 May 2025 16:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AY7G7NTM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A514E10E861
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633900; x=1778169900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UmtwI6e5a7D3U/2yn+PC03GRmtAMR1mJOea7p76xanI=;
 b=AY7G7NTMP2m2nzjcBiLfzEhqQi0DaLJyiSfwbHPj+656rmcjBrFARPeo
 U1VlZQ8quB/WqUZM1T9zGUfEktfhOMSso6jWsQ/FIcRJVTCbgCQd87QAp
 o4L1QfBhdryrjncEioQwx3/C7UVOopJfa+xqb3FAxXiGW9A3s/3OUe0Bg
 QUuQbywCAAsuA8hjoC3NI00eFn//vPlgdWZi++m5uv6dfnE6PglKLikRN
 A9ueStAO4EXMAsRD2DcbvAtynCmkerZfxfZ0n2RLwE+0Xr7VqizPwB1se
 AatB88EflwhM9yh3QGLsb7svH2Pga9f8gYqhVMgFzKt7n3IAJ5H8JjREK A==;
X-CSE-ConnectionGUID: bDTHxheARr2kM+j4d1sswA==
X-CSE-MsgGUID: hA/SmKBFQCaF/Bh2BVINGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519585"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519585"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:04:13 -0700
X-CSE-ConnectionGUID: Lfl3tQmAS8KIlbdR4nPyuw==
X-CSE-MsgGUID: IJ9d07VNQtSYkynGZ3g5pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173201353"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:04:10 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 13/15] lib/igt_device_scan: Replace return value of
 devs_compate to int
Date: Wed,  7 May 2025 16:01:46 +0000
Message-ID: <20250507160148.53857-14-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
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

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_device_scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 3f26a1737..7e9614429 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -949,7 +949,7 @@ static struct igt_device *duplicate_device(struct igt_device *dev) {
 	return dup;
 }
 
-static gint devs_compare(const void *a, const void *b)
+static int devs_compare(const void *a, const void *b)
 {
 	struct igt_device *dev1, *dev2;
 	int ret;
-- 
2.34.1

