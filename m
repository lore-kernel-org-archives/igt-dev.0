Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC368C5DF81
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 14:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E15A10E568;
	Wed, 19 Aug 2026 14:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DS2m0koL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2469710E142
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787151184; x=1818687184;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xefJePia5NYLK9IxAygr61MnDwtlDpVpAK8Pl6IVahk=;
 b=DS2m0koLLY8q6oOPb5JjznGGBMkBDhBlKR3p1A4Hc6L/aQMHVTFIVf6s
 IxFJGm6zeVqoheUnXHW3fOpcYQHz6JvDcRqd2uWuWKA+9jyBa+rYR5oPj
 6eA16TmckEKen+wGZrQnxzzHlaKfwPpGYcNfE05oMkIGAZ6IDayJJ3Ham
 sPAV2OfThu0v2qMKyWZp5e1bHOunXwHshyjDPSaipATI1w0at33XzB8B9
 VGnHaEka5gDhXPbeVaiS0yEk58KiLPLwNRyy5R7peRSMHObbS47akoqkQ
 rwqUlRZRyXpphySnw9SsI0tA2NmrgEih4X5KZKu2OdTLfx7PclHdL5wQC A==;
X-CSE-ConnectionGUID: OZswP7tHQC+RfJXqDvir7A==
X-CSE-MsgGUID: 7cuKE0RCSgaVB3EjZ+vrgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87588150"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87588150"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:53:04 -0700
X-CSE-ConnectionGUID: ZMKI9TL/Spi5ZelKzsiyCA==
X-CSE-MsgGUID: hguwiYhISLixcEjae40SOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="270791033"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa005.fm.intel.com with ESMTP; 19 Aug 2026 07:53:02 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v1 0/2] fix prefetch/atomic-attribute flow and use internal
 DONTNEED skip flag
Date: Wed, 19 Aug 2026 14:52:59 +0000
Message-ID: <20260819145302.18068-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This fix corrects the prefetch/atomic-attribute transition path and uses
the intended internal test flag for the skip condition, removing dead
execution paths and improving reliability of the affected system-allocator
IGT coverage across platforms.

Nishit Sharma (2):
  tests/intel/xe_exec_system_allocator: fix prefetch-change-attr flow
  tests/intel/xe_exec_system_allocator: use correct DONTNEED test flag

 tests/intel/xe_exec_system_allocator.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0

