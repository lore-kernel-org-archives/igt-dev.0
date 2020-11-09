Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFBA899C4
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 12:10:37 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  9 Nov 2020 11:54:10 +0000
Message-Id: <20201109115410.249678-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201107111544.65260-1-chris@chris-wilson.co.uk>
References: <20201107111544.65260-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_psr: Check for available
 modesetting support
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Check that there is a valid output/mode combo before trying to
dereference them.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2212
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/kms_psr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_psr.c b/tests/kms_psr.c
index af81a259b..4b7513d7e 100644
--- a/tests/kms_psr.c
+++ b/tests/kms_psr.c
@@ -411,8 +411,14 @@ static void setup_test_plane(data_t *data, int test_plane)
 
 static void test_setup(data_t *data)
 {
+	igt_require_f(data->output,
+		      "No available output found\n");
+	igt_require_f(data->mode,
+		      "No available mode found on %s\n",
+		      data->output->name);
 	if (data->op_psr_mode == PSR_MODE_2)
 		igt_require(data->supports_psr2);
+
 	psr_enable_if_enabled(data);
 	setup_test_plane(data, data->test_plane_id);
 	igt_assert(psr_wait_entry_if_enabled(data));
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
