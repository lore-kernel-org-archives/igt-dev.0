Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1453113AC2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 04:13:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Jul 2022 06:13:23 +0200
Message-Id: <20220726041325.12948-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/2] Add pinned to perf_pmu and remove
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

Notice - subject "remove store dword" should be replaced to "change
store dword" but this way patchwork wouldn't group the series.

In short:

1. Add pinned flag for softpin 
2. Change semaphore wait condition as well as it is unblocked on cpu write
   to mmaped semaphore address

v3: Add timeout to break the waiting loop for semaphore start
v4: Change assert -> igt_debug (Kamil)
v5: Change neq->eq + unblock on cpu (Chris)

Zbigniew Kempczyński (2):
  tests/i915/perf_pmu: Add softpin flag for no-reloc path
  tests/i915/perf_pmu: Avoid unordered sampling with SEMA_WAIT

 tests/i915/perf_pmu.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

-- 
2.34.1
