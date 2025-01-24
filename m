Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ADEC02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 18:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B6910E16D;
	Fri, 24 Jan 2025 18:03:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60CC10E16D;
 Fri, 24 Jan 2025 18:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/xe=5Feudebug=5Fonli?=
 =?utf-8?q?ne=3A_breakpoint-many-sessions-*_add_delay_before_resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maciej Patelczyk" <maciej.patelczyk@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 24 Jan 2025 18:03:25 -0000
Message-ID: <173774180587.4124520.9970424963567928803@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124104107.3626601-1-maciej.patelczyk@intel.com>
In-Reply-To: <20250124104107.3626601-1-maciej.patelczyk@intel.com>
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

Series: tests/xe_eudebug_online: breakpoint-many-sessions-* add delay before resume
URL   : https://patchwork.freedesktop.org/series/143924/
State : failure

== Summary ==

Applying: tests/xe_eudebug_online: breakpoint-many-sessions-* add delay before resume
Using index info to reconstruct a base tree...
M	tests/intel/xe_eudebug_online.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/xe_eudebug_online.c
CONFLICT (content): Merge conflict in tests/intel/xe_eudebug_online.c
Patch failed at 0001 tests/xe_eudebug_online: breakpoint-many-sessions-* add delay before resume
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


