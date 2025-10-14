Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E158CCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 09:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD51710E3A5;
	Tue, 14 Oct 2025 09:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dagBzE+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9EE10E3A5
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760434743; x=1791970743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=02EjpBCXDDXCtv6DDsUI/fS6i+RJjTI7Z4sm+sJXTh8=;
 b=dagBzE+iiWuoWPx3RLAx1qXSud8nRQfKGPsBSmhDA8JSBIwDZRzP+Z7W
 xQggkJjB0X9GyykeLrdwJ2d+dmKuV6UcoVery3hPoqC++PfCs94+kJlkY
 IuUTrhdjF92ruoL7UBTl7GvtxGqrwJdmLDVtlkyu6EWT+1GsybM/p28Zf
 cHPzhgAvzFr6XiXPgHf/yNEu/n360tY3QCmbzHNmTb8w28p4CswQGgn/D
 PV4B5hhOmmU2Qw1MtyxV4Ii/1rKgBXWY8KPnxWXf7deUknTByqWCFfTcR
 kmFLEXtO/utDHtaXxDSHal9aEb7Wn8qE+5c4Zvf6C2HCEQN1Ijw+nzYFY w==;
X-CSE-ConnectionGUID: NExUw7rxTxS3wyz4GB0jLA==
X-CSE-MsgGUID: 027qx+c5TqO3IMRsdzGsMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73192495"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73192495"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:03 -0700
X-CSE-ConnectionGUID: rJdle3PHRced/ECUXWEy0Q==
X-CSE-MsgGUID: 2er4JFzBQtidKL7TVuq50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181066470"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.244.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:01 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 0/7] lib/xe/xe_eudebug: small fixes and improvements
Date: Tue, 14 Oct 2025 12:38:41 +0300
Message-ID: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
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

While we were doing eudebug-v4 and converting tests to new uapi,
encountering newly found out errors and shortcomings led these
small fixups on lib side.

Mika Kuoppala (7):
  lib/xe/xe_eudebug: fortify xe_eudebug_for_each_event
  lib/xe/xe_eudebug: Fix token to str
  lib/xe/xe_eudebug: Improve pipe error messages
  lib/xe/xe_eudebug: Mark client done after log is read
  lib/xe/xe_eudebug: Assert that there is always client work
  lib/xe/xe_eudebug: Allow empty event log
  lib/xe/xe_eudebug: Don't take timeout for debugger stop

 lib/xe/xe_eudebug.c             | 66 ++++++++++++++++++++++++---------
 lib/xe/xe_eudebug.h             | 51 ++++++++++++++++++++++---
 tests/intel/xe_eudebug.c        | 16 ++++----
 tests/intel/xe_eudebug_online.c | 12 +++---
 4 files changed, 108 insertions(+), 37 deletions(-)

-- 
2.43.0

