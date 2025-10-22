Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF9ACCD1AB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 11:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4239210E764;
	Wed, 22 Oct 2025 11:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mE4oQ+wF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907BA10E764
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761133621; x=1792669621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yrsHLCm06Ha1n4AaS0bL2/Gm7faxDHFd/nsurhh8LA0=;
 b=mE4oQ+wFIDgYwrsm9tH4l6mg0OBwOqJng2+bHIkAo2nzovitMkCjUv2b
 /pbfY76fKPmQQmw5z3gj7c2J9/RSTC00262wDjeG3CGIaSJRw/PxT2ZaL
 2149Xv6rtnLcJ3DaZrq79IMri28BKwnVYQOTEdetq+ildPPkHsNHvR83X
 T7Vke3ehTND/eJUTElVLsxt/zf+TGtBrWS4Se85L6+e0XjkxNhQIjx4Ca
 5CYMgZtAsic4uLExqYVOiQnrsH/lgK6Gq7SV24daptYXVvf5ROTj3pOsv
 cD1CE2NBh/LQ3q3/gSPqsEMn5kb4/zw7RiCS206wzm554Dj+xKfJPgokv g==;
X-CSE-ConnectionGUID: qy3j56RxT3e1Li62TOOgBg==
X-CSE-MsgGUID: 4JZVw6M3TaK+CPFS79qf0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88744370"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="88744370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 04:47:01 -0700
X-CSE-ConnectionGUID: kwNzSKzCTgSIK00SqNCs3g==
X-CSE-MsgGUID: FJwnuPBOQ/uLgTd875eSbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="184632272"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.43])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 04:47:00 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: Fix uninitialized var
Date: Wed, 22 Oct 2025 13:46:55 +0200
Message-ID: <20251022114655.70478-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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

Fix var used without initialization.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 9bed79af5..591e3e448 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -719,7 +719,7 @@ static void threads(int fd, int n_exec_queues, int n_execs, unsigned int flags)
 	struct drm_xe_engine_class_instance *hwe;
 	pthread_mutex_t mutex;
 	pthread_cond_t cond;
-	int n_engines = 0, i;
+	int n_engines = 0, i = 0;
 	bool go = false;
 
 	xe_for_each_engine(fd, hwe) {
-- 
2.51.1

