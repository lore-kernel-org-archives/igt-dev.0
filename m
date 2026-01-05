Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BE8C79F9D
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 14:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3B610E40F;
	Mon,  5 Jan 2026 14:44:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E4F10E390;
 Mon,  5 Jan 2026 14:44:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Madvise_feature_in_SVM_fo?=
 =?utf-8?q?r_Multi-GPU_configs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 Jan 2026 14:44:36 -0000
Message-ID: <176762427680.126412.1423984220563531259@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260105084750.190346-1-nishit.sharma@intel.com>
In-Reply-To: <20260105084750.190346-1-nishit.sharma@intel.com>
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

Series: Madvise feature in SVM for Multi-GPU configs
URL   : https://patchwork.freedesktop.org/series/159633/
State : failure

== Summary ==

Applying: drm-uapi/xe: Sync with madvise interface
Using index info to reconstruct a base tree...
M	include/drm-uapi/xe_drm.h
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: lib/xe: Add instance parameter to xe_vm_madvise
Using index info to reconstruct a base tree...
M	lib/xe/xe_ioctl.c
M	lib/xe/xe_ioctl.h
M	tests/intel/xe_exec_system_allocator.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/xe_exec_system_allocator.c
Auto-merging lib/xe/xe_ioctl.c
CONFLICT (content): Merge conflict in lib/xe/xe_ioctl.c
Patch failed at 0002 lib/xe: Add instance parameter to xe_vm_madvise
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


