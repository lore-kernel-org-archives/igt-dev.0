Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2206C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 09:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5964310E801;
	Thu, 10 Apr 2025 09:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgYR4EPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CB010E801
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 09:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744276361; x=1775812361;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6Da78ajX9JKjGh6IOQAGYf2FH4Tz4pOKfu5n6iQDtlc=;
 b=lgYR4EPrxue9JicdGVvNOwuMVHOrDgFoucAQeGLn5nkS3RpPZQd1atZ4
 ryI9/GrrKqvT+CYqi7E1+Rdi2FhtnShFa8n2ezKDBUHsC2ImZHzjt6gYR
 HoYLm8Kx88UjAphqZ0krGgino7GyqTCiQ1p1wTvNM1Yn4iNNfNoEQKmua
 d0SomAKNftOoiQmXnIOOdngl/rB/My87I2ot7V9sxoOYVttyJ8OAuOidH
 7ewT6dkiurl/GQo+QMe893fVUCOn2do6R137F0XzioCfKq8NrLuREyAGj
 abhKi07jy5K7YwJq41icAjt7ypu6L1S9GWJG7k02/NDM5k7bhi/qZ/yrb A==;
X-CSE-ConnectionGUID: wb4mWhqvRgm+K1Odyliuog==
X-CSE-MsgGUID: thFv0NGwQIy/7VOMSlG8Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="71163607"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="71163607"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 02:12:40 -0700
X-CSE-ConnectionGUID: 1jLTuMIFR2+W5CsdrkGJ8g==
X-CSE-MsgGUID: lKotem3XTCuELx8kMx2RHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="128588752"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 02:12:39 -0700
Message-ID: <b27b886e-bf65-4225-8a9f-8fc1dd8943b1@linux.intel.com>
Date: Thu, 10 Apr 2025 11:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] runner/executor: sync outputs after tests end
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Krzysztof Karas <krzysztof.karas@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250409125543.49920-1-kamil.konieczny@linux.intel.com>
 <20250409125543.49920-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250409125543.49920-2-kamil.konieczny@linux.intel.com>
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


Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

On 4/9/2025 2:55 PM, Kamil Konieczny wrote:
> We observe that sometimes tests are reported as incomplete after
> a crash and there are more such incompletes before a one that
> caused actual crash. It turns out that there were missing ends
> of tests dmesg logs gathered in a test subdirectory. After cross
> checks with a global dmesg log saved outside of igt_runner, it
> seems that all tests before crushed one properly reported its end
> to kernel kmsg.
> 
>   Try to remediate this and create additional syncs for logs just
> after end of execution, with additional syncs for directories.
> 
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/executor.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 30e2420af..69227a5f2 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -615,6 +615,16 @@ void close_outputs(int *fds)
>  	}
>  }
>  
> +void fsync_outputs(int *fds)
> +{
> +	int i;
> +
> +	for (i = 0; i < _F_LAST; i++) {
> +		if (fds[i] >= 0)
> +			fsync(fds[i]);
> +	}
> +}
> +
>  const char *get_out_filename(int fid)
>  {
>  	if (fid >= 0 && fid < _F_LAST)
> @@ -1871,14 +1881,19 @@ static int execute_next_entry(struct execute_state *state,
>  out_kmsgfd:
>  	close(kmsgfd);
>  out_pipe:
> -	close_outputs(outputs);
>  	close(outpipe[0]);
>  	close(outpipe[1]);
>  	close(errpipe[0]);
>  	close(errpipe[1]);
> +	if (settings->sync)
> +		fsync_outputs(outputs);
>  	close_outputs(outputs);
>  out_dirfd:
> +	if (settings->sync)
> +		fsync(dirfd);
>  	close(dirfd);
> +	if (settings->sync)
> +		fsync(resdirfd);
>  
>  	return result;
>  }

