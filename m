Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F608C3ABAC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 13:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BB310E03B;
	Tue,  6 May 2025 13:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gp7u1XgE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4197B10E03B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 13:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746539257; x=1778075257;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xg2/ZihTT+A7sJ7Zbr6cn4uWKhD2aXLhgzMmly1gLPA=;
 b=gp7u1XgEB9rRkaFuwkBL1wdP0Vm9O1Q6Zec/zXVqi+XZ4BHKR7oBKCK9
 RZcsa0/1n7UHav0j5tj9zPfJm5PpcBYu28BGsHyHFU1KjljEmhxZdvpCp
 LTlwlh7EavSZhypx+JlBZjMwp6MBLdccffNDdjH0pUdnrvFUSWP8sHKL+
 bBvSbaRioQs/PPfZ+KmRPObVo1+42FyaTaK9Gnb7fgWRpNV4m+9zg5s9d
 xHHzvJVw1tGuVsR89RnkR4lJhiQvIc2WXaW/Tf6B132aG1oFeFnp8L+f8
 DhDldZtRnefEnoAuEVMPv0ljNQc1L1CiCcmNavEUBnYJ0eFcK0DNX9vlb Q==;
X-CSE-ConnectionGUID: /7/HhBPTQza2rpic8htUtg==
X-CSE-MsgGUID: KSoKsAa3R8iddmOHSkMzog==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58865713"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="58865713"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:47:37 -0700
X-CSE-ConnectionGUID: QvGEKhU6RfumDj3u3wfiZg==
X-CSE-MsgGUID: OTxNtpXXTnm1ph+mGNJvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136568331"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa008.jf.intel.com with ESMTP; 06 May 2025 06:47:36 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t v2 0/2] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Date: Tue,  6 May 2025 19:33:49 +0530
Message-ID: <20250506140351.29612-1-satyanarayana.k.v.p@intel.com>
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

When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
functions, the CI test systems are going out of space and crashing. To
avoid this issue, a new helper function is created and when fault is injected
into this xe_should_fail_ct_dead_capture() helper function, ct dead capture is
avoided which suppresses ct dumps in the log.

Inject fault into xe_should_fail_ct_dead_capture() function along with
xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct dumps.

Also, added some more guc fault messages in the dmesg ignore list.

Test-with: 20250429134649.4747-1-satyanarayana.k.v.p@intel.com

Satyanarayana K V P (2):
  tests/intel/xe_fault_injection: Suppress Guc CT dumps during fault
    injection
  tests/intel/xe_fault_injection: Ignore faults for *guc*

 tests/intel/xe_fault_injection.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

-- 
2.43.0

