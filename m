Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B8110E36A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 19:58:47 +0000 (UTC)
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 20:58:06 +0100
Message-Id: <20231030195809.3527410-4-bernd@kuhls.net>
In-Reply-To: <20231030195809.3527410-1-bernd@kuhls.net>
References: <20231030195809.3527410-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 4/7] lib/igt_halffloat.c: Fix musl/uclibc build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Stefano Ragni <st3r4g@protonmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Stefano Ragni <st3r4g@protonmail.com>

Original patch was added to void-linux:
https://github.com/void-linux/void-packages/commit/ddfc1f66a0c571b420303c33aed29fd38ace4fc7

Fixes build error:
../lib/igt_halffloat.c:205:6: error: ‘ifunc’ is not supported on this target
  205 | void igt_float_to_half(const float *f, uint16_t *h, unsigned int num)

../lib/igt_halffloat.c:216:6: error: ‘ifunc’ is not supported on this target
  216 | void igt_half_to_float(const uint16_t *h, float *f, unsigned int num)

Bug report with request to split the original patch into some
functional changes:
Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138

Signed-off-by: Stefano Ragni <st3r4g@protonmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: no changes

 lib/igt_halffloat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_halffloat.c b/lib/igt_halffloat.c
index 08ab05fce..5dbe08e01 100644
--- a/lib/igt_halffloat.c
+++ b/lib/igt_halffloat.c
@@ -162,7 +162,7 @@ static inline float _half_to_float(uint16_t val)
 	return fi.f;
 }
 
-#if defined(__x86_64__) && !defined(__clang__)
+#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && !defined(__UCLIBC__)
 #pragma GCC push_options
 #pragma GCC target("f16c")
 
-- 
2.39.2
