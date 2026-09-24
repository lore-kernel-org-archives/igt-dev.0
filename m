Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6A5C98310
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B975610F394;
	Thu, 24 Sep 2026 07:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgNgXmII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7EA10F37E
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790236254; x=1821772254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3e2OU49hUusg27+2aqCe7Zs4fN7pXPAvZsbeu1bYP8Y=;
 b=hgNgXmIIMNtqVgtzeEHtrrnBzP2kR8SWIcorzctSBQmOpjlM6ClztsJW
 Cbn7VahSVZL3GkY+r3tMgOhdGXsJXvZhwpf22pm8+q+t+mXNUeHJ1u4C/
 Yo031MMK7PWSGlcnl8nL7bn571O5dpA69enQdWEBwC7z9r1RAfijRVZ7D
 8qgZjeJMPSRPY1zMqOP8u23t/ioKJgI+XrFLj+K2Uqe9/f8ZLOKNfgkAu
 staACzqe2CAWdRM1sjbHHi1WVLHLTwjoM4EcpLl0EDjh8CDPdQye4Iia/
 ivsTRYNnFGThNMYKc3O7H/aVQvVyjbk3CJKD8p9aI/wqEo3nQndXtkpSJ w==;
X-CSE-ConnectionGUID: aOsq8m72RdCK6AWZQQNPaA==
X-CSE-MsgGUID: asBF5DiaQpWtrxx6gb1MNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90119591"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90119591"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:50:53 -0700
X-CSE-ConnectionGUID: 2AqQHnnaTfaAj0CPHoAJiA==
X-CSE-MsgGUID: MW+Kdwh4QSmwtrAMNltzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="311854717"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:50:52 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 juhapekka.heikkila@gmail.com, michal.grzelak@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v6 0/7] tests: limiting suspend tests
Date: Thu, 24 Sep 2026 09:50:12 +0200
Message-ID: <20260924075019.4151374-1-michal.grzelak@linux.intel.com>
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

Next version of [1]. Reviewed part of the series got merged.

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20260910201413.2730574-1-michal.grzelak@intel.com/

Michał Grzelak (7):
  tests/kms_async_flips: split outer test loop into two
  tests/kms_async_flips: limit #crtcs tested during suspend
  tests/kms_vblank: limit #outputs tested during suspend
  tests/intel/kms_ccs: split outer test loop into two
  tests/intel/kms_ccs: limit #outputs tested during suspend
  tests/intel/kms_ccs: limit #crtcs tested during suspend
  tests/kms_hdr: run on 3 outputs when testing suspend

 tests/intel/kms_ccs.c   | 88 +++++++++++++++++++++++++++--------------
 tests/kms_async_flips.c | 68 +++++++++++++++++--------------
 tests/kms_hdr.c         | 30 +++++++++++++-
 tests/kms_vblank.c      | 21 +++++++++-
 4 files changed, 145 insertions(+), 62 deletions(-)

-- 
2.45.2

