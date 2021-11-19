Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81E16ECE7
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Nov 2021 15:54:45 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Fri, 19 Nov 2021 10:53:43 -0500
Message-ID: <20211119155344.2709274-2-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211119155344.2709274-1-Rodrigo.Siqueira@amd.com>
References: <20211119155344.2709274-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 1/2] amdgpu/amd_abm: Double convergence
 timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, harry.wentland@amd.com, Nicholas.Choi@amd.com, markyacoub@chromium.org
Cc: Roman Li <roman.li@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Roman Li <roman.li@amd.com>

[Why]
With ABM 2.3 the transition time from one abm level to another
increased thus with the current timeout 15 the tests failed.

[How]
Change convergence timeout from 15 to 30

Signed-off-by: Roman Li <roman.li@amd.com>
---
 tests/amdgpu/amd_abm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 0505f17e..69c34882 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -265,7 +265,7 @@ static void abm_enabled(data_t *data)
 static void abm_gradual(data_t *data)
 {
 	int ret, i;
-	int convergence_delay = 15;
+	int convergence_delay = 30;
 	int prev_pwm, pwm, curr;
 	int max_brightness;
 
-- 
2.25.1
