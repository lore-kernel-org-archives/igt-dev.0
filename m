Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AA610E533
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 05:39:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 May 2022 11:06:21 +0530
Message-Id: <20220531053625.3886441-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 0/4] Skip if current & requested BPC doesn't match
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

The "max bpc" property only ensures that the bpc will not go beyond
the value set through this property. It does not guarantee that the
same bpc will be used for the given mode.

If clock/bandwidth constraints permit, the max bpc will be used to
show the mode, otherwise the bpc will be reduced. So, if we really
want a particular bpc set, we can try reducing the resolution, till
we get the bpc that we set in max bpc property.

So, skip the test, if there is no valid resolution to get the same
bpc as set by max_bpc property.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Bhanuprakash Modem (4):
  lib/igt_kms: Add helper functions to sort drm modes
  tests/kms_hdr: Skip if current & requested BPC doesn't match
  tests/kms_color: Skip if current & requested BPC doesn't match
  HAX: Add hdr & deep color tests to BAT

 lib/igt_kms.c                         | 55 +++++++++++++++++++--------
 lib/igt_kms.h                         | 10 +++++
 tests/intel-ci/fast-feedback.testlist |  7 ++++
 tests/kms_color.c                     | 29 ++++++++++++--
 tests/kms_hdr.c                       | 55 ++++++++++++++++++++++++---
 5 files changed, 131 insertions(+), 25 deletions(-)

--
2.35.1
