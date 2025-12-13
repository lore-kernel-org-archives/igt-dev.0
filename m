Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2943D5B15E
	for <igt-dev@archiver.kernel.org>; Sat, 13 Dec 2025 19:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F6610E3C2;
	Sat, 13 Dec 2025 19:21:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C52910E3A1;
 Sat, 13 Dec 2025 19:21:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Panthor_tests_for_huge_pa?=
 =?utf-8?q?rtial_unmaps_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 13 Dec 2025 19:21:14 -0000
Message-ID: <176565367459.86893.3922742040368311734@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251213190205.2435793-1-adrian.larumbe@collabora.com>
In-Reply-To: <20251213190205.2435793-1-adrian.larumbe@collabora.com>
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

Series: Panthor tests for huge partial unmaps (rev2)
URL   : https://patchwork.freedesktop.org/series/158975/
State : failure

== Summary ==

Applying: panthor: Allow specifying offset when mapping a BO against a VM
Applying: tests/panthor: Add VM_BIND tests for partial huge page unmaps
Using index info to reconstruct a base tree...
M	tests/panthor/panthor_vm.c
Falling back to patching base and 3-way merge...
Auto-merging tests/panthor/panthor_vm.c
CONFLICT (content): Merge conflict in tests/panthor/panthor_vm.c
Patch failed at 0002 tests/panthor: Add VM_BIND tests for partial huge page unmaps
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


