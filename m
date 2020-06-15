Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFCC89DA4
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2020 10:25:29 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 15 Jun 2020 13:25:16 +0300
Message-Id: <20200615102516.7376-2-petri.latvala@intel.com>
In-Reply-To: <20200615102516.7376-1-petri.latvala@intel.com>
References: <20200615102516.7376-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] gitlab-ci: Verify blacklist files with
 verify-blacklist.sh
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---

Now finished in 47 seconds in gitlab.


 .gitlab-ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c5a6bd9e..d7fdbfde 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -252,6 +252,12 @@ test:list-undocumented-tests:
     paths:
       - undocumented_tests.txt
 
+test:verify-blacklists:
+  dependencies:
+    - build:tests-fedora
+  stage: test
+  script: for bl in tests/intel-ci/blacklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
+
 ################### DEPLOY #########################
 
 pages:
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
