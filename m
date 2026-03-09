Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C12F4181F
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 17:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0556210E18F;
	Mon,  9 Mar 2026 17:25:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B920E10E18F;
 Mon,  9 Mar 2026 17:25:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms=5Fvrr=3A_Skip_L?=
 =?utf-8?q?OBF_test_when_aux-less_ALPM_is_not_enabled_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Mar 2026 17:25:33 -0000
Message-ID: <177307713373.334410.4710824606112618865@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302151547.3041214-1-mohammed.bilal@intel.com>
In-Reply-To: <20260302151547.3041214-1-mohammed.bilal@intel.com>
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

Series: tests/kms_vrr: Skip LOBF test when aux-less ALPM is not enabled (rev3)
URL   : https://patchwork.freedesktop.org/series/162437/
State : failure

== Summary ==

Applying: tests/kms_vrr: Skip LOBF test when aux-less ALPM is not enabled
Using index info to reconstruct a base tree...
M	lib/igt_kms.c
M	lib/igt_kms.h
M	tests/kms_vrr.c
Falling back to patching base and 3-way merge...
Auto-merging tests/kms_vrr.c
Auto-merging lib/igt_kms.h
CONFLICT (content): Merge conflict in lib/igt_kms.h
Auto-merging lib/igt_kms.c
Patch failed at 0001 tests/kms_vrr: Skip LOBF test when aux-less ALPM is not enabled
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


