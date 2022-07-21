Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B959A10F200
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jul 2022 04:31:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Jul 2022 06:31:24 +0200
Message-Id: <20220721043126.11695-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/2] Add pinned to perf_pmu and remove
 store dword
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

Notice - subject "remove store dword" should be replaced to "add store dword"
but this way patchwork wouldn't group the series.

In short:

1. Add pinned flag for softpin 
2. Add additional store dword for looping condition + debug memory
   state used by semaphore

v3: Add timeout to break the waiting loop for semaphore start
v4: Change assert -> igt_debug (Kamil)

Zbigniew Kempczyński (2):
  tests/i915/perf_pmu: Add softpin flag for no-reloc path
  tests/i915/perf_pmu: Add second store dword for looping

 tests/i915/perf_pmu.c | 43 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 9 deletions(-)

-- 
2.34.1
