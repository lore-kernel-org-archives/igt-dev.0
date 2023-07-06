Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0DF10E414
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 06:06:38 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 08:05:48 +0200
Message-Id: <20230706060555.282757-10-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230706060555.282757-1-zbigniew.kempczynski@intel.com>
References: <20230706060555.282757-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 09/16] lib/intel_allocator: Add field to
 distinquish underlying driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Cache what driver is using on drm fd to avoid calling same code
in allocator functions.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator.c | 1 +
 lib/intel_allocator.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index be24f8f2d0..228b33b92f 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -318,6 +318,7 @@ static struct intel_allocator *intel_allocator_create(int fd,
 
 	igt_assert(ial);
 
+	ial->driver = get_intel_driver(fd);
 	ial->type = allocator_type;
 	ial->strategy = allocator_strategy;
 	ial->default_alignment = default_alignment;
diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index 3ec74f6191..1001b21b98 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -141,6 +141,9 @@ struct intel_allocator {
 	/* allocator's private structure */
 	void *priv;
 
+	/* driver - i915 or Xe */
+	enum intel_driver driver;
+
 	void (*get_address_range)(struct intel_allocator *ial,
 				  uint64_t *startp, uint64_t *endp);
 	uint64_t (*alloc)(struct intel_allocator *ial, uint32_t handle,
-- 
2.34.1
