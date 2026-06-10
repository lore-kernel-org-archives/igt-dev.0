Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99F2CD8CB9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 09:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2BB10E875;
	Wed, 10 Jun 2026 09:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6LGyOcW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56FF10E4FF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781084855; x=1812620855;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Cff7RU4Q6Rj9a6srByrKsBsKELmiKscM51kNsYW079I=;
 b=g6LGyOcWlXK2xd3eOfJs6/18RyA4/Lkg7+NeV+cC332nf1QaF31YrT1t
 NlvcKZob4ftg2wpM+oHkPYUMLOVZBqXXUjbgMCAGxQMtfQ44F7Mobi12k
 6u4XPED8jdH+71LUzfPkxS1IO4Pd7UPif6TtZO0t0xpcFZzuybNuIGqCt
 nbOn+oFuofram/7XfSxwBGWzJEo9SuRFpiuAnq6Rgk5XkMKfnxdzYTh7I
 zoRfKb1Uw9ukglVZ4dbO/eDXTr2/yHArx9WUKUQXcZ4hNBYBwaTHJ/WA0
 AMJyh6kMqkP+zn4G/FFNPtNk5a4/ZG34YeMtWQNy2d1UoS9OTnbn8yjE5 A==;
X-CSE-ConnectionGUID: V6cte1dYQdaMdsTMutw+zw==
X-CSE-MsgGUID: 7KSzx7q5TcqzvruAbER/Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81851702"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81851702"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:47:35 -0700
X-CSE-ConnectionGUID: wQKuFHXoTk2nKRFDRmmAXg==
X-CSE-MsgGUID: ePhkiyJDSqmVteJbdKniIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="239791683"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:47:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 02:47:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 02:47:33 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 02:47:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jc07xtHUT0wdjyF5lfU+UD/2fPLuJiXA6gPHSobFE44nCcFsIHD7LzZOkrZL4zB6egDwpSFJ3r+vuXefNhjNMZhC7EsvIfjq2QgtDSVNHTHVWqfFLH3vSbyWq557cROe2UDOUTInyV+OHC9LjQo9ZaZXkQDyqpQVUq/v2PK81gVoHzNx1pnCpv8BI+dRNVtS7lRUUR3Rs2coNRSLzE3nmWV0QX9i0U74m75fBBxKTJvCVLk4+1QIrpcgOUMq6mg19JKPGdY9bobkWWVRLk+7bDZIuFuQCZCNyGaadhIgGzlS9VAZgK/JNt1sDJtLiVoc6ZJZFVXD6nHdbz2d+U1ptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICfqDHM8fl1KyOULJEq7gCjS5aIyMM2ADC5D7I/s6B4=;
 b=Jx+vszKD2FW6P3HK+5seRxwCHmlffkCjEp6lyXTrFzfWhMP9Ltl2xONrwywMuFDo2o3yMSbV+cENF+qNOMtPYCmkS96Ic0wnfCcdG6SfRfHqk9m/AyaZUQbrWbbA/bzS5kBiIcAaXDA750DBOgsqz7aj3d6cf84KRuCrbpeRs48UHTKXpnz9yQHWTVTb+5iQnIUZ1U4cRe5x35jcDa1EISRX4yrRhnkw/3cHZDGasO8ZrGJ84g7GwKszK15a3ShUfg0KFiRUVyZK3VzodKjs/+VhEwXxfRSlku1kNSOLaRxEXK/6eb0HEXbceK9X41bcfkihw1FAfpcfPWrmyBhwLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Wed, 10 Jun
 2026 09:47:31 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 09:47:31 +0000
Message-ID: <89a3848d-0eb1-483a-9314-622d39056513@intel.com>
Date: Wed, 10 Jun 2026 15:17:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_concurrent: Skip mode_lo if it
 requires bigjoiner
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260610094710.3410268-1-sowmiya.s@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260610094710.3410268-1-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: 5124e792-c231-4a9d-e179-08dec6d54a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|23010399003|376014|1800799024|3023799007|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VqdQi3ylLhBk+V8Olma550qG7ySMaVdngvH3sNwFErAStPwc3ea83PlMFMf8Q5uNae8UJgOmUZOJkJexEuS5b7isrsmc+xmy6xGQe/7SjpFoKo3yfHgeTgNfXuCMQq/MLskq7zXuqu0wZA9LKEaTSGHn9fS8p9W4RYU/eCiDtQZKgaju2Zqxcz3IEUpEX/1gtk/Y0qi+Az9KMEinwjJ2sIdIi3Q5N6+tywjikofIp7POgILohhtTzZhoVAGy6OqitwUhH9zBD+Npl9co5ZWr6DOBpxde0xwteLYVA97MHkjAB64LbABpcpqMnbXTxSpydxv9ASuMq6Bl5oKdqaxNC3RsiYw6mKcCb5y0Y1rgXqCvxhBWpcmgjMm7j8PLHM8rTbjC7PF19gu/yiWPlcCQtNsAPuLqEekNkO1a2BiRlveOiwSOgE+BJPYaMkRrP6RSySWEeIS9lU/JDIuNNzvojpbRU463KH5wuTgR4TZ52TSFtU006IDgzrWGGH0aeVPxhLFvrXEKYYN3WS2ihjq1GiOMwhJnom+BJR8l6GzxC/HiVdKYO4887t0l0GA3+YAI4HJSOkI8S7OPDnm/rYSSWE8ToXVb3Ck5F/So4syCA34NbjRftellDwON2e5ggznO/05cwUHgbVtHqANcH+NR2Fkgr//gAioxvr3w8yO0glyaFRcowNszLvuVlSmO91xD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(23010399003)(376014)(1800799024)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1dWZHpWQkcyVGs2WTVkWEZjM3RHVE96T1NnNEIvdFdDeHF4R0taKzJ2YWFx?=
 =?utf-8?B?UkpwSUZ0RnpQZWZrelJGeGpxakltanFXUHM4cDh5eXNaaGNibHJBSm1IMDZs?=
 =?utf-8?B?M2NYaHB6dzdpRk42aW5HeGxyelBRT2NpY0JJMThmSmRsRmVBSEhOalNBczE0?=
 =?utf-8?B?NDNTendCaUd3cVVHWlZCYy94OFFpbHkxN2tjWWVMeUpTOW5QS1ZOeXg0SUZ6?=
 =?utf-8?B?bjRMNjZmMmZsTjJrci9va2xSa2EwbXg4SXVwVnMrV0lqN0VGSFhoSVhZa2dU?=
 =?utf-8?B?SWN6cGoyblFzdTN3enQ2STRVTlo2Y0NLa0Z4YjNUbnBSYXJ2WWxvNTd6TXJZ?=
 =?utf-8?B?SFdrY2Q3UDBkazEydmhja2ZpWDVqcDBONWZuUGJLaXFKOEplZk5jNDhVT0Fu?=
 =?utf-8?B?aWVSdVdIM2kzUW1Pbm1DWEpGSG9lRm03c01wYTl1WUhYamlDSTNZUnpNVm9M?=
 =?utf-8?B?Zy9mNzlETS9vdG1namhiR1hNUnREdVRSZUhWME41M0tISkhaN1ZxRUdSZ0lk?=
 =?utf-8?B?ZHg0YmwzaGdwMCtVTDZuMDQzUnF1VEVEaGVBM0NNRGtlK1dULzN5bXlRcTkx?=
 =?utf-8?B?UmZvRVgyT1VDSjA5d1RUYUd6V1BSS3RmanF6RDAwSXhwNlNuREh3SWc1bUlw?=
 =?utf-8?B?akFOTDhpOFRxQk5iV05LUUtmOTA3RUlPUkVSeUxwODZFci81cFcwT1dzQThw?=
 =?utf-8?B?TXJ4UWZxekU3TDc4blBBeHFXbXkzcWZMTzFzU0lnODk0N0FWbUwxQjFUZDVj?=
 =?utf-8?B?ai9hc043S2RiVmFFUzZkMHNNMFlpMmEwV3dzMnphRElaMU55dHBZV3VaWEV1?=
 =?utf-8?B?VEdWUjFLZkFGc3k0MG01OFFreDlwUkRHQnhncnFEQ3gvQW9FNWsxL1ZxamNx?=
 =?utf-8?B?d2ZDUXlWQ1RrMTM2eTRSbDdZZitOTXJEanVSN2FhOFBFSnRJcmYrdmRUZU9C?=
 =?utf-8?B?VlpWKytrZFNOekRqTG4yQmJCV1FkS0p1QnVYZzJ5ZFMrMUVreXhHVmxFYVVC?=
 =?utf-8?B?SjFMMjlBRGpyQzlUOVRNMW03TmpLcEpPUmpEaGpPNkI4c25ESkZKU05RYnc0?=
 =?utf-8?B?YTJCM2doRGFjMnd3aHV6VUJkSmozZ05tSDNLOC9nMzllWHZHRnRULzd0ajgz?=
 =?utf-8?B?ZVJCZ2xiMG5SUC9nSDJLYVVHQWhubkpYdXQ0YUtucXNkc0ZvZWJuZ2d0RWlT?=
 =?utf-8?B?cm9qRHJVUGVhVll4djN0TWFoT01CbmNCU0hUYmdNMU8wbzdzVmx3dHd1SFAz?=
 =?utf-8?B?TDVlVGR4VGFTL3FuazgwS25Sa1pnYTNPb0NiSlpHeE9GT3NDdW4xd28weHVo?=
 =?utf-8?B?bFkvcGdWaElPRXI3OGJjN05rOXduY3lvZTdCLzdWUTgvS0VjcmNRd0tyN2V4?=
 =?utf-8?B?NXNDcEJmVFhKR3hjY0pDUGdaTW9DZTdtekNsbGR3d0RqbW10UWdnd3VkQTIz?=
 =?utf-8?B?ZnlSR0k0bnpoaVM4bmQzaWQ3UEVOR3pHWUZkY1FtdHl6a3dEUDdzUDlqR0xp?=
 =?utf-8?B?TDZpMDNJMk1UMFlyWGZRVHU2N2tNVzQ5L3BZYzhhbTY4WFVUVUw4eXRubEt6?=
 =?utf-8?B?M2JZQ2UzSmFPc0FFRTlLdlJpRXFkTG1BelVhKzlMVlhhMGJBVkUyYU5jZjJK?=
 =?utf-8?B?cThIWTM1ZUlnL0xkMVhiVUhleXpBOVg0dW1xM1JBcm8zeDY2eGZIaThqWXpr?=
 =?utf-8?B?amJnUGVBYlM3c0VMRkxTeExkcFFwMzZWaFB1cXhJc2NPb3pUMGljZDJRdkZv?=
 =?utf-8?B?Tys4M2prcW9ad0NmMFFKZGlvcGFRek12QWRJNlZkeFBCZTJzMUE2dVJRR3lE?=
 =?utf-8?B?dkZVYW5GUjRCckRkZ2xPMzZndXc1S0ZsZmQ1RDl2Ynk3ZGdxanFUM3M5L08w?=
 =?utf-8?B?ZHFraFNncEpLTDNPRmNXUkx0c3Vwd3BnT1YxRmlXclhyeDdGS1NMRmVrZHg3?=
 =?utf-8?B?TDRySWtzbVZYWlJNOUJZYi8yRVhHcmhxZ1R0aW5DNThJQ1hMbFNHOUdzdW1S?=
 =?utf-8?B?d3NHdlQwd1FaZHFCWlhlcDFxRmlMVDZNTEFBL1NSTFlNc3RpWEtiQlJPQmIr?=
 =?utf-8?B?dmIwK0xVRmVHR3RkbkNLUDVYUEJCVWRHa25LNXgzQlV1ODBzYnJ4NDZvN3lR?=
 =?utf-8?B?aUhoblMrWDlLaVorcVhqT3g3Y09kUWFQQUxCUjI2ck9hMDBjSGJKdGNMekd2?=
 =?utf-8?B?KzgyMHBRLzZHVno1OXBjWkN0NEtvdzhBYnhOWmlnRzk4YkJHVmxXSThTRVpv?=
 =?utf-8?B?RFg5dW1laUk1MGR6djdCTUdaemlRVXd2UWdpK1J4Ky9OWGFwN3IwL2lxQnhi?=
 =?utf-8?B?NmZtWE52ZWV0OE1uM2VkUkw5RGIvNzFxYjhtT1E4SUI1T1VMUzBhdz09?=
X-Exchange-RoutingPolicyChecked: F5hlan89Age9NXoywxzswGdiC/TwJluQblCrCSYPi/iI8JFcYT63HE6tO7Bfnj5vOLspULslHUVGVbvKu02MJXy+YU5Xjxw4LJTKGvqbnuPCPHwISe9TO5YF5k59RyBe8pZuLYiiS7VAX3wZuULHhZ9v4GBTt/s1kT6iEgj23vlF8DMC6gl9vb3MpaKxOvY39+UNcbOmRAMXKTC2Kr1jrtQm4pPeUxxYy+ZSPmSoSS0gaRWphlxjTvlWCbsKOI3msPJPvPH7/oKXMjFBgymw/M4zxufT4o9HpsHKkt1/jORd7ZCbDYZH2RefeLGqvbjX2CbylYOZqlt+EGtGEedc9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5124e792-c231-4a9d-e179-08dec6d54a73
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:47:31.7329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYsHjB2WcP4gpqJBb4zzyz117oXokOaPv98Hc7t4tc7yxptV4MMhUnZiir7CJmodjogpT00GFjHD608puvKppw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
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

Hi Sowmiya,

On 6/10/2026 3:17 PM, Sowmiya S wrote:
> get_lowres_mode() may return a high-refresh mode
> (e.g. 1080p@480Hz) that requires bigjoiner, while
> the preferred mode (e.g. 2560x1440@60Hz) does not.
> Committing such a mode on pipe-D (last pipe, no pipe-E)
> causes a hard test failure. Fix this by calling
> igt_check_bigjoiner_support() after setting the
> mode_lo override, and skipping the iteration if
> the pipe cannot satisfy it.
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   tests/kms_concurrent.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 158a13923..10e6b06ef 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -296,6 +296,16 @@ test_resolution_with_output(data_t *data, igt_crtc_t *crtc, int max_planes,
>   		/* switch to lower resolution */
>   		igt_output_override_mode(output, mode_lo);
>   		free(mode_lo);
> +		/*
> +		 * If mode_lo requires bigjoiner support that this pipe cannot
> +		 * satisfy (e.g. a high-refresh mode on pipe-D with no pipe-E
> +		 * available), skip this iteration.
> +		 */
> +		if (!igt_check_bigjoiner_support(&data->display)) {
This needs to be within intel check.
> +			igt_output_override_mode(output, NULL);
> +			i++;
> +			continue;
> +		}

Add a newline here?

With this updates patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>   		if (is_amdgpu_device(data->drm_fd))
>   			igt_output_set_crtc(output, NULL);
>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
