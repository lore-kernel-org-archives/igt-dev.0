Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF81C10E208
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jul 2023 07:46:05 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 17 Jul 2023 13:20:03 +0530
Message-Id: <20230717075005.390330-8-kunal1.joshi@intel.com>
In-Reply-To: <20230717075005.390330-1-kunal1.joshi@intel.com>
References: <20230717075005.390330-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 7/9] tests/intel-ci: Added 4x config blacklist
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

blacklist for non 4x config

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/4x.blacklist | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tests/intel-ci/4x.blacklist

diff --git a/tests/intel-ci/4x.blacklist b/tests/intel-ci/4x.blacklist
new file mode 100644
index 000000000..d066e87c9
--- /dev/null
+++ b/tests/intel-ci/4x.blacklist
@@ -0,0 +1 @@
+igt@kms_.*4x.*
-- 
2.25.1
