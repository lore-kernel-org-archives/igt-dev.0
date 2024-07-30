Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67D4C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 16:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644D910E2BC;
	Tue, 30 Jul 2024 16:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Id/lUbXN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F3F10E2BC
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722358185; x=1753894185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fE+mVQCjdXw9NevNzC4rwfHfu5GcjszpkZnF4ohG0Uw=;
 b=Id/lUbXN1Ds3vK3cqQgPB+Gtra+xGJBTgfLcizbtzSNKNKkbk9swTlIS
 VGlFU+K6LkU+HY1XdP95kENHCRq7eC+B6nZ/EiBsBYG0ymS3SNIHN7rGm
 o4B9+tjw4arake34EMMh3+0sGFpTfTMu2PK97yFZd+yuHqfOAISUgJ9jh
 olIN/G4GGPGNJwRcf7AVXYjc5koKH14smmyKKpFzHs9aQ0MWwqvi85Ch3
 5pNYAUmbTNMU1B/PCRQme96qqdkEBHUeOY9p6P242s0eQads776Y638vu
 xGi73z0CiY0sH0IE/bGHNBuMRRLlXwefjSiUDnAdjHeJQxHpcN5sQqvb9 g==;
X-CSE-ConnectionGUID: 2ViL64nVTMSK+eUpt6DgVQ==
X-CSE-MsgGUID: CHyXm/PPQaKHr1qRDl3YAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31338883"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="31338883"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 09:42:56 -0700
X-CSE-ConnectionGUID: pZ1Jw6K0SB2o6SsGPGhiWw==
X-CSE-MsgGUID: okWY7Ar6TrmL2uBv75SS3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="85038975"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.0.122])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 09:42:53 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe_gt_freq: Skip test if 'freq0'
 attribute is missing
Date: Tue, 30 Jul 2024 18:42:31 +0200
Message-Id: <20240730164232.286232-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
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

Add igt_require check for 'freq0' attribute to skip frequency tests
on VF devices where this attribute is not present, preventing test
failure.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_gt_freq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 93ebb5ed0..0a0efeff5 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -414,6 +414,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
+		igt_require(xe_sysfs_gt_has_attr(fd, 0, "freq0"));
 		/* The defaults are the same. Stashing the gt0 is enough */
 		stash_min = get_freq(fd, 0, "min");
 		stash_max = get_freq(fd, 0, "max");
-- 
2.31.1

