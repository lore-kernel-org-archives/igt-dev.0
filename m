Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E7FC5518F
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 07:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F15810E89D;
	Tue,  4 Aug 2026 07:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fu9p1L/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FF010E105
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 07:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785828259; x=1817364259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qj7WhBf5MztCHw0LLwZ9PHEsp4iwJC7HK5IlRYLkHIg=;
 b=Fu9p1L/+VQJ7fY+X4jEGUTntEsH9/gBzKzAwmuKq5eKDGK65rLRSgVk1
 6BM1/CRt/7Fg9mDCjMNP6R69UbHrthjDskhqSGtQXidv8xYdhXsiMaTh/
 1qzwrc3HEob4j/+DOV3S9qRqWPZSRInH6Evlh8lpCn3UTt+Ksf1wUy9wB
 bdonaxOpxF//TFCYgyUHdIz6eVtrC0DO5olpIA+tGDGaqF9Het7BBCucW
 WZuI6Gp94g0vdgxXaI6+0u9PQ2oR7cSw/7CBaMlW4pKgiM9/GQpdFBBeV
 DybT0P5NMOH/dSnRIbEOwqZN1ZIh7n2a66vcC3yz61CFXdxe2HPhjCJUa g==;
X-CSE-ConnectionGUID: PUP6TASTSvad9EkEjXq6OA==
X-CSE-MsgGUID: X9OZtuxfRmuaQZI29heKNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86570603"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86570603"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 00:24:19 -0700
X-CSE-ConnectionGUID: 0ClwXT+aT3mnGWdQroGJnw==
X-CSE-MsgGUID: 2yRayf12TAunH3o+czzmxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="259647280"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 00:24:17 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	piotr.piorkowski@intel.com
Subject: [PATCH 2/2] intel-ci: Block igt@xe_sriov_ggtt.*
Date: Tue,  4 Aug 2026 09:24:07 +0200
Message-ID: <20260804072407.1090889-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804072407.1090889-1-lukasz.laguna@intel.com>
References: <20260804072407.1090889-1-lukasz.laguna@intel.com>
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

This test is dedicated for HW checkout and it's not suited for recurring
CI runs.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 410f43b17..d0a2bf87d 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -114,6 +114,10 @@ igt@sriov_basic@enable-vfs-autoprobe-on$
 igt@sriov_basic@enable-vfs-bind-unbind-each$
 igt@sriov_basic@bind-unbind-vf$
 ##################################################################
+# SR-IOV tests for HW checkout, not suited for recurring CI runs
+##################################################################
+igt@xe_sriov_ggtt.*
+##################################################################
 # Chamelium V1 HDMI receiver supports a maximum resolution
 # of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
 # which exceeds the capabilities of V1 hardware and results
-- 
2.43.0

