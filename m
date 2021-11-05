Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C3B6E112
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Nov 2021 10:55:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri,  5 Nov 2021 12:54:13 +0200
Message-Id: <20211105105413.23998-2-petri.latvala@intel.com>
In-Reply-To: <20211105105413.23998-1-petri.latvala@intel.com>
References: <20211105105413.23998-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX: Run igt@fbdev@pan in BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index fa5006d2..f5b34b59 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -173,3 +173,4 @@ igt@i915_pm_rpm@module-reload
 # Kernel selftests
 igt@i915_selftest@live
 igt@dmabuf@all
+igt@fbdev@pan
-- 
2.29.2
