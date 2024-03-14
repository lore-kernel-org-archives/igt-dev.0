Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1EAC54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 10:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A054610FA47;
	Thu, 14 Mar 2024 10:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFo2WrD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CD210FA35
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710412222; x=1741948222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=1ImgFIeH4NBMVIS5rDvaet3C1BrcBNESrzyi+Insqd0=;
 b=oFo2WrD0LqyY8K8dMkIppnZprvsl8nvikWN6taric4a7M5RAoGE2Gz0U
 rLB8IPHzTQ7lRm4p8rQBNCcZKwaA52V8UI4fYRHhbUGlbHPObWPqGMHts
 7jq4o7rWysCJKKXggrKftND5E+NUZcvNJX60Z+2HPG7lcR0YeNJXrGCYc
 EsM6PFEka8eoFa15xz6I7KP53uq30v3DHhuGwZMvWP+ah5D1zYu6Zp2TN
 YFLrWPtElhooDm8cFD3wvrMomyQ0yRYBPBDnvLxu9yfLoV1x70gY9xLHH
 eCPoyVSGOxyGmGVGBh5GxehD/VLG5HeHZp5hc02Bb8T8Br/4LdOvVs29a Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5345264"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5345264"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="43171333"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:20 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 13FB1580E13;
 Thu, 14 Mar 2024 03:30:20 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkiLq-00000004uVP-0cZp; Thu, 14 Mar 2024 11:30:18 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 00/10] More improvements to scripts/xls_to_doc.py
Date: Thu, 14 Mar 2024 11:29:09 +0100
Message-ID: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

Fix a series of bugs on it, and add an option to simplify the
common tags at the processed files.

Mauro Carvalho Chehab (10):
  scripts/xls_to_doc.py: make the message about wildcards clearer
  scripts/xls_to_doc.py: don't ignore the last column
  scripts/xls_to_doc.py: be clearer when ignoring a value in verbose
    mode
  scripts/xls_to_doc.py: detect field removal
  scripts/xls_to_doc.py: improve the addition logic
  scripts/xls_to_doc.py: preserve line for found fields
  scripts/xls_to_doc.py: don't duplicate a common field
  scripts/xls_to_doc.py: reduce verbosity for writing message
  scripts/xls_to_doc.py: better handle common attributes
  scripts/xls_to_doc.py: add a logic to simplify tags

 scripts/xls_to_doc.py | 201 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 172 insertions(+), 29 deletions(-)

-- 
2.43.2

