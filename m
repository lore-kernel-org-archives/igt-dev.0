Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2BCCD37BE
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 03:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FDE10E254;
	Tue, 12 May 2026 03:51:14 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11CD10E254;
 Tue, 12 May 2026 03:50:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/xe=5Fmadvise?=
 =?utf-8?q?=3A_Add_atomic_madvise_subtests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 May 2026 03:50:56 -0000
Message-ID: <177855785671.60084.8822865642134055023@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511135752.119868-1-varun.gupta@intel.com>
In-Reply-To: <20260511135752.119868-1-varun.gupta@intel.com>
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

Series: tests/intel/xe_madvise: Add atomic madvise subtests
URL   : https://patchwork.freedesktop.org/series/166325/
State : failure

== Summary ==

Applying: tests/intel/xe_madvise: Generalize metadata and group purgeable subtests
Using index info to reconstruct a base tree...
M	tests/intel/xe_madvise.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/xe_madvise.c
CONFLICT (content): Merge conflict in tests/intel/xe_madvise.c
Patch failed at 0001 tests/intel/xe_madvise: Generalize metadata and group purgeable subtests
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


