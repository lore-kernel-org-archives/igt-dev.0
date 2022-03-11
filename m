Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB3910E9BC
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 14:13:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t11so13131222wrm.5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 06:13:26 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Mar 2022 15:12:57 +0100
Message-Id: <20220311141300.60629-10-tomeu.vizoso@collabora.com>
In-Reply-To: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
References: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 09/12] ci: Setup JWT token to use with MinIO
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

We will need it to authenticate with MinIO when uploading artifacts.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 .gitlab-ci.yml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9731c5486cec..2cf109728d54 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -305,6 +305,21 @@ test:verify-blacklists:
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
