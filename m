Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Isabella Basso <isabbasso@riseup.net>
To: igt-dev@lists.freedesktop.org
Date: Sun, 28 Aug 2022 21:09:16 -0300
Message-Id: <20220829000920.38185-1-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/4] Add support for KUnit tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kselftest@vger.kernel.org, daniel@ffwll.ch,
 kunit-dev@googlegroups.com, magalilemes00@gmail.com, maira.canal@usp.br,
 dlatypov@google.com, n@nfraprado.net, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 davidgow@google.com, tales.aparecida@gmail.com, skhan@linuxfoundation.org,
 andrealmeid@riseup.net, Isabella Basso <isabbasso@riseup.net>,
 brendanhiggins@google.com, twoerner@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch series was first developed as part of the LKCamp hackathon
that happened last year[1], mainly focusing on refactoring DRM tests to
use KUnit.

KUnit[2][3] is a unified test framework that provides helper tools,
simplifying their development and execution. Using an x86-64 machine
it's possible to run tests in the host's kernel natively using user-mode
Linux[4] (aka UML), which simplifies usage in a wide variety of
scenarios, including integration to CI.

As the tool's adoption widens into graphics testing territory, I and
LKCamp members figured it would be important to support it in IGT, as
it's a core tool for GPU drivers maintainers.

I have then added KUnit support into IGT mainly following the KTAP
specs, and it can be tested using patch 4/4 in this series together with
a DRM selftests patch series available at [5].

Changes since v1:
- Major rework of parsing function structure:
  - It is not longer recursive
  - Adapt kselftests functions and structs to be used with KUnit
- Switch DRM selftests to KUnit parsing as they're updated in the kernel
- Replace AMD KUnit tests by DRM selftests

[1]: https://groups.google.com/g/kunit-dev/c/YqFR1q2uZvk/m/IbvItSfHBAAJ
[2]: https://kunit.dev
[3]: https://docs.kernel.org/dev-tools/kunit/index.html
[4]: http://user-mode-linux.sourceforge.net
[5]: https://lore.kernel.org/all/20220708203052.236290-1-maira.canal@usp.br/

Isabella Basso (4):
  lib/igt_kmod: rename kselftest functions to ktest
  lib/igt_kmod.c: check if module is builtin before attempting to unload
    it
  lib/igt_kmod: add compatibility for KUnit
  tests: DRM selftests: switch to KUnit

 lib/igt_kmod.c       | 315 +++++++++++++++++++++++++++++++++++++++++--
 lib/igt_kmod.h       |  14 +-
 tests/drm_buddy.c    |   7 +-
 tests/drm_mm.c       |   7 +-
 tests/kms_selftest.c |  12 +-
 5 files changed, 329 insertions(+), 26 deletions(-)

-- 
2.37.2
