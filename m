Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C23211BEAC
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 18:28:19 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 7 Jul 2022 14:28:08 -0400
Message-ID: <20220707182811.3805-4-vitaly.prosyak@amd.com>
In-Reply-To: <20220707182811.3805-1-vitaly.prosyak@amd.com>
References: <20220707182811.3805-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 4/7] lib/amdgpu: add simple buf management to emit
 commands
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, marek.olsak@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

There is no binding yet between ASIC reg and buffer
management. We are going to add based on the next tests.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 87 ++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h | 19 +++++++++
 2 files changed, 106 insertions(+)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 89b19e39..795eb198 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -406,9 +406,96 @@ get_ip_block(amdgpu_device_handle device, enum amd_ip_block_type type)
 	return NULL;
 }
 
+static int
+cmd_allocate_buf(struct amdgpu_cmd_base  *base, uint32_t size_dw)
+{
+	if (size_dw > base->max_dw) {
+		if (base->buf) {
+			free(base->buf);
+			base->buf = NULL;
+			base->max_dw = 0;
+			base->cdw = 0;
+		}
+		base->buf = calloc(4, size_dw);
+		if (!base->buf)
+			return -1;
+		base->max_dw = size_dw;
+		base->cdw = 0;
+	}
+	return 0;
+}
+
+static int
+cmd_attach_buf(struct amdgpu_cmd_base  *base, void *ptr, uint32_t size_bytes)
+{
+	if (base->buf && base->is_assigned_buf)
+		return -1;
 
+	if (base->buf) {
+		free(base->buf);
+		base->buf = NULL;
+		base->max_dw = 0;
+		base->cdw = 0;
+	}
+	assert(ptr != NULL);
+	base->buf = (uint32_t *)ptr;
+	base->max_dw = size_bytes>>2;
+	base->cdw = 0;
+	base->is_assigned_buf = true; /* allocated externally , no free */
+	return 0;
+}
 
+static void
+cmd_emit(struct amdgpu_cmd_base  *base, uint32_t value)
+{
+	assert(base->cdw <  base->max_dw  );
+	base->buf[base->cdw++] = value;
+}
 
+static void
+cmd_emit_buf(struct amdgpu_cmd_base  *base, const void *ptr, uint32_t offset_bytes, uint32_t size_bytes)
+{
+	/* we assume that caller knows what is doing and we loose the buffer current index */
+	/* we may do this later abstract the internal index */
+	assert(base->cdw + ((offset_bytes + size_bytes)>>2) <  base->max_dw  );
+	memcpy(base->buf + offset_bytes , ptr, size_bytes);
+}
+
+struct amdgpu_cmd_base *
+get_cmd_base(void)
+{
+	struct amdgpu_cmd_base *base = calloc(1 ,sizeof(*base));
+
+	base->cdw = 0;
+	base->max_dw = 0;
+	base->buf = NULL;
+	base->is_assigned_buf = false;
+
+	base->allocate_buf = cmd_allocate_buf;
+	base->attach_buf = cmd_attach_buf;
+	base->emit = cmd_emit;
+	base->emit_buf = cmd_emit_buf;
+
+	return base;
+}
+
+void
+free_cmd_base(struct amdgpu_cmd_base * base)
+{
+	if (base) {
+		if (base->buf && base->is_assigned_buf == false)
+			free(base->buf);
+		free(base);
+	}
+
+}
+
+void
+append_cmd_base(struct amdgpu_cmd_base *base, uint32_t mask, uint32_t cmd)
+{
+	while(base->cdw & mask)
+		base->emit(base, cmd);
+}
 
 /*
  * GFX: 8.x
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index c16ad179..83809efe 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -112,5 +112,24 @@ setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_info *a
 const struct amdgpu_ip_block_version *
 get_ip_block(amdgpu_device_handle device, enum amd_ip_block_type type);
 
+struct amdgpu_cmd_base {
+	uint32_t cdw;  /* Number of used dwords. */
+	uint32_t max_dw; /* Maximum number of dwords. */
+	uint32_t *buf; /* The base pointer of the chunk. */
+	bool is_assigned_buf;
+
+	/* functions */
+	int (*allocate_buf)(struct amdgpu_cmd_base  *base, uint32_t size);
+	int (*attach_buf)(struct amdgpu_cmd_base  *base, void *ptr, uint32_t size_bytes);
+	void (*emit)(struct amdgpu_cmd_base  *base, uint32_t value);
+	void (*emit_buf)(struct amdgpu_cmd_base  *base, const void *ptr, uint32_t offset_bytes, uint32_t size_bytes);
+};
+
+struct amdgpu_cmd_base* get_cmd_base(void);
+
+void free_cmd_base(struct amdgpu_cmd_base *base);
+
+void
+append_cmd_base(struct amdgpu_cmd_base *base, uint32_t mask, uint32_t cmd);
 
 #endif
-- 
2.25.1
