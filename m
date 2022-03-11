Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B96510E9BE
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 14:13:25 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u1so13126447wrg.11
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 06:13:25 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Mar 2022 15:12:55 +0100
Message-Id: <20220311141300.60629-8-tomeu.vizoso@collabora.com>
In-Reply-To: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
References: <20220311141300.60629-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 07/12] ci: Install lavacli in Debian container
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

We will need it to submit test jobs to LAVA labs.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 ci/Dockerfile.build-debian | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/Dockerfile.build-debian b/ci/Dockerfile.build-debian
index b6fc4773fcff..6dca763315d6 100644
--- a/ci/Dockerfile.build-debian
+++ b/ci/Dockerfile.build-debian
@@ -25,3 +25,4 @@ RUN apt-get install -y \
 RUN apt-get clean
 
 RUN pip3 install git+http://gitlab.freedesktop.org/freedesktop/ci-templates@34f4ade99434043f88e164933f570301fd18b125
+RUN pip3 install git+https://git.lavasoftware.org/lava/lavacli@3db3ddc45e5358908bc6a17448059ea2340492b7
-- 
2.31.1
