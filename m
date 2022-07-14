Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F232FA35F0
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jul 2022 08:16:28 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Thu, 14 Jul 2022 13:44:09 +0530
Message-Id: <20220714081409.671724-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220714081409.671724-1-bhanuprakash.modem@intel.com>
References: <20220714081409.671724-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] HAX: Add deep-color tests to BAT
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index bd5538a0..84fadce3 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -99,6 +99,7 @@ igt@kms_chamelium@hdmi-edid-read
 igt@kms_chamelium@hdmi-crc-fast
 igt@kms_chamelium@vga-hpd-fast
 igt@kms_chamelium@vga-edid-read
+igt@kms_color@deep-color
 igt@kms_prop_blob@basic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor
 igt@kms_cursor_legacy@basic-flip-after-cursor
-- 
2.35.1
