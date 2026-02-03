Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1958E83043
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 03:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA6C10E301;
	Tue,  3 Feb 2026 03:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sna42P6x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00F610E301
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 03:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770090462; x=1801626462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0iL92Nf/vbkOM+lyLzEn9gKDcYIZiVdCBzn5Oh1um9M=;
 b=Sna42P6xNICFEJ7dXPo5G/hz/Z8FZWcKelP+L/al1ArroEio7spdpJNn
 BCR8gG8wTDJBvAu+3SgdqPHFIdTvHM9F/7/8TCzFsQ3BF3Fcb4KGsMuJi
 zXedg4IKiMz+6HLtxlZDc5j9VFf3mCJEJE33sNJVqmyu4LB80f+OXfQho
 uzIqRfCQhEfwwopFd1mFs8yKzHc2qZJAjMKamINNoC3KFAf8f8UQwyXDi
 8WxKdEimPwuLhlpfzKXafZJTe1nx0vqT8lp3r4yK5Iu3k61ePR93VIfRo
 BCktD7YB+tbbeD1Rv7RVZj4Xtm0Wetj1z4B42q+LXJgkncnfM33Glnchp Q==;
X-CSE-ConnectionGUID: wzWFd3vzQNO8soY95ID1HQ==
X-CSE-MsgGUID: hrWlFHk0SIu/EK/IdFB0KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58834601"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="58834601"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:47:40 -0800
X-CSE-ConnectionGUID: T5lUl21RRNWaozl/8CwSnA==
X-CSE-MsgGUID: aOpl9vuiTkabhni+Fj5E5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="247313448"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:47:39 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v7 0/3] Fix chamelium port allocation during igt_fixture
Date: Tue,  3 Feb 2026 09:15:43 +0530
Message-ID: <20260203034546.1516152-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

The current fixture implementation executes even for unrelated subtests,
causing false failures when expected inputs were not present.
Refactor the DP/HDMI/VGA hotplug tests to use a common
connector lookup pattern so that each test skips cleanly.

v3:
- Introduce a unified connector test macro (Sebastien)
- Remove unused variable (Sebastien)
- Drop per-connector fixture usage (Sebastien)
- Refactor DP/HDMI/VGA hotplug tests (Sebastien)

v4:
- Rename helper to igt_chamelium_get_port (Jeevan)
- Add documentation for helper and macro (Jeevan)
- Use lowercase name for test macro (Sebastien)

v5:
-Iterate and test all matching connected ports (Kunal)

v6:
- Fix macro structure to ensure safe expansion and proper scoping (Kunal)
- Make the macro independent of assumptions in the calling test (Kunal)
- Move connector_test macro to kms_chamelium_helper
  for correct layering (Kunal)
- Use suffixed local variables to avoid name collisions (Kunal)
- Add igt_info logging to show which port is being
  exercised by each subtest (Kunal)

v7:
-Remove the old connector_subtest implementation (Kunal)
-Rename connector_test back to connector_subtest (Kunal)
-Update all call sites to use the renamed connector_subtest (Kunal)

Mohammed Bilal (3):
  tests/chamelium/kms_chamelium: Add connector_test() macro
  tests/chamelium/kms_chamelium: use helper function for connector
    lookup in DP/HDMI/VGA tests
  tests/chamelium: Rename connector_test to connector_subtest

 tests/chamelium/kms_chamelium_audio.c  |  42 ++---
 tests/chamelium/kms_chamelium_edid.c   | 187 ++++++++-----------
 tests/chamelium/kms_chamelium_frames.c | 111 ++++--------
 tests/chamelium/kms_chamelium_helper.h |  36 +++-
 tests/chamelium/kms_chamelium_hpd.c    | 240 ++++++++++---------------
 5 files changed, 252 insertions(+), 364 deletions(-)

-- 
2.48.1

