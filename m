Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 19 Apr 2020 15:31:47 -0000
Message-ID: <158731030744.15015.15337700302499180758@emeril.freedesktop.org>
References: <20200419151750.3863-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200419151750.3863-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_U?=
 =?utf-8?q?se_device_dependant_module_parameters?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Use device dependant module parameters
URL   : https://patchwork.freedesktop.org/series/76163/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/134147 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2338956):
  
  Skipping Git submodules setup
  section_end:1587310256:get_sources
  section_start:1587310256:restore_cache
  section_end:1587310258:restore_cache
  section_start:1587310258:download_artifacts
  Downloading artifacts for build:tests-fedora (2338938)...
  Downloading artifacts from coordinator... ok        id=2338938 responseStatus=200 OK token=8Yzfbjnn
  section_end:1587310263:download_artifacts
  section_start:1587310263:build_script
  Authenticating with credentials from job payload (GitLab Registry)
  $ podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
  Error: error authenticating creds for "registry.freedesktop.org": unexpected http code: 403 (Forbidden), URL: https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&service=container_registry
  section_end:1587310264:build_script
  section_start:1587310264:after_script
  section_end:1587310266:after_script
  section_start:1587310266:upload_artifacts_on_failure
  section_end:1587310268:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/134147
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
