Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DD3CAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 21:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314EC10EA9E;
	Fri, 19 Sep 2025 21:47:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DBA10EA9A;
 Fri, 19 Sep 2025 21:47:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Refine_VCN_test_skip_cond?=
 =?utf-8?q?ition_to_target_RX_7600_=28GFX12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 19 Sep 2025 21:47:21 -0000
Message-ID: <175831844107.350368.17267198751634319503@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250919191736.90385-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250919191736.90385-1-vitaly.prosyak@amd.com>
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

Series: Refine VCN test skip condition to target RX 7600 (GFX12)
URL   : https://patchwork.freedesktop.org/series/154793/
State : failure

== Summary ==

Applying: Refine VCN test skip condition to target RX 7600 (GFX12)
Using index info to reconstruct a base tree...
M	lib/amdgpu/amd_vcn_shared.c
Falling back to patching base and 3-way merge...
Auto-merging lib/amdgpu/amd_vcn_shared.c
CONFLICT (content): Merge conflict in lib/amdgpu/amd_vcn_shared.c
Patch failed at 0001 Refine VCN test skip condition to target RX 7600 (GFX12)
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


