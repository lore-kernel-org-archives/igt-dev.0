Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CB210F538
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 07:38:34 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y22so5855981eds.2
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Mar 2022 23:38:34 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Mar 2022 08:37:57 +0100
Message-Id: <20220310073800.22067-10-tomeu.vizoso@collabora.com>
In-Reply-To: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
References: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 09/12] ci: Setup JWT token to use with MinIO
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
index 8c72e0494b67..77c4fa00fcb4 100644
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
