Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Mar 2020 12:41:46 -0000
Message-ID: <158514010679.29634.17438924045251020107@emeril.freedesktop.org>
References: <20200325123318.240545-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200325123318.240545-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_r?=
 =?utf-8?q?unner=3A_Only_show_the_kmsg_underflow/overflow_message_once?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: runner: Only show the kmsg underflow/overflow message once
URL   : https://patchwork.freedesktop.org/series/75072/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/124138 for the overview.

build-containers:build-debian-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2053549):
      ],
      "Created": "2019-11-20T12:52:11.314879441Z",
      "DockerVersion": "",
      "Labels": {},
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:6faa5c149a3696b478cdf88493dae7020ea609735e2078074cf15c9f9a587374"
      ]
  }
  Skipping, already built
  Getting image source signatures
  time="2020-03-25T12:41:13Z" level=fatal msg="Error trying to reuse blob sha256:6faa5c149a3696b478cdf88493dae7020ea609735e2078074cf15c9f9a587374 at destination: Get https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Agfx-ci%2Figt-ci-tags%2Fbuild-debian-arm64%3Apull%2Cpush&service=container_registry: net/http: TLS handshake timeout" 
  section_end:1585140074:build_script
  section_start:1585140074:after_script
  section_end:1585140075:after_script
  section_start:1585140075:upload_artifacts_on_failure
  section_end:1585140076:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1
  

build-containers:build-debian-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2053551):
      ],
      "Created": "2019-11-20T12:57:39.183198159Z",
      "DockerVersion": "",
      "Labels": {},
      "Architecture": "amd64",
      "Os": "linux",
      "Layers": [
          "sha256:1ca91544b9f16a2d00191e28750d68ec6a73b9e39ff450b4a88d589239052a78"
      ]
  }
  Skipping, already built
  Getting image source signatures
  time="2020-03-25T12:41:15Z" level=fatal msg="Error trying to reuse blob sha256:1ca91544b9f16a2d00191e28750d68ec6a73b9e39ff450b4a88d589239052a78 at destination: Head https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-mips/blobs/sha256:1ca91544b9f16a2d00191e28750d68ec6a73b9e39ff450b4a88d589239052a78: net/http: TLS handshake timeout" 
  section_end:1585140075:build_script
  section_start:1585140075:after_script
  section_end:1585140077:after_script
  section_start:1585140077:upload_artifacts_on_failure
  section_end:1585140078:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/124138
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
