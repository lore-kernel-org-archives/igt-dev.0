Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98657D33A3E
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 20:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5170110E61D;
	Tue,  5 Nov 2024 20:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRvjSATJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CD410E625;
 Tue,  5 Nov 2024 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730838828; x=1762374828;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SKGrijDg0LJIWmgLPW4Gu+E33AoDHJbZinRtrJ8RaZ4=;
 b=DRvjSATJ+cEKcqyg8VOp+kfMxPyifEPWC4ZaV1HfY2vWQ8Mt3z5JZKqV
 9mq1Aayg0l39XNsmiQYYvqU5ULg1xlmBoSWzGEZ2u/osbFzPt4QUV6x6h
 N93+C4TaQ98yLv+Bs83CdiUExn6DWoGaIJPFgm+X3wpH1DT5qBqdmCRgl
 45HKjgzJ9iG7gWzowgemanIseH3rIp0n16dbKgPh025UtOTDV4ERGTBIO
 ngdR8YsKhhs2FbppqzEJHtPv0a75TmP+0O8MICVyoN4xhtH6QFPSh8XmI
 yQnhC9U0PyG2XvaTw87+40XPdcK0C44r54gbGVbCAtkNfHJ1UcNVoTW2j w==;
X-CSE-ConnectionGUID: b8D4G5wWSA+EuJd/ExMXNg==
X-CSE-MsgGUID: JI0kevWRR1+lWTTyLViHaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41718061"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41718061"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:33:46 -0800
X-CSE-ConnectionGUID: YZ4B6i9IRAaB6/SeVe7hiA==
X-CSE-MsgGUID: hnjMNQuZR3eL//R+4En5zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88964761"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 12:33:45 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 12:33:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 12:33:45 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 12:33:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0abcG8J+H3IoIBBtbrY+Ezr+eq1eM+8B2nkzCNsIwELKOBk24RnyL7bxNyvi97SKboeBMBty0DjMYu16/LtGWiIlhTr3DS5ftwDvXP5j9X1hUABO1KZHAxoBMIb2PVBcDUCZDuQ+wPLGLo+B6d5tAY4YDGcXHBzBzK0jLZ+VdXmAm0EDn3s2Wy72InT3lBwmuBu2cBtDCaD4tAt6tRCxi/Z7p2VGBkD66WcVsX807VEwl9W5KPjtKqvY3JE9p1IzE5yy0vCgcpLiy1L/Rb1Sde6ABogJozbE77L8huqj9dfY2rbjVu1m8thHkChLzgcQQQWESIkX8q3NbMGHGeN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpfI+QZsn7lKcPGbNv7X7L5nL7lfa8XJUotL4m1ra4o=;
 b=jGs/Ahg4eb9AqHDux3s9uP1LJOVXAdGAR69H2RZMcwAsU/PRD0HERPeR4bCHGBnpj7YWWDwSZztjJZLS8w01TJhxpvFbENR3M7LTmty+tJ8LY8U5+8kKBXxIp9v+PE92hCDfF1olbkhX9JLKo5mpTdR23g1Jp/kq1yGMiqe1kKASb45x8FamZH0qwB4nNaLDmojaiLlvBTAlUSf5SyCfXQHxWCzmiqdPbDUebjCxrorULEVhjSlgcqvaE1klAvpnLYTdKrtHFR9qEzhENYqh+juMUU3mnzyIpV5xTWCZIBJinJVq5C7AYp1gFB99nLpw86QXrNoZteHyvJuLM0s+sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by SA1PR11MB8596.namprd11.prod.outlook.com (2603:10b6:806:3b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 20:33:42 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%3]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 20:33:42 +0000
Message-ID: <e082a1a9-ae9c-4686-b779-e5f3fb2a84d5@intel.com>
Date: Tue, 5 Nov 2024 12:33:41 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/xe?=
 =?UTF-8?Q?=5Fvm=3AReduce_n=5Fexecs_for_bind-array-enobufs?=
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20241022201130.5724-1-jagmeet.randhawa@intel.com>
 <172965827549.1322097.15498286541015336544@2413ebb6fbb6>
 <20241028165547.2wzenuqw5l4srbly@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20241028165547.2wzenuqw5l4srbly@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|SA1PR11MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 874b19e5-f204-4d29-ad68-08dcfdd92373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QThFVTVPeEpodWgxdStJNDJjU3FzeXJscDluVi9NcWdkM0NrRTdlcGVqSGs2?=
 =?utf-8?B?L1JFQlBtaEJmNGRNZWRheFBPS3NEaEVCa21WckVPUGFBWEErdFk2aEwzTUVS?=
 =?utf-8?B?MUtCL1FaQWJ2K3JtaW85VWRlRnBWMDZuWTlselNyYUNiUTFhK2h0QlcrVTdO?=
 =?utf-8?B?bmcwR3lEKzBxUFpIa1lRSVdzWWIzZnRpT0x2UmNSNUsySXBad3hFS0FneVFR?=
 =?utf-8?B?ZzV3Z1JGT2RXNjNiTGs1QXR4NVFnQ2RJQ3YzOTJObjkzM0djMnRzaXhsUk84?=
 =?utf-8?B?RVFDeW43MmdGcDYyS1VzeGZqaWJCQXZwRndNZGxlNW1neVNLajNHTkl2b2Rn?=
 =?utf-8?B?UXlpaWlXbnBCeFhMaFBlblFCdmJPbmNtendXMXEyc056dExESlI5aHY5cVVa?=
 =?utf-8?B?Mno5d2w3U3lLcnZUZXd2WkxkeFhDWmR6TGt5aHRTS3UwNFM0VENGUmIxa2lT?=
 =?utf-8?B?dThicUlBeVZ0WE9COGJLVUkxU2V6bVQwTGhuWjNrd2VXS05NbmdQTDdiaGRF?=
 =?utf-8?B?S1IyZTZWZzB4d1NERUlZN3BYNTFheGVNenRqRGV2MWNyZ25PSEtza09Vbkpt?=
 =?utf-8?B?VjVSVWdXT2xpVEFaSTAxWmtmRnplNzBhMVA0RlRnRDJoZWtWREZxQUE5ZnVI?=
 =?utf-8?B?UVB0SURqblVGTEVLalpYSjUvQ2hmWHozTUVwK1FXMVVSeWJoeVMwNzRiK01p?=
 =?utf-8?B?YUU3b1dENEV0a2VBeHhWMlVERlR2OC9WMmJMdldjZitNeVdzTytzRURXM3p4?=
 =?utf-8?B?WVFnTHR3RzNsM0hOYWtkemcrNmoza2JOQ2RPTS9pQ2J1ZWdvWjVHUDJ1cC8x?=
 =?utf-8?B?MGFIYk9UVzhBelFYbUtOMjFMN09SeXdDOFRqaTMrbEtlUFJjYWJ6ZHUvb2hB?=
 =?utf-8?B?RUtkU0xQVmFrNmhZd0dIRzFuRFR5RW1MTmVVTGVqMGprNmxBbFJHeTBrdG9L?=
 =?utf-8?B?Y281Z3ZzZG8xYXJZUTlLcDg5K0RqSEJFajRmRGVTZ3FYSm5GdGtGc1d3bnY3?=
 =?utf-8?B?TUp6dWxDN2NVNkRTT2FFQitWazV2bTkyWFI0M0wxUFlDVENWaUVPOGRYNTB1?=
 =?utf-8?B?bEdFU3ErK1ZZRHpJSEppdjY0ZUl1eEFQdlIwV3pTUGVlclpOUGxEVmx3Q1h6?=
 =?utf-8?B?MEd0YVlaWndNbkxpZ2Z2YzZwNXpvL2RpZHlpSStwdm5VU2dkcmNwTmlMSXQy?=
 =?utf-8?B?b2E1UWlVN2x6aXl5Y21kdFBJNGR3VGt4emYrbjdCRmxmRGxmMXYxMS9Hcm92?=
 =?utf-8?B?R2hmbWw0K0tVUFo5Q3NrdGMyUC80cmNFcm8yQWZoZDlCYUF5T0JOaFBLY1F2?=
 =?utf-8?B?elUwWndaSWhoWVpJd1NQcitVcFd3RCtvYkIvWnVaYTB5aVc2TmFLVDF3Z2My?=
 =?utf-8?B?L1VCTHNBVzdyM1pKK0x5Q1FKMVF0R3EwOXBrdzVCZ1Eza3RxZjcyVHd1a1Va?=
 =?utf-8?B?Tnd3aGhVT0dQaTQyakkvU1MvU2NWNGMwNU5HSTZIcnlNU0xGWHlWbVUwUjdr?=
 =?utf-8?B?OGo5SytBc3FIbHFyQnkyUXFnZ3BCWlE4Z3EwUmhyNmdOY3hwUkNoWUVFWTgx?=
 =?utf-8?B?am1keVJoUkRJTUw4MEtwRVhXWVdDL01IY2hlTnczRWZ3ZW4xK082aW8zaWZB?=
 =?utf-8?B?bkFyaEhjNFl5cUo4WEhmTkJRYTNWRFJDTFJZYktIYU5WeVBic2gzd1YzOXNO?=
 =?utf-8?B?bGhKT2thYU5nNG52MjE2Z0RmVTBnRzlXam02Y3VpV0F6ZDEwRmdsK2J3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEhjMW85cEtlR1RxWGMzMjN4aHpFcjNiNjllWDhDSkNKSmhtbHRCNE5HUnJn?=
 =?utf-8?B?K1pvMXloWkJEN0RkTjBlT1pVK0ZseFZuSFYrVXBQNXVCVE9oYjc3T0pORjc2?=
 =?utf-8?B?aUVEQWtpeVBoSE5aYm5xNWphR2RrVDQvcElGTUJONXh1K01GTnUzVGQ2MXNm?=
 =?utf-8?B?dC85YmZveHIvcHcrLzhXS0dYdjc3Z2ROMFNMd0gvbm9MVVMxV3RuS0VsVUxE?=
 =?utf-8?B?aC9ReFoxSFBZcFZlT2k3ZWxDUnZnV0Q5b2lWUGJKWWZCU1pITE5relJqY2Jt?=
 =?utf-8?B?UTJmZXhLRVRRNmt3eU1BcWdmU3NHNFlJMG1IM2JCYkU4NnBlRUpGZ3JWdlFs?=
 =?utf-8?B?aGU1RlU1WVVRS21jS3ZnVktGUkM5ekhrVElBWmdaN21xTXFJdjNnYWp4NGVQ?=
 =?utf-8?B?TE15OGtWU2pJeEVlNXM0ZXRVN2dGaVhvcFZ2dDFrdnp5NkJSSnhkRHl2K1VW?=
 =?utf-8?B?V1NRaHRzSWp1UGJJQS9KajNqZ0g2WTBBUTVTMytLdzJtNDllSXhzWnNMVkNU?=
 =?utf-8?B?WW5vdkxMQTZMNFBjWGhVUTJYWEZFdUNDWEg0MUswMWVObVdTZzlxSHdrWmox?=
 =?utf-8?B?MUN6Z3NZTktYTFFKWG1EeXRwKzRBWU5paG0xM3VkRG5sOGZuaURGUHJIbjlJ?=
 =?utf-8?B?c3VraXNVTDE0ekxJam5pRks2ZC8zc1p0dlRwa21Ia3dXKzZLdW4zVURJcEZO?=
 =?utf-8?B?ckxqM1FqV01NQXhBOHNiTjZnVmlmYjhEUnlhd0trR2x2VnE3Q05uZVVSUERL?=
 =?utf-8?B?alZ1SlJNZUk1NEQ4UmxEbDdLSmRRUHRpNFVTNkVKQmNUbzZFSFhTK2Y0a3pG?=
 =?utf-8?B?ZzBSVE9Hd08vSW5Wa1EyTThOeXk2cVZ3V0h6M2llK0xmWUQ2a2hhc0hZU21k?=
 =?utf-8?B?ckRkcTRvNnRxQU56RmFJVTFWMnpKVmtRU1U5NkRkVU10dGoyWlRSMjJRVWN1?=
 =?utf-8?B?VkwwbFUzL1QrdkxhcEJiRFc1bXh0S0hPS0g0WDJPT2JQTjJZcDIvbzlBNmdQ?=
 =?utf-8?B?SDhGWXAwNExkWkNnK1lkMWxUV0RpaHUxNERnZTROL0JrVjlUQkFPWE8xQnBD?=
 =?utf-8?B?cklVOTR0Q253THJDeVpkRk9qaFVRemc5NzdHd016RWI1U20xS1BLZGxlOWZX?=
 =?utf-8?B?cnFXbW1tZXBhZjFGZUxGSnkxS2JhY00vbnZNUWw1QUNZS0d4d0ppazdmTUVG?=
 =?utf-8?B?MjNtUSs5QmVXVnd1YkFuaTV1bXBSWVo5azRqakt2TFZlc2U3Qzd0N1hScjIz?=
 =?utf-8?B?NlNzS2xHMDRlV3VFb3Q4cE9Xc3pGaURQbEphSTgyZUFZaDcvR2xlN0JKM2Vo?=
 =?utf-8?B?RHJYVzNFa09leWFpbkxWM2poVDA5Zkl3YXdKZmxDeFJ2YnI3Wnpyc2lFMjdB?=
 =?utf-8?B?TTBVbEtCTWlpUHNqalowV0h1L1ZuL09LUHRIcmxIOHlYaWJ6SU5YeVk3TDFz?=
 =?utf-8?B?SDJJY2JxNjJvejFUTmQxQ3dhQTZPcEVlejFndjcwelpFMEJCcmdpZExraFhM?=
 =?utf-8?B?dlJQdmFmUXRuTmxGMCtNNnU2UDV2VWdUN1V4NjdmMEJ5WVlnTjRWeUdYdi9I?=
 =?utf-8?B?L0NBckVXemdaRXlycG9PaWZVd0xQcks4czNqR25HRmNrNEFTYzhqMXVlRXgz?=
 =?utf-8?B?TEl1cHpYZUtzbEYwd2Z3RDc1Q3dzZzhVbm0wU3NQbnF1bHNQMjVTM08xelcw?=
 =?utf-8?B?RXNRQXhGZHhVaURXcXZpTzdtM0NXYWlNOFlwTUx0TjV1a2JucEJ0Rlo1YktG?=
 =?utf-8?B?eVRsWllNL2FhNTA3YXRPZnkwOFFNOVRBYUhReTBnN1hXak9KaU1SWDBOMm1Y?=
 =?utf-8?B?VUNFaWREVE9OQ3EyNkt0WGpmU2sxZzNvSi85OUJrRGhyNzRyMk5MbUtWdVBr?=
 =?utf-8?B?dDFrTzdsU05GNDNZckRFT3FLNkxWeHhta2o5SnlhRnBIT3JjQnlnSW03NFJN?=
 =?utf-8?B?d29KTFFmRENoazZMUE9kT2pOZ0lBM0VxeWxkcDRpaDlaOVpna29MVks5Q0ZI?=
 =?utf-8?B?Qk1Ecm9wYVR1S0Y3WmJ5TEhKS0VZaHJnOHFSR1VCbkQ2T2pVSTlXQ3FvdVNo?=
 =?utf-8?B?djR4SnIzaUNXKzJGZGRFYkgweVdRNWN1eTkwTWMvZlIyWXZrTTBoWnFqcndq?=
 =?utf-8?B?aTFMb3JsK0hKTmo3RktsU2l6VE9DTFlTZy9FN25CdDVzQVV0YkF4TDAwNGhK?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 874b19e5-f204-4d29-ad68-08dcfdd92373
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:33:42.5452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgmUMyf7G2b5+DKxnMiUCMznFpt4gzlqzdykRIONPq0Z2jZNHIH8Vp9MXjOcudbnVumQVzIYCgQu/PzxFQnaUhoYFGcZQ1WgakqDuNzU/ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8596
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


On 10/28/2024 9:55 AM, Kamil Konieczny wrote:
> Hi igt-dev,
> On 2024-10-23 at 04:37:55 -0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: tests/intel/xe_vm:Reduce n_execs for bind-array-enobufs
>> URL   : https://patchwork.freedesktop.org/series/140336/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from XEIGT_8082_full -> XEIGTPW_11960_full
>> ====================================================
>>
>> Summary
>> -------
>>
>>    **FAILURE**
>>
>>    Serious unknown changes coming with XEIGTPW_11960_full absolutely need to be
>>    verified manually.
>>    
>>    If you think the reported changes have nothing to do with the changes
>>    introduced in XEIGTPW_11960_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>    to document this new failure mode, which will reduce false positives in CI.
>>
>>    
>>
>> Participating hosts (4 -> 4)
>> ------------------------------
>>
>>    No changes in participating hosts
>>
>> Possible new issues
>> -------------------
>>
>>    Here are the unknown changes that may have been introduced in XEIGTPW_11960_full:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>    * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:
>>      - shard-lnl:          [PASS][1] -> [FAIL][2] +2 other tests fail
>>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-4/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html
>>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11960/shard-lnl-2/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html
>>
>>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>>      - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
>>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
>>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11960/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
>>
>>    * igt@xe_vm@bind-array-enobufs:
>>      - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
>>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-436/igt@xe_vm@bind-array-enobufs.html
>>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11960/shard-dg2-463/igt@xe_vm@bind-array-enobufs.html
> Jagmeet, please look into this, was it caused by your patch?
>
> Rest of failures are unrelated,
>
> Regards,
> Kamil

Hey Kamil, I looked into this, and tested my patch  on DG2, this was not 
caused by my patch. It is unrelated.

Thanks,

Jagmeet

>>    * igt@xe_vm@bind-array-exec_queue-many:
>>      - shard-dg2-set2:     [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
>>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/shard-dg2-435/igt@xe_vm@bind-array-exec_queue-many.html
>>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11960/shard-dg2-466/igt@xe_vm@bind-array-exec_queue-many.html
>>
>>    
>> Known issues
>> ------------
>>
>>    Here are the changes found in XEIGTPW_11960_full that come from known issues:
>>
> ...cut...
>
>>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>>    [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>>    [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>>    [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>>
>>
>> Build changes
>> -------------
>>
>>    * IGT: IGT_8082 -> IGTPW_11960
>>
>>    IGTPW_11960: d44f495790106e3e64d4540a30faa09c9fc4d1ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>    IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>    xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
>>
>> == Logs ==
>>
>> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11960/index.html
