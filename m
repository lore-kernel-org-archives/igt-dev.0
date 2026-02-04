Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE08E9D410
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7616010E6BF;
	Wed,  4 Feb 2026 16:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2QBq3ZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317B210E6BF
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770222782; x=1801758782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yw1A413XN853sKh20KCFD9Taz/K7WwET2QOzfvqoDvU=;
 b=Z2QBq3ZBEL94cyd2enzvmT1maQuLN/HJC9h4e/dOsrj4VHk0HBkhpb/z
 m0u4RhWwTaWlXgV51JJvmhb0p4x32OZMsoc5hrCT3fLKP+LzOUgJ5FCQR
 HoErbEbIsK1VXfDNBbIdXL9Tmxv5HpsA+ocdfZ1t5I3WpFEzD08jyDMpv
 Nw9zAWlgmZPZrCa5ulRGSzlSh7g4T/S79QExiOYBW1u3049nALbkXem+E
 j7moHTdU3eyq+nzx2bX8uOiEXO8V9iHcDsnx6sydLJ/9fs1AXM9UZBMq0
 f5dI07HGbmWGHq6Bc4q858oy+fRWr0uEAj0ME+lK+vlJ5z3+5Pfz9ihQW g==;
X-CSE-ConnectionGUID: QthXlXajRfqjI7v990sVCw==
X-CSE-MsgGUID: TugfOJrDRQ6lSErlwpEzeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96867052"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="96867052"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:33:00 -0800
X-CSE-ConnectionGUID: GIwW7urNSl67Rzo6BxQsfQ==
X-CSE-MsgGUID: Bc8qsqIPSBiSqxmHgmFC0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="247804712"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.79])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:56 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 i-g-t 6/7] tests/intel/xe_sriov_flr: Add --no-xe-vfio-pci
 option
Date: Wed,  4 Feb 2026 17:32:09 +0100
Message-ID: <20260204163217.121305-7-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
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

Add --no-xe-vfio-pci to skip loading/binding VFs to xe-vfio-pci.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 tests/intel/xe_sriov_flr.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 951628159..b73727787 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -63,6 +63,7 @@ static const char STOP_REASON_SKIP[]  = "SKIP";
 #define DRIVER_OVERRIDE_TIMEOUT_MS 200
 
 static int g_wait_flr_ms = 200;
+static bool g_use_xe_vfio_pci = true;
 
 static struct g_mmio {
 	struct xe_mmio *mmio;
@@ -385,7 +386,9 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 	if (igt_warn_on(igt_pci_system_reinit()))
 		goto disable_vfs;
 
-	xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
+	xe_vfio_loaded = false;
+	if (g_use_xe_vfio_pci)
+		xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
 	if (xe_vfio_loaded) {
 		vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
 		igt_assert(vf_bound);
@@ -1097,6 +1100,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 	long val;
 
 	switch (opt) {
+	case 'v':
+		g_use_xe_vfio_pci = false;
+		igt_info("xe-vfio-pci binding: disabled\n");
+		break;
 	case 'w':
 		errno = 0;
 		val = strtol(optarg, &end, 0);
@@ -1113,14 +1120,16 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 static const struct option long_options[] = {
+	{ .name = "no-xe-vfio-pci", .has_arg = false, .val = 'v', },
 	{ .name = "wait-flr-ms", .has_arg = true, .val = 'w', },
 	{},
 };
 
 static const char help_str[] =
+	"  --no-xe-vfio-pci\tDo not load/bind xe-vfio-pci for VFs\n"
 	"  --wait-flr-ms=MS\tSleep MS milliseconds after VF reset sysfs write (default: 200)\n";
 
-int igt_main_args("w:", long_options, help_str, opt_handler, NULL)
+int igt_main_args("vw:", long_options, help_str, opt_handler, NULL)
 {
 	int pf_fd;
 	bool autoprobe;
-- 
2.43.0

