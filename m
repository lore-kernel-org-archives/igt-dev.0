Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E6CD2C56D
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 15:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C9E10E1FC;
	Tue, 22 Oct 2024 15:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iu+9Z3R8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E0010E1FC
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729610932; x=1761146932;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/i/74a8Vj5Bmo1O5V26oQhTKywxx4FSQR2k+wuoX6V8=;
 b=iu+9Z3R8LdaXt+9mN95MULtMKc0MKNwmyZUtrhnbLkH6VQZy4VkRJ9wP
 u98UPHc3ir5qee1YX+j5vBl6LQ9HkWoKQ291GQAib/4E6/A4gKx26tTXW
 vGr7nyH4QAwcL5lZGkDQObnQCCL5ALzaerOZQCL3GjBWc4L/8AdAcRqdS
 LpHcH2kK6ZBg6LjTG4KsbOTC+1PlSt/JDQPbwVajII8Sp0PVal2L4zmEu
 vdM7nf+OLG8YlYRoE/ttpgLEHKZwN5qvwp8zt54yQ/KSgwRwR0rwyGlxc
 J5z0fRKVNC1WB37RHzl1lZ0VxpmFlfIMZcKO2jmzWgrI7M/ZCG+pOCroj g==;
X-CSE-ConnectionGUID: wrKxAv2pQ1C2regid9+Hhg==
X-CSE-MsgGUID: W9tiTk0STXGl2dK5K06pSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39775573"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="39775573"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:19:14 -0700
X-CSE-ConnectionGUID: 3dpKs0WSRTuKoO1vJSRJEg==
X-CSE-MsgGUID: GaouLwvtSJOqEsBSWEjUGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="110725179"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 08:19:12 -0700
Date: Tue, 22 Oct 2024 17:19:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v2 1/2] tests/chamelium/kms_chamelium_edid: Use
 extended flag to reduce the number of edid
Message-ID: <20241022151910.exybouw7m7bj6mec@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20241018035914.1740924-1-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018035914.1740924-1-pranay.samala@intel.com>
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

Hi Pranay,
On 2024-10-18 at 09:29:13 +0530, Pranay Samala wrote:
> This test iterates on all the available edids of HDMI.
> Due to CI test timeut limitation, we are reducing the
> number of edids to execute to avoid result as timeout.
> 
> Using extended flag to achieve this. The test will execute
> only 25 edids when this flag is not used as CI doesnt uses
> this flag.
> In local execution to execute on all edids, we have to give
> this flag at the runtime.
> 

+Cc Louis Chauvet <louis.chauvet@bootlin.com>

> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/chamelium/kms_chamelium_edid.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
> index 8438f5f15..1bdde1768 100644
> --- a/tests/chamelium/kms_chamelium_edid.c
> +++ b/tests/chamelium/kms_chamelium_edid.c
> @@ -122,6 +122,7 @@
>   */
>  
>  #define MODE_CLOCK_ACCURACY 0.05 /* 5% */
> +static bool extended;
>  
>  static void get_connectors_link_status_failed(chamelium_data_t *data,
>  					      bool *link_status_failed)
> @@ -273,6 +274,9 @@ static void edid_stress_resolution(chamelium_data_t *data,
>  			      data->ports, data->port_count);
>  
>  
> +	if (!extended)
> +		edids_list_len = 25;
> +
>  	for (i = 0; i < edids_list_len; ++i) {
>  		struct chamelium_edid *chamelium_edid;
>  		drmModeModeInfo mode;
> @@ -504,8 +508,22 @@ static void test_mode_timings(chamelium_data_t *data,
>  	} while (++i < count_modes);
>  }
>  
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	switch (opt) {
> +	case 'e':
> +		extended = true;
> +		break;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =
> +	"  -e \tExtended tests.\n";
> +
>  IGT_TEST_DESCRIPTION("Testing EDID with a Chamelium board");
> -igt_main
> +igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  {
>  	chamelium_data_t data;
>  	struct chamelium_port *port;
> -- 
> 2.34.1
> 
