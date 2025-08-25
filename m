Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C33BCA0FE1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 10:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEFB10E426;
	Mon, 25 Aug 2025 10:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0lxqNO3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6409710E426
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756117190; x=1787653190;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/j1ytKsO01Gbu6RYYuty10I1h7rv1c+mQ74Qj82RsKM=;
 b=d0lxqNO3wApyX5MDTcY5IL6CK7yJ7/0EzBCVfna/9kq44oHbnWkxkDS/
 UZ5c5A0Eszl0FjUXcbnjLFWpeLybGZbZNHmkBvLdU/qDlafVaG20jPzbU
 +uUlyZZwhmfaC32sNlPIvjjmj1kSUKZh7Yx/LQfMwp1RArlTbnAymLsxw
 uBp8r1XPS/LAB/vv4p8h201zjrjZY5G3e3p9OXFh/xMM9u1vjPFgzD8Ue
 3iBIgNagbE9jLfdLqPX4lAlQZe2Kr8drBsKFtenGS5S2fYhChhudZkzst
 pX5nRbPUetYWdp8PDnKKLMTQHXceQQ7a3eJK8WfmAmJGi+EpQ2hoWOop4 g==;
X-CSE-ConnectionGUID: GL2t9snkQou6yIT/a82zMQ==
X-CSE-MsgGUID: qV9/NPVhQFCtttQUnx/Ttg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69699674"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="69699674"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 03:19:50 -0700
X-CSE-ConnectionGUID: k4z0QA0FRHa/PHwG5gw6hA==
X-CSE-MsgGUID: SPDg25Y3QlGmFH6MyDXnZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169649194"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 03:19:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 03:19:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 03:19:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 03:19:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdNn1mwW4LwCZRUGczL8bN7c4CZW3KvXXgfU1NCPw7LqzA0wvOLxENGBfjDDxtMG9uc6gxSYFreZNMBfyrZ1Hxp/JHQLZQdoGxERfB35D2nHSmCnoQOkjyCHp46VUnrHiTc3+oSehVg5Nzr7ok9EDbdj7B7Uq7jc1tTVm/cbCl5Y4n1lkJ3LZZOfiKYzxBf1/QLfTgpiMHIt21sTXY1pE3FyMA16MRzW0YCEUNuGsV/tzU0qCbXenaIZ61mdqojujkCT033Wm7aPk3BrAOdQVm9k1DN1SV1KYlAQkBXHZ0T/qydYjyndRC6Q/YhWwb6QH09DV10Z1GfCNLojYpjuwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAcTBL/+o6MfrV58JBarLqn7Ti2SFN4uKGAV+pe0VUc=;
 b=ZY41DLZtCC0gx2JCzkBR56iSqoA8ryj9D3cE0MSH/OPkLYzGX8ikAPTAbHN3vvGFSxrXEGWEsfEahhQlraTKhYpM28ZjC0OPZhWLNeBXSdmNshXtzKCLUiiRhSNLXjKxt/u+d7o15XhxazVxoYUGCvTVTPU3sedJIHOjvbaRZEHCpVCaZHrTY5sqJgkcjrPDKMeaO8ObtZ5V76wfEDsKAkyJ5UDpdvjEix1nvy+VPgk87M75s6pTV9jHwZbInzGvCD1anh4a/w862CJKo7TqQiKJ/HUSXQN3DdesRRtirDrh5aj/bJ2sFDUPzysRa8rqV6SUY7tQj26Qga6jFcmo5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB6811.namprd11.prod.outlook.com (2603:10b6:303:208::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 10:19:42 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 10:19:42 +0000
Message-ID: <76b101f5-9477-4286-9747-d270314ece6a@intel.com>
Date: Mon, 25 Aug 2025 15:49:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/xe_configfs: Unbind before testing
 engines_allowed
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
References: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
 <20250819-configfs-unbind-v1-2-8359e66e3241@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250819-configfs-unbind-v1-2-8359e66e3241@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb2ca74-b284-4ef1-3a84-08dde3c0e7f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTltNWw3ZmxxeitDNmhyTCs4Q3o0SU5yVUY1Umt5YXRGYnJDT3lLSXNBVWtM?=
 =?utf-8?B?VzRqMHVEU0JwUEp6YnVKaUc2aW9aVkVycHhjT2RRWnpjKzBXRmxpSWgwdXdI?=
 =?utf-8?B?RldVbDVOTWlSU0pSVFBOeVhLd3JoV0FMc0kxUzcrRXVvZUtzdE51ZDVLNGxR?=
 =?utf-8?B?MlMxd2J1cFhiVHVpLyszbElMcWRBQlZQTURncFZlTWg1V1Vpc21OSG4xL2hP?=
 =?utf-8?B?VC9nRVdaOFZOSXBYSFdCbXBOd1gzcXIwSklpcDBVcnlJWEdoeGRqTjlmUGNj?=
 =?utf-8?B?Z21ReGZDS3ZMOTlCbUFpdFh1Wlg2NzlPeWJ6ZmZ4aTJRUGhEbDl5bmFKOWh5?=
 =?utf-8?B?UDZpUVJWT2NEc1FreTVhQVNkS1g2cEFrc2o0ZFdRYTZZU05iTkxFRG9wd0xE?=
 =?utf-8?B?NmxMcFEyMW5zOFFMTVB5V1hyMGVtOEoyLzg1Qk1IbnRGbkFQaXVFZ0w2aURV?=
 =?utf-8?B?OE5ONFBUbytPR3BpaTFsaGhDbTRoNVUrcTBJaEpOZVhhMC9JQ3VXQzJKVEFr?=
 =?utf-8?B?U1VMQ0VMV3p1T3dxblZLaG5OOTQzc2pnUXpYZEt5VVhKUWhEQmxCS214K25R?=
 =?utf-8?B?NVFjMTVkbXRUWWI1Q3ZjVHhNR05GbUFSU0J3bHpGNnRmU2pRQ1JuTkN5bm0x?=
 =?utf-8?B?eSs2Nk5GdHoxUWhQQ2cyaWNpNXBrVFhYd3phWDB1cjhETFpqblhpZHdNd3BK?=
 =?utf-8?B?ZllUc095ZFdWc2kxelhOS2U4b2xWVTRENVdMSi80b0ROYXdXTGdWc2gva1VD?=
 =?utf-8?B?djJsYkVNODdwK2NJZVpyQzNsU3dNeWxNdVVqTU5OdGFRTENLelFUUWZLZVg0?=
 =?utf-8?B?SEY3YkE0OUl4UTdQWDJCY0IvbFo1Q3pzVzhtM0cxVW95VXoxOWZPVzFXSFg4?=
 =?utf-8?B?VG1JSVAraDdBNS8xSTJvZHBHM09xbXZRclY0S091b2p0Sk04T0RiYUVpekQv?=
 =?utf-8?B?RkI0ZFkzeXlTMWkwVEpYVlM3TTlMVVpyMEFBWUxPWmRSTmwxR1Nnb0FjTmd3?=
 =?utf-8?B?K0hXU1VnK3NaQTlhQmNBZTN3VnhZSTVRckNEeWJuWHRtNVJIcVhrMmhRdzdm?=
 =?utf-8?B?YlFTbU5SRERMOUF4bHZXdGRyZHhVSERzbVVBUkR0emhTRVVBY2FrTWM0SDI5?=
 =?utf-8?B?c3VjK0lHemhIMjB6SnpFOE1uUXBydngzQ3RsVXRKSldoVW16Z1hXQmQrd0lK?=
 =?utf-8?B?QTJjNDlKd1F5UUk2V0ZkODhLY1hDZ1FDVmR4SkdpdHN6OVc1YmpiOTdaalQy?=
 =?utf-8?B?S3l0eDBXQldzNHVxR2dkZTdrSGx5aVF5MWN3dEZVcHAvZDVuazE2aWE0NUU0?=
 =?utf-8?B?UEx0U1h1d2pBczg4RFpPejVrT3IvWTczc3JYOGRBYmwwekErUkJlZk9HdHUx?=
 =?utf-8?B?NjdzUUZBMU1Pb0JxZXpHYWVNSVJBY0pab3FYRTd5N2s0cm45YUExNlJ4aUJP?=
 =?utf-8?B?aHNrdEdZUjdydzlLN2MzdmFwRlUzM2pXRWI5M25hUW9kS0M3aDlTL0g3Lytx?=
 =?utf-8?B?YTI3RkJ0OGFyT2UxV0xubjdFYWNPdEtSV3Jwa1gybldEMXpBck9Uc0gwa1Bj?=
 =?utf-8?B?anQ1MmpsMlBsNVYvMS96aE9mcFBJSXBWaGh6MVRUYWdKMnJHN0h4bUwvUUcz?=
 =?utf-8?B?ZS9zUTlxRktCK3FiYmp3akZXMGpHRkFtQlZvQ0E2b3ovTjh0enkrMzV1ZnYy?=
 =?utf-8?B?bkt5TVpFelpUbWxZS0hvVjJxZWFhS2VjRHNaWHBic3RpYUhKRFRJc2RUclNq?=
 =?utf-8?B?Qm5nd3NobmpvZ016M0NUK0p1UWhHbThlSXdzTzdhT28yVlNqRlUxeHhJMXlo?=
 =?utf-8?Q?90BJfF9D54julrIo1wmqlM1XWvVGYP4gPnkxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGR0R3FiVzJ4T2x5amlJQ1ZGQlVEWmc5d1Jka0V4WTdQVlhYV3VlKzZkMFo4?=
 =?utf-8?B?REtGQnJQU1hpbllRY2hwMWFCdVREQmxEcURENUpPM1JPRVNqdDV2VmthMkxD?=
 =?utf-8?B?Yy9xYUNmMVVWb01aRisrTDlhNkcwc0VLdDZjM1dGVjJpcEZBV1NXUnNHQXFo?=
 =?utf-8?B?dUluQ2R1dFRKMU9rVkVCVTJnTVMxSW5PU0VvcHdxWUNtMkpCSm1yMUdVMjJm?=
 =?utf-8?B?NFczK2Qrei9wMStSOU0vVlhyQmVzWit0TkMzVU5vS1dFd0VOaVpaeVZlcVdC?=
 =?utf-8?B?YVdpK2dMNlhDYktOTTRCMzRmYWpnL2Y2U1NNYmx4OFQ4dFByelhkVkVjQUpB?=
 =?utf-8?B?UjdNN2xoTWsxQ05IZ044bDFLSndlS0ZEYXVBVVVPWVJSY3B2c0FndjJkR1ZK?=
 =?utf-8?B?bkEyWW5wZDNrbEhvWGJldDJ6VmFQdmRhSzVRVFFRd2FjU2hhNHlZNnR4dVg5?=
 =?utf-8?B?aXc4QUU4YU01UmExTXdhRGdRdWFXQU9JQWd6bjFFU21lSWNGNVFvSVFuRFph?=
 =?utf-8?B?TURNUThQVHAyZk0veVpOOHE2L3Z6VFpHVEdsVVRsRjQ1N09KTE93RUdNeEhI?=
 =?utf-8?B?WVFFTm9oVkRHTnpXVTVZMXYxZTIyWkNldE1BYkRpdndQVEpwbEEyL3ByL09F?=
 =?utf-8?B?NmpZTUs3ZFJabktpWDVvOGZuNnBOZUd1NUZDMU5JbHZMeXZDL3V2dndNWWxm?=
 =?utf-8?B?aHZXcG55c3ZnMFhMMFVKcTViamprSVhtdXpkeERJS0hrNnA3azNianozTkF3?=
 =?utf-8?B?WW5CeHFVM1VKcGZjckZ1dGwrcE43TU1qNGlINUcvOTVkdkpxQUt0VnFCaEYr?=
 =?utf-8?B?R0U5RHIzNEdLZXVBOUlpRVZvSU9UNEJuMzJZSk1kekNzeGxKRnJlQXp0THJi?=
 =?utf-8?B?Wk1jaFR2NlA3dDJVc09zTDZkeklpWTFZQkt4QkVqWWJQZGlkNnRTUmpaK0N2?=
 =?utf-8?B?SHNaZlJKNTdJUXIrbjM2TDkxZnYyNisvNGpDbE1QN0Y0S3J2NnoyMmhHazVl?=
 =?utf-8?B?OFpsaEdRdkNDQ3Rod0MvaEtvWHg1QU1ENWgxTHlEOUFLd2NYZ3Yxd3Z6R205?=
 =?utf-8?B?WWpWT25wOFhUU2x6WUpKSzNjQkExTzVFWS80Yk55Tjd6MnJjQjhHSWowamZM?=
 =?utf-8?B?aVRxWm96czAzTzJtaHhZRm80V1F1Z2ZXQmxwNXdJQUN5ZStRQmdES2xtdE5y?=
 =?utf-8?B?V3ZRNzdNckdpOUVMWk8rOEx1Q2h1Lyt5aVZiNEdYRnY2M3pYU2dzZDJiYklq?=
 =?utf-8?B?RjJZbzA5N2F0TTRXblJVSXhBRmlSdThYTXJHUUYvcGZIUGc1REhnaEg5Yll2?=
 =?utf-8?B?ZUtNcnFzT21KaXd0VURaMnk0N3h0MnJmaS95c0N2TjlZRWd2VGtwZ1A2TW8v?=
 =?utf-8?B?WndOTnVDVWtBNzF2VkloaFViZlhkVWpZOURRNFU0Q0ZTUmp2K25PU2tKYW1l?=
 =?utf-8?B?YWZmLzVNdmI1TjJ2RlNGeHBZdFBjd3ZEdm1MaFRlNXF2ZU5iN0hjNlFVK080?=
 =?utf-8?B?VWJ1NUVrSE5FTFVGYWc2SWNjUGp3cjJTVzFMT2xYSVc3VXNRRlZld0kxbFNY?=
 =?utf-8?B?cjlCcy9mVHhQV2dMM2Z4S2J0aUtNa09ubzRMOEM1VXpHemZDSXVXQ0UvVnRU?=
 =?utf-8?B?eHYvTmpienNPcnc2cE40bzZQSStHcDVLT3hScnhoQS9sSXBSUzRQellVcEJh?=
 =?utf-8?B?akRZL2Radnl0NFdDeGpsdWJqLytHdnBnWkl4ellDWk1kckJZb3BqN2dscFlU?=
 =?utf-8?B?TE1DNjlEbG9FVUQ2RmNDV2VqK0E4MGRLaEJTMUxXYndXOXJpRjg5TFZyWVNZ?=
 =?utf-8?B?YzU5aW9lTC95eUs1OStlN24rM1VrMENLc3dOdDYycVBicHlVbXIyeGhWSXRj?=
 =?utf-8?B?b3J2SE5BUTFLbDVFbE1MemIvRjNGL00xZjA1RHh1MWtvaCtCVE9aZ1A0WHEr?=
 =?utf-8?B?SU85R3hjcUJBRU1aZDI3SXJ0MEhrQ05kdjJSSXFRK0RBUWljQ0YvR1lBQzFU?=
 =?utf-8?B?cHNpVnlRa3J3STZBWGttMHN6a2RIZWNmenNaUkdhSTJadHFhSEh5aXl5Sm9J?=
 =?utf-8?B?TGVoZnRsWU9VaDZTTTlUaS9pWjNocXB6SVVjZS9qWUZTbW9zaVNMcnFLREdl?=
 =?utf-8?Q?6TxPFnxMztlSfi448xs53e1pF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb2ca74-b284-4ef1-3a84-08dde3c0e7f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 10:19:42.3223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1F8X8iqI4S7WIOzWtuepyFnk7lSyxdxfLlIpWo8DCeuyzU2Z3+GiFFix7FaAMBOtirB6EvVowKNh/2UoeuIXMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6811
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



On 8/20/2025 2:10 AM, Lucas De Marchi wrote:
> Future kernel change will require the driver not to be bound yet in
> order to allow this configfs setting because it has no effect
> otherwise. Make sure we unbind before testing this.
> 
> Reference: https://patchwork.freedesktop.org/patch/669151/?series=151729&rev=4
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   tests/intel/xe_configfs.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index f01b13e13..1510f25f0 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -73,6 +73,12 @@ static void test_engines_allowed_invalid(int configfs_device_fd)
>   		"rcs0asdf",
>   	};
>   
> +	/*
> +	 * These only test if engine parsing is correct, so just make sure
> +	 * there's no device bind

Nit: bound

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> +	 */
> +	igt_kmod_unbind("xe", bus_addr);
> +
>   	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
>   		const char *v = values[i];
>   
> @@ -93,6 +99,12 @@ static void test_engines_allowed(int configfs_device_fd)
>   		"rcs000",
>   	};
>   
> +	/*
> +	 * These only test if engine parsing is correct, so just make sure
> +	 * there's no device bind
> +	 */
> +	igt_kmod_unbind("xe", bus_addr);
> +
>   	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
>   		const char *v = values[i];
>   
> 

