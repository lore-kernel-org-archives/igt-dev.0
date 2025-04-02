Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D26C3601A
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 16:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8918E10E201;
	Wed,  2 Apr 2025 16:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YkUCa/cM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5345910E201
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743610356; x=1775146356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T6RmN67QOoH4ml4TN99LRCaoGPJVS2e4ST/tJMMrkeQ=;
 b=YkUCa/cMJt4PGQgDdUP6U2tU6Oa5cWNot+/+RweF1BCL/mkwn0P1lsmh
 9DL+Bhr2B0cYFqT8KE8eqQ5T0ECUFBdUuI9H7v54p5qElk2nzMLAR74Xz
 N/G33bFRKp1uJwanukm/dTFpmsmwdQJ11OT2KgdTU8kdL0fL+Py0eIEFW
 LGbZrYgEy8OmBG32GjhWBq1KBQJg8UgTuGBuNEG/p5rhQOqqosSFcwcRu
 4Kfm136l1sMnhClE8rsyY9jIsyNUrmvdJ5hU1pqC7iU8tV5MvFdPmo4He
 DsD69wrDqRNA7qj/BRwrs/IUyEGaSpvcaEUDG5IyXPhsMFqJVXmxgbHlB w==;
X-CSE-ConnectionGUID: 188aw0SMRIqLJQAnmldGGg==
X-CSE-MsgGUID: KQFHUh39Qra/+p0PNgGExw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="32594182"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="32594182"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 09:12:14 -0700
X-CSE-ConnectionGUID: VPMNtNNjQpaQEldmfG/o+w==
X-CSE-MsgGUID: UV17FevmQqGzalmsDKqTIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="126503206"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.233])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 09:12:12 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v1 0/2] Block i915/Xe on Xe/i915 runs
Date: Wed,  2 Apr 2025 18:12:04 +0200
Message-ID: <20250402161207.66601-1-kamil.konieczny@linux.intel.com>
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

There was added new generic Intel test intel_sysfs_debugfs
which checks sysfs and debugfs for both i915 and Xe, listing
subtests with:

build/tests/intel_sysfs_debugfs --l

prints (I cited here only first i915/xe):

i915-sysfs-read-all-entries
...
xe-sysfs-read-all-entries
...

Lets block Xe on i915 runs and i915 on Xe runs.

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>

Kamil Konieczny (2):
  intel-ci/i915: Block more Xe tests in i915 runs
  intel-ci/xe: Block more i915 tests in Xe runs

 tests/intel-ci/blacklist.txt    | 1 +
 tests/intel-ci/xe.blocklist.txt | 1 +
 2 files changed, 2 insertions(+)

-- 
2.49.0

