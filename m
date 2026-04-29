Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD96AFF886F
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 02:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695A510EE2A;
	Wed, 29 Apr 2026 02:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODA8W6Sn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4237D10EE2A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 02:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777428543; x=1808964543;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xYoMl209ZXXNf4StGuQQ7TlzC4IlEEta83NKPgY9Vww=;
 b=ODA8W6SnRSEuu1TkU52LshP2ve2/CFC7ahsh1xDkZKSwOYYgC/HaugFD
 J5Pg1bzJIWx9wnjMUjyi/ivvGUWQ+KoaQHw8t04VBSBAUgdy60wJaWgg+
 K4sk9orPLXtiTlsI8iKzb7YsQnIdY4ZDYJmPRn1veGDE38eFuOUKnbLE1
 iMtqNkJAdpUqNFOX1FrlrlPFCy/s0ddO9dVzywp02/rrjarqhjvFvZ6eI
 5Ki2efejD0N8WBtMSKtNNsPqqQp9vkhAPbmXG6aIhhns3XJF+Ev/msN/p
 2wRxvpOVK+rf1NBDR9vLmRKtJ6gLaAiyJGsDrc+i9azUpxj4oOgx2vzIa Q==;
X-CSE-ConnectionGUID: ndrdiUEKSF21HVEgKoeddQ==
X-CSE-MsgGUID: VAPXsZJBRhGaGReAHLHh3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78335581"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="78335581"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 19:09:02 -0700
X-CSE-ConnectionGUID: MSMz2QpCRnCN8RP7GMrCcg==
X-CSE-MsgGUID: BsGwVPstQR+jDB+GxdQNsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="235902013"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 19:09:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 0/2] tests/intel/xe_exec_multi_queue: Replace sleep with
 deterministic wait
Date: Tue, 28 Apr 2026 19:08:55 -0700
Message-ID: <20260429020856.1857656-4-niranjana.vishwanathapura@intel.com>
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

In 'priority' subtest, sleep() is used to ensure some submissions have
reached the hardware before we proceed in the test. But sleep duration
is indeterminate. Instead use a more deterministic method to ensure
those submissions have reached the hardware.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  tests/intel/xe_exec_multi_queue: use timestamp to check job start
  tests/intel/xe_exec_multi_queue: replace sleep with barrier queue

 tests/intel/xe_exec_multi_queue.c | 88 +++++++++++++++++++++++--------
 1 file changed, 67 insertions(+), 21 deletions(-)

-- 
2.43.0

