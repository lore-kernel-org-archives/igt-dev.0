Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Sep 2022 14:04:37 +0200
Message-Id: <20220913120441.146757-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] tests/core_hotunplug: A couple of fixes
 and enhancements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Janusz Krzysztofik (4):
  tests/core_hotunplug: Free mem allocated by igt_audio_driver_unload
  tests/core_hotunplug: Also unload audio before device unplug
  tests/core_hotunplug: Don't apply i915 workarounds on other platforms
  tests/core_hotunplug: Select health checks for initially detected
    chipset

 tests/core_hotunplug.c | 57 +++++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 14 deletions(-)

-- 
2.25.1
