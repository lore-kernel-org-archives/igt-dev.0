Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA72CCA46C
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092A310FC0C;
	Fri, 16 Oct 2026 15:06:29 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC70E112886;
 Fri, 16 Oct 2026 15:05:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Ignore_AER_error_and_reco?=
 =?utf-8?q?very_messages_in_dmesg?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 16 Oct 2026 15:05:41 -0000
Message-ID: <179216314183.35512.17695629673806925919@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016115320.920094-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20261016115320.920094-1-ravi.kishore.koppuravuri@intel.com>
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

Series: Ignore AER error and recovery messages in dmesg
URL   : https://patchwork.freedesktop.org/series/176295/
State : failure

== Summary ==

Applying: tests/intel/xe_err_injection: regex to ignore AER messages in dmesg
Using index info to reconstruct a base tree...
A	tests/intel/xe_err_injection.c
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): tests/intel/xe_err_injection.c deleted in HEAD and modified in tests/intel/xe_err_injection: regex to ignore AER messages in dmesg. Version tests/intel/xe_err_injection: regex to ignore AER messages in dmesg of tests/intel/xe_err_injection.c left in tree.
Patch failed at 0001 tests/intel/xe_err_injection: regex to ignore AER messages in dmesg
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


