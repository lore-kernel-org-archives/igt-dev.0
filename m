Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2286CD6E79
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 19:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6131110F902;
	Mon,  8 Jun 2026 19:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqJdqS4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD1210F909
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 19:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780946658; x=1812482658;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xG5w2QlRAaoprrbgvcBaHRLTfZnu1eJP79gE4Na8R58=;
 b=QqJdqS4nezrUxkbRj22WU2Dm4CL3TazqAr8pNysVjnXMdaUGTTwZQg3r
 cVYaK4BXLZdb/OHH05p5TgGCw0lFYq7pwW4mn/0gnS/eVf/qZWJmFKRR2
 erTYNdRKIXXdnclxuhlBjPZzA3nvPTfNx1h8lClWWUbn74o/2fJbNywez
 17b9wlEHyZruc+HRIGX0SXTuVx5/1kvvRG/b8/tjJtEeM/m749wNUYqv1
 YlTjMjRkvDiRvGQBP3yRZ7k6TaUVx2BiuQVx99+dc+L20vnuX9H9p8UqY
 g+DFJyr/ckJnrN9WdNE4/qxOom7/gwtLdjpttJoSxzFKri3o2/l8WSOV9 Q==;
X-CSE-ConnectionGUID: 8b2TUy01RKyvfGir/rxh0g==
X-CSE-MsgGUID: 6GNTUD07TY+GVnJDB4w6Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81694623"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81694623"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:24:17 -0700
X-CSE-ConnectionGUID: Vg8Wq+8MTTeX60LqavU/HA==
X-CSE-MsgGUID: kQblLLJXTBy7sFFOuyoIeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="241202489"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.118])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:24:16 -0700
Date: Mon, 8 Jun 2026 21:24:13 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] docs/reference: Build generated XMLs by default,
 depend on testlists
Message-ID: <duexlxmnmqr256xnibgjzo7du75wkokxyd2pvr7u2zsly6jtet@gltv52q4hrws>
References: <20260608161712.988575-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608161712.988575-1-ryszard.knop@intel.com>
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

On Mon, Jun 08, 2026 at 06:17:07PM +0200, Ryszard Knop wrote:
> The gnome.gtkdoc target does not correctly declare dependencies on its
> content_files (see mesonbuild/meson#2831 for more info), which prevents
> the declared custom targets from running. Until recently this caused the
> specified sections to be missing, but the overall build/install was OK.
> 
> Warnings like `element include: XInclude error : could not load [X].xml,
> and no fallback was found` were generated but not printed in build logs,
> because the gtkdoc binaries were invoked in a wrapper which prints the
> output only if the executed binary returns a non-zero code.
> 
> Newer libxslt/libxml2 versions dislike missing XIncludes and fail the
> build. Fixing these generated sections fixes the build on newer distros.

LGTM, works on Ubuntu 24.04 and 26.04, so from me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  docs/reference/igt-gpu-tools/meson.build | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
> index 8d70a49b8918..2c65155b7f21 100644
> --- a/docs/reference/igt-gpu-tools/meson.build
> +++ b/docs/reference/igt-gpu-tools/meson.build
> @@ -56,13 +56,16 @@ configure_file(input: 'version.xml.in',
>  foreach group : test_groups
>  	programs_xml = 'igt_test_programs_' + group + '_programs.xml'
>  	generated_docs += custom_target(programs_xml,
> +		      build_by_default : true,
>  		      output : programs_xml,
> +		      depends : test_list_target,
>  		      command : [ gen_programs, '@OUTPUT@', group, test_list_target ])
>  
>  	description_xml = 'igt_test_programs_' + group + '_description.xml'
>  	generated_docs += custom_target(description_xml,
> +		      build_by_default : true,
>  		      output : description_xml,
> -		      depends : test_executables,
> +		      depends : test_executables + test_list_target,
>  		      command : [ gen_description, '@OUTPUT@', group, test_list_target ])
>  endforeach
>  
> -- 
> 2.54.0
> 
