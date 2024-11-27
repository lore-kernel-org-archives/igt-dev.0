Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598F2D609C4
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 09:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103B610E179;
	Wed, 27 Nov 2024 09:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bP/BEydj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1118F10E179
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 09:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732700738; x=1764236738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cShiqXCZT1QG4rUnJE/17JGl2YqQ/qLVVgs35k1ivrE=;
 b=bP/BEydjeaCH2/2NbcOI3ZlsaZXfDwZ5P7tw1AofHfjRtB2Dvwhogx9I
 fiHfpUJd5sqA5tma4bEzuWlv3LJNUk8UIn0TcaOIql6lkS/vdZN+hRuJb
 VFJHxji7pra1gFJgJAsNYL5W8/0/WibtVeSsPpafrVZLAG58Pes3LThek
 dQLDWkF8VxN417tQ9/XBjZ9TPS4/QBg/OC14v5OY+PyZma7L5e0nx4ihH
 q2yzOhCjr8/obLGJMes/+cuHzx0Wr+jA7555nwDX+x/l8Tz2lM3tgdAJG
 Dnvn5yC417vjuOrREfUUwgy9Ikx9J4zdGl0oG2XmgHdKUTy1A76whbqG+ w==;
X-CSE-ConnectionGUID: s0aPAkaPQ4KXHRkjRFB1MQ==
X-CSE-MsgGUID: xNDJ6GycQtW40jZpzkpyPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43556092"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="43556092"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 01:45:38 -0800
X-CSE-ConnectionGUID: ZFlNj2pDTbmgIogBojbGAQ==
X-CSE-MsgGUID: ZORjWqhDTLqduvJvJKW+rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="91983980"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 01:45:36 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v3 0/2] tests/intel/gem_ctx_persistence: Wait for
 context termination
Date: Wed, 27 Nov 2024 10:45:26 +0100
Message-ID: <20241127094528.7041-1-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

In some of the subtests, there is a race condition - if a non-persistent
context is not terminated by the driver before the associated spinner is
ended and probed for status, the status will be incorrectly reported as
completed.

Add a sleep instruction before the assert to give the kernel time to
clean up.

v3:
 - Update blocklist for XE in the HAX patch to make the test actually
   run.

v2:
 - Update the patch description,
 - Change the previous expression to a simpler usleep(),
 - Add a usleep() call in test_saturated_hostile_all(), as this behavior
   is also shown in this subtest.

Krzysztof Niemiec (2):
  HAX/DO_NOT_MERGE: Wait for context termination
  tests/intel/gem_ctx_persistence: Wait for context termination

 tests/intel-ci/fast-feedback.testlist    | 4 ++++
 tests/intel-ci/xe-fast-feedback.testlist | 4 ++++
 tests/intel-ci/xe.blocklist.txt          | 1 -
 tests/intel/gem_ctx_persistence.c        | 6 ++++++
 4 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.45.2

