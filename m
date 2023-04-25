Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Tue, 25 Apr 2023 13:19:26 -0700
Message-Id: <20230425201926.99086-3-John.C.Harrison@Intel.com>
In-Reply-To: <20230425201926.99086-1-John.C.Harrison@Intel.com>
References: <20230425201926.99086-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t 2/2] tools/intel_error_decode: Correctly
 name the GuC CT buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The buffer decoding code doesn't cope well with unknown buffers. So
add an entry for the GuC CTB so that it gets decoded correctly.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tools/intel_error_decode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/intel_error_decode.c b/tools/intel_error_decode.c
index 99680bedc785..451608826be3 100644
--- a/tools/intel_error_decode.c
+++ b/tools/intel_error_decode.c
@@ -617,6 +617,7 @@ read_data_file(FILE *file)
 				{ "user", "user", 0 },
 				{ "semaphores", "semaphores", 0 },
 				{ "guc log buffer", "GuC log", 0 },
+				{ "guc ct buffer", "GuC CTB", 0 },
 				{ },
 			}, *b;
 			char *new_ring_name;
-- 
2.39.1


