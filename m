Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085FBC43602
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 07:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEA210E73E;
	Mon, 29 Jun 2026 07:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dug/POek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD0010E72D
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782719002; x=1814255002;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2JyExJcZVkT6q5nCYwXWAecbTj3wt9QANbWs1WXr4yQ=;
 b=dug/POekRQ6i6un21us8pb/a+t2cYbhw+gDxnzPh5SveD3NY61vrNj3g
 4npeLL9ncA+TyQL+rwTOagmHJACIvsQcI2X9snCATOcGIvgu1Po9DkGD9
 wz/uYNFvgLxoQYtT1zofBtQfABmgvXeT/ie164g3ryOmxojwfZt9I/xGi
 UP4t58zxCtysHvZCcB+UWF4g0gfT3CZf2W8K2xJUe8U+EcGpSPmzwUWTa
 AunaiBTcErTBU8CoAvk1/VWna2r3jk/MWKUI3820STs2/5f/gz1GEa3A7
 TKYseZpUHmL6A2dA9kgXN0n49RRrFX+aek9cfU4ZL2AwFUZaws9+Dsq1d Q==;
X-CSE-ConnectionGUID: WpEt9v+KSFSi23VlrfEAsA==
X-CSE-MsgGUID: WsZp1T90ShCAu+P+yhiOOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="82507071"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="82507071"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 00:43:22 -0700
X-CSE-ConnectionGUID: w1KbDjE6Re6KyGr7eDI2ow==
X-CSE-MsgGUID: HvUsezZoRjympFwxS19zmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="253790793"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 00:43:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 00:43:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 00:43:21 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 29 Jun 2026 00:43:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tV7Bo2epV0dF5dLPJve1HCp+/Cm8vhrjcpWSfdLXOc1GW52sorcHabSBZ6IXPCiy38RbexQsKfzY4T/xmeczxM5pUHU/3aKj3SsrJ7XbRExfnHfFUnYsC3YlOdu9V4IlZ55YIL7xXpt/OtXZD0/B2i6xt+Qs9BGO8UlgYRm4RnjQNl29/VDTkTguSthTRlEgXlUFWxAMZ0Mck0NqCaUMN4kibX/8wJSKoG2vbAfz1yfcqKE1QHMhr7/L1GAbbNMYtKDJc+DfvY25nASMq8aIQow1L39wruYczgxUpl2XV+IUfdsknZZ8zZX2dd+b+V/4lkXnD8OEj/6Auvwp+4R/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqdwqOptPXzgoP3Oe6HBngu4sGstn7QAgCCpvqeqBOs=;
 b=Xo+qiKPuRjy2tFrzWVlvgQXaKN56m9G5dpY0hGxJ3JWE2Ke4TXBJnK81peVS664E7Mq72hUZlKjvDIYsiXbyS+fQ7xvSWnQePBOTdLLLnhQhMkG1Yqfv1EfBRmuUwCU7PbaApix+CGYe+hW+z/RH9crOyLatoI5bpXlKPPCJ3YPq13XNkBRx4LIkShPCo5LGQB5q0Or20JUIah5Lm+zue7ob7NNCrHHaJdf/ZI26Nv09425o6EEORLHIROTW2sibHSawbHwZz/BZxJ9xktRiKXC6NktflFaRLiXKMIRovnlRdTRBaBwuoPs/m93/WgSMp+9NWlRy/AIkD0/kgKczAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by PH0PR11MB9703.namprd11.prod.outlook.com (2603:10b6:510:399::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 07:43:19 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:43:19 +0000
Message-ID: <47c128c4-c63e-449a-9b41-15b63c1f9525@intel.com>
Date: Mon, 29 Jun 2026 13:13:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/chamelium-only.testlist: Include
 additional chamelium tests
To: Karthik B S <karthik.b.s@intel.com>, Pranay Samala
 <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20260623124913.3003450-1-pranay.samala@intel.com>
 <e7a35511-9efd-4d16-acc1-4a516b005459@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <e7a35511-9efd-4d16-acc1-4a516b005459@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0261.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::17) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|PH0PR11MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: f34727d9-ae6d-4bfb-177f-08ded5b216b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 07FOYXm0BVUkqSCS2OOdf+qrDxgAgv5pb2eCUvd/piPLyDvuSFcew3IvCGhz2MT+3ApjzRQiz1noClcFzlyk9GDJP+HWEDmKWbRik5GHW59/ONAL9asLWjvJHwvIVTr96uZlZHnuFl0CQSWdjwm5qbjdlR1TLP9PGGyB66SFW/qrTb9V6bdMGdU7s4tVxj891UUkAWYnOCw3w+1hfcUblmg3M/3Ka1YinphAD49fVQ5WViAOBRk7nIqaaaQtZLVskJpmZ691l2j7+u3WT+rnSsdS5dgPYHOLGouZjALHNi+n5LulNNqz7B1qTZowzldv1VWURuwGL/Hd+oCBryZHuW/lrSXjmCS1LuCseh/GobRNcu4O3VrWEMMV0f07/jEWkcidU9Rh7+Hkjl5AuhCnWaoegU/Y7dAOu5xJpG/viN0G0v06RlqGDRqrEcFuTTC4CEEP39g5F8mOGg8iKIz1UVMqUw/YDL19FZUVpUBo39hwWaQJvi32KN0RsC0ip3eCNdEq8oa11RnuBbN3s1FzFzigPNGCD/TCWHOkszTEAau5Tdhr5dAEkucoVtu2Jlw+G2a2Ya89f/0/A7/hADPZsZR3AkjQ1CyeUORZ4Z0P3SrsXG7sNF/DBFho/lSiromyLZ/cs42mo2sbKjbmSLGiffSo2S/X+/tSV/IgJJ+c6ko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clhPcEJtZ3pXMHpERE9ZVmU5RzN3ZVBBcUJralJhQXJEYzlMT2lBWGZxdWVR?=
 =?utf-8?B?QUdMZVBKaWY1R0hMN2ZUWHZ2Qk9EVWdscEVsODFUV2VGYXVEcnNodW41VWwz?=
 =?utf-8?B?QUhuOVBRVXVVbFg1V1B6ckkwdkd2aXdQUS9sQzRmalpZd25oektPV1FYazdk?=
 =?utf-8?B?Y09VRmQwTElXVUhpWCtNTXlSMWxjS241OG1ycGtQcnNieWtnR0toT3hEdUVK?=
 =?utf-8?B?SjlKSUpYQnRtVUVSZGJlTzBJQTZ3RzRjNUhUUlVBTWFmd2R4a25uaTRhWmdZ?=
 =?utf-8?B?d1RNdEdaTEhad2dIeThjRkpha2tHc3JNYk1YaWxkV0hubUk4bkN4dEc2MnJR?=
 =?utf-8?B?TU1tcFRlOG1ZTmlvemJLVnpMK0R3TUd1NzY0cWUvYjNlQ2hPZXJacG5SeEhJ?=
 =?utf-8?B?U1R5blFXalJPckR1b3MwT2JoNXV0LzVZRVBIYmN2VGcrOEZXeVZKNHpmMjI5?=
 =?utf-8?B?dXhDODdzeGpna3NlNnJrYko4dGlabWJRTkRZYnhpQjlRSGR5UnFQdm1abTMr?=
 =?utf-8?B?dmUxVFRLVHhFRW5sazdReG5qRXpEVk1UV0FCKy9qY3VJSHhPTEN4N2J1Umln?=
 =?utf-8?B?WGlZemlBa0srcStKcUEvYlBPSG4veXN4NzlMdENFMzJoV2dPajcwSERodE05?=
 =?utf-8?B?YVpsaW5jdy81K2NiU2VHbm5MaTUyVDRsZjRPYSthc1kvU2ZwdDc1Sm9YK1Fm?=
 =?utf-8?B?R1A1VjdVY2J2TDhQQjNaK2Iva0s4dkwwOWNHeklnOXBwcFd1dEdFeEIxbks2?=
 =?utf-8?B?SmxLaVlham1oWFNTdjRwYnhOOUN4dDFzV1lBU1JtVkliWjBxMzVveFFnTTJz?=
 =?utf-8?B?eU1iMnVuNURYSHQ3aFZTeU9EdW5adnUyNTJkWHpHM3VHNjhmT3FueTVMK0xm?=
 =?utf-8?B?OGpESlAwSG4zNC8xa3hzNmdVRTJwTnErajVidXhIblJlZjAvQzRLc0paSXFC?=
 =?utf-8?B?djRmZmRldnYra2J2UTMwbk5aeWt3NTN5N25oTUVkeENDajM5ekxIRFJUcmN3?=
 =?utf-8?B?TTVZeGplc2QyL2ZucVkyR0tqTlBkTkJpM0VvYWtkZk5Pc2hXNkY0Z01UWE9T?=
 =?utf-8?B?ZGhBZHMyWi9HZVZWU095YmE1NnlqbDZGVTJzMmVYWVc4dmZDTk8wVDloZVdM?=
 =?utf-8?B?dmkzWC9nMXdRL05SdzQ3YkxkU2F6MXUvWXVyVUEvTTZMdGxWNStLV3FpZDN4?=
 =?utf-8?B?OUtnd1pXZVhtZHdPK2k1VFdDb3NFMmczMW1kMmRiTXVjNGFjTjk5aVRXazds?=
 =?utf-8?B?NkFyOTRvRDRQMzZKOXZrQzNZNmlRL0NQVDFoYVdLVDRaLzdhSTJpTmsvVHI0?=
 =?utf-8?B?ZDZiS0wwblB6Rjc5VWxEMUZlZTFEMW1rU0RiWkhxYmlvTWxwWkY2VFMxaGFs?=
 =?utf-8?B?SWwvYjdOb0lhNnFiV2owOXIzdkVhQisycUJ0MnNvUTBFYVpNd244UVYwWkZN?=
 =?utf-8?B?aUQwMjVoV3JaNkZiVEhtR2RVMWtpUEw3SDV5djFQMkQrWDNQK2RySDl0cnRa?=
 =?utf-8?B?NGxORXR6TXVueEZxOU1xb1ZBR1FFdG1mZytmNkp1RUJtYmUvUUxRbVlyZEhr?=
 =?utf-8?B?amNSbTlzUzMwTlNGTVpOUDB5TG5jOFBzTW1EZnAzL2s4Q25Pb2p2WFAwaWNJ?=
 =?utf-8?B?WTc5aWZXTmZOTFF5OVEwUHRzUTdpWFU1ZytGQ3hIdkw1WkhGa09VeGtQT3Jj?=
 =?utf-8?B?R3F6NUNwVlRBc3RrQnNFMHdTUWV2Q1ZvTEJNQjBUNEpqb3hvdzFOd0VkdUlh?=
 =?utf-8?B?Z1d1MkFFd1lUTjgwN3NObDV6SEg4Sis0T0JiQ3poK3RxcVM4SjMzWHFSVTdD?=
 =?utf-8?B?aW9XMEFKVDRMVlNIUlA4TFdFc1ZabXg4Qm0vRmZaVXhhaksrZWJZU25JQ2NS?=
 =?utf-8?B?Q3dIQ0p5anMrRzVCeGhoUG9zYnNYckQxQVcwNFJtWGdHL3psNmJEaTRSQmpl?=
 =?utf-8?B?QzBoT2NVQzQzNGVqMWFnL1ZUdThkcHVzdU4vQm9iajRETlM4SXFnU0t3dGdY?=
 =?utf-8?B?NmRCTmlqbXAxZjhQU0hMLzJsSnJLN2NLWGp5WHRkUGNyUWJXbmR3TlRoKzdj?=
 =?utf-8?B?ZzRabWh5UDNVWW9sS01NdVRXK2FNekVVRWk0Q0lPSkxyMWtoQ0NscGhXek85?=
 =?utf-8?B?bFpZZDk2RndNYnN4UWd0TUh0Nm51TWRqRXJBWEdGcFlKanZqRU1uVm1pNjM1?=
 =?utf-8?B?aGV4THZxNk85ZFMwUXo0Y2pSYzkxMHdWTmdMcW5NTTdtSUpUOTB1d05EVGNx?=
 =?utf-8?B?SkZaM3VuQUNmV2YwaU4yTk13d3pxa1F1RElvQmNoT2Q5ZTl5UlBIazFEZUZy?=
 =?utf-8?B?eVR4Z2dORFdjNmZBUGE0VHF6VUx1anZHQUFSMXBrUlA4SHFqQTFlZz09?=
X-Exchange-RoutingPolicyChecked: JX9dun85tHa1fmErOIjCoP+2SLu/GCCUDaM8LQ4GUCHG+HCScYtCdDOtaaG6v48S/nIxZ6N/2dkZjlGcSsJjNO3ELs0lpEq+yHieKOYqGGpt4/+WtYQDjwTI26T+Vei/mN1woaZ1N+9yOJBh4ua+u99Beui4p7Sqxjxg6OjUyOE6f5gBafJQWG47wyoS7Jav2ZfYmRCnTNx+TjE4ak2J2fODwasvAJjWJPREvEKtA8sIJFq2eJAh+/Tg0/bVKFBM5r1Uee+WbVCH4GR8GRN7hxNYqT5nPDlIhfEewQtySGgNcLEDALJDI8nFegMfU+ovcMCzN+LDP/PDPNy6NrzyAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f34727d9-ae6d-4bfb-177f-08ded5b216b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:43:19.7055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7iOmfvKh/QTwvKGSLBfa3YOJFkWhKGyOAO/yx49cdAdHUbx/TPOEJLZs7Lh9Ee1U162nHUP+zgm6pvFpo3kCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9703
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

On 29-06-2026 10:17 am, Karthik B S wrote:
> Hi Pranay,
>
> Nit: Please make the subject and commit message more specific to avoid 
> duplicate commit descriptions in the future.
>
> Also please check if these tests also need to be updated in any 
> platform blocklists before merging.

Following test is applicable only for NVL

igt@kms_chamelium_color_pipeline@plane-lut3d-green-only

Update other platform blocklists

>
> With these updates, patch LGTM.
>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>
> On 6/23/2026 6:19 PM, Pranay Samala wrote:
>> Include additional chamelium tests
>>
>> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
>> ---
>>   tests/intel-ci/chamelium-only.testlist | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/tests/intel-ci/chamelium-only.testlist 
>> b/tests/intel-ci/chamelium-only.testlist
>> index d627ad414..070e878d3 100644
>> --- a/tests/intel-ci/chamelium-only.testlist
>> +++ b/tests/intel-ci/chamelium-only.testlist
>> @@ -14,6 +14,15 @@ igt@kms_chamelium_color@ctm-negative
>>   igt@kms_chamelium_color@ctm-red-to-blue
>>   igt@kms_chamelium_color@degamma
>>   igt@kms_chamelium_color@gamma
>> +igt@kms_chamelium_color_pipeline@plane-ctm3x4
>> +igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d
>> +igt@kms_chamelium_color_pipeline@plane-lut1d
>> +igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4
>> +igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d
>> +igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d
>> +igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4
>> +igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4
>> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
>>   igt@kms_chamelium_edid@dp-edid-read
>>   igt@kms_chamelium_edid@dp-edid-resolution-list
>>   igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
