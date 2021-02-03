Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750041.outbound.protection.outlook.com [40.107.75.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627FE6EBAA
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Feb 2021 20:56:35 +0000 (UTC)
From: Sung Joon Kim <sungkim@amd.com>
Date: Wed,  3 Feb 2021 15:56:04 -0500
Message-Id: <20210203205604.24494-3-sungkim@amd.com>
In-Reply-To: <20210203205604.24494-1-sungkim@amd.com>
References: <20210203205604.24494-1-sungkim@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 3/3] HAX remove rotation tests from blacklist
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

Signed-off-by: Sung Joon Kim <sungkim@amd.com>
---
 tests/intel-ci/blacklist-pre-merge.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
index cddb77c1..ba4478f5 100644
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -17,7 +17,6 @@
 #
 # Data acquired on 2020-02-19 by Martin Peres
 ###############################################################################
-igt@kms_rotation_crc@.*
 
 
 ###############################################################################
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
