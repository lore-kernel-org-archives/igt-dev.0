Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A3210F616
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 12:01:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 May 2022 17:28:02 +0530
Message-Id: <20220531115805.3941871-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 0/3] Skip if current & requested BPC doesn't match
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

Bhanuprakash Modem (3):
  lib/igt_kms: Add helper functions to sort drm modes
  tests/kms_hdr: Skip if current & requested BPC doesn't match
  tests/kms_color: Skip if current & requested BPC doesn't match

 lib/igt_kms.c     | 90 +++++++++++++++++++++++++++++++++++++++--------
 lib/igt_kms.h     | 10 ++++++
 tests/kms_color.c | 35 +++++++++++++++---
 tests/kms_hdr.c   | 51 +++++++++++++++++++++++----
 4 files changed, 160 insertions(+), 26 deletions(-)

--
2.35.1
