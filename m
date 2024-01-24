Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C774C47DDF
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 12:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F4E10F753;
	Wed, 24 Jan 2024 12:26:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B4110F75C
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 12:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706099161; x=1737635161;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/LXZRospsr7qRaE+zbJLDKp4mbAeO68GXWVF0uEOagc=;
 b=GevncCLDTrfKN+I+YOSue9jympYSFWqJDEEHppy3dl7BBjGlqX4hre4d
 l8j+dEXKvTSqWzN+g8yabxBNUdS68KZiJu8yhnpXIKJlU0mA3YVDsLNDN
 6Pz0EdZnhQ9sZtKVjFBlWW0Sux1RMx0NYV8XC+fy5rkyIlAYOSvDvQCeM
 OoQ9mLM4BM8cR4yM1DvCyHKw+6gnZsKax6TsJiMiZgAlbklzgxjTQKoun
 IU1cHejcqW/eKat6ZcOD/hRhCZ3F9amLT6wiT7b63KmCzzxzmiujIUN+M
 Ww/AxYwDlWKXkKTtFL8LmQLUKODyszJsjwUqJN/HWfFJR4ZurLCRBVI1J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1717458"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1717458"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:25:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1915160"
Received: from wheelerj-mobl.ger.corp.intel.com (HELO [10.213.198.85])
 ([10.213.198.85])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:25:57 -0800
Message-ID: <5925d203-328e-44f0-9371-4de6c837ddf9@linux.intel.com>
Date: Wed, 24 Jan 2024 12:25:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] benchmarks/gem_wsim: Option to list physical
 engines
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240115154448.29263-1-marcin.bernatowicz@linux.intel.com>
 <20240115154448.29263-3-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240115154448.29263-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 15/01/2024 15:44, Marcin Bernatowicz wrote:
> Added command line option (-l) to list physical engines.

What is the use case and could you paste the example output please (both 
drivers if possible)?

Regards,

Tvrtko

> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index e79d26513..aa70b1770 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -2924,6 +2924,7 @@ static void print_help(void)
>   "  -f <scale>        Scale factor for batch durations.\n"
>   "  -F <scale>        Scale factor for delays.\n"
>   "  -L                List GPUs.\n"
> +"  -l                List physical engines.\n"
>   "  -D <gpu>          One of the GPUs from -L.\n"
>   	);
>   }
> @@ -2983,10 +2984,42 @@ add_workload_arg(struct w_arg *w_args, unsigned int nr_args, char *w_arg,
>   	return w_args;
>   }
>   
> +static void list_engines(void)
> +{
> +	struct intel_engines *engines = query_engines();
> +	int engine_class_count[NUM_ENGINE_CLASSES] = {};
> +	unsigned int i;
> +
> +	for (i = 0; i < engines->nr_engines; ++i) {
> +		igt_assert_lt(engines->engines[i].engine_class, NUM_ENGINE_CLASSES);
> +		engine_class_count[engines->engines[i].engine_class]++;
> +	}
> +
> +	for (i = 0; i < engines->nr_engines; ++i) {
> +		if (engine_class_count[engines->engines[i].engine_class] > 1)
> +			printf("%s%u",
> +			       intel_engine_class_string(engines->engines[i].engine_class),
> +			       engines->engines[i].engine_instance + 1);
> +		else
> +			printf("%s",
> +			       intel_engine_class_string(engines->engines[i].engine_class));
> +
> +		if (is_xe && engines->engines[i].gt_id)
> +			printf("-%u", engines->engines[i].gt_id);
> +
> +		if (verbose > 3)
> +			printf(" [%d:%d:%d]", engines->engines[i].engine_class,
> +			       engines->engines[i].engine_instance,
> +			       engines->engines[i].gt_id);
> +		printf("\n");
> +	}
> +}
> +
>   int main(int argc, char **argv)
>   {
>   	struct igt_device_card card = { };
>   	bool list_devices_arg = false;
> +	bool list_engines_arg = false;
>   	unsigned int repeat = 1;
>   	unsigned int clients = 1;
>   	unsigned int flags = 0;
> @@ -3009,11 +3042,14 @@ int main(int argc, char **argv)
>   	master_prng = time(NULL);
>   
>   	while ((c = getopt(argc, argv,
> -			   "LhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
> +			   "LlhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
>   		switch (c) {
>   		case 'L':
>   			list_devices_arg = true;
>   			break;
> +		case 'l':
> +			list_engines_arg = true;
> +			break;
>   		case 'D':
>   			device_arg = strdup(optarg);
>   			break;
> @@ -3134,6 +3170,11 @@ int main(int argc, char **argv)
>   	if (is_xe)
>   		xe_device_get(fd);
>   
> +	if (list_engines_arg) {
> +		list_engines();
> +		goto out;
> +	}
> +
>   	if (!nr_w_args) {
>   		wsim_err("No workload descriptor(s)!\n");
>   		goto err;
