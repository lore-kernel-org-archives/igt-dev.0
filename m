Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B265CC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 10:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F33610E71B;
	Mon, 25 Mar 2024 10:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLXYQ6cH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7974410E708
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711361823; x=1742897823;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UeYhz+jZurYpJdfpF4CHx3sS+KTss2pWOKZJcvtiOk8=;
 b=CLXYQ6cH41yeTa15fnEFERMbrxoYE9yiTKx1g+0ywztBUiBJL9JE3i/x
 NChmii/BrrpQmCoAQnanGCXteNK79oyUHqUDG0C2qyeQwl3ThYY+YmIjJ
 T0Mib2Cv1QeobXYE9LBGpnkfbKTF0JDrbeUM5Cfl92EK/yGtTrKPOawWT
 hky9hY2pdueq+00K19hmRvoRV9CcP+Oy5OY12c2tTCk/5vc1z74H+Uz4Y
 uzwnJPiGP/ubGBmQvvtdt3gmh1VZnMbXc4usfaosuHvTJoOw0KOBvi6ms
 6x/kfMrRmkqGiwpEfvjpIaq9cJd/JboSWoFOIcFDHjwbSw5hN1Vdlb7uy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="16987433"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="16987433"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 03:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="15973963"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 03:17:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 03:17:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 03:17:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 03:17:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdtP8myd/MK3MYzksKX6DHrN4gzYSZdoDhcaBUm9uGt73JS/CDJ5OW3413izCaJIYNlfOdBI2s5YzBsy9RdNdJbezx71uo4ZtqQV2hW6ZtL7Ink4mrptJN0YMQ0+qgLYEASQCIeGQRjBAEJ6w9yUlZJM2v25N7umeDVAF0ADQwhRvjTUdk8y//Ug1JRqGhW9ojG5LRwn0xLg+eWsGIBhRmBtiSrF+d6Og7A/W7CUPcFxLtiRTo+qsN0xV0xOsMgH8+ybRjQMIbP4gATzqwmOFZ8g7dXfSMMQYxkbWRIKnSVC3c5Ha8TtqIUYnkZQz2t0TXrlwfRU5nMveyl02H4sTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEE8LaWw267LRT693Fre+0CuJyATJTfhegJHGTFinIc=;
 b=KT3lfjdSb1cHxMj0AIbAEHcsqSeICVoLOUYK2UmOKA+d5ib7l6RMR8cPbKGaLWJ19ocu3j1k+E8eGBEuWcnyAy/tt8B/8XUEiwfuYPrfybiN7KAMY1Faa35m8i951peOj270oEyWLrPuplUhVouPbWBhEScf4CXKbfJKwDlizi4fvRbh6YnDxbsGdCxoV17aajdRrC2r9UjL2g41jXfBw2yeYt7RGWcWe4sE+TjvSraF+H/pW4vG1PgsifKdSIM0ZPO0G2Uy2glUpquWsV1SK4yhwpTdfaK9qzWrIUsxe4taYXwnIKbtK3/02V74eLbLCK4Pe5mxA9jgG/pw8XRf6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Mon, 25 Mar 2024 10:16:59 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 10:16:58 +0000
Message-ID: <8176206a-bc1d-4a22-8fad-83c06f504c0d@intel.com>
Date: Mon, 25 Mar 2024 15:46:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_big_joiner: revamp bigjoiner
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240321182831.1143175-1-kunal1.joshi@intel.com>
 <20240321182831.1143175-3-kunal1.joshi@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240321182831.1143175-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0229.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DM4PR11MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 13757a76-450d-4b61-af9f-08dc4cb4b47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+S3HmlSfomv4RRuaaKxwMBUVpXbFrTjaaRm8kCwcl3L/FtWTNp7rjdt+1KChEWKHgIqI86xgVWx20TA4wc5tfsxUHFYY4IAo0tgx8sCqLy4XPv8UGW4ShgSRbXs2HfFXvvdKzxMz/d16OnNgj7ZbXmFHV0vMsM/gC3RG1KTeLYhNP2CQsiPKKzVRZ7FIHnxGm0Pu2v4UbVwWLpWmZLIGEPsREpNSOf6cg2I7H44ZKjRL73ZYdZqGEcsG56W02SIeXI6qCAJ+FllBVpUSdX20SrkYQ3KyaDORZvaAKVMqUqhFh/RdkfFyr8juHYxP9mpZxzNxI4upvg3dk3BzjKRB8WRlnkmCpnUibDuqQYBWgRboUzjaJ1RF3ztwaMTFdWtq6sf6cWYWOWZ4+/08Lphpyhz9wzv66lpNHWcHLlCKAS5S1sGwnBaNwqoTHFoUlVsGZjMp+v9vGpyB42cOJGXGi94MPJxy+bdRkS1Emi4vdUXiUZurzbL7DdSHQN5LpjjrvcB3AYYPBntZ7Pp5PyilnY7TOO+eDD/DmL3RixFD5J4jQ9i2iPqCRAFa/11tA3DdjFlAlIO3C6r3HXc1oT/nrMFLStiXXAYXuS4rGLZpREbhJGsMdtLEMburmIzQZb7ETBUulTDVuhZMOwmTGp3nFnTiW8RR8m4bqwbcxIHsTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wkt4QUJxWWtqOGdhT1VVS3Z5NlQyd2dZVG4vTW1iK3BOOHZqelJaUEl2eCsr?=
 =?utf-8?B?akVYRFVDUytudkN2cXNpcys4QmZFNDAzU3JmMGVVTmlLUzNWL0RqZ1RENnJm?=
 =?utf-8?B?a01ycmRzMFM0cjlzcE9FMFIwK21VVS8yOXh4dkxUbFp0U0pYZm8wRWtGVC8y?=
 =?utf-8?B?cGdEVDFHZ2FEU1J0Wnd0Nk9ubUlFeml4emE4RXdNOEdMZXFGN3FpWFVjOGtL?=
 =?utf-8?B?QWZzeGxickY2MHRVTmtKL0V0dEtrWHhpcklKeU11cFpTTjNTRkZqQ3hHRHZL?=
 =?utf-8?B?cnVzeVNacWN1UWFIWFhkaEM2UGdhVUhHMGw5QzJVTHhuQ0JWVzNvVEF5Ym5O?=
 =?utf-8?B?ZTM1RHBEbytya1V1UUZFandGNHN1Mlk2YzFIeHRJdU93QXRyc1pqbDhNTjdw?=
 =?utf-8?B?YXdNUlRJcXoxdlFkcEdSb1dXQ3cyUXBKNURoektSZFdQVG1XNFN3SDhHVXVC?=
 =?utf-8?B?TmRwK2l6UDRIVFRubUJIS1V1a2V4ckhzdWtTenZ3elNXYVVISWUzV3RCcElh?=
 =?utf-8?B?WU1USHFPcWZ2dmtKckhjNkRhdDk4aUFnRVU4dTJVQWVpdHF3Zm9Pbnh1a2dl?=
 =?utf-8?B?eEV3T0h2YjZsMWRZalJ1bWpPL1psU2xjMHp3ZmdxeGJGWndXUWc5VjcxanF3?=
 =?utf-8?B?a2dOSXFCZmMrTGwyb1VSMDQ2WW9Qblk5cTNnNHhOSDZrVU1reGFBQlRXdXBK?=
 =?utf-8?B?Slc3VlhxWXQyTFVSL3NqMlRqbGRkQVAvMkRocHd2R2dBc2ZUbC9FNEpkQWY0?=
 =?utf-8?B?TW1MWTJUV3dEdDZXS25JQWs4VmY2VmRqekwwUHQxeVRjYnF5RWNUeDVsaDMx?=
 =?utf-8?B?VVNBdmR0YjhwcGp3cU5DQmc4dngwK3BVeE5WdWdVb1I1Zk93eEpZa3FGZE9K?=
 =?utf-8?B?OEhqckYyQ2h2RUlZS1NyZ0hYOGM1dFZrbzE5MWtHcTI5WjNOUU50WGZid1hz?=
 =?utf-8?B?L0hadWtBa1lOZGZ0a2kvNnN3MWVvRk5JaGt6ZTNpVlAxUjFBNEVaTVo5ZHl2?=
 =?utf-8?B?c3Iyb0NlbmN2N1llWHZLNVhyRkVzZmlXSEpNcTZoTmxrZTBWcjFocXk3dkt4?=
 =?utf-8?B?V29RcFdoV25LcDJtTVRwc1hPUGtJL1dLOHpyeUVBUHdZZkhob3dkb1dVSGJp?=
 =?utf-8?B?RXdjSHgxS29BZ1dGRVA0ZVJHNm1lZm5OdUk5N0pQOEpSSEx3K3V2MWFQZkx4?=
 =?utf-8?B?N0dUQjVpay9tRUF4VTlRSjNVNkE0dVl0N3hmL3hML01TZXJEeDZGMGxST3FC?=
 =?utf-8?B?SjlCNThzbjAzWTdnYnZUU3FkSXhGUTR4NjNvQ2M5QkpsZG9oV1RIMHlCdFNv?=
 =?utf-8?B?UFRjd1dFOHloM010b0tNQitCenMvUTJKSm1mUklLaWNWSWlFaldrSEdtbjA1?=
 =?utf-8?B?NVMzdjVpcVpNKzVNUmJvbDV0dnh0WnRqWDgvTTA2eCtEMGVXZk9wamVZN1VZ?=
 =?utf-8?B?SmZnOGkxU24xbDZHcldJN0x0ZzZrSE1IUVNuRVZ2b0p1RVo1MWxDWnBwNElO?=
 =?utf-8?B?TG1CYkNqTGZ2WG5UcTM0RVh2NFhkblcwWkd0cmZZK3djTzVZMmlvcjN5TXNG?=
 =?utf-8?B?L2Z4dlBZcTVzY1VhOFlqbVBpUkVtL0Y5ZmhUdHFsc29RUEJ2L0NqOUJ0WVY5?=
 =?utf-8?B?OUg2Zy9YeUdxcW9mQjFPMTgxMzJ5Qm1lWVE0dkxUQlYxOUdOTTdrTFFJTjVR?=
 =?utf-8?B?ZG5CbzcvUlZ2WmZGaVhRNXlrTkhET1ZHWlZBbmxBUmVVYTl5VVFlV1NkOVh3?=
 =?utf-8?B?S2kxZXFNZFFDaHRydkY3SXBKallRbVQ4UHJGdVI2MGRxSE0rL3JRL2U2VDQ1?=
 =?utf-8?B?b1NTcWExMStrVFhzL1VMbmJKTW1kWndZN0ljcy9rUEN1S1VHVnBITzA1a3dK?=
 =?utf-8?B?ZUc1N1czLzk0N3dlc0F5Q3FCMUgxY2JaOFYyNEN0bngxMGhIS2Npek5YSlVX?=
 =?utf-8?B?a21ZSW1hMWlmOXdDQ2V4WFBHb0R1QWlJT3VZSnJkU2xBTzdMOXNIamM0cDJz?=
 =?utf-8?B?c2ZSZ3gwZ2o0MVV4OFBHNnJCenZ1WnBLQmQ5Z1ZJTmUrd1pCSHFjR0dTSmlC?=
 =?utf-8?B?NUZ1emt6Umk4NGNyaGl5L2NwZzJjMS9xSUp0OVg5OWNJbHlOQ3VtdTB6ZU9j?=
 =?utf-8?B?dVJvdlFXNTVMc1BROERXSVcvREVOYVdVUWlFbG54dXlXengvZGVidVhEQlFJ?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13757a76-450d-4b61-af9f-08dc4cb4b47c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 10:16:58.6934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3DnJaNMifYgSxkFC8LercCbluplj9BqW/xF/uU1zQCF0/0v6mqN3bWI7uYxrAq1O2LkfAqIKlS+DupfbUYAe92/0I5fW1DpuklE0HXE9Ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
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


On 3/21/2024 11:58 PM, Kunal Joshi wrote:
> v2: Don't change license (Bhanu)
>      Print the pipe name (Bhanu)
>      Remove unwanted commit (Bhanu)
>      Move combine output logic to igt_fixture (Bhanu)
>      split revamp and force joiner (Bhanu)
>
> v3: Ignored fused pipes (Stan)
>
> v4: Ignore master pipes who doesn't have slave (Ankit)
> 	Retain subtest names (Ankit)
> 	Use commit instead of try_commit (Ankit)
> 	Fix typo (Ankit)
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 416 ++++++++++++++++++-----------------
>   1 file changed, 220 insertions(+), 196 deletions(-)
>
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index 99b1b898d..eba74cddf 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -44,177 +44,253 @@
>    * SUBTEST: basic
>    * Description: Verify the basic modeset on big joiner mode on all pipes
>    *
> - * SUBTEST: 2x-modeset
> - * Description: Verify simultaneous modeset on 2 big joiner outputs
>    */
>   
>   IGT_TEST_DESCRIPTION("Test big joiner");
>   
> -struct bigjoiner_output {
> -	uint32_t output_id;
> -	drmModeModeInfo mode;
> -};
> +#define INVALID_TEST_OUTPUT 2
>   
>   typedef struct {
>   	int drm_fd;
> -	igt_display_t display;
> -	struct igt_fb fb;
> +	int big_joiner_output_count;
> +	int non_big_joiner_output_count;
> +	int combined_output_count;
> +	int output_count;
>   	int n_pipes;
> -	enum pipe pipe1;
> -	enum pipe pipe2;
> -	struct bigjoiner_output output[2];
> +	int master_pipes;
> +	uint64_t big_joiner_output[IGT_MAX_PIPES];

These can be uint32_t to match drmModeConnector connector_id

> +	uint64_t non_big_joiner_output[IGT_MAX_PIPES];
> +	uint64_t combined_output[IGT_MAX_PIPES];
> +	enum pipe pipe_seq[IGT_MAX_PIPES];
> +	igt_display_t display;
>   } data_t;
>   
>   static int max_dotclock;
>   
> -static void test_invalid_modeset(data_t *data)
> +static void set_all_master_pipes_for_platform(data_t *data)
>   {
> -	igt_output_t *output;
> -	igt_display_t *display = &data->display;
> -	int ret;
> +	enum pipe pipe;
> +	enum pipe last_pipe;
> +
> +	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES; pipe++) {
We should have pipe < IGT_MAX_PIPES -1 as we are checking pipe+1 in the 
loop.
> +		if (data->display.pipes[pipe].enabled) {
> +			if (data->display.pipes[pipe+1].enabled) {

these can be one if condition instead of nested if:

if (data->display.pipes[pipe].enabled &&
     data->display.pipes[pipe+1].enabled)

> +				data->master_pipes |= BIT(pipe);
> +				igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
> +			}
> +			last_pipe = pipe;

I dont think we need this last_pipe.


> +		}
> +	}
> +	data->master_pipes |= BIT(last_pipe);
> +}
>   
> -	igt_info("Bigjoiner test on ");
> -	for_each_connected_output(display, output){
> -		enum pipe p = output->pending_pipe;
> -		drmModeModeInfo *mode;
> -		igt_pipe_t *pipe;
> -		igt_plane_t *plane;
> +static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t id)
> +{
> +	igt_output_t *output;
>   
> -		if (p == PIPE_NONE)
> -			continue;
> +	for_each_connected_output(&data->display, output) {
> +		if (output->id == id)
> +			return output;

I am wondering if we just store the igt_outputs instead of storing id 
and then looping to match the id with connected outputs.


> +	}
> +	igt_assert_f(false, "Output not found\n");
> +	return NULL;
> +}
>   
> -		mode = igt_output_get_mode(output);
> -		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
> -		kmstest_dump_mode(mode);
> +static enum pipe get_next_master_pipe(data_t *data, unsigned int available_pipe_mask)
> +{
> +	if ((data->master_pipes & available_pipe_mask) == 0)
> +		return PIPE_NONE;
>   
> -		pipe = &display->pipes[p];
> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	return ffs(data->master_pipes & available_pipe_mask) - 1;
> +}
>   
> -		igt_plane_set_fb(plane, &data->fb);
> -		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -	}
> +static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe, unsigned int available_pipe_mask)
> +{
> +	enum pipe master_pipe;
> +	unsigned int attempt_mask;
>   
> -	igt_assert(!igt_check_bigjoiner_support(display));
> +	attempt_mask = BIT(pipe);
> +	master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
>   
> -	/* This commit is expectd to fail as this pipe is being used for big joiner */
> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (master_pipe == PIPE_NONE)
> +		return PIPE_NONE;
>   
> -	igt_display_reset(&data->display);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe),
> +			kmstest_pipe_name(pipe + 1), output->name);
> +	igt_output_set_pipe(output, pipe);
>   
> -	igt_assert_lt(ret, 0);
> +	return master_pipe;
>   }
>   
> -static void test_basic_modeset(data_t *data)
> +static void test_single_joiner(data_t *data, int output_count)
>   {
> +	int i;
> +	enum pipe pipe, master_pipe;
> +	unsigned int available_pipe_mask = BIT(data->n_pipes) - 1;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	uint64_t *outputs;
> +	igt_fb_t fb;
>   	drmModeModeInfo *mode;
> -	igt_output_t *output, *bigjoiner_output = NULL;
> -	igt_display_t *display = &data->display;
> -	igt_pipe_t *pipe;
> -	igt_plane_t *plane;
>   
> -	igt_display_reset(display);
> +	outputs = data->big_joiner_output;
>   
> -	for_each_connected_output(display, output) {
> -		if (data->output[0].output_id == output->id) {
> -			bigjoiner_output = output;
> -			break;
> +	for (i = 0; i < output_count; i++) {
> +		output = get_output_by_id_or_assert(data, outputs[i]);
> +		for (pipe = 0; pipe < data->n_pipes-1; pipe++) {
> +			igt_display_reset(&data->display);
> +			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
> +			if (master_pipe == PIPE_NONE)
> +				continue;
> +			mode = igt_output_get_mode(output);
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +								  DRM_FORMAT_MOD_LINEAR, &fb);
> +			igt_plane_set_fb(primary, &fb);
> +			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +			igt_plane_set_fb(primary, NULL);
> +			igt_remove_fb(data->drm_fd, &fb);
>   		}
>   	}
> -
> -	igt_output_set_pipe(bigjoiner_output, data->pipe1);
> -
> -	mode = &data->output[0].mode;
> -	igt_output_override_mode(bigjoiner_output, mode);
> -
> -	pipe = &display->pipes[data->pipe1];
> -	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -
> -	igt_plane_set_fb(plane, &data->fb);
> -	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -
> -	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
> -	igt_plane_set_fb(plane, NULL);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
>   
> -static void test_dual_display(data_t *data)
> +static void test_multi_joiner(data_t *data, int output_count)
>   {
> +	int i;
> +	unsigned int available_pipe_mask;
> +	enum pipe pipe, master_pipe;
> +	uint64_t *outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary[output_count];
> +	igt_fb_t fb[output_count];
>   	drmModeModeInfo *mode;
> -	igt_output_t *output, *bigjoiner_output[2];
> -	igt_display_t *display = &data->display;
> -	igt_pipe_t *pipe;
> -	igt_plane_t *plane1, *plane2;
> -	int count = 0;
> -
> -	igt_display_reset(display);
> -
> -	for_each_connected_output(display, output) {
> -		if (data->output[count].output_id == output->id) {
> -			bigjoiner_output[count] = output;
> -			count++;
> -		}
>   
> -		if (count > 1)
> +	available_pipe_mask = BIT(data->n_pipes) - 1;
> +	outputs = data->big_joiner_output;
> +
> +	igt_display_reset(&data->display);
> +	for (i = 0; i < output_count; i++) {
> +		output = get_output_by_id_or_assert(data, outputs[i]);
> +		for (pipe = 0; pipe < data->n_pipes; pipe++) {
> +			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
> +			if (master_pipe == PIPE_NONE)
> +				continue;
> +			mode = igt_output_get_mode(output);
> +			primary[i] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +								  DRM_FORMAT_MOD_LINEAR, &fb[i]);
> +			igt_plane_set_fb(primary[i], &fb[i]);
> +
> +			available_pipe_mask &= ~BIT(master_pipe);
> +			available_pipe_mask &= ~BIT(master_pipe + 1);
>   			break;
> +		}
>   	}
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	for (i = 0; i < output_count; i++) {
> +		igt_plane_set_fb(primary[i], NULL);
> +		igt_remove_fb(data->drm_fd, &fb[i]);
> +	}
> +}
>   
> -	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
> -	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
> -
> -	/* Set up first big joiner output on Pipe A*/
> -	mode = &data->output[0].mode;
> -	igt_output_override_mode(bigjoiner_output[0], mode);
> +static void test_invalid_modeset_two_joiner(data_t *data,
> +					    bool combined)
> +{
> +	int i, j, ret;
> +	unsigned int available_pipe_mask;
> +	unsigned int attempt_mask;
> +	enum pipe master_pipe;
> +	uint64_t *outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary[INVALID_TEST_OUTPUT];
> +	igt_fb_t fb[INVALID_TEST_OUTPUT];
> +	drmModeModeInfo *mode;
>   
> -	pipe = &display->pipes[data->pipe1];
> -	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	available_pipe_mask = BIT(data->n_pipes) - 1;
> +	outputs = combined ? data->combined_output : data->big_joiner_output;
>   
> -	igt_plane_set_fb(plane1, &data->fb);
> -	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
> +	for (i = 0; i < data->n_pipes-1; i++) {
> +		igt_display_reset(&data->display);
> +		attempt_mask = BIT(data->pipe_seq[i]);
> +		master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
>   
> -	/* Set up second big joiner output on Pipe C*/
> -	mode = &data->output[1].mode;
> -	igt_output_override_mode(bigjoiner_output[1], mode);
> +		if (master_pipe == PIPE_NONE)
> +			continue;
>   
> -	pipe = &display->pipes[data->pipe2];
> -	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
> +			output = get_output_by_id_or_assert(data, outputs[j]);
> +			igt_output_set_pipe(output, data->pipe_seq[i + j]);
> +			mode = igt_output_get_mode(output);
> +			igt_info(" Assigning pipe %s to %s with mode %dx%d@%d%s",
> +				 kmstest_pipe_name(data->pipe_seq[i + j]),
> +				 igt_output_name(output), mode->hdisplay,
> +				 mode->vdisplay, mode->vrefresh,
> +				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
> +			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
> +			igt_plane_set_fb(primary[j], &fb[j]);
> +		}
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
> +			igt_plane_set_fb(primary[j], NULL);
> +			igt_remove_fb(data->drm_fd, &fb[j]);
> +		}
> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
> +	}
> +}
>   
> -	igt_plane_set_fb(plane2, &data->fb);
> -	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
> +static void test_big_joiner_on_last_pipe(data_t *data)
> +{
> +	int i, len, ret;
> +	uint64_t *outputs;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	igt_fb_t fb;
> +	drmModeModeInfo *mode;
>   
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	len = data->big_joiner_output_count;
> +	outputs = data->big_joiner_output;
>   
> -	/* Clean up */
> -	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
> -	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
> -	igt_plane_set_fb(plane1, NULL);
> -	igt_plane_set_fb(plane2, NULL);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	for (i = 0; i < len; i++) {
> +		igt_display_reset(&data->display);
> +		output = get_output_by_id_or_assert(data, outputs[i]);
> +		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
> +		mode = igt_output_get_mode(output);
> +		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",

Extra space after before 'Assign'


> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
> +				 igt_output_name(output), mode->hdisplay,
> +				 mode->vdisplay, mode->vrefresh);
> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +							  DRM_FORMAT_MOD_LINEAR, &fb);
> +		igt_plane_set_fb(primary, &fb);
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_remove_fb(data->drm_fd, &fb);
> +		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
> +	}
>   }
>   
>   igt_main
>   {
> -	data_t data;
> +	int i, j;
>   	igt_output_t *output;
>   	drmModeModeInfo mode;
> -	int valid_output = 0, i, count = 0, j = 0;
> -	uint16_t width = 0, height = 0;
> -	enum pipe pipe_seq[IGT_MAX_PIPES];
> +	data_t data;
>   
>   	igt_fixture {
> +		data.big_joiner_output_count = 0;
> +		data.non_big_joiner_output_count = 0;
> +		data.combined_output_count = 0;
> +		data.output_count = 0;
> +		j = 0;
> +
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		kmstest_set_vt_graphics_mode();
> -
>   		igt_display_require(&data.display, data.drm_fd);
> +		set_all_master_pipes_for_platform(&data);
>   		igt_require(data.display.is_atomic);
> -
>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
>   		for_each_connected_output(&data.display, output) {
> @@ -228,105 +304,53 @@ igt_main
>   			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   
>   			if (found) {
> -				data.output[count].output_id = output->id;
> -				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
> -				count++;
> -
> -				width = max(width, mode.hdisplay);
> -				height = max(height, mode.vdisplay);
> +				data.big_joiner_output[data.big_joiner_output_count++] = output->config.connector->connector_id;
> +				igt_output_override_mode(output, &mode);
> +			} else {
> +				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output->config.connector->connector_id;
>   			}
> -			valid_output++;
> +			data.output_count++;
> +		}
> +		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
> +			data.combined_output[data.combined_output_count++] = data.big_joiner_output[0];
> +			data.combined_output[data.combined_output_count++] = data.non_big_joiner_output[0];
>   		}
> -
>   		data.n_pipes = 0;
>   		for_each_pipe(&data.display, i) {
>   			data.n_pipes++;
> -			pipe_seq[j] = i;
> +			data.pipe_seq[j] = i;
>   			j++;
>   		}
> -
> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
> -
> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>   	}
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
It would be good to describe about the two subtests.
>   	igt_subtest_with_dynamic("basic") {
> -		for (i = 0; i < data.n_pipes - 1; i++) {
> -			data.pipe1 = pipe_seq[i];
> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
> -				test_basic_modeset(&data);
> -		}
> +			igt_require_f(data.big_joiner_output_count > 0,
> +				      "No bigjoiner output found\n");
> +			igt_require_f(data.n_pipes > 1,
> +				      "Minimum 2 pipes required\n");
> +			igt_dynamic_f("single-joiner")
> +				test_single_joiner(&data, data.big_joiner_output_count);
> +			if (data.big_joiner_output_count > 1)
> +				igt_dynamic_f("multi-joiner")
> +					test_multi_joiner(&data, data.big_joiner_output_count);
>   	}
>   
> -	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> -		     "when the pipe is active with a big joiner modeset");

I think we need this for invalid case, describing new subtests.

Regards,

Ankit


>   	igt_subtest_with_dynamic("invalid-modeset") {
> -		data.pipe1 = pipe_seq[j - 1];
> -
> -		igt_display_reset(&data.display);
> -		for_each_connected_output(&data.display, output) {
> -			if (data.output[0].output_id != output->id)
> -				continue;
> -
> -			mode = data.output[0].mode;
> -			igt_output_set_pipe(output, data.pipe1);
> -			igt_output_override_mode(output, &mode);
> -
> -			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(data.pipe1),
> -				      igt_output_name(output))
> -				test_invalid_modeset(&data);
> -		}
> -
> -		if(valid_output > 1) {
> -			for (i = 0; i < data.n_pipes - 1; i++) {
> -				igt_output_t *first_output = NULL, *second_output = NULL;
> -
> -				data.pipe1 = pipe_seq[i];
> -				data.pipe2 = pipe_seq[i + 1];
> -
> -				igt_display_reset(&data.display);
> -				for_each_connected_output(&data.display, output) {
> -					if (data.output[0].output_id == output->id) {
> -						first_output = output;
> -						mode = data.output[0].mode;
> -
> -						igt_output_set_pipe(output, data.pipe1);
> -						igt_output_override_mode(output, &mode);
> -					} else if (second_output == NULL) {
> -						second_output = output;
> -						igt_output_set_pipe(output, data.pipe2);
> -
> -						break;
> -					}
> -				}
> -
> -				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
> -					      kmstest_pipe_name(data.pipe1),
> -					      igt_output_name(first_output),
> -					      kmstest_pipe_name(data.pipe2),
> -					      igt_output_name(second_output))
> -					test_invalid_modeset(&data);
> -			}
> -		}
> -	}
> -
> -	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
> -	igt_subtest_with_dynamic("2x-modeset") {
> -		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
> -		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
> -		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
> -			data.pipe1 = pipe_seq[i];
> -			data.pipe2 = pipe_seq[i + 2];
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
> -				test_dual_display(&data);
> -		}
> +		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> +		if (data.big_joiner_output_count >= 1)
> +			igt_dynamic_f("big_joiner_on_last_pipe")
> +				test_big_joiner_on_last_pipe(&data);
> +		if (data.big_joiner_output_count > 1)
> +			igt_dynamic_f("invalid_combinations")
> +				test_invalid_modeset_two_joiner(&data, false);
> +		if (data.combined_output_count)
> +			igt_dynamic_f("combined_output")
> +				test_invalid_modeset_two_joiner(&data, true);
>   	}
>   
>   	igt_fixture {
> -		igt_remove_fb(data.drm_fd, &data.fb);
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
>   	}
