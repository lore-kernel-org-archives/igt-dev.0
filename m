Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41754C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 14:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B9510E24D;
	Fri, 24 May 2024 14:44:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6037D10E24D;
 Fri, 24 May 2024 14:44:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/gpgpu=3A_add_shader?=
 =?utf-8?q?_support_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 24 May 2024 14:44:54 -0000
Message-ID: <171656189439.2171858.17056506587711617977@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com>
In-Reply-To: <20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com>
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

Series: lib/gpgpu: add shader support (rev4)
URL   : https://patchwork.freedesktop.org/series/133020/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1185231 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59116642):
  Running with gitlab-runner 16.3.0 (8ec04662)
    on fdo-equinix-m3l-27 EfLUxtkS, system ID: s_53a5e12e8cde
  section_start:1716561526:prepare_executor
  Preparing the "docker" executor
  Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-d8adf28de02fc33d435750c8cf3b5eb3c3bcdcef ...
  Authenticating with credentials from job payload (GitLab Registry)
  Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-d8adf28de02fc33d435750c8cf3b5eb3c3bcdcef ...
  WARNING: Failed to pull image with policy "if-not-present": Error response from daemon: Get "https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-arm64/manifests/sha256:df8438cd0e218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f": read tcp [2604:1380:45f2:6900::19]:46846->[2604:1380:45f2:6901::2]:443: read: connection reset by peer (manager.go:237:0s)
  section_end:1716561527:prepare_executor
  ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-d8adf28de02fc33d435750c8cf3b5eb3c3bcdcef" with specified policies [if-not-present]: Error response from daemon: Get "https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-arm64/manifests/sha256:df8438cd0e218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f": read tcp [2604:1380:45f2:6900::19]:46846->[2604:1380:45f2:6901::2]:443: read: connection reset by peer (manager.go:237:0s)
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59116636):
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
  
  meson.build:1:0: ERROR:  Meson version is 0.47.2 but project requires >=0.49.2.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1716561567:step_script
  section_start:1716561567:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1716561568:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1185231
