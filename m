Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DBDF36B9B
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 01:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B441110E873;
	Fri, 10 Apr 2026 01:08:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC85910E873;
 Fri, 10 Apr 2026 01:08:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/xe=3A_Add_purgeable?=
 =?utf-8?q?_memory_madvise_tests_for_system_allocator_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Apr 2026 01:08:44 -0000
Message-ID: <177578332466.449056.8224801670843700275@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409070118.2211602-1-arvind.yadav@intel.com>
In-Reply-To: <20260409070118.2211602-1-arvind.yadav@intel.com>
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

Series: tests/xe: Add purgeable memory madvise tests for system allocator (rev7)
URL   : https://patchwork.freedesktop.org/series/160333/
State : failure

== Summary ==

Applying: drm-uapi/xe_drm: Sync with Add UAPI support for purgeable buffer objects
Using index info to reconstruct a base tree...
M	include/drm-uapi/xe_drm.h
Falling back to patching base and 3-way merge...
Auto-merging include/drm-uapi/xe_drm.h
CONFLICT (content): Merge conflict in include/drm-uapi/xe_drm.h
Patch failed at 0001 drm-uapi/xe_drm: Sync with Add UAPI support for purgeable buffer objects
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


