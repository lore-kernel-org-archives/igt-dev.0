Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658ECCAC592
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 20:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176C710E170;
	Tue, 16 Sep 2025 20:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKPBRqYA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABB510E170
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 20:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758054299; x=1789590299;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CKZf4aSQoZ+2xQtWz9LZcvXKEn3elEpcFzO/9AvSOr8=;
 b=PKPBRqYAeLrXdi9YxyLauDgz/EK/tx176JbPFekcwRVJGMsaP/ylHQ5I
 ZdbJFWEL7Q5qo7anN8l3Nvn9qgoHEGiG6p+UTBtCAmuQlFDC8ebd8P2dq
 Kfy/ZJ4IBrYXnSaR9PrjbB/Vn0RhyyBCkwhJFtsLlVrM95+O/buUFr9TS
 4R/dnIJOXA4pwoDA6tr1OwlcjHuRHIQ+B4FehOpmwTQJAvz5B77Gmk99y
 HW1kjAlxDE02vYJu2TMmxaTmMh7zQc4JAZBc/XDA38mviReQD+iolDapN
 odPqFQesqBX5AM4qAN+UDOgNqcQKPQsi5UwfmyHYv61ifTicF93/KuWYJ g==;
X-CSE-ConnectionGUID: Q/Ao5VvWQbS3vcLkIvrCSA==
X-CSE-MsgGUID: 1/w/1bHDQI+4hMyPYtbLFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59569998"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="59569998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:24:58 -0700
X-CSE-ConnectionGUID: vuXacv8tSnKgbfKgvdAseQ==
X-CSE-MsgGUID: CQy5qm6bTNumcQHJethXPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="212190528"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:24:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 0/3] Add tests to help verify VF migration
Date: Tue, 16 Sep 2025 13:24:51 -0700
Message-Id: <20250916202454.3758884-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

These are proving helpful to find VF migration issues.

Matt

Matthew Brost (3):
  tests/intel/xe_exec_reset: Add job cancel tests
  tests/intel/xe_exec_reset: Add timeslice preempt test
  tests/intel/xe_exec_reset: Long spin tests

 lib/xe/xe_legacy.c          |  56 ++++++++++-
 tests/intel/xe_exec_reset.c | 193 +++++++++++++++++++++++++++++++++++-
 2 files changed, 241 insertions(+), 8 deletions(-)

-- 
2.34.1

