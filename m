Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA26C5DF94
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 07:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0284E10E577;
	Tue, 25 Aug 2026 07:30:16 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381E010E577;
 Tue, 25 Aug 2026 07:29:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/amdgpu=3A_add_SVM_?=
 =?utf-8?q?=28shared_virtual_memory=29_test_suite_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Junhua Shen" <junhua.shen@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 25 Aug 2026 07:29:38 -0000
Message-ID: <178764297822.81714.661299013004268321@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260825072300.16348-1-Junhua.Shen@amd.com>
In-Reply-To: <20260825072300.16348-1-Junhua.Shen@amd.com>
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

Series: tests/amdgpu: add SVM (shared virtual memory) test suite (rev2)
URL   : https://patchwork.freedesktop.org/series/171787/
State : failure

== Summary ==

Applying: include/drm-uapi: sync amdgpu_drm.h for GEM_SVM uAPI
Applying: lib/amdgpu: add SVM helper library (amd_svm.{c, h})
Using index info to reconstruct a base tree...
M	lib/meson.build
Falling back to patching base and 3-way merge...
Auto-merging lib/meson.build
CONFLICT (content): Merge conflict in lib/meson.build
Patch failed at 0002 lib/amdgpu: add SVM helper library (amd_svm.{c, h})
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


