Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1DA6E2D7
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 22:55:27 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue,  2 Mar 2021 14:53:26 -0800
Message-Id: <20210302225334.361966-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 03/11] Add PXP attributes into lib batchbuffer
 and buffer structs
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Eventually when we get to testing PXP rendering capability,
we can reuse lib's rendercopy feature. However to do that,
we need to pass information about PXP-session-enablement
and which buffers are protected.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 lib/intel_batchbuffer.h | 7 +++++++
 lib/intel_bufops.h      | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 76989eaa..3ef9e30d 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -437,6 +437,12 @@ typedef void (*igt_media_spinfunc_t)(int i915,
 igt_media_spinfunc_t igt_get_media_spinfunc(int devid);
 
 
+struct igt_pxp {
+	bool     enabled;
+	int      apptype;
+	uint32_t appid;
+};
+
 /*
  * Batchbuffer without libdrm dependency
  */
@@ -459,6 +465,7 @@ struct intel_bb {
 	bool supports_48b_address;
 
 	uint32_t ctx;
+	struct igt_pxp pxp;
 
 	/* Cache */
 	void *root;
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 8debe7f2..0a272eaa 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -41,6 +41,9 @@ struct intel_buf {
 	uint32_t *ptr;
 	bool cpu_write;
 
+	/* Content Protection*/
+	bool is_protected;
+
 	/* For debugging purposes */
 	char name[INTEL_BUF_NAME_MAXSIZE + 1];
 };
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
