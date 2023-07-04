Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E948810E2BB
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 09:01:33 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Jul 2023 11:00:58 +0200
Message-Id: <20230704090104.120219-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
References: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/12] lib/intel_allocator: Add field to
 distinct underlying driver
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
index 8161221dbf..c98c410b3b 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -318,6 +318,7 @@ static struct intel_allocator *intel_allocator_create(int fd,
 
 	igt_assert(ial);
 
+	ial->driver = get_intel_driver(fd);
 	ial->type = allocator_type;
 	ial->strategy = allocator_strategy;
 	ial->default_alignment = default_alignment;
diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index a6bf573e9d..ed3a78485d 100644
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
