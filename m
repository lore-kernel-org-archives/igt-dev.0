Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C5410E0D2
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 13:01:43 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Mon,  3 Apr 2023 10:01:20 -0300
Message-Id: <20230403130124.15946-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] kms_rotation_crc improvements and
 generalization
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patchset introduces some improvements and generalizes the kms_rotation_crc
test. Currently, I'm working on the rotation property of the vkms driver [1]
and while working on it, I noticed that some subtests could be added and some
subtests could be more generic.

The first and second patches make the tests more generic. Currently, some
subtests use i915 modifiers, which make the subtest fail for other vendors
that are not Intel. Therefore, check if the device is i915 before using the
i915-specific modifiers.

The third patch expands the subtest "sprite-rotation-90-pos-100-0" by testing
all 90, 180 and 270 degrees rotation with x and y offsets. This can helps us
to assure that 90, 180 and 270 degrees rotation happens correctly even with
offsets.

Finally, add generic tests for reflect-x and reflect-y. Currently, there are
no tests for reflection values. So, add some generic reflection tests to
ensure that these properties are working correctly. Note that these subtests
must skip on i915 devices, as i915 uses reflect-x together with specific
modifiers.

[1] https://gitlab.freedesktop.org/mairacanal/linux/-/commits/vkms/rotation

Best Regards,
- Maíra Canal

Maíra Canal (4):
  tests/kms_rotation_crc: make the subtest "bad-pixel-format" i915-specific
  tests/kms_rotation_crc: use DRM_FORMAT_MOD_LINEAR as default modifier
  tests/kms_rotation_crc: add tests for a rotated plane in a given position
  tests/kms_rotation_crc: create generic reflection tests

 tests/kms_rotation_crc.c | 69 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 62 insertions(+), 7 deletions(-)

-- 
2.39.2
