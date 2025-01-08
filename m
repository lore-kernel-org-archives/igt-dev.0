Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FD2E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 14:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0CB10E425;
	Wed,  8 Jan 2025 14:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YvEKhLG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E629A10E425
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736345839; x=1767881839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JriamMu60aBD6U5SIsW0AchSfZ56GDmuA1r7niuiSAg=;
 b=YvEKhLG+NJHc/eMg3991sgviyX5qm4JmnflpJbvhkPyBpVBE/j6Rx4aJ
 ABu6MSYaOo77LqVsyx/XNnquv1gTx86GikJTfK8v+F8VFvR3MP8Y3YYzO
 uRseP0ufCPHKQWluWAwwaWb4AHhlwWH9/J4i3cBQeFo7INltVilVZDGZ3
 eY5ZfaDCEqgdOkDFWDqoyAovWAymRA0wMJb4ZDo2tiWHpb+zlkdlPjLMv
 A80BLrPSqCiyzmtIbOqNZ3XbrepRqv51XjYEBc44Ja7rC2zlAvF5+vvpy
 8ZacN1kEPVlhoF8PF27dgJWur0g69H5DF5xcBQa3e13wNwk1gd3BA7VhU g==;
X-CSE-ConnectionGUID: sneV24vKRmGB+NtbPMomOw==
X-CSE-MsgGUID: 9UVea2eXTROffz8aFYJkBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36455607"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="36455607"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 06:17:17 -0800
X-CSE-ConnectionGUID: np4T4SQaQq2gHsFknl0Gkw==
X-CSE-MsgGUID: WOUssbVHSVeYQNla2wW5ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103963237"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.0])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 06:17:16 -0800
Date: Wed, 8 Jan 2025 08:17:11 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: 20250106095154.243459-1-mohammed.thasleem@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com, 
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Message-ID: <b4aitou7fukjfswdetlijjsjumxru3rywl2x6uvy2eszefc4hs@2ndc6qjaeztj>
References: <20250108124637.291978-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250108124637.291978-1-mohammed.thasleem@intel.com>
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

On Wed, Jan 08, 2025 at 06:16:37PM +0530, Mohammed Thasleem wrote:
>Check ghe algo for the function called by ghe igt while compiling.
>
>v2: Update version check and remove warning message. (Lucas)
>    Print messae at api else check. (Kamil)
>
>Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>---
> meson.build | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/meson.build b/meson.build
>index 8b2a2a64a..6370887d6 100644
>--- a/meson.build
>+++ b/meson.build
>@@ -199,7 +199,17 @@ endif
>
> libghe = dependency('libghe', required : false)

this should be:
libghe = dependency('libghe', version : '>=0.2.0', required : false)
to be inline with how other dependencies are declared. No need to
special case this one. The output will be like this:

	...
	Run-time dependency xmlrpc found: NO (tried pkgconfig and cmake)
	Run-time dependency xmlrpc_util found: NO (tried pkgconfig and cmake)
	Run-time dependency xmlrpc_client found: NO (tried pkgconfig and cmake)
	Program xmlrpc-c-config found: NO
	Run-time dependency gsl found: NO (tried pkgconfig and cmake)
	Run-time dependency alsa found: NO (tried pkgconfig and cmake)
	Run-time dependency libcurl found: YES 8.5.0
	Run-time dependency libghe found: NO (tried pkgconfig and cmake)
	Run-time dependency threads found: YES
	...

This is the diff on top I used:

diff --git a/meson.build b/meson.build
index 6370887d6..0130f7205 100644
--- a/meson.build
+++ b/meson.build
@@ -197,19 +197,9 @@ else
  	chamelium = disabler()
  endif
  
-libghe = dependency('libghe', required : false)
+libghe = dependency('libghe', version : '>=0.2.0', required : false)
  if libghe.found()
-  if libghe.version().version_compare('>=0.2.0')
-
-    cc = meson.get_compiler('c')
-
-    if cc.has_function('histogram_compute_generate_data_bin', dependencies: libghe)
-      message('libghe provides the required function')
-      config.set('HAVE_LIBGHE', 1)
-    else
-      message ('libghe API changed')
-    endif
-  endif
+	config.set('HAVE_LIBGHE', 1)
  endif
  
  build_info += 'Build Chamelium test: @0@'.format(chamelium.found())



Lucas De Marchi
