Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 20 Jul 2020 14:18:53 +0200
Message-Id: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATH i-g-t 00/15] tests/core_hotunplug: Fixes and
 enhancements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Since the test is still blocklisted due to driver issues and won't be
executed on CI, I'm providing a link where results obtained from a 
rybot run with the test removed from the blocklist can be found:
https://patchwork.freedesktop.org/series/79662/
Failures reported there come from driver and not test issues, I
believe.

Thanks,
Janusz

Janusz Krzysztofik (15):
  tests/core_hotunplug: Use igt_assert_fd()
  tests/core_hotunplug: Constify dev_bus_addr string
  tests/core_hotunplug: Consolidate duplicated debug messages
  tests/core_hotunplug: Assert successful device filter application
  tests/core_hotunplug: Fix missing newline
  tests/core_hotunplug: Maintain a single data structure instance
  tests/core_hotunplug: Pass errors via a data structure field
  tests/core_hotunplug: Handle device close errors
  tests/core_hotunplug: Prepare invariant data once per test run
  tests/core_hotunplug: Skip selectively on sysfs close errors
  tests/core_hotunplug: Follow failed subtests with health checks
  tests/core_hotunplug: Fail subtests on device close errors
  tests/core_hotunplug: Process return values of sysfs operations
  tests/core_hotunplug: Assert expected device presence/absence
  tests/core_hotunplug: Explicitly ignore unused return values

 tests/core_hotunplug.c | 333 +++++++++++++++++++++++++----------------
 1 file changed, 202 insertions(+), 131 deletions(-)

-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
