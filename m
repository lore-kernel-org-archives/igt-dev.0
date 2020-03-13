Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Mar 2020 03:39:21 -0000
Message-ID: <158407076160.30352.9636987723775001842@emeril.freedesktop.org>
References: <20200312135642.13845-1-anshuman.gupta@intel.com>
In-Reply-To: <20200312135642.13845-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?psp_platform_agnostic_support_=28rev2=29?=
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

Series: lpsp platform agnostic support (rev2)
URL   : https://patchwork.freedesktop.org/series/74647/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/119369 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1923178):
  Storing signatures
  STEP 2: COPY installdir/opt/igt /opt/igt
  2e2d5e5f93ce4257854558971384b38897212bda34f1d6c2cef946e3cfa886d2
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  3b8f8e3a09baff1cb2422bdd8410f71d86d3eb3a1cec1cf350485f12319837ec
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  d1f6e4633268f0065f598d34bd3c922ebd3e6d0be0a4bb900915584a7771b4e5
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  11889439eab442e60690614049bd0f93ff6d6606e12404e679b551add53fd367
  time="2020-03-13T03:37:24Z" level=error msg="error deleting build container \"928a73ec373df92a18880548f5c15e7a92287cab39b4a05d4da56a4b388de6ba\": write /var/run/containers/storage/vfs-layers/.tmp-mountpoints.json977260276: no space left on device\n"
  time="2020-03-13T03:37:24Z" level=error msg="error deleting build container \"d451d5d351a327dabb19ea08c1475e73e4a70b0b2bbd282ea98e415566c35f50\": write /var/run/containers/storage/vfs-layers/.tmp-mountpoints.json469660611: no space left on device\n"
  time="2020-03-13T03:37:24Z" level=error msg="error deleting build container \"b6d313adcb1b6c8a3489b6742e25125810a5d638ea2448644d790a8daf5087d0\": write /var/run/containers/storage/vfs-layers/.tmp-mountpoints.json485145670: no space left on device\n"
  Error: error preparing container for next step: error creating build container: error creating container: error creating read-write layer with ID "a3a5ebb072b13aea91d72d040cb1b2e5e54155a312f12adb744d15d81e02d91a": no space left on device
  section_end:1584070646:build_script
  section_start:1584070646:after_script
  section_end:1584070647:after_script
  section_start:1584070647:upload_artifacts_on_failure
  section_end:1584070649:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/119369
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
