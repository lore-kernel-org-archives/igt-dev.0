Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE3AEFCD77
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 10:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B6F10E111;
	Mon,  9 Mar 2026 10:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTK5GWcT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815D810E111
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773050751; x=1804586751;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=k2ACSvT8almcsWNR1WPiBKCGuzzFQrVJIFwM8V0euQQ=;
 b=YTK5GWcTz2wX/OaEY919vlM2vMi0sAEcp0IwsFzSaub9CST4GZL/jDih
 b4JBlGKTnZ8yUpX7Oct2XI5E5IoZTONnHdgXK9KkDfyjo5BM/vDXcvaTk
 1uGY0jLbVSYMe8pq1DGXcdwsGjm5YVHfj426VHva+RpXnE7rIY9zSM7/8
 CTosF1ozxg8B73TQksuxHZKpgxWNmNsFwBN1kMQ3E76SXPtkG9SysZ98s
 ONx9dMLM9E2Px2r5UmxH6kDcydRsFdUS4x+i2QqNZEK1OSMhrullrhpSz
 EwGSomA65o5GasEENfMVVaXK8OlY21H1/+E/42+1sgMT7dr6syRNsUqwR w==;
X-CSE-ConnectionGUID: ZQpkfVbSR++QhUq6FD7wKA==
X-CSE-MsgGUID: TJyUjOZ+Rvah8l9PhtQOWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84704754"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="84704754"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:05:51 -0700
X-CSE-ConnectionGUID: c08l3QHRTCawij8pTwU0PA==
X-CSE-MsgGUID: kuSTNHn/QwmeifMMWNhbFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218911692"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:05:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 03:05:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 03:05:49 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 03:05:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DS3kWFjEl1Lrk7VaX6Ay+ub9sC30PpFcfoVb35wd/Lpx7k2C+mtJtGyR9mgnSAALVKKjd6ZG5wDvzEaqpAdrDiCjfviWUm2kwyuFdWKaReBq6lRshP+r42wAF0WKShoJxs+mYP3uGRL5rTuIhhIvIdd5y6lx2Y/6j+y1n4lghxYFs/vtqia/LXHFnGWfvwgca6z21hxGc1/tCilLmzo8NgUsJjQ7wOX10C2DIss3z2ARoZNS3x47piFv3ZEQcIQlrLx5q07xBInHgUlT7z1ZP0SWe7TDrEv/giQdQJMIy3wtY34T3BKYzgezoWRgDS/yGXMW1bZmManN4Gz0CtEghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CF5LAi5pvkBdYqSbONo6XiAc3ufLkRx/ChgD7a3tvYk=;
 b=oyWC7BCQi6kFRdZY7IaXQzj9womr/myVgW0/K2cPdIWvvVKmZmqwYx0p+n2m36l5oUhf/tzHfH9yLqyZlbOfW7RubE24cyblJcoyKcrFo+yryG+wUHCx84Zcop0NXUIBgemYgal/uRKhrMmUUVbYy8wKfhC4ptbTOXgfasZRDMS8jVK8Mwsk6V19WfOfpxn6xJvz/i39j2KF1/AnKEKsgUdzEHaVt66WDOU7xczjjH/uuRaQNZWyDBg01iZRKL1RZGNV89TR3znhZpOwJpd1pJx8XWOFkM8ekcOGvq51+2rkLngfKvGqQmdiHqwgKdnvv8NrPIeqNqVUcVbXOIlUFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.7; Mon, 9 Mar
 2026 10:05:42 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 10:05:42 +0000
Message-ID: <fd0e2b38-7f86-4eb8-985e-68cba8c1a44b@intel.com>
Date: Mon, 9 Mar 2026 15:35:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,5/6] tests/kms_feature_discovery: add basic usb4 switch
 discovery
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260225212859.876713-6-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20260225212859.876713-6-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0198.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::11) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SN7PR11MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c02d89-4da7-478e-4f03-08de7dc36c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: El+0pfsdlV+EtuJqefaq2xRG1BjB913fmdZbNiYfPSsDnNFfdLJNKDOQUaLiOMCjROSYgtd9uIK11C9gz+yMxRqbPDkaJyTBjg1ERWRVsEBq8Pn497RdpNbTm3uY512bzQ3xbKIIzhDq19a9U8QdnGD5fjAgdgmqy/K+8NJOoedmmbwH+8nH2h+lnF364fzkWBTkq4aeBUJH/qbV2JGeiTR08ITk59+cmFERvvDk+eeTYhAR+Jrcvzl9hpay6Ni1NQh1WEom+wchAYlhMAsnzHBh4JI3ccszuMUcyLRCNH0Voh2znfBMujREuQMWWfJpGrPKcJGXvW8nEftHM3ZUAyoXet2dngHleBWeb7VOkfR98iqF4R9M5hlHie8BFkx2WspHAMM1duNk0kZcMRgi+fSEA+/JjxOKW7mxYvncI5Q7PS8Y+7B4A7CuHsgbgO7d50kmKb2fqVfJNlPsDRVaanDomB+E9QCliKPMCFrB3u3JEy/KFQ/GjODynzmwtmQMZuCYvezm2oQfsYPT9JbWNJAnbDioQzyMlk3huvaNm32WtXq32lkUjG90MTN9vpN6r/xMMllKZcoTbtKasXEw6b5RUqE1opEIyCf1ZN9OneJbZaox1Hs3YrSCY4zgiK35RwGUCRFpu7d3XTYeRJiJGes4bRJ44QnRzEbuuHlw74Ch0GcZXNMcOMHeTsQV1BrkBH7G9siXcmx4TezoLD6a5Za8peTrsod1rv3SS2Su1/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzkraXc3SmJMZm9CbHgvQSs5aE11c0VKT3NxcWFKQktrb01HTUo2dnlidjBv?=
 =?utf-8?B?WGxhUlhabUgzVHVMcTJSSlBmUTJnU3BlZ3BYUDhhTElLUnFZeURnUlRrMkdT?=
 =?utf-8?B?N29qd0JFQzhLWW9ZUHlKcElNZXVuSEs0T3AxbjIvOXVhZ2VlQjYvMFp6aGwy?=
 =?utf-8?B?aG9RN0NzbUhHNEJ4RzJMdjAweUVXRHhnMzdTWk5WWUs0QXAyeGZ4WHFiQ0s1?=
 =?utf-8?B?V09PL1NXdU1UcE5RRE9tU0NrWmNxWXdYYW9VZk5KdWFWN09XUVh1Um4wbWFU?=
 =?utf-8?B?WW5pbDdtbENRL0VTUlN2MEtKWGJ0NjltU0ZnNE1VSmJZMUFLYlNOdDNOSk9Q?=
 =?utf-8?B?Y25pcys0U0ZVc1A3QkdlSDdUK1VuRDhBbFlxeFdCUHRTS2QxSGlvV2pZVFdk?=
 =?utf-8?B?UFVIWEVPdzdLMk1DdUZSOVFDZ1F3OHFaQ3pVUkloRE4vaDhEa2htbTRmNTZ3?=
 =?utf-8?B?cjhDSHFpS2RRME5LRmRWd21NYlcya0NCSGVPaXFNek1lZzZPdWIzVnRaK2hu?=
 =?utf-8?B?RDJVeVI5ZDMrdXZRbW5FWGtIU01Hc1JBZ0RoKzE0ditpSEt3UDRDV1RiR1Jp?=
 =?utf-8?B?WlRwYlBrSEIzZjR1K21BQXlDMmVvYUkrbWNSTk8rWlF1R2tLbjFpWmFVclQ2?=
 =?utf-8?B?Q2VKTldVSERxNHZlQS81SW5nTllBd3ZiZE4zWnpkNUJId01XRmE3YkNHaDND?=
 =?utf-8?B?U3h4aHQ3QmNrS1dDT2R1RHVxaTBDV05WUkVmbXRKQ053a0FYb0hlM3pSK0Ur?=
 =?utf-8?B?aVVrZXl0dUdpZVh1ZWhPa2ExWmVhelhjb2FtTUVKazdzWnJnUEs5M2Q0ZExj?=
 =?utf-8?B?WFB5UFppVllrS0hkam9DWVRPOWM1N0k1RUowRFZmK1dOY0xLaDUzcFdyU1FY?=
 =?utf-8?B?Q29IYVRjUU9naEE0V3NwUitWVjRHV3lVWnNHdnhzTHVXaDh2RDA5dGl0ZUFW?=
 =?utf-8?B?M2FnM1BoZGpzQkU4ZGU0dGNLY2Q3Q29CTS9KVkEzMVl1OW9pR1oreE1OOUFa?=
 =?utf-8?B?TmhyWnUwYXJ2VEtSd1RvT0twS1BSeCtQQ2VLQ2h3d3dJQnZoT245M3RkMjJy?=
 =?utf-8?B?cUFGVFpkMGVwcUhNTnIvTndRYm9sd0N0QmlBZkVNMytJcCsyMWhUT0pOOWVX?=
 =?utf-8?B?TTRvbkhVN21yQzFJUERNVnJpdHpUUXZnc1ppWmpiQVNmamRZUEZpZXVuMjZL?=
 =?utf-8?B?bDNseEVMSEpWeDRqYkN5QnNSU1MxdUVSeDIzWmV4YjJhZHYyUEJqS2M2Y0pu?=
 =?utf-8?B?L1IxK3NHYUFsM2dWRlpMeitvVkN5NWcrTlNOTWdqbEJzTlAyREJkZmxJZ3Nh?=
 =?utf-8?B?OVF3cUY0d3hXcThTMVVIQW1xN3Rjc0FJK1YvV2czaEtnMnZDWGxRZithRTNj?=
 =?utf-8?B?REgxTURxVS9BKzU3elJuZUdFaHdQL3ZhZ2lFL3VBbjJXRDJNbnJNakxQK0hS?=
 =?utf-8?B?QzVxSEt3TzBBV210cG50N1lNRzVONG1HMlhCc1hhcnlYbysrbEVGUlFZblZi?=
 =?utf-8?B?MDJidDJYQktxVjd2Y0Z3SEdvZm9TdER3THFBZkVneUJRaVpFU2RXSm9udFpH?=
 =?utf-8?B?TnRicjhYUndkb1RKeHY3MWxxc1l6dWxtQmVRaEFOZjZTODhMMVdtUWlCV3Vh?=
 =?utf-8?B?aVNmUlR2MXlPTitHTHNKaGQxT0Jjbi9VTlhkcFZjMWFMaGhOSVF5aFl6UGpx?=
 =?utf-8?B?QW1EMXN3MUlQeEpHRFFVdVJGNmlBc0dHMHgzTVUxOGtpTVdmdVZ6dHJuYVls?=
 =?utf-8?B?UTBJZ1d3V3FLaVBLbDdJNTIrOTBVRGJXOHVFeElVOTdUV0tXK1lDZU0yc2pi?=
 =?utf-8?B?VlRybHdMeEh1L2NzNWp5aUhiKzhCNFozSUJ4NGYvNzBLZFd5eFV6U3ZhNVNa?=
 =?utf-8?B?RGJIeVprWXBlZXNxd1AyVWJYcHUxS0xqZFFYY1lvQTNJNlJIN1lFK1VTNU1O?=
 =?utf-8?B?bTVRV2VzMmFzLzgwR1FVRzd3TXovMXNwVTdPNVl5V2MyUDBBRDczVHhCTXRx?=
 =?utf-8?B?VzVrSVhJZmhMcGVRQ1lPSEUzcFBicFN2YkF3alpZejFVaEx5RDJWcFE3Y2xR?=
 =?utf-8?B?bFRLT1NaQjRKRG9ZWk9GZ09RdWdVVW9qZ3owbU5uVEJFWTBCWksrOFhqSUl3?=
 =?utf-8?B?ZEVHSXZZSUs2Z2RpVEQrVnFCNGkzb2VLL29aZlFpL25KZXJlMExCOUU3eU5m?=
 =?utf-8?B?dkRpTC90VEVrdmg1VEVwZUhRTStGTld5ZmNkMkVXNkUxYWpWbnBLTS9iNXhW?=
 =?utf-8?B?VzFSSnBFQUl2NlVUN3VTazQrdVhzMWtsd1d1SU5Da0tWbkcyQzVWMUxhOU9O?=
 =?utf-8?B?Q25rZ1lGdkQ1QS9UUTJGZnZaUDNCU3FkS3Y1a3JieGc4RGtKYkVIQT09?=
X-Exchange-RoutingPolicyChecked: IPS+LQ8hyx2T/wOlzbMgLfu4emojOtm8jqMVFQE6L7JwGoWM5JnTD/khtuKVrbGslK1muifdR6uiwxBKOhlsBUKtrQV6FWK8/yc6g/ZfZWjblMPiNqadePKLT2Osb7LIebrNW2wirhxLRbH/nkW3/beHBVRwAm8zH8r9bN8JErqVTXo1Q9oZ+cC0N19wTVco58zKOrKtDpo0cgxyvAVoZ6ZqjrWVh94tF2zROBEAHX870JvJVONVVehwvwQwbfBZnrwB80PxYSLo9xusqZw3dqfZX3IzsAw6hIL9RCcmPk94UeVvyJWvK7iEDa1AQ6+hySxiQoJmyke4+tcuRIl6dQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c02d89-4da7-478e-4f03-08de7dc36c06
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:05:42.1138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l28lVy3Ahp67xHqMVRhWvbJzHH0eO8nAQ9DZ8Kg0UgxZvvKTJyEg7c4SyLyEyGvHZSM1sGN1dD1YG4uEPChzEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6970
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


On 26-02-2026 02:58, Kunal Joshi wrote:
> Add a 'usb4-switch' subtest that verifies the Microsoft USB4 Switch
> 3141 is reachable. The test initializes the switch library and queries
> the active port to confirm communication works.
>
> This enables CI to detect when USB4 switch hardware is available
> before running the full kms_usb4_switch test suite.
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Looks good to me

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

> ---
>   tests/kms_feature_discovery.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index f0216a4ce..b05055186 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -40,6 +40,7 @@
>   #include "igt_psr.h"
>   #include "igt_sysfs.h"
>   #include "igt_types.h"
> +#include "igt_usb4_switch.h"
>   
>   /**
>    * SUBTEST: display
> @@ -63,6 +64,9 @@
>    * SUBTEST: dp-mst
>    * Description: Make sure that we have DP-MST configuration.
>    *
> + * SUBTEST: usb4-switch
> + * Description: Verify that USB4 Switch 3141 is available and responding.
> + *
>    * arg[1].values: 1, 2, 3, 4
>    */
>   
> @@ -147,6 +151,25 @@ int igt_main() {
>   		}
>   #endif
>   
> +		igt_describe("Verify that USB4 Switch 3141 is available and responding.");
> +		igt_subtest("usb4-switch") {
> +			struct usb4switch *sw;
> +			int port;
> +
> +			sw = usb4switch_init(fd);
> +			igt_require_f(sw,
> +				      "USB4 Switch 3141 not available\n");
> +
> +			/* Verify communication works by querying active port */
> +			port = usb4switch_get_active_port(sw);
> +			igt_assert_f(port >= 0,
> +				     "Cannot communicate with USB4 switch\n");
> +
> +			igt_info("USB4 Switch 3141 available (active port: %d)\n",
> +				 port);
> +			usb4switch_deinit(sw);
> +		}
> +
>   		igt_describe("Make sure that we have eDP panel with PSR1 support.");
>   		igt_subtest("psr1") {
>   			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_1, NULL));
