Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 22 Jun 2020 18:44:07 +0200
Message-Id: <20200622164415.30352-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t v2 0/8] tests/core_hotunplug: New
 subtests and enhancements
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add a bunch of new test variants, enhance debugging of hotunplug driver
issues.

v2: rebase on upstream

Janusz Krzysztofik (8):
  tests/core_hotunplug: Duplicate debug messages in dmesg
  tests/core_hotunplug: Use PCI device sysfs entry, not DRM
  tests/core_hotunplug: Add unbind-unplug-rescan variant
  tests/core_hotunplug: Add 'lateclose before recover' variants
  tests/core_hotunplug: Add 'GEM address space' variant
  tests/core_hotunplug: Add 'GEM object' variant
  tests/core_hotunplug: Add 'PRIME handle' variant
  tests/core_hotunplug: Add 'GEM batch' variant

 tests/core_hotunplug.c | 330 +++++++++++++++++++++++++++++++++++------
 1 file changed, 283 insertions(+), 47 deletions(-)

-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
