Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923BEC3ABA9
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 19:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6875010E0A9;
	Tue, 29 Apr 2025 19:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jD8+F/gq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF5D10E0A9
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 19:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745955004; x=1777491004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OMK8iDpcDAVO8oY0fU2MqkXCVuxgQaF95wRBAFHCbDA=;
 b=jD8+F/gqgb02luLt0WRiIhuIMYqgx+c7SJZZ6Esbe03Cf99tdGaxQmY8
 fOFwSIqoK64rvPoSuMFk7WjDxcsPOA1daSgQQ6fUPC4+nRNEx/ZTpMzsY
 T4z8pkPKF5Bo0pI3J3qITgnkJeVyDLa6KbBonY7Zi05pa4YhuZS5VM1+u
 Mg4yAxMEGlExQqVbTvQCbF3WI6jNHc0ZtG/z58T3czNMbe9w1VajgsfCO
 GK0S/nH0mmdpFZKteAQbyOPX8gLpD3Bi7zbh09C35dSBynaYlWE8q2yQ3
 w0feON2MoZkfkeppa3PjPqBGvXG20D88TehuqSWciY0NOdOPNR98p/5E0 A==;
X-CSE-ConnectionGUID: PVPOWaTySl2SMP2/ckyhBw==
X-CSE-MsgGUID: WkX+YjicQGuOOzKWGHW+Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72978025"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="72978025"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:29:58 -0700
X-CSE-ConnectionGUID: rJDLENuKSmy3DuQeVzAIYA==
X-CSE-MsgGUID: iccfd7lsRRqk5MxYEPoQ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="134413045"
Received: from dut4036ptlh.fm.intel.com ([10.105.10.116])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 12:29:57 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com
Subject: [PATCH 0/2] lib/igt_os: Implement and use igt_get_meminfo
Date: Tue, 29 Apr 2025 19:29:54 +0000
Message-ID: <20250429192956.275280-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a new function, igt_get_meminfo, that allows IGT to query the value of a
specific meminfo param.  The new function will be used in the immediate
to prevent various xe_exec_system_allocator tests from running if they
require huge pages and no huge pages have been reserved.

Fixes: 41ee4d698fd8 ("tests/xe: Add system_allocator test")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Jonathan Cavitt (2):
  lib/igt_os: Add igt_get_meminfo
  xe_exec_system_allocator: Require huge pages reserved for huge page
    tests

 lib/igt_os.c                           | 43 ++++++++++++++++++++++++++
 lib/igt_os.h                           |  2 ++
 tests/intel/xe_exec_system_allocator.c | 15 +++++++++
 3 files changed, 60 insertions(+)

-- 
2.43.0

