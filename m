Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588B7E77180
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 13:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E5110E689;
	Mon, 16 Dec 2024 13:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jb2T4k1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD4410E689
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 13:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734356994; x=1765892994;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HXw4Hel/aZhcFpT/CoXQQwJTvufyocv49tRiTLr1x6s=;
 b=Jb2T4k1D5BJk5OB5f4g3TfK6iQSMQHO3WwDlywcyFgoNGWCqrmYu+d8c
 8BgXtq/5Ndv6BVK1fe9rGOT2bcQD6OhK1Jb12fcrNPsKTceRlgaAeqEgS
 spvthWlzUmoR2CQF/eU2JmKad127gUgbJ2Kz6j2eD+Cp3dESlAfvUgdG3
 685m5RUoyeVF0hUg5+9NzobYmC+yZY/OrdHju3hkF8B/EFoO+yJsSBUB8
 oGjgShr8R6f3A2/HQLVh7EYzr4EZCSF2+mdtI2g+Dg3WgyuvFMj2XIOb0
 RFUAHO3v7MIPK1ffn0LdmUTh5I9QBPRB+/sMTj2V0SEcDYb5pbcd+uGvl Q==;
X-CSE-ConnectionGUID: nphJjV6STpSegn+yr2y7Kg==
X-CSE-MsgGUID: ZSQA7wYEQBuRRAjzEFGGtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34061385"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34061385"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 05:49:52 -0800
X-CSE-ConnectionGUID: iTTKe+nQQQmYHr81gIKVmA==
X-CSE-MsgGUID: g7JlR+9FTiep9dQolAd1bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128191894"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 05:49:51 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 0/3] tests/intel/xe_eudebug: Introduce additional
 ufence testcases
Date: Mon, 16 Dec 2024 14:49:34 +0100
Message-Id: <20241216134937.6136-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Introduce 3 new ufence testcases:
- basic-vm-bind-ufence-delay-ack: Give user fence in application and
  check if delayed ufence ack works
- basic-vm-bind-ufence-reconnect: Give user fence in application, hold
  it, drop the debugger connection and check if anything breaks. Expect
  that held acks are released when connection is dropped.
- basic-vm-bind-ufence-sigint-client: Give user fence in application,
  hold it, send SIGINT to client and check if anything breaks.

v2:
- Rename basic-vm-bind-drop-debugger-before-ufence-ack to
  basic-vm-bind-ufence-reconnect and merge it into test_basic_ufence
- Cleanup after the client in basic-vm-bind-ufence-sigint-client,
  merge the test into test_basic_ufence

v3:
- Use xe_eudebug_client_wait_done instead of sleep
  (basic-vm-bind-ufence-reconnect)
- Add missing braces (basic-vm-bind-ufence-reconnect)
- Get rid of goto (basic-vm-bind-ufence-sigint-client)

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (3):
  tests/intel/xe_eudebug: Add basic-vm-bind-ufence-delay-ack test
  tests/intel/xe_eudebug: Add basic-vm-bind-ufence-reconnect test
  tests/intel/xe_eudebug: Add basic-vm-bind-ufence-sigint-client test

 tests/intel/xe_eudebug.c | 67 +++++++++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 12 deletions(-)

-- 
2.34.1

