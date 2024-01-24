Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6A7C47DDF
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 11:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCB410ECBA;
	Wed, 24 Jan 2024 11:41:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B6410ECBA
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 11:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706096504; x=1737632504;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=SmdCzGz2NBSTVwrjZO6rxYC7vfunYYEtVoUL3/3aoKQ=;
 b=lQtuAkc0IhFcU9v9ZfLU/U5P5jpqy81IX+k6vuRAOghEFYZOmOe2BHGw
 14OXlTulmJV+ggzox5k9QKMbXX//kzMJLXANkg7U5rb1geUDWuRZxvu/G
 wxm6XWYmhNnZv69JM+7pwcJjy4sLAa47fNCfHkizpyVKdPjBLVtneDXGh
 LIql0cerk3nVdAjplMLd9X8Yc+jtR+p7GihsTAuSIk6EKlJ53mnaIafuk
 xCcKgcAwVGhlSchsevsJrBNelAyK0AWrDrucO30N6oD3MOWbRhWydUXSk
 pjmegjMicZbGfWnSasc9nxT4VylEZb7EckyjpVw0zLTWGaiEHJzuexm/K g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401480433"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
 d="scan'208,217";a="401480433"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 03:41:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="735906958"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
 d="scan'208,217";a="735906958"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 03:41:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 03:41:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 03:41:41 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 03:41:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGPHdbrwENc9LnKLy0RITWKmJdF60VKB7ULwuafVxDIe533gBypCr3tSbKAOa1XQ/He/eYoVJwBt3LLX91Oie/r9c0fFwmB7UqXt7wIOC9lbtZ+/8Ovmd6bBMxQVgyHoWoMOQJav3Hr8Y//VHERdCW2H/pxcwwm/m78VJVm7DxrCbolwJ9EnK4z/q4OE/uH+GClCrtHbPM+F/QPsk6GajCUABHAj3RmSsqv+y/WfGNUKE1mRZs/1ha8DDB+BS2lFuK8hePyPgdIBZ1ZcGZlqjYS+pCLwhPJHOpZuFS6UWI7uIilkxw9TwNvCwbXDHyGQA3OFFUmRW+Ft9fDoaBxEQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMqc0kMOyjIpNgo7x2BXsWcs+LjuSSYueO9BzzFkETA=;
 b=bn873I2I1wdLew36OPKBYaKh80on8tWS6pGAbcL7jnp49ormq5jVWefEME2kbHNP8obQi0e1wc0dj811ie/OiLPdQ9ueYHBlNXjXhmyAWe1PEdoVdtIq8ql/OGKG8MPizF0XUheAIIhq4v16dl8OGRdgclRg4lk+UTt8NupGAFfVEMvb8IH8Dcar0OD9S+W6szs3yJzUaHDNmzFAETwdoXvTgx+YYCH5Yw+fk9EJZbXQ1ewxOogjFwhtbX4PFHgIvfFCWLtH5qRjqn6aCv912fSaw/dVxgbLO+S6SGt36ZyNgKn0inFuvNzCVn2j8KTGRHFXi0yDJiaJQUEL0kdmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 11:41:39 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::a905:b358:578c:5613]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::a905:b358:578c:5613%5]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 11:41:39 +0000
Content-Type: multipart/alternative;
 boundary="------------m3jJgHpdUUesnAK8xLZO0OMZ"
Message-ID: <0ae1d66f-df5d-4533-b9b5-b27f9fdb48a4@intel.com>
Date: Wed, 24 Jan 2024 12:41:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] benchmarks/gem_wsim: Option to list physical
 engines
Content-Language: pl
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240115154448.29263-1-marcin.bernatowicz@linux.intel.com>
 <20240115154448.29263-3-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20240115154448.29263-3-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: VI1PR0102CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::24) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CH3PR11MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a25f5c9-c65f-4783-07a1-08dc1cd16de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R9kBlfI/7Zgb83RtYhRXy0vi8ETWyo77Wh+P8mES1MSe7vK9Z4AYL2a2d7mJsyDZGQuLlIdeAnTGvwsTMzGgv2+EMwfTXkWyFPJnDKjV2x0ePlNBrH1PNDVfyoeDF4IVn/F9GlrqoykChTbGzk5m1STh1wwTbgQfsz9h33YogKbGMe5m3vENWyZnrXt0uGGhelGdzdQeTrAY0o0NLDr05K+05BXJeymLhpbLF1nlN25DiKVFrGHIy7ffXpqWt1SC49DFLz9t5sxfLcM6y/lt+rssh6mku6qNFBxaIC1cviX28ZK+tGwStPw/fNxK9lgoeU+BwANY0z0lQqeHmWC4BASwW1mbaxodln9LjjCrpgIwrPvsQ8/FaQJfJ194dAvkK+3roXbS1HzY99Yyv6FNO8cIV4rA1O5f8JkhHhIVCPSZxnNvThxUbugyGFNARrJkdtWVU0GvqlFLuWE6BXGnJkXRspF7Ujnpnr/PEJrvFc4/aHrDWn6XX/2aQvA3yBKjZzv3npH4EZ20wMyXTQfbDJ02gbc8mFMoScgaB6ehDsAUVRUmTBDfHHF0yVb7+pgKxWP4YtYa5TydU5R/vK4kgSkGiISkL7MFNCewtxMZ/UKBHj7+upf3DxxKc0EaeXNCPGNCKonGzy+srAIDeEdAGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(8936002)(8676002)(4326008)(2906002)(5660300002)(31696002)(86362001)(82960400001)(478600001)(36756003)(6512007)(26005)(2616005)(6506007)(83380400001)(38100700002)(33964004)(41300700001)(53546011)(66946007)(66556008)(66476007)(316002)(6486002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUFnQWt5d2wwZEtJV2N6K0xPRWxVMlhNSWJVR2Fyb3V3MXk3emk5Z3RNamxw?=
 =?utf-8?B?WmRKVm5rZklmUEJIV3Myc3hNWmYzcGozeE9ndDJUMGYwZVN1dzdlQmNPTE9G?=
 =?utf-8?B?dGtETXFYb0NsYlo0cXlGU0xYd0w4T1g1bWFyOWZVeUZ6UXdFTjUyVUk1R01n?=
 =?utf-8?B?UURqRi9lZ2oydE9EdDdMckVpSzkrRkk3dDBJdjl3dzhYOWpmaFNOczBkaHRq?=
 =?utf-8?B?dzQyTG5DZmdaSm80RG1XRDBOK1RhTmptTGo1bC9OUzAzVlR2ZWtDTEY1cit3?=
 =?utf-8?B?bmkyNTdhUzZiMitsRUJicGdmMjVud1NCamVZanp5Z1c1c3BMWjdkYVhkUjRH?=
 =?utf-8?B?dlZPRzJmZVRzNHFhaHBDZVlqOUJtS0hVOStNVldPTHgzWmhZR0lkL3ZDeStj?=
 =?utf-8?B?TjlQb3ZmbVZnSUE4TlRBa0FNbXRPNmV4eGs5aEhMNHZmVnhPSkh4QStxNnBU?=
 =?utf-8?B?eGJHSEVkNDZINHFPYlZYNDJ4WlpmMUlLbnY5bHIxUWNsT3hoTFpTL3U5czNM?=
 =?utf-8?B?QzFqMEZtclZFSlJSMDJpa2gydDUyNmd1NGFZeTlSRTZmV29kQlZSRExMSFlp?=
 =?utf-8?B?NEFlRVQ3dVFtbHBSeldvVFJiZHYxRFgxeTRGTnBIemZCK2VJSEpiemoxenBP?=
 =?utf-8?B?aEJrd3dISnh5LzBJTzNWeHRDTFBRdnRhRTZWYTFNOERQWHh4NUVqMUh2dkFz?=
 =?utf-8?B?TXZyajhnYzN3WUFIQWh1RXd6TlQ4dWdqSWU2Qyt4WEthK3VQdjltcDBhaTFP?=
 =?utf-8?B?M2t4d2F4d0xUb0lLZi9TZDE1K1BRUGZqaTdzVERESDRyQVZjQm1IbkxiSkdz?=
 =?utf-8?B?eHhvVW8rSmRlOXM0MFpsYUJsZjRjU0M5RkliWjZmYitCN0lBaUV0SzV3S2xh?=
 =?utf-8?B?KzAwR3dCWnU4aWc3R25qM3REN3d2QnV6VFlzWU1MVWYzaENOUkJxYXg1cXlY?=
 =?utf-8?B?dmprVyt4Y2VVY3BuRHBpWjNyQ0g3RjQ5SXRKelB4ZXl2ZUk4dHMxL0MwRG11?=
 =?utf-8?B?UmpaemFJUmV5NzhUYkx6VEx3dHdpcmt3M3dKWVZmaU5tNHdmQmpOZjNwY3dR?=
 =?utf-8?B?enVEOGFVSWxsZmxrN0J1N0Z1TE1YZzFRTkE0QUZzZUZYTnVROGFyTDI3aWhF?=
 =?utf-8?B?eHNqdEhaZit6KzNoTnFOVHR1YmZyeGw4NGRhaVZ5SVpFUHp3aEdGdzlsWUJo?=
 =?utf-8?B?eGZTL3hlbGp0OG1mSTVQcnRJUDlWc3Zqa2IvOC8xMlNkeWJyVXV0S3NnYkpr?=
 =?utf-8?B?SEoyS3d0cmhQdVA4M3NRZ04rd2xQc21uQ1pvdkYxNHNteHhSTFgxNEYvaHhC?=
 =?utf-8?B?TXM1WGNtUmQzeTFqYUt6T0tiVVpMaTNQbGVkcFIzanZDNThEVlM4a092S0Fw?=
 =?utf-8?B?R0svNU5qSVhWT3dUUklEaUh6MTNZeDVRUTBSRXBYbWpUR2x3ZjNTYWxwRGVi?=
 =?utf-8?B?T0oxVUJrMHZHL1ByRUhlS0VIZXVEbFhUR1ljR245cWtmUUczVkJ1QWZVNFJz?=
 =?utf-8?B?Z0taWHdwRGwwcWxhMzJqOHJ4M1JaR0UwQkNMUmxIcmVINTNmWktzS2FONzhz?=
 =?utf-8?B?ck1sUjBWL0N4RjdWRmFzajJBdEljWmg4dHVobitmYk5uWFhOZXVwekc1Qi9s?=
 =?utf-8?B?Z3NiVnFXM2NKNGtIZlVrUHBneDdSZWVtL2tJY2NoV3ZCU2ZpN3RJeEI0SVh5?=
 =?utf-8?B?bDdYc1BpdzFpZ1cvSG0xWm1BdDB0VXpQZEFIQmFyajJzVzJ2alJiQklaYVpU?=
 =?utf-8?B?TFQ3NkNRWFA2YVNFb3NBRnBHSmpjWE9lSWRFaUNPR05VQkJwWlhKR29rRktr?=
 =?utf-8?B?MllQK2hHYlBTK0c3ak1ibXFYOFZaeGJybFI1L0V0cDFYYU9YNlNGN1FIN05Z?=
 =?utf-8?B?WVpYcUtrRnJFcGpnUnZQeTNmeXQ0NE41NmpYNWRFSnY4ZGpqcTBQVUJ5Tzdz?=
 =?utf-8?B?Yk9xOThWbzA3K2dvNkdWVzJKcWJVY1RBTjdXVGhRbVY3TDFYMTcyRXhSeDk5?=
 =?utf-8?B?UTNLdWJ3S2EzejFnSFBPRHZTLy8rSzM5bDVyeHFWS3lzZ3o0N3ZabFlwTVdJ?=
 =?utf-8?B?YUJMNTNlUnNvMGoxWlpxY2Y4RTNRb05QcUtrRnpaM0xkMElBZ1ZGcWlESTAy?=
 =?utf-8?Q?JmXZeCJDcrQEFO2KBge/QG8f5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a25f5c9-c65f-4783-07a1-08dc1cd16de2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 11:41:39.8752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18LXc0eeCqRm1yXTN4XRCcVwmA+/KmxkifdmyEYkZXnYdWcne8a81kItqrvcKKgixDwLc3r5ytqj4uNt29PkDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
X-OriginatorOrg: intel.com
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

--------------m3jJgHpdUUesnAK8xLZO0OMZ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 1/15/2024 16:44, Marcin Bernatowicz wrote:
> Added command line option (-l) to list physical engines.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
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

LGTM, Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------m3jJgHpdUUesnAK8xLZO0OMZ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/15/2024 16:44, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240115154448.29263-3-marcin.bernatowicz@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Added command line option (-l) to list physical engines.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
---
 benchmarks/gem_wsim.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index e79d26513..aa70b1770 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2924,6 +2924,7 @@ static void print_help(void)
 &quot;  -f &lt;scale&gt;        Scale factor for batch durations.\n&quot;
 &quot;  -F &lt;scale&gt;        Scale factor for delays.\n&quot;
 &quot;  -L                List GPUs.\n&quot;
+&quot;  -l                List physical engines.\n&quot;
 &quot;  -D &lt;gpu&gt;          One of the GPUs from -L.\n&quot;
 	);
 }
@@ -2983,10 +2984,42 @@ add_workload_arg(struct w_arg *w_args, unsigned int nr_args, char *w_arg,
 	return w_args;
 }
 
+static void list_engines(void)
+{
+	struct intel_engines *engines = query_engines();
+	int engine_class_count[NUM_ENGINE_CLASSES] = {};
+	unsigned int i;
+
+	for (i = 0; i &lt; engines-&gt;nr_engines; ++i) {
+		igt_assert_lt(engines-&gt;engines[i].engine_class, NUM_ENGINE_CLASSES);
+		engine_class_count[engines-&gt;engines[i].engine_class]++;
+	}
+
+	for (i = 0; i &lt; engines-&gt;nr_engines; ++i) {
+		if (engine_class_count[engines-&gt;engines[i].engine_class] &gt; 1)
+			printf(&quot;%s%u&quot;,
+			       intel_engine_class_string(engines-&gt;engines[i].engine_class),
+			       engines-&gt;engines[i].engine_instance + 1);
+		else
+			printf(&quot;%s&quot;,
+			       intel_engine_class_string(engines-&gt;engines[i].engine_class));
+
+		if (is_xe &amp;&amp; engines-&gt;engines[i].gt_id)
+			printf(&quot;-%u&quot;, engines-&gt;engines[i].gt_id);
+
+		if (verbose &gt; 3)
+			printf(&quot; [%d:%d:%d]&quot;, engines-&gt;engines[i].engine_class,
+			       engines-&gt;engines[i].engine_instance,
+			       engines-&gt;engines[i].gt_id);
+		printf(&quot;\n&quot;);
+	}
+}
+
 int main(int argc, char **argv)
 {
 	struct igt_device_card card = { };
 	bool list_devices_arg = false;
+	bool list_engines_arg = false;
 	unsigned int repeat = 1;
 	unsigned int clients = 1;
 	unsigned int flags = 0;
@@ -3009,11 +3042,14 @@ int main(int argc, char **argv)
 	master_prng = time(NULL);
 
 	while ((c = getopt(argc, argv,
-			   &quot;LhqvsSdc:r:w:W:a:p:I:f:F:D:&quot;)) != -1) {
+			   &quot;LlhqvsSdc:r:w:W:a:p:I:f:F:D:&quot;)) != -1) {
 		switch (c) {
 		case 'L':
 			list_devices_arg = true;
 			break;
+		case 'l':
+			list_engines_arg = true;
+			break;
 		case 'D':
 			device_arg = strdup(optarg);
 			break;
@@ -3134,6 +3170,11 @@ int main(int argc, char **argv)
 	if (is_xe)
 		xe_device_get(fd);
 
+	if (list_engines_arg) {
+		list_engines();
+		goto out;
+	}
+
 	if (!nr_w_args) {
 		wsim_err(&quot;No workload descriptor(s)!\n&quot;);
 		goto err;</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">
LGTM,
Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a></span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------m3jJgHpdUUesnAK8xLZO0OMZ--
