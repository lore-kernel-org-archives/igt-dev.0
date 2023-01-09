Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3411010E1C8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 13:42:50 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 19:10:46 +0530
Message-Id: <20230109134046.85340-7-nidhi1.gupta@intel.com>
In-Reply-To: <20230109134046.85340-1-nidhi1.gupta@intel.com>
References: <20230109134046.85340-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/6] tests/kms_async_flips: Restrict the
 execution of the subtest to single pipe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To reduce the overall execution time of the test, now
all the subtests will be executed on single pipe instead
of all the pipes.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_async_flips.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 7cb71f6b..80ddc8e5 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -554,6 +554,8 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			if (!data->extended)
 				break;
 		}
+		/*Restrict the execution of the subtest to single pipe*/
+		break;
 	}
 }
 
-- 
2.25.1
