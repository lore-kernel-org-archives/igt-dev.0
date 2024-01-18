Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C03C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 09:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6B310E761;
	Thu, 18 Jan 2024 09:29:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA38A10E761
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 09:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705570152; x=1737106152;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V4BOLjuCnNOCx/LkcqVf97hmvvjUleAQMv8DQ2zUMCo=;
 b=fLlKICPQF0qSWt7JZ49lD+qQc8YVyzPeaeKozg4Th4DRamLgT3NQ7TjT
 XRpg0WQRQnertrvk4Kblo6U84ZPw5bF5HImDScOVbyUFd+z0C/sdDwaLy
 aSJkO9nrrdszHF27tnoX4lLr59Wos/2/S1QkqemKBvaNydMgyX9xIRrI7
 UTV9k4vHcCYTUawZCY338JfuT9cMrYg6ZAHe16D2cPju6VAYEo78wNrRG
 PXuQJ/79FVhiGw9MeFxEZSMvoUKtiNa8w4JaNkVJxv8oxqsFcnjWLtOQs
 Q9lugx9IYZd01fxLFAZ3AOAoIq7x/Lzfq64oS/WwGRNtvaGwgthOcGdQa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7773699"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7773699"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 01:29:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="19063178"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 01:29:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 01:29:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 01:29:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 01:29:10 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 01:29:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/culzsRv3WiughERBsQ2gB/+xfv6ctt+UHhmoXoxizbk3Mu1FdUPDTxraCEQNlOYwb/xo9pkFmFnMlC4Khq8aF6bFQtH8EXJQY+J+w/kBHbS7iva0/HjVsvFHef8kll7SXXavWXG96s01iZy/yGscE4Aj0NGAVOut5AEEIeS7Sk59tXI/MTssEP7VeD4pGWZ4vWAM8McT/GMWVg8RyUUv016fHHWVC4ffehsxV7SBicckN1bNQRCS/xRE3VAB3Y0MVeFv+v8ciS6/aIOkeeMg7R/6dDt6M5ngKymZKbUjINKXvrIWFNNpwBl/ZH0jsrYhthmiLeKX+xmUM0a5GPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p42JqlBbC1RnRG4PWBTQ9jX2Bc8onHeZeCN7C1HlVdE=;
 b=fviowypQ5ehyUOwtpq9GVdjL2O4t8zgeJgXstR/qntQkYt87lNn+SZa7B0itCd86oXRSLKGuNjfNg6zDKRVDIn7Bu9PaXM++XItgkRxXjsMrxNbFznYi9wzy3xOhar+EWG6vpB8sJGJNCaHm0/F76m57PnyTy0sAN3YryIss7dG9ZUBCQBBjHgW/3DRAV/2DAHxE5pc4IBkmWTId0MGJ1QozseQTlqEj/bM09R17qUpvYtjYxAwjhAPJ983WknNDdL+PxL9gRixGVB5Sa6lnhx6AAp4ab5hWs8kpb16ysadxE4Y6jTZ2yMACGBh8AI7oxmb7DKkKctkHUC6sU6c9FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 BN9PR11MB5436.namprd11.prod.outlook.com (2603:10b6:408:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 09:29:07 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::7b54:ba1:d53e:7d2d]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::7b54:ba1:d53e:7d2d%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 09:29:07 +0000
Message-ID: <04d7322b-8914-4812-9a32-3db684a5fd52@intel.com>
Date: Thu, 18 Jan 2024 14:58:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: move bigjoiner_mode_found to lib.
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240112085547.673712-1-kunal1.joshi@intel.com>
 <20240112085547.673712-2-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240112085547.673712-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::23) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|BN9PR11MB5436:EE_
X-MS-Office365-Filtering-Correlation-Id: b5158f9e-ae88-45ce-0a2f-08dc1807eb03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHAVtpBGY9k8EWk842D0gJQsLNA4IN5l6IbWlIWsOdFew9WzX2XtC/ggtCLA6PrBAzB2oefAzewNQCEXmNgj+vLZU9vzx3K2Yrsyx+MaGRDN1D1a+wRCC6UXb+BnB1IYR3MoF+mE9+znIDYPfwfJZi+26hSfqgmpOqS9zauVPVH54BGPGiF9CejBnxETnIhr9OmksVUG2tjVm4mFvs/hoAjshvLknRBGZe6MdznXyZESTTrfoKZtJym9uhaxs7s0Nns9MzKpT0UZVC63+WovLvlVAJ7t/qICQdFuqIy7WvMlSHzEnKCpdCApL5Pg82OmRJSc8CzT36SRjbhcdDv6wgW6PiJywvtN7B9vprGLMw7NJ0JMVVMFfsqfBmGHgCg3UpPNwSASELePLX8gM9OTNohvHtPt9lKBKTAzBSsvrNFEpEi1cntYIx65aU5ODbvhyMoRWZMj1xv7GCDryTrQIqJr9nw9W8dWxyt1G7J5X3wvgoNtzQHbpIs9OHn6LPX0h4xYUWkOttrefS8CZTym/3tWZlUyDpCgPAbHglSJaNOE1I+mir4rggGuLndta83wStD/vARBUUB+KrjyoV0LkBtzyxX5aICSklcyQxj/WlP5vpM493O1UzSpSpqMG4wmrsgCG82PBFIkrSYdpVIX3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(53546011)(26005)(83380400001)(6512007)(6506007)(107886003)(2616005)(38100700002)(4326008)(5660300002)(8676002)(8936002)(41300700001)(2906002)(6486002)(6666004)(478600001)(316002)(66476007)(66556008)(66946007)(36756003)(31696002)(86362001)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjJLbERxVnVob0xmTTB5SFk3c3dwOGhpbERtUzFpQlZxZ1NLNzdDb2FDdW1z?=
 =?utf-8?B?UlpCUWpybVRNRFJSTmJ1MmlQd01GeUwyNUkvUjRiaERWdUpldkRkL0kzZ1ZY?=
 =?utf-8?B?bXh0djErLzFsOG0zYnkyZERXV3lJVEMxbnZaUVdZOFZoZGU1TGdJQUNVMTdt?=
 =?utf-8?B?VDF3U3VBUlhGcDk3eDFxenh2ZUt1NE9udjZjR2JyZi8yZDdRMS9NK3FSeVQy?=
 =?utf-8?B?QmJmMmxrWVZSVjhibXUxejEyUjM0M1FTby9sSmluNWlzS0xKTHBwNkFWZktu?=
 =?utf-8?B?VTBqMk1HQXlDc0cwS2R1N0c2MldQbG42ZmZhZngvcXpGT3g2aUNCWHdFcTlX?=
 =?utf-8?B?ZzB1eGQ0MUg2M1orMGVSaHdWbFl5MkpmN2J3MDJlbXIzc09yVHhuOElVaDF3?=
 =?utf-8?B?bXVBc01MY21ZYXAwY1Y5WXA5ckJrYmZPSjNCOGIwd011Vkk3cnNEdmhVa09Q?=
 =?utf-8?B?VXJJeC9IR1J2QU5rdm02WDZ0U2ZkMUszUndXMHFoS2dNRGJPOExjZkFkWXAx?=
 =?utf-8?B?U3U3bFdaUDJJYzFjbGFobE9LOUVWOFNEajMrTjNLaW40TWR4YVhiRVBmbE1H?=
 =?utf-8?B?YVNBbHJUZ2UzMXM3WG9YZVA4bjhEdi9IRExwVFhsQnU2WWdwSHJJS2VLLzRw?=
 =?utf-8?B?SDVYRldNMlJ6MmpYTUVLS0p6REo2SG56NDN3cVFyQ0x5NXdLdEE0eHZCaXdS?=
 =?utf-8?B?eFljOVhNTGRVbzdxVVZMVXJDY2RsSVRQd0R3bHFjb3ZHVE90dU9iYWMzUFdl?=
 =?utf-8?B?djlpeTRreEtJbzRmL29JY1lQV0syUExialBPMTc4Zkg3WXh5Q2xxZXM4aHNL?=
 =?utf-8?B?a2l2TzRNUGVjbUVDMk5TQ1B1WUp2MndUNkxqaUhKMGNvWG9XL0N3cko4c0xw?=
 =?utf-8?B?M3RFSlZueTNIeFFmNlpnRTlRalVJcldPTUJINVlyZE1XUjhveEE4cFlpV0sy?=
 =?utf-8?B?RHpTNm4rSHhOcXJBa2N0S0NZWXExOXRKd2YrbzRlSXRIUkVPcUFrdWErUkp2?=
 =?utf-8?B?RGR3WnpWak5rL1N6M0hBeG9PNEM2YUFhYmZZRUxPRE4yb0pHMmd2cGlya0Qx?=
 =?utf-8?B?NjJnZlBTazVPMnZUY3hCblcxbHBFYUMydGhKcmhJSWFocTdKc3BvUjhoZE5q?=
 =?utf-8?B?dy96Q0s4dHdpUkMyNFdvM3A0OWZOSXFUR0kyOTdFTGp5eFNnaXI4aHA4UXhW?=
 =?utf-8?B?RlVpRzJNZzhPQ0J6Y2RxaWJEUXlDejl3NVFwa0hEU2c2TzVXTUZ6T3d2WllQ?=
 =?utf-8?B?djVpTUUwTkxmdVR4QWJmcmliTjFWTVZXYUYxQlNRaTMxc25Fb2N0M2svdnZs?=
 =?utf-8?B?d2R3azNkNjdITGs0cmRMZ3pVaU1YdjEydmhmcmtCaklHZE5oNEw0bDMzWkpF?=
 =?utf-8?B?ZzZtK1VzVU8zM3NSU3JTOVQ2clZrTUUxYm5vQzMvYUpYcXhEeDRQcnBwY1du?=
 =?utf-8?B?QURwMU51c282NmdjQzRaVXdlRWZoeERjWER1eWEyQ1B3S1R2eUNPR0VmOFU2?=
 =?utf-8?B?b2RhZUU5ZnZQdDhNSVJTUE1XbzBtSG5oayszTU9MZ2ZBZlBzRjNNMlA0YmVi?=
 =?utf-8?B?QWc4NS9RY1htY0NNM1VHWGI2UTV1V2lwS3ZzSGFCTUJ1blZKcUdwYldrRUxU?=
 =?utf-8?B?ZVM4bWI3SHFQeThSM0hYNk43WXV4RE1ySFMwS3VEbDNNU3hkbUlXd0x0dVlC?=
 =?utf-8?B?YnV2SmZuZ3lESmdDVk8wcnovU0lUK0xPTHpwdFNLRVl3TzA2SUJBTTQvZzJW?=
 =?utf-8?B?a2Y4Q3IzVzNuRDNOYUJoenQzUkhGS1RDM2pOM3JyZmt0Z2l1Zko1V0FYM2h6?=
 =?utf-8?B?cE1CcFpUaFFlLzhjaEhJaWxCY3VPMFNkV2tUb3NUdmdDdzZyeVk1eUhJRitL?=
 =?utf-8?B?ZlE1Vk54ZDlFKzc2MEQwNSt1SDhoN2RpWjlrQU9MSFZPelFFa3RUdWZkMFVu?=
 =?utf-8?B?YU84cXQrS0xuYTlDSmtwempMVitNTVJmbDBUaE0xS2ZVdjhUbUhHZ2JLTDBm?=
 =?utf-8?B?S0hEZ2tDWjJNVGlRZEVXR3hTdk1QeE5VWGtHc2pFbVpKQTNZTitFbkZwQ3Jx?=
 =?utf-8?B?MmRTRmltcGJHVUIyYXA0SDNlbUpDc01IWkJIM0tlV0lYb1BUV09lcGV1Z09y?=
 =?utf-8?B?cFZPTDNyVldGV0gvNUUyM0NyOVYwcGFhTVV0MWtmOTBhNEtkT0x6eUdGQlpT?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5158f9e-ae88-45ce-0a2f-08dc1807eb03
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 09:29:06.9609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kwsdf76cd2qYZwopJ9S8UBKQ1WYvbbSK4keiFCXKOwvrz+uFveRQ1FXU/Oap8+mBG9EWExLzARcB/b57BsqfTdxkY1taickmNoB9HEIRrOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5436
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

On 12-01-2024 02:25 pm, Kunal Joshi wrote:
> move bigjoiner_mode_found to lib/igt_kms with some modification
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_kms.c                | 19 +++++++++++++++++++
>   lib/igt_kms.h                |  3 +++
>   tests/intel/kms_big_joiner.c | 14 ++------------
>   3 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e4dea1a60..2c55af05f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6142,6 +6142,25 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
>   		mode->clock > max_dotclock);
>   }
>   
> +/**
> + * bigjoiner_mode_found:
> + * @connector: libdrm connector
> + * @sort_method: comparator method
> + * @mode: libdrm mode
> + *
> + * Returns: True if big joiner found in connector modes
> + */
> +bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			  int (*sort_method)(const void *, const void*),
> +			  drmModeModeInfo *mode)
> +{
> +        igt_sort_connector_modes(connector, sort_method);
> +        *mode = connector->modes[0];

IMHO, Instead of calling this helper multiple times with different sort 
methods, let's consolidate here only. Example below:

bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
                          int max_dotclock)
{
   igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
   if (igt_bigjoiner_possible(&connector->modes[0], max_dotclock))
     return true;

   igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
   return igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
}

> +
> +        return igt_bigjoiner_possible(mode,
> +				      igt_get_max_dotclock(drm_fd));
> +}
> +
>   /**
>    * igt_check_bigjoiner_support:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b3882808b..9f5676d35 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1212,6 +1212,9 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
>   int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> +bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
> +                                 int (*sort_method)(const void *, const void*),
> +                                 drmModeModeInfo *mode);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool intel_pipe_output_combo_valid(igt_display_t *display);
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index aba2adfbe..1858c6362 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -199,16 +199,6 @@ static void test_dual_display(data_t *data)
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
>   
> -static bool bigjoiner_mode_found(drmModeConnector *connector,
> -				 int (*sort_method)(const void *, const void*),
> -				 drmModeModeInfo *mode)
> -{
> -	igt_sort_connector_modes(connector, sort_method);
> -	*mode = connector->modes[0];
> -
> -	return igt_bigjoiner_possible(mode, max_dotclock);
> -}
> -
>   igt_main
>   {
>   	data_t data;
> @@ -235,8 +225,8 @@ igt_main
>   			 * Bigjoiner will come in to the picture when the
>   			 * resolution > 5K or clock > max-dot-clock.
>   			 */
> -			found = (bigjoiner_mode_found(connector, sort_drm_modes_by_res_dsc, &mode) ||
> -				 bigjoiner_mode_found(connector, sort_drm_modes_by_clk_dsc, &mode)) ?
> +			found = (bigjoiner_mode_found(data.drm_fd, connector, sort_drm_modes_by_res_dsc, &mode) ||
> +				 bigjoiner_mode_found(data.drm_fd, connector, sort_drm_modes_by_clk_dsc, &mode)) ?
>   					true : false;
>   
>   			if (found) {
