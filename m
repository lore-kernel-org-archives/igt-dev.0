Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C8DC25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 11:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E781A10F11E;
	Fri, 24 May 2024 11:12:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A563410F09C;
 Fri, 24 May 2024 11:12:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/gpgpu=3A_add_shader?=
 =?utf-8?q?_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 24 May 2024 11:12:42 -0000
Message-ID: <171654916267.2172910.8237396529174265740@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com>
In-Reply-To: <20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: lib/gpgpu: add shader support (rev3)
URL   : https://patchwork.freedesktop.org/series/133020/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1185073 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59106695):
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh  | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ meson $MESON_OPTIONS build
  The Meson build system
  Version: 0.49.2
  Source dir: /builds/gfx-ci/igt-ci-tags
  Build dir: /builds/gfx-ci/igt-ci-tags/build
  Build type: native build
  
  meson.build:1:0: ERROR:  Meson version is 0.49.2 but project requires >=0.53.2.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1716549097:step_script
  section_start:1716549097:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716549098:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59106698):
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
  $ meson --cross-file meson-cross-arm64.txt build
  The Meson build system
  Version: 0.49.2
  Source dir: /builds/gfx-ci/igt-ci-tags
  Build dir: /builds/gfx-ci/igt-ci-tags/build
  Build type: cross build
  
  meson.build:1:0: ERROR:  Meson version is 0.49.2 but project requires >=0.53.2.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1716549112:step_script
  section_start:1716549112:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716549113:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59106697):
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/
  $ meson --cross-file meson-cross-armhf.txt build
  The Meson build system
  Version: 0.49.2
  Source dir: /builds/gfx-ci/igt-ci-tags
  Build dir: /builds/gfx-ci/igt-ci-tags/build
  Build type: cross build
  
  meson.build:1:0: ERROR:  Meson version is 0.49.2 but project requires >=0.53.2.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1716549094:step_script
  section_start:1716549094:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716549094:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59106699):
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
  $ meson --cross-file meson-cross-mips.txt build
  The Meson build system
  Version: 0.49.2
  Source dir: /builds/gfx-ci/igt-ci-tags
  Build dir: /builds/gfx-ci/igt-ci-tags/build
  Build type: cross build
  
  meson.build:1:0: ERROR:  Meson version is 0.49.2 but project requires >=0.53.2.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1716549118:step_script
  section_start:1716549118:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716549120:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59106696):
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh  | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ meson -Dtests=disabled -Dlibdrm_drivers="" build
  The Meson build system
  Version: 0.49.2
  Source dir: /builds/gfx-ci/igt-ci-tags
  Build dir: /builds/gfx-ci/igt-ci-tags/build
  Build type: native build
  
  meson.build:1:0: ERROR:  Meson version is 0.49.2 but project requires >=0.53.2.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1716549105:step_script
  section_start:1716549105:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716549106:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59106690):
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh  | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ meson --prefix=/opt/igt $MESON_OPTIONS build
  The Meson build system
  Version: 0.52.0
  Source dir: /builds/gfx-ci/igt-ci-tags
  Build dir: /builds/gfx-ci/igt-ci-tags/build
  Build type: native build
  
  meson.build:1:0: ERROR: Meson version is 0.52.0 but project requires >=0.53.2
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1716549092:step_script
  section_start:1716549092:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716549092:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59106694):
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh  | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ meson $MESON_OPTIONS build
  The Meson build system
  Version: 0.52.0
  Source dir: /builds/gfx-ci/igt-ci-tags
  Build dir: /builds/gfx-ci/igt-ci-tags/build
  Build type: native build
  
  meson.build:1:0: ERROR: Meson version is 0.52.0 but project requires >=0.53.2
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1716549089:step_script
  section_start:1716549089:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716549089:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59106693):
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh  | sh
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  $ meson -Dlibdrm_drivers= build
  The Meson build system
  Version: 0.52.0
  Source dir: /builds/gfx-ci/igt-ci-tags
  Build dir: /builds/gfx-ci/igt-ci-tags/build
  Build type: native build
  
  meson.build:1:0: ERROR: Meson version is 0.52.0 but project requires >=0.53.2
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1716549103:step_script
  section_start:1716549103:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716549104:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59106691):
  Removed:
    libunwind-devel-1.3.1-3.fc31.x86_64       libunwind-1.3.1-3.fc31.x86_64      
  
  Complete!
  $ meson -Dlibunwind=disabled build
  The Meson build system
  Version: 0.52.0
  Source dir: /builds/gfx-ci/igt-ci-tags
  Build dir: /builds/gfx-ci/igt-ci-tags/build
  Build type: native build
  
  meson.build:1:0: ERROR: Meson version is 0.52.0 but project requires >=0.53.2
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1716549101:step_script
  section_start:1716549101:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716549101:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59106692):
  Installing collected packages: meson
    Running setup.py install for meson: started
      Running setup.py install for meson: finished with status 'done'
  Successfully installed meson-0.47.2
  $ meson $MESON_OPTIONS build
  The Meson build system
  Version: 0.47.2
  Source dir: /builds/gfx-ci/igt-ci-tags
  Build dir: /builds/gfx-ci/igt-ci-tags/build
  Build type: native build
  
  meson.build:1:0: ERROR:  Meson version is 0.47.2 but project requires >=0.53.2.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1716549092:step_script
  section_start:1716549092:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716549093:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1185073
