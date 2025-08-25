Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48723CA0FE7
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 16:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB06210E4F7;
	Mon, 25 Aug 2025 16:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUIaEO+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF2610E4F7
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756137604; x=1787673604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Czfsqg9oF/hq1mnUOlIxFv9BlNGS515UkF/XNZN4QT4=;
 b=VUIaEO+NNATjdAkhBD0P5QtwB8UnyHFd7/k/kBVTYGgyIjmqg7iWQFbo
 KRJQ7FiUqNy6FQOKQmb9IqIyCs9VMqkatYUnAP8pWPFnGyPxedC+4MxZu
 C9qFZ2MBTe6vTiTVkpMGO2g6C3GnHBnpKMaccsX8mE7PPm0qsdSafR1d6
 I63jzhMh0eawLjjKvUBykQtwvSexGq3quvnNk6NGHBsos48eTGxCK0dC9
 ZOd08kz1g1/CWlKWaR5aH61TsO698scH2G1Fmx74FHlpyYF/g/wnfuMYD
 eSsFohhNuDahiluWEWXY+0Ehj6yOzQY6PwoMtF0RI5e7v4VDAmtZSq4po A==;
X-CSE-ConnectionGUID: rAWvCd5DTk6FY33nSlLFNA==
X-CSE-MsgGUID: 2yj1rldNSxCxH/CEEA9ovg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68948328"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68948328"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:00:04 -0700
X-CSE-ConnectionGUID: SIiP9jxeSkeKJM8Lz9Lnrg==
X-CSE-MsgGUID: o8YBGwQMToGIF4t0eN8QFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168578236"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:00:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t v2 0/4] tests/intel/xe_configfs: Unbind before tests
Date: Mon, 25 Aug 2025 08:59:42 -0700
Message-ID: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250819-configfs-unbind-e7e839ac7e68
X-Mailer: b4 0.15-dev-b03c7
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

Some refactors/fixes and preparation for configfs returning -EBUSY when
device is already bound.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v2:
- Use drm_close_driver()
- Fix a few typos and improve commit messages
- Link to v1: https://lore.kernel.org/r/20250819-configfs-unbind-v1-0-8359e66e3241@intel.com
---
Lucas De Marchi (4):
      tests/intel/xe_configfs: Do not execute with open fd
      tests/intel/xe_configfs: Unbind before testing engines_allowed
      tests/intel/xe_configfs: Install exit handler once
      tests/intel/xe_configfs: Reset all custom settings on exit

 tests/intel/xe_configfs.c | 54 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 15 deletions(-)

base-commit: 7d64f83f6d40ca187e9f317007c03db9d8b34ffb
change-id: 20250819-configfs-unbind-e7e839ac7e68

Lucas De Marchi

