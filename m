Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8CEC52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 19:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2834810EBE3;
	Thu, 22 Aug 2024 19:46:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A4F10EBE3;
 Thu, 22 Aug 2024 19:46:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Switch_the_FFT_library_fr?=
 =?utf-8?q?om_GSL_to_meow=5Ffft_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ryszard Knop" <ryszard.knop@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Aug 2024 19:46:02 -0000
Message-ID: <172435596215.726612.893254662862817626@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20220809121801.1044402-1-ryszard.knop@intel.com>
In-Reply-To: <20220809121801.1044402-1-ryszard.knop@intel.com>
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

Series: Switch the FFT library from GSL to meow_fft (rev2)
URL   : https://patchwork.freedesktop.org/series/107093/
State : failure

== Summary ==

Applying: lib/uwildmat: Move to a dedicated vendored library directory
Using index info to reconstruct a base tree...
M	lib/meson.build
Falling back to patching base and 3-way merge...
Auto-merging lib/meson.build
CONFLICT (content): Merge conflict in lib/meson.build
Patch failed at 0001 lib/uwildmat: Move to a dedicated vendored library directory
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


