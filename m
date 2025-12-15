Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D506AD5B871
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 22:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CBA10E160;
	Mon, 15 Dec 2025 22:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaAe9ke/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2AA10E160
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 22:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765837779; x=1797373779;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d1Q07h07rfMaOJTlmnDc3JdaoahmB4p85lRO0TpTjKk=;
 b=GaAe9ke/xwoUEy53AxJdsNi50P2CLZ1kyYTfGfX3/EExkdwfmZLc77TS
 e2HSz68aT4ARHCXy/uVvFTg2IUXHp+vZWA0LPjB/wYByzbWnHSauvvPOG
 YsU0c+xDeILhBWbZYFcKpNNX2L5L4o4z0mj8paNy/hGzi3easKXAL3OlO
 tCxo2+p+qMWK3N+mSNZm3KpvRNQIgPdgEuwyVWRjcibVBoDZfpIVJrUWL
 HzKH0VSIhaZRQvm4MC3WZRzvsrxN1JX/PmkR6tu446voev3ppNbo7Har/
 A+ynSj+Q8/0uZsRsCB3yyHqQjsLHVFcFwJs8e0po01gDQAegYkiLbC7LL Q==;
X-CSE-ConnectionGUID: Qq6DmQKZQNK+sTmbBzPr1g==
X-CSE-MsgGUID: Ntxx8q/cSYO3b0+u+FfjGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55315057"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="55315057"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:29:39 -0800
X-CSE-ConnectionGUID: Rpnw55jfSICQ3Mk2DWIJlw==
X-CSE-MsgGUID: Br0nY5sfSmSCEVqMXK+RiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197836361"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:29:40 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 0/3] xe_oa: Add MERT OA unit
Date: Mon, 15 Dec 2025 14:29:32 -0800
Message-ID: <20251215222935.2002656-1-ashutosh.dixit@intel.com>
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

Prepare to merge IGT changes after MERT OA unit series is merged into the
kernel. This is the kernel series:

	https://patchwork.freedesktop.org/series/158598/

Ashutosh Dixit (3):
  drm-uapi/xe: Sync with DRM_XE_OA_UNIT_TYPE_MERT definition
  tests/intel/xe_oa: Add MERT OA unit
  tests/intel/xe_oa: Also print oa_unit_type

 include/drm-uapi/xe_drm.h |  3 +++
 tests/intel/xe_oa.c       | 19 ++++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.48.1

