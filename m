Return-Path: <dri-devel-bounces@lists.freedesktop.org>
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [RFC PATCH 0/1] drm: selftest: Convert to KUnit
Date: Wed, 10 Nov 2021 21:34:52 -0300
Message-Id: <20211111003453.209115-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins <brendanhiggins@google.com>, Daniel Latypov <dlatypov@google.com>, David Gow <davidgow@google.com>, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@fooishbar.org, igt-dev@lists.freedesktop.org, leandro.ribeiro@collabora.com, n@nfraprado.net, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ~lkcamp/discussion@lists.sr.ht, isabbasso@riseup.net, maira.canal@usp.br, arthur.grillo@usp.br, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

This RFC is a preview of the progress we made in the KUnit hackathon[0].
This patch, made by Maíra and Arthur, converts the damage helper test
from the original DRM selftest framework to use the KUnit framework.

[0] https://groups.google.com/g/kunit-dev/c/YqFR1q2uZvk/m/IbvItSfHBAAJ

The IGT part of this work can be found here:
https://gitlab.freedesktop.org/isinyaaa/igt-gpu-tools/-/tree/introduce-kunit

We also have patches in progress converting the following tests:
framebuffer, cmdline_parser, dp_mst_helper, rect and dma-buf. As soon as
we sort out if this is the right way to proceed in both kernel and IGT
side, the hackathon participants will submit them.

Below, a dmesg output followed by the IGT output of the damage helper
test.

Thanks!

[   32.502165] [IGT] kms_kunit: executing
[   32.896062]     # Subtest: drm_damage_helper_tests
[   32.896115]     1..21
[   32.906500]     ok 1 - igt_damage_iter_no_damage
[   32.907957]     ok 2 - igt_damage_iter_no_damage_fractional_src
[   32.922087]     ok 3 - igt_damage_iter_no_damage_src_moved
[   32.926174]     ok 4 - igt_damage_iter_no_damage_fractional_src_moved
[   32.931746]     ok 5 - igt_damage_iter_no_damage_not_visible
[   32.935329]     ok 6 - igt_damage_iter_no_damage_no_crtc
[   32.939826]     ok 7 - igt_damage_iter_no_damage_no_fb
[   32.942118]     ok 8 - igt_damage_iter_simple_damage
[   32.944158]     ok 9 - igt_damage_iter_single_damage
[   32.945583]     ok 10 - igt_damage_iter_single_damage_intersect_src
[   32.946565]     ok 11 - igt_damage_iter_single_damage_outside_src
[   32.949206]     ok 12 - igt_damage_iter_single_damage_fractional_src
[   32.952464]     ok 13 - igt_damage_iter_single_damage_intersect_fractional_src
[   32.954321]     ok 14 - igt_damage_iter_single_damage_outside_fractional_src
[   32.957147]     ok 15 - igt_damage_iter_single_damage_src_moved
[   32.959162]     ok 16 - igt_damage_iter_single_damage_fractional_src_moved
[   32.961100]     ok 17 - igt_damage_iter_damage
[   32.963609]     ok 18 - igt_damage_iter_damage_one_intersect
[   32.964913]     ok 19 - igt_damage_iter_damage_one_outside
[   32.966389]     ok 20 - igt_damage_iter_damage_src_moved
[   32.968279]     ok 21 - igt_damage_iter_damage_not_visible
[   32.971710] # drm_damage_helper_tests: pass:21 fail:0 skip:0 total:21
[   32.973887] # Totals: pass:21 fail:0 skip:0 total:21
[   32.975511] ok 1 - drm_damage_helper_tests
[   33.051033] [IGT] kms_kunit: exiting, ret=0

IGT-Version: 1.26-g71e8eceb (x86_64) (Linux: 5.15.0-rc7amd-fix+ x86_64)
[IGT] running 21 tests...
[IGT] SUBTEST ok 1 - igt_damage_iter_no_damage
[IGT] SUBTEST ok 2 - igt_damage_iter_no_damage_fractional_src
[IGT] SUBTEST ok 3 - igt_damage_iter_no_damage_src_moved
[IGT] SUBTEST ok 4 - igt_damage_iter_no_damage_fractional_src_moved
[IGT] SUBTEST ok 5 - igt_damage_iter_no_damage_not_visible
[IGT] SUBTEST ok 6 - igt_damage_iter_no_damage_no_crtc
[IGT] SUBTEST ok 7 - igt_damage_iter_no_damage_no_fb
[IGT] SUBTEST ok 8 - igt_damage_iter_simple_damage
[IGT] SUBTEST ok 9 - igt_damage_iter_single_damage
[IGT] SUBTEST ok 10 - igt_damage_iter_single_damage_intersect_src
[IGT] SUBTEST ok 11 - igt_damage_iter_single_damage_outside_src
[IGT] SUBTEST ok 12 - igt_damage_iter_single_damage_fractional_src
[IGT] SUBTEST ok 13 - igt_damage_iter_single_damage_intersect_fractional_src
[IGT] SUBTEST ok 14 - igt_damage_iter_single_damage_outside_fractional_src
[IGT] SUBTEST ok 15 - igt_damage_iter_single_damage_src_moved
[IGT] SUBTEST ok 16 - igt_damage_iter_single_damage_fractional_src_moved
[IGT] SUBTEST ok 17 - igt_damage_iter_damage
[IGT] SUBTEST ok 18 - igt_damage_iter_damage_one_intersect
[IGT] SUBTEST ok 19 - igt_damage_iter_damage_one_outside
[IGT] SUBTEST ok 20 - igt_damage_iter_damage_src_moved
[IGT] SUBTEST ok 21 - igt_damage_iter_damage_not_visible
[IGT] TEST SUCCEEDED ok 1 - drm_damage_helper_tests
SUCCESS (0.465s) 

Maíra Canal (1):
  drm: selftest: convert drm_damage_helper selftest to KUnit

 drivers/gpu/drm/Kconfig                       |  13 ++
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/selftests/Makefile            |   5 +-
 .../gpu/drm/selftests/drm_modeset_selftests.h |  21 --
 .../drm/selftests/test-drm_damage_helper.c    | 215 +++++++++---------
 5 files changed, 127 insertions(+), 129 deletions(-)

-- 
2.33.1
