Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213D5EFCE53
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 23:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD2E10E02D;
	Wed,  4 Mar 2026 23:39:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C49D10E02D;
 Wed,  4 Mar 2026 23:39:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms=5Fasync=5Fflips?=
 =?utf-8?q?=3A_Do_not_skip_any_tests_due_to_Selective_Fetch?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Mar 2026 23:39:17 -0000
Message-ID: <177266755742.317254.17900890980920284199@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260304082251.537827-1-jouni.hogander@intel.com>
In-Reply-To: <20260304082251.537827-1-jouni.hogander@intel.com>
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

Series: tests/kms_async_flips: Do not skip any tests due to Selective Fetch
URL   : https://patchwork.freedesktop.org/series/162553/
State : failure

== Summary ==

Applying: tests/kms_async_flips: Do not skip any tests due to Selective Fetch
Using index info to reconstruct a base tree...
M	tests/kms_async_flips.c
Falling back to patching base and 3-way merge...
Auto-merging tests/kms_async_flips.c
CONFLICT (content): Merge conflict in tests/kms_async_flips.c
Patch failed at 0001 tests/kms_async_flips: Do not skip any tests due to Selective Fetch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


