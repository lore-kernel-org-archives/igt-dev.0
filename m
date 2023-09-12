Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF01310E438
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 16:24:10 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 21:52:16 +0530
Message-Id: <20230912162219.1316473-2-swati2.sharma@intel.com>
In-Reply-To: <20230912162219.1316473-1-swati2.sharma@intel.com>
References: <20230912162219.1316473-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v9 1/4] lib/dsc: fix documentation style
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

Fix documentation style so that it can be detected by scripts
to build IGT reference docs published at
https://drm.pages.freedesktop.org/igt-gpu-tools/

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 76a420c10..8cb293890 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -42,7 +42,7 @@ static int write_dsc_debugfs(int drmfd, char *connector_name, const char *file_n
 	return ret;
 }
 
-/*
+/**
  * igt_is_dsc_supported_by_source:
  * @drmfd: A drm file descriptor
  *
@@ -63,7 +63,7 @@ bool igt_is_dsc_supported_by_source(int drmfd)
 	return res > 0 ? strstr(buf, "has_dsc: yes") : 0;
 }
 
-/*
+/**
  * igt_is_dsc_supported_by_sink:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
@@ -75,7 +75,7 @@ bool igt_is_dsc_supported_by_sink(int drmfd, char *connector_name)
 	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes");
 }
 
-/*
+/**
  * igt_is_fec_supported:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
@@ -87,7 +87,7 @@ bool igt_is_fec_supported(int drmfd, char *connector_name)
 	return check_dsc_debugfs(drmfd, connector_name, "FEC_Sink_Support: yes");
 }
 
-/*
+/**
  * igt_is_dsc_enabled:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
@@ -99,7 +99,7 @@ bool igt_is_dsc_enabled(int drmfd, char *connector_name)
 	return check_dsc_debugfs(drmfd, connector_name, "DSC_Enabled: yes");
 }
 
-/*
+/**
  * igt_is_force_dsc_enabled:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
@@ -112,7 +112,7 @@ bool igt_is_force_dsc_enabled(int drmfd, char *connector_name)
 	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: yes");
 }
 
-/*
+/**
  * igt_force_dsc_enable:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
@@ -124,7 +124,7 @@ int igt_force_dsc_enable(int drmfd, char *connector_name)
 	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "1");
 }
 
-/*
+/**
  * igt_force_dsc_enable_bpc:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
@@ -141,7 +141,7 @@ int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
 	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc", buf);
 }
 
-/*
+/**
  * igt_get_dsc_debugfs_fd:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
@@ -157,7 +157,7 @@ int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
 	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
 }
 
-/*
+/**
  * igt_is_dsc_output_format_supported_by_sink:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
@@ -188,7 +188,7 @@ bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
 	return check_dsc_debugfs(drmfd, connector_name, check_str);
 }
 
-/*
+/**
  * igt_force_dsc_output_format:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
-- 
2.25.1
