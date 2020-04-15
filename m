Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Apr 2020 13:54:22 -0000
Message-ID: <158695886257.21015.12319883968554784651@emeril.freedesktop.org>
References: <20200409053951.26929-1-anshuman.gupta@intel.com>
In-Reply-To: <20200409053951.26929-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?psp_platform_agnostic_support_=28rev8=29?=
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
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lpsp platform agnostic support (rev8)
URL   : https://patchwork.freedesktop.org/series/74647/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/132484 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2289958):
  4a509257e8f228975e8d3a6dfc8662956aaa0621998b4a66e7670c2b2a996b57
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  84516d96e31c8a35ae8211ab2ad9ba61fd77bf53e2e8d8c6c654f74049f30c89
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  c62a4309e9c2caafa4c80a1404cc5f87d4e1981418075642a6cbe5b984fd6c4c
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-91cd832c8024bc4e03537095ea2ad473a8575675
  d1856d9fda721b5993623699fcf2a37aa6901d9b6a2374b2311f2fa156d2c412
  Getting image source signatures
  Copying blob sha256:2f6357b310fc9944464328923ebb6c912fccc71897166789e96d2894c07c6f44
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Copying blob sha256:12ed85123637d650138fcc3efcf9f20b41d76447302ffd104b28a3b2165dfedb
  Error: Error copying image to the remote destination: Error writing blob: Patch https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/igt/blobs/uploads/f99ed8da-e6f7-49c6-853e-0b4dba4ddddb?_state=wUh9d9EcLzjRR7q2-qwhPEENFSUCXmhWs2iH4LYG98R7Ik5hbWUiOiJnZngtY2kvaWd0LWNpLXRhZ3MvaWd0IiwiVVVJRCI6ImY5OWVkOGRhLWU2ZjctNDljNi04NTNlLTBiNGRiYTRkZGRkYiIsIk9mZnNldCI6MCwiU3RhcnRlZEF0IjoiMjAyMC0wNC0xNVQxMzo1MToyNS41MzA5ODkwMjdaIn0%3D: EOF
  section_end:1586958701:build_script
  section_start:1586958701:after_script
  section_end:1586958703:after_script
  section_start:1586958703:upload_artifacts_on_failure
  section_end:1586958704:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/132484
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
