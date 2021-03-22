Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AAC6E5B0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 20:41:33 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so9178519pjb.0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 13:41:33 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 22 Mar 2021 15:41:17 -0500
Message-Id: <20210322204123.3331055-4-jason@jlekstrand.net>
In-Reply-To: <20210322204123.3331055-1-jason@jlekstrand.net>
References: <20210319223233.2982842-1-jason@jlekstrand.net>
 <20210322204123.3331055-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/9] tests/i915/gem_exec_endless: Stop
 setting the ring size
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

I915_CONTEXT_PARAM_RINGSIZE is being removed from upstream i915 because
it's never been used by any userspace other than IGT.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 tests/i915/gem_exec_endless.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
index 1b320d4c..a3e2fa49 100644
--- a/tests/i915/gem_exec_endless.c
+++ b/tests/i915/gem_exec_endless.c
@@ -67,16 +67,6 @@ static unsigned int offset_in_page(void *addr)
 static uint32_t __supervisor_create_context(int i915,
 					    const struct intel_execution_engine2 *e)
 {
-	struct drm_i915_gem_context_create_ext_setparam p_ring = {
-		{
-			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
-			.next_extension = 0
-		},
-		{
-			.param = I915_CONTEXT_PARAM_RINGSIZE,
-			.value = 4096,
-		},
-	};
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 2) = {
 		.engines = {
 			{ e->class, e->instance },
@@ -86,7 +76,7 @@ static uint32_t __supervisor_create_context(int i915,
 	struct drm_i915_gem_context_create_ext_setparam p_engines = {
 		{
 			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
-			.next_extension = to_user_pointer(&p_ring)
+			.next_extension = 0,
 		},
 		{
 			.param = I915_CONTEXT_PARAM_ENGINES,
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
