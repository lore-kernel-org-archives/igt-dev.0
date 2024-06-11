Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27785C25B76
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 05:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1980A10E4B1;
	Tue, 11 Jun 2024 05:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DHo8sogj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B6A10E465
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 05:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718082103; x=1749618103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ap4UTm7Eu8LTGDQg2M01/yN29gzlEtd4VWUjDF0IgOA=;
 b=DHo8sogj0ggko0se4njca13QU7UmbZnAbSAcLTLT+Y7Ll6b5eZLCDev9
 7jgV3/GyZfbNKiuIkNbKUS/wo5wVKs/vOgR6RJ20rprp/ebMjC9LwaYzl
 E5oeYQtbMw5g45n6BIOytzYHel4eiLJwKT32M1zBqhSIhGA1opzw+za1m
 nRqXEpF8i/6qrBTVYAjMaaeV6sQV528h/6xJZkKY9TAmkiqkjF+0QiQLN
 9WRmHIq7VIFw4HrgiX45DrEn4bFnZ9uQjozGRf4j8BWnqCMY/ImVwGntu
 wmcQOrbzy3R6/0opcDCA3rN57Eh5xvBHx7ophWA3liYMMYL5lypP6ApkE Q==;
X-CSE-ConnectionGUID: VJG8e2khQriBsZuNegG2SQ==
X-CSE-MsgGUID: p0UXDELfS/qakfnFaUXZHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14997506"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="14997506"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:43 -0700
X-CSE-ConnectionGUID: vJWxuvmGRZG1cgANZk4Bhg==
X-CSE-MsgGUID: EtkYHqy3SRCd2W5LfKyv9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39981272"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:42 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 6/8] tests/kms_tv_load_detect: Test cleanup
Date: Tue, 11 Jun 2024 10:23:46 +0530
Message-ID: <20240611045348.3727239-7-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
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

Make sure the below points in IGT cleanup:

 - Sanitize the state before starting the subtest.
 - Clear the states before exiting the subtest.
 - Update existing libdrm APIs with IGT kms APIs.
 - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_tv_load_detect.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index 8feed385f..9f6f4071e 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -99,6 +99,7 @@ igt_main
 
 	igt_fixture {
 		drmModeFreeConnector(tv_connector);
+		drmModeFreeResources(res);
 		drm_close_driver(drm_fd);
 	}
 }
-- 
2.43.2

