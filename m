Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC404C28B2F
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 04:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5696010E1B6;
	Fri, 14 Mar 2025 04:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KiqcdwoY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846B910E1B6
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 04:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741928259; x=1773464259;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FqAux2plmebDR/Y3870/tFkXEmDuJiz5N6Lk3p6DfUg=;
 b=KiqcdwoYJ/z2Ueyj36Gv87KL5wzoYr25qSE1nEIJ9ZudX+3YFdJi0m0w
 MtmL+Edt69gxbsP96OTbI3PsQ4lyIG0CYwDdB5NquvUgPTxkua9T+MYI9
 ThM3pQSQDURrrZ/caUONbC1dJwp1h5pz+6XdYcLMa58/zcBPhX0vuM3s/
 +9wTLzkz+dv2iKZVPWgMjr1EX07P685c4aow3bSnaFFZPsCdesp/L7vsK
 Cn/XY1tlJSJGJo0RnAnVyko02P1NLUPhSa22Zth1nWgsGOhBpMlY1gu76
 MmT/GdSGHavl15yc5upI7nxH33ZTrxExo5d1wziGz0rSNsWgoAB/alOub Q==;
X-CSE-ConnectionGUID: VO1y3WSUQbiO2t+IAHVWTw==
X-CSE-MsgGUID: F/gihKxfQOq1LsUENCvUBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42934110"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="42934110"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 21:57:36 -0700
X-CSE-ConnectionGUID: JL9jQpA5R0y3apMpgQ47PA==
X-CSE-MsgGUID: 00saktC8QqS7LfLKWWGHJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126351683"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2025 21:57:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 21:57:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 21:57:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 21:57:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AU5STzExz48r94Jq/zfnlAwfxWNhUmshpXYk1upC566BOET8tDjhfdiJbJ74UI7lbEA3KtG/JV8nk5pHeETyNPCl/29+D8mUrxE/5XmNhRjl4ZiGsHSSTf1RXUdYeUlyIFDO1BGktbY7bxbIkXkQMwmLv8OnCdGpKR4UPpmmLUMcP6vL6RAI7tWGPlu3eZdVKtLBmYDJSoWRDDUBqIWuTsN16cZhxsQNur9Emqm/mhZ3K9j8ZK0A7OygEkMDOWvlhXSE6gxuD2DKB4u6aOYggatFcMTHzu7oqiRNbwYPyWZ23+balsYlU8DPLauO7/20NX04JpNsdFIBxCBtli3NRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWVeuj8uI+PBXfIxIfNzONCb+HDuvVVC2o65U+lH/ak=;
 b=VDAoiTzJkopv7HeVOfS/cIEHdwAZcpAm7SQdlhSwYme7C3nPmKdh/bUwZoqZnt2yU1jI7PbvCQr7mQk8DdmsMdt6rea0rS0KPleRq1R3/gsz67KQxfA9nVa9bmt6ZDVxMZgs7+4s2W/ZhUH4ZpkdCNffk69H/1MqbTvCFXB1OG/jEW87vbGvwolF/1EKFxDC0JNUml7HEn/DZ+HK0C1dKcFRe9L4e/+mdXjOJc6QGwK8dtKXz4mIjJpsqHhsbBoH1kcvAiNT2pVqU2Pu1q7Qn9VUGmN/dFojk06IeplfrrBUDlv9vnfP+2+QunoK84pPMRipuxPvOYmZtWGsjr4BDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Fri, 14 Mar 2025 04:57:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 04:57:32 +0000
Message-ID: <4f538b63-5919-4f76-afbb-523df00b3bfa@intel.com>
Date: Fri, 14 Mar 2025 10:27:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH <i-g-t> v4 3/4] tools/gputop/xe_gputop: Add gputop support
 for xe specific devices
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <jonathan.ming.jun.lui@intel.com>
References: <20250313062154.1601701-1-soham.purkait@intel.com>
 <20250313062154.1601701-4-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250313062154.1601701-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f334b10-909f-4769-7665-08dd62b4ba40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzN2blp5eXdKY1diZDBneTBkMVBJbllnWWtNSnlhS2hYZjlHTDlFUXUxY3ZY?=
 =?utf-8?B?OXRzZmlGYlU1L09qZUViYmFMWXdrdVI1cmtxTWZDNHNFbHk0Tjl4OWhLMkRY?=
 =?utf-8?B?V05kVUJFbGg0WWxJUzNYeG0zUEJPajdHU1p2VFQ3UmFucGphVm82eUVvektD?=
 =?utf-8?B?ME54ckFwTEV5bnhyM3hjSW5BZXpnSVNQMFVUNGt3S2V2MHVLeEVXNERZNTYw?=
 =?utf-8?B?SkFsSW9wYmZuZXFVWktEdldyVWx1VWhOU3ZIc3J0dGlwVjdqTW41Q2s0S251?=
 =?utf-8?B?eXUwMCs1Zjl1S1AwL0tocWJtdFNrQzlkOG9PYzZMcTMxKzNzMU04YlpUbk1v?=
 =?utf-8?B?WmNSVzBLZG1EdmJ2akZabml5anJOaUpTMXpVQzZFVWxzUHdUbFBMTUpycmww?=
 =?utf-8?B?K0ljQUcyZFpRdVZneUNEejZtK3FmTlVBSm1FY2dCVm5URmlRdno1SXdiay9h?=
 =?utf-8?B?ZGNqM2VIV0JPR01hcndYK3lUaGh1VEtLQ0NRT1AzVy9nMDc3eXQxY3YvVnpm?=
 =?utf-8?B?Zm5kcnVCL0ZIQjk1eEV3ODJXOXJGZXZtRHVXSDc5SGFTaEhNOVdmUWhMNm5J?=
 =?utf-8?B?TDJzWjRkbVdFMGxLaklPeDF1N0oyT2RHQUZVVUVvb05hMER1eUw3c0hjR3dX?=
 =?utf-8?B?UVJEMFJqYnZMY21xV2tTTzJJT2VqVyswcHE3bThDUUhGRjBDNzAxa2IvMjcz?=
 =?utf-8?B?WUFvdWNNdE9ySWxSTE5NMFN1bW9ucGNZTEF1K1VCb2lPRTVOSEo2QjVuNDY1?=
 =?utf-8?B?V2Z0Wi9KWGx0eXlUMUtKSld1dnZxUlNwc1h3TStzNXNPMkdFNXlNVTdVcDJw?=
 =?utf-8?B?V0V0eEs0ZVB0WitTeWVDMEhpOHU0SUpvcytyUGtTbm95dDNVMlhkZDNicmwx?=
 =?utf-8?B?YzBRZ2hwSGNNWVdOQWptdWcwaHpQNUZHd0lpbksxQjVSUlhZZzJFeTJFSmpK?=
 =?utf-8?B?N29JYWVXSE1lVUQrNFE2aUM1U3BYMHZGWlVhdE5BNitNZlZYRzZnK2E1ZGV6?=
 =?utf-8?B?MEx5d0pUbmxWeDdRdWc5eDNLcE9PZDlUUmc0bGw2bERWUVpaWUhkZVJ2WVBh?=
 =?utf-8?B?Z3V2QlFvOEpBOGQyVWVNVEhXTS9xQVZ6YklsUTFDSU53VjIwTkgxOVM1TmJE?=
 =?utf-8?B?MWxmVFRrOFVvTWs5WmlvWWQrNURkdldQalRtRkR2QjVMbHgrd2M5TWdDdkxS?=
 =?utf-8?B?RENkTEw1Y1VWcjY1M2t2ZlZkaE1yVFpibS96c1labHNIMmxNeDlNTXM1Qk9F?=
 =?utf-8?B?NTNEVTJZcm1TTXFDOVRJT0VLUVFWcElFR0M1ck9YT2x3eGVXTzdqbXZKODhX?=
 =?utf-8?B?a2hTVkp1cVJvMFBVTFBhQnJRRitlS2N4OHNTZndFNnptVGxuQ2hoM2ljRGdJ?=
 =?utf-8?B?cThLellqZHIzM1ZSckdwellRSGxEUmo0RHFZNWZWM0I2RnBnTlhZWGdTbmw5?=
 =?utf-8?B?MFhWOXM0RnhJcG8rbDJWOUZXU2ZnVzhjUFdSMFR3RGkycDd3Zlp0cytYVE5m?=
 =?utf-8?B?dkdjcEZrMjltSmtxTHJoKzFyc2RGRDRmSzI1djFKWTFnWGhIOTVJVllWMDJM?=
 =?utf-8?B?eHJZUFBUamttbnFRR3JQSEVXN1RJbk1MTGNnNUl0MHFvYnQvVjFuRk4ya2o4?=
 =?utf-8?B?Y0g2QjJ5ekdsajZGQlVZK2JhVFhna1BHRm5VWkdReDJBQ05qTXFsdHdQc1dm?=
 =?utf-8?B?azZLeEs2N3V3bUQ0dFpKbGlRY28zek5jTmY4d05Kd2ZvUTZ0Ym9ub1hScUVJ?=
 =?utf-8?B?RE9HMTRnZGFjTm9WdEhWVmlUOExHVTllUVA4NE5QbEhmQjA1aWc3eEduUzhV?=
 =?utf-8?B?WHBWVzg2ekhsQ1JoSUlReHBvcHVKZGQyNVM3NFNLT3BJdDVkbTlmU3ZMa21o?=
 =?utf-8?Q?OpViJE4MDA031?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTlCRzRtVUI4NzBSWCs4QTIzcm5PeE1EMldxd29zR01rZGJtT0RHaElaaWgy?=
 =?utf-8?B?SjV4OWhsTjZwcmh5R3NyT1JGK3dIMjJiNk9aSDdPc0VaRFpMR2NiTWlHVnhM?=
 =?utf-8?B?Y25pU0ttQ2pPWDJiRGxwWTltMUx0UHZTSkNZeFVHb2xBWjNZOEhVbDBiUVBW?=
 =?utf-8?B?YzRNSXZ3Z09NckRaSHloQnJlK2wzRGdnUk5odzJsbTVjYU9HRllEbDY0S1Rj?=
 =?utf-8?B?Q3FudFVXMzZRQktPR2N6SlIwa3o4Sy9XT1NWQ3R1UmhrWUdMdEUxL3QxdjE4?=
 =?utf-8?B?bUpMMVJ1eG9nUi9xQ3dvSWlSRm4zZ01jWjM4WU0xTGY3UVVIL094LzArd2Yz?=
 =?utf-8?B?aW9mZDlLLzZ5RFB3aTVJYU4yTThlQ0J4TUZFSnM3S3RtRVdMNUhIbnZGL3Vk?=
 =?utf-8?B?ZVAvTUpxZ1FLVHdBbGpZZFczSnNxUzZNb0w0a0JwK01PRzFEL3ZYTXl2cVFt?=
 =?utf-8?B?ZnZLL2hxcFJtMVp1ZFFad1Z5Tk1GUEl1M0xjamJ4dEp2UjIwNGwxa1VpdGFx?=
 =?utf-8?B?Q0l4V0IxbGUzcTB2SVBHUFYyb3JaVk16OTROK09zYjFoQXdzeHN4ZEVXMjdx?=
 =?utf-8?B?WjdoeUpNUG1OY1diSU5YQjhZQmFzeWVEMTg1YVJQSUhRcFZGZ3BZRGFDa29F?=
 =?utf-8?B?OGRTWTNHeVM1R0czenJHQmxVdFk5VjBNVHcxQXgyQ0JqZDJJcjIyLy9NM0pS?=
 =?utf-8?B?VWpPempiK21GWDJBS2U2RGN0ekp2VXh1S2YvanRhMVlmWE1DUEdqY0tXTk5l?=
 =?utf-8?B?ZFF6a2U0T1RULzZOZWRmc2RmcjMreHBNS0U4bVBUQXJjVzVYY3J1SDBjWkhq?=
 =?utf-8?B?YWE4VFpxZHEydm85NFVWMU1CWktodGZWOWt4bzg2TWxtUzVJWXFNc3U3alZt?=
 =?utf-8?B?QnltNTQ5NDdGREZ3QnhMTXBNbUVmTS9jS1dTZjA3QkMyRUYrRzRqN1ByZHZy?=
 =?utf-8?B?eHRjTDZjUkJLSmpZTDFGK0VwUTJOMHlETXB4QnFUVnE4QWpBVWdqb01iMVZO?=
 =?utf-8?B?VGIycDBpbWhaUjhQWURYT3ErdXllakxHUCt0T0xzOWdmSWlzNHh2ZXUrbURt?=
 =?utf-8?B?b21HRE1adkhMVm0wQ3ArWWJBTk4vb1VlUk9ld1NTK242MCs5MVl5ZEJTZ05h?=
 =?utf-8?B?STlFMElJTWpBU1djZXpIYlV1SEpVMFhGUlpKMm1mbTN1eDB0OEhuWDE0cG9F?=
 =?utf-8?B?RVNybnNNNTU1M1ZNejN2aUZieUVVVFR5cTdzcWVKZW51K1R2NFl2b0tQWHR3?=
 =?utf-8?B?d1RLbUg1N2NBQzhOaUFicVRQaWJXTnBJSmpmRERxMDUyMTcwUFJyVzQ5Mk1z?=
 =?utf-8?B?SHJEbXY2VHd2VmZBTmEzVGl4WGp3a0NtR1V5RjhHQ1VqNmdQTE5FQk1ESUZP?=
 =?utf-8?B?S0Z1dkRQa0VpTnBwNEF4T1pVYzJaY2o3NzI1NlZBQ2FLMmVFbmxycEZnVysy?=
 =?utf-8?B?Uzk4RERmenBZeGZTTXd3aDNhRVBUOHgzU1JqVEZrQ3V2cEdZQ05seGJsajhZ?=
 =?utf-8?B?ay95cGVzTVNCdVBCbUhyZ3FsQTdaVFBUeC9kNmxvRGZYMVJ6Zk8xVlY1bW9a?=
 =?utf-8?B?R09OWW1kaENRNEhvM3J6RktJZHpKOWxLUllNbjFXeXZrRjBjekhpcHpEeFVx?=
 =?utf-8?B?aWZocHYrZjBXc2tNc3YySVFqOXY4R2VISEF1TTJJV0I2dEdCS1VlNWJGT2U3?=
 =?utf-8?B?K1MwM3psSHNhTFQ3ejVSR2JYOHhQME9xczJrY3ZzVW9EamdMM3VFWEU5TjND?=
 =?utf-8?B?K0VyTHNSY3lGbWJWdkloOW95YVBMR01Fd2pIZUpMZ3AzOHNMNTVHTWRoTnZa?=
 =?utf-8?B?VlZJYUVWVHVFMnRMTUJYQk8rYk1rL01tQlEwK2NGMW0yMnpYb0xZYzh6QjRp?=
 =?utf-8?B?UCtEWWpTVGpqcHI5Tm1VQzU3Z0k1U2J3VGUreWNOTDBTY25SdUt3TnBzWmNz?=
 =?utf-8?B?YjNtSXdaVmU3T3k4SmRtRUZPWklBczkreERyQnAzekV6aWd2L2Q3UG5qQURW?=
 =?utf-8?B?eFBaTzNlZXRDNTRUNXB4d1VhMFdJRkFzenh0ejNUeVRPcWVmV2Z0YUtmbkVG?=
 =?utf-8?B?WEVqeHU4bGVzN2lUSDNsdlp2WEFDUEwxWmlXaHZ1NzFIczBuMmlJWVlzaFNq?=
 =?utf-8?Q?bnWr1Xn5opF45HzO1HtbACgQx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f334b10-909f-4769-7665-08dd62b4ba40
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 04:57:32.1634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCGFQtLtPT6/V9Mo93FH6TB15yN91bbsIcX/cCYVJke0qcbrYv6ScN00PgVEw7we7+/pd7FSuA9SguExDuLT4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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

Hi Soham

Replace busy-ticks with engine-active-ticks and total-ticks with 
engine-total-ticks to keep it consistent.

Replace all occurences of busy with active in the series.

On 3/13/2025 11:51 AM, Soham Purkait wrote:
>      Add gputop support for xe-specific devices. Separate
> driver-specific code into respective source files.
> 
> v2 : fix for refactoring GPUTOP into a
>       vendor-agnostic tool (Lucas)
> 
> v3 : Separate commit (Kamil)
> 
> v4 : Headers in alphabetical order
>       Engines memory allocation at
>       the beginning all at once
>       Removed PMU normalization (Riana)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tools/gputop/xe_gputop.c | 372 +++++++++++++++++++++++++++++++++++++++
>   tools/gputop/xe_gputop.h |  73 ++++++++
>   2 files changed, 445 insertions(+)
>   create mode 100644 tools/gputop/xe_gputop.c
>   create mode 100644 tools/gputop/xe_gputop.h
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> new file mode 100644
> index 000000000..4137bb771
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.c
> @@ -0,0 +1,372 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gputop.h"
> +
> +#define engine_ptr(engines, n) (&(engines)->engine + (n))
> +
> +static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void update_sample(struct xe_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
presence of fd should be enough. present is not required.
The __update contents can be moved to same function
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +static const char *class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "Video";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +static inline void *clean_up(void *engines)
> +{
> +	if (engines)
> +		free(engines);
> +
> +	return NULL;
> +}
> +
> +static char *pmu_name(struct igt_device_card *card)
> +{
> +	int card_fd;
> +	char device[30];
> +	char *path;
> +
> +	if (strlen(card->card))
> +		card_fd = igt_open_card(card);
> +	else if (strlen(card->render))
> +		card_fd = igt_open_render(card);
> +
> +	if (card_fd == -1)
> +		return NULL;
> +
> +	xe_perf_device(card_fd, device, sizeof(device));
> +	path = strdup(device);
needs a free while cleanup
> +	close(card_fd);
> +	return path;
> +}
> +
> +static int _open_pmu(uint64_t type, unsigned int *cnt, struct xe_pmu_counter *pmu, int *fd)
> +{
> +	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
> +
> +	if (fd__ >= 0) {
> +		if (*fd == -1)
> +			*fd = fd__;
> +		pmu->present = true;
> +		pmu->idx = (*cnt)++;
> +	}
> +
> +	return fd__;
> +}
> +
> +void xe_gputop_init(struct xe_gputop *obj,
> +		    struct igt_device_card *card)
> +{
> +	obj->pmu_device = pmu_name(card);
> +	if (!obj->pmu_device) {
> +		fprintf(stderr, "%s : pmu_device path returned NULL", card->pci_slot_name);
> +		exit(EXIT_FAILURE);
> +	}
> +	obj->card = card;
> +}
> +
> +static int pmu_format_shift(int xe, const char *name)
> +{
> +	uint32_t start;
> +	int format;
> +	char device[80];
> +
> +	format = perf_event_format(xe_perf_device(xe, device, sizeof(device)),
> +				   name, &start);
> +	if (format)
> +		return 0;
> +
> +	return start;
> +}
> +
> +static int engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct xe_engine *a = (struct xe_engine *)__a;
> +	const struct xe_engine *b = (struct xe_engine *)__b;
> +
> +	if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
> +		return a->drm_xe_engine.engine_class - b->drm_xe_engine.engine_class;
> +	else
> +		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
> +}
> +
> +void *xe_discover_engines(const void *obj)
> +{
> +	struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
> +	struct xe_engines *engines;
> +	int ret = 0;
> +	char device[30];
> +	struct drm_xe_engine_class_instance *hwe;
> +	int card_fd;
> +
> +	if (!card || !strlen(card->card) || !strlen(card->render))
> +		return NULL;
> +
> +	if (strlen(card->card)) {
> +		card_fd = igt_open_card(card);
> +	} else if (strlen(card->render)) {
> +		card_fd = igt_open_render(card);
> +	} else {
> +		fprintf(stderr, "Failed to detect device!\n");
> +		return clean_up(engines);
> +	}
> +	xe_device_get(card_fd);
> +	engines = malloc(sizeof(struct xe_engines) +
> +			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
why additional?
> +	if (!engines)
> +		return NULL;
> +
> +	memset(engines, 0, sizeof(struct xe_engines) +
> +	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +
> +	engines->num_engines = 0;
> +	engines->device = ((struct xe_gputop *)obj)->pmu_device;
> +	xe_for_each_engine(card_fd, hwe) {
> +		uint64_t engine_class, engine_instance, gt_shift, param_config;
> +		struct xe_engine *engine;
> +
> +		engine = engine_ptr(engines, engines->num_engines);
> +		gt_shift = pmu_format_shift(card_fd, "gt");
> +		engine_class = pmu_format_shift(card_fd, "engine_class");
> +		engine_instance = pmu_format_shift(card_fd, "engine_instance");
> +		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> +			| hwe->engine_instance << engine_instance;
This function does pmu specific initialization too. discover_engines is 
not the right name.
you could move pmu specific initialization to pmu_init or rename this 
function
> +
> +		engine->drm_xe_engine = *hwe;
> +
> +		ret = perf_event_config(xe_perf_device(card_fd, device, sizeof(device)),
> +					"engine-active-ticks", &engine->busy_ticks.config);
> +		if (ret < 0)
> +			break;
> +
> +		engine->busy_ticks.config |= param_config;
> +
> +		ret = perf_event_config(xe_perf_device(card_fd, device, sizeof(device)),
> +					"engine-total-ticks", &engine->total_ticks.config);
> +		if (ret < 0)
> +			break;
> +
> +		engine->total_ticks.config |= param_config;
> +
> +		if (engine->busy_ticks.config == -1 || engine->total_ticks.config == -1) {
> +			ret = ENOENT;
> +			break;
> +		}
> +
> +		ret = asprintf(&engine->display_name, "%s/%u",
> +			       class_display_name(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);
> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +		ret = asprintf(&engine->short_name, "%s/%u",
> +			       xe_engine_class_short_string(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);
> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +
> +		engines->num_engines++;
> +	}
> +
> +	if (!ret) {
> +		errno = ret;
> +		return clean_up(engines);
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +	      sizeof(struct xe_engine), engine_cmp);
> +
> +	((struct xe_gputop *)obj)->eng_obj = engines;
> +
> +	return engines;
> +}
> +
> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	uint64_t buf[2 + num];
> +	unsigned int i;
> +	ssize_t len;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	len = read(fd, buf, sizeof(buf));
> +	assert(len == sizeof(buf));
> +
> +	for (i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	return buf[1];
> +}
> +
> +void xe_pmu_sample(const void *obj)
> +{
> +	struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	const int num_val = engines->num_counters;
this can be num_engines * 2.
can remove this
> +	uint64_t val[2 + num_val];
> +	unsigned int i;
> +
> +	engines->ts.prev = engines->ts.cur;
> +	engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
This is unnecessary
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&engine->busy_ticks, val);
> +		update_sample(&engine->total_ticks, val);
> +	}
> +}
> +
> +int xe_pmu_init(const void *obj)
> +{
> +	struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	unsigned int i;
> +	int fd;
> +	struct xe_engine *engine;
> +	uint64_t type = igt_perf_type_id(engines->device);
> +
> +	engines->fd = -1;
> +	engines->num_counters = 0;
you can use a local variable here
> +
why is 0 outside, Can't it be moved in the for loop
> +	engine = engine_ptr(engines, 0);
> +	fd = _open_pmu(type, &engines->num_counters, &engine->busy_ticks, &engines->fd);
> +	if (fd < 0)
> +		return -1;
> +	fd = _open_pmu(type, &engines->num_counters, &engine->total_ticks, &engines->fd);
> +	if (fd < 0)
> +		return -1;
> +
> +	for (i = 1; i < engines->num_engines; i++) {
> +		engine = engine_ptr(engines, i);
> +		fd = _open_pmu(type, &engines->num_counters, &engine->busy_ticks, &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +		fd = _open_pmu(type, &engines->num_counters, &engine->total_ticks, &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +	}
> +	return 0;
> +}
> +
> +static double pmu_calc_total(struct xe_pmu_pair *p)
%s/pmu_calc_total/pmu_total_ticks
or calc_total_ticks
> +{
> +	double v;
> +
> +	v = p->cur - p->prev;
> +	return v;
> +}
> +
> +static double pmu_calc(struct xe_pmu_pair *p, double total_tick)
%s/total tick/total ticks
> +{
> +	double bz = p->cur - p->prev;
use friendly names
active ticks

I think you can move total ticks also here. pass two pairs and calculate 
in same function
> +	double total;
> +
> +	total = (bz * 100) / total_tick;
> +	return total;
> +}
> +
> +static int
> +print_device_description(const void *obj, int lines, int w, int h)
> +{
> +	char *desc;
> +	int len;
> +
> +	len = asprintf(&desc, "DRIVER: %s || BDF: %s",
> +		       ((struct xe_gputop *)obj)->card->driver,
> +		       ((struct xe_gputop *)obj)->card->pci_slot_name);
> +
> +	printf("\033[7m%s%*s\033[0m\n",
> +	       desc,
> +	       (int)(w - len), " ");
> +	lines++;
> +	free(desc);
> +	return lines;
> +}
> +
> +static int
> +print_engines_header(struct xe_engines *engines,
> +		     int lines, int con_w, int con_h)
> +{
> +	const char *a;
> +
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		if (!engine->num_counters)
> +			continue;
> +
> +		a = "            ENGINES   BUSY  ";
> +
> +		printf("\033[7m%s%*s\033[0m\n",
> +		       a,
> +		       (int)(con_w - strlen(a)), " ");
> +		lines++;
> +
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct xe_engines *engines, unsigned int i,
> +	     int lines, int con_w, int con_h)
> +{
> +	struct xe_engine *engine = engine_ptr(engines, i);
> +	double total_tick = pmu_calc_total(&engine->total_ticks.val);
> +	double percentage = pmu_calc(&engine->busy_ticks.val, total_tick);
> +
> +	printf("%*s", (int)(strlen("            ENGINES")), engine->display_name);
> +	print_percentage_bar(percentage, con_w - strlen("            ENGINES"));
> +	printf("\n");
> +
> +	return ++lines;
> +}
> +
> +int xe_print_engines(const void *obj, int lines, int w, int h)
> +{
> +	struct xe_engines *show = ((struct xe_gputop *)obj)->eng_obj;
> +
> +	lines = print_device_description(obj, lines, w, h);
> +
> +	lines = print_engines_header(show, lines, w,  h);
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, lines, w, h);
> +
> +	lines = print_engines_footer(lines, w, h);
> +
> +	return lines;
> +}
> +
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
> new file mode 100644
> index 000000000..1f23b2ed0
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: MIT
> + *
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_GPUTOP_H__
> +#define __XE_GPUTOP_H__
> +
> +#include <dirent.h>
> +
> +#include "igt_device_scan.h"
> +#include "igt_perf.h"
> +#include "utils.h"
> +#include "xe/xe_query.h"
> +
> +struct xe_pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};
> +
> +struct xe_pmu_counter {
> +	uint64_t type;
> +	uint64_t config;
> +	unsigned int idx;
> +	struct xe_pmu_pair val;
> +	bool present;
> +};
> +
> +struct xe_engine {
> +	const char *name;
> +	char *display_name;
> +	char *short_name;
> +	struct drm_xe_engine_class_instance drm_xe_engine;
> +	unsigned int num_counters;
didn't find initialization. needed?
> +	struct xe_pmu_counter busy_ticks;
> +	struct xe_pmu_counter total_ticks;
> +};
> +
> +struct xe_engines {
> +	unsigned int num_engines;
> +	unsigned int num_classes;
not used
> +	unsigned int num_counters;
> +	DIR *root;
> +	int fd;
> +	struct xe_pmu_pair ts;
can be removed
> +	bool discrete;
not used
> +	char *device;
> +	int num_gts;
not used
> +
> +	/* Do not edit below this line.
> +	 * This structure is reallocated every time a new engine is
> +	 * found and size is increased by sizeof (engine).
> +	 */
This comment can be removed

Thanks
Riana
> +	struct xe_engine engine;
> +
> +};
> +
> +struct xe_gputop {
> +	char *pmu_device;
> +	struct igt_device_card *card;
> +	struct xe_engines *eng_obj;
> +};
> +
> +void xe_gputop_init(struct xe_gputop *obj,
> +		    struct igt_device_card *card);
> +
> +void xe_populate_device_instances(struct gputop_device *dv);
> +void *xe_discover_engines(const void *obj);
> +void xe_pmu_sample(const void *obj);
> +int xe_pmu_init(const void *obj);
> +int xe_print_engines(const void *obj, int lines, int w, int h);
> +
> +#endif /* __XE_GPUTOP_H__ */

