Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7074F10E082
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 09:00:18 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Date: Mon, 12 Jun 2023 14:29:46 +0530
Message-Id: <20230612085948.12130-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Integrate igt_spin_new with Xe
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Extending the spin_create implementation and allocator handle support in xe,
where it submits dummy work loads to engine. This Implementation is wrapped
around vm_bind and unbind as we are supposed to do it manually for xe.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (2):
  lib/xe/xe_spin: Integrate igt_spin_new with Xe
  tests/xe/xe_spin_batch: Add new test to exercise igt_spin_new for xe

 lib/igt_dummyload.c      |  38 +++++++--
 lib/igt_dummyload.h      |  11 +++
 lib/xe/xe_spin.c         |  96 +++++++++++++++++++++
 lib/xe/xe_spin.h         |   6 +-
 tests/meson.build        |   1 +
 tests/xe/xe_spin_batch.c | 180 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 326 insertions(+), 6 deletions(-)
 create mode 100644 tests/xe/xe_spin_batch.c

-- 
2.39.1
