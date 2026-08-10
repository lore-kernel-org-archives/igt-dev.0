Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3121C5AD7B
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 09:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3403C10E76E;
	Mon, 10 Aug 2026 09:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+vnnNeq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16D710E76E
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786354798; x=1817890798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hx2SIbuCfmL5CYkX/2UFTykR9wfGqFSJsTTIvciwnx4=;
 b=I+vnnNeqN1wn8YAATLU1SJhwH/HRTOD1kthtCngIR483RJkWTzLHZeJH
 I/tLRiGDwYKzlgEB1UgWm8h80jr//sztJ3WBoRPdjfKkmms2ZixU/kho8
 U5TnCOwEOMMYYrr6Lvq+bREGaWQkN8TDpA1boKbmJVyDreMQ+e7iXAsK0
 B1Cb332oEYQBTW1FuoNAGlMloyJEVyhIiZlZFc8WjHR391VhMiInDK3oo
 IZ9rcc9Cgh2GZjkJ4j2uiTCYXNZqtWYXyIPAtz5lOjW/3yRKKxwSx06lh
 e9BYQ740yfPyslvvOrPijC/KdXJZB/UagVe6lxMsa2JLROx29rIxpXUO6 g==;
X-CSE-ConnectionGUID: aYt9Eo0jTKW+NqE5McSriQ==
X-CSE-MsgGUID: d7+CNor6SB6+h3XCzdLssQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="104256439"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="104256439"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 02:39:58 -0700
X-CSE-ConnectionGUID: yUtxYTX4RR2vXFZ7PRQPpg==
X-CSE-MsgGUID: kYEJ9C/fQjeT2fkEsCQjhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="266487654"
Received: from unknown (HELO localhost) ([10.94.249.102])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 02:39:56 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com, tvrtko.ursulin@igalia.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 0/2] benchmarks/gem_wsim: explicit VM create/assign +
 LR mode
Date: Mon, 10 Aug 2026 11:39:48 +0200
Message-ID: <20260810093950.1696330-1-marcin.bernatowicz@linux.intel.com>
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

This series extends gem_wsim VM (Virtual Memory) management for Xe.

Patch 1 adds explicit VM (Virtual Memory) create/assign steps in
workload descriptors: V.N to create VM N and v.N.M to bind context
M to VM N.

Patch 2 adds c.N to enable compute/LR mode on selected VMs.
README is updated with syntax and VM usage examples.

Changes since v1:
- Clarify that VM means Virtual Memory (to avoid confusion with
  Virtual Machine). No code behavior changes; description/documentation
  text only. (Kamil, Adam)

Marcin Bernatowicz (2):
  benchmarks/gem_wsim: add explicit VM create/assign steps
  benchmarks/gem_wsim: add compute/LR mode support for Xe VMs

 benchmarks/gem_wsim.c  | 310 ++++++++++++++++++++++++++++++++++++-----
 benchmarks/wsim/README |  32 +++++
 2 files changed, 311 insertions(+), 31 deletions(-)

-- 
2.43.0

