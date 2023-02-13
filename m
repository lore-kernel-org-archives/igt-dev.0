Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Feb 2023 10:31:31 +0100
Message-Id: <20230213093132.12763-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/1] tests/i915/perf: Add stress / race
 exercises
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Users reported oopses on list corruptions when using i915 perf with a
number of concurrently running graphics applications.  That indicates we
are currently missing some important tests for such scenarios.  Cover
that gap.

v3: locate the new subtest in a new tests, intedned for exercising
    intentionally racy barrier tasks list processing,
  - fixes and optimizations (see the patch changelog for details).
v2: drop open-race subtest for now, not capable of triggering the user
    reported bug, but triggering other bugs which I can't see any fixes
    for queued yet,
  - move the other new subtest out of tests/i915/perf.c (Ashutosh).

Janusz Krzysztofik (1):
  tests: Exercise remote request vs barrier handling race

 tests/i915/gem_barrier_race.c | 159 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   8 ++
 2 files changed, 167 insertions(+)
 create mode 100644 tests/i915/gem_barrier_race.c

-- 
2.25.1
