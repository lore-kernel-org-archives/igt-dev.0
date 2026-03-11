Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197D8FCC9B1
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 06:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC31110E31C;
	Wed, 11 Mar 2026 06:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NM84FWhl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1E110E31C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 06:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773209335; x=1804745335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5GOAL4RBnJodBL7ZDDt5/MdhH3olDYrBXKDGLXc4VDo=;
 b=NM84FWhlP+3weq12wMQ0nRe7NEJrP1A9w6YC3lNCzCzc4tcz7Bl+AuRq
 AzOx+8Z1ZX8+IERD1sQAVKHJEwYTa0H9fBr++w41yW4YeeforgB5LJ/mx
 O9SSiockqk62g7fmSvUij7+scUtqvmy7gp1BYQczgsmkB21tEaXhGX2/p
 EyMME7zzzb1OT1NLiqNhohLG2MM673EzbPs9lzDUCbARSL6DkyqUQt06a
 voEveJKXuNLqZZTNyteq0jU2/zWruYxTWk8687GQaGsYCqnsgZwd1pMCu
 dzzzmIXJPIOQjK+LAaElRDxyyCQsL52Wba0JmikN9ZlwtCKXuElfpd0Pj Q==;
X-CSE-ConnectionGUID: c0sjEoYUR8mXmAlEyAlPTA==
X-CSE-MsgGUID: ILWeGBctTTiyWW9m2thOtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91652467"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="91652467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:08:54 -0700
X-CSE-ConnectionGUID: bdjfuvMNQSGRwg2rocEj5Q==
X-CSE-MsgGUID: 5eT+r98GSqq8xJwBd8JjTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219604034"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:08:54 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v4 i-g-t 0/2] test/intel/xe_vm: Add overcommit and no‑overcommit handling tests
Date: Wed, 11 Mar 2026 06:08:36 +0000
Message-ID: <20260311060843.2133964-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

IGT tests to validate overcommit behaviour across different VM modes.

Patch 1 sync the drm-uapi/xe header with kernel.

Patch 2 increase coverage to xe_vm tests by adding tests for
 - Over-commit test in fault and non fault mode
 - No-Over-Commit tests in fault mode


Sobin Thomas (2):
  drm-uapi/xe: sync with kernel header
  tests/intel/xe_vm: Add support for overcommit tests

 include/drm-uapi/xe_drm.h |  22 +-
 tests/intel/xe_vm.c       | 483 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 493 insertions(+), 12 deletions(-)

-- 
2.52.0

