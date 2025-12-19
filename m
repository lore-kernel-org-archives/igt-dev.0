Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F303D767F5
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022EC10EF74;
	Fri, 19 Dec 2025 12:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTtEcyqO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10C510EF6C
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766145717; x=1797681717;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4U8RCp0yfA5O/fWsYaLHM+kOHc1LuYYD+xvy3XzzIX4=;
 b=aTtEcyqOAW+b78UiqUq7dObQrHI3aQ1CAYkQTpY+e+nr2/FvKgW84QrD
 pT5NOtp+r8K8jN3difr5DnN1xHlMz15bZq5L3Y72gzw4FI2knlPtYg3ud
 KDe4pIhlnRy8zYL1dwkAYMJUz77lgvHjuLyPFc6UrKXa+wWZO0tS2biQY
 bLGeMfjbSSbHKfL14lTrlCL32JHbfxKSTxvjmF/ahMej447K7AQVE/+c2
 +QuoyfW6/uYhGph/8YLQaBc89SecxEOVL53nrqASrjMFcoFB1Afq8YTOH
 Y2dRoWpDkfuKHiJL/7mt8i+1grNqmJepPbWj9EM/eF/psiyvb+nSsua/5 Q==;
X-CSE-ConnectionGUID: 2FkQghrxT6K93k7XEEDE2g==
X-CSE-MsgGUID: KlU+qRBFQ5e6Z7uq4qnB/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79473861"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79473861"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:01:57 -0800
X-CSE-ConnectionGUID: Qr8YpsGaQRSQ3GuWXVjV5w==
X-CSE-MsgGUID: 5sRqQqyMQEeqMyqsh7/ipA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203746948"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa004.fm.intel.com with ESMTP; 19 Dec 2025 04:01:55 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/7] Extend multi queue feature validation support
Date: Fri, 19 Dec 2025 17:31:47 +0530
Message-ID: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add multi queue validation support to other tests.

xe_exec_fault_mode
xe_exec_reset
xe_evict
xe_exec_threads

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Apoorva Singh (1):
  tests/intel/xe_exec_reset: Add multi queue subtests

Janga Rahul Kumar (3):
  tests/intel/xe_exec_fault_mode: Add multi queue test support
  tests/intel/xe_exec_threads: Add multi queue basic test
  tests/intel/xe_exec_threads: Extend multi queue testing

Priyanka Dandamudi (3):
  tests/intel/xe_evict: Add basic multi queue test
  tests/intel/xe_evict: Add priority for multi queue
  tests/intel/xe_evict: Enhance testing of multi queue functionality

 lib/xe/xe_legacy.c               |  38 +++++-
 tests/intel/xe_evict.c           | 221 +++++++++++++++++++++++++------
 tests/intel/xe_exec_fault_mode.c | 140 +++++++++++++++++---
 tests/intel/xe_exec_reset.c      | 197 ++++++++++++++++++++++++++-
 tests/intel/xe_exec_threads.c    | 202 +++++++++++++++++++++++++++-
 5 files changed, 725 insertions(+), 73 deletions(-)

-- 
2.43.0

