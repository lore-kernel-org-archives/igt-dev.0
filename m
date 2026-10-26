Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5D26072CA1
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 11:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1km5K7i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC4A10E1B8;
	Mon, 26 Oct 2026 11:31:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4895C10E1B8
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 11:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793014234; x=1824550234;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5BP3YDYwDnkpj5RrzyFmXxMQ2ErOMSms5t37UsT+LRw=;
 b=d1km5K7itOVSvnL1W4Qu3YTZPRzHg+sq9cLTpo4QDnabEs9sXqA4OfIq
 vpPSiyLoO0eN1x1CVClej/N+3sXGEjhY/qOeDjBgXsmbEvrLsgNCyS7K+
 n+1BcDuoFVv8CSFX8tA2nVAE0caPzcFrOY7iXHWtHiw7m6MBjpTvCKIu9
 +Oih9u3NbJjOe88y3iZt09vNWpVQ0nHEbN0xCcx29immQWsQQwjPGVNKG
 dSNH8VIFwD7xrlBuPghN8gAk/nVrV6y6tPbaL0Cy9QGir8byoPg3zmne5
 wlcjgUbRGLiEJXI8+wWZGYi7FOOGMQjMgyc3cd5tbUPWViVUUguAGpllp Q==;
X-CSE-ConnectionGUID: 03cB6rb6TeOZko7imOC43Q==
X-CSE-MsgGUID: SOu3kELdReGXivD97c3aKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1553184"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1553184"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:30:33 -0700
X-CSE-ConnectionGUID: wSMglChHQk2OQbvHKklbig==
X-CSE-MsgGUID: oUnScgcyQ9OBBDAexhEWpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4253462"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:30:31 -0700
Date: Mon, 26 Oct 2026 12:30:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 priyanka.dandamudi@intel.com, daniele.ceraolospurio@intel.com,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: Re: [PATCH v3 1/1] tests/intel/xe_pxp: add coverage for xe_pxp_debugfs
Message-ID: <20261026113028.o5kqhum4meksi4l6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com, priyanka.dandamudi@intel.com,
 daniele.ceraolospurio@intel.com,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
References: <20261023052644.192314-1-shivtej.eknath.patil@intel.com>
 <20261023052644.192314-2-shivtej.eknath.patil@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023052644.192314-2-shivtej.eknath.patil@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi shivtej.eknath.patil,
On 2026-10-23 at 05:26:44 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> Add a new xe_pxp subtest that reads the pxp/info debugfs entry
> and verifies that the output can be read successfully.
> 
> Coverage analysis shows that pxp_info() and pxp_status_to_str()
> are not exercised by core_debugfs@read-all-entries. This subtest

I am not so sure it was it, please investigate this, also
+cc Jari
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>

Regards,
Kamil

PS. maybe adding some simple node printing to debugfs/sysfs
could help here.
Also, code coverage should run on machine with PXP to hit
desired kernel function(s).

> adds coverage for those code paths and logs the reported PXP
> information.
> 
> Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel/xe_pxp.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 5460bf6db..7c2edca47 100644
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
> @@ -1157,6 +1179,11 @@ int igt_main()
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
