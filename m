Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001BAC7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 09:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13A510E05B;
	Mon, 23 Jun 2025 09:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jg29z6YR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548CF10E05B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750672753; x=1782208753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/r1NypUK2NUsPj/6neMLw35L5mNmcI1pDMlU+mevUcc=;
 b=jg29z6YRqPRsScptQYKz8CFwafyLRpmMlydBbdA18lHXoXNdKTM2IlOn
 /2s/x8wDxx3WMgZFAHB4NtxcZ1pAV0FPFNsyImxBdGEa883BkQnUb0xM4
 o3Xvggl0n2DKNXKcXPISPlVoOfumM9MBu8vVcTaykWivwoyY1SNAkZh10
 qp6SVZ8ccuH4YqKD4IHFemQfftbiW+/VsMEbkb/7U3fzDdbB8bJ24FDNX
 LnkUjso6COA6jauB2/UWRmF//FVD/TvcFj6pYEbKR1YgxPmerc/G7icXG
 HoeT6oo/orGZXI7biZUoos6ADZJiAwQbeCaR+Z15hhvkEg64i6iHqgNwa Q==;
X-CSE-ConnectionGUID: +a9Z3DjIRG24776mEl/8kg==
X-CSE-MsgGUID: PgsaSj3HS2+cwGy+rhy7Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="63477798"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="63477798"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:59:12 -0700
X-CSE-ConnectionGUID: /I5W3ncoRI+l33EUvLP6dQ==
X-CSE-MsgGUID: gZ7Qh6qqT7SQXEgRkQRzBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="155562469"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:59:11 -0700
Date: Mon, 23 Jun 2025 11:59:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] README.md: Update oneliner build command
Message-ID: <20250623095908.e4pggpbi3xx4caok@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20250618230257.1721932-1-alex.hung@amd.com>
 <175033702686.1504.17422631719024862630@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175033702686.1504.17422631719024862630@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Gustavo,
On 2025-06-19 at 09:43:46 -0300, Gustavo Sousa wrote:
> Quoting Alex Hung (2025-06-18 20:02:57-03:00)
> >This fixes the following warning:
> >
> >WARNING: Running the setup command as `meson [options]` instead of
> >`meson setup [options]` is ambiguous and deprecated.

Good catch! Thank you for fixing this.

> >
> >Signed-off-by: Alex Hung <alex.hung@amd.com>
> 
> Looks good, so
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> That said, perhaps we could take this opportunity to fix other
> occurrences as well? There is another one in README.md and others in
> .gitlab-ci.yml and meson.sh.

as for .gitlab-ci.yml it is already fixed with commit f6913a8b86b3
Author: Andrzej Hajda <andrzej.hajda@intel.com>
Date:   Fri Jun 13 16:30:49 2025 +0200

    gitlab-ci: correct meson setup commands

meson.sh was also fixed some time ago.

Thank you for review, I will merge it soon.

Regards,
Kamil

> 
> Quickly doing a git log on meson's manpage file, the setup command is
> available since at least 2017[1]. So perhaps updating .gitlab-ci.yml to
> use the "setup" should be fine?
> 
> [1] https://github.com/mesonbuild/meson/commit/d82c7e3c23ce6f3b0b68aea034c3f9d4d7b68935
> 
> --
> Gustavo Sousa
> 
> >---
> > README.md | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/README.md b/README.md
> >index 9cef60d88..ed6647726 100644
> >--- a/README.md
> >+++ b/README.md
> >@@ -37,7 +37,7 @@ Building
> > 
> > Oneliner to get started:
> > 
> >-    $ meson build && ninja -C build
> >+    $ meson setup build && ninja -C build
> > 
> > Note that meson insist on separate build directories from the source tree.
> > 
> >-- 
> >2.43.0
> >
