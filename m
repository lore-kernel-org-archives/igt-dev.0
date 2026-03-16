Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A258F013C4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 07:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EA910E1D2;
	Mon, 16 Mar 2026 07:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCv0TsQI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A0F10E1D2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 07:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773646945; x=1805182945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zJa5x0uAei8AiQgVMN9Q7hhEp42Rc/WW8xUirDscksQ=;
 b=UCv0TsQI3VgT2t3WY0JXAsS4a3MF63V1cjGZc+nZffQQzR6dHZSi5YY7
 hfK9crQZJo9cz1W10ZmMhZtdzMpxcE+OOx9skGNcVHD2lByIFs2Wp1+N4
 N5az596LqwCVGZxvx+zaaFPCuY7Wp2ISmjpmCWpLdWqPO2r/6Ss2Za03x
 51ZpP9q/RAo6FfR+UyqKEov1XC1jWuk+1BADZykSpfnwFL/W8zErFPIai
 TQgpgNUCPxHW0A3cE1tmJMO/dXS/uAZtzgbihbnYL57qdpvnDs0Zu+ulg
 W9gJ0o4zvsyPR+VZ27aM3F3PeqXElHrx/pzxMDICbNNXpgRIDGDX75f7X A==;
X-CSE-ConnectionGUID: ub3sinGBSFCeKmi9QPG8aw==
X-CSE-MsgGUID: dddhJpEbSPmsheZFnvSJ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74772345"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74772345"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:42:25 -0700
X-CSE-ConnectionGUID: Awnl1wFfTtuvGLEfZfdLUg==
X-CSE-MsgGUID: UFWgdSGnRw6pTHHGsMYVrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="220878373"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:42:24 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v3 i-g-t 0/1] test/intel/xe_vm: Add oversubscribe concurrent
 bind stress subtest
Date: Mon, 16 Mar 2026 07:42:10 +0000
Message-ID: <20260316074211.2308188-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

Add test for oversubscribing VRAM in multi process environment that
creates VM, bind large BOs and submit workloads nearly simultaneously.

Previous coverage lacked a scenario combining multi-process bind
with VRAM oversubscription. This generates memory pressure with
multi-process VM Bind activity and concurrent submission, exercising
the bind pipeline under eviction pressure.

v2: Removed helper APIs usage clock_nanosleep and commented code.

v3: Refactored code to smaller functions.
    Added check for available SRAM usage and keep the max process to 20.

Sobin Thomas (1):
  test/intel/xe_vm: Add oversubscribe concurrent bind stress subtest

 tests/intel/xe_vm.c | 513 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 513 insertions(+)

-- 
2.52.0

