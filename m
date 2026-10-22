Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C01606A31B
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=entJK4eZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0283310E3C7;
	Thu, 22 Oct 2026 12:49:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B71D1125D4
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792673303; x=1824209303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m15VSSGQnBPbnqh/kCKuhz6RachE1BXsw2zFq/5kpu4=;
 b=entJK4eZiyjGOjqAvTJh2tpg80y3KSsHS+jv1YpySSlufDLCWkL8MRcH
 wfP4inxvZ9ipvpZO1/nAQHdxXWRKLuQu0qTx19Iqtcn/+MRJRbCoDOz1s
 og6ISaTlQkxpE7tqzkYk0Qb/fgmYKikL7UhlAkis2P/C2McNeePDiAKK6
 V2RxRthXXrui3tl1NToKTxn0qerj5BenlCNw7vC/YG21BmflU14HyvPcG
 ml7ugTNHso4P10cM/o9WFUKROOOrcNHMCdEyzSHRlnlVcaBGax8+aAbvs
 B2DrCyA+W028aOO1K9y3hYfwe3H97p5Nznbg/8rA7mg+jkcASOVZaoI23 Q==;
X-CSE-ConnectionGUID: zIxnICtaSOqk9LOLtj12Iw==
X-CSE-MsgGUID: flSluTIISHeTV/F0ZkrgQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1408032"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1408032"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:48:23 -0700
X-CSE-ConnectionGUID: 4JP3AxcwR5aOFZ7/LT1N6w==
X-CSE-MsgGUID: 6L3667IwQGGvQ5D7eGC8/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="5196875"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:48:21 -0700
Date: Thu, 22 Oct 2026 14:48:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 priyanka.dandamudi@intel.com, daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v2 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
Message-ID: <20261022124818.byby7zk2uy3w2nhy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com, priyanka.dandamudi@intel.com,
 daniele.ceraolospurio@intel.com
References: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
 <20261022054420.180035-2-shivtej.eknath.patil@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022054420.180035-2-shivtej.eknath.patil@intel.com>
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

Hi shivtej.eknath.patil,
On 2026-10-22 at 05:44:19 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 

please improve subject, imho it should have 'intel/' prefix,
also add space afetr ':', so it will be:

[PATCH v2 1/2] tests/intel/xe_pxp: add coverage for xe_pxp_debugfs

> Add a new test to exercise the following functions in
> xe_pxp_debugfs.c:
> 
> - pxp_status_to_str()
> - pxp_info()

Those function should alredy be covered by core_debugfs@read-all
If it is not, please look and help fix that test.

> 
> The subtest verifies that the pxp/info debugfs entry can be
> read successfully and improves code coverage.

What is really added here is printing that info, code_debugs
do not know types of readed debugfs nodes, so it do not print
any.

> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel/xe_pxp.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 5460bf6db..76a3939c0 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -506,6 +506,28 @@ static void trigger_pxp_debugfs_forced_teardown(int xe_fd)
>  	sleep(1);
>  }
>  
> +/**
> + * SUBTEST: pxp-debugfs-info
> + * Description: Verify reading of the PXP debugfs info entry.
> + */
> +
> +static void read_pxp_debugfs_info(int xe_fd)
> +{
> +	char str[256];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_dir(xe_fd);
> +	igt_assert(fd >= 0);
> +
> +	ret = igt_debugfs_simple_read(fd, "pxp/info", str, sizeof(str));
> +	igt_assert_f(ret > 0, "Can't read pxp info debugfs\n");
> +
> +	igt_info("pxp info:\n%s\n", str);
> +
> +	close(fd);
> +}
> +
>  enum termination_type {
>  	PXP_TERMINATION_IRQ,
>  	PXP_TERMINATION_RPM,
> @@ -762,6 +784,7 @@ static void test_pxp_stale_queue_execution(int fd, enum termination_type type)
>   * Description: verify that submssions with stale objects/queues are not blocked
>   *              if the user does not opt-in to the PXP checks.
>   */
> +

Please remove this, do not introduce unrelated changes.
Please fix this and resend, imho you can keep r-b from Priyanka.

Regards,
Kamil

>  static void test_pxp_optout(int fd)
>  {
>  	__test_pxp_stale_bo_exec(fd, PXP_TERMINATION_IRQ, false);
> @@ -1157,6 +1180,11 @@ int igt_main()
>  			require_pxp(pxp_supported);
>  			test_pxp_optout(xe_fd);
>  		}
> +
> +		igt_subtest("pxp-debugfs-info") {
> +			require_pxp(pxp_supported);
> +			read_pxp_debugfs_info(xe_fd);
> +		}
>  	}
>  
>  	igt_subtest_group() {
> -- 
> 2.43.0
> 
