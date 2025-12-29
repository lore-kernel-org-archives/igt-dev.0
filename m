Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B04E8FDB1
	for <igt-dev@archiver.kernel.org>; Mon, 29 Dec 2025 11:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51DD10E1BD;
	Mon, 29 Dec 2025 11:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SB/6WE+0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8118010E1C3
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Dec 2025 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767007085; x=1798543085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KV85fHoGkUIZCq6cKiF73wbQ3sL/LuVQmO/HOS56DC0=;
 b=SB/6WE+0vq+Xy3Kfza2IjPZNZ9quJtADd3REYP3zaZXrYJQYBwK+5plo
 ogHq9U4H1Dhh0BooUg06Z+4P+n3KvAj20F+NfehkOIGW9RyUu2gh8Up0Y
 GFdgI1AaX8uOrbCxAF5aLOJXJLhCflcvkEYzZnQOBBYGygBUM6l+tNkZ5
 6zxGk3AuLNIbioxVkSK+xXbQWUNYWeYK7iWrHGJetoTqEbVQH5jurp4KH
 yscDQTeeCZlHE6pgxHXT+31kyzqqo5vajuj8A35XD0ISJ9W6Sw/JC+9hp
 CRxnZTjJ+DUT+rHbivwjh1sa93AHU+9UTgOu/YtriA2h1yaEWVP819BVh w==;
X-CSE-ConnectionGUID: 0iywgHQqTSuSzozMW42E8w==
X-CSE-MsgGUID: aoSCBffVSPK24IVIQb5Mpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68689065"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="68689065"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 03:18:04 -0800
X-CSE-ConnectionGUID: 0Xxm8e0ATTeRH5TXQZ9CYg==
X-CSE-MsgGUID: pfppFDFUTQCalYaXGqbynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="205374200"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.9])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 03:18:02 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH i-g-t 0/5] Add xe3p compute kernels and preemption support
Date: Mon, 29 Dec 2025 12:17:49 +0100
Message-ID: <20251229111748.375729-7-zbigniew.kempczynski@intel.com>
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

Enable compute-square + preemption tests for CrescentIsland.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>

Shuicheng Lin (1):
  lib/intel_compute: Add loop_kernel_duration support for xe3p

Zbigniew Kempczyński (4):
  lib/intel_compute: Add compute-square for xe3p
  lib/intel_compute: Add loop and loop-count shaders for xe3p
  lib/intel_compute: Add xe3p SIP support
  lib/intel_compute: Enable xe3p preemption testing

 lib/intel_compute.c                |  398 +++-
 lib/intel_compute_krn_loop.h       |   36 +
 lib/intel_compute_krn_loop_count.h |   34 +
 lib/intel_compute_krn_sip.h        | 3127 ++++++++++++++++++++++++++++
 lib/intel_compute_krn_square.h     |   41 +
 lib/intel_compute_square_kernels.c |   11 +
 lib/xehp_media.h                   |    1 +
 7 files changed, 3647 insertions(+), 1 deletion(-)

-- 
2.43.0

