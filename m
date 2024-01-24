Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC45C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 14:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A01110ED5B;
	Wed, 24 Jan 2024 14:43:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF19D10EA31
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706107379; x=1737643379;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tYfenc+sb6vN2fSMDSoOP7SHPILyxdyl+ez7AtDYud0=;
 b=gHwxv/KTAFawHLu3ILn47tU/lRFsg0iQ3NwLc5EFuKQ+eDTk64PQtTY/
 zlbQ0dGXfRDR/LJwNcLX/rSEDY9KC93SpGMty5LvZCOfOj087gVE/TQd4
 4TtuziAb625cX4dcRDhL44fhUnBn9YVmVWww1fB/PzX2XJF+OwkOoZ5Uu
 Q9x39DcnNXCbULLI+DnQFp1eCoXyjufx1TLZnhu/+7N3TzI6wvyJzXunL
 HT+f470CcFd9axi57jDXNTKfeqb+DIKZEewvwkxVKOqjB1HIFwsan5t7W
 Og4cUrxr0HN+C+pqwixWSZU45kmEf9XRcCVJGAqAmpxnzx8rUqTzjx1Cy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="20415543"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20415543"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 06:42:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959529523"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="959529523"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 06:42:58 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 06:42:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 06:42:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 06:42:57 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 06:42:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvzFP/Ps+IMZYIuWedt6K7qKXh0T4VawlyQFAjVm/AYhV+TeE7Gy7R2R2YGG4PS/8psOJHk3yptMVKf/8waJ48hD16/AkFMVMDHG+R7hMg2cr9TfdA5z6w6kxj1+zcYqzSFb/ltLY5K4ZxXhY5PRHT2EcpcehOW7bfsl8JjDeGjSMe1W3dTW0zpzFFhTTEl7bP+q9QyTHYALXj2xMW+eeF6VDhY4PJk4zV0H79niMNjM0zL3gFpq/Bwf3Zgh2rOmIjmSnzgnXkLD217lUEd1oO7p6FTfDMKAgdzp7uGIX7BlicUeF5NmWTcsoqekr0Bv9h2ReoMyHs1Rjti57m/Yqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q52aFpuT4xIR/ZsP/c9Ri3piTMOCGpQqtqxChU76MD0=;
 b=TLoSTth+QPfTloHZPwovlSX35Yt3oyB0t5pbSqgTUrO52tiuaTzE4ObZ5fjxV/I2hdtnptcsG/m8SgtrmnFnGJdQ7HyjdMOVVZJcaEt85iXuaMbmvXx1zpKDZHE2nIIPtPDpD4yf0YKw4MSKPFaCW8pgW34yqKsSvf1P9pNW9GSzq9dY2s6QVxMY8/9LObyf5Zt70ywDCXtAFZaqMXhj/k5w2LQYxX8TZONggt3Fcj3rXsOOQ/iEOjDCDn0zzXtuvEgbFbwukRjGlxNsmWVuoxKK8Y7huN5ibcrJ8BBBOCuePTvnbyKWnECbiga+QMyQ8LvOK7N14fNEZ7b1aUd98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Wed, 24 Jan
 2024 14:42:54 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb%3]) with mapi id 15.20.7228.023; Wed, 24 Jan 2024
 14:42:54 +0000
Message-ID: <4ff7b717-8c2f-4180-a22c-4ac66c835972@intel.com>
Date: Wed, 24 Jan 2024 20:12:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode only
 after checking enable_psr modparam
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>,
 Jeevan B <jeevan.b@intel.com>, Vidya Srinivas <vidya.srinivas@intel.com>
References: <20240124103410.1259607-1-kunal1.joshi@intel.com>
 <20240124103410.1259607-3-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240124103410.1259607-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::27) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ0PR11MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: e57f8fe1-86bd-4f92-8364-08dc1ceabf68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: klNYGv3sW3h2KA6f/ge7v48j0gEcJaZEHGY1LvYQWEvUQZm97OKPMmDf25rklmHE4i9OZLcrRu1X5Xh8s1yea7Ax3r5s5Y4nexoKEN2hAcg0mO1oSdwixdcbNAmx5/SI1ZKGM7PHhOfknDZ6gDpInWigNi+SuDPu/w0x90Eiw0Kk0SSB1h200YK1KCxicMPYwWmwI5ZQe7Y5hBhPlFHJ97lxhBgL0RTXGZk/9E0kB0gTDbwBMFVnwKIXo8sUmUSY7Qe/6iMrZaAD2x+Sikf2Apgd5aMvrfy0iSG+BmQbANQk/B2UqVEUNzpK7denQ5quCSzldVUXbu34j5iO4RZ2jugz83bprhYBuqwgXixchjeZnlDt3CnM+AW8Xw7RaqYTBweJ8HC2Lmeikqwv30zG9rnb42Y/wO7Q1w0J1wY4cW3gdubc8dH6H8b4fpQ/RIa1L46v/l8eU97pSVa/cz3wZDdXpV6LXZosDjKgc8AAh3YFaIgDfMGaE60JyO6rGTKrBUK5lk2pLBJO/3Ov6MNsNpJIuY9pd68l3DVvSXtmOeass391xp/I2S2qBouhi2kQBNlNwHmw/PYWbyiJJfhUgJbiiiRe9E+miiGMf+eagk83DfKkv3Q9SgsGAJRXbj9oHvqE/qBRdRXCeZpQ4sR51w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(6486002)(26005)(2616005)(6512007)(38100700002)(8676002)(8936002)(5660300002)(66946007)(478600001)(2906002)(6506007)(66476007)(53546011)(66556008)(6666004)(110136005)(6636002)(316002)(41300700001)(82960400001)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTFxYmc1UXZhcnYxQTY1eFprSlc3ZVZaZmRnZlZCT2JCK3RRMVZsVSsyY3h6?=
 =?utf-8?B?YkUyWDd6UDl4K3BjSjF5V1FIeDVTdjN5RnJYK0d6akJkWGFOd1NLUU0vbjdm?=
 =?utf-8?B?eGlSOEZkMk05S044RnJjOW9KR2JidVI2ZCt3OG1hNjZaZDVOZHNWUyt0WlhJ?=
 =?utf-8?B?dW5NRmZMUlByRGRyVXVTMmlobTladERWQnFyM1ZVNndWY25EMUxNWlcxbFMv?=
 =?utf-8?B?c2g5dVo3bk5oV1E2UjAvYmJuTmRGdVJJQmhsR1NlTlFWWVQwbWUvL0NXRjZR?=
 =?utf-8?B?YlYzSDhKZkZqRE0wNXpIR01iUzB2WjNaSUVJOStmUHVyNUdHakx4SWRuMmVL?=
 =?utf-8?B?MjgwNzFtYVRkL2t4ZXc1dDlkazJmT3lXMVZiK05vczkxQUQ4bDNLL1JWU2N0?=
 =?utf-8?B?c0tXWksxQzVyUWI3cEtaRzB3WHYwa1ExMUpzQ1NCNjVzaXVoRWwySXhvRVhj?=
 =?utf-8?B?a254VjRZMXJsNkhCSVVPQWNIeHRMZE45MW5wN0tXemFiTUdZQXRWYjUrTWF2?=
 =?utf-8?B?V1MzN0haZGh2MS9GT0dnUmdTUmZtaDlEbjRYSXNqSEZaZXZKRktmTnRER0t6?=
 =?utf-8?B?MUVKY2Q2UEhDd3dqLzUycHk2Q2FkNFpuRk1pc3o5bCs2VUQzSWNpZUZPWG9E?=
 =?utf-8?B?L1FYUFpyLzQ1STlaY1lTOTBEaEN2YzJHUUQrdjd5N05rV0JXQldoWVhoaFRH?=
 =?utf-8?B?NTR3MEJvNUI4SHVyY3I4WWZzZGtSMmlDTkR1SkJPVTV1elhvUVJiNTZaSm03?=
 =?utf-8?B?cm40eFdWbERUL3BtQjlPSk1YY0hIRHRJZEp0d1FKbjZxNlZ1VXJvU0VUNHdl?=
 =?utf-8?B?TnB1cDY2c1JGL0x1N2dBNisxTEFwcW5RZitwNU56bTkxSko0Q0VTcTZpakQy?=
 =?utf-8?B?VUd4SmhQVUxIZGVhQ1BjNnROdFAwVmFUWkthTTRDNlVrVmVub2FlVGFKV2FB?=
 =?utf-8?B?VHArTTd4QXYwOVhNUDlMcVVNamVEZUNXbW9ucXpESkhsTnQycS9tT0xUYVBT?=
 =?utf-8?B?d21zK2ttNGpydG16ZDREQ0VjZE8vQUVYSWV0U1ZCRFZvY1BveFAxbEozM1Bz?=
 =?utf-8?B?T1h0NWlrNStKWnl1aGpLaFR1dWhBbmc1SDI4SWcra1hwdzNuTUhUNzYvQnFW?=
 =?utf-8?B?VDh6VnJOdHd5STBNQ1lGeW4wK05BY3pqNit2RzZkQWcrZDVLbGM2VlRab3Mr?=
 =?utf-8?B?V2VFM0FtOWtoTVdqcmJmWFNqZk81aG9WeHZvbEpLWGpDSlkvRTlYQ3FtVkpi?=
 =?utf-8?B?T1lTSCtCL2lMNmMzVGZ4UGxJMzM4dC9xMk1reW1zaEVTYVAvK25IYUxIbXEy?=
 =?utf-8?B?bStDL01IWlc3bDRLYWVEbS9IcFJkeUU1ajJCVGtkdGhZUDZDMjM2ejk5dEdL?=
 =?utf-8?B?bWRpYzVPOEtDQ0RjUHcrbmhtTHI2NmFmUlp3bDB2U1Bmb0I5K2NhSzNGS09q?=
 =?utf-8?B?c2VTOVE2SHhsaGZrcVNSNURaVUIrek9uczhiZk9CdWNxNDNaNC83TkZTNEtL?=
 =?utf-8?B?WG4yVVBJc0RjYzA0bDRIWDhuVzRLa2VmWjE3V1RtVm1hQzVNN0RrNFM2THdq?=
 =?utf-8?B?UlQ2NlVvZHZpUnhuL3g0WW05SGdDYnZXbDJGZ3hhc0hHQTNBcHZFdjh4dEI3?=
 =?utf-8?B?NnZzOXZyZjF2clhXV25tMmNQUjlQRnprbFJzK3JQRUNSbnEyWUd5ZjVPb1dx?=
 =?utf-8?B?M09VNVNHbjVBeWRWVkZ2SFZHRW44b1RsYlZoOVkwU25adzU0VEo0TFpLWDI2?=
 =?utf-8?B?cjRaZUpCZ2o0SkNUZUJwbUJKQzNxaWZjUndZQkdwdlZzSWhwVzR1UmxPY2hk?=
 =?utf-8?B?RE5PTzJrTDB2bEduVXNwWFdUODhLOUh3d21ocHlQSVhXM2FINFltWmhNRldU?=
 =?utf-8?B?ZlQ5Ym5BUjZCdW5iT0JvRXZQK2lYV2d3SFFoZmZLRmR0cDlYVkxFS3lpQlNM?=
 =?utf-8?B?TTBLUkYvZ0FSZXgwTlJuRWVwT3k0THVGVXF6aTR3eXNJMDlCYjR4b1lESlQz?=
 =?utf-8?B?bTAwZ1ZyaDI2K0xSeEFDMnFzRkR6NnR3VU1TamF1dGsrQlZTQTBGdVlMWk94?=
 =?utf-8?B?engyeS85U3p4c0VqL0Jrc01Cbnh4dkplOVlhZlA3eGhjTk5OZ0FYeE1wQmZL?=
 =?utf-8?B?dWd4bFVoZnNORHplZ1JkeCtDN3AxYXJhUFBvb2Z5TlB0Q2NTTWw2WEt3Qnd4?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e57f8fe1-86bd-4f92-8364-08dc1ceabf68
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 14:42:53.9841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opF98Fi4qEJzkI07DR8cc8T1fDPnzGUscm4vCVwpKyItFH8XYsAqOpv+F4Mtg8qzVNE7kAewSdCDz2Qpg2oVEyK4cwBuQqt8CCddc9TOe54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
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

Hi Kunal,

On 24-01-2024 04:04 pm, Kunal Joshi wrote:
> don't enable a psr mode with psr_debug debugfs, instead check what's
> the modparam value for i915_enable_psr
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
> Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>   tests/intel/kms_psr.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index 349671b00..521d4c708 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -497,16 +497,28 @@ static void fill_render(data_t *data, const struct igt_fb *fb,
>   
>   static bool psr_wait_entry_if_enabled(data_t *data)
>   {
> +	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> +		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
> +			 data->op_psr_mode);

This change will cause the skips in dynamic subtests. Skipping the 
dynamic subtest is not recommended, instead don't run the test.

So the proper place for this check would be before calling the 
igt_dynamic().

- Bhanu

> +
>   	return psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output);
>   }
>   
>   static bool psr_wait_update_if_enabled(data_t *data)
>   {
> +	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> +		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
> +			 data->op_psr_mode);
> +
>   	return psr_wait_update(data->debugfs_fd, data->op_psr_mode, data->output);
>   }
>   
>   static bool psr_enable_if_enabled(data_t *data)
>   {
> +	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> +		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
> +			 data->op_psr_mode);
> +
>   	return psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode);
>   }
>   
