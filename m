Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C675CD98F2
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 14:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77DE10F632;
	Fri, 19 Jun 2026 14:19:45 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A0310F631;
 Fri, 19 Jun 2026 14:19:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Test_panthor_sparse_mappi?=
 =?utf-8?q?ngs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 19 Jun 2026 14:19:20 -0000
Message-ID: <178187876001.96724.10559100857577766119@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260619-panthor-sparse-mappings-v3-0-cb6c230b6bc0@collabora.com>
In-Reply-To: <20260619-panthor-sparse-mappings-v3-0-cb6c230b6bc0@collabora.com>
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

Series: Test panthor sparse mappings (rev2)
URL   : https://patchwork.freedesktop.org/series/166234/
State : failure

== Summary ==

Applying: drm-uapi/panthor: sync with kernel 12cf826bf1dd
Applying: panthor: Add IGT library helper for Panthor sparse mappings
Using index info to reconstruct a base tree...
M	lib/igt_panthor.h
Falling back to patching base and 3-way merge...
Auto-merging lib/igt_panthor.h
CONFLICT (content): Merge conflict in lib/igt_panthor.h
Patch failed at 0002 panthor: Add IGT library helper for Panthor sparse mappings
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


