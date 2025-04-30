Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB3CC369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 00:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C158410E596;
	Wed, 30 Apr 2025 00:07:30 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B5210E596;
 Wed, 30 Apr 2025 00:07:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_benchmarks=3A_create_xe?=
 =?utf-8?q?=5Fexec=5Fctx_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Apr 2025 00:07:29 -0000
Message-ID: <174597164940.26095.16480885707600042655@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429092212.909040-1-pravalika.gurram@intel.com>
In-Reply-To: <20250429092212.909040-1-pravalika.gurram@intel.com>
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

Series: benchmarks: create xe_exec_ctx (rev4)
URL   : https://patchwork.freedesktop.org/series/147897/
State : failure

== Summary ==

Applying: benchmarks: create xe_exec_ctx
Using index info to reconstruct a base tree...
M	benchmarks/meson.build
Falling back to patching base and 3-way merge...
CONFLICT (add/add): Merge conflict in benchmarks/xe_exec_ctx.c
Auto-merging benchmarks/xe_exec_ctx.c
Auto-merging benchmarks/meson.build
CONFLICT (content): Merge conflict in benchmarks/meson.build
Patch failed at 0001 benchmarks: create xe_exec_ctx
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


