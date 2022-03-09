Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1900710E413
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 07:43:02 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g3so1741846edu.1
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Mar 2022 23:43:02 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed,  9 Mar 2022 08:42:36 +0100
Message-Id: <20220309074242.65066-6-tomeu.vizoso@collabora.com>
In-Reply-To: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
References: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 05/11] ci: Install ci-templates in arm64 container
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
