Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Apr 2020 23:16:30 -0000
Message-ID: <158716539054.10465.14522294840725113181@emeril.freedesktop.org>
References: <20200417211025.109574-1-lyude@redhat.com>
In-Reply-To: <20200417211025.109574-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_nouveau-crc_tests_=28rev3=29?=
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add nouveau-crc tests (rev3)
URL   : https://patchwork.freedesktop.org/series/74811/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/133829 for the overview.

test:test-list-diff has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2329325):
  Downloading artifacts for build:tests-debian-autotools (2329318)...
  Downloading artifacts from coordinator... ok        id=2329318 responseStatus=200 OK token=4i_2hxzG
  Downloading artifacts for build:tests-debian-meson (2329313)...
  Downloading artifacts from coordinator... ok        id=2329313 responseStatus=200 OK token=6sAFzKxE
  section_end:1587165119:download_artifacts
  section_start:1587165119:build_script
  Running before_script and script
  Authenticating with credentials from job payload (GitLab Registry)
  $ diff <(sed "s/ /\n/g" meson-test-list.txt| grep -v 'vc4\|v3d\|panfrost' | sort) <(sed "s/ /\n/g" autotools-test-list.txt | sort)
  217d216
  < nouveau_crc
  section_end:1587165120:build_script
  section_start:1587165120:after_script
  Running after_script
  section_end:1587165121:after_script
  section_start:1587165121:upload_artifacts_on_failure
  Uploading artifacts for failed job
  section_end:1587165123:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/133829
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
