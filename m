Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4427C3ABC0
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 05:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3D710E322;
	Thu,  8 May 2025 05:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVNRCGTQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0191D10E322
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 05:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746682012; x=1778218012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lDc/dmyARYZ4LhqkyMb1kms/5bqG1RPKYD3u5SR3Wk8=;
 b=gVNRCGTQ8D5FmVil/fZDf1zK178JSnk0jMGYMQJ5vK3y0qX0BWFnffdp
 fPoUNZ6Hb7rCZi5gyKdH1+prGYsjwwlccUv2DrSsgCBjlr/M/DPM9P4BH
 hlApNpWbPUKCGMre0a8PEC2U/qLx7ZemJ3CR9N4Mt4s/MykNOo+KKD4TO
 kv3nsrmdyhbXj4YNabRYvRQCo6kkcWtY50ZIaE24AuaerVpHcbW1d0NVo
 jY/gCU7S7R6SNkPnEh60qj+ZYzQXUOxVr6F+vhpSlWvcQs1Xx3yZndHm4
 QG/YfIVeEjVWGTOhwgcN8Y7brRbZ635rUBysXymcJB8ZBhFh4Gi4RB2ci g==;
X-CSE-ConnectionGUID: 6NkgRfVUTqefDMDAlP75oQ==
X-CSE-MsgGUID: njuzKpzTTYWud1VFblzj0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59798127"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="59798127"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:26:51 -0700
X-CSE-ConnectionGUID: ohrLe/bvRA6I5d7DKTzndg==
X-CSE-MsgGUID: ghTk3kHWRTSSVWA/Coj2Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="167124012"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:26:48 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 0/5] Add more tests to validate engine activity
Date: Thu,  8 May 2025 11:20:01 +0530
Message-ID: <20250508055006.734259-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add more tests to validate engine activity

1) engine-activity-single-(load/load-idle) : Validates engine activity
by loading a single engine and checking if others are idle

2) engine-activity-all-(load/load-idle) : Validates engine activity by
loading all engines simultaneously.

3) engine-activity-most-(load/load-idle) : Validates engine activity by
loading most engines except some

v2: fix CI failures using allocator

Riana Tauro (5):
  tests/intel/xe_pmu: Add a helper function to check and end cork
  tests/intel/xe_pmu: Move descriptions of tests to the top of file
  tests/intel/xe_pmu: Add tests to validate engine activity with single
    engine active
  tests/intel/xe_pmu: Add tests to validate engine activity on all
    engines
  test/intel/xe_pmu: Add tests to validate engine activity by loading
    most engines

 tests/intel/xe_pmu.c | 322 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 286 insertions(+), 36 deletions(-)

-- 
2.47.1

