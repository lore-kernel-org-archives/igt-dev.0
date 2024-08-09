Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC94C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 09:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB55210E898;
	Fri,  9 Aug 2024 09:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3xN0swk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D73210E898
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723196111; x=1754732111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bposniTeC9lGkJaE7IuHzYwCMtsueDiPSZKeB4O67vM=;
 b=L3xN0swkETHp4XdvAYv7pwlA5+PQHzaG+XkZ2sM5hQAFM3O58gpQZP0i
 EjmP08J0BV9BdffrMy3UC+6gCI1cgJw0no6ox6yLl1iulUfSR09ApuGJo
 ZF2wtweiLvhyxc0M/NSdlHAOShIhhHWUVBvfc4JZB4Rten78uNULUbFrz
 hZ1810gSbNdQRkrWx36jtAqe8Zie01kNwJ4k3DBK1pe9L6MDSIZMUNt88
 22Os+dA7xrvL+tOmVaDGMPcpR9XN1ywVuqp/lY8TrYo9InO+Ca9Tlq2mv
 35UYlSZlxzCiznsBZtKkNwqXV0MfqjOjaBqO3pw+9fsPuJSgMVkd2B6LD g==;
X-CSE-ConnectionGUID: 54gIoOJvRQ6JGMW4otORow==
X-CSE-MsgGUID: FNujM3b+RcGwe7kAcTt0Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21504109"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="21504109"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 02:35:10 -0700
X-CSE-ConnectionGUID: ZlyholRRRK+qSEIHu3VgYg==
X-CSE-MsgGUID: h/JTL7QYSaCq84e1wmOlcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="80755208"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 02:35:08 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel: Drop 'Run type' from xe_exec_sip
 documentation
Date: Fri,  9 Aug 2024 09:34:47 +0000
Message-Id: <20240809093447.4001496-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809093447.4001496-1-katarzyna.piecielska@intel.com>
References: <20240809093447.4001496-1-katarzyna.piecielska@intel.com>
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

'Run type' is not used in IGT test documentation for some time already.
Let's remove it from the only test that has it.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
---
 tests/intel/xe_exec_sip.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 4b599e7f6..f99726761 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -126,7 +126,6 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
 /**
  * SUBTEST: sanity
  * Description: check basic shader with write operation
- * Run type: BAT
  *
  */
 static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
-- 
2.34.1

