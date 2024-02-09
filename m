Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC8DC4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 12:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A355610F38F;
	Fri,  9 Feb 2024 12:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESFqqgq0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292BB10F38C
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707482148; x=1739018148;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=iwRivzZoRejq50RoAw1r61KDkiwqAQnXqBw6i5w1Nds=;
 b=ESFqqgq0HzrvjedYmTQXTuJSGhM2YNTRUhlKtHGwA0EvMsq1g6A7P1f8
 OZrEq02q51riOraD8wZMTYvIzzZcPBgJbV/TlsY1aS2tQmA3gqVbGWOyd
 eiPqrqpO5IyrA0NGmg178wXo5jI//ZP/wWvWWWNytRKT16MbhO92Qkmfi
 crjlYlCN/pAUx5sxmX7Dz7Py0bMH/s0tH9Vyh29YBm6L114qkX5igeZrc
 cbzuCRPPgMt8dqiZknqjQSDBrgauTiu7COC01oS5xTIJD9HR0nV6eNoAf
 Pz+8/NfJM9ZjwxFK7//KMQmwG4/5Bv8U/DjCEiiNBcUM4na9hwNUiDEJ4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1554271"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1554271"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="39363243"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 04:35:48 -0800
Received: from linux.intel.com (unknown [10.245.246.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 151965808A1
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 04:35:47 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYQ6a-00000001DFx-4Bc6 for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 13:35:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 0/8] Fix several issues when producing Intel CI
 testlists
Date: Fri,  9 Feb 2024 13:34:39 +0100
Message-ID: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Handling test lists and block lists is not trivial: it requires a
complex logic to handle all nuances.

This series fix a series of bugs that were making such lists
unreliable.

While here, also fix a small typo at scripts/test_list.py.

---

v3: rebase again. No changes.
v2: rebase on the top of current upstream. No changes.

Mauro Carvalho Chehab (8):
  scripts/test_list.py: fix a typo on default-if-not-excluded
  scripts/igt_doc.py: better handle issues with empty testlists
  scripts/igt_doc.py: handle empty run_type
  scripts/igt_doc.py: only create dict if subtest will be added
  scripts/igt_doc.py: better handle default gpu
  scripts/igt_doc.py: remove some unused logic
  scripts/igt_doc.py: simplify and cleanup tests_per_list logic
  scripts/igt_doc.py: use an ancillary function to simplify the code

 scripts/igt_doc.py   | 130 +++++++++++++++++++++++++------------------
 scripts/test_list.py |   2 +-
 2 files changed, 78 insertions(+), 54 deletions(-)

-- 
2.43.0

