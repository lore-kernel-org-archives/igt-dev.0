Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00262C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 22:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F64210E36A;
	Fri, 14 Mar 2025 22:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNfm4OtK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B72D10E0A5
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 22:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741992351; x=1773528351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PCvRny19bm1vms34DFGVxJD2pNW9SWLYXA1PC53zxrs=;
 b=HNfm4OtKaAxx0b+CfXhabh0OELzM2eUhxNY9Aa2gOqLm9lElolCHbOOS
 2a8kSAfLsyUTr6TDoQy8NFnOiNQ94WeLToEEzd1aWB+kRiwt99Zjl1Ne4
 IWBbibychtbSTa33Fc4pTn7SZNkI4UXPsaMiFGBh1DJ6G5nMGwqTuW6fl
 qHMKuMjxw+Z/uUwfuSM06kh8yoZsSeBfauf1bAhondT7TTfli5yvoUhA/
 dkPAG6Kyf/N5SIuCC/3ON+IBm3291nluHqnVO73jnUYgVfQGEOfKpuNum
 fpU9rYM/MydKGxd6XMBfYutaIzNKe1+Zy+xg6ZpJnBA6kUh0EoOeqoHt3 w==;
X-CSE-ConnectionGUID: xEQ5vHD9RoODt+bKLD5S0A==
X-CSE-MsgGUID: l7RmQSGaR36WrfeGI5BSOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="68524121"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68524121"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 15:45:50 -0700
X-CSE-ConnectionGUID: PGDs8/MfQeeED6qZGmp0nQ==
X-CSE-MsgGUID: nIS0LXP+RM2E4udjOlRhDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121907747"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 15:45:49 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_oa: Fix __for_one_render_engine
Date: Fri, 14 Mar 2025 15:45:43 -0700
Message-ID: <20250314224545.239134-1-ashutosh.dixit@intel.com>
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

Ashutosh Dixit (2):
  tests/intel/xe_oa: Fix __for_one_render_engine
  tests/intel/xe_oa: Don't limit sync tests to render engine

 tests/intel/xe_oa.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

-- 
2.48.1

