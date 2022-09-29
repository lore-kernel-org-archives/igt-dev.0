Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95C810E388
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 04:51:02 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Sep 2022 10:20:57 +0530
Message-Id: <20220929045058.1163003-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/1] clear igt_devs.devs_scanned in
 igt_devices_free
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

igt_devices_scan returns with empty list if devs_scanned
is true and function is called after igt_devices_free

clear igt_devs.devs_scanned in igt_devices_free.

Rev2: optimize code in igt_devices_scan

Riana Tauro (1):
  lib/igt_device_scan: clear igt_devs.devs_scanned in igt_devices_free

 lib/igt_device_scan.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

-- 
2.25.1
