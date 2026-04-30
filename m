Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DF3FF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 04:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BB610E08B;
	Thu, 30 Apr 2026 04:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCrbspGq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA1410E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 04:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777522261; x=1809058261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OSXfuGG/7BA3JbkyiH3wTu8G9AIsMBwC7t4tScuqoT4=;
 b=HCrbspGqo35KhoTM/XD1QSoVUjGvZu6+PNitDDBE/ct9KNnhP5t/3jD6
 QgpH7lRmFO8qg4u+mWK+qkL8Hje9PjrqqkmJSIspLye9IplsqBR3vupAR
 CgoEFCFpxH1HJTYnq/aaGxn09nH355ZAgZcwZHCkaKiONKrKEVFlpa+Y1
 2JK7VsTOabcaRR0s92UdhRA8N2i8xHthU5VB5wMdo0/6XADIXtysCeN4h
 fQafrS029LgSgPNtucTUBt/b4n4fCv8FVzQjIzo4At/0QIj9CIlL28aOq
 DLYG7klx8tiuzK8F4yc+Sm32PhTcupdUdOhFiecLmxgI+TqssMOKEzAcl A==;
X-CSE-ConnectionGUID: jVigTbiuQZOcLHA161CYqA==
X-CSE-MsgGUID: H2N5N7idTm+aLVgTm54ecw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77628133"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="77628133"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:11:00 -0700
X-CSE-ConnectionGUID: BR2t2HtXTryCb/de+1VPww==
X-CSE-MsgGUID: Pp0Ky5zVQd6M2sScpUke7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="239450093"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 21:11:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	x.wang@intel.com
Subject: [PATCH v2 0/2] tests/intel/xe_exec_multi_queue: Replace sleep with
 deterministic wait
Date: Wed, 29 Apr 2026 21:10:53 -0700
Message-ID: <20260430041055.1901126-4-niranjana.vishwanathapura@intel.com>
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

In 'priority' subtest, sleep() is used to ensure some submissions have
reached the hardware before we proceed in the test. But sleep duration
is indeterminate. Instead use a more deterministic method to ensure
those submissions have reached the hardware.

v2: Read timestamp to check if queue is started
    Use usleep to ensure all semphore updates are visible to GPU

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  tests/intel/xe_exec_multi_queue: use timestamp to check job start
  tests/intel/xe_exec_multi_queue: replace sleep with barrier queue

 tests/intel/xe_exec_multi_queue.c | 94 ++++++++++++++++++++++++-------
 1 file changed, 73 insertions(+), 21 deletions(-)

-- 
2.43.0

