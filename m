Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE32CA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 19:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DE010E1E9;
	Fri, 29 Aug 2025 19:08:11 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346D210E1E9;
 Fri, 29 Aug 2025 19:08:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2C1/5=5D_DO-NOT-MERGE=3A_include/drm-uapi=3A_Add_drm=5Fxe=5F?=
 =?utf-8?q?madvise_structure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Aug 2025 19:08:10 -0000
Message-ID: <175649449018.285848.8208648001959345366@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250829145422.559494-1-nishit.sharma@intel.com>
In-Reply-To: <20250829145422.559494-1-nishit.sharma@intel.com>
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

Series: series starting with [i-g-t,1/5] DO-NOT-MERGE: include/drm-uapi: Add drm_xe_madvise structure
URL   : https://patchwork.freedesktop.org/series/153718/
State : failure

== Summary ==

Applying: DO-NOT-MERGE: include/drm-uapi: Add drm_xe_madvise structure
Applying: lib/xe: Add xe_vm_madvise ioctl support
Applying: lib/xe: Add Helper to get memory attributes
Applying: tests/intel/xe_exec_system_allocator: Add preferred-loc-smem test
Applying: tests/intel/xe_exec_system_allocator: Add atomic_batch test in IGT
Using index info to reconstruct a base tree...
M	tests/intel/xe_exec_system_allocator.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/xe_exec_system_allocator.c
CONFLICT (content): Merge conflict in tests/intel/xe_exec_system_allocator.c
Patch failed at 0005 tests/intel/xe_exec_system_allocator: Add atomic_batch test in IGT
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


