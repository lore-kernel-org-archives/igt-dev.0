Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3868310E9B0
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 14:13:19 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u1so13126013wrg.11
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 06:13:19 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Mar 2022 15:12:49 +0100
Message-Id: <20220311141300.60629-2-tomeu.vizoso@collabora.com>
In-Reply-To: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
References: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 01/12] ci: Run container jobs only in
 packet.net runners
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

On Hetzner runners, we get the following error:

error running container: error creating container for [/bin/sh -c apt-get update]: time="2022-03-09T11:17:43Z" level=warning msg="signal: killed"
time="2022-03-09T11:17:43Z" level=error msg="container_linux.go:346: starting container process caused \"process_linux.go:297: applying cgroup configuration for process caused \\\"mountpoint for cgroup not found\\\"\"\n"
container_linux.go:346: starting container process caused "process_linux.go:297: applying cgroup configuration for process caused \"mountpoint for cgroup not found\"": exit status 1
Error: error building at STEP "RUN apt-get update": error while running runtime: exit status 1

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 .gitlab-ci.yml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fd0ca7cbdfbb..9f252836c578 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -29,6 +29,8 @@ build-containers:build-debian:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-minimal build-debian-minimal
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian build-debian
+  tags:
+    - packet.net
 
 build-containers:build-debian-armhf:
   stage: build-containers
@@ -36,6 +38,8 @@ build-containers:build-debian-armhf:
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-armhf build-debian-armhf
+  tags:
+    - packet.net
 
 build-containers:build-debian-arm64:
   stage: build-containers
@@ -43,6 +47,8 @@ build-containers:build-debian-arm64:
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-arm64 build-debian-arm64
+  tags:
+    - packet.net
 
 build-containers:build-debian-mips:
   stage: build-containers
@@ -50,6 +56,8 @@ build-containers:build-debian-mips:
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-mips build-debian-mips
+  tags:
+    - packet.net
 
 build-containers:build-fedora:
   stage: build-containers
@@ -57,6 +65,8 @@ build-containers:build-fedora:
   script:
     - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
     - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-fedora build-fedora
+  tags:
+    - packet.net
 
 #################### BUILD #########################
 
-- 
2.31.1
