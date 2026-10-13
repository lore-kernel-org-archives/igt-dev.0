Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1149FCC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 16:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFC510E51D;
	Tue, 13 Oct 2026 16:11:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E01E10E51D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791907854; x=1823443854;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+iOqsE9PYQwH39xpVqBGgBfAmOD+JRX37/1/kwXgj5c=;
 b=IdhAMNHX84nLZB7fs6GpCxNeRv/fdbmbUx3/ukAVcm4t+AqRli7oFUgY
 LYsoJWGocqk6FSnth+8nW/1O3MM5pfUEu/xNcI7FHUGILzzTy3qovDqu6
 WXyHWGelBYx/esz8GFfx8wLE8Xez/scI2+sFhRztpCyG+P7rLgVBb9ERY
 ySU916k1aSgR4GWuY9Mv46XWSpXIVml4uCoj8RjQcg85TD5KqXzSH+pvB
 5qJnXmsrOBT3vOBbhxsR00JccsSPqaFM69APpZBfw90dnJb7vT2BEH9dB
 JgqYnoTXl/D0w4nCdXpNTmjF7WfidvyZfGNxfUFMhz8ChVZrrtrR0sGiH g==;
X-CSE-ConnectionGUID: tbQfEQC3RVyNVSFfFP87MQ==
X-CSE-MsgGUID: 8HVb+AvlRMCNBg1VXmWtEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="656290"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="656290"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:10:52 -0700
X-CSE-ConnectionGUID: ZXaslbuuQBapMqN2aO3dRg==
X-CSE-MsgGUID: ceBzihk2TMiuFj/D6XfNHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1096295"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:10:50 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v8 0/9] tests: limiting suspend tests
Date: Tue, 13 Oct 2026 18:10:04 +0200
Message-ID: <20261013161013.1364753-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of [1].

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20261002201525.466080-1-michal.grzelak@linux.intel.com/

---
Changelog:

v7->v8
- use pipe mask (Jani)
- add 2 new patches

Michał Grzelak (9):
  tests/kms_async_flips: split outer test loop into two
  tests/kms_async_flips: set mask for available hardware pipes
  tests/kms_async_flips: limit #pipes tested during suspend
  tests/kms_vblank: limit #outputs tested during suspend
  tests/intel/kms_ccs: split outer test loop into two
  tests/intel/kms_ccs: limit #outputs tested during suspend
  tests/intel/kms_ccs: set mask for available hardware pipes
  tests/intel/kms_ccs: limit #pipes tested during suspend
  tests/kms_hdr: run on 3 outputs when testing suspend

 tests/intel/kms_ccs.c   | 115 ++++++++++++++++++++++++++++++----------
 tests/kms_async_flips.c | 100 +++++++++++++++++++++++-----------
 tests/kms_hdr.c         |  30 ++++++++++-
 tests/kms_vblank.c      |  21 +++++++-
 4 files changed, 203 insertions(+), 63 deletions(-)

-- 
2.45.2

