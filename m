Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D8D10E413
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 07:43:04 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id c20so1698955edr.8
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Mar 2022 23:43:04 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed,  9 Mar 2022 08:42:38 +0100
Message-Id: <20220309074242.65066-8-tomeu.vizoso@collabora.com>
In-Reply-To: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
References: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 07/11] ci: Add wget to Debian container
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
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
