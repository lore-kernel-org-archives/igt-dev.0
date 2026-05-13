Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B399CD37AC
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 17:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD50410EF92;
	Wed, 13 May 2026 17:01:55 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C195C10EF92;
 Wed, 13 May 2026 17:01:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_dmem=3A_add_amdgpu_suppor?=
 =?utf-8?q?t_and_one_more_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thadeu Lima de Souza Cascardo" <cascardo@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 May 2026 17:01:37 -0000
Message-ID: <177869169778.69099.7174216507467579370@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512215156.4083082-1-cascardo@igalia.com>
In-Reply-To: <20260512215156.4083082-1-cascardo@igalia.com>
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

Series: dmem: add amdgpu support and one more test
URL   : https://patchwork.freedesktop.org/series/166496/
State : failure

== Summary ==

Applying: Introduce dmem driver and implement Xe support
Applying: Adjust xe_cgroups test to use igt_dmem_driver
Using index info to reconstruct a base tree...
A	tests/intel/xe_cgroups.c
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): tests/intel/xe_cgroups.c deleted in HEAD and modified in Adjust xe_cgroups test to use igt_dmem_driver. Version Adjust xe_cgroups test to use igt_dmem_driver of tests/intel/xe_cgroups.c left in tree.
Patch failed at 0002 Adjust xe_cgroups test to use igt_dmem_driver
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


