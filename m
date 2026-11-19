Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459C0606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oeo45Pqf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C54112082;
	Thu, 19 Nov 2026 08:08:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A4F11203E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795075666; x=1826611666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BQBhcqVKp5FMEKg0T/nKMa/ibcN4o5/WMhRFs1iZGJE=;
 b=Oeo45Pqf5XZnFW3xDGInKcJZ2xd2EqJ8bWGNOyYm7jkJe9LWjdr+uOZE
 h3f1l89AJrt0lJA5a+QO7LkpC8BaygohdjjXoZPws3fUAqPjNHq80Lg9k
 G+xyTCyjlnORvawmmJWaxk+puElfvOKKWd8k46M9mif1jXsPMyta+ncv4
 qk9TSvlqV9r7Ql/TiNzyHPDTpMbt9GHe5FJ0uFbNJ+8lSBtJrpDjtg5Eb
 EZtPf9DaA12COJTBEdBuReNYbKsdVFeAgXlEMlrN7CKaYmzk0oPotlM3/
 8D2YFAOOa3ovbd1HeoPACUoG7V5QbnM6E9jRYwGaEmVQyMv9FaaMlVyFy Q==;
X-CSE-ConnectionGUID: xIkyiBz2SqC2TLw49MU0QQ==
X-CSE-MsgGUID: slI4nKATSMq1DTHINDg1ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3766952"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3766952"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 00:07:46 -0800
X-CSE-ConnectionGUID: xItrr64KRxC19gIFcq33uA==
X-CSE-MsgGUID: G6afI7RhTQCr1zDTBndwBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10616884"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2026 00:07:45 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_exec_atomic: Fix bind/exec ordering
 and a queue leak
Date: Thu, 19 Nov 2026 00:07:08 -0800
Message-ID: <20261119080722.525281-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two small fixes for basic_inst() in xe_exec_atomic.

Patch 1 makes the exec wait for the VM bind. The bind runs on a separate
bind exec queue and both the bind and the exec only signal one shared
syncobj, so the exec can run before the BO is mapped and fault. Use two
syncobjs so the exec waits on the bind and signals its own completion.

Patch 2 destroys the bind exec queue, which leaked once per dynamic
subtest.

Shuicheng Lin (2):
  tests/intel/xe_exec_atomic: Wait for the bind before the exec
  tests/intel/xe_exec_atomic: Destroy the bind exec queue

 tests/intel/xe_exec_atomic.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

-- 
2.43.0

