Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5100BC71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 05:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E2B10E288;
	Mon, 16 Jun 2025 05:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grgysL7s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8E210E288
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 05:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750051847; x=1781587847;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vnK3Ou37TvHK1APWGnETZJ+7F12f2DLxRPmiwFSvVhc=;
 b=grgysL7sz+oHfc9ejGo3ZR7JOcmSONmbM9VMdiSWOypaIG9NGgDKf0sM
 d+vwTQXEQD/u0YkR2+shUhBsK/kbx7Dvh6GpskkPBVnmOL65DBLqAPGZ7
 I70gVXBwl36HrEcXj+MsCWD62hItT4lfEUlesfr0w6i3m45Gtzvt/1ftt
 2Zsoy32HUgMHOmpYdy8oteqx5a7IhJ4GN88cw9vrYrmFmsLg12ws2aEli
 5r4x9aCiNwTQ3PKbwwneQIkh33L35ja1X1GyckxHyR1KcJWP/NUJi//hZ
 gFSxdYWADbueDn0nFaPjXYQs7kbbGmfo3XQmKkVb23otQxqHey8sa6nFH Q==;
X-CSE-ConnectionGUID: Lst3PXDyTY+RSkhYVrW77w==
X-CSE-MsgGUID: Lr5fBeI5QaOxGEtHI7BvfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51294497"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="51294497"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 22:30:45 -0700
X-CSE-ConnectionGUID: Ok5LRQ2eTHiAtzWCd5BGrA==
X-CSE-MsgGUID: 2LDXy3J5T6mXd/qpPlE+tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148272991"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2025 22:30:45 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v1] tests/kms_vrr/cmrr: Skip display config when commit
 already failed
Date: Mon, 16 Jun 2025 10:59:19 +0530
Message-ID: <20250616052920.3418160-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
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

Don't prepare display pipe when commit already failed for tweaked
display mode. In this case display commit may already been rejected,
and still test tries to set display params on the same. If corresponding
CMRR mode is not found and tweaked mode is already failed to commit then
better further operation should be skipped.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 tests/kms_vrr.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d371d9d7f..01e5f73c0 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -920,13 +920,15 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	}
 
 	igt_output_override_mode(output, &mode);
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	prepare_test(data, output, pipe);
-	result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
-	igt_assert_f(result > 75,
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
-		     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh), result);
+	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
+		prepare_test(data, output, pipe);
+		result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
+		igt_assert_f(result > 75,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
+			     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
+			     result);
+	}
 }
 
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
-- 
2.48.1

