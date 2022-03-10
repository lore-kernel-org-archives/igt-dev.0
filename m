Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC14B10F53A
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 07:38:33 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qa43so10043836ejc.12
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Mar 2022 23:38:33 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Mar 2022 08:37:56 +0100
Message-Id: <20220310073800.22067-9-tomeu.vizoso@collabora.com>
In-Reply-To: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
References: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 08/12] ci: Add wget to Debian container
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
