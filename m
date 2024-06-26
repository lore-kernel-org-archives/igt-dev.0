Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF17AC30653
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 12:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB1010E87A;
	Wed, 26 Jun 2024 12:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWYjTnFy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B5C10E87A
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 12:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719405533; x=1750941533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OJHfZl0TeZXLqsdUIK45VYXYc8N/vwES+/qXz8VB/7s=;
 b=TWYjTnFyhTPfHisAs95Rtkox68Qinv9OFUUhbR8VdwvAPYUHCpHJTzeo
 6SfEStrwjOlXbHVXjNHBMTPdxwYoGgoBUrEAz3EV9sKE8TwxLAbRnTZmu
 sEj2N/DMRn2Vr7Hmitrg5QsAmNvnQ1P0zzJesxczRpNei4aQfF2Pmde/U
 xhI2J5F+4s56z4OOuwwBa7XWi+2hbIYL+XpltXPBhQorSpDpuYCnx91f8
 P1oc4DveTbvCMF5eYHvU2ucT8G1qhM7vsO7g1kuhfLGaS0iTkgETneQl8
 7gW60Ttj7RJhWNSC9OexrdzXX6I4S6bLDuCu4yMzybxt1f7FVJ02t/fCN w==;
X-CSE-ConnectionGUID: HjZlJac/Tc23Y1HSM3qphQ==
X-CSE-MsgGUID: Or9+Z9YYSmapFAOxQlxTPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="19363307"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="19363307"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 05:38:53 -0700
X-CSE-ConnectionGUID: tqZ12vKHSqGvhEW0JYLYXA==
X-CSE-MsgGUID: n4C3PSIxTqWy0Ahsfrjvuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="75189733"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 05:38:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_evict: Adapt the working set to
 memory size
Date: Wed, 26 Jun 2024 14:38:31 +0200
Message-ID: <20240626123833.3164-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

It turns out that xe_evict in the cm and thread mode is a very good test for
exhaustive eviction. But the test sometimes uses a working set that doesn't fit
in gpu-accessible memory and a total memory size that exceeds the available
system size. Attempt to fix that to avoid false failures. With these fixes
the test should pass unless in -cm mode or multithreaded mode. These require
fixes for exhaustive eviction in the xe kernel driver.

Thomas Hellström (2):
  tests/intel/xe_evict: Reduce allocations to maximum working set
  tests/intel/xe_evict: Reduce the "large" bo size for threaded eviction

 tests/intel/xe_evict.c | 126 ++++++++++++++++++++++++++++++++---------
 1 file changed, 99 insertions(+), 27 deletions(-)

-- 
2.44.0

