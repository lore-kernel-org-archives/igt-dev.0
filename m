Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC21F607F2A9
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 20:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMi+3mRN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD8910E51D;
	Wed,  4 Nov 2026 20:12:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A3310FED4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 20:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793823088; x=1825359088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tcBKOw8wUFE5REco/f1VO8T/1HsLrQATh3nIBl2CiBQ=;
 b=IMi+3mRNyqysbmmOsXylZe83NkXeaq7fMCU+fMQx0MWfXSiG3hH6z9+r
 Kn2h5YAJTyso9mzANPpLJnBP57MJK9mpQUBikPhHnetB5n59Wh6ovpxQQ
 x0EfuXFoAuT7l59/9SI5nMGPVepzq9L23MdQO/p7jNWkihtVQJWNdwBOE
 1Ynv6BimV+/LrfGc+2xLQPALc6eKYBLfuwXqHwdhOvUP9kJys21nztOrU
 AO+hBhj83rDtI2ZsyWLaF9IvCs5ylbiGIzhlxFZXf1mJyYhOz/qKM55qg
 dX94S1uUZtK4JSygUX47lhnk0h+Y6mAJG6D3OuJCnTSpUS5Z4uhIy/WBD w==;
X-CSE-ConnectionGUID: w22ne07qTRSng97c6cr3Cg==
X-CSE-MsgGUID: gpvN2bOOSIGzAN7U3reiig==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2467175"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2467175"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:11:28 -0800
X-CSE-ConnectionGUID: ZuMskXE/SIi6j9LTfePVdA==
X-CSE-MsgGUID: BelYEpIzRWOILSGl3SuwgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6820963"
Received: from dut4008nvlp.fm.intel.com (HELO DUT4008NVLP) ([10.105.8.84])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:11:28 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t v4 0/2] Multi-queue CGP_SYNC replay coverage
Date: Wed,  4 Nov 2026 20:11:17 +0000
Message-ID: <20261104201119.14137-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
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

A CGP_SYNC message can be lost during VF migration and is replayed by the
KMD on recovery. Covering that needs a CGP_SYNC queued or outstanding on a
live multi-queue group at the moment the migration lands, which the
existing multi-queue subtests never produce: they keep every queue in one
group and never change a priority after creation.

The first patch lets a subtest ask for a worker and queue count. The second
uses it to add two subtests, one driving registration syncs across several
full groups and one driving dynamic priority updates on them.

Both are bounded by igt_until_timeout() so the runtime stays flat. On NVL-P
they take around 6 seconds each and raise the CGP_SYNC count from 32 on
multi-queue-basic to 16k.

Jagmeet Randhawa (2):
  tests/intel/xe_exec_threads: Parametrise worker and queue counts
  tests/intel/xe_exec_threads: Add multi-queue CGP_SYNC replay subtests

 tests/intel/xe_exec_threads.c | 157 ++++++++++++++++++++++++++--------
 1 file changed, 120 insertions(+), 37 deletions(-)

-- 
2.53.0

