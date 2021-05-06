Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016026E1D6
 for <igt-dev@lists.freedesktop.org>; Fri,  7 May 2021 05:23:04 +0000 (UTC)
From: Nischal Varide <nischal.varide@intel.com>
Date: Fri,  7 May 2021 04:00:24 +0530
Message-Id: <20210506223025.14181-1-nischal.varide@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t RFC v1 0/1] test/kmd_hdmi: Test case for new HDMI
 property
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, nischal.varide@intel.com, uma.shankar@intel.com, ankit.k.nautiyal@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

A new HDMI vendor product info property is added by driver to make
vendor and product info programmable by user. This IGT test is added
to validate the same.

We need to check the new property name in dmesg after running the
"kms_hdmi" test case. Also we need to set the log level as below 
"echo 0x1e > /sys/module/drm/parameters/debug".

Nischal Varide (1):
  test/kmd_hdmi: Test case for new HDMI property

 Makefile          |  32 ++++++++++
 lib/igt_kms.c     |   5 ++
 lib/igt_kms.h     |   1 +
 tests/kms_hdmi.c  | 150 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build |   1 +
 5 files changed, 189 insertions(+)
 create mode 100644 Makefile
 create mode 100644 tests/kms_hdmi.c

-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
