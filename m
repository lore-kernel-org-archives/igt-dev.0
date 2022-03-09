Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B44F10E439
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 07:43:05 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id d10so2961073eje.10
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Mar 2022 23:43:05 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed,  9 Mar 2022 08:42:39 +0100
Message-Id: <20220309074242.65066-9-tomeu.vizoso@collabora.com>
In-Reply-To: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
References: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 08/11] ci: Setup JWT token to use with MinIO
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

We will need it to authenticate with MinIO when uploading artifacts.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 .gitlab-ci.yml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7219cd0b3464..7476b3306845 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -295,6 +295,21 @@ test:verify-blacklists:
   needs:
     - build:tests-fedora
 
+default:
+  before_script:
+    - echo -e "\e[0Ksection_start:$(date +%s):unset_env_vars_section[collapsed=true]\r\e[0KUnsetting vulnerable environment variables"
+    - export CI_JOB_JWT_FILE="${CI_JOB_JWT_FILE:-$(mktemp)}"
+    - echo -n "${CI_JOB_JWT}" > "${CI_JOB_JWT_FILE}"
+    - unset CI_JOB_JWT
+    - echo -e "\e[0Ksection_end:$(date +%s):unset_env_vars_section\r\e[0K"
+
+  after_script:
+    - >
+      set +x
+
+      test -e "${CI_JOB_JWT_FILE}" &&
+      export CI_JOB_JWT="$(<${CI_JOB_JWT_FILE})" &&
+      rm "${CI_JOB_JWT_FILE}"
 ################### DEPLOY #########################
 
 pages:
-- 
2.31.1
