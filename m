Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3685CC8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 12:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB0910E628;
	Tue,  8 Jul 2025 12:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rg2Qy/cz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3EA10E610
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 12:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751977269; x=1783513269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Re0kC8APC3YRnboGBwW2NMDuY1EKO2HUWCJIqau8gPw=;
 b=Rg2Qy/czo6+E3uWwk+oHJd3r/+PUPUNMunxORwJ0BqBgVeZGhsiVC2pf
 aNJGtRUr/lXbEKfxu1NvYq5Ktake9jSJn9CMi6lIhkahKuU1701mZTYll
 +juPmuSYmC6NHani1rNFsDN2KlWwVCCOe3d5iHEuj6mbxksiGxWYWlAlw
 nCqj634aW3A17f/NGJrhcm6dskySGhgPt7ECVSMcseSXMRH5azbxgIKjg
 RxRvI1gS54Bcbrh1rJVUOdZ5RGJ3r8C8XyFvq2KBksm572yYypvY0E8Hv
 a66PWpWrmnXYmsuv3RChSs7W5i7gPDXfB3HzTGBd3YK6t5PifkvavuP9+ A==;
X-CSE-ConnectionGUID: Qd1MM/2fQtyBkyIYJPKCIA==
X-CSE-MsgGUID: g7lP0EzCRgKApL+CAAzHJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54101334"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="54101334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 05:21:09 -0700
X-CSE-ConnectionGUID: FPjXk6NITF6NdllKKxBnHQ==
X-CSE-MsgGUID: RsoXRjXUST2XhT5Z+JZpEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="192664841"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 05:21:09 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATH i-g-t 0/1] tests/intel/xe_copy : Add check for memset and
 memcpy tests.
Date: Tue,  8 Jul 2025 12:20:55 +0000
Message-Id: <20250708122056.1698837-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
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

Added the check for platforms (graphics_ver < 20) like PVC for memcpy
 and memset for some tests with extended parameters. There are some
tests related to PAGES and some tests extending to larger size writes.
This needs to be skipped.


Sobin Thomas (1):
  tests/intel/xe_copy : Add check for memset and memcpy tests.

 tests/intel/xe_copy_basic.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.34.1

