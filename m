Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E34C369CE
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 12:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9209110E315;
	Thu, 26 Sep 2024 12:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYCLi5xc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F2610E315
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727353150; x=1758889150;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9APwubI6KpouT7r91kY2ti1NFjxjJB9yYwt/oYWRY7g=;
 b=EYCLi5xcPOYC7IRkQl2BJCYDhuWEkQib65A1s6OKklwK5x3ZnML2T3Mz
 PCnAO4Ax+whzcRWruGA+0mPAQdqZiR1yaI0d6mCKgCbxX9VrgNotOG/n8
 P4AbKvjbxo4nDxpxex7OIYnNrnGsy3IH5KeYuOW8QEBlweAPkGtcpa225
 qlTUTpF3jZ9UbFZbVlf1+LYqPsXOBho9Vny6ozsfB8qC34imK4TOU/qpQ
 CrhxySZZ7nLdN/iNmvBNuqTyfjnYRhbScY9kA84VJ+e1cUtM4tgdMik7W
 r7NZKhqYam3dqBJjIH6/wVaZlP7nn6nmKxyNcKEIEatOdsMabdSc2CC+s A==;
X-CSE-ConnectionGUID: Qp1Az0PYS5+2X6J8IAPlLQ==
X-CSE-MsgGUID: Nc3LzZSGSqyIrEvbmd3lBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="43958763"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="43958763"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 05:19:09 -0700
X-CSE-ConnectionGUID: G09F3zlzRjq8yI4nYcJwyA==
X-CSE-MsgGUID: 4+DUvyoLT+Sh25hF9FDY9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="76956842"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.104])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 05:19:07 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/2] Fix xe_eudebug_online@interrupt-other test
Date: Thu, 26 Sep 2024 14:18:44 +0200
Message-Id: <20240926121846.5885-1-dominik.karol.piatkowski@intel.com>
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

xe_eudebug_online@interrupt-other test fails due to preemption
interfering with it.

In order to fix it, set the preempt_timeout_us for engine_class used in
this test to maximum for the duration of the test.

This series introduces preempt_timeout helpers:
 - xe_eudebug_set_preempt_timeout_to_max
   Sets preempt_timeout_us for given engine_class to maximum.
 - xe_eudebug_restore_preempt_timeout
   Sets preempt_timeout_us for given engine_class to previous value.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (2):
  lib/xe_eudebug: Introduce preempt_timeout helpers
  tests/xe_eudebug_online: Adjust interrupt-other test

 lib/xe/xe_eudebug.c             | 120 ++++++++++++++++++++++++++++++++
 lib/xe/xe_eudebug.h             |   3 +
 tests/intel/xe_eudebug_online.c |  13 +++-
 3 files changed, 135 insertions(+), 1 deletion(-)

-- 
2.34.1

