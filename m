Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0F16E7D3
 for <igt-dev@lists.freedesktop.org>; Fri,  7 May 2021 06:41:10 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Fri,  7 May 2021 11:46:36 +0530
Message-Id: <1620368197-5750-1-git-send-email-jigar.bhatt@intel.com>
Subject: [igt-dev] [i-g-t RFC v1 0/1] test/kmd_hdmi: Test case for new HDMI
 property
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, nischal.varide@intel.com, uma.shankar@intel.com, anshuman.gupta@intel.com, ankit.k.nautiyal@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Nischal Varide <nischal.varide@intel.com>

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
