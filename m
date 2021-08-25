Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Aug 2021 06:15:57 -0000
Message-ID: <162987215757.17673.18102079934894647184@emeril.freedesktop.org>
References: <20210825053109.336142-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210825053109.336142-1-alan.previn.teres.alexis@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?ntroduce_PXP_Test_=28rev7=29?=
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
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Introduce PXP Test (rev7)
URL   : https://patchwork.freedesktop.org/series/87570/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/388082 for the overview.

build-containers:build-debian has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/13080590):
  Setting up libmount-dev:amd64 (2.33.1-0.1) ...
  Setting up libcairo-script-interpreter2:amd64 (1.16.0-4+deb10u1) ...
  Setting up libfontconfig1-dev:amd64 (2.13.1-2) ...
  Setting up libdw-dev:amd64 (0.176-1.1) ...
  Setting up libglib2.0-dev:amd64 (2.58.3-2+deb10u3) ...
  Setting up libcairo2-dev:amd64 (1.16.0-4+deb10u1) ...
  Processing triggers for libc-bin (2.28-10) ...
  5d99ebc0f7fc92cd0c9353f989ee7ed88760e218d7e5db09810f9cf0ba4f4e8f
  STEP 4: RUN apt-get clean
  STEP 5: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:dockerfile-6bf4b730e51b28190390693acbc1776ba69f9124
  e5c509b8c0a358091ad32ce2b8e106638bfdcf80b7089359bbe709f9d4bb4c78
  [Warning] one or more build args were not consumed: [CI_COMMIT_SHA CI_REGISTRY_IMAGE]
  Getting image source signatures
  Error: Error copying image to the remote destination: Error trying to reuse blob sha256:80092b3a41154de4cac582a8e89b168126945dbe776db7d2172221da8ebf9bac at destination: unexpected http code: 502 (Bad Gateway), URL: https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Agfx-ci%2Figt-ci-tags%2Fbuild-debian-minimal%3Apull%2Cpush&service=container_registry
  section_end:1629871379:step_script
  section_start:1629871379:cleanup_file_variables
  Cleaning up file based variables
  section_end:1629871380:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/13080592):
  done.
  Processing triggers for libc-bin (2.28-10) ...
  749d6b2df0f2e8e0f69c1105aed76f634f3d09f639c14c70e3580975fe9dd077
  STEP 7: RUN apt-get clean
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:dockerfile-f370b1c77e386827453db413b775a4c9bff41794
  7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c
  [Warning] one or more build args were not consumed: [CI_COMMIT_SHA CI_REGISTRY_IMAGE]
  Getting image source signatures
  Copying blob sha256:bcd671e982c319d93d63aba55fcf7d23c596cb73d6e7762fd03be70da5efe002
  Copying config sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760efac48fe52da27946c
  Writing manifest to image destination
  Storing signatures
  Getting image source signatures
  time="2021-08-25T06:09:27Z" level=fatal msg="Error trying to reuse blob sha256:a1c4b97398ec8bc7b17c52a01ef6941dc58811cb43f945b093db7a131586297a at destination: unexpected http code: 502 (Bad Gateway), URL: https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Agfx-ci%2Figt-ci-tags%2Fbuild-debian-arm64%3Apull%2Cpush&service=container_registry" 
  section_end:1629871767:step_script
  section_start:1629871767:cleanup_file_variables
  Cleaning up file based variables
  section_end:1629871768:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/388082
