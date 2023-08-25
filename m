Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Fri, 25 Aug 2023 17:45:06 -0000
Message-ID: <169298550629.10955.6831692078052811290@emeril.freedesktop.org>
References: <20230825171526.1182193-1-swati2.sharma@intel.com>
In-Reply-To: <20230825171526.1182193-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/feature=5Fdiscovery=3A_detect_mst_configuration?=
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

Series: tests/feature_discovery: detect mst configuration
URL   : https://patchwork.freedesktop.org/series/122928/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/970827 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/48059381):
  Getting image source signatures
  Copying blob sha256:4349821ba15bf8fd54fe8a4baf27035b70e28e9c4cc2137a63d084067d758063
  Copying blob sha256:73816335a2c825b04db3e1e4f2330fb339c32e54a7fbb1361708449eb5a6a70a
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Copying config sha256:c501e1a1d30933c1b2ea5bea24e9afac19b46060ac58d58f9e3a7f6f918c6845
  Writing manifest to image destination
  Storing signatures
  Getting image source signatures
  Copying blob sha256:23f61cafbca889e675d532ccae9b44791c3b7811610ffe88121cc796146aab81
  Copying blob sha256:b39735705e69a2516323755ff4698ea5cd86b08b31d8c8287bc83d76d34c3bfc
  Copying blob sha256:7db4edd29fbd2f234fabf8addddc538aa3433a91fe3a74b2e5d7b62c6dbe0e16
  Copying config sha256:c501e1a1d30933c1b2ea5bea24e9afac19b46060ac58d58f9e3a7f6f918c6845
  Writing manifest to image destination
  time="2023-08-25T17:43:50Z" level=fatal msg="Error writing manifest: Put https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/igt/manifests/intel-IGTPW_9664: dial tcp 147.75.198.156:443: i/o timeout" 
  section_end:1692985430:step_script
  section_start:1692985430:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692985431:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/970827
