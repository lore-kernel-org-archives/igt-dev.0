Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A13C369A1
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 12:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B9F10E039;
	Wed,  9 Apr 2025 12:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNvUgs1j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2B610E039
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 12:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744203358; x=1775739358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KFbaB2ICve1gwoy9tf/m3xNhEUxR/WR4IjbRK6Bo0RQ=;
 b=mNvUgs1j9um80hLzUtlWCEr22n4aIm5a00Z6zw17XHOrMYG5jDqK5ml0
 D2Pbsnvu16dABVKc2xpA3hVBOslexoQcOoZxmGEN9OQeghPCCKsnDKoe4
 hr0Zn5gcNNwentNxxToIWV9yadPrK+1lTQr9eXDla2wkdOYqUleCNyjDW
 dIRhXWWu5FhULd3hzxmMzktjTR6ZgnmiE/DbGdxy2b6ify9M8iw6P7VFw
 0q6DETJmsMvE0pvpm/1QmnTnU/dfE8uHWER0sSjn6AIzl1nrRXuk43CVj
 0VnnHxf2itPN508a3BYzVwhoHuAmqpwYfTzzwR/7q2UrnuLo/lhkJs1T2 Q==;
X-CSE-ConnectionGUID: Y8zyEp4pTUC0l2vie5CROw==
X-CSE-MsgGUID: 7W606RLHR4ygf6279PlIvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="57046633"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="57046633"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 05:55:57 -0700
X-CSE-ConnectionGUID: 1sJxjC3IQOaiQ6qfIlRQWw==
X-CSE-MsgGUID: O5GhINUYSRyB1jLxvDEeMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="133288801"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 05:55:56 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t 0/1] Runner: sync files and dirs after execution
Date: Wed,  9 Apr 2025 14:55:42 +0200
Message-ID: <20250409125543.49920-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

In runs with crashes or reboots some dmesg files collected by
igt_runner are truncated. They are saved in folders NNN/ where NNN
is a number of a test in testlist, started with 0.

If such crash happens then after a reboot one could run igt_result
to recreate valid result.json file. It turns out that few last tests
are marked as incompletes, as their NNN/dmesg.txt files are cut.

Try to remediate this and make additional file and dir sync to disk
just after a test was run. This should help us unless there is a
bug in kernel filesystem code.

For reference these problems could be seen in:

https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8281/shard-dg2-10/igt@gem_ctx_shared@q-smoketest@ccs0.html

https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8271/shard-dg2-435/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>

Kamil Konieczny (1):
  runner/executor: sync outputs after tests end

 runner/executor.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

-- 
2.49.0

