Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172BEC36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 12:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B344810E324;
	Tue,  1 Apr 2025 12:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhFqOQyk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EACA10E324
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743510083; x=1775046083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sRR7oJIpGk/obPtLmRNogzzo/QaXduo+7AHgPih7WZ8=;
 b=KhFqOQykLe8OAaTbPrlHGSK8nKAcHl625ooVimUUNpyxtzQLz64fazmV
 vNWfv7F40u64dK7GNMugDUkxitm6KOUB+GIiDMkB4wcET6A4GaobVamIs
 8NFsPcEkHM39zrdPbiSovb3xtk8FV5kDxknYjiqLtQhSZwtOm6/7AhYwr
 IzW8+R59ypcCDFFQRIWlnvKfIMd98d0NwwYqi3NzTY9X4VUA3ZAPgFYHG
 C+/E2qj5/j4ZWZPP1C+Ox8b2WSrrae2MXYTHsVl9Z7u80XlR7YaRSIhEv
 saHcezHhB2nO/4MTQ/4PIYuvkGK8IGDqup0rEC61vG7zzdh34GPJUfEa3 Q==;
X-CSE-ConnectionGUID: WmBbNoOATfGMINsFAxPPfg==
X-CSE-MsgGUID: pgqfG7LlQJqXCfTxE3OsCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55025482"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="55025482"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 05:21:22 -0700
X-CSE-ConnectionGUID: 1pgXJki4R4+iflvgdNkqfw==
X-CSE-MsgGUID: Fbz0dVQ8SFu7smRIMbSrdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="127186082"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa009.fm.intel.com with ESMTP; 01 Apr 2025 05:21:21 -0700
From: replace_with Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	dominik.karol.piatkowski@intel.com
Subject: [PATCH i-g-t 0/1] tests/intel/xe_fault_injection: Inject fault for
 xe_hw_engine_class_to_str
Date: Tue,  1 Apr 2025 12:06:56 +0000
Message-Id: <20250401120657.1829327-1-sobin.thomas@intel.com>
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

From: Sobin Thomas <sobin.thomas@intel.com>

Use the fault injection infrastructure to make targeted fault injection in
functions xe_hw_engine_class_to_str and check the error handling in the
xe_hw_engine_class_sysfs_init() so that more code paths involving error
handling is tested.

Sobin Thomas (1):
  tests/intel/xe_fault_injection: Inject fault for
    xe_hw_engine_class_to_str

 tests/intel/xe_fault_injection.c | 2 ++
 1 file changed, 2 insertions(+)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>

-- 
2.34.1

