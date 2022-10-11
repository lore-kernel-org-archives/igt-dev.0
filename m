Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0130610E55C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 05:34:49 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Oct 2022 11:04:17 +0530
Message-Id: <20221011053418.1684877-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/1] clear igt_devs.devs_scanned in
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

Remove redundant code from igt_devices_scan

Rev2: optimized code in igt_devices_scan
Rev3: updated commit message

Riana Tauro (1):
  lib/igt_device_scan: clear igt_devs.devs_scanned in igt_devices_free

 lib/igt_device_scan.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

-- 
2.25.1
