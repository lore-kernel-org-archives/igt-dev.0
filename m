Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0835D25B44
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 11:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6707310E6A6;
	Wed, 28 Jan 2026 11:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhiaU6Zh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C49010E6A6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769600205; x=1801136205;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9hu9DbtDiO6G1WMEYTmFPuhJpaqSlgFdiYT9xO0FGbA=;
 b=PhiaU6Zhrbe4G/dgQ2j4iSy0VXUuksdrY7upfhraDgYiS4ywPEqvAcR1
 Qzayjx61GWpxs7MKAbi++5VfFv9JIUslomSOv0vDSBPUthK98J97vdsPI
 9E3+aW262+txxl8ZN/O0rm/mqPL+zNti23txbpLTlfnNfqUMKhJ/BMsEW
 acQN1lBOT2FQ52qGSVsOWdu9s9bChSMIuUPDQZlgOKqhyQf6NApXS/T4K
 PLDAdrwoiHpaEovCtfC0mBr+8ora8aIBURp5GsP2kz1xDVoY6MeNaTjyf
 bv/V8z/m8eicyYPydxNIA7sXwe0n4UAeTforlzelS5eUDHQVxx0SS1H6q w==;
X-CSE-ConnectionGUID: y0WJcADgQFSh16bVGkoa3w==
X-CSE-MsgGUID: SXo9fT0wQnWNWdoq4VgtrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70851459"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70851459"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 03:36:45 -0800
X-CSE-ConnectionGUID: TR1O7M6TTsq+rIlZqMiLnQ==
X-CSE-MsgGUID: v2KriEzeTFCI7D/Wojy9pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208481828"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 03:36:44 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] tests/xe_eudebug_online: fix thread ID math in
 pagefault-one-of-many shader
Date: Wed, 28 Jan 2026 12:36:28 +0100
Message-Id: <20260128113629.706642-1-jan.maslak@intel.com>
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

Jan Maslak (1):
  tests/xe_eudebug_online: fix thread ID math in pagefault-one-of-many
    shader

 tests/intel/xe_eudebug_online.c                   | 5 +++--
 tests/intel/xe_eudebug_online.c.gen.iga64_codes.c | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.34.1

