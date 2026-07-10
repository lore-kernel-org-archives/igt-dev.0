Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB702C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 05:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F9010F75E;
	Fri, 10 Jul 2026 05:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jH8kKdq8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629B710F765
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 05:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783661364; x=1815197364;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=an4U4iMUhKmuB0nRKUEP9hjqPXBJiHxAI9yG7KVDJKU=;
 b=jH8kKdq8sHuxN4iKxXeeklR91NAHgq3bIZAJDVCYLuihs5P/sZDj+2jR
 URagScNQvQ5vjfIFzHETEXYE4gjx1v58N89RkLyDtH2sp8QONg5QpZUu1
 XuuV5rhAq0eikSrsuHWS+xt/Kgtaws7O08ptGkUI+6W/9xs5lW1gVYbcC
 cFoY8X7r0fFOHyi5hwAMmz9TqEmJ02vO7dlQ45SI7UwubMXAR5UpK9uxQ
 PNdkvDzJZMSXYWlkomi36k8Aj4I/Bce//e8NRms4pT3Glcy30lv7EDWNU
 vZmpKJuRsOkhVrvb98weEjAkId9+c8nyc+3hT9dHlCKUUb3JjJHJ7TGq1 g==;
X-CSE-ConnectionGUID: SiOZXGFGQMirT9kKsJt7Xg==
X-CSE-MsgGUID: R+VYGbJmRYKbzQ/1a+LtkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109902281"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="109902281"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:29:23 -0700
X-CSE-ConnectionGUID: hf58ZDj8Sqeh5Iv/URUvrQ==
X-CSE-MsgGUID: SDHoyNV/RPeF1GTYQPqnXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="250371668"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:29:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:29:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 22:29:22 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:29:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pV/s97sEiR+8+5ghqairQTy6WmWD+VdYXy5U50Nqg+k90MCupVRbUqzirLUWaPdxGaOGdyWM/GVT7QpSlROcFQ0/rBCWUIM6GOcAwZdgrULPdPoEk1YJCYUvb6MsalIHTh3ZSMfCXwljGV3NPHl27GKBVDgbe7L1L0alrI1fNaDfELwtfapCqrakKEQ6yPuabJt4ZlANFMUHzpEdsSDeioHqUblY36e505bQAqlcIsdLUBynUqfYp7lScluOiLja2nTs/eQqlAuJ0iPpsLjeyjx/m/n5YSsI0NduVRNNQurGYjAsqdsMVal2WTY4dG+yaLz3relihdqdHeZSPfRM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xudFNGnV5XAkyieicKQgDGcY0ZaZ4IpmGRrzBhXqGI8=;
 b=BzYkHhT2aEJ9r4qoqVFmsqf7EMcJhMPNWzVWxzYoxQLZaKCsoJZHF0/wF9CDd1mP0gpRFexDWGQzc25/gP4T4kcaUFiF5hK2y+PHNlzKZXIA4UkjukpKbXU2GlwNEjoAbTTdQ0BI7r+x2Ybkoro6h/Gk2bfQUpFPJ9RSya7lOVt49DGDOMq/B4AAmgGQmv8SGOWzLkNJ+6NajZ7MoBrF71ncG5MCzcOHJFY3BddL89kwSzqjdGr+Yxx0aJW17QcVe8oYPb4TX/87rh0e6LXQNplD0gxYuHtZ7tT+jrwIxfzXGEj92+LrQGIK8kF+OMRRcK/UuvgDV13GSjVfKsbJ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by PH7PR11MB7002.namprd11.prod.outlook.com (2603:10b6:510:209::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 05:29:18 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0181.008; Fri, 10 Jul 2026
 05:29:17 +0000
Message-ID: <85b77856-c6c2-40ca-859e-2f322a8b2de6@intel.com>
Date: Fri, 10 Jul 2026 10:59:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] intel-ci: Blocklist lud3d for display_ver <
 35
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260710022741.89883-1-pranay.samala@intel.com>
 <20260710022741.89883-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260710022741.89883-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|PH7PR11MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee24cec-6138-441c-cec4-08dede442fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: PvC5C8d3UaeZ/MybNp85uWaghJ82M6nImINEJ77HOBGV2cg5Q6wRXFMbWOP2rzZ6LSb6XnDpywskJmnwmb0yfx734vMvCyWrjY5LT1Bk1shXRJHhkJ+HKVn9rEwaa1ltxKIj0g87qRXxZcXHUAahY0lfshRwh0ZwsthTEcRC//wEgaqetJx3eYTaacaOm32AAHyyPXUBmAKK0scnLLfvzqDxPMKoPVtC9GJHvtPKfKzFUgMXKUBLNYwcXDexrAQejgFf2+OdSCnu6L5oaEAIG/2lwnoLtSLBeXNrNKUssMQYA+49/7/kbZz4q/Atq3UkmfIaJc5lqqbl6XGQThj4H+ZHDt2ja8py87wQn7EVY2LnTdeXdoT08Wg8X1gPMrFdOp6RuetFODnirBhfM/J/PLS6qKL3fg5gHbq/mOXMa015Fx5pdMM8/B/aO/bqD7b0hOEF0rLpmHpnHf2AfCVMrq5qWSze0TU8ZfAZDSKUecOqVIYB3Drt7+P3DOoLkkteqsA9nGim4S8V8u3ISVbHPjDU83e4SXb7gpwbjy+zyXOrBmqy/eGa27abUCo+5yoNhmCjtrQPEKla3jQ8G3GZBA1+f5sqaAKi70DcvNB7mBglbKTDwOoC3My+sXEv6z0tx5943ugwQvLr3OGD2/PtolXHNb3TNNhfkQLQntd3vEA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWZhR0FXYnVVTG9UdjFTUytUMTZIcnZ4dlR4eS8vTldWaWZBamNZZVd0RVRV?=
 =?utf-8?B?bzNvTUE0U0VTbStIT2ZnbityYnlON3ByMnovVkpwZUxUNFlOc0lNckJKMFZN?=
 =?utf-8?B?aTNNTTR5OXp4ekx2ZnBOOGx2NWhZM0R0Q1RjN0hHRjM4bzFjdWR1dEp4bjFZ?=
 =?utf-8?B?NXJibk5YTWx3cjRDM0EzanBCd2xoN2hxUlVHVjVjUVJMcTNlMVhhMWhyQ0Zv?=
 =?utf-8?B?bHdnR0syOVZWUWNCVzV1QzBNNG82UDdxcEh5U3RUN29XU3NROVhVQTF2VjBC?=
 =?utf-8?B?VjU5Y1RDZGF5OVB5MTNiMEpZQjU1eFBCZzNjb0MrQm9JVVd1akFRMUFkQVk0?=
 =?utf-8?B?dldoOUR6OUZhM2xiNkNBNGhhMkhEZUVsUytYOFFXR0lWbGhmWVhqcEJ0UUQz?=
 =?utf-8?B?SGRWUGpDVXJtY0Y4S0hwWGtudHE4YmlWQUUxYml5amlJWExHM2tReC8zSytH?=
 =?utf-8?B?RDB5ZFhOYWNFZDA3RngzQStiWW1QdXZTbGk1dDYyM2FhL1gwUzl5cWNiaGFv?=
 =?utf-8?B?cEkwZXlrRzJsN0NnL2xjdmhrOG0yUllLME9sNy9obTQzcUxnVFBRVXlsanFm?=
 =?utf-8?B?T1hXd253VDRacHcyMTd6cUJ4dFdCdWRvV2daMTlnbmt1TWE0OWJrWWR3Y2hQ?=
 =?utf-8?B?MlBHdUFUWU50cG10eDQwSE1iTEoxdGNCNzZweWYxbVBuaS93cXF4NXRINFg2?=
 =?utf-8?B?aktVZlZtbDRzYUhvWTluYUlUWCtHTXVLUW9qRVM2SW16S1M5eXFGOUx5WGQ1?=
 =?utf-8?B?WWZVNU9KZmYrZUx4YXRJL3FxUk5wRmZWRmwrVUpyaFNjaGl2M2pFaloyeWRw?=
 =?utf-8?B?R0ZwSFEzYXlwd3k4RlFwditJZElmbnVTRTFHbGR6QnUzTE5JdWZGY2lheDhX?=
 =?utf-8?B?M2hFRUVrUnF2NWVnRVNYVmIxVTNVS1M4VTUvaHh0a1RqSHM0Mzg2N1B0R1lW?=
 =?utf-8?B?d0hXV1UreENuQkY3Z1JnT00vanQyOWU3QmFvUG9SV3B1YnVBMlhIZW9rYnNQ?=
 =?utf-8?B?SlVhVStCMEJwVGdDczFsWHprQzZUVHBnNDd3OVQ2OW8vd04vcUMrdmpEbmli?=
 =?utf-8?B?NkNPV1J5ajJPTjhrQ0NIa0k4OUxGeVJQTkR5emhFcW8rNzZ5VXhsTkNmT2Nr?=
 =?utf-8?B?OWRqakVBcWt4cEdtbjBkdW5YS1JRR1JnbXlSdWx4T2JjUXJPdEpldmRiMnZI?=
 =?utf-8?B?R0ZMeU9zZ0pFbkh2Z2Z6Z0I3cGpycmsydVdFNElybWVSRlVlM05KNmo0UWNo?=
 =?utf-8?B?ZGtJeXRaN3Z1eUFSaDFpWERaVkxUSWZ3djBSTkNmNk83cms1RWJPclcvQXI0?=
 =?utf-8?B?dXRuVjh2ajRNUU9Hd2dKcmg2c0gzQnVpeVdYREhKUGFDT0VKSFVqb1dxWnh3?=
 =?utf-8?B?T0VpQlExbXgzQWJ2OGFFVkpWa3hlTjZ3WUZGd2RzYmlzMm5icTJqL2xVWTBK?=
 =?utf-8?B?NldydXBBUWJCVFBTZGc4VEo5MkhYVTYya3FqZjlOaVpnTDJSVU91NDFlbGoz?=
 =?utf-8?B?dzNLaW0wSVJLZGYwRHhNU1FsTmZKN1NkelU3NEtYQXE5K0R4dFg0S090ejlm?=
 =?utf-8?B?VzlNNTViYUdma0pnSFhBWXBLeGdvVTR3bWVudEdxUW4wUWpNQkZ6cStpYWNi?=
 =?utf-8?B?Yy9IcEIrUEpvd0pYaGhVMHExMGliRUUyQlFvUG1BVUFlRUpINndycTNiU0JM?=
 =?utf-8?B?ZHpDVk83ZFRvbU05VW1COFlRSS92U1BQMlIzeEl5cVVsTXpTQ0s2UHY4TkVU?=
 =?utf-8?B?bjFjL2Fyam5sc0MyWkd6TGlEc0ZVZG9NVy9WY0NwVlVreE5oVzN2cUpVZTZi?=
 =?utf-8?B?YTBjQjJYV3NiR3BVRjNkMTZBajA3K1dSd3V2cXQrVUVSWDFkT2NzSEY0WW5Z?=
 =?utf-8?B?ZlloNlBGSG9sc2krZmFSZUY4T29OWjEwZUZKMS8rcjZYdXpFV0FhendOTzJ1?=
 =?utf-8?B?TmZnMGhYVC9IUTIzWHBWOXl5TjRQOXhuOEFMNk0zcjhOQk1IT2FGK3ZUQnJ3?=
 =?utf-8?B?QzZSYlEzZldUK2x1L1FSaVkrZDRHb3VmcmRVcmFBaS9RajZjR3Vya0NkdlFx?=
 =?utf-8?B?TG1QdVNoQmhWUjdPVmU4NnJTd2xrZ0ZNQTVxcEhYdy9JZzhuRVB2UUJuMXJR?=
 =?utf-8?B?QVNmQjAwVVJ6VzBZd2t3TnNFb3ZsYWxzQlhCbDZvbGh4WS9QTFAzQ1JpMENm?=
 =?utf-8?B?Qy9MU0s5c1JpMTRsdGNUNHpkcnlCNFkwTEw4bHBuYjlhMUtiQVZHcU56dHAv?=
 =?utf-8?B?NUE3QlhuN1hlQi9JMXhzNFVyQ2ZISGpOSFBud2xHdDI4UWhFVlRsYk1BYmNT?=
 =?utf-8?B?R0hIcHl6Z0k2Y1ppcWZvNWdFN3puQlF1Z21hTE41a1gzVHk0eXhCQXdDZG42?=
 =?utf-8?Q?Wjx7Z4oPi5jFt04E=3D?=
X-Exchange-RoutingPolicyChecked: HfApMN61jcpnbtHfXV+4AWUBMPqJFtjood+oXtz/dcKmSb21vZmqf3OjLK04fi5LBYAqICLY+ciyxNK1Xgregh31CXZm89nQYB77aafD+M+sJtc7siipIgLUV+QueCREDIF35RGyZL6lHqf8b3DBV2SN57yFQup2hiB8+laDwU2RS/sdjsbGFsIJdqL30vskG/zhIeo9zFw0GXI0F44vc3JGWC5mjn6Dvwp38v4YfWJpz/RgP+GnYWbspDBqZhzdEy3wIBCFR+njYvocIqM51P2UhlIz20UFw4iLD4qKTTxD9tbN2PbP0JGSmWqOm3Wbnvv6MK7bvIHXvUC0tYUoEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee24cec-6138-441c-cec4-08dede442fc1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 05:29:17.7041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0Fu/Jd4vvcp9nooOEEouYB/sSsI9MeuviFkjfVOvPPt3U3E3KsOYredsGDiKvIx6wvMLWWPn5GFnrKRvAHrVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7002
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

Hi Pranay

On 10-07-2026 07:57 am, Pranay Samala wrote:
> Add chamelium test to BMG, LNL, PTL blocklists.
> This is a valid skip for display version < 35.

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> v2:
> - Add NVL specific test in other blocklists (Swati)
>
> v3:
> - Split the patches (Kamil)
>
> v4:
> - Update the subject (Swati)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
>   3 files changed, 12 insertions(+)
>
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 4c2a7390a..3e30e5772 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -181,3 +181,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>   igt@kms_pm_dc@dc3co-.*
>   igt@kms_vrr@lobf-dc3co
>   ########################################
> +# Valid skip :- For display ver < 35
> +########################################
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> +########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 1dbb24ae3..7462294aa 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -191,3 +191,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>   igt@kms_pm_dc@dc3co-.*
>   igt@kms_vrr@lobf-dc3co
>   ########################################
> +# Valid skip :- For display ver < 35
> +########################################
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> +########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index 1041931a1..c46312d1e 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -182,3 +182,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>   igt@kms_pm_dc@dc3co-.*
>   igt@kms_vrr@lobf-dc3co
>   ########################################
> +# Valid skip :- For display ver < 35
> +########################################
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> +########################################
