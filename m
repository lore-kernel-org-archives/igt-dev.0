Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A63C79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 12:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B9A10E5FD;
	Thu, 10 Sep 2026 12:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n885gEE8";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2026 12:02:46 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30C710E5FD
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 12:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789041767; x=1820577767;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VWhQrfU7Mw6I5e3QZxm90cJ/ATu+bWUEwK6df6iGcr0=;
 b=n885gEE8Z2dGwet9IwAlcviRXV88NDgGQb0PlOb3AjZ2vz9O0PpaJJqW
 RxeTOxC1ZA2D+FJ3/12VHyY0zj91lYg2uDW9oFRl+NvJekEHvJMuo4F/F
 Vni/GImYYAo9w7KysKyRdE37B/dF/1cmr1R1iHtWW08+zmiOpX3nvIp8F
 TJ28OVvZJjv9QfarPsVEBjDv4nwc/JVBYplFJtsydQp7rEbch2+KcCwVn
 Kj7VUwT6E2Bri94wLS7NT40+HTKwGvZRzu5n6EQELHV4DTFfad0O0/bO6
 f//g+IgdRjet7mpDHnRmIAHegH8ULrt0LdbGYnhrKzzLE2ddDitQEjGNh w==;
X-CSE-ConnectionGUID: UKM2IgGwSKG68CShhguL4w==
X-CSE-MsgGUID: bkOAlNw3TNyflGAGHaSBZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="10358"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="10358"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:55:36 -0700
X-CSE-ConnectionGUID: 5cPluNenS3W39ac4Ze/m0g==
X-CSE-MsgGUID: v7SDIXkORKmsxMx5knjzuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="269039376"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:55:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 04:55:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 04:55:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 04:55:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmzfjKER/6uG4oe7krsbPGWN9SNLFtVfCYbLin4cU0j5EPw1cc65S1W4vcGyfgqRmjGGbIhhb0ZgPCpk7Q/olnDKMaUhjAiyEOQBnXWB5Or+Ewdy86Bs4IrVr8SZv69mWLybpLOVNC+2KhLXUT+m+DFL08+3CxH+Tr2PcGkNZyMVf1oYavE+ir5eDQEsAQUW+OmeCaMxER7Hg/0lui6sK8DFD3aWI99Po8/MuE9HGkq/v1B16L+/dJramtXPFMNGQ26tWnRGkhmUG9wjDIIMaY4zhvAUhhGOesM0I38TyNUOc0fU11501YILSBn6uRD1Vly8MYQYzGSN/KQMOTNW4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yri1LP8we57lbXoiIFejLsuph0OOf3JpS20WvSenvPs=;
 b=UoyFU9vFuIJBT4e5uL1UqbbF1RnjBV/PRiZQ/yKR6Y8DLRkuCRYtJsqKZFqtHOwDSMPWMfs8LpsdIZTYeKzWNHcgjSkBC+azyLX82v2CAqP4zW05+JPeRdK4iV/wZeTt3mxvf/80qTmMRZ4JdV96KG/bcqtetxBQlnodDZPQogbBr/KQmDq3hZ5+nZDMjqdz4I8kNZs1vVFd7yZRABbcK91jncb01ZhOkoWIMxV9pdGka4EbQEk4kY8RTTPNzMiuWJQ1UV1ebT1vk80QOzivmij0YpdC22hFq6CvTLmeqVDC/a0ztj/IhmerkfFouFOAAeiSaX1h1SV40FcB/rGxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by LV0PR11MB340236.namprd11.prod.outlook.com (2603:10b6:408:3ee::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:55:32 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 11:55:32 +0000
Message-ID: <a8f7e5f1-144d-481a-97df-fec2d8f35481@intel.com>
Date: Thu, 10 Sep 2026 17:25:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/3] drm-uapi: Sync drm_mode.h with drm-next up
 to 1258f9c9ff1d
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Maarten Lankhorst <dev@lankhorst.se>, =?UTF-8?Q?Adri=C3=A1n_Larumbe?=
 <adrian.larumbe@collabora.com>
References: <20260907180204.336052-1-kamil.konieczny@linux.intel.com>
 <20260907180204.336052-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260907180204.336052-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::8) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|LV0PR11MB340236:EE_
X-MS-Office365-Filtering-Correlation-Id: 9671e3d7-11c2-40fc-43d0-08df0f326a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: vkZKTP6EDSXuRcjd4ZRYMA17hNF4uxfIQpLW7TvyrSBL5vTjvf9jmM3dmS5WrcySaRB2ZUSnXJRi04SiA6segFPfFhE1gyqmjygkYvw9reJw+Supc0Kk7W3GvTwLCKbryDaxGx8qSLm9BqPrjwYsdb/O+cqBHa2GtEDIJhgHvuvZu96xFtPc0PNtw713FIOULD3zBi2FeGac1y8ixi9TKnUM1tLvg1rOn9i0vKQAkm538OOuLhelpzl8ZSfSveIE/SQCM9kYUM9amGty55BTFAlk7d/3MMCWPGv4aHpSUR79Yg2dYncMDvrvtPYz0imFWOcB1ydQuC20dBkD2pNueeSo8UGeAzS82i7PW6BHYLuNJgoBJDLWBM9B6SLULtZBm32YmTH3SdFiKnRj5wx0bx439mwrDM0d0LaW97uLqTqqTaWlLb956za0BhwMQTUOXWjiqqB5TRqRp7nMzBOt6HB3EUUUEGCB3wBJjGmytM/NK6vuOVKQV4chbNDea+y9+LsvuXocnu6XxgVeP0Wq7LjT3c04pzM8x6GAAp57pnxOtN7svT5yX5kFkH480hNDP3dGJx1gGqc7JR9kaIp5TI+DtTIIc+2bnV8ztSa6wGfQDuK3Ylg3Yc9LUBSUVDdaeFyITzeV4mgbrhRndUAnDvqBFNqMdVs0okQEnephftA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUxvL0dvbXVFTWw0TVZzUVlFWVJaTGwvNVVOaEpmUlNmVXJ6eFZ1VnZoOUZl?=
 =?utf-8?B?RTJ4QXRiRXZ1QkJ6SEhEalozbDZwYU9QVU03N2QwUWY2VG9lNm9HK0JlVjkr?=
 =?utf-8?B?bTE3U2VobWZ2MGVjY0dGb09QcFhscFRpaEp2MHNvY1hxSFdwYVczbVB0TEVt?=
 =?utf-8?B?c3EzT3Z2MlZhTmlYcGNSdkpOY1hDSENTMm9qa1lLOG1IaC9QQkgwejlsVjlU?=
 =?utf-8?B?Nm1pNWphWFNsR1d1bzAxS0tyYU9YOXlqYWxmTnpTL1JJVS9rTUJhRW4vVXpY?=
 =?utf-8?B?MzhMYWgwOGJ2M0F5aGFqazdJNUZHaXRoZno2L2t0eC9WZTBOUjgyKzI0QUJv?=
 =?utf-8?B?a0g3aWs3cmF5cjZMQkIwdlhtTzhUODloMUF3MGZWOTFKU2Y0L2ZXRGM3aVZS?=
 =?utf-8?B?dStBWUhudUZSdUdSd3psazVLeTJUbW9uT0hTRzgxNCtjQnpVTGhyM0pxK0dG?=
 =?utf-8?B?cC9vZGQzTThOWUtSWkkwd0Zrb1dueEV1VlF6OE1IQTN2TkpHZEpYVTFyM0pL?=
 =?utf-8?B?aW1HNUdDZjI3ZXlMU1FjYVRUdTJKWjhqblJFZzd6bUpyc1FJRGtQQUh4ZUx5?=
 =?utf-8?B?T3AzbzBmUENFVHIvS3AyNTBsZVRrUGFVaTM2bWtlY0wwWFM2WllKd3JTZkc3?=
 =?utf-8?B?MHdVb0xHYjY3NjhWZFJLNythNVRxNFRrZ0dIeVViUjh2ZVlTUk5oYkY4MnJx?=
 =?utf-8?B?Slh1UUZtdXVrSnlmNlczTThNRGNHUG9QZHhBMmtMYnlGK2RlSVNxc3pDYzZL?=
 =?utf-8?B?REN5dCt6ZVkrcG9PbzBJNTJaYk9jQVBydTA3VWoxMVpFS1luYk54WWZPWGl1?=
 =?utf-8?B?TC9TZmkxSTNhWVVQVG11YldUdjNQVWt0NXlaY002NmIzTG1senNOVndObE96?=
 =?utf-8?B?SkVNZmlSNVFTYzNpdjlBQ3VVYzM1MkZhaXliY0lUdVQrWS9BS2FRVEsxbDdy?=
 =?utf-8?B?SUwvV0E1L2ZLMUtkdDFqYWhZVFM1VWh3Wk92dW05aXdvQ3RZMTNvekFnaW1Q?=
 =?utf-8?B?clp3NjZuZjdkUEJXNW5SZnE4cEVDTGtJOU04MTAvSURjWGw0U3h4YXd0YWlL?=
 =?utf-8?B?UEZMazBjZ2lBMmo5UklITFM5aUVWbFNmSmVRT09aYXRBYlh0Y0txZGNOcjNs?=
 =?utf-8?B?MjJ5VW9pNWIvU2pRZmdobC85T3JJMW1ja25EbEp3ajJPUjhVRWtFcXlNVU1r?=
 =?utf-8?B?dXhzWCt0OW9QV0xYTVpURUJqRVoybmZ6RE5Zd0VMR0JhczBoRVZTd003dzBj?=
 =?utf-8?B?NTkvcWNyb3NmekZnajVPK3lyUkNhWUkxOGtIdExTNEdkaWx6ZUxPQlFGRVVj?=
 =?utf-8?B?OHZWLytUYk1EV01IWkRFcjZkRlFtVWhBNjJzMTdjMlV6RmlpSXY4RzkvdXg0?=
 =?utf-8?B?a1RGbEpiTGx2K2dGMmMzdVRlUkpPVndVSUFQR2N4bTJWWUtoK3hvTFFYSk9m?=
 =?utf-8?B?UW9mK2l4cTZxTEZnblllNmpHMENxeWhCZ3lybnE0T1BicHBuR3hqZTNrZ015?=
 =?utf-8?B?emx0NkJpd0JuckFJYmNMN3l3OHVwRnNXbndwcXp0S2hTcFVzc1cxM0NnYXNF?=
 =?utf-8?B?dWxBUXJuV0VQNG9PcHVPZHBEOTdNQkkyL1AvZHgwdDJTSWRpNjY0T0xUU1Z3?=
 =?utf-8?B?cXlnWm91QndZRXpKUmc4STh3WlJ5TFFzSW05YzBKbFpvZWQvQVR2WFF5UmxX?=
 =?utf-8?B?YnBaOVFiR1AyeEtFOXNBMHVZand3TDNUVi9QOXVPRnJuT3owQlIzMzQ0bTI4?=
 =?utf-8?B?RWFkUStMVlluNlJOcGM4QnhsdmhNUURBUitwV0tHa21yaXZXNzl1aXU4SFls?=
 =?utf-8?B?VHhoWmhDdUlsa0ZrVW00a1lJQk13NWk3WXJnWUJ5Z1F4c0xGMnZnVkpZQjl5?=
 =?utf-8?B?VkZ0aklKczY5NEpNWER2WVNkMXZhNWJ4Z0dYbVdJMk5zYmFyZUwxQVJOWlRM?=
 =?utf-8?B?bDNQQVlyaTZaYlB5b0lUVTl5T3puaTc3d1g0elZucDgyR0U1TWJURTNraER5?=
 =?utf-8?B?aU9XYm01Z3FteVgwT1FWTlVjMmlnRklMYWVyazc4S2o5aGhQd05paXJYSlJs?=
 =?utf-8?B?SEFSY0w5VndaQWQreEFTRFRUNzRqZHNXdzlVTXgwSWl4bXJ0S1FrNjM2ZVFE?=
 =?utf-8?B?YXpqb3lDK0pDMzhOL3NoVS81aklLUFk2UDY5aEhXZkQzTTRoTnlsLzV6eTlC?=
 =?utf-8?B?NFJGWDFzTlU5ZnhSU09RVmdpL25ERE5zRElhTnp6SllqcWp3b0dRRDdNRXRB?=
 =?utf-8?B?YlR1ZlZ0dE9Kc2s4c1RaVnFUVVR3UmttZkhYZW1ieUpGbkt3LzVXdTlUZHJH?=
 =?utf-8?B?QVhlQ0RXZmRxaE1hMzRFbUNsQkUwMk1idWYzOW9RcjlrYzZRT3ovdz09?=
X-Exchange-RoutingPolicyChecked: RRrHgYxlkDH+GPR3E1v3j8ed9Ay9bfAUsZEcKRoKvNfS/fEq/HRAJgN0wLefzCUsR0z7rNhZZgE61S6W9Z7QVPaN0oShBn/k5Kg6NurTYCoiTmZjK8aais61XnVhYNmZhKVnoCkbsXd7bHJoKgG8+vsOa8Zh+oS8caKFL/81kofrkYcMJ1zDfTzBrvm9XzpUJFPpVRQVq1RHCKAF0Fegq4z1xvIAsoRys0aNNIhKlCz9plBTqRwKfIDzFVOlndkLug5GKiGH64VfGxSDBxyk1Cm282dUEMwAxkRH1WtsFQUeYVbYI1vcOOF6KtY52yZg71C59VlyILh92qh/zAEZsQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9671e3d7-11c2-40fc-43d0-08df0f326a7c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:55:32.4903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVsOhRXrAzDLXu0dvPgwHY6VDun/VDQ5o3t5OEwXuwlO0bPl5CnEE6DOVyLtKgvMFsUIEY8L8z5UtbUWLw3eFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB340236
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

Hi Kamil

Thanks for the patch. LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 07-09-2026 11:32 pm, Kamil Konieczny wrote:
> From: Maarten Lankhorst <dev@lankhorst.se>
>
> Sync the drm_mode.h up to commit 1258f9c9ff1d to get all the
> background property macros. With this following changes comes:
>
> 1258f9c9ff1d ("drm/edid: parse panel type from DisplayID 2.x Display Parameters")
> a1b6cf8e5e7e ("drm: uapi: Use SPDX in DRM core uAPI headers")
> 42dab3138176 ("drm/connector: Add a new 'panel_type' property")
> db971856bbe0 ("drm/colorop: Add 3D LUT support to color pipeline")
> 7fa3ee8c0a79 ("drm/colorop: Define LUT_1D interpolation")
>
> Update linux_scaffold.h to take the new changes into account.
>
> This differs from drm-next with added DRM_COLOROP_FIXED_MATRIX
> colorop property and removed to linux kernel includes.
>
> v3: sync with most recent drm-next change (Kamil)
>
> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> fix drm-uapi
> ---
>   include/drm-uapi/drm_mode.h | 213 +++++++++++++++++++++++++++++++-----
>   include/linux_scaffold.h    |   2 +
>   2 files changed, 190 insertions(+), 25 deletions(-)
>
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index 0924e38af..2aa005fcd 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -1,27 +1,10 @@
> +/* SPDX-License-Identifier: MIT */
>   /*
>    * Copyright (c) 2007 Dave Airlie <airlied@linux.ie>
>    * Copyright (c) 2007 Jakob Bornecrantz <wallbraker@gmail.com>
>    * Copyright (c) 2008 Red Hat Inc.
>    * Copyright (c) 2007-2008 Tungsten Graphics, Inc., Cedar Park, TX., USA
>    * Copyright (c) 2007-2008 Intel Corporation
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> - * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> - * IN THE SOFTWARE.
>    */
>   
>   #ifndef _DRM_MODE_H
> @@ -166,6 +149,11 @@ extern "C" {
>   #define DRM_MODE_LINK_STATUS_GOOD	0
>   #define DRM_MODE_LINK_STATUS_BAD	1
>   
> +/* Panel type property */
> +#define DRM_MODE_PANEL_TYPE_UNKNOWN	0
> +#define DRM_MODE_PANEL_TYPE_OLED	1
> +#define DRM_MODE_PANEL_TYPE_LCD		2
> +
>   /*
>    * DRM_MODE_ROTATE_<degrees>
>    *
> @@ -895,31 +883,48 @@ enum drm_colorop_type {
>   	/**
>   	 * @DRM_COLOROP_1D_CURVE:
>   	 *
> +	 * enum string "1D Curve"
> +	 *
>   	 * A 1D curve that is being applied to all color channels. The
> -	 * curve is specified via tha CURVE_1D_TYPE colorop property.
> +	 * curve is specified via the CURVE_1D_TYPE colorop property.
>   	 */
>   	DRM_COLOROP_1D_CURVE,
>   
>   	/**
>   	 * @DRM_COLOROP_1D_LUT:
>   	 *
> +	 * enum string "1D LUT"
> +	 *
>   	 * A simple 1D LUT of uniformly spaced &drm_color_lut32 entries,
> -	 * packed into a blob via the DATA property. The driver's expected
> -	 * LUT size is advertised via the SIZE property.
> +	 * packed into a blob via the DATA property. The driver's
> +	 * expected LUT size is advertised via the SIZE property.
> +	 *
> +	 * The DATA blob is an array of struct drm_color_lut32 with size
> +	 * of "size".
>   	 */
>   	DRM_COLOROP_1D_LUT,
>   
>   	/**
>   	 * @DRM_COLOROP_CTM_3X4:
>   	 *
> +	 * enum string "3x4 Matrix"
> +	 *
>   	 * A 3x4 matrix. Its values are specified via the
>   	 * &drm_color_ctm_3x4 struct provided via the DATA property.
> +	 *
> +	 * The DATA blob is a float[12]:
> +	 * out   matrix          in
> +	 * | R |   | 0  1  2  3  |   | R |
> +	 * | G | = | 4  5  6  7  | x | G |
> +	 * | B |   | 8  9  10 12 |   | B |
>   	 */
>   	DRM_COLOROP_CTM_3X4,
>   
>   	/**
>   	 * @DRM_COLOROP_MULTIPLIER:
>   	 *
> +	 * enum string "Multiplier"
> +	 *
>   	 * A simple multiplier, applied to all color values. The
>   	 * multiplier is specified as a S31.32 via the MULTIPLIER
>   	 * property.
> @@ -929,9 +934,22 @@ enum drm_colorop_type {
>   	/**
>   	 * @DRM_COLOROP_3D_LUT:
>   	 *
> -	 * A 3D LUT of &drm_color_lut entries,
> +	 * enum string "3D LUT"
> +	 *
> +	 * A 3D LUT of &drm_color_lut32 entries,
>   	 * packed into a blob via the DATA property. The driver's expected
> -	 * LUT size is advertised via the SIZE property.
> +	 * LUT size is advertised via the SIZE property, i.e., a 3D LUT with
> +	 * 17x17x17 entries will have SIZE set to 17.
> +	 *
> +	 * The DATA blob is a 3D array of struct drm_color_lut32 with dimension
> +	 * length of "size".
> +	 * The LUT elements are traversed like so:
> +	 *
> +	 *   for B in range 0..n
> +	 *     for G in range 0..n
> +	 *       for R in range 0..n
> +	 *        index = R + n * (G + n * B)
> +	 *         color = lut3d[index]
>   	 */
>   	DRM_COLOROP_3D_LUT,
>   
> @@ -949,7 +967,6 @@ enum drm_colorop_type {
>   
>   /**
>    * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
> - *
>    */
>   enum drm_colorop_lut3d_interpolation_type {
>   	/**
> @@ -960,6 +977,19 @@ enum drm_colorop_lut3d_interpolation_type {
>   	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>   };
>   
> +/**
> + * enum drm_colorop_lut1d_interpolation_type - type of interpolation for 1D LUTs
> + */
> +enum drm_colorop_lut1d_interpolation_type {
> +	/**
> +	 * @DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR:
> +	 *
> +	 * Linear interpolation. Values between points of the LUT will be
> +	 * linearly interpolated.
> +	 */
> +	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> +};
> +
>   /**
>    * struct drm_plane_size_hint - Plane size hints
>    * @width: The width of the plane in pixel
> @@ -1065,6 +1095,14 @@ struct hdr_output_metadata {
>    * Request that the kernel sends back a vblank event (see
>    * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when the
>    * page-flip is done.
> + *
> + * When used with atomic uAPI, one event will be delivered per CRTC included in
> + * the atomic commit. A CRTC is included in an atomic commit if one of its
> + * properties is set, or if a property is set on a connector or plane linked
> + * via the CRTC_ID property to the CRTC. At least one CRTC must be included,
> + * and all pulled in CRTCs must be either previously or newly powered on (in
> + * other words, a powered off CRTC which stays off cannot be included in the
> + * atomic commit).
>    */
>   #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>   /**
> @@ -1161,7 +1199,7 @@ struct drm_mode_crtc_page_flip_target {
>    * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
>    * @height: buffer height in pixels
>    * @width: buffer width in pixels
> - * @bpp: bits per pixel
> + * @bpp: color mode
>    * @flags: must be zero
>    * @handle: buffer object handle
>    * @pitch: number of bytes between two consecutive lines
> @@ -1169,6 +1207,54 @@ struct drm_mode_crtc_page_flip_target {
>    *
>    * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
>    * the kernel fills @handle, @pitch and @size.
> + *
> + * The value of @bpp is a color-mode number describing a specific format
> + * or a variant thereof. The value often corresponds to the number of bits
> + * per pixel for most modes, although there are exceptions. Each color mode
> + * maps to a DRM format plus a number of modes with similar pixel layout.
> + * Framebuffer layout is always linear.
> + *
> + * Support for all modes and formats is optional. Even if dumb-buffer
> + * creation with a certain color mode succeeds, it is not guaranteed that
> + * the DRM driver supports any of the related formats. Most drivers support
> + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
> + * plane.
> + *
> + * +------------+------------------------+------------------------+
> + * | Color mode | Framebuffer format     | Compatible formats     |
> + * +============+========================+========================+
> + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_BGRX8888 |
> + * |            |                        |  * DRM_FORMAT_RGBX8888 |
> + * |            |                        |  * DRM_FORMAT_XBGR8888 |
> + * +------------+------------------------+------------------------+
> + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
> + * +------------+------------------------+------------------------+
> + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
> + * +------------+------------------------+------------------------+
> + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_BGRX1555 |
> + * |            |                        |  * DRM_FORMAT_RGBX1555 |
> + * |            |                        |  * DRM_FORMAT_XBGR1555 |
> + * +------------+------------------------+------------------------+
> + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_D8       |
> + * |            |                        |  * DRM_FORMAT_R8       |
> + * +------------+------------------------+------------------------+
> + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_D4       |
> + * |            |                        |  * DRM_FORMAT_R4       |
> + * +------------+------------------------+------------------------+
> + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_D2       |
> + * |            |                        |  * DRM_FORMAT_R2       |
> + * +------------+------------------------+------------------------+
> + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_D1       |
> + * |            |                        |  * DRM_FORMAT_R1       |
> + * +------------+------------------------+------------------------+
> + *
> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
> + * legacy user space. Please don't use them in new code. Other modes
> + * are not support.
> + *
> + * Do not attempt to allocate anything but linear framebuffer memory
> + * with single-plane RGB data. Allocation of other framebuffer
> + * layouts requires dedicated ioctls in the respective DRM driver.
>    */
>   struct drm_mode_create_dumb {
>   	__u32 height;
> @@ -1458,6 +1544,83 @@ struct drm_mode_closefb {
>   	__u32 pad;
>   };
>   
> +/*
> + * Put 16-bit ARGB values into a standard 64-bit representation that can be
> + * used for ioctl parameters, inter-driver communication, etc.
> + *
> + * If the component values being provided contain less than 16 bits of
> + * precision, use a conversion ratio to get a better color approximation.
> + * The ratio is computed as (2^16 - 1) / (2^bpc - 1), where bpc and 16 are
> + * the input and output precision, respectively.
> + * Also note bpc must be greater than 0.
> + */
> +#define __DRM_ARGB64_PREP(c, shift)					\
> +	(((__u64)(c) & __GENMASK(15, 0)) << (shift))
> +
> +#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)				\
> +({									\
> +	__u16 mask = __GENMASK((bpc) - 1, 0);				\
> +	__u16 conv = __KERNEL_DIV_ROUND_CLOSEST((mask & (c)) *		\
> +						__GENMASK(15, 0), mask);\
> +	__DRM_ARGB64_PREP(conv, shift);					\
> +})
> +
> +#define DRM_ARGB64_PREP(alpha, red, green, blue)			\
> +(									\
> +	__DRM_ARGB64_PREP(alpha, 48) |					\
> +	__DRM_ARGB64_PREP(red,   32) |					\
> +	__DRM_ARGB64_PREP(green, 16) |					\
> +	__DRM_ARGB64_PREP(blue,   0)					\
> +)
> +
> +#define DRM_ARGB64_PREP_BPC(alpha, red, green, blue, bpc)		\
> +({									\
> +	__typeof__(bpc) __bpc = bpc;					\
> +	__DRM_ARGB64_PREP_BPC(alpha, 48, __bpc) |			\
> +	__DRM_ARGB64_PREP_BPC(red,   32, __bpc) |			\
> +	__DRM_ARGB64_PREP_BPC(green, 16, __bpc) |			\
> +	__DRM_ARGB64_PREP_BPC(blue,   0, __bpc);			\
> +})
> +
> +/*
> + * Extract the specified color component from a standard 64-bit ARGB value.
> + *
> + * If the requested precision is less than 16 bits, make use of a conversion
> + * ratio calculated as (2^bpc - 1) / (2^16 - 1), where bpc and 16 are the
> + * output and input precision, respectively.
> + *
> + * If speed is more important than accuracy, use DRM_ARGB64_GET*_BPCS()
> + * instead of DRM_ARGB64_GET*_BPC() in order to replace the expensive
> + * division with a simple bit right-shift operation.
> + */
> +#define __DRM_ARGB64_GET(c, shift)					\
> +	((__u16)(((__u64)(c) >> (shift)) & __GENMASK(15, 0)))
> +
> +#define __DRM_ARGB64_GET_BPC(c, shift, bpc)				\
> +({									\
> +	__u16 comp = __DRM_ARGB64_GET(c, shift);			\
> +	__KERNEL_DIV_ROUND_CLOSEST(comp * __GENMASK((bpc) - 1, 0),	\
> +				   __GENMASK(15, 0));			\
> +})
> +
> +#define __DRM_ARGB64_GET_BPCS(c, shift, bpc)				\
> +	(__DRM_ARGB64_GET(c, shift) >> (16 - (bpc)))
> +
> +#define DRM_ARGB64_GETA(c)		__DRM_ARGB64_GET(c, 48)
> +#define DRM_ARGB64_GETR(c)		__DRM_ARGB64_GET(c, 32)
> +#define DRM_ARGB64_GETG(c)		__DRM_ARGB64_GET(c, 16)
> +#define DRM_ARGB64_GETB(c)		__DRM_ARGB64_GET(c, 0)
> +
> +#define DRM_ARGB64_GETA_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 48, bpc)
> +#define DRM_ARGB64_GETR_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 32, bpc)
> +#define DRM_ARGB64_GETG_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 16, bpc)
> +#define DRM_ARGB64_GETB_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 0, bpc)
> +
> +#define DRM_ARGB64_GETA_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 48, bpc)
> +#define DRM_ARGB64_GETR_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 32, bpc)
> +#define DRM_ARGB64_GETG_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 16, bpc)
> +#define DRM_ARGB64_GETB_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 0, bpc)
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
> index 39f68b8d2..f6e8983b9 100644
> --- a/include/linux_scaffold.h
> +++ b/include/linux_scaffold.h
> @@ -31,6 +31,8 @@ static inline s64 sign_extend64(u64 value, int index)
>   	((~0ULL - (1ULL << (l)) + 1) & \
>   	(~0ULL >> (BITS_PER_LONG_LONG - 1 - (h))))
>   
> +#define __GENMASK GENMASK
> +
>   #define BITS_PER_BYTE 8
>   #define BITS_PER_TYPE(t) (sizeof(t) * BITS_PER_BYTE)
>   #define BITS_PER_LONG BITS_PER_TYPE(long)
