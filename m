Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F1CCA5FD7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 18:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC3789870;
	Tue, 20 Jan 2026 18:12:38 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D980D89870;
 Tue, 20 Jan 2026 18:12:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_lib/igt=5Fkms=3A_pipe_vs_?=
 =?utf-8?q?CRTC_index_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jan 2026 18:12:36 -0000
Message-ID: <176893275688.172333.5336390780525236290@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1768906414.git.jani.nikula@intel.com>
In-Reply-To: <cover.1768906414.git.jani.nikula@intel.com>
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

Series: lib/igt_kms: pipe vs CRTC index cleanups
URL   : https://patchwork.freedesktop.org/series/160345/
State : failure

== Summary ==

Applying: lib/igt_kms: Always return CRTC index from kmstest_get_pipe_from_crtc_id()
Using index info to reconstruct a base tree...
M	lib/igt_kms.c
M	lib/igt_kms.h
M	tests/kms_async_flips.c
Falling back to patching base and 3-way merge...
Auto-merging tests/kms_async_flips.c
CONFLICT (content): Merge conflict in tests/kms_async_flips.c
Auto-merging lib/igt_kms.h
Auto-merging lib/igt_kms.c
Patch failed at 0001 lib/igt_kms: Always return CRTC index from kmstest_get_pipe_from_crtc_id()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


