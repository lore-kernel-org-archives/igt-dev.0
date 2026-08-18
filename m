Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C5FC5DF74
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 05:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C946210E4A3;
	Tue, 18 Aug 2026 05:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9il2WUL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDFA10E49F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 05:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787030847; x=1818566847;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RMx1EvQbO9azm/xOCccJhZ7yXmDhbzb+2LqZFwp+KR8=;
 b=a9il2WULLieJwHECGkBLywoc+TIeE3wi4NPOYREN8r6mx+GhMM2H1IUZ
 e2r7WHY2sHVZJtVjfTuHH89SwY0m6uTb2F5MmKZLXA9Ect5QaEmu3Mq86
 1SVz5+NPWfEtvYqRNp1OoU+5ybPL7PVv05FiNTn7lEElrSbPWj6yW7qCW
 M86llKOulj3Vp4D9ZNBhgfoTS43eYzkPKLlH4ssVxM74CV6G8x0TFSlIp
 P4AuOAHqh2sHJS0SPaBtAy9wdnc4gaKOwMwI7L8FLg9th8WONwVv0Ozks
 K1+FK9iMbFMJJQO4rOjJm+xFQTRVwYgSKU6AnFHh3sSIQ4qP56ES0/vIZ g==;
X-CSE-ConnectionGUID: STuf7UuWQZKiit8bdo78ew==
X-CSE-MsgGUID: oH/U7ZM9QsWoA8CwDMUZDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87426806"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87426806"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 22:27:26 -0700
X-CSE-ConnectionGUID: QS/uWggDR3+KkRN9EaYixg==
X-CSE-MsgGUID: 5hO68fmiRNGCUYtHdTb3ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="288611349"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 22:27:25 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/2] tests/intel/xe_prefetch_fault: Add L2 prefetch
 fault tests
Date: Tue, 18 Aug 2026 10:57:14 +0530
Message-ID: <20260818052716.156973-1-varun.gupta@intel.com>
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

Add coverage for L2 prefetch faults in the xe_prefetch_fault test.

The existing test framework is first refactored to support different
prefetch shader configurations. The second patch then adds coverage for
L2 prefetch faults in both regular and SVM modes.

Varun Gupta (2):
  tests/intel/xe_prefetch_fault: refactor test to accept shader function
    pointer
  tests/intel/xe_prefetch_fault: add L2 prefetch fault subtests

 tests/intel/xe_prefetch_fault.c | 120 +++++++++++++++++++++++++++++---
 1 file changed, 112 insertions(+), 8 deletions(-)

-- 
2.43.0

