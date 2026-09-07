Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FAAC79F9E
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 08:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929DF10E6B7;
	Mon,  7 Sep 2026 08:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cii0wVNT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374A310E2D1
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 08:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788769253; x=1820305253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qOgqr+rHP2loyAozAq6lzzL7kXT7UFCki8L+s/xkV1c=;
 b=cii0wVNT7lWQGZJSdWOUFfJWKl+TyZmibUdRRjN1W/HbqxwFxxomnlEQ
 Pv7DLG/9yQ6p9cqBdlL9MPkz8wdwhPuX4m9f2WFLvXVUZQnJNrYv3zMHj
 wWLI0JJpa9aWysadI3N4F8IzMgi0hnj1Bpg8K/hGHWCPjoCa2nOU8l7XC
 LadQpnm3wwr4XpmTN9cVO0moKrjsUFVrFUgn5/SRXMA348mkHea4SYqu+
 lLHd0eIkeqwRPPitLX/wBtx3ztXEoQWnx3XUGW85QF2VTjLMS/GHftftJ
 Jj5V34WCx9GMvArkj5yoi74bEBCgnJKS3b+sFry0VE4p8iDkpDvbJdeZL Q==;
X-CSE-ConnectionGUID: Y/Orpn2lQg6VV1wbbpxqaQ==
X-CSE-MsgGUID: qKo2fuUjRee+W+kM0TjgUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106685109"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="106685109"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:20:53 -0700
X-CSE-ConnectionGUID: DT28Y0aKTzafNEwPyo1yyQ==
X-CSE-MsgGUID: 2Yad/wWORHm70o1kX9yN4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="272580369"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:20:53 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v4 0/2] Add BO Allocation and VM Bind stress infra
Date: Mon,  7 Sep 2026 08:20:35 +0000
Message-ID: <20260907082039.2223531-1-sobin.thomas@intel.com>
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

This series adds the base BO allocation infra for excercising Xe VM
Bind/Unbind with varying BO Sizes and execution workloads 

This infra supports individual and array VM binds, random sized BO
allocation , threaded execution across engines, unaligned VA access and
leak/eviction scenarios

Sobin Thomas (2):
  tests/intel: add BO allocation stress coverage
  test/intel/xe_bo_alloc: Add oversubscribe concurrent bind stress
    subtest

 tests/intel/xe_bo_alloc.c | 1523 +++++++++++++++++++++++++++++++++++++
 tests/meson.build         |    1 +
 2 files changed, 1524 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

-- 
2.52.0

