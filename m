Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B61A10E22D
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Dec 2022 20:00:22 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>, Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Dec 2022 16:59:59 -0300
Message-Id: <20221229200001.182755-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 0/2] Tests for V3D/VC4 Mmap BO IOCTLs
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

Currently, the Mmap BO IOCTL is not completely covered by the existing tests:
V3D only tests invalid BO handlers and VC4 doesn't have tests for this IOCTL.
Therefore, create tests for the Mmap BO IOCTL for the V3D and VC4. For both
drivers, the sub-tests will test invalid parameters and also the consistency
of newly mapped BOs.

Best Regards,
- Maíra Canal

---
v1 -> v2:
- Remove comment about coherency (Melissa Wen).

Maíra Canal (2):
  tests/v3d_mmap: Improve tests from V3D's Mmap BO IOCTL
  tests/vc4_mmap: Create test for VC4's Mmap BO IOCTL

 lib/igt_v3d.c             |  2 ++
 lib/igt_vc4.c             |  2 ++
 tests/v3d/v3d_mmap.c      | 33 ++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist |  2 ++
 tests/vc4/meson.build     |  1 +
 tests/vc4/vc4_mmap.c      | 53 +++++++++++++++++++++++++++++++++++++++
 tests/vc4_ci/vc4.testlist |  2 ++
 7 files changed, 95 insertions(+)
 create mode 100644 tests/vc4/vc4_mmap.c

-- 
2.38.1
