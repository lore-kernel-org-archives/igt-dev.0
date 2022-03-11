Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE4210E9BC
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 14:13:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x15so13084954wru.13
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 06:13:24 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Mar 2022 15:12:54 +0100
Message-Id: <20220311141300.60629-7-tomeu.vizoso@collabora.com>
In-Reply-To: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
References: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 06/12] ci: Install ci-templates in arm64
 container
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

We will need it to store artifacts in MinIO.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 ci/Dockerfile.build-debian-arm64 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ci/Dockerfile.build-debian-arm64 b/ci/Dockerfile.build-debian-arm64
index cf0625ac725a..052b2a16e1f1 100644
--- a/ci/Dockerfile.build-debian-arm64
+++ b/ci/Dockerfile.build-debian-arm64
@@ -4,9 +4,11 @@ RUN apt-get update
 RUN apt-get install -y \
 			flex \
 			bison \
+			git \
 			pkg-config \
 			x11proto-dri2-dev \
 			python3-docutils \
+			python3-pip \
 			valgrind \
 			peg
 
@@ -38,3 +40,5 @@ RUN apt-get install -y \
 
 
 RUN apt-get clean
+
+RUN pip3 install git+http://gitlab.freedesktop.org/freedesktop/ci-templates@34f4ade99434043f88e164933f570301fd18b125
-- 
2.31.1
