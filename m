Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9923FCE9D5E
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 15:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B648710E50C;
	Tue,  6 Jan 2026 15:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgGkQnAE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC57B10E525
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767713642; x=1799249642;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dJIKC2dNNYOwUMZDeDM4M1C/BLeRKq2NbiTpcIMYlY8=;
 b=mgGkQnAEVkJzkIsUQ/g91ORkjqPgOZ5WDWVqUxytB+MOYzrAT8lLqM/X
 D1sVGdMoONtdSckbblZfxB16Pw2KFq/KhW+GYztv31EryxiMLZFHEJav+
 d7ch3/6IC/CoLkLDkAe+jYG+7Dpc8AZ8uVosmLpgvN6HZgw4uo8l8jncv
 jU0uqm3PFOr+hTRBBZ7RrS3xQNT4mrdlqZkd3jnFLY9Ry45yrDn54D0GJ
 QHcsZypeOhrZUuEIIDw9E80opp2ul4VAZF/wpqxMZ+GwB2z+8pNYq8MD4
 4BeDHJtDXGTUuOVN8k9xPpoI/Dw833quSvzzCfvsnq1wFbrs6Jx9YE/G2 A==;
X-CSE-ConnectionGUID: e48M2CV3QUu84BAsKMo/dg==
X-CSE-MsgGUID: V5sKN3rPTrOH8uOrSCCxwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="94546762"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="94546762"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 07:33:57 -0800
X-CSE-ConnectionGUID: F1djWsr2QJyhD+FHSxzkXg==
X-CSE-MsgGUID: zBJfmWmdRyKfBlBbN25DZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="206824480"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 07:33:53 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 karthik.b.s@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v5 0/2] Fix chamelium port allocation during igt_fixture
Date: Tue,  6 Jan 2026 21:02:30 +0530
Message-ID: <20260106153232.79004-1-mohammed.bilal@intel.com>
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


Mohammed Bilal (2):
  lib/igt_chamelium: Add connector_test() macro
  tests/chamelium/kms_chamelium_hpd: use helper function for connector
                                     lookup in DP/HDMI/VGA tests

 lib/igt_chamelium.h                 |  31 ++++
 tests/chamelium/kms_chamelium_hpd.c | 238 ++++++++++++----------------
 2 files changed, 128 insertions(+), 141 deletions(-)

-- 
2.48.1

