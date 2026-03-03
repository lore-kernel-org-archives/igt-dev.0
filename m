Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E799E67A6D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 06:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E282310E032;
	Tue,  3 Mar 2026 06:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWLE756l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DCA10E032
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 06:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772519433; x=1804055433;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nlbnN6Zgcqcas86ZkzfPwIotkbqsjmat5CnqMZUd0To=;
 b=iWLE756l79SlAzuUcZiXWI6IgkSByHUiRzp/RTXDqoaLAdNjtETfd2bf
 3ZixzMbCIKkHPuo4JgDlmHfRrW3LSwCcptvc6jruvPW/xYbiUM0lIDtHY
 tvEO2pItC36HL7dLYkh9vUowjKBSlPe9MYsq1hiPREyVUK+M6eOa211dR
 EHXuWkQwGdLou5lYBczOF//VOXko5D13inuyF99ZnfUsLciFjyUxZQkyW
 400ysBG+ChaYTpmHYevaATWjdsY+7EzwdO3gyHwS6lk1qSAaYzlg9kF/9
 f/Diq6fYrPJ95ltPxyZiTHk7EPBYNEd628t+Lf609lhROrbe2lrI3yzMZ w==;
X-CSE-ConnectionGUID: 2okBtSQbRNm9SnBb5kn6Vw==
X-CSE-MsgGUID: XqZjUVHeSv6rHeBEH0nq8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73729977"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="73729977"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:30:32 -0800
X-CSE-ConnectionGUID: 8G6r/PW1RTCAghmq7513iA==
X-CSE-MsgGUID: aEv6Oq8jTiSvuSubtphweg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="215838468"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa007.fm.intel.com with ESMTP; 02 Mar 2026 22:30:31 -0800
From: priyanka.dandamudi@intel.com
To: zbigniew.kempczynski@intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/2] Validate compute walker notification
Date: Tue,  3 Mar 2026 12:00:28 +0530
Message-ID: <20260303063030.1685514-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add test to validate compute walker notification and update libs related
to compute walker for post sync.

This test is dependent on lib changes present in 
https://patchwork.freedesktop.org/series/162040/

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (2):
  lib/gpu_cmds: Add support for compute walker interrupt
  tests/intel/xe_non_msix: Test compute walker interrupt on non msix

 lib/gpgpu_shader.c        |   4 +-
 lib/gpgpu_shader.h        |   2 +
 lib/gpu_cmds.c            |  15 +-
 lib/gpu_cmds.h            |   9 +-
 tests/intel/xe_non_msix.c | 301 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 6 files changed, 326 insertions(+), 6 deletions(-)
 create mode 100644 tests/intel/xe_non_msix.c

-- 
2.43.0

