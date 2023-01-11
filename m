Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9C810E742
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 13:25:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 797DA5C01D3
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 08:25:17 -0500 (EST)
Mime-Version: 1.0
Message-Id: <33b61d47-b5e0-4905-bffb-398cfed26f0e@app.fastmail.com>
Date: Wed, 11 Jan 2023 05:22:55 -0800
From: "Christopher Snowhill" <chris@kode54.net>
To: "Development mailing list for IGT GPU Tools"
 <igt-dev@lists.freedesktop.org>
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] intel_gpu_top: Add display name for compute
 engine class
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

Add label and abbreviated display name for the compute engine class.

Signed-off-by: Christopher Snowhill <kode54@gmail.com>
---
 tools/intel_gpu_top.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 6de8a164..08306f51 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -281,6 +281,8 @@ static const char *class_display_name(unsigned int class)
 		return "Video";
 	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
 		return "VideoEnhance";
+	case I915_ENGINE_CLASS_COMPUTE:
+		return "Compute";
 	default:
 		return "[unknown]";
 	}
@@ -297,6 +299,8 @@ static const char *class_short_name(unsigned int class)
 		return "VCS";
 	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
 		return "VECS";
+	case I915_ENGINE_CLASS_COMPUTE:
+		return "CCS";
 	default:
 		return "UNKN";
 	}
-- 
2.39.0
