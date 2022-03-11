Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CA910E9BA
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 14:13:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so5385471wms.4
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 06:13:25 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Mar 2022 15:12:56 +0100
Message-Id: <20220311141300.60629-9-tomeu.vizoso@collabora.com>
In-Reply-To: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
References: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 08/12] ci: Add wget to Debian container
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Eric Anholt <eric@anholt.net>,
 Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For downloading artifacts from MinIO into GitLab CI.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 ci/Dockerfile.build-debian | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ci/Dockerfile.build-debian b/ci/Dockerfile.build-debian
index 6dca763315d6..9e7b8809d77f 100644
--- a/ci/Dockerfile.build-debian
+++ b/ci/Dockerfile.build-debian
@@ -20,7 +20,8 @@ RUN apt-get install -y \
 			valgrind \
 			peg \
 			git \
-			libdrm-intel1
+			libdrm-intel1 \
+			wget
 
 RUN apt-get clean
 
-- 
2.31.1
