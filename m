Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC99FA1FD6
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 16:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013EC10EA7A;
	Wed, 22 Apr 2026 16:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIvxFQ0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9D310EA73
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776875452; x=1808411452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XuOPgJiCAGzWoVY6pj1clNrjIFg820Lt/lugsT4aH1s=;
 b=AIvxFQ0Vv7L0Z6DrJvhk6cqreJCb/Olz4l4HtxEvkewC6Db3YkFdW+BB
 DR/Y9ggC3GXVV67qhuq3lfXZmXTJpV1Iamzy8ayKPoZ3IZimugBQARKHp
 3fi9dX1/q0cKI+FVXkY+HBmYA74COAwliNkjddfMs/4GekwcGVtR935sB
 amemzcpwDS6afCMfBiqAczGm1+rO8IT89bcLnMhWMPCuL7u+mSXHuTGw6
 yvMNNlX9Gkr3WJDY8SZWg8glxSAjaqX0A7oJVPNJvqtXZU/PFVllnfzJo
 5581Ff74Jt8uh732+m7T5i6l9omHwdb9jL2dlYWGGfNOdATl0lwDqZaoU A==;
X-CSE-ConnectionGUID: bZSHrqShQS2yI4oaYz9Z5A==
X-CSE-MsgGUID: o+A2/q3rTcWENdEb95j3dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="80420637"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="80420637"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:30:50 -0700
X-CSE-ConnectionGUID: l56I91MZSz+2krXoBdwcrw==
X-CSE-MsgGUID: NQQN6R98Q2e2kVp0pI3NvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="229733740"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:30:48 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/meson: Move Xe experimental info to Xe EUdebug
Date: Wed, 22 Apr 2026 18:30:43 +0200
Message-ID: <20260422163043.153991-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Xe tests are no longer experimental so remove it from Xe builds
and move this info into Xe EUdebug builds.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/meson.build b/tests/meson.build
index 4c1a39e9e..60cea3aa8 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -359,6 +359,7 @@ intel_xe_eudebug_progs = [
 ]
 
 if build_xe_eudebug
+	build_info += 'Xe EUdebug **experimental** tests enabled.'
 	intel_xe_progs += intel_xe_eudebug_progs
 endif
 
@@ -455,7 +456,6 @@ endforeach
 intel_progs = intel_i915_xe_progs
 intel_progs += intel_i915_progs + intel_kms_progs
 if build_xe
-	build_info += 'Xe **experimental** tests enabled.'
 	intel_progs += intel_xe_progs
 endif
 
-- 
2.54.0

