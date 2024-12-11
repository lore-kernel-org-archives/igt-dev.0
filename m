Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5275AE7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 13:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DBC10E029;
	Wed, 11 Dec 2024 13:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMjyb0kW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48C910E029
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733925052; x=1765461052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vESFlW3mgRvDr+CheHeF2OIpN6iypy98SVJ5DUpCVmw=;
 b=EMjyb0kW3kT36htZphahtwNiL1XmN4eZI1n7sl5D+6897r1bIDzmDpEG
 kHgjboJWaY6PDTNmE5IQ37FzFNGHNLOd3fGs4e6yKQ20s42tzX9OIL3rT
 ychdzNZTg70cqE+P8Vi5u0wNGoSAOUcmXUgF5t2kT5JbA/FIackp30Nu5
 xV9z5Q1N7e+m1R0l7c8zLeQGLRPiAF3eaolzhrgAt6Yfaq6oE0+hjBRPb
 JFqmeFp4q4i5ZwGsc8d+tyUchMpzKfBZ+p+lvlO4Qq8BQLufznTqbBwS+
 GzUiGRdlav0c+TcIBv+lfHqbDhrRPz62R2LGYR8BSHy6PULM4aN5d2sV9 A==;
X-CSE-ConnectionGUID: grGAHCRuQx6scQN7hk84iw==
X-CSE-MsgGUID: J1c+A6xpSUuncayg53+bwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44913422"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="44913422"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 05:50:51 -0800
X-CSE-ConnectionGUID: 9aM3NVuTQ+OQpldDpFC6oQ==
X-CSE-MsgGUID: 2S+bzmX6RFmEeugabwv7fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100870259"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.30])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 05:50:49 -0800
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
Subject: [PATCH v2 i-g-t 0/3] tests/intel/xe_eudebug: Introduce additional
 ufence testcases
Date: Wed, 11 Dec 2024 14:50:36 +0100
Message-Id: <20241211135039.5853-1-dominik.karol.piatkowski@intel.com>
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

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (3):
  tests/intel/xe_eudebug: Add basic-vm-bind-ufence-delay-ack test
  tests/intel/xe_eudebug: Add basic-vm-bind-ufence-reconnect test
  tests/intel/xe_eudebug: Add basic-vm-bind-ufence-sigint-client test

 tests/intel/xe_eudebug.c | 70 +++++++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 12 deletions(-)

-- 
2.34.1

