Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F87103E187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 14:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3EC10E06C;
	Wed, 18 Mar 2026 14:02:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4020310E06C;
 Wed, 18 Mar 2026 14:02:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Implementation_of_Negativ?=
 =?utf-8?q?e_tests_for_VM=5FBIND_Decomp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Smitha Balasubramanyam" <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Mar 2026 14:02:31 -0000
Message-ID: <177384255123.372282.326103121760697896@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260318094657.761076-1-smitha.balasubramanyam@intel.com>
In-Reply-To: <20260318094657.761076-1-smitha.balasubramanyam@intel.com>
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

Series: Implementation of Negative tests for VM_BIND Decomp
URL   : https://patchwork.freedesktop.org/series/163452/
State : failure

== Summary ==

Applying: igt/xe: Add temporary helpers for VM_Bind neg test
Using index info to reconstruct a base tree...
M	tests/intel/xe_ccs.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/xe_ccs.c
CONFLICT (content): Merge conflict in tests/intel/xe_ccs.c
Patch failed at 0001 igt/xe: Add temporary helpers for VM_Bind neg test
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


