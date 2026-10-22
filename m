Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8F3606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 04:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TWub5GfS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292ED10E1F9;
	Thu, 22 Oct 2026 04:50:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6867D10E1F9
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 04:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792644558; x=1824180558;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wIusnUHaPO37rCDbKwsfKdbDuMGSp015B2ms+6Ygk44=;
 b=TWub5GfSCeZ6KkDlhxzcp63BwXpKmILIzKyZy69l8jVSw3CxXZyylPd9
 lIRus2GKsWrB3ygliMjoL9Q8yYh+F+V2u/mCg+uJgbT3fW+Q5ivhxud3S
 jhOfdev4Wl5FNTpJ8pzFG//n3cVBUbuVGTfBhZPwq7cR+n8Q6gl3KJ0Ne
 f4srNF6RWE9BoVyO3e9w6UkxlqcqQkidKRx2yijkKFBCefLNCV7BgEYf3
 W4MCLw0eR1P0xXZYkZAlhjRQ/2XvbonL/UfzeqmRaqY2EF881/1Fv9eVu
 3diqhPhFJKwiGwhc/kZ+aQPgV0CF1jIajhBb9lOjC6gHOG6b8oxy9/npJ g==;
X-CSE-ConnectionGUID: svBvfYMJTyGrrjPYiccxfg==
X-CSE-MsgGUID: cX1wz0nqTEq5yFFNnL01uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1420050"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1420050"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:49:17 -0700
X-CSE-ConnectionGUID: w7ydMY8STZqX3FLCpDZ7mw==
X-CSE-MsgGUID: /8LRfJaIQ2KGVyd+aI4SDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3615246"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:49:16 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t 0/3] lib/intel_compute: Add missing graphics IP support
Date: Thu, 22 Oct 2026 06:49:00 +0200
Message-ID: <20261022044903.823091-1-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the missing compute and preemption entries for graphics IP
20.02, 30.01 and 30.05 so the compute tests no longer skip.

WMTP and TGP were checked on hardware for all three IP versions.

Jan Maslak (3):
  lib/intel_compute: Add support for graphics IP 20.02
  lib/intel_compute: Add support for graphics IP 30.01
  lib/intel_compute: Add support for graphics IP 30.05

 lib/intel_compute.c                | 33 ++++++++++++++++++++++++++++++
 lib/intel_compute_square_kernels.c | 33 ++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)


base-commit: d40c5ca415f6eed36d83a752600a7d7c1f10f17c
-- 
2.43.0
