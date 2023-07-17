Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5E110E1F8
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jul 2023 07:46:04 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 17 Jul 2023 13:20:02 +0530
Message-Id: <20230717075005.390330-7-kunal1.joshi@intel.com>
In-Reply-To: <20230717075005.390330-1-kunal1.joshi@intel.com>
References: <20230717075005.390330-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 6/9] tests/intel-ci: Added 3x config blacklist
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

blacklist for non 3x config

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/3x.blacklist | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tests/intel-ci/3x.blacklist

diff --git a/tests/intel-ci/3x.blacklist b/tests/intel-ci/3x.blacklist
new file mode 100644
index 000000000..10ee6d9a7
--- /dev/null
+++ b/tests/intel-ci/3x.blacklist
@@ -0,0 +1 @@
+igt@kms_.*3x.*
-- 
2.25.1
