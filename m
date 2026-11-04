Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76835606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 00:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vs2Z0rQU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BD010E335;
	Wed,  4 Nov 2026 00:56:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5BA10E335
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 00:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753709; x=1825289709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=awDPjhy/0zLggnVNoyw05zTYbPUD1MPiftO6aUcic7w=;
 b=Vs2Z0rQUZ1gjxKwprTqQ5eyGgsuVWWMtZ7cjzc+dpN3NUDJFLmy9ALph
 YaaWRylFSm4EtrzYT8+ZvPZXVU9ff0AhKhmFIDDXbZiUfF+i8bBNTV08P
 TfVZ18MUoVC7nIUVBZcqyOXHmAIVPGtl58iM7FrgkOdHCET/OxAs4DRfM
 bnC/ZHvCq7Q1BagACMAEI1/43cDikOydGcbFpcS/wBaMZt1l2aPLtn5wg
 UXJHX5WmWgevt6DrUt4W41XCE8ww6BE7sIsx8NJjynKisJBAZkA1A8tAb
 n8MTK3+4nyqT7FjOOHue5NQbj0Hp9f2ZvSZ4Onq14rC7/jP5Ni0/BOLei w==;
X-CSE-ConnectionGUID: Ht2jLJBDS7etRlmnYbFLFA==
X-CSE-MsgGUID: NAa5ovB6Qk+K4LTj0buU2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2506014"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2506014"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:09 -0800
X-CSE-ConnectionGUID: Tnlt996lRle49u4imwUiaA==
X-CSE-MsgGUID: SPksAVxITmKSTOrX0vMyUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6421535"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v2 0/8] Test unbinding PCI device while OA stream is open
Date: Tue,  3 Nov 2026 16:55:06 -0800
Message-ID: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Unbinding PCI device with an open OA stream FD crashed the system with a NPD.
Test the kernel fix for quiescing OA on device removal.

v2:
- Assert expected values (Shekhar)

v3
- Refine based on kernel changes

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (8):
  tests/intel/xe_oa: Move device setup and teardown into helpers
  tests/intel/xe_oa: Add unbind/rebind test with an open OA stream
  tests/intel/xe_oa: Check that a removed device can't open OA streams
  tests/intel/xe_oa: Check OA buffer mmaps across unbind
  tests/intel/xe_oa: Check vm_ops->access on OA buffer mmaps across
    unbind
  tests/intel/xe_oa: Check that blocked OA stream waiters are woken up
    on unbind
  tests/intel/xe_oa: Add an exec queue variant to the unbind/rebind test
  tests/intel/xe_oa: Add an all OA units variant to the unbind/rebind
    test

 tests/intel/xe_oa.c | 569 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 539 insertions(+), 30 deletions(-)

-- 
2.55.0

