Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Arkadiusz Hiler <arek@hiler.eu>
Date: Thu, 25 Mar 2021 20:59:14 +0200
Message-Id: <20210325185915.51590-4-arek@hiler.eu>
In-Reply-To: <20210325185915.51590-1-arek@hiler.eu>
References: <20210325185915.51590-1-arek@hiler.eu>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/5] .gitlab-ci: Don't test Autotools
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
---
 .gitlab-ci.yml          | 18 ------------------
 Dockerfile.build-debian |  8 --------
 2 files changed, 26 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e226d9d7..2b03fc98 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -154,17 +154,6 @@ build:tests-debian-meson-mips:
     paths:
       - build
 
-build:tests-debian-autotools:
-  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian:commit-$CI_COMMIT_SHA
-  stage: build
-  script:
-    - ./autogen.sh --enable-{chamelium,audio,intel,amdgpu,nouveau,tests,runner}
-    - make -j $(nproc) || make -j 1
-    - cp tests/test-list.txt autotools-test-list.txt
-  artifacts:
-    paths:
-      - autotools-test-list.txt
-
 #################### TEST ##########################
 
 test:ninja-test:
@@ -236,13 +225,6 @@ test:ninja-test-mips:
       - build
     when: on_failure
 
-test:test-list-diff:
-  dependencies:
-    - build:tests-debian-autotools
-    - build:tests-debian-meson
-  stage: test
-  script: diff <(sed "s/ /\n/g" meson-test-list.txt| grep -v 'vc4\|v3d\|panfrost\|nouveau' | sort) <(sed "s/ /\n/g" autotools-test-list.txt | sort)
-
 test:list-undocumented-tests:
   dependencies:
     - build:tests-fedora
diff --git a/Dockerfile.build-debian b/Dockerfile.build-debian
index b143a532..454f4bce 100644
--- a/Dockerfile.build-debian
+++ b/Dockerfile.build-debian
@@ -20,12 +20,4 @@ RUN apt-get install -y \
 			peg \
 			libdrm-intel1
 
-# autotools build deps
-RUN apt-get install -y \
-			autoconf \
-			automake \
-			xutils-dev \
-			libtool \
-			make
-
 RUN apt-get clean
-- 
2.31.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
