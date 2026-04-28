Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6C9FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 08:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4257E10E30D;
	Tue, 28 Apr 2026 08:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxLLHQ2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC5810E318
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777363509; x=1808899509;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q8o4Wu3oxBKpisgCkOpwiIcxXVWj36bVU1ozGwvPQdM=;
 b=MxLLHQ2kog9F9bdzDHpLc1JkbUE5kBsc78pSKQJUr8v3azdaDbzw8jU8
 x33hQmKfeQIkb4Ozi+U68LLWjgK4EbqNk+GMKJCzPZcoQmhoOrcbQVp3I
 GWr416kVH6ljuc7eMDGKt6L1Lw652cF3Xp0mIABe7bN9dl42w62gkG93k
 ALHX1beFVIepQY9LoP/S2M20jMlBmMjU6aDkj9MUU9PrSQlRT/480KTKP
 xyDbWCiBOapqItVbqXI8Ps1vUvMPLcGvZ0YKkVKvtDourXh/Auru1iFPT
 M4GqLfmDoJ4kSV38yKNjw46HfcOjgsEx7E4CyrOE+3JSz2O/C+QLlhUQM Q==;
X-CSE-ConnectionGUID: +cRCRcMqRmW6aJqwsE+Cvw==
X-CSE-MsgGUID: sig0SzZ/TE6Buvu3Cra2Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77428829"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="77428829"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:05:09 -0700
X-CSE-ConnectionGUID: uh47RvQZTEe/acl0+1D76Q==
X-CSE-MsgGUID: CmM/20nFSVWj41KTvf/r9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="227368149"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:05:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 01:05:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 01:05:07 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 01:05:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KD9l5PdPMFvoekH0jF8dVKULb+AYmWpKCUOQTQAy1D0Zh6bbST3jcm4E4LHyblWg1ef/zSH+DQH1kRkSeppLaKtQvAsmj6r5h3Jk9MetLKqSf0WC9u9Tu6EprY2KJuAuU/uxfjWuVxJIeSz3prdBpSnlZyC614Z917gQPPVxCqW+Ch6yTgqGM1UBG8kVpZFjyE4z5zrufChYTdMA9IHQW8RpE3QjaY3dbDDleBiXdzn79YpWbM5y9Ajg0f4KhT2XKEw7myDrspzg59LrMfEuMLIebywTluDviHCxb5BHQ/XPkZiJMiGsl4o/8zNdWL3f7YzWjSsa8NzVD7ovOrdkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWe3UXTea+JfGRW7VrIhVl+rBbGMCeLRagoSAJWMr00=;
 b=kTGHCX1UwzzzPGXiIPmjZ1N8xL4A/okBuoDMSibDAqSXBTrYjxig8iMG7N58xKlR1LdXBqfNgcdX0bh1OBRPSCMYJfJCqHJ7ieGF+ithnq7GA0ebNWirxXevJi+k8cxwFN0vNr1LdYBe3EJUaQl4xJX9jzVF2pvV5RPHxUe55t00ubcPnw9T2nc1CtRta05/9O2VMpsPe9Vxj6kIVYLgN8t576csMltIQ9nq+QX3LtFewmvmpF9121p7OOv18MNuJ+wRgy9hNAeUsr5EBLdzSSz8Hw0EnzQZI6SsXAqravXocFVEesRiq8LQDN8fyqqWK4SBjRNqkIlO4fSEWsGQSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SA1PR11MB8795.namprd11.prod.outlook.com (2603:10b6:806:468::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Tue, 28 Apr
 2026 08:05:05 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 08:05:05 +0000
Message-ID: <f49db91d-a469-4c4a-8c70-d60aea4973fb@intel.com>
Date: Tue, 28 Apr 2026 13:34:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/6] tests: s/check_dc_counter/assert_dc_counter
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <ramanaidu.naladala@intel.com>, <jani.nikula@intel.com>
References: <20260423173403.123706-1-jeevan.b@intel.com>
 <20260423173403.123706-2-jeevan.b@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260423173403.123706-2-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0043.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::6) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|SA1PR11MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: da0972ad-5fdd-4584-3668-08dea4fcdb25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: pSz1CR8XPNabSXSHY4qQ6bt3no+qby0+WcP8+gjMZd/AOr1sEIOUt6ix68W9x1kG3cQy+3XO6+R0OzDLozuVX3ljsK5kugj+sdUzbkwjAplukiaD1uC5otCQXHcjBBLbhyxrMYd/sarBWGWsW0xlFWCR2R947L8LebCb/MmxmpSYHeR9gTVdJLOHg0X53JQAZsEAgKAVUxGRhBtl6y+WskYSPdVHdd0prv6ckCZRowSVk8ad2d6BKc0x8luzpcjBMKRRq6VDbxkG0ihmVOaSo84yiJ28NRizTQgRCStn5O+CLO5jTzDne0sB92qibQ30wBsZlq+3bfR/7RruqtWeFebD3QUHeBT8Szgtk6+hYePOUM48Yb+4BI9EC6ZkZUU4QsYNTbNRYIbib1ZGDNR4W1ExosxS8kPkx20C5EbUgRaSNSv+TFxgepdqwuSEWe2Hqs+7u1IOGIhpe2Y855FMd6zjZqUxubAQwTUgQmPpidOFmYviaXxnZ7WEO/d0gm0gotJc6kZfZOifnGtjWGNEPY2q/is4FIlfL7Jm6qLJezp/tFKYFcQF2HPsaVVLkCb39HstmVTAmTmSN0ByOAyoR0ArjcmrwJJhf8c+NAZbSDUOMJgBazBvx3ZQafX0YkN4Sf+gfkLpSXSsrU7MYODob05NWveQt6yRPoxkVBun3w6GDPvjII1DbiaLqS7PDtGYZAk1YYLTTcj/l04KCOy6/57trVIM5qX4FVJADXrXkqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2xiZUp5U095OFJ6V0ZLU3d6OGQ3VHltM2hzWnNIZndHUnMrcVJhYXU0L1k5?=
 =?utf-8?B?ZC9iTS9SbUNBVXJXUFRkQ3M4NC9aTFlxdmRJbE8zd2dPTklsT1ppVUhoMHBk?=
 =?utf-8?B?VDUycm5LTUJIUXhJTElPcmNXUFIwbzNSWXc5UGxHemhWcnJmd1hJb04wOHV1?=
 =?utf-8?B?ZHJpQXJvK21CbTdMakdGdCtpWGtXZk1HcitlWmRuN0Exb0NZTEpLUjZLejJL?=
 =?utf-8?B?bytrK04zWmwzTTBZdDM4cDV5Nm5iTlJHVnc1ZHorLzFqQUJKQjBjeGtNUjhv?=
 =?utf-8?B?R0lEbUpIazdGNlA3TXI2bk1tS0NOMDFEbEhiVCtvblkzdzQ0V25VTWJNRjY0?=
 =?utf-8?B?Uzl6K3NNYitwVUxwSU5hUEl4RjQ0WTY5alQ0T1QyaGxabHVBTjF2akUyejdM?=
 =?utf-8?B?MWMwVVFSRC9mOUREUWdHWDFDUEIxa2xFZ2lYWktYQ0tCL3NMRjRRbEp6VzRK?=
 =?utf-8?B?YkhUL1FwS3Z1QXd6d28wbXZsTHFadzVqUFg0SXFqVEtZdVpjOTQwWVhvYXE0?=
 =?utf-8?B?enZkZ1pibG5vUVA4RkZwcHFpcG9jZzlmbnVNajlMKzVuUFQrSFdZa1podHhK?=
 =?utf-8?B?QlRuMWtWQ1pnWFRCWklHTFhMeno4aWE5bW5OMmFtNGduTk5WRFR1dHNKMXdh?=
 =?utf-8?B?V0pVeVVrckZFalFDYlBxK0EyWFIxa3VmZ09Fb2NnZzVTWWtuTFVtRThKWmhT?=
 =?utf-8?B?QXgrQndFZmwwUTFYeVdJMlFtdEZVaHREb2p2Um50c2NQaUtiQzU1TTJPRkhU?=
 =?utf-8?B?amRNcDNZVWV6SnRYNHpqUytWNE1LbkxmcGlpSXMzbFovN0trTkhMQkF5d0w5?=
 =?utf-8?B?Y1ZWVFBXN2NQN0ZtUmFZVWRibE9vdUhPZWIzWmRFS295N28zdWQyRzBNUDV5?=
 =?utf-8?B?L21EMVcvZzVQTkVyN2tOdE1zYXhZUStXNEk4dUJ6M1I0ZitRc1Q3d0ptVDBS?=
 =?utf-8?B?ZTFaRTcyVnN5LzM1ZjEvRzlmRmVTZlpMQW83SVEvRE94RnpVU3N2SWdzUUNz?=
 =?utf-8?B?SlhqUVJ3NkVQbTNJcE1BT0NHU2JhQ3Vvbk9td2oyRXRnV1cvNGs0TEEydlhT?=
 =?utf-8?B?OVNveFJmeFhYbm1FZ21BWUUwdEV2eFB3c3d6Q2NoczViWmt3SlZjTzJFdmJW?=
 =?utf-8?B?ZzR0WUZJaCtPSWd0RjMrenJUOWV4ZmxvdGZtdWd4MWhaSkJNNWkyNFl5TkRk?=
 =?utf-8?B?SnJlNVgweWRycTc4ekpaT01vL3p3bDd0L3pvV1dLUnhLdHlUZ2VPM3F4cWFT?=
 =?utf-8?B?STJnWnJ6YXhyWS9IcHhvbmNRdW55L01FY1dWN0NSMFl0UEROQjFJV3ZYcysx?=
 =?utf-8?B?Tm1TMWI0QkU4N041NTA3R29CeTB0bE5SNkUyQ3MzNlpWVGpTL1pVR3NaSFNz?=
 =?utf-8?B?OWlublNqYjdBdlU4eUw0bkVUSG5ia1NmVnpJdUU3MzFxYmhlSTZJUjBZaWNK?=
 =?utf-8?B?OFR6RDNkTUVvSEU2aGJvZXNYUHhnVTA2akcrTWlkMExFZENrV005K0QwQ0Iw?=
 =?utf-8?B?TUlna1F2V3NvZ0toT2RPYXMySDFaMVJPVUcwSWE0Z281OU44SUpRWFhodWRh?=
 =?utf-8?B?TDI5cTEwdHp0THp0OWxZYmxINUFROVYwdmRGM2ZySjRQeVhnRWV6ODFPUWoy?=
 =?utf-8?B?M3FIcml4eU5IWVRJNVNOWFVUZHdMWTd1eDdrU0ZVNE5FN1hTYk9KQkZadXBW?=
 =?utf-8?B?Q2VVNmFpTWpWNEZobHJsa2EzYWhLY0d0ZW9iWGdIdGNhMW1aOGY2dm5Ka1Bz?=
 =?utf-8?B?VmR6OUpxZGFHNU9IaG1qRW1zUnU4d3llTTN2Q2pvcXdKQ1V1SlhrdktFWnZD?=
 =?utf-8?B?dzVCVDhHbnBYM0c0TUU5OWNQcFZUNzVZVHVEUmRlTllCTlpiSEpQaUpjeG1F?=
 =?utf-8?B?S0o2MEZnWjJNMTN4QytXU0ViODJOd1VvbWdQRWEzVWUydElnSS8rckJBbVN2?=
 =?utf-8?B?ZzQ1N3paNERPdUh2aGFYMjAzYzMrU01QQkRrUnBRVmpLREIwNXFvQjhyZ0JN?=
 =?utf-8?B?Ui9mcHBwY3BkTTdjOERMY1BJUzNQSjNDakJkcVpuWEIxdDUwRXVQak5HL0dF?=
 =?utf-8?B?K1N1WE15ZllkZXVtaU9ZS3NpcjdTNmtWUHdMd1dtS251VGtRWk1wWnNZTmVk?=
 =?utf-8?B?Zm1hYkIwZklTMW96SXpTQXZsMHQyU2syZTZncy9LajJuZnBYYWVqMWJ3NzRN?=
 =?utf-8?B?SWxTYlRyNHROVERzTGFGYjBuNlRqTHRzblpKR2NQalNGWENmb0hqcmgrOW1T?=
 =?utf-8?B?ZlhzMmpmSkY1a05IYmViSWs2azdiMWU4TVdNUWErc2VVYXpBenk0MTZnU2ZV?=
 =?utf-8?B?QjBhMWNTMHFBQzh4M093MmFBM0V6VXN0dFZPTzVZYWltV0Q4UmR3UmxRdUY5?=
 =?utf-8?Q?ZsDuhhmNpZQiChuo=3D?=
X-Exchange-RoutingPolicyChecked: eeV0U3yeD0ovZcwhBflGD7dpcF+7MrNwVwxb/L6pku2g1zbi701u2fCB6gsnQ76Z4w6l1CadMUxKJLNIcnV5E0SyUXFhjmv7mUbKwU5O3SBFJgy+1XfE/Q55P6Oy1QYz54hGBcjWfpc+86miML18FM3we5LUn/GTlVDTGTRv/ihMcsLGrxWphOtDhuKBNTpgSJ0atHqWz7xDJqw7plRlwjhF8LRu6EwHH34JDP95GB3qeoCzZMgAmojzB6aoDIaYZqtIU/pDPWfU3SCmBNMLiOc7hJ1lTqCfU6HbnnAAaviFaLdxfbBlEUKeidcbigUo8vtcyOnRAXfPSsg8Ytuk5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: da0972ad-5fdd-4584-3668-08dea4fcdb25
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:05:05.3587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3TTlnnwOoap+uaDWP7RPL8lseZkEfDFMNr8i3m5aWu2HFPd3VG79gjfDhNJDqljzQbdEw8TX2+7EYP1hZVsfvOjBhUtH8HCq+gA5senxhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8795
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


On 23-04-2026 11:03 pm, Jeevan B wrote:
> Rename function name.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 423a5c4a4..c8cfa300c 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -110,7 +110,7 @@ typedef struct {
>   	bool runtime_suspend_disabled;
>   } data_t;
>   
> -static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
> +static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
>   
>   static void set_output_on_pipe_b(data_t *data)
>   {
> @@ -257,7 +257,7 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
>   	paint_rectangles(data, data->mode, fb_color, fb);
>   }
>   
> -static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
> +static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
>   {
>   	igt_assert_f(igt_dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
>   		     "%s state is not achieved\n%s:\n%s\n", igt_dc_state_name(dc_flag),
> @@ -265,7 +265,7 @@ static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
>   		     PWR_DOMAIN_INFO));
>   }
>   
> -static void check_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
> +static void assert_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
>   {
>   	igt_assert_f(!igt_dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
>   		     "%s state is achieved\n%s:\n%s\n", igt_dc_state_name(dc_flag),
> @@ -346,7 +346,7 @@ static void test_dc5_retention_flops(data_t *data, int dc_flag)
>   	set_output_on_pipe_b(data);
>   	setup_primary(data);
>   	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output));
> -	check_dc_counter(data, dc_flag, dc_counter_before_psr);
> +	assert_dc_counter(data, dc_flag, dc_counter_before_psr);
>   	cleanup_dc_psr(data);
>   }
>   
> @@ -360,7 +360,7 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
>   	setup_primary(data);
>   	igt_require(!psr_disabled_check(data->debugfs_fd));
>   	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output));
> -	check_dc_counter(data, dc_flag, dc_counter_before_psr);
> +	assert_dc_counter(data, dc_flag, dc_counter_before_psr);
>   	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
>   	cleanup_dc_psr(data);
>   }
> @@ -439,7 +439,7 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
>   	setup_dc_dpms(data);
>   	dc_counter = igt_read_dc_counter(data->debugfs_fd, dc_flag);
>   	dpms_off(data);
> -	check_dc_counter(data, dc_flag, dc_counter);
> +	assert_dc_counter(data, dc_flag, dc_counter);
>   	dpms_on(data);
>   	cleanup_dc_dpms(data);
>   }
> @@ -452,7 +452,7 @@ static void test_dc_state_dpms_negative(data_t *data, int dc_flag)
>   	setup_dc_dpms(data);
>   	dc_counter = igt_read_dc_counter(data->debugfs_fd, dc_flag);
>   	dpms_on(data);
> -	check_dc_counter_negative(data, dc_flag, dc_counter);
> +	assert_dc_counter_negative(data, dc_flag, dc_counter);
>   	cleanup_dc_dpms(data);
>   }
>   
