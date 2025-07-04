Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE84C8303D
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 15:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3163C10E06E;
	Fri,  4 Jul 2025 15:13:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0669E10E06E;
 Fri,  4 Jul 2025 15:13:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/xe=5Fcompute?=
 =?utf-8?q?=3A_Add_Compute_workload_Scheduling_and_Display_EU_busyness_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 04 Jul 2025 15:13:43 -0000
Message-ID: <175164202301.136031.1245813084663580503@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250704133833.304517-1-nishit.sharma@intel.com>
In-Reply-To: <20250704133833.304517-1-nishit.sharma@intel.com>
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

Series: tests/intel/xe_compute: Add Compute workload Scheduling and Display EU busyness (rev2)
URL   : https://patchwork.freedesktop.org/series/151192/
State : failure

== Summary ==

Applying: tests/intel/xe_compute: Add Compute workload Scheduling and Display EU busyness
Using index info to reconstruct a base tree...
M	lib/intel_compute.c
M	tests/intel/xe_compute.c
M	tests/meson.build
Falling back to patching base and 3-way merge...
Auto-merging tests/meson.build
Auto-merging tests/intel/xe_compute.c
CONFLICT (content): Merge conflict in tests/intel/xe_compute.c
Auto-merging lib/intel_compute.c
Patch failed at 0001 tests/intel/xe_compute: Add Compute workload Scheduling and Display EU busyness
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


