Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC4D10E8DF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:54:50 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:18 +0000
Message-Id: <20231109155410.7-6-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 05/57] drm-uapi/xe: Document
 DRM_XE_DEVICE_QUERY_HWCONFIG
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

Align with commit ("Document DRM_XE_DEVICE_QUERY_HWCONFIG")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index d3ce6aa1d..e6878b688 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -557,6 +557,11 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
 #define DRM_XE_DEVICE_QUERY_GT_LIST		3
+	/*
+	 * Query type to retrieve the hardware configuration of the device
+	 * such as information on slices, memory, caches, and so on. It is
+	 * provided as a table of attributes (key / value).
+	 */
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
-- 
2.34.1
