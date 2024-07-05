Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF9EC3271E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 19:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DDC10E1AD;
	Fri,  5 Jul 2024 19:09:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC66410E1AD;
 Fri,  5 Jul 2024 19:09:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Intel_Xe_OA_IGT=27s_=28?=
 =?utf-8?q?rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Jul 2024 19:09:26 -0000
Message-ID: <172020656689.31861.5697513321269617666@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705182637.2679730-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240705182637.2679730-1-ashutosh.dixit@intel.com>
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

Series: Intel Xe OA IGT's (rev10)
URL   : https://patchwork.freedesktop.org/series/130033/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1218011 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/60735583):
  50b81cf171892098914313aca7850d4c1db044b036cacc502adc662c84722252
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  751be90f1d6d3046a0d0380d5318d44616df0d7d95684da8fb92b1a66392a0ca
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  e50401b72659d6724d6da780a7bb9f9f3eba19457be0258ee71d57c438b4b4d2
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  5d5de330f6ff04040212cbefed4cec35748917eb32ea0643d8d25a46d2ede8f5
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  28ebfbf3d31e9113d51a523c4cc7cb145eabdbda49dbe213d724a480c589f12c
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-9988a5b6a084a1d8db8f030cc491bedd2bb7737a
  742fc7391b766b4a55bb23f8975b5a5f523ed9c06648ff426f19577e3bfc5d95
  Getting image source signatures
  Error: Error copying image to the remote destination: Error trying to reuse blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079 at destination: unable to retrieve auth token: invalid username/password
  section_end:1720206263:step_script
  section_start:1720206263:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1720206263:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1218011
