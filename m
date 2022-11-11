Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEA310E7C0
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 09:12:31 +0000 (UTC)
From: Alaa Emad <aemad@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Nov 2022 10:29:23 +0200
Message-Id: <cover.1668154709.git.aemad@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH RFC i-g-t 0/8] tests/kms_universal_plane: divide
 `functional_test_pipe` to mini-subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Divide the `functional_test_pipe` test into seven subtests based on CRC
comparisons because this will make it easier to debug the test and help
in detecting the failure.

First 7 patches decouple each subtest and run it individually keeping
`functional_test_pipe' test as it is. After making sure that each
subtest can run individually with the expected result on both vkms and i915
drivers, improve the test by creating `run_functional_test_pipe` and
call all subtests from it and call `run_functional_test_pipe` in
`igt_main`.


Alaa Emad (8):
  tests/kms_universal_plane: decouple verification of legacy and atomic
    api
  tests/kms_universal_plane: decouple verification of disabling primary
    plane
  tests/kms_universal_plane: decouple verification of re-enabling
    primary plane
  tests/kms_universal_plane: decouple verification of setup plane FB's
    while CRTC is disabled
  tests/kms_universal_plane: decouple verification of ablity to modeset
    with the primary plane off
  tests/kms_universal_plane: decouple verification of ablity to move the
    primary plane completely offscreen
  tests/kms_universal_plane: decouple verification of ablity to
    explicitly disable an already implicitly-disabled primary plane
  tests/kms_universal_plane: create the run_functional_test_pipe and
    call all tests from it

 tests/kms_universal_plane.c | 416 ++++++++++++++++++++++--------------
 1 file changed, 261 insertions(+), 155 deletions(-)

-- 
2.34.1
