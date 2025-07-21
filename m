Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2144EC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 10:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FDD10E4CC;
	Mon, 21 Jul 2025 10:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bA5e5WYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE4F10E4CC
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753092931; x=1784628931;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IuKtbPG3ySVHP89PjZrz2kj0MjVBIteV6S71P0ORKuY=;
 b=bA5e5WYFUx8K5Jtw7FF1+CZfGXWpvy0ocyPelCrISwFaU7K6/v3lL+26
 wuoKjvilkPkuLskf9gQDOd1yQZU8Hus7gIFcYN8E+utyI3mMTGshMvEeO
 lVwdmCiE2dX8ioMgne3/WE5d5OMboxxbqnTglhqWcYgCOcc8RD0H6deee
 yDr4stZH5p3P05yooshpBBdnSG4Jf50CQdgsTAsIV7ulsRGp1RswNxppy
 lq15UEGdh1qHAQwx5sknsUb9t03yIrZf59rOdpIHtFbwn5/ujg/uy3VDv
 EzXocy7uu0hQGr7FrbyMzDpeTZi20VqOEXRKYeXxL/yITJi042ckssoXE w==;
X-CSE-ConnectionGUID: dBqjIYZcQbevC4lra+c78A==
X-CSE-MsgGUID: B6/dwA/DQuGBmjvEUyNGSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="54404098"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="54404098"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 03:15:31 -0700
X-CSE-ConnectionGUID: ++IP4oknRKSb41TpTXbGVg==
X-CSE-MsgGUID: BCp6UQJTQoGtNazYPcGdMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="159133673"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 03:15:30 -0700
Message-ID: <defc1511-c9a4-471c-af2d-0eb07261974e@linux.intel.com>
Date: Mon, 21 Jul 2025 12:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/3] meson: Fix warning
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
References: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
 <20250718151521.105886-4-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250718151521.105886-4-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 7/18/2025 5:15 PM, Kamil Konieczny wrote:
> There is now warning printed by meson:
> 
> WARNING: You should add the boolean check kwarg to the run_command call.
> 
> As after the run_command there is an explicit check for error,
> just inform meson to not make a check itself.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> ---
>  meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 4efad72cf..aeed3b1d2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -171,8 +171,8 @@ xmlrpc_client = dependency('xmlrpc_client', required : false)
>  
>  xmlrpc_cmd = find_program('xmlrpc-c-config', required : false)
>  if not xmlrpc.found() and xmlrpc_cmd.found()
> -	libs_cmd = run_command(xmlrpc_cmd, 'client', '--libs')
> -	cflags_cmd = run_command(xmlrpc_cmd, 'client', '--cflags')
> +	libs_cmd = run_command(xmlrpc_cmd, 'client', '--libs', check: false)
> +	cflags_cmd = run_command(xmlrpc_cmd, 'client', '--cflags', check: false)
>  
>  	if libs_cmd.returncode() == 0 and cflags_cmd.returncode() == 0
>  		xmlrpc = declare_dependency(compile_args: cflags_cmd.stdout().strip().split(),

