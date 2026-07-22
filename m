Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9DBC4453A
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 10:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1382E10ED12;
	Wed, 22 Jul 2026 10:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dN2NZoGz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3DD10E415
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 10:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784715283; x=1816251283;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GA9caiQRp6c7j/+00Ig34vPKT2Gsv0qK4p8FXmpMjaI=;
 b=dN2NZoGzl5629CeSUkZagzMJbTnwLYtQFWEIndfMZdAmDCME7tIipqkn
 Zla02bv99fBUe1zZuIHyv3k7ye8W6F4F07G0vISBnEEbE2+nlcU2x7rto
 WIWZ5mJiP+PGHrwD/CzbA/HYMq9lCkWtHPyvZvtvfMBx2sY2KAqmABgVt
 8lPGYIj+hyZz5fR2CN4HRI4UyeH2rQcE4EAed5q3eDR/VvJe7FpFa7gQL
 YQOM6KJf8kfbLuKAqMQ3K8hfcGFDEvLtfnm+4ysaaOhjaJxKM/hXu6LDy
 /8DBX1KxIOPGs6FYME8hsU5/NhF6y/UP2cJba5n6iJaKY0RQhsMMJFlgM Q==;
X-CSE-ConnectionGUID: 0Hdx9kTEQbK1/M9JwYqamQ==
X-CSE-MsgGUID: 4e/tS7MfSf68IBTxg4WZdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96003895"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96003895"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:14:43 -0700
X-CSE-ConnectionGUID: VYS58q84RAasTUpM6LmmTQ==
X-CSE-MsgGUID: 5SOSdZmzRsiNczb5QSEJQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="260008931"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:14:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:14:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:14:42 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:14:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QypPZlW4Il0dv3S3I6q8G2QY8zdA2zNfRWt5e2OsC0obvP7IqGmyZCe1X0Gh8v0E1336Nz1UUDCpXUvDWvgRL7mpO4LMAh+UUM1sc09dyC2i6SqS1YyBN1CNkwoCUrsLh9VuAwBHNpK/iPAx+SYvbMJayAUeJ5OpylfGTBX52fz3tQuWwW5tdkTv8UDAFZCo+fM+eh7QBnjAKTrbO/jBvfCGINlGZock+FR/XuAozR/Q/pkLsnrE9Oo1Kapr9EK4kSBgH2kJlbbKTD4bbnFOv1RMcZ4RAyTk7+CSl/HW3iEYnWyNgyRRSjl4A1Zi7jfXNeXIFlN463P3HAVqOANi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJcRJ9HDiTgsos7/egi/9FOkZTP2pN5BgnqQNYirEsA=;
 b=JDi4XLZ99jGBI7cnT5HLBN5ivXC+7KJjNuGfXziDkS5qCbkA3w47NMLjHte/aOt/BWR5tiWTpKQuGH86+zlRbZ/Y94YAJgMVnkAja/09bgT5TaEV3EGW/X06CeNln8nmz3Tg+J2j0aqWF5+ocg0mUs3Xvk5DekzJBL0TTQPB+3kOedScsjUNEs8o4tnndA0+MVULucMeJh51Jj7wf5yMFhOAHVhWBjCoeHXVSQB1EpHKfQ3XgMmwa24iPN2exUVbpAunin/9n/Cq1xCpZMXghyao8plY3QC7o4S15QlWmjDK1OSs6QlXkm+m3LrIIenhzckpdLmVbsTQo6MX7FIunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DS7PR11MB6150.namprd11.prod.outlook.com (2603:10b6:8:9d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:14:40 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:14:40 +0000
Message-ID: <f196758a-43f2-47e5-aedb-0dde257fa262@intel.com>
Date: Wed, 22 Jul 2026 15:44:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_properties: set client cap for color
 pipeline
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, John Harrison <John.Harrison@Igalia.com>,
 Swati Sharma <swati2.sharma@intel.com>, Harry Wentland
 <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>
References: <20260714144532.351294-1-chaitanya.kumar.borah@intel.com>
 <20260714144532.351294-2-chaitanya.kumar.borah@intel.com>
 <20260722101210.ysyesxuzkvys7rab@kamilkon-DESK.igk.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260722101210.ysyesxuzkvys7rab@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::11) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DS7PR11MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad05b44-da9d-4edc-ea05-08dee7da0a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|4143699003|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 87EWZY1Miumfi8lNhwVUmiA35EjUl4U2lUbAedv/jDclt7yeg9xF0YmWTaakIojJW/GRn8fLWHUOOkmFJKllliUyL2QNN265uGG7yVmdMwspao6Y1Bqv1H3gIFUoq+MST1fBXtU2UF55DgLMSakvpMVB12FBlGevFIFNZmcCgiiIzAcp/7Al5WVqfI6aDFrWyhO47y53jmr5IfjJ2abdQWJqfCpGc2T+2LnHdlLr7fRLiXamETQ017fWKiqvBGMI8/vm94beQJH5XGPI0go+iUMTV7hFX6NSqSjdutA6kBeuZGn7zluFVcWAvOyZ/quQSifGJ29S/eQTA3L+gATosR4sY1j1gGzgxgprlQXsqjSR+diyI1n3lIauCTh7+0UwM9wHDnVBeuKSMpmxY7bhNy338awAzct2+UI9ajFLRaZzw562XeL4XmYvMUmpMpHL7b3EvgiRlBoEca/JyD/xy2YCYySyNcEwd6Qw1xIPsLHehPOcRdIe5vVbrYKoD1NoTObZcU1s9TZJaCFgI1eLcKzr0Vr+4gf2yTbPqJs++9HDSvn1KWjNzsXI5DYO0ml7QEjNUph2jv1X6ngjlK5x1q2tUhOYT5abcJRfovGCyWAkdNOALkM6aSOACN/5jamh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlkvOG9HSDVGT0prdEl1NG9MSm11V0h4NWtVSWpyanlaRm8zSTgwVDVuZzk5?=
 =?utf-8?B?Y1FkT0czbkZDeFFzem9hK1ZSdVQ3NVFpWTNRTzk4dzdCSVJZQzFna2xNVHlu?=
 =?utf-8?B?TElGaEd4aXFwSFFZekJEMTRNZjZsVE1JREQ4dm9raEpWK2VkQ0R5V2o5Yi8w?=
 =?utf-8?B?Mit1eEdiWjVabjBJQ0FTa3o5WlhQMXB4dnU0SkpWWklZMzc2SHZkTXFINEJC?=
 =?utf-8?B?QnhtMG9PbU53QmRuL0dHcnE1UVRCcHUwR0RpVU1LY0NKS2xrNDBJMzVyZDFZ?=
 =?utf-8?B?YVhKUUEzeXFWQkNsTlZtZ0xmR2srVjZOWE50VGFqcjRSOW1NZ2xsMWt6TkFl?=
 =?utf-8?B?NzNETVFsdGw0bm5HWTVsQmJqVktJQTJKWi9qTitnYUNWTXFIVEVHSmx3OGFt?=
 =?utf-8?B?TkVRaW5rUVNXK2hpZTVobktFME1xd3JnVytlS1d6Q2hvMjZVT2VidDk3Q0RE?=
 =?utf-8?B?a1FsVzdHRzhTOEhKbC9wT3NwajllMXQ4bGw5em1HR0lhcDd1WXN3WDFQVHZD?=
 =?utf-8?B?TkppemwyZmdpRVNQelg1TXNOZGdhNE5yZTBVak8xQ3Y5VW1ObEdrSzFzZU9L?=
 =?utf-8?B?aGFLRFdmc2tkS2p4Y2c5YnhaOHpsVGIwaHlKa2NCNFFKU2dVTWNLemF3YVVG?=
 =?utf-8?B?SCtSaWg3dEEzRzNzNHAzdkx6OGd3TjExakM0bHJ0c0ZBUWpDcnJST1p4QWdy?=
 =?utf-8?B?VGJrbDI4WDNWb2ZKckIyaFNSMkxzelJvU2ZiOWJtY25WYy9Za0ozMlREWGRl?=
 =?utf-8?B?UnFqYzJFUmdCenpqQ20yM216WFJ2bjQ3SW5BRVVTdGZhS0kvMVZDNVFBWXlH?=
 =?utf-8?B?cExRUHN5SkMzYndtd1hZT0pvQmpBSkthMmd6dHZKaFlWeEgvbWh1TzljNHhu?=
 =?utf-8?B?OGF5VFc4OHl5cmdPaUR1Y3h6QUJxNFZmVkdEM1Q0ZURQWlVnNXJCMTNjZWpz?=
 =?utf-8?B?RHIwRk43MDB0MnEyUjIwQ09kdVFQTVJpR2ViK3lqeUFwSVhiWU1RMUhKTkx1?=
 =?utf-8?B?cERkdGgyVFFoMm5Ka3I4b3FER1pnME5mWG5NWVI2SmFkZ3d2WElNS1NqZlEv?=
 =?utf-8?B?MEZhQzZrOEpoeCtuVjc4ZGNBenNsVFZ3NFBlL25LVkxFcUNGNEt4VFU1dHJ3?=
 =?utf-8?B?dVhzR0lYNjZmR2orUWI1L2l5blFWM0Q5WkNBVnljNXVGVUJLdnVQUVpuK1BK?=
 =?utf-8?B?d085cm1QOHVWaFlOODAzQ0pXRUliNnBucjNIaWpENHdRR3QxeGVyVjZrWG96?=
 =?utf-8?B?ZmlGTC9BZkhyaDVLbXE4bzJCcURlQW1wRW5jcFEyQU1Ga1g5UzNYS2hWM3Iy?=
 =?utf-8?B?VXRkYkxiQ2NESEt1WXdHU2xqQjdSM0wrT1hrcXFodUEvVzdMYmZ6bWxuby9P?=
 =?utf-8?B?NUFJU1hyKzF3TUdNMU5hR2l4OWdjdlFQeFJVOC9EcVBwdkdiMWhvTEtPNTU2?=
 =?utf-8?B?ZS81MTFIQkpUQmlPME5rLzY0NjhSMHRMUjJVVTQ0SXZPd1A5V3dpU2dXa0pr?=
 =?utf-8?B?VGs2aHpmMkpNL2c0NG5Rc3ZFSythdGozbWRnWUdhWVd6UzRzL0hVamIzd0wz?=
 =?utf-8?B?c3NJZ1NqNUU3OVI3WExkV1duMTBtMU9jMmRiK2J0OU1sSjRjZHRRZUlPN2pO?=
 =?utf-8?B?NHdpTXhrVTE3eFNJWVUxOEhDbVg1NGE5dit5cGNEc21mSUNiZHFqcnNOS1FX?=
 =?utf-8?B?MnNraTgwQU8rZHZLSE1rUTBqYWQ5MEdSUExrUUZBYlMwYkVrTGRDa1J3aHNP?=
 =?utf-8?B?TTNqbFI3U056a0FCSHUyYWRmUVFscHgzQ1FWc1lQNW1ESmU5dXBnL1diS3ZJ?=
 =?utf-8?B?VGNIL1dYdWVhcnhVRjdreU1hU1VaUSs5UlpYTjJjVmRHdnlEK3hSb1pkaWM0?=
 =?utf-8?B?TnpCNzZKTTBMR2pPVzQvWFVhbGhDOTRkaW5jai8zdkk1TjdhTXEyMDlCamN5?=
 =?utf-8?B?SXcyREJyT3VnbEhHa1dyeUc4TnM5OEVJdWhadjlVU1JNSUJLRnB4UDNwOEVr?=
 =?utf-8?B?V0U3RUZqdksxeUlpUjhFQ1lOOXk4eXRvQVhrWW1rTndyclZqWG4zSjhKeUxT?=
 =?utf-8?B?bTJnVFJGbm5wMkVLMW1NbGtKT2duSkdua1JlbjArYitFdDlrWHd6b1ZYMFc3?=
 =?utf-8?B?MmRGazhIdXBNUFZQSFdmcWZWV0c2c0tRTlNlZlJUdzdTRXc0N3U0TElrZVEx?=
 =?utf-8?B?eXhreldxUHdSRVZ1OWNLdnNQWGZMb21JeFpoaHVOZHNvYmpqYmZ0a2FFb1hk?=
 =?utf-8?B?dzIrRjQwMnh3RFRTQjREd0tmejg4VXVXSVBQYWtFa25jc1RPcnM5R3g3NEVq?=
 =?utf-8?B?ZEpQc1ZtdmZ6ck1hclBKTUJYMW5md01hR3R3Q0lKb1N4WHpMMkdHcEVlUnRt?=
 =?utf-8?Q?WRnnJNT6FiyAn6qM=3D?=
X-Exchange-RoutingPolicyChecked: MF2Wy6NZv7M/WlgGNV/V+2SjZPdXuNLKvEKwKDADT27R3VdIAdzqc9xtSdT+q7EcKGAcboloms8OxZrOx3YeWi0kr46MxGj5+T68FNVhO8toBratbYv5CoyWri4jWtJF40zbJaOKeDpn2MwrexeMaNTvdobiFUOeABneWKrEwc8WV65Lj5UrA155j5fnsFAhh/C2QxIuVY1YXubuwCnkEJJTzlwfA+rX3h45sxT/f2ch/MHnTT0XucRyDxSi4I0sm0A63m52d4lpxDGB9aiTvOZYe/YEun5Sg3aQNEsgXnCfhlXd3w5Rva+Sb/NcIdp0A/zFl42+38Gzku2v0Gihpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad05b44-da9d-4edc-ea05-08dee7da0a5f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:14:39.9656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2Iku52YipDsoPCtesBUowtBRkAuD9bmyMp4Ab1onfmiTwACOZtoldr7uwwCSdPVQZeyftIT1at88x4pBuIvFrvYYEAHNhCIdTugf6ZEKpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6150
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



On 7/22/2026 3:42 PM, Kamil Konieczny wrote:
> Hi Chaitanya,
> On 2026-07-14 at 20:15:32 +0530, Chaitanya Kumar Borah wrote:
>> Set DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE for colorop subtests.
>> Unset it when done.
> 
> As you change this test could you (or someone from cc list?) look
> and help with review a series here:
> 
> https://patchwork.freedesktop.org/series/167775/
> test/kms_colorop_helper: don't request colorop updates indefinitely
> 

Sure Kamil, I will bump it up my TODO list.

==
Chaitanya

> Thanks in advance!
> 
> Regards,
> Kamil
> 
> PS. adding to cc Melissa Wen <mwen@igalia.com>
> 
>>
>> Cc: John Harrison <John.Harrison@Igalia.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   tests/kms_properties.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
>> index f735839da..93bf1ea26 100644
>> --- a/tests/kms_properties.c
>> +++ b/tests/kms_properties.c
>> @@ -340,10 +340,18 @@ static void colorop_properties(igt_display_t *display, bool atomic)
>>   	bool found_any = false, found;
>>   	igt_output_t *output;
>>   	igt_crtc_t *crtc;
>> +	int ret;
>>   
>>   	/* colorops are only available with atomic */
>>   	igt_skip_on(!display->is_atomic);
>>   
>> +	ret = drmSetClientCap(display->drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1);
>> +	igt_skip_on_f(ret, "DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE not supported\n");
>> +
>> +	igt_display_fini(display);
>> +	igt_display_require(display, display->drm_fd);
>> +	display->has_plane_color_pipeline = true;
>> +
>>   	for_each_crtc(display, crtc) {
>>   		found = false;
>>   
>> @@ -369,6 +377,12 @@ static void colorop_properties(igt_display_t *display, bool atomic)
>>   		}
>>   	}
>>   
>> +	ret = drmSetClientCap(display->drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 0);
>> +	igt_assert_eq(ret, 0);
>> +
>> +	igt_display_fini(display);
>> +	igt_display_require(display, display->drm_fd);
>> +
>>   	igt_skip_on(!found_any);
>>   }
>>   
>> -- 
>> 2.25.1
>>

