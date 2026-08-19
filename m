Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13BFC5DF6D
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 09:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D8510E102;
	Wed, 19 Aug 2026 09:41:31 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF05D10ED94;
 Wed, 19 Aug 2026 09:40:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/xe=5Fexec=5Fr?=
 =?utf-8?q?eset=3A_add_GT_reset_fault_injection_stress_coverage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Aug 2026 09:40:55 -0000
Message-ID: <178713245584.66603.6898447143623670614@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260819073619.15981-1-nishit.sharma@intel.com>
In-Reply-To: <20260819073619.15981-1-nishit.sharma@intel.com>
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

Series: tests/intel/xe_exec_reset: add GT reset fault injection stress coverage
URL   : https://patchwork.freedesktop.org/series/172441/
State : failure

== Summary ==

Applying: tests/intel/xe_exec_reset: add GT reset fault injection stress coverage
Using index info to reconstruct a base tree...
M	tests/intel/xe_exec_reset.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/xe_exec_reset.c
CONFLICT (content): Merge conflict in tests/intel/xe_exec_reset.c
Patch failed at 0001 tests/intel/xe_exec_reset: add GT reset fault injection stress coverage
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


