Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8553DC3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 17:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E907110E203;
	Tue, 13 May 2025 17:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZ7Ce2k0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C6810E039
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747156034; x=1778692034;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/4KK6Q9IIGlowNtZ9lwCaWNvqu6YDRNm8CIyhP6ZrOQ=;
 b=iZ7Ce2k0w2Ll+bpJ+jnYHKO001+IvsLSPerxoQolbIntfWFcGDQDzjEw
 Z5bStf+0T8hURPfaODcNdZQuPxD9DWQVRF83dx3ls2srRhrlztnMBHXuF
 73fV3yElhggoGabboTdc/aYipDQ9UkLXZhaaIDIRkfVVqwX2NBdmx4lzI
 kwdJ0BI/vWnWTQMS13y/wEBBvjjhY8M3LUOxhgqzsPAcpgqGI8ObCMPR3
 Vsw0oOuqHv0L18jQ/5P2do1w7/PTTODjdDs++3sszxXQNKeLftQLQ7Ewr
 MbFvxdCrdCudTsjwe4G2dCDnPWfUhYmG9e+/oUOSs4eATX1ZaVOT9PlGQ g==;
X-CSE-ConnectionGUID: GQhg1SJWS7+8sHLncd+7wg==
X-CSE-MsgGUID: WoXZHRbaRBuX4OCM3vMRyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48269605"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48269605"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 10:07:13 -0700
X-CSE-ConnectionGUID: 2Pj+4dkBRsiOQoJLPFw1tA==
X-CSE-MsgGUID: jTAjDE2SQFezKve4yZhpXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="174894231"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa001.jf.intel.com with ESMTP; 13 May 2025 10:07:12 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
Subject: [PATCH 0/3]tests/intel/xe_exec_system_allocator: Test to validate SVM
 prefetch ranges
Date: Tue, 13 May 2025 17:07:08 +0000
Message-Id: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test validates prefetch with single range and multi ranges,
and stree testing of prefetch by binding address ranges with different memory
regions to check the expected bahaviour.

Verified with KMD SVM prefetch changes
https://gitlab.freedesktop.org/hghimira/kernel/-/tree/latest_v6_to_be_sent?ref_type=heads

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (3):
  tests/intel/xe_exec_system_allocator: Test to validate basic SVM
    functionality
  tests/intel/xe_exec_system_allocator: Validate preftch of svm with
    single and multi ranges
  tests/intel/xe_exec_system_allocator: Rebind the prefetch ranges

 tests/intel/xe_exec_system_allocator.c | 227 +++++++++++++++++++++++++
 1 file changed, 227 insertions(+)

-- 
2.34.1

