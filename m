Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C026D10399
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 00:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45BE10E9B4;
	Fri, 25 Oct 2024 00:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyFwmcw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B28010E03F
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 00:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729815589; x=1761351589;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X0I70y2IchIcGYNt1A0J/IpmG5Atd5Htvi85uNLRV5w=;
 b=MyFwmcw9JCEjIJnmHoc/NZNpke/3Ps17BSrlSTc7oYCXMa0z6i1DdGml
 CVToGT5cQbRlU6eCbQ5ZnOqCpUELs3WuWkfvuan0Sc6GWdK4c0HhA5TLh
 4MfGXCVRNFwUys2WYVEveOYdyVx5oAgX2oFRbqXG762QiwyANflgrwf8n
 xq7O1Zg5PjH3b5bYorHYlTPy+f+3jL0nNZPw/FfccJT4aozsENUW9Ggs7
 veTZVp0nwST6F4KzkMHIT03tEKs8JEJmk+d8H8Q+tMv3zbu3rKe3jVF3o
 BBkQIzFdzKJrXRasamZPNenP4pVSzlLuY+/Dt7HxJNAiIfvlswotAHoRz g==;
X-CSE-ConnectionGUID: eM+mVQa1RfiM0hx8kIDI5w==
X-CSE-MsgGUID: Ba6g4J6fQB2ctkkXC+vZuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29584524"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="29584524"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 17:19:49 -0700
X-CSE-ConnectionGUID: JOvK0SSYSwqNCPyREAhJxA==
X-CSE-MsgGUID: GutVRNjUSyWBNzXUM6k0pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="80342244"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 17:19:49 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, nirmoy.das@intel.com,
 priyanka.dandamudi@intel.com, apoorva.singh@intel.com,
 Fei Yang <fei.yang@intel.com>
Subject: [i-g-t 0/1] tests/intel/xe_exec_fault_mode: wait for the completion
Date: Thu, 24 Oct 2024 17:23:21 -0700
Message-Id: <20241025002322.1422552-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Fei Yang <fei.yang@intel.com>

The execution on GPU is out of order, the completion of the
last submission doesn't mean all the jobs are completed. We
need to make sure all the jobs are completed before moving
on to unbinding the buffer, otherwise the test would run
into CAT errors.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  tests/intel/xe_exec_fault_mode: wait for the completion

 tests/intel/xe_exec_fault_mode.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.25.1

