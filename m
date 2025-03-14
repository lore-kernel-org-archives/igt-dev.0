Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28632C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 23:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE3910E111;
	Fri, 14 Mar 2025 23:39:45 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E9410E111;
 Fri, 14 Mar 2025 23:39:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/xe=5Foa=3A_Fi?=
 =?utf-8?q?x_=5F=5Ffor=5Fone=5Frender=5Fengine_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 14 Mar 2025 23:39:44 -0000
Message-ID: <174199558488.37705.1235994500080494231@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250314002058.220854-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250314002058.220854-1-ashutosh.dixit@intel.com>
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

Series: tests/intel/xe_oa: Fix __for_one_render_engine (rev2)
URL   : https://patchwork.freedesktop.org/series/146276/
State : failure

== Summary ==

Applying: tests/intel/xe_oa: Fix __for_one_render_engine
Applying: tests/intel/xe_oa: Don't limit sync tests to render engine
Applying: tests/amdgpu/amd_hotplug: Fix compile on Ubuntu 24
Using index info to reconstruct a base tree...
M	tests/amdgpu/amd_hotplug.c
Falling back to patching base and 3-way merge...
Auto-merging tests/amdgpu/amd_hotplug.c
CONFLICT (content): Merge conflict in tests/amdgpu/amd_hotplug.c
Patch failed at 0003 tests/amdgpu/amd_hotplug: Fix compile on Ubuntu 24
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


