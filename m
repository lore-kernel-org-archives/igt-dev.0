Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7782BC47DDF
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jan 2024 15:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C8010FBE7;
	Fri, 26 Jan 2024 15:51:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E06710FBC6
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2024 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706284308; x=1737820308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0HGxTYYjx5fkPEwPlH4LOIWF6BDRBhmpfBLERrDndG8=;
 b=YsZOURepoXeoB2jprE0QEhprE+22TG4RBjqUYLo7cO7WqxP4V/vWK3u/
 z20AzK1HIARQjSsX01lYNNhz6jz8hFhN2v1NgsR0GBdOve3ofHV9/UdqN
 WQsoPxbUo2Do43yAGwOlLEKn13uDK4+eCCILT0zvcg+hiWImHvY49hTJL
 eSWDVdGqv0CiZADb/3NRFyv+g+NQv56urbFog9Mh9u2IGJ4S7ZIubIo4J
 pye28ZS/SRbc0lp5vH0R3zR99Uj6ckdXSw4G0PTgPjg/wbhcsRUIa8HsY
 sqtWFXwKJkOQJbIMk1WWyYpYFmJXyail4W8jWU/tmdtQ/9GD5RRbv5uhu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9251727"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9251727"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 07:51:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877425469"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877425469"
Received: from mmensche-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.57.201])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 07:51:45 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/xe/xe_query: Print L3 bank and node masks
Date: Fri, 26 Jan 2024 15:51:29 +0000
Message-Id: <20240126155129.6-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

L3 bank and node masks have been added to the uAPI, so print them in
the topology query test. This aligns to kernel commit ("drm/xe: Add
L3 bank and node masks to topology query").

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 2 ++
 tests/intel/xe_query.c    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index bacdca787..170cc0de9 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -513,6 +513,8 @@ struct drm_xe_query_topology_mask {
 #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
 #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
 #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
+#define DRM_XE_TOPO_L3_BANK		(1 << 3)
+#define DRM_XE_TOPO_L3_NODE		(1 << 4)
 	/** @type: type of mask */
 	__u16 type;
 
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 9a6799c84..0a754f51c 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -166,6 +166,8 @@ const char *get_topo_name(int value)
 	case DRM_XE_TOPO_DSS_GEOMETRY: return "DSS_GEOMETRY";
 	case DRM_XE_TOPO_DSS_COMPUTE: return "DSS_COMPUTE";
 	case DRM_XE_TOPO_EU_PER_DSS: return "EU_PER_DSS";
+	case DRM_XE_TOPO_L3_BANK: return "L3_BANK";
+	case DRM_XE_TOPO_L3_NODE: return "L3_NODE";
 	}
 	return "??";
 }
-- 
2.34.1

