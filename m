Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6B66EA9D
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 14:40:11 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 19 Oct 2021 17:38:35 +0300
Message-Id: <20211019143835.23125-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Stop executing kms_bw
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
Cc: Petri Latvala <petri.latvala@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Swati Sharma <swati2.sharma@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

kms_bw has problems running on i915. Block it until it gets fixed.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/blacklist.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index fa040006..ca361fde 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -123,3 +123,6 @@ igt@core_hotunplug@.*(hot|plug).*
 
 # hangs several gens of hosts, and has no immediate fix
 igt@device_reset@reset-bound
+
+# not working for i915
+igt@kms_bw@.*
-- 
2.29.2
