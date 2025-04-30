Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F74C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 00:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B1410E59A;
	Wed, 30 Apr 2025 00:08:45 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB6C10E596;
 Wed, 30 Apr 2025 00:08:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_benchmark=3A_Measure_allo?=
 =?utf-8?q?cation_time_for_objects_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Apr 2025 00:08:44 -0000
Message-ID: <174597172445.26095.10684906555983792685@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429095754.914809-1-pravalika.gurram@intel.com>
In-Reply-To: <20250429095754.914809-1-pravalika.gurram@intel.com>
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

Series: benchmark: Measure allocation time for objects (rev5)
URL   : https://patchwork.freedesktop.org/series/147869/
State : failure

== Summary ==

Applying: benchmark: Measure allocation time for objects
Using index info to reconstruct a base tree...
M	benchmarks/meson.build
Falling back to patching base and 3-way merge...
CONFLICT (add/add): Merge conflict in benchmarks/xe_create.c
Auto-merging benchmarks/xe_create.c
Auto-merging benchmarks/meson.build
CONFLICT (content): Merge conflict in benchmarks/meson.build
Patch failed at 0001 benchmark: Measure allocation time for objects
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


