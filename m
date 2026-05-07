Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3A0CD3427
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 05:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBF010E02C;
	Thu,  7 May 2026 05:49:07 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420FC10E02C;
 Thu,  7 May 2026 05:48:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/amdgpu=3A_Fix_amd?=
 =?utf-8?q?=5Ffuzzing=5Fkfd_build_on_systems_without_drm_headers_in_standard?=
 =?utf-8?q?_paths?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 07 May 2026 05:48:51 -0000
Message-ID: <177813293126.46444.4497000505359579595@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260507022415.157055-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260507022415.157055-1-vitaly.prosyak@amd.com>
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

Series: tests/amdgpu: Fix amd_fuzzing_kfd build on systems without drm headers in standard paths
URL   : https://patchwork.freedesktop.org/series/166092/
State : failure

== Summary ==

Applying: tests/amdgpu: Fix amd_fuzzing_kfd build on systems without drm headers in standard paths
Using index info to reconstruct a base tree...
M	tests/amdgpu/amd_fuzzing_kfd.c
M	tests/amdgpu/meson.build
Falling back to patching base and 3-way merge...
Auto-merging tests/amdgpu/meson.build
CONFLICT (content): Merge conflict in tests/amdgpu/meson.build
Auto-merging tests/amdgpu/amd_fuzzing_kfd.c
Patch failed at 0001 tests/amdgpu: Fix amd_fuzzing_kfd build on systems without drm headers in standard paths
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


