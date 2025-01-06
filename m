Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45369E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 17:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE79210E990;
	Mon,  6 Jan 2025 17:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ED14jqpv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A224C10E990
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736183602; x=1767719602;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=44F8q4vbYkIsShGckxrgsG/lUiXKgA+2YgUepsqyw2M=;
 b=ED14jqpvAdb7OB1ehtEYtdN6xF2uwzja/s/AJlRr0APBdL7B2zNCsDvi
 ioYZF/c0dReCg4l4teQXpUVtDbFqZ7Qym8gDYxKtq75Z9z2jWOHLhIfGF
 hpQ7mcB8uMFKBSVpCYAW1JmC5JrScsxY0b5tRpMCp6iUAvy0oUTS32ssV
 9aW9UhEHDUrL7qeXzCl6xbXenBbW5TZYAljs8zg9Cmbk/1Tu/ebnmP7VX
 1LiBMSSut+eO/aDO83+XWYw0J2aImh7CnoOf1hCJMOkXhM4IIBW9/nE6a
 eIoUKH4/9b9o/mhL3tSwSOzzRVWyZKDOIuOR7p+aa/FG5U+0EVKfx/dCX A==;
X-CSE-ConnectionGUID: WevFK7/oT5mCdmOnRlJe5A==
X-CSE-MsgGUID: Hz2vxuk2QcmWpM+YFGbYdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40280212"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="40280212"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 09:13:21 -0800
X-CSE-ConnectionGUID: wdIo4k93Q7aJVe5IuyFJag==
X-CSE-MsgGUID: e1iyTmJuQtqzT6oMGOsBdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="102582886"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 09:13:21 -0800
Date: Mon, 6 Jan 2025 11:13:14 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>, 
 Nemesa Garg <nemesa.garg@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Message-ID: <svjcmyxrz4bc4n3evwcgqh3tfom75qykr6ficl2npsha42mcib@op5fdovzjkss>
References: <20250106095154.243459-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250106095154.243459-1-mohammed.thasleem@intel.com>
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

On Mon, Jan 06, 2025 at 03:21:54PM +0530, Mohammed Thasleem wrote:
>Check ghe algo for the function called by ghe igt while compiling.
>
>Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>---
> meson.build | 13 ++++++++++++-
> 1 file changed, 12 insertions(+), 1 deletion(-)
>
>diff --git a/meson.build b/meson.build
>index 8b2a2a64a..96f010fe2 100644
>--- a/meson.build
>+++ b/meson.build
>@@ -198,8 +198,19 @@ else
> endif
>
> libghe = dependency('libghe', required : false)
>+
> if libghe.found()
>-      config.set('HAVE_LIBGHE', 1)
>+
>+	cc = meson.get_compiler('c')
>+
>+	if cc.has_function('histogram_compute_generate_data_bin', dependencies: libghe)
>+		message('libghe provides the required function')
>+		config.set('HAVE_LIBGHE', 1)
>+	else
>+	warning('libghe does not provide the required function')
>+	endif

what's the a proper libghe that provide histogram_compute_generate_data_bin()
and how were things tested? If there is libghe available, build is just
broken.

Ideally we'd have something like is done for other libraries.

	libghe = dependency('libghe', version : '>=0.2', required : false)

However, looking at https://github.com/intel/ghe, there's no such
function, which leads me to think this call is actually a typo to
something else like set_histogram_data_bin()?

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Nemesa Garg <nemesa.garg@intel.com>

>+else
>+	warning('libghe not found')

no warning should be added here, like it's not added for the multiple
other libraries.

Lucas De Marchi

> endif
>
> build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
>-- 
>2.25.1
>
