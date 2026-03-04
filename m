Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CCCEFCE23
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 17:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D623910EA83;
	Wed,  4 Mar 2026 17:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciAO4bwI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D55910EA7D
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 17:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772645827; x=1804181827;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zpYDW/Wz158wvQJjq1W61yyUI3pXjr9Zo3m+YIB2R/k=;
 b=ciAO4bwIzC6ORHuBH2U4L1j65mkJOp2KzULLKrnDJfNvq/6QczjSPyQ0
 NNRxGmcy+EqNPrOnwYKdUU4qEJ/ON0HIAxaVi/xgdvjPD7rWx9KSobJLq
 WQ8Ze+7eVSscCnuyn5ro9xcRWBEx2tsGflEcADRcXuRCE+D2WzZSkxBYP
 /Z2tXIUcu70Wn9c3BnEwDecu4Om1mSbcjjKpQyetvjng1cXCjfxgjoGHa
 nnWu6BfZBOFnjdSFLdwvkZ2y2e0AkFbXnBL6HBRiNjQsQmaPA33fdqFKP
 Q8qUoQQaGR2i78CqoT9VXrh/0j/kh5EtW9qlx3UFhVxtKMv/mA1I711x1 g==;
X-CSE-ConnectionGUID: PgTRE1XJTcqs8iijMiP90w==
X-CSE-MsgGUID: qEsT/8isRF+jcgdmd719zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73681984"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73681984"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:37:06 -0800
X-CSE-ConnectionGUID: daTJTnikRXOPAbQ1HH/Pxg==
X-CSE-MsgGUID: GWsUqR1KRVKkMckFZwYvUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="245029517"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:37:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:37:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 09:37:05 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:37:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxbL+utzEckGV5klOjq8IUJN96irSwTTTLkheoZpZ9pNqUVHUXKAAuko0DreEHHQ2U9YSqKyJvv4HbYdRaXh7vks5idp+dtwzI2O813fucpC3ywYrKsObk0uXbRSEDELGY1T0EtdUFMX/kQN9CVUeKO2HVDUXwkkvWlSwzX8AG2hhy3czpR9mS1x2kbHT4nOECdH6j7QQWX3WyF8Dct5Q3nxEhVchG+0X1gWpJLfXotxNd7VB1FaE33XNaykIxy3yFyNAwcwNAp90SkX3+TsIja1ydFUGmGasojnT3MgnuVuueXOFz2tGRvZJHMHHBvdXjpvy8Hy+Ql6AUATOAE2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lzm4jj3mko8bLOoanOyotOt3woZSko0euak2Wo2jSFo=;
 b=mMrUlf7DzxjydfRogHZkp7PX24ys6MOuf+2asGB+VJzNyGTC+sbtYrj90asZdkt+LjZp5+QOzfq5JGAa9G8aONfycKELD3YmgRVTPOf5ZJ2yJ25z8yK/msKmGCXn34Gsq9gWRfU5MuZdDkkLrbrNDWCC9p8F//olabgD+VQFhG9STbVFI57GXY4uUGA3EhFIMXCermv7stNCAFhfwPDKFLva1EmhbPuFpJJEB/d6PFVMipJb7y+lTzjD9gkLMhxMW66EoaISrJPH1y2ekBA6dUWiEnBJO2efSIRnpSfWIb8/lKxnD1nf31tdxM97nrSN3Z9QgWvNfEU8sEslkT5Ifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by LV3PR11MB8556.namprd11.prod.outlook.com (2603:10b6:408:1b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 17:37:01 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1405:e848:c9a7:e962%3]) with mapi id 15.20.9632.015; Wed, 4 Mar 2026
 17:37:01 +0000
Message-ID: <a887180c-dc2f-441a-9e4f-252780166d77@intel.com>
Date: Wed, 4 Mar 2026 09:36:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/core_hotunplug: Open render capable DRM device
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <stuart.summers@intel.com>, "Janusz
 Krzysztofik" <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <9e4d3126426686f9fde73011753ca1e85a32dd0d.1772578021.git.jagmeet.randhawa@intel.com>
 <20260304135601.iwue6vspcb5oxbo5@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20260304135601.iwue6vspcb5oxbo5@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:a03:333::23) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|LV3PR11MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da8d87c-94fb-45d5-414e-08de7a14a489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: NKDLv2u4cBF49D+Rsv1iO8kwhUDpytPkkn+/snXDGz1uQSaqR1jAAkslSTB45wKqAL7+unpIl0vg9raYdctAlCSt/5wEJ8+mAZaMxUFBV8zWwZgyU7JeeXbjQXKY+I+Re4LMPktC6Qi8gnF2M2BhjjDdXUVqvrohU5kGLLeg2DMaoNLEDIQV0Mkq1npdTO/sp2I5s6dUC/lMzhFptBBngXYO4x8B+eJGCxtL/3bA+w5gqFX5BzSFspSe/GoPrkFMVmgNqAkfXmQLGpeOs1XAXxuVW4XtBNujz7b2Z3z0ogbPJwttEdTtCTx8g5sSCwh3e5xjEYDIjnzzZtyLccwo9ldP6VJufURSJ2sJh950TLtgnAMGt4+f5DqSJto3zLnmxm3Pl93ZACvW7X59g9HoEhJDfPo5AvsQHwAOI0WUZPH3E49jBN83nCnk/wXTQkEkMls3p/AFY6piEOm0PXePvA7jmFXjk/81QEnFOGNbYlHzDeIfFPjFkRY+CjGqgYxwcUJZIlEdB6O0Arragcw5X4+P6mvPiaCjvjMPDtAts5crxZgL9zKLcNNq2EvHxVuV4otTxYfWxzuuVYf7q7Go38Qn3pgSSITqbHTveMUwZpMwJc/vwjhWrtSd3/+6Rv3DgcZc1cqBla4wQRdL4e6LjcUoTLhjzHzeXxojNvseQbFGwBA9SZNw9x8WlFK+a2bGxphJ1pvs+7Xp52498qzz+1oKk6HFWki5rvig+xL0vFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzMrSkt0aEFiUEl3ZmtLemlkTkhXblNrSlhqNmFrQncvcFpNWmJyOTFwb0Qz?=
 =?utf-8?B?Q0pwTkJJdlh5blY1TGVFVTBSVDE0aDc2b0Q1YmlhelRkL2hoQWFscHRHM3hY?=
 =?utf-8?B?REVWSDlCc25abVcvVTZiNVZNc2d4bnMwcmNaNGZoTitFaVdqTFhvM3QvY0w5?=
 =?utf-8?B?S1lleXZod2p0MmQzMWdwcnFNVHN6ZDFUdysvUnhSeTM0bDFuYS9oVUhEUmtT?=
 =?utf-8?B?QWFSYTArVnJFbC9pYWY1V21vK0VHWHlWM0ZiZS83RThDNlpMWHYzKytaWDQ0?=
 =?utf-8?B?dlI3dnlGdkk5WG1PaU9MZzRvc0VMTnpTQzVsdlBqRVk3enIwYktlUUNBVDYy?=
 =?utf-8?B?WU5sVTRlekwrSk1HbnBCOG5mdUFJd2VNVDNPV2ZpRWw5SDgzNVFJSUNLVDRq?=
 =?utf-8?B?VkxSV3Y0dUtMSHdwOEx6b0t6TTBWYnNzRFcvMmsvYWpTRVBZdnY4bTBCeEo3?=
 =?utf-8?B?Tnd6K0VpZS9ZUHJUdGhGdk5kWE94VWhjMzNLVnFCMWxkSStaeFR3b1VnUjdF?=
 =?utf-8?B?QjJacjRkZDREbVlLM1NlVVRQMDVwUXlDV0hIYnhKaWIwT1JscTdlcDY3Mmsy?=
 =?utf-8?B?THU4bDZ3WFl5NzhQMStXMGl6RGVmd1dHektDczluUS9EaElDN1VPY1VXQ0R6?=
 =?utf-8?B?OXdYMjUySzJleXo0b2Z1QUMyUUUwS3Nid2pSTUVTK2ZNRzdPUENuVTZRRmlv?=
 =?utf-8?B?WXk4eEE5T2grV3lIekZuS25BRUdaRXhOcHJibmwyQkR3TnBwWXBHZHEvRkQ5?=
 =?utf-8?B?SEpWK3VyZGpCWUNlVjVqUXg4b1dPVHBYNW84RzNZcHk0SFBhUnVoNWJaZ3lR?=
 =?utf-8?B?aTN3WFo0WUl4Z1cvb3Y4OFo3cjZudmF6dGVrcnVaeVNLWTlZYkwyUzhtUjM2?=
 =?utf-8?B?d0FzTHIxNHdLSzg1NzA4c2dObzJQekRUUHNkU29uSGY0U2tNQWdJMTJnc2Jt?=
 =?utf-8?B?cFo0UGhoeUVGV3d5bldWRTN5N20xcWxJTGtaenJXL3RZUDRFMGd1ZGJpREQw?=
 =?utf-8?B?dDVXbzZIUWhrL2VTd3lCR0l0Q2krZVZuclVVVUthSGZCQkt3bG16REtmNlFY?=
 =?utf-8?B?aCtHTG1oV3JZT0RHSVJnbDhad1d5RnM2c2EwWmo2dThUSU1JMjRnWlNDdEgv?=
 =?utf-8?B?cUxtZjFqZnRUZW5Tak5aMUJER3Z4Smp4aklZbFE1OVorSGlKUnpZWHM3Q21s?=
 =?utf-8?B?cGs3Y0FuOHR0SnpUcnVFbGR1V0xOUDNEaXErZ1NDeG9ybXk0bGEwMHNBajlE?=
 =?utf-8?B?YnQ2ZGxsQmhQVllZQUN0WVlZM3lZZG4xNXhKdHZQNVJ4ejlETUpCUG9OQ0p1?=
 =?utf-8?B?eEcrMTBIcE5sbFBhUWFiL0draHN2V213OHpKSzJ1REtmNHlnMjYzOVNUVExW?=
 =?utf-8?B?VkRKc0M2bE5Pc0l2MlNaVldmcXNuaXgvWXZJaldTYXp2a1ZKdDlwdmI0cEJn?=
 =?utf-8?B?N3d3dDZIdmE0cEEybDdTa2NWcU5xVnpLVUVGSHIvdFgxQjR2MkJoZHc3bFhC?=
 =?utf-8?B?U3ZmWW1zNkZEMjF0Uk9tWTZIVEFrN0dqNzVSQzMzRU1La0MzQkx3WnRtNlUz?=
 =?utf-8?B?UWFRdzZXalBoU3RaaEM0TjIyemc0K1dweGhGL2ZLQXFPSTVLNi80bDNqZHY0?=
 =?utf-8?B?ZEgxT0l2ZHAxZzNXL3ZPNk9VeWt6T2xaYmlxSzVUa0J5emM4Y21DWU9Xa2tJ?=
 =?utf-8?B?WHJHaFZaSyswbnh2c3pYaFU2eE04ZGRjdUdZQ2FSWG1GQktuMHVQSExMRVBo?=
 =?utf-8?B?Yzc2OURIUFB5Ni9pSHVHejU4REREaDVCWEJJQTJpWnJJUUE1RDUvMWtzY1lu?=
 =?utf-8?B?OE1Ta3ZtVlcxVDUzRDduakc4dnd4QWhGVFVUTzE3cGxIWWRWRnVBd2Y4T1Bv?=
 =?utf-8?B?b29nWXBPdUFJZXY0Y1Z6VWtXTEU0azBIS09LYkRibFBaQkQ5NHBZRDlOZGFr?=
 =?utf-8?B?cGdZdFBRb2tSeVo4VDUybWJya0lyVTY0N1hlaVFVeFh1RHdveXNKTGIyck9k?=
 =?utf-8?B?NDZOZ0pjdi9nam56Sk13UjlXM2ZlRUF0bkhsaHhSdnFjUEZSeU1HbGxzY0xi?=
 =?utf-8?B?UGh2aXdxK1JhR0RQMTZ6OGhWN2owSGdQdkJsQjZaR014eGY3MFo3OG1FVC8r?=
 =?utf-8?B?RjIwZHZOcmFFaEF1L1lBODhEUko2anJKOGFrMEVpNi9QZ2txVmlUcHNMY2ox?=
 =?utf-8?B?b2VwbXIzdE5ZZUs0WDg4OUdYWVdQUHZPZnZsUFdpLzc0TGFmU2RUOUpHUHZ1?=
 =?utf-8?B?dzB0SitKeFZtMDlTeVl1VG9aT1JRSXh3YVd5RWwwakR5R09Ia0p2VHM2T2FT?=
 =?utf-8?B?ZkVQdmJLMko3czJJeXdvZndXT09QL0RMcW50OGp0di9iNGxMN3A3Nml6RjA1?=
 =?utf-8?Q?9yHvB60YyUzml7IY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da8d87c-94fb-45d5-414e-08de7a14a489
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:37:01.3967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKQ7ZRTrjUUP28rhRDkEIBAedxMlu0v9qlfJk8z+WBt1Yv6Vvv2HBqLvGOnYu0RHVUV1t6ksyeHQwMNheFYtH8ZUcZK81aCM6wkK5QuBouM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8556
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

Hello Kamil,


For this test file, All subtests use render device for health checks. 
Because of that,

selecting a render capable device up front seems like the most direct 
way to establish test

precondition and avoid accidentally selecting a card-only driver such as 
simpledrm.


Adding simpledrm to the list of known/blocked drivers could work, but we 
would still need

additional logic to continue scanning and select next suitable driver. 
Selecting a render-capable

device first naturally ensures we pick a device that exposes a render 
node and avoids the simpledrm

case without adding special handling for a specific driver.


There is no public GitLab issue for this, failure observed internally.

On 3/4/2026 5:56 AM, Kamil Konieczny wrote:
> Hi Jagmeet,
> On 2026-03-04 at 06:53:32 +0800, Jagmeet Randhawa wrote:
>> The test may select simpledrm when opening DRIVER_ANY,
>> which does not expose a render node. This causes the
>> later render open to fail.
>>
>> Open a render capable device initially using
>> __drm_open_driver_render(DRIVER_ANY) to avoid
>> selecting simpledrm.
> This is strange, as this test assumes card open and then tries
> uses render for verification so I am not sure if you could
> start with render. Adding Janusz to Cc.
>
> Could you also add links to issues on GitLab, if there are any?
>
> Other idea to solve this would be to add simpledrm to known
> drivers and a blocked ones, like VGEM.
>
> Regards,
> Kamil
>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>>   tests/core_hotunplug.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
>> index 7c9dae1bf..3a612fce2 100644
>> --- a/tests/core_hotunplug.c
>> +++ b/tests/core_hotunplug.c
>> @@ -696,8 +696,8 @@ int igt_main()
>>   		int fd_drm;
>>   		char driver[32] = {};
>>   
>> -		fd_drm = __drm_open_driver(DRIVER_ANY);
>> -		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
>> +		fd_drm = __drm_open_driver_render(DRIVER_ANY);
>> +		igt_skip_on_f(fd_drm < 0, "No known DRM render device found\n");
>>   
>>   		priv.chipset = drm_get_chipset(fd_drm);
>>   		/* Make sure it opens the same driver */
>> -- 
>> 2.52.0
>>
