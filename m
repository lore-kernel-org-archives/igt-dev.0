Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5C3C61DBD
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 17:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CDD10E04D;
	Fri, 28 Aug 2026 17:50:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D522310E04D;
 Fri, 28 Aug 2026 17:49:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Validate_CPER_record_head?=
 =?utf-8?q?ers_captured_via_tracefs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 28 Aug 2026 17:49:47 -0000
Message-ID: <178793938786.97025.12477830491412507419@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260828170439.204268-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20260828170439.204268-1-ravi.kishore.koppuravuri@intel.com>
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

Series: Validate CPER record headers captured via tracefs (rev2)
URL   : https://patchwork.freedesktop.org/series/172806/
State : failure

== Summary ==

Applying: tests/xe_err_injection: validate CPER tracefs event format
Using index info to reconstruct a base tree...
A	tests/intel/xe_err_injection.c
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): tests/intel/xe_err_injection.c deleted in HEAD and modified in tests/xe_err_injection: validate CPER tracefs event format. Version tests/xe_err_injection: validate CPER tracefs event format of tests/intel/xe_err_injection.c left in tree.
Patch failed at 0001 tests/xe_err_injection: validate CPER tracefs event format
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


