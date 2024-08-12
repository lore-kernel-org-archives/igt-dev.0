Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7E9C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 18:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBB110E260;
	Mon, 12 Aug 2024 18:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCU2eZOJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0729410E260
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 18:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723486100; x=1755022100;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M6jLZsL2oDA97GyuUZSgm43Zvh0sohZeavIcfU6IUL0=;
 b=QCU2eZOJKDWE/uk8CFbmSV3imqZn0AlL5nXeCJc46EAqmEGC+/izTcK/
 ogqFLmaVPcoBsB+c8XHQ+nR5HG7Re8/UdNxK1NkKXQIHtU301BAblEfQ0
 U52lCVLnce6BF26kIwH1Q2p2VBdmbWHiFa0o9IVO9AEqJhFiUck+ESZjc
 jBlu/8qljYuq1Lyt8sUyWOR5+xVPH4YbkQqY8SLzoCa6iOX23DKKXejfQ
 ddsoMMAClPVzCP3IKhM6apjhpwF1uxPqJZ9kZSUJ+P2h7Iqc+j+qnU+NF
 aJ17GPYHG09hn0bPc6wr1YgLGwFs8irE9mg/UTHkA9A/oo5mxigYYopfz A==;
X-CSE-ConnectionGUID: eziWLCeGThGVx0Vi3B2rpQ==
X-CSE-MsgGUID: 6KKdl1i4T3igP+krHYmYyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32186975"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="32186975"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 11:08:20 -0700
X-CSE-ConnectionGUID: d2E1tOlHSoer9O8x6PSMNg==
X-CSE-MsgGUID: oXzDFbR/Tmyp7k6GvSEDCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="63207628"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 11:08:17 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_huc_copy: Enhance HuC status check for
 VF mode
Date: Mon, 12 Aug 2024 20:08:12 +0200
Message-Id: <20240812180812.1310155-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Extend the is_huc_running function to check for both 'RUNNING' and
'PRELOADED' statuses. This adjustment ensures that firmware loading
by the PF driver is accurately recognized when operating in Virtual
Function (VF) mode.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2466

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel/xe_huc_copy.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index 6d8ca0776..c8b5efc7b 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -177,7 +177,6 @@ static bool
 is_huc_running(int fd)
 {
 	char buf[4096];
-	char *s;
 	int gt;
 
 	xe_for_each_gt(fd, gt) {
@@ -185,9 +184,8 @@ is_huc_running(int fd)
 
 		sprintf(name, "gt%d/uc/huc_info", gt);
 		igt_debugfs_read(fd, name, buf);
-		s = strstr(buf, "RUNNING");
 
-		if (s)
+		if (strstr(buf, "RUNNING") || strstr(buf, "PRELOADED"))
 			return true;
 	}
 	return false;
-- 
2.31.1

