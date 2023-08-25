Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 25 Aug 2023 11:13:46 -0000
Message-ID: <169296202673.10954.7505209761690132513@emeril.freedesktop.org>
References: <20230825082541.905799-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825082541.905799-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_F?=
 =?utf-8?q?ix_Bigjoiner_checks_=28rev9=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Fix Bigjoiner checks (rev9)
URL   : https://patchwork.freedesktop.org/series/115712/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/970501 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48039756):
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  d6661a8ab7e3ff36813488de72f455378947680dbb06a80bb19eca2bdc0f552d
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  e5032e546371f16a4b55dd4b76e4bbdd103ae0df6b6dcb9ed43ea8d66d3e7cbd
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  41f27e19361c3f3d1177a2978c7ce8a635d3db71a4b7e90e23ea408486413a13
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-94304a6d60f70096f700e70743d13799c6afecdb
  e68939d6be31d52ffd5999611c7ddd032825370fbde7f438730cf738539e2613
  Getting image source signatures
  Copying blob sha256:6ac2c5bb2fe05f6a4dad68839a566bbbc8668fe99fe0f795efe15446f70d8709
  Copying blob sha256:5c60ed7a9169aa38acfc03984327714911665b091779f5d6216dc9ea5b69a696
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Error: Error copying image to the remote destination: Error writing blob: Patch https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/igt/blobs/uploads/9b316780-3276-4740-9a1f-64d5a647e3eb?_state=A8tgIT5sFbyavHYzAlebFM87uO2TCx_hdQ1GHO0MWw97Ik5hbWUiOiJnZngtY2kvaWd0LWNpLXRhZ3MvaWd0IiwiVVVJRCI6IjliMzE2NzgwLTMyNzYtNDc0MC05YTFmLTY0ZDVhNjQ3ZTNlYiIsIk9mZnNldCI6MCwiU3RhcnRlZEF0IjoiMjAyMy0wOC0yNVQxMDo1NTo0NC4yNTcwNDY3NTZaIn0%3D: net/http: HTTP/1.x transport connection broken: write tcp 10.88.60.142:40168->147.75.198.156:443: write: connection timed out
  section_end:1692961910:step_script
  section_start:1692961910:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692961911:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/970501
