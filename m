Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58247E83041
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 02:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F371510E2F9;
	Tue,  3 Feb 2026 02:11:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9B910E2F9;
 Tue,  3 Feb 2026 02:11:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Run_PSR2_and_PR_tests_on_?=
 =?utf-8?q?panel_supporting_both?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Feb 2026 02:11:24 -0000
Message-ID: <177008468443.218625.9159479210259586407@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202131622.1369539-1-jouni.hogander@intel.com>
In-Reply-To: <20260202131622.1369539-1-jouni.hogander@intel.com>
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

Series: Run PSR2 and PR tests on panel supporting both
URL   : https://patchwork.freedesktop.org/series/161016/
State : failure

== Summary ==

Applying: tests/intel/kms_psr2_sf: Drop Early Transport flag from data_t
Using index info to reconstruct a base tree...
M	tests/intel/kms_psr2_sf.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/kms_psr2_sf.c
Applying: kms_psr2_sf: Check pipe and output validity for Selective Fetch test
Using index info to reconstruct a base tree...
M	tests/intel/kms_psr2_sf.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/kms_psr2_sf.c
CONFLICT (content): Merge conflict in tests/intel/kms_psr2_sf.c
Patch failed at 0002 kms_psr2_sf: Check pipe and output validity for Selective Fetch test
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


