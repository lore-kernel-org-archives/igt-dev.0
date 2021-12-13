Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Mon, 13 Dec 2021 15:29:09 -0800
Message-Id: <20211213232914.2523139-7-John.C.Harrison@Intel.com>
In-Reply-To: <20211213232914.2523139-1-John.C.Harrison@Intel.com>
References: <20211213232914.2523139-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/11] tests/i915/i915_hangman: Use the
 correct context in hangcheck_unterminated
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The hangman framework sets up a context that is valid for all engines
and has things like banning disabled. The 'unterminated' test then
ignores it and uses the default context. Fix that.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/i915/i915_hangman.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 2dd4e1e9f..b77705206 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -347,6 +347,7 @@ static void hangcheck_unterminated(const intel_ctx_t *ctx)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = (uintptr_t)&gem_exec;
 	execbuf.buffer_count = 1;
+	execbuf.rsvd1 = ctx->id;
 
 	gem_execbuf(device, &execbuf);
 	if (gem_wait(device, handle, &timeout_ns) != 0) {
-- 
2.25.1
