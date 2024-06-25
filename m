Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DACC2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 04:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A07910E1C8;
	Tue, 25 Jun 2024 04:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4HOV0u3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0DF10E1C8
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 04:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719291442; x=1750827442;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=I49WcstFhBzHunBQhDo3JeJY9zftNPXliHxu3S4ithE=;
 b=d4HOV0u3rem1X6e8LB+7JtmZ6oTE5ggkXsQHFhwgAbSFf0msXCjFEPIA
 lVxgfu0Vpun72E8Fq99JFysXH9fkReKdYd/J/qS2ci93zV3pe+mALqt4T
 AzZlYnpvfW7i0GVMu7aVGZL0Uw+t1ambqJ+pWbYsUNF4LL9nF/jwe+/Ax
 uifzoccnkOoqSHu7q5HoOgJfShdSBJODrr/8FjJ1YFjzleidFoV9IY7MC
 Su320cAraBVAntq84DPk/JEKzxK0cVXxi8yAlEkyrO/HqCY5QkpDHyQa/
 3lDH3wcscngPD1ZH3Lg38/98JhU+XI+ypa8eYtUMRjy4RFpdqYoPvznZP A==;
X-CSE-ConnectionGUID: UfaFbjQVTmOjeDiFIOcUbw==
X-CSE-MsgGUID: OWt0Q9M+QeyoEh5swT6Dew==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="15977685"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="15977685"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 21:57:21 -0700
X-CSE-ConnectionGUID: pfkKxKbuSaK+ZjpVwkMHdg==
X-CSE-MsgGUID: tcrmNT3GQqykRrEKYkYDmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="43506163"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 21:57:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 21:57:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 21:57:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 21:57:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLsIaMpnDrdnRPlKmiIkYw2q0L8XAi9WblPMXVodgRAOAXlDZayEyL8r5yk79uWG4aee5mzRbdqZmYtMDHFZJAKe/hamdAkqG8XdsJzt34Gup474UzdCHjn7S01VUirA0RJn1sMj5Tog3Mt//w9cvA5xNq7cYsyjk4I9tSVHmcnNWVZRAGhMas64r3/3ytGpk3I5yXapc1vzhFjm8ZhArq7WfRHD0ub3Vxvo1muq7US53youz5YqfbUg6G28E5wCL24J2EiRjxse6qx/r/kFU6X3xpyb1Sy0jLXeNUoCQFIuT1vyRJdE996qDqxa2USFYxhP1c5qsOCptPZpk46ylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwJmPJeZFc1Oks4hjqfnDxvGB749FjP/+huPOaZwEkE=;
 b=LeGdiQ+/yTVAB/4nYVfDIHNbCjp+cATBWUVCLUMJwBNHIaNp6coz9JWMObbwiN7+acGLJyotgwBSE8PgnCYANORR5qZyfzXegUXoZL28xBrmR1a9NrTXKVhVE9q2wC1ctLNzXU5SxtgLpTizIX+6XJakAMJmf4emVDg1JV7P/kSKNjshrmUsNWtbiqqEvgP89VNPWbxyGocxULRhBby0QAQbU9/jfiAWvt2IEUmUXgxL0AlqYwoEANy1NOCqiwzUDICWvF6+1ivm5GtLMjl6YkP2TtHAhPfIs+7taycWPJtTDoLWvpDNcJFtaCgvhFqqFdV/7eaPfFkOhDNrvzi8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.30; Tue, 25 Jun 2024 04:57:13 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 04:57:13 +0000
Message-ID: <5666aeb3-8b61-4686-b250-6ea758d9c9da@intel.com>
Date: Tue, 25 Jun 2024 10:26:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t V2 1/3] tests/panfrost: Move Panfrost tests to new dir
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Alyssa Rosenzweig <alyssa@collabora.com>,
 Helen Koike <helen.koike@collabora.com>
References: <20240612070335.3758500-1-bhanuprakash.modem@intel.com>
 <20240612070335.3758500-2-bhanuprakash.modem@intel.com>
 <20240618083952.ox46lkc34o6ebzap@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240618083952.ox46lkc34o6ebzap@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a4ace3-3802-4d44-448e-08dc94d3472f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTA0UnR5VlFYZWRScFJ3UEZXdFpGaWZaT1lZb2lta2ZWbG9DcmNlNW1hdFNh?=
 =?utf-8?B?L0hEL01GWnVwenJXZmZVd2hyYkxXTGFPd2Y0ZXo3eXNpTDBkeDNKeXdGN2Fa?=
 =?utf-8?B?ZVAzdUVKMldHelErKzRuTisrbHAyTDFEWmdWWnExcW90WW03cXlQUHIvVVVL?=
 =?utf-8?B?aWZIUGExUHBFOFVGd3RjT2hzNGFzVjVWMENXWHNCN0dzeDl0UzQ0N0hmdVdJ?=
 =?utf-8?B?UFVTNVRURmRSTnJNMkhqTFo4N3lIL3hTNU5zZ2xTTmlIc1Z3SndIN0VGOFVu?=
 =?utf-8?B?b0U5dFR0Tm50anpqVDh3a1pSamE4UHFnalN1NG55cGJBZzFCTkZYck5IYURP?=
 =?utf-8?B?ZDVMUVZRQkNIUjhHQ3pFZncrTTlVdGJ6TzJ3dlNQZFNJbDM0bENmb1lhZGgz?=
 =?utf-8?B?ZTUxUkszbENYTzF2NkMvbWJBbWV0Y2pieEhIVDFEUDRUQkRGd05sclJlTVhL?=
 =?utf-8?B?VTZuVkI0MTJmRzl2Y1ZLZ1ByY1kvUXBrNE5NcEFtOS9iRkJvNFZpQVE3TnlH?=
 =?utf-8?B?OXU1WU04bk5vb2V6LzBoTVpzRFlwZ3dNaHEyUW5KYllXbEJvcDI2a01NbUVo?=
 =?utf-8?B?NUFGajZkSjUyekd2TzJrQVFKZEF5eTlHMjBnUEZ2UjUvR0szY2JoeldNRmcy?=
 =?utf-8?B?cUMzY0FjYXRNd0FidzdITXAwV09tMXlsb096b2VtdzhPM0ZOZUhtdVdDVWU0?=
 =?utf-8?B?Vmo4c3hqM28rVGlMMDN6Y3dxZUUyQkNKbHdIdmM1MzBXd3dvNjBRTmRoL1Ry?=
 =?utf-8?B?Tm5EN1c2TnFtb0RndGJJUldWTVdVVjQ2d21ySkk0RVp1b2RGWFBNQlZaS2tK?=
 =?utf-8?B?YlVjcXc4K1dFTmdEMDEvb1FmRzJock54cXcwWWVvYnR3RW1kRzBJRjdVK1cx?=
 =?utf-8?B?VWlMME4xdDBER1dkSjFZVitsTEprRGYxRDZMU1JWdEpMZVljb29rZmpjNHJ5?=
 =?utf-8?B?eHZUa1Q2U0dPdnd1S01mQlpMVG9SeDVLdHhFRCtTZXlDVU9GeXhvYktBUFk2?=
 =?utf-8?B?R0l4N3VEYVVud3FJbjZ5V0EvTXVkT0lnRW00TlhwSmx4SUVJcU5kTUE2YXVv?=
 =?utf-8?B?cFExUnRZU25Gb0Yyc1JBd0FBYlNSaWQvYWJ6VXBWTkszV0xzL0VBajN2TDZ1?=
 =?utf-8?B?Rzg2KzVQTWhRRy9admgrQVJmOXJ5Y1I3UlNJKzFEdGFxOTFZVmYrL2xuRFQ5?=
 =?utf-8?B?UGFyMHdSOWFlaEFFZkhjRU9OYitMcUcxdlZPYlFuTGwrRmV3UVVGT043YkhB?=
 =?utf-8?B?dHVHckZxNnZlRTFiLzAyV2lnM1FERmRSTjBJSDZwd3I5azR0OUt5RjhDK3lr?=
 =?utf-8?B?dnJHa0paRHlSclE1ODh2cWNLbEJwb1lYVlZsVTVOclA2YlRyYzVodjJZemxO?=
 =?utf-8?B?bHRwUjlIdEx4NnZ5Y2pkMERveFlGcEJqYXJWaFZGR3RSVHFrMlBNb0lhb2kv?=
 =?utf-8?B?NXI5MGVkckZxb2wxZHAyc0Q5ZTNNeU82U21kTFpSdGNVUEU1S1I3R2cyWUZB?=
 =?utf-8?B?OSsxck5CZ2swWWladEZmZnpITEhZOWUyMVp3Z0hVdE5zVEsyNnJibTg4eTFy?=
 =?utf-8?B?dE9DK1E3Ti83RFBGV1MxM0tKQitteDBCc0szanF4cll4ZWI2WFY4ZGU3NGhP?=
 =?utf-8?B?MlBHVEJtNnRabndYL0NWL2N4Wmw0a096R0xGSTI4ZWVoMCs4RGZjSG5KVkg0?=
 =?utf-8?B?UzVacnROL2MxeEdwTmY0M2RYVGlEV0c2MmNpMlM5dkxvMVZtNU51Q2FYN0Vp?=
 =?utf-8?Q?GdlRdicZq/h0YMtTxVxiK/gxDIiKxoHF7RjiHlh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk5vTjFPTzBzOG90L054VER3bnJXUE04UzIzSlpHUnd4MmxuQzZPQUJZWk1U?=
 =?utf-8?B?MVQ0Ykk4cXZuVUE5OXJFVENPQk9rM1kwSWpmbmVPWGNobktGVjhFdlg2N2NH?=
 =?utf-8?B?RFFZZjlFblhHbzc3QnhScDNpRTIxaWMxRDlqZUdMQVZnRWpCS2JENWw1QjFw?=
 =?utf-8?B?V1AxaXpmUWIwUUtIeUNrd2Vzb2lMdjBKS0s4T3l3WFBkYTBPNkFZaHlyL1d6?=
 =?utf-8?B?cnpiZi9ORVUrMUxwSHdGRFhqVzlWeTR3MGdMVTFkRG1UNFZ6ekZPNFBlL2Zj?=
 =?utf-8?B?WTJnN2JzS2lqT0htYTNjWnhJc0NpYXMzZ0g5Q3VLZ1ZvK3hLS2VWc2dXSFgv?=
 =?utf-8?B?ZDRzb2VQdzZiR1Bsd0wxYUNDREFyajNqbEFnRXV0VmNLL29xYmpWNWQyOWkr?=
 =?utf-8?B?WFlwRG9lUHpFd2I4VytYZXpyWCttTFBmNFkxclo2ZGI4NkRtd2dnOWw1ZFFI?=
 =?utf-8?B?OGhhN1lLMTZIM2FScWN5WWNybWhibUpFeHgyQnVxRmcvVktSQm1WTC91eGJ2?=
 =?utf-8?B?ZHdMSHMydnZZbUkxZ2lLenZVN1ovc3pqcjliVWJ1NUVHVHdMU0tKZmNNeXAz?=
 =?utf-8?B?SUJvWGhidVAycG9HNno2SDdUN3FmbkhjQ2xmSXk2QjQ4REMxQUFuVVIyWjQz?=
 =?utf-8?B?c3hWV1p0L1J4dVJ6cVhpc3hVbkhyQ2swZWhJTUkyVUxRVW5GOUU3TElKZkhz?=
 =?utf-8?B?TDMxQ0ZTazJpU25zYk1TK1FzaHN0cDZrRHRKZGhDU1BrNU1kREl4MEpjOG0x?=
 =?utf-8?B?Umo2eHVic2NSQmxiUng0UlloTmxQSGpPR1YwRlBualVnYWNsNWZPV0k5aHZB?=
 =?utf-8?B?aGxwU01WY1hTZUFJVDFFZ3d3Qldud0F0cUNCTXdFVkplK1BFcDFmcFFpcDBZ?=
 =?utf-8?B?a09ydHFLcWVldkxLbUdqQmEyTFZ3U05ENk5SU1VCTjVTTTN6S3VXbUNOU3Nu?=
 =?utf-8?B?YWZwNzlqdWVmOUM5djZodG9tRmZJcWZRaGdNei9uSjVYeG1xa0FMRWJ5NHRv?=
 =?utf-8?B?WXo3bTgxVkYzemFiUjJGT04wZEN1NFBNOHdZMTRGR3lOellzU0hlcmE5Z08z?=
 =?utf-8?B?dVlMVFBNSk5JUUNaRjdkM1A1ODhWM1hkazNoeWhTL0VsWSt5UXFqRUJTYzRI?=
 =?utf-8?B?RDcwN0s4Nkxia1p1aVBrRTZZSm54VWs5ejlSUGNCUzNodzFEMnJnU0hXMk9P?=
 =?utf-8?B?VHFSbWZ0VmRiUE5PUmhoa3FuRHVISG5WS2x0cXRTZDZkcFhPVlJYQVd3aW9U?=
 =?utf-8?B?Zi9KWDUvaXo4YWF5WGQzeTJNNUNTd3lBMk8zZS9nKzRScStDY2FlekhSV29Q?=
 =?utf-8?B?M0VNMGlSSG0yRC96R0NDajZhNzJvWE5jMU1CZCt1VkVHSUZnUFZ5dlVOYVVB?=
 =?utf-8?B?Y0haU2p1Tm84REJidzRCSkovb1gvZURsUWdRL3M1UVJJMnhINEJKQXoyM011?=
 =?utf-8?B?bURlQ1JmajdNNFlzT2ttTTI2dUF6STBVQWNQQ1J3NHdyakFQbFBWYUtueXZy?=
 =?utf-8?B?K3hNTDhkS3prUzBYMUJnYjZEeEJjaFB3Q2kzNmNHOVRXT2ZzU0IwK3V5ZzZU?=
 =?utf-8?B?OVIzL251NDlyZS8rUEZKNUZ1Z3hBa0hkNU9WRzB3K20zUlZ1QTk4SDJ0S0NM?=
 =?utf-8?B?VXZyRWg4a3BuQWNxSU5QSm1XUG5iMVRVSXAzMDBidmpHTERNMlE5VDZIbEVj?=
 =?utf-8?B?alVyMElUdnRJSTJsWDdiOUlraHQrN2pVd3NBQmdrdnR6U2pRSnRPckFHL05B?=
 =?utf-8?B?NUFEUmRKUjZhTldNa3RhT0wwTW9XdUo1THFWN3BRckt3bC9rZFR3OGt5NXBO?=
 =?utf-8?B?QlpNamltWW0vM3lxMjg4K2NhWDEvVTF3NldsNGJUSVdFNlhQWGQvcENHWU5R?=
 =?utf-8?B?S25mTmRBc3h5WFk5R1k0WnhxS09xUm0weGlZZExsV3pqNGw4V2J4WkVRTUEr?=
 =?utf-8?B?WEFuTE1tYnpEcmtqSnRva01wOFRiYmJ0SjlDcTZOTGI1R3RHRjUvL3hpNjZk?=
 =?utf-8?B?ZDlrRVBXanRUQ1NLNmd1YnFyTUtuazhTNWRRU05VQnlUL256TWN6TEY3NnBO?=
 =?utf-8?B?dDBVMk1Yalk4enBQUWhTR05Vc2gvMnE1TW50YzJFb2xpSGZwUWJsMjkrZm5B?=
 =?utf-8?B?dk9wcWJITHVCaS91TjBKUHNueWRaVHdNQnprdkNhOHVyVEZBSzM2M21Ub1Jw?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a4ace3-3802-4d44-448e-08dc94d3472f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 04:57:13.4107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Exr/eiaIjI0r0TJuwLo7ibi6xnz79L8C/61CD/64dtkk4+WaBrb5Y5j+zhlYf9kJop3zJw1KGRnoaP7otBgQ65ls0MkUejSF6Ab1a6h+c7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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

Hi All,

I'm going to merge this series, please let me know if you have any concerns.

- Bhanu

On 18-06-2024 02:09 pm, Kamil Konieczny wrote:
> Hi Bhanuprakash,
> On 2024-06-12 at 12:33:33 +0530, Bhanuprakash Modem wrote:
>> Move all Panfrost specific tests (tests/panfrost_*) to
>> new dir (tests/panfrost/panfrost_*).
> 
> Add also here that binaries will be placed in subdir
> <build>/tests/panfrost
> 
>>
> 
> + Cc: Helen Koike <helen.koike@collabora.com>
> 
> Regards,
> Kamil
> 
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Alyssa Rosenzweig <alyssa@collabora.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   meson.build                               |  8 ++++++++
>>   tests/meson.build                         |  6 ++----
>>   tests/panfrost/meson.build                | 15 +++++++++++++++
>>   tests/{ => panfrost}/panfrost_gem_new.c   |  0
>>   tests/{ => panfrost}/panfrost_get_param.c |  0
>>   tests/{ => panfrost}/panfrost_prime.c     |  0
>>   tests/{ => panfrost}/panfrost_submit.c    |  0
>>   7 files changed, 25 insertions(+), 4 deletions(-)
>>   create mode 100644 tests/panfrost/meson.build
>>   rename tests/{ => panfrost}/panfrost_gem_new.c (100%)
>>   rename tests/{ => panfrost}/panfrost_get_param.c (100%)
>>   rename tests/{ => panfrost}/panfrost_prime.c (100%)
>>   rename tests/{ => panfrost}/panfrost_submit.c (100%)
>>
>> diff --git a/meson.build b/meson.build
>> index ab44aadb1..701a5cc35 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -276,6 +276,7 @@ includedir = get_option('includedir')
>>   libdir = get_option('libdir')
>>   libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
>>   amdgpudir = join_paths(libexecdir, 'amdgpu')
>> +panfrostdir = join_paths(libexecdir, 'panfrost')
>>   v3ddir = join_paths(libexecdir, 'v3d')
>>   vc4dir = join_paths(libexecdir, 'vc4')
>>   vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
>> @@ -315,6 +316,12 @@ if get_option('use_rpath')
>>   	endforeach
>>   	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
>>   
>> +	panfrost_rpathdir = '$ORIGIN'
>> +	foreach p : panfrostdir.split('/')
>> +		panfrost_rpathdir = join_paths(panfrost_rpathdir, '..')
>> +	endforeach
>> +	panfrost_rpathdir = join_paths(panfrost_rpathdir, libdir)
>> +
>>   	v3d_rpathdir = '$ORIGIN'
>>   	foreach p : v3ddir.split('/')
>>   		v3d_rpathdir = join_paths(v3d_rpathdir, '..')
>> @@ -336,6 +343,7 @@ else
>>   	bindir_rpathdir = ''
>>   	libexecdir_rpathdir = ''
>>   	amdgpudir_rpathdir = ''
>> +	panfrost_rpathdir = ''
>>   	v3d_rpathdir = ''
>>   	vc4_rpathdir = ''
>>   	vmwgfx_rpathdir = ''
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 758ae090c..16896de99 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -65,10 +65,6 @@ test_progs = [
>>   	'kms_vrr',
>>   	'kms_writeback',
>>   	'meta_test',
>> -	'panfrost_get_param',
>> -	'panfrost_gem_new',
>> -	'panfrost_prime',
>> -	'panfrost_submit',
>>   	'prime_udl',
>>   	'prime_vgem',
>>   	'sriov_basic',
>> @@ -461,6 +457,8 @@ endif
>>   
>>   subdir('amdgpu')
>>   
>> +subdir('panfrost')
>> +
>>   subdir('v3d')
>>   
>>   subdir('vc4')
>> diff --git a/tests/panfrost/meson.build b/tests/panfrost/meson.build
>> new file mode 100644
>> index 000000000..b633d1be9
>> --- /dev/null
>> +++ b/tests/panfrost/meson.build
>> @@ -0,0 +1,15 @@
>> +panfrost_progs = [
>> +	'panfrost_get_param',
>> +	'panfrost_gem_new',
>> +	'panfrost_prime',
>> +	'panfrost_submit',
>> +]
>> +
>> +foreach prog : panfrost_progs
>> +	test_executables += executable(prog, prog + '.c',
>> +				       dependencies : test_deps,
>> +				       install_dir : panfrostdir,
>> +				       install_rpath : panfrost_rpathdir,
>> +				       install : true)
>> +	test_list += join_paths('panfrost', prog)
>> +endforeach
>> diff --git a/tests/panfrost_gem_new.c b/tests/panfrost/panfrost_gem_new.c
>> similarity index 100%
>> rename from tests/panfrost_gem_new.c
>> rename to tests/panfrost/panfrost_gem_new.c
>> diff --git a/tests/panfrost_get_param.c b/tests/panfrost/panfrost_get_param.c
>> similarity index 100%
>> rename from tests/panfrost_get_param.c
>> rename to tests/panfrost/panfrost_get_param.c
>> diff --git a/tests/panfrost_prime.c b/tests/panfrost/panfrost_prime.c
>> similarity index 100%
>> rename from tests/panfrost_prime.c
>> rename to tests/panfrost/panfrost_prime.c
>> diff --git a/tests/panfrost_submit.c b/tests/panfrost/panfrost_submit.c
>> similarity index 100%
>> rename from tests/panfrost_submit.c
>> rename to tests/panfrost/panfrost_submit.c
>> -- 
>> 2.43.2
>>
