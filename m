Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A6F10E083
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Nov 2022 13:44:47 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  6 Nov 2022 19:14:36 +0530
Message-Id: <20221106134438.2831320-1-anshuman.gupta@intel.com>
In-Reply-To: <20221102115851.2223804-2-anshuman.gupta@intel.com>
References: <20221102115851.2223804-2-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] test/i915_pm_rpm: Verify bridge
 binds with pcieport driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

test/i915_pm_rpm: Verify bridge binds with pcieport driver

Anshuman Gupta (2):
  test/i915_pm_rpm: cache pci_device
  test/i915_pm_rpm: Verify bridge binds with pcieport driver

 tests/i915/i915_pm_rpm.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.25.1
