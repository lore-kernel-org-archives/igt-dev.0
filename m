Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ED7C83F07
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 15:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EA110E4DA;
	Mon,  7 Jul 2025 15:41:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC4510E4DD;
 Mon,  7 Jul 2025 15:41:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2Cv6=2C1/1=5D_tests/intel/xe=5Fcompute=3A_Add_Compute_worklo?=
 =?utf-8?q?ad_Scheduling_and_Display_EU_busyness?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 07 Jul 2025 15:41:10 -0000
Message-ID: <175190287016.140266.17911503251090167791@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707135916.379631-1-nishit.sharma@intel.com>
In-Reply-To: <20250707135916.379631-1-nishit.sharma@intel.com>
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

Series: series starting with [i-g-t,v6,1/1] tests/intel/xe_compute: Add Compute workload Scheduling and Display EU busyness
URL   : https://patchwork.freedesktop.org/series/151272/
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


