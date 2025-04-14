Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9985C369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 16:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6074B10E025;
	Mon, 14 Apr 2025 16:14:09 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6673410E025;
 Mon, 14 Apr 2025 16:14:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Prepare_lib/intel=5Fcompu?=
 =?utf-8?q?te_for_SVM/system_allocator=2C_part_2_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 14 Apr 2025 16:14:07 -0000
Message-ID: <174464724741.2546.3047857365314281125@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250402152256.173562-1-francois.dugast@intel.com>
In-Reply-To: <20250402152256.173562-1-francois.dugast@intel.com>
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

Series: Prepare lib/intel_compute for SVM/system allocator, part 2 (rev3)
URL   : https://patchwork.freedesktop.org/series/146146/
State : failure

== Summary ==

Applying: lib/intel_compute: Use common constant for surface state size
Applying: lib/intel_compute: Use common constant for dynamic state size
Applying: lib/intel_compute: Use common constant for indirect object size
Applying: lib/intel_compute: Use common constant for binding table size
Applying: lib/intel_compute: Use common constant for general state size
Applying: lib/intel_compute: Use constant for binding table address
Applying: lib/intel_compute: Compact memory map
Applying: lib/intel_compute: Relocate input and output objects
Applying: lib/intel_compute: Fix enqueued local size starting with xelpg
Applying: lib/intel_compute: Use constants for thread groups and local work size
Using index info to reconstruct a base tree...
M	lib/intel_compute.c
Falling back to patching base and 3-way merge...
Auto-merging lib/intel_compute.c
CONFLICT (content): Merge conflict in lib/intel_compute.c
Patch failed at 0010 lib/intel_compute: Use constants for thread groups and local work size
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


