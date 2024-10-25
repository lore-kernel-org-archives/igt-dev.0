Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322BFD116F6
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 05:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B2110E02E;
	Fri, 25 Oct 2024 05:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3lsWPQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D287610E02E
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 05:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729835133; x=1761371133;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GWm7zJK/iwDkKNGujd1BVI02m4dOsTqmO74LnrmYJEA=;
 b=R3lsWPQ84Q6eD7+Fdc0mG9iouAjKnP2jOlnqNNrlpmq8BlrTg7jtq1L8
 PAM93BfIXNj6ZY/2Wb0TwrZY7gVsXAurhr/NVlt1cEUaUXgr6dL8G8tzy
 fQLlJwle53GcSxIvnGGQR3/mThV4q7PQoFLWH4Q/HlCMv7ti01dzvKFfP
 AOM7FycK52lHa13kCAwQqLHJTu/b833+y7FK6nZPAGH0sWRCqk5nVGXqc
 BYl51gU4XPJDZzfc245Vo5C59LccXVWEHIrMQaDrLqZ71ePyOdpfPMzOu
 hNBVuXzvZStq6tfwKRnkGkQgzExo5nZ4lL2Py5MJPteAdaNpQQrRKEXhl g==;
X-CSE-ConnectionGUID: FlXN5891RpmX4Yk5iVWHhQ==
X-CSE-MsgGUID: Fd+SGhqIQjm3LKpmXeAz2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40080768"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="40080768"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 22:45:32 -0700
X-CSE-ConnectionGUID: rCG7OzSbStSd6fKAC01ejA==
X-CSE-MsgGUID: l2CRQjuPQ9K/+/HOlpiOfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="111656947"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 22:45:31 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v5,
 0/2] tests/xe: Add tests to validate GT coarse power gating status
 and toggle coarse power gating states
Date: Fri, 25 Oct 2024 11:09:02 +0530
Message-Id: <20241025053903.2152292-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Implement test cpg-basic to validate coarse power gating status
after S3 cycle.
Add test cpg-gt-toggle to check if GT coarse power gating is up when
forcewake is acquired and down when released.

v2: Address cosmetic review comments (Riana)
    Fix suspend state (Riana)
    Add exit handler for test cpg-gt-toggle (Riana)

v3: Address cosmetic review comments (Riana)
    Fix commit message & test name (Konieczny)

v4: Address cosmetic review comments (Riana)

v5: Remove unnecessary openings and assertions of gt directories (Riana)

Sk Anirban (2):
  tests/intel/xe_pm_residency: Add GT coarse power gating validation
  HAX: Add Coarse power gating tests to fast feedback list

 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 tests/intel/xe_pm_residency.c            | 80 ++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

-- 
2.34.1

