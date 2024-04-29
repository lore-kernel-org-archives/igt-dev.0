Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CCAC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 09:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B53112B5E;
	Mon, 29 Apr 2024 09:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijMj9w3j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483D3112B5E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714381605; x=1745917605;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SgWODzpa+qeaqI3k0yMGb6igsh3MV7Jgz8oZqPBfv5Y=;
 b=ijMj9w3jJTY4Px+ZGfWiCg1WzDjmmkdWkHw0bSFd5T4F+TnD2ZRmrLoB
 Wxl8W/JlFn1KRqOswjOvqF61RX2fkZqR63gYEphrJp+e7vgMOQE4VNrwR
 OjVA/ROD2qoACPP/ZTFvCAgC/3S7OnUH9Sxe0uvqgTXsjzQomtsuMAWUa
 s22F6mAEUyyKGegru7pZkBP+wlxyYnykgtIScgseeLQty2uvdKdgjdASu
 PQb95OFs00+IRStNMUQ7pTmWsmuwlYzcJ+pK0B77QpfKEW7ekvZXH5DdP
 +ISmiKk+enoQAqBJzUhizYDdVuymzFLgWJxJ34HO8EzsmfPGimFDllBEY g==;
X-CSE-ConnectionGUID: Jc5TRSGeSJG8Ri4mkcgn8Q==
X-CSE-MsgGUID: 2vrI1+V8Rt6DPOxz52Nq8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10571047"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="10571047"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:06:44 -0700
X-CSE-ConnectionGUID: DC0rLtp9TT2hQnzP3xattw==
X-CSE-MsgGUID: NH1XPKfgTMm9L1iOJuFTxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26564480"
Received: from aantonov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:06:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 1/2] intel_reg: Reorder commands and annotate ones
 needing reg spec
In-Reply-To: <20240426153352.3209972-1-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240426153352.3209972-1-lucas.demarchi@intel.com>
Date: Mon, 29 Apr 2024 12:06:40 +0300
Message-ID: <87mspc4jxb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 26 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Group together the commands that operate with a reg spec and annotate
> those that will implicitly enable a future --decode option.

The series LGTM,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Please follow-up with an update to man/intel_reg.rst.

Thanks,
Jani.

>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tools/intel_reg.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index aae5a2395..8f585e4bd 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -967,10 +967,16 @@ struct command {
>  	const char *name;
>  	const char *description;
>  	const char *synopsis;
> +	bool decode;
>  	int (*function)(struct config *config, int argc, char *argv[]);
>  };
>  
>  static const struct command commands[] = {
> +	{
> +		.name = "help",
> +		.function = intel_reg_help,
> +		.description = "show this help",
> +	},
>  	{
>  		.name = "read",
>  		.function = intel_reg_read,
> @@ -983,31 +989,29 @@ static const struct command commands[] = {
>  		.synopsis = "[--post] REGISTER VALUE [REGISTER VALUE ...]",
>  		.description = "write value(s) to specified register(s)",
>  	},
> +	{
> +		.name = "snapshot",
> +		.function = intel_reg_snapshot,
> +		.description = "create a snapshot of the MMIO bar to stdout",
> +	},
>  	{
>  		.name = "dump",
>  		.function = intel_reg_dump,
>  		.description = "dump all known registers",
> +		.decode = true,
>  	},
>  	{
>  		.name = "decode",
>  		.function = intel_reg_decode,
>  		.synopsis = "REGISTER VALUE [REGISTER VALUE ...]",
>  		.description = "decode value(s) for specified register(s)",
> -	},
> -	{
> -		.name = "snapshot",
> -		.function = intel_reg_snapshot,
> -		.description = "create a snapshot of the MMIO bar to stdout",
> +		.decode = true,
>  	},
>  	{
>  		.name = "list",
>  		.function = intel_reg_list,
>  		.description = "list all known register names",
> -	},
> -	{
> -		.name = "help",
> -		.function = intel_reg_help,
> -		.description = "show this help",
> +		.decode = true,
>  	},
>  };

-- 
Jani Nikula, Intel
