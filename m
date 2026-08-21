Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC527C5DF7D
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 04:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289A810E249;
	Fri, 21 Aug 2026 04:37:14 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7135910E249;
 Fri, 21 Aug 2026 04:36:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/core=5Fhotunplug=3A?=
 =?utf-8?q?_add_*-with-load_subtests_exercising_GPU_workload_during_hotplug_?=
 =?utf-8?q?=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 21 Aug 2026 04:36:38 -0000
Message-ID: <178728699845.72618.17925655916343978595@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260518154808.118134-2-nitin.r.gote@intel.com>
In-Reply-To: <20260518154808.118134-2-nitin.r.gote@intel.com>
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

Series: tests/core_hotunplug: add *-with-load subtests exercising GPU workload during hotplug (rev5)
URL   : https://patchwork.freedesktop.org/series/166744/
State : failure

== Summary ==

Applying: tests/core_hotunplug: add *-with-load subtests exercising GPU workload during hotplug
Using index info to reconstruct a base tree...
M	tests/core_hotunplug.c
Falling back to patching base and 3-way merge...
Auto-merging tests/core_hotunplug.c
CONFLICT (content): Merge conflict in tests/core_hotunplug.c
Patch failed at 0001 tests/core_hotunplug: add *-with-load subtests exercising GPU workload during hotplug
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


