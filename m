Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7BDCA0FE8
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 00:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4487B10E182;
	Sat, 23 Aug 2025 00:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyJdZR1B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931A210E027
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 00:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755909335; x=1787445335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TIEJ3dGaRG4Nqdwcn9Yj/+Es0mLD0OZZmmjbLLUF/Zo=;
 b=kyJdZR1BYNf9ZRGHVkO0omWG9p8hhbVYR+7v7otJ3FsshlzeCqc6vKco
 WUte73iyBFZ3Lc7on3cYbC8htFQHcE5PjSGIgeoh0OWMW3cjqEtvY9bT1
 1RYbtP9WXLGVIsXO0UMJMrKb/gS1sTreH8bC6Vgp05K0HILozw945YEZd
 +qbYANNipi6Fh27dCR+MHcMPbrN3D+wJbA1QVuMZ5I2yE6pzznZGPPY1s
 V7S6c1MH+jrhv7PtYs59l5Ly3/FdiJYGkF6upspW9TkpUlcv959Mrljjv
 npOIuj4psVujx54L8+UgBeNZxx1S1ETz4LtGVNyjz6aI/q0X+FKiOIEvk A==;
X-CSE-ConnectionGUID: rDo3KZrER4GXThLUo7WbUA==
X-CSE-MsgGUID: ewXNEMTORPuHcODde24nHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58146827"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58146827"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:35:34 -0700
X-CSE-ConnectionGUID: 04HGA/muSDywiQBviRk5Uw==
X-CSE-MsgGUID: f4fg5Za4QUedkCwxgoMNfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168732387"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:35:34 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 0/4] IGT xe_oa fixes, debug and new test
Date: Fri, 22 Aug 2025 17:34:02 -0700
Message-ID: <20250823003401.109978-6-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (4):
  tests/intel/xe_oa: Fix report dumps in sanity check
  tests/intel/xe_oa: Fix waiting for mmaped reports
  tests/intel/xe_oa: Add a test for tail address wrap
  tests/intel/xe_oa: Add an option to capture ftrace

 tests/intel/xe_oa.c | 141 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 135 insertions(+), 6 deletions(-)

-- 
2.43.0

