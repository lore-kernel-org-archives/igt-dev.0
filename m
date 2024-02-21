Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66251C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 10:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA6510E6DB;
	Wed, 21 Feb 2024 10:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fH8CJkZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F6110E6D9
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 10:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708511377; x=1740047377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LmSV8mVoEZTg0rhKEZPB9l7KcZf8px4+IPHc8QGOokQ=;
 b=fH8CJkZvIhR7QJPZSrcYNS0wuJKTQU9kW1qa+unzvFZWHliHxNTWd2Zg
 aGcWV7W9B3RYpJoqT61Bi00TyqXvYCJncw6kbdv1s6+UFZngxKc3AnHuP
 uTCPMxmLAJdP3t07cM1DCNrQpataNTzL3J/87crJD5SjuTnjCGa1WTUNA
 IzTH5DRAbaMu85JXz3sskwKCyKXtAwFW5XMoejdZk4KqLrjiA9pREDmfp
 UwI6ZOUduCYUCQ1Img+hatcS0Yjuie3L2OPNKnD651qukhd6Jew++IHVS
 1wvIMfo+uSQ+pIRLTro9J4clUEHK6F755wGnL2MjrIfQ/482vuAIz9SW7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2531739"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2531739"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5470785"
Received: from unknown (HELO localhost) ([10.246.5.230])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:29:34 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Helen Koike <helen.koike@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Rob Clark <robdclark@chromium.org>
Subject: [PATCH i-g-t v2 0/3] print info in core_getversion
Date: Wed, 21 Feb 2024 11:29:26 +0100
Message-ID: <20240221102930.21473-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

Reorganize core_getversion test, make it a basic subtest which
prints info from ioctl. Add also multigpu subtest for all drm
cards.

v2: add define for number of opened devices (Helen Koike)

Cc: Helen Koike <helen.koike@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Rob Clark <robdclark@chromium.org>

Kamil Konieczny (3):
  tests/core_getversion: convert to subtest
  tests/core_getversion: print version info
  tests/core_getversion: test all drm devices

 tests/core_getversion.c | 53 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 6 deletions(-)

-- 
2.42.0

