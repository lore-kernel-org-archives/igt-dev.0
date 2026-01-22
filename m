Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E06D3EE84
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 16:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC9610E0D8;
	Thu, 22 Jan 2026 16:39:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EC310E0D8;
 Thu, 22 Jan 2026 16:39:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2Ci-g-t=2C1/1=5D_tests/intel/xe=5Fevict=3A_overcommit_tests_for?=
 =?utf-8?q?_fault-mode_and_non-fault-mode_VMs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jan 2026 16:39:24 -0000
Message-ID: <176909996426.184722.16562761305543231424@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260122125424.45139-1-sobin.thomas@intel.com>
In-Reply-To: <20260122125424.45139-1-sobin.thomas@intel.com>
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

Series: series starting with [v3,i-g-t,1/1] tests/intel/xe_evict: overcommit tests for fault-mode and non-fault-mode VMs
URL   : https://patchwork.freedesktop.org/series/160491/
State : failure

== Summary ==

Applying: tests/intel/xe_evict: overcommit tests for fault-mode and non-fault-mode VMs
Using index info to reconstruct a base tree...
M	tests/intel/xe_evict.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/xe_evict.c
CONFLICT (content): Merge conflict in tests/intel/xe_evict.c
Patch failed at 0001 tests/intel/xe_evict: overcommit tests for fault-mode and non-fault-mode VMs
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


