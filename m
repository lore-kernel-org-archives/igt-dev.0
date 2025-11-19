Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E87CF6497
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 23:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD7110E6AB;
	Wed, 19 Nov 2025 23:43:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6F510E6AA;
 Wed, 19 Nov 2025 23:43:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tools/intel=5Fgpu=5Ffrequ?=
 =?utf-8?q?ency=3A_Add_multi-GT_support_and_Xe_driver_compatibility_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S Sebinraj" <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Nov 2025 23:43:42 -0000
Message-ID: <176359582282.11451.8338248285617468275@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251119204530.1357940-1-s.sebinraj@intel.com>
In-Reply-To: <20251119204530.1357940-1-s.sebinraj@intel.com>
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

Series: tools/intel_gpu_frequency: Add multi-GT support and Xe driver compatibility (rev2)
URL   : https://patchwork.freedesktop.org/series/156767/
State : failure

== Summary ==

Applying: tools/intel_gpu_frequency: Add support for get, set in order & vice-versa
Using index info to reconstruct a base tree...
M	tools/intel_gpu_frequency.c
Falling back to patching base and 3-way merge...
Auto-merging tools/intel_gpu_frequency.c
Applying: tools/intel_gpu_frequency: Add multi-GT support
Using index info to reconstruct a base tree...
M	lib/drmtest.c
M	tools/intel_gpu_frequency.c
Falling back to patching base and 3-way merge...
Auto-merging tools/intel_gpu_frequency.c
CONFLICT (content): Merge conflict in tools/intel_gpu_frequency.c
Auto-merging lib/drmtest.c
Patch failed at 0002 tools/intel_gpu_frequency: Add multi-GT support
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


