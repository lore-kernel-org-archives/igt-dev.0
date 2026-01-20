Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C786D2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 10:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3293D10E023;
	Tue, 20 Jan 2026 10:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qj6d7KgX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5CC10E023
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 10:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768906487; x=1800442487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dyxFuvacUJaEOIIw5QMGlMw85Ko1mlxqX+Or+CF4wwI=;
 b=Qj6d7KgXE6a6AG8W6bEa8ZWPMO8CIv9BMWVh23Ecm1bW3M2kUfJ1kKbL
 MtSBgcyHm9cIQ35p7kviZtL+xHGFelrhHwoV1/HNWeajVe72mqK3dtrdc
 pc3EdgxueMNmqYcjIRdzsy/lqX8DIVfoqSIh138fOwdPEphVlA4lOSg8W
 ab6+nAWY72j21Kv4mjYhJw/9bu43J5GpBPI1TnuHlMAmUmFEE3QZgp5km
 5u2UioLwu3M/mXEZZY9pAwUeXrrm4OJnuW2O2MLsiKd2nyHq8i5oHOLjm
 Fd+WmrslEzREwyegnKrU1osz+aKRbDEhXP2fNa76Ay9XeLX69HibK16eL g==;
X-CSE-ConnectionGUID: roqM/QyoThOhB7Noyfy6pg==
X-CSE-MsgGUID: PDXVtm5PTvWD/kCa4h3cgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70163560"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70163560"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:54:46 -0800
X-CSE-ConnectionGUID: Pieyy6V7Qzanb+bVjAz6nA==
X-CSE-MsgGUID: BNG+OAogRuONXzCpJSmGNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210940229"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 02:54:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 0/3] lib/igt_kms: pipe vs CRTC index cleanups
Date: Tue, 20 Jan 2026 12:54:34 +0200
Message-ID: <cover.1768906414.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Some minor cleanups for pipe vs. CRTC index conversions.

Jani Nikula (3):
  lib/igt_kms: Always return CRTC index from
    kmstest_get_pipe_from_crtc_id()
  lib/igt_kms: Drop the ioctl fallback for CRTC id to pipe mapping
  lib/igt_kms: Remove kmstest_pipe_to_index()

 lib/igt_kms.c               | 75 +++++++++----------------------------
 lib/igt_kms.h               |  3 +-
 tests/intel/kms_fbcon_fbt.c |  2 +-
 tests/kms_async_flips.c     |  6 +--
 tests/kms_setmode.c         |  4 +-
 5 files changed, 24 insertions(+), 66 deletions(-)

-- 
2.47.3

