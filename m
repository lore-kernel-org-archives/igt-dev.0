Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C76606A31C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kGmF+tbc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17CA10E1B6;
	Mon,  9 Nov 2026 11:42:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034B410F1D3
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 11:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794224500; x=1825760500;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7iOZyjLrdJ5bBMObdMMf0jaTgJ41L3odXlhv0aQYKG8=;
 b=kGmF+tbcXbSXqjuEJCOl+l2KHjTYcdxJaoV7PSLCdkEJilWEXGm5HcxC
 LxC+m0fdQJ53HzoLlSEF5nKXlnNK/8lhBMBGuE1027CCxzyZbCyylVio3
 Ll6/9JdMQ43anxDvF90JQ6rO+J7IcQZWuxr4XH8yhGRFt8pJh0Qpg537d
 u3nVlvfYNBdaAu9IujWvuUnR0MPTl8mIWdgdyXVKS0pqn0HpfdtWWVOxF
 iszkzKejmbjzrfsCLgo9n0OBLZPVDjWP0VdcqE5ZH/BpDFfV6SLejxl7I
 HDnw7ejNXebI1TKN3XcDW4ChOTOQQ+tOfyE7u1AgjP2UvTmPYcVY3iJM8 Q==;
X-CSE-ConnectionGUID: /WQXGjiRSLiNmpD1BLgm1g==
X-CSE-MsgGUID: r7UlQOnmQzyD0ct8FBHtpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2938903"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2938903"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:41:39 -0800
X-CSE-ConnectionGUID: p6yWmx8ASsaEpFmvAR8gAQ==
X-CSE-MsgGUID: nj9ihwz6QWCqFj+smYmtFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8283352"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:41:39 -0800
Date: Mon, 9 Nov 2026 12:41:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: drop xe_wopcm_init
 subtest
Message-ID: <konqsjezkaa5s64cdiubhhpjocogzasdijghpeg76oyoyyl7cd@iinbi7wabndq>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20261105232545.359318-2-daniele.ceraolospurio@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105232545.359318-2-daniele.ceraolospurio@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Daniele,
On 2026-11-05 at 23:25:46 +0000, Daniele Ceraolo Spurio wrote:
> The xe_wopcm_init function is being removed from the kernel because the
> wopcm handling is being simplified [1], so drop the matching test as it
> it no longer applicable.
> 
> [1] https://lore.kernel.org/intel-xe/20261105004254.262075-4-daniele.ceraolospurio@intel.com/
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_fault_injection.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index e32f841a3..e0a461820 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -260,7 +260,6 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
>   * @xe_tile_init_early:			xe_tile_init_early
>   * @xe_uc_fw_init:			xe_uc_fw_init
>   * @xe_wa_gt_init:			xe_wa_gt_init
> - * @xe_wopcm_init:			xe_wopcm_init
>   */
>  static int
>  inject_fault_probe(const char pci_slot[], const char function_name[])
> @@ -585,7 +584,6 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>  		{ "xe_tile_init_early" },
>  		{ "xe_uc_fw_init" },
>  		{ "xe_wa_gt_init" },
> -		{ "xe_wopcm_init", 0, true },
>  		{ }
>  	};
>  	const struct section vm_create_fail_functions[] = {
> -- 
> 2.53.0
> 
