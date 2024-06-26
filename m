Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E60C27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 21:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD50510E27C;
	Wed, 26 Jun 2024 21:44:11 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C723510E27C;
 Wed, 26 Jun 2024 21:44:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Intel_Xe_OA_IGT_lib_and?=
 =?utf-8?q?_tools?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jun 2024 21:44:10 -0000
Message-ID: <171943825081.162560.16064749728276605022@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626205443.1560171-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240626205443.1560171-1-ashutosh.dixit@intel.com>
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

Series: Intel Xe OA IGT lib and tools
URL   : https://patchwork.freedesktop.org/series/135451/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1211143 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60401052):
         ^
  ../lib/xe/xe_oa.c: In function ‘xe_oa_prop_to_ext’:
  ../lib/xe/xe_oa.c:1028:16: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
    __u64 *prop = (__u64 *)properties->properties_ptr;
                  ^
  ../lib/xe/xe_oa.c:1042:32: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     ext[j].base.next_extension = (__u64)&ext[j + 1];
                                  ^
  ../lib/xe/xe_oa.c: In function ‘intel_xe_perf_ioctl’:
  ../lib/xe/xe_oa.c:1056:12: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     .param = (__u64)((op == DRM_XE_PERF_OP_STREAM_OPEN) ? ext : arg),
              ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1719437995:step_script
  section_start:1719437995:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719437996:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60401054):
         ^
  ../lib/xe/xe_oa.c: In function ‘xe_oa_prop_to_ext’:
  ../lib/xe/xe_oa.c:1028:16: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
    __u64 *prop = (__u64 *)properties->properties_ptr;
                  ^
  ../lib/xe/xe_oa.c:1042:32: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     ext[j].base.next_extension = (__u64)&ext[j + 1];
                                  ^
  ../lib/xe/xe_oa.c: In function ‘intel_xe_perf_ioctl’:
  ../lib/xe/xe_oa.c:1056:12: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     .param = (__u64)((op == DRM_XE_PERF_OP_STREAM_OPEN) ? ext : arg),
              ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1719438001:step_script
  section_start:1719438001:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1719438002:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1211143
