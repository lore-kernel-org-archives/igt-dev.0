Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1457D10F74F
 for <igt-dev@lists.freedesktop.org>; Tue, 24 May 2022 12:07:21 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Tue, 24 May 2022 14:07:15 +0200
Message-Id: <20220524120717.748348-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Fix snd unload for i915_selftest
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

There's a problem with the snd audio driver unload that seems to
happen only on i915_selftest, because there, it tries to unload the
i915 driver before starting a subtest.

Patch 2 fix it.

While here, I added patch 1, which will print a backtrace in the event
of internal_assert to be called, as this helps to debug such kind of
issues.

Mauro Carvalho Chehab (2):
  lib/igt_core: use print_backtrace() on internal_assert()
  lib/igt_aux: fix kselftest module unload

 lib/igt_aux.c  |  10 ++--
 lib/igt_core.c | 124 +++++++++++++++++++++++++------------------------
 2 files changed, 69 insertions(+), 65 deletions(-)

-- 
2.36.1
