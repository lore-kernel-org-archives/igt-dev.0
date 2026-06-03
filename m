Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D597CD6E60
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 14:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18D310FF3E;
	Wed,  3 Jun 2026 14:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mipOgIQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD24B10FF42
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 14:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780497393; x=1812033393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VvzV+XeEvvv7OZEOx8Du/SHaxmIT+pEbHTYsDlskmsc=;
 b=mipOgIQFP2vQEsmtXfLGnypLHN7nU2JDOMNK7L3Y43Zz+QeTuCGUB6EZ
 JABptX/F6xUogZHuVKAdzGq551wbJGZqi7M6kf2NlWBCb8cKj0u4nS7Zy
 9clhGIHW8F7gA8lerhSHiIsbI0vXH5V9JCtBZNeby2PL/YQCSNQy70CGf
 7T8yS/YAa/Ed01V+OdHltqWf9KJMEy9EAORJeJkoUf2rH2E9P0/Y3jf8q
 c/Z7sQb+JP9/ghr+HOFqFGCkeXK1YVwTAhHIdVSKqhF6fU230uzSEGl8d
 TRum/A/jU+dK1z8sPdj2mmvmpmRRYiWU2WWS6l4va2gxceNOig+dNwC5b Q==;
X-CSE-ConnectionGUID: Sv7RRi3fT4WzR2GUV5ZnUQ==
X-CSE-MsgGUID: kCTluH+ZQviQO6LeCyRwrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80344541"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="80344541"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 07:36:32 -0700
X-CSE-ConnectionGUID: 3sHUPt9rRqWHgUKllCNrrQ==
X-CSE-MsgGUID: u0OpmHHlRiOSYFEJvQt/Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="268156770"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 07:36:31 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 matthew.brost@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_vm: Add fault reserved MBZ assert
Date: Wed,  3 Jun 2026 22:36:28 +0800
Message-ID: <20260603143628.3739477-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

In xe_vm_fault, the reserved fields must be zero.  This is not asserted
test-side, however, so add the missing assertions.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 408bfdb718..386a0981aa 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -3060,6 +3060,8 @@ static void get_property_exercise(int fd, uint32_t vm)
 		igt_assert_eq(f.address, f0.address);
 		igt_assert_eq(f.access_type, f0.access_type);
 		igt_assert_eq(f.fault_type, f0.fault_type);
+		igt_assert_eq(f.reserved[0] | f.reserved[1] |
+			      f.reserved[2] | f.reserved[3], 0);
 	}
 	free(faults);
 }
-- 
2.53.0

