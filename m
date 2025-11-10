Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D882CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 23:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3898510E101;
	Mon, 10 Nov 2025 23:47:33 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B123010E039;
 Mon, 10 Nov 2025 23:47:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/amdgpu/amd=5Fbo=3A_?=
 =?utf-8?q?Add_UMQ-based_HDP_flush_VRAM=E2=86=92GTT_coherency_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Srinivasan Shanmugam" <srinivasan.shanmugam@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 10 Nov 2025 23:47:32 -0000
Message-ID: <176281845271.38378.5527370931079274074@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251110170018.43649-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20251110170018.43649-1-srinivasan.shanmugam@amd.com>
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

Series: tests/amdgpu/amd_bo: Add UMQ-based HDP flush VRAM→GTT coherency test
URL   : https://patchwork.freedesktop.org/series/157340/
State : failure

== Summary ==

Applying: tests/amdgpu/amd_bo: Add UMQ-based HDP flush VRAM→GTT coherency test
Using index info to reconstruct a base tree...
M	tests/amdgpu/amd_bo.c
Falling back to patching base and 3-way merge...
Auto-merging tests/amdgpu/amd_bo.c
CONFLICT (content): Merge conflict in tests/amdgpu/amd_bo.c
Patch failed at 0001 tests/amdgpu/amd_bo: Add UMQ-based HDP flush VRAM→GTT coherency test
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


