Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3821D10E10F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 13:58:07 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Sep 2022 19:27:38 +0530
Message-Id: <20220915135739.3542117-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] clear igt_devs.devs_scanned in
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

Riana Tauro (1):
  lib/igt_device_scan: clear igt_devs.devs_scanned in igt_devices_free

 lib/igt_device_scan.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.25.1
