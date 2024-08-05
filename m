Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFF0C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 08:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16FD10E154;
	Mon,  5 Aug 2024 08:28:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FCA10E008;
 Mon,  5 Aug 2024 08:28:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/amdgpu=3A_move_bad_?=
 =?utf-8?q?mem_compute_test_to_amd_deadlock?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 Aug 2024 08:28:12 -0000
Message-ID: <172284649281.539969.3928578614404298226@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240805065218.2399530-1-jesse.zhang@amd.com>
In-Reply-To: <20240805065218.2399530-1-jesse.zhang@amd.com>
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

Series: tests/amdgpu: move bad mem compute test to amd deadlock
URL   : https://patchwork.freedesktop.org/series/136877/
State : failure

== Summary ==

Applying: tests/amdgpu: move bad mem compute test to amd deadlock
Using index info to reconstruct a base tree...
A	tests/amdgpu/amd_queue_reset.c
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): tests/amdgpu/amd_queue_reset.c deleted in HEAD and modified in tests/amdgpu: move bad mem compute test to amd deadlock. Version tests/amdgpu: move bad mem compute test to amd deadlock of tests/amdgpu/amd_queue_reset.c left in tree.
Patch failed at 0001 tests/amdgpu: move bad mem compute test to amd deadlock
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


