Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CC710FAD9
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jul 2022 05:11:54 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 19 Jul 2022 07:11:39 +0200
Message-Id: <20220719051144.7438-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/5] Add codename in device selection
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

Most important in this series is codename + discrete/integrated 
device selectors. Device simulation is far away from being perfect
and I won't insist for merging it - it was written to check some
artificial multi-gpu setups.
v2-v4: addressing review comments (Kamil)
v5:    removing simulation patch as it is not upstream ready

Zbigniew Kempczyński (5):
  lib/igt_device_scan: Migrate pci assignment
  lib/igt_device_scan: Introduce codename for platform selection
  tools/lsgpu: Add codename switch (-c)
  lib/igt_device_scan: Align microseconds to six leading zeros
  lib/igt_device_scan: Add discrete/integrated pseudo-codenames

 lib/igt_device_scan.c | 174 ++++++++++++++++++++++++++++++++++++++----
 lib/igt_device_scan.h |   1 +
 tools/lsgpu.c         |   8 +-
 3 files changed, 166 insertions(+), 17 deletions(-)

-- 
2.34.1
