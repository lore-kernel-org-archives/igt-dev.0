Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18BBCD11C2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 08:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4F5113A2C;
	Fri,  5 Apr 2024 08:04:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBE5113A2A;
 Fri,  5 Apr 2024 08:04:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_gputop=3A_Add_support_f?=
 =?utf-8?q?or_xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Apr 2024 08:04:33 -0000
Message-ID: <171230427350.1227990.17349173942922574590@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
In-Reply-To: <20240405060056.59379-1-lucas.demarchi@intel.com>
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

Series: gputop: Add support for xe
URL   : https://patchwork.freedesktop.org/series/132059/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1146422 for the overview.

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/57243898):
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out 03d7ea5c as detached HEAD (ref is intel/IGTPW_10979)...
  Removing build/
  Removing installdir/
  
  Skipping Git submodules setup
  section_end:1712303932:get_sources
  section_start:1712303932:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:cc55efdc667be826910d414a562c76ce1130a9c15255a0dd115431bc42f83448 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips:commit-03d7ea5c505de0940dc518e5e71d24afb397f36a with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-mips@sha256:c829c44880da4782b7a72626c259ac6904b4bd5f08601e66b3be889ca1c0cf79 ...
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh  | sh
  section_end:1712303933:step_script
  section_start:1712303933:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1712303935:cleanup_file_variables
  ERROR: Job failed: exit code 137

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1146422
