Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33911EF4ECA
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 10:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63CB8926F;
	Mon,  6 Apr 2026 10:04:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12ED8926F;
 Mon,  6 Apr 2026 10:04:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/xe=3A_Add_IGT_cover?=
 =?utf-8?q?age_for_SVM_madvise_autoreset_on_unmap=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 06 Apr 2026 10:04:43 -0000
Message-ID: <177546988383.433714.1112239751874525792@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260406095410.1274177-1-arvind.yadav@intel.com>
In-Reply-To: <20260406095410.1274177-1-arvind.yadav@intel.com>
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

Series: tests/xe: Add IGT coverage for SVM madvise autoreset on unmap.
URL   : https://patchwork.freedesktop.org/series/164387/
State : failure

== Summary ==

Applying: tests/intel/xe_madvise: Add multi-region-partial-unmap-no-gpu subtest
Using index info to reconstruct a base tree...
A	tests/intel/xe_madvise.c
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): tests/intel/xe_madvise.c deleted in HEAD and modified in tests/intel/xe_madvise: Add multi-region-partial-unmap-no-gpu subtest. Version tests/intel/xe_madvise: Add multi-region-partial-unmap-no-gpu subtest of tests/intel/xe_madvise.c left in tree.
Patch failed at 0001 tests/intel/xe_madvise: Add multi-region-partial-unmap-no-gpu subtest
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


