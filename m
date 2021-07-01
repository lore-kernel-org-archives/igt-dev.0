Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50F16E9C3
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jul 2021 04:12:14 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  1 Jul 2021 09:31:15 +0530
Message-Id: <20210701040115.20186-2-venkata.sai.patnana@intel.com>
In-Reply-To: <20210701040115.20186-1-venkata.sai.patnana@intel.com>
References: <20210630152841.10527-1-venkata.sai.patnana@intel.com>
 <20210701040115.20186-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX remove kms_rotatation_crc from
 premerge blacklistHAX remove kms_rotatation_crc from premerge blacklist
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/intel-ci/blacklist-pre-merge.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
index 115474d987..710cf8c8c4 100644
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -17,7 +17,7 @@
 #
 # Data acquired on 2020-02-19 by Martin Peres
 ###############################################################################
-igt@kms_rotation_crc@.*
+#igt@kms_rotation_crc@.*
 
 
 ###############################################################################
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
