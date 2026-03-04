Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDB3EDEBF5
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 00:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBB810E8F7;
	Wed,  4 Mar 2026 00:04:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD9F10E8F7;
 Wed,  4 Mar 2026 00:04:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Validate_compute_walker_n?=
 =?utf-8?q?otification_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Mar 2026 00:04:33 -0000
Message-ID: <177258267354.310842.8179179073105251912@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303064451.1685885-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20260303064451.1685885-1-priyanka.dandamudi@intel.com>
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

Series: Validate compute walker notification (rev2)
URL   : https://patchwork.freedesktop.org/series/162468/
State : failure

== Summary ==

Applying: lib/gpu_cmds: Add support for compute walker interrupt
Using index info to reconstruct a base tree...
M	lib/gpgpu_shader.c
M	lib/gpu_cmds.c
M	lib/gpu_cmds.h
Falling back to patching base and 3-way merge...
Auto-merging lib/gpu_cmds.h
CONFLICT (content): Merge conflict in lib/gpu_cmds.h
Auto-merging lib/gpu_cmds.c
CONFLICT (content): Merge conflict in lib/gpu_cmds.c
Auto-merging lib/gpgpu_shader.c
CONFLICT (content): Merge conflict in lib/gpgpu_shader.c
Patch failed at 0001 lib/gpu_cmds: Add support for compute walker interrupt
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


