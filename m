Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD0AC44515
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 21:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4122F10F608;
	Fri, 17 Jul 2026 21:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0fPxg21";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B480C10F5F3
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 21:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784322034; x=1815858034;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B7Pma9s8nR+KLvf9hOt9mJagVtcP+7c/eUBgBmbxnRE=;
 b=W0fPxg21/NV/+Na4BB1WKLSiy5N0fgofdhxyDghYVdrz6eyxge6KJRde
 nHJ1Xyck+UO+fUWvD43kngSsVYDzglibaYDRlnEgyHxwoqEL4sCKMIehT
 5EqUwJ1aqe3HByerUUPNwrj4eyPcVShrq5jvdWA3mH/UcFo8Txf7dAT/M
 9RBv5v8WBhUuQvMI+wkjc680uYEzjfe0/0x18WsJhHfOPg5B3TxV5OAgU
 gCFrKjGer6iFwpUfZd2h9LTWBqiStmoUFq2qN8rYdrCrQZjDqI0Qn/8aY
 EnUMvk1Z+slbWBPwkcMvFtgI7fzzboPNCJsVeCn2nFNKVwkfqrADdJ395 A==;
X-CSE-ConnectionGUID: 6hai4F++QLKlImDXo0L7kg==
X-CSE-MsgGUID: wF34JvXUSNKn5pqmoE7zxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84774457"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="84774457"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 14:00:34 -0700
X-CSE-ConnectionGUID: SUEqgL+/SJuvx0M+PmBB+A==
X-CSE-MsgGUID: jYX6ZOiPT/GRGxpP/LKTEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; d="scan'208";a="261854699"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 14:00:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 0/4] Update some OA tests
Date: Fri, 17 Jul 2026 14:00:28 -0700
Message-ID: <20260717210027.2008255-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
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

Modify some OA tests to reduce the scope of the test to specific area
and make them more robust. 

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (4):
  tests/intel/xe_oa: Allow disabling load helper from command line
  tests/intel/xe_oa: Do not assume OA buffer is prefilled with zeroes
  tests/intel/xe_oa: Enable capture just prior to reading OA data
  tests/intel/xe_oa: Cleanup blocking and polling tests

 tests/intel/xe_oa.c | 220 ++++++++++++++------------------------------
 1 file changed, 67 insertions(+), 153 deletions(-)

-- 
2.51.0

