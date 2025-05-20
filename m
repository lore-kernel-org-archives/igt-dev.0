Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12918C3ABDA
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 05:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD4710E0A7;
	Tue, 20 May 2025 05:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bw0PGOlP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6E210E0A7
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 05:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747720194; x=1779256194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OYq9f879xUJ+dMm9eP6Jcz85nGp3Kmrg0t+t1c78BuU=;
 b=bw0PGOlPQDo2h+Qt8kGX0lgeXqvnM0HZ2RzQkMyWgtkoMbj7eBr4yvmL
 iEGRW3MyuTZAO6Sto71Z5Ng6ZTSMahPvFkwLyYprCfyRPtOPbjm7EpdOX
 Yg8wCDEBdUnAPjXrpGKjgq4R3gE6l+3LIf2CnSRNrQmkpO3XCEPqeNtkD
 b0aP/N/qePNK9C7SOZ7K9KEuybX9IeEQ5koZvvn8SxaWE0dAVvjXt/oMa
 Qky7d9ub6BeGR5kJjuKI/Igz5uRi5hL6irnFPyQi4DQXzfv/cPSWSnxpE
 UPAPaxvlGaCiFy9dWzv0L4Y5+4mZkgLIkb7ZK+81j621sqF6FFGPnmwUq w==;
X-CSE-ConnectionGUID: kv9NDqyOSlqgnf2fKhG70Q==
X-CSE-MsgGUID: BKYpGn0BSEiQy6w9lQAWvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60293543"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60293543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 22:49:54 -0700
X-CSE-ConnectionGUID: xkftuEDpSiugIwIyraH+6A==
X-CSE-MsgGUID: KwWa8OJ3RtKteTluDHJcwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139621447"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 22:49:52 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 0/5] Add more tests to validate engine activity
Date: Tue, 20 May 2025 11:43:31 +0530
Message-ID: <20250520061336.656057-1-riana.tauro@intel.com>
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
v3: rename to check_all_engines and use flag per engine (Umesh)
v4: initialize cork to NULL and remove condition check (Umesh)

Riana Tauro (5):
  tests/intel/xe_pmu: Add a helper function to check and end cork
  tests/intel/xe_pmu: Move descriptions of tests to the top of file
  tests/intel/xe_pmu: Add tests to validate engine activity with single
    engine active
  tests/intel/xe_pmu: Add tests to validate engine activity on all
    engines
  test/intel/xe_pmu: Add tests to validate engine activity by loading
    most engines

 tests/intel/xe_pmu.c | 311 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 271 insertions(+), 40 deletions(-)

-- 
2.47.1

