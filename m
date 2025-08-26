Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954B0CA0FED
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 22:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C0710E2E6;
	Tue, 26 Aug 2025 22:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xbld7MQn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7E110E2E6
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 22:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756248272; x=1787784272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8bH1hBeh0UrhcQJ/euOM19Q4sLlIghaF6jsxr5xNQqo=;
 b=Xbld7MQnHynFRy+RKvhviA3W9fI2qzcTpWsqSRYeO8LVXGk7CkCRuKkI
 lZe1uiVHYus6QmVPRssekpdqK/L+nN3IwidtBVzPw/vP9nxJSJuGV1ozM
 b9gQblQGdzQKFgK3+a5a/Tf0UEYfvGw+ogGQJjvXcQnQK5FiNmWjSd22k
 QbhaIOO5YjV9AB+oJ7tCQbbe+upbruyFhZIo84lT7hNzEVz6IVyby0j+1
 v9+wLNgpkkAoi8X+KDYwBilAGiJBR8d9UfgiQhnp0B9U1nIk3Ad2grq0e
 FfQhDihsUXFq17T7Na5ovpezSbKMTpNQ7kxYl+V1M1iDMs/fj/mX1Ztft A==;
X-CSE-ConnectionGUID: UcYCXJTcSYq/rCF4ba3wSw==
X-CSE-MsgGUID: vny5HBxgTDaz7SCtd0e1Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58595528"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58595528"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:44:31 -0700
X-CSE-ConnectionGUID: laga5XSpT2Sy2KssgqeJpA==
X-CSE-MsgGUID: hXS4XKN3SEC2t60LnKTaDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="200647262"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:44:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 0/4] IGT xe_oa fixes, debug and new test
Date: Tue, 26 Aug 2025 15:42:57 -0700
Message-ID: <20250826224256.510692-6-umesh.nerlige.ramappa@intel.com>
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

Random stuff gathered from various debugs:

1) Sanity check dumps 4 times the report size, fix that
2) Waiting for mmaped reports need to increment correctly in the loop
3) Add some ftrace capability for debugs
4) Add a test for tail address wrap

v2:
- Review comments from Ashutosh

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (4):
  tests/intel/xe_oa: Fix report dumps in sanity check
  tests/intel/xe_oa: Fix waiting for mmaped reports
  tests/intel/xe_oa: Add a test for tail address wrap
  tests/intel/xe_oa: Add an option to capture register accesses in
    ftrace

 tests/intel/xe_oa.c | 167 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 163 insertions(+), 4 deletions(-)

-- 
2.43.0

