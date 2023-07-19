Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D4610E3F5
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jul 2023 07:05:28 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Jul 2023 12:39:38 +0530
Message-Id: <20230719070939.562159-3-kunal1.joshi@intel.com>
In-Reply-To: <20230719070939.562159-1-kunal1.joshi@intel.com>
References: <20230719070939.562159-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/3] tests/intel-ci: Added psr config blacklist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

blacklist for non psr config

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/psr.blacklist | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tests/intel-ci/psr.blacklist

diff --git a/tests/intel-ci/psr.blacklist b/tests/intel-ci/psr.blacklist
new file mode 100644
index 000000000..8356a92f7
--- /dev/null
+++ b/tests/intel-ci/psr.blacklist
@@ -0,0 +1 @@
+igt@.*psr.*
-- 
2.25.1
