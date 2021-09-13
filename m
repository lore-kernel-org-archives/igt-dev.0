Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB326E183
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Sep 2021 12:40:52 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 13 Sep 2021 15:43:57 +0300
Message-Id: <20210913124357.29085-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Block msm tests
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
Cc: Petri Latvala <petri.latvala@intel.com>, Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
---
 tests/intel-ci/blacklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 33f92e37..fa040006 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -91,6 +91,10 @@ igt@amdgpu/.*
 ###############################################
 igt@panfrost_.*
 ###############################################
+# Qualcomm
+###############################################
+igt@msm_.*
+###############################################
 # Hibernate: not configured correctly on CI
 ###############################################
 igt@.*@.*-hibernate
-- 
2.29.2
