Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8700FE9B36A
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 12:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E31510E4CF;
	Mon,  2 Mar 2026 12:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQD7nlAl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4429410E4BD
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 12:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772454326; x=1803990326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z7XUtLMFYqnBk/sDJH300c6BFPpP5ovqNPSMvnq8EjQ=;
 b=LQD7nlAlGYh1yES+ioBS/6pVqeaOLqAtLoVLjb2Ek1mEK4Bgc+4+sxsF
 1VmESd+73AHtzJ/i7gyWYhSIwqQxZ+ZaFRYpMSuczH9Yjrc+y/hoDUeWF
 VxupiWcfevGS5ubMt/kkt4Z7HjQEmRdHQHRo8toG6MIteTZOGrv0XQAqa
 sh0SZ42CVY4CqDBuomw2/ptHrBRIz66L89nIzJ2XDQCpZpvjVQWdq5zEL
 O/zZj3HKSRjpPvUa2Axgeqszljq1uVkuT0b2g26jASN3FCm25yz5srVnR
 CiMynQ7Ckfkk5x1q+rEp7CyET6HD2nlJ7IscqmC8DqNZxfDfI7ErnV2Nd A==;
X-CSE-ConnectionGUID: OReat7OMQUGaLlCnKxLJ5g==
X-CSE-MsgGUID: +xz199SvSD6qJoC5D9rBGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73161095"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73161095"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 04:25:24 -0800
X-CSE-ConnectionGUID: +t0uPK0lT72iDe6sQvnJrQ==
X-CSE-MsgGUID: 1o6guZc/Tee+l2WrUjXcOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="222616751"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.35])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 04:25:22 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t v2 0/5] Extend compute userenv to support user passed
 buffers
Date: Mon,  2 Mar 2026 13:25:18 +0100
Message-ID: <20260302122517.4126472-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add support for user passed buffers in compute userenv. This allows
users to pass their own input and output buffers to compute tests, which
can be useful for testing specific scenarios.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>

Zbigniew Kempczyński (4):
  lib/intel_compute: Add types for input and output buffers
  lib/intel_compute: Extend userenv by adding input and output bos
  lib/intel_compute: Use user offsets and loop size if provided
  tests/xe_compute: Exercise user passed buffers
  tests/xe_compute: Use appropriate feature in compute-square tests

 lib/intel_compute.c      | 191 ++++++++++++++++++++++++++++-----------
 lib/intel_compute.h      |   4 +
 tests/intel/xe_compute.c | 110 +++++++++++++++++++++-
 3 files changed, 250 insertions(+), 55 deletions(-)

-- 
2.43.0

