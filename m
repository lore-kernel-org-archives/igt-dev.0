Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F83710E0EF
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 06:46:29 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.1.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 25CA6580BA1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 23:46:28 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q2RDV-00C6og-2E
 for igt-dev@lists.freedesktop.org; Fri, 26 May 2023 08:46:25 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 26 May 2023 08:46:22 +0200
Message-Id: <20230526064624.2886063-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Enable documentation check for i915
 driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Don't let documentation to be out of sync with test changes for
i915.

The first patch contains a change on some subtsts at i915/perf_pmu
that happened after the patches adding documentation to i915.

After fixing it, we can now enable the check at build time.

Mauro Carvalho Chehab (2):
  i915/perf_pmu: sync documentation with latest changes
  testplan/meson.build: make it check for missing i915 documentation

 docs/testplan/meson.build | 4 ++--
 tests/i915/perf_pmu.c     | 8 +-------
 2 files changed, 3 insertions(+), 9 deletions(-)

-- 
2.40.1
