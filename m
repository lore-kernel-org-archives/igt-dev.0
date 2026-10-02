Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ABECA5FDD
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 20:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0743410E693;
	Fri,  2 Oct 2026 20:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvDnaFRs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB15110E693
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 20:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790972215; x=1822508215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/PyHzLton0n/SfeFwSWSscY6feQWrUSzekke9t8JJQU=;
 b=HvDnaFRssQRu/umKEem5/KcLDQeFQqOe1v2nWUJFXZbCaxUkXDV6N6RU
 y3xLFf9y+nifZOtbM/DQY72qM1MT5nDbcDTDhN+frLx5c6SaJJp73EnrD
 IREA0Kk5+l3tMPv8IwdCC7XpbzWrlmzb4l7p4PgZaDYqK4qH/HFa+NcXj
 fDuFV8TAlg8CT8YblIaUUQKgGdqJOrCgQJL/3PYlV74ebNrcuvLcAOOe3
 t77ZJmf4+kBZVp3o622KfDkEgXIXDH9Zsr3MtYdr3PHSKoEtOkghN2xxa
 lO2Ss8rDyXN5zWd12/yFyB18he/sfpVib28VZE+vBdqWVw1in8dXZxecv A==;
X-CSE-ConnectionGUID: rKbYdQY4TuSGHl5BTGf+Qw==
X-CSE-MsgGUID: rwFwjXjYSSSKdcotD8Vkww==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90877937"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="90877937"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 13:16:54 -0700
X-CSE-ConnectionGUID: 19fyPfI2Qkivm1+vAC4LuA==
X-CSE-MsgGUID: npCVUngNTwyEGIykyBHo7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="407070"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 13:16:52 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 juhapekka.heikkila@gmail.com, jani.nikula@intel.com,
 michal.grzelak@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 0/7] tests: limiting suspend tests
Date: Fri,  2 Oct 2026 22:15:18 +0200
Message-ID: <20261002201525.466080-1-michal.grzelak@linux.intel.com>
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

[1] https://lore.kernel.org/igt-dev/20260924075019.4151374-1-michal.grzelak@linux.intel.com/

Michał Grzelak (7):
  tests/kms_async_flips: split outer test loop into two
  tests/kms_async_flips: limit #pipes tested during suspend
  tests/kms_vblank: limit #outputs tested during suspend
  tests/intel/kms_ccs: split outer test loop into two
  tests/intel/kms_ccs: limit #outputs tested during suspend
  tests/intel/kms_ccs: limit #pipes tested during suspend
  tests/kms_hdr: run on 3 outputs when testing suspend

 tests/intel/kms_ccs.c   | 86 +++++++++++++++++++++++++++--------------
 tests/kms_async_flips.c | 68 ++++++++++++++++++--------------
 tests/kms_hdr.c         | 30 +++++++++++++-
 tests/kms_vblank.c      | 21 +++++++++-
 4 files changed, 143 insertions(+), 62 deletions(-)

-- 
2.45.2

