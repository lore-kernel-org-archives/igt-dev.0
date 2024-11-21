Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA47E64007
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 19:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0881510E0AD;
	Thu, 21 Nov 2024 19:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pfj2Ai7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB04D10E0AD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 19:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732217273; x=1763753273;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=G9tBIdoTwjypm+P6eCYjPBHfoWwkB1apBuvEHdsCG6Y=;
 b=Pfj2Ai7lSiOJHG6ksqj05kRcv3VbhxlSjxbxAt6keM8xGlrBD4WKzwmO
 oiRtGCThZxcqLMogIC0f+XzlOcZEuQHjnoSZirI9QLNKdGDEsPoFxqEoP
 ROYY7OYzjspSCd8zqC2QzauqwdqATP7zVQOHxwlOyB3CIPYOFEIzYhLN1
 7iD1zhKkJWNGMDcxBj+bD7I+VFG0RrHRULm6QQYgMd9Qx53Wr1bQWQff8
 Tabhc2SNuZ/x3yk6helUF4IHdpvlnOEDlbdvgKmmnnkXIPHh1BKGeOuRI
 IYPgY9/4eYlsv7OnglncDmjkkQ+/X2YfKxEa8cAdGwlM1gvqpNNKtoZfe A==;
X-CSE-ConnectionGUID: sQDQw6cTRgKd6FpKSln7nA==
X-CSE-MsgGUID: L9FVImayTZOx5ZTRBAAunw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32499166"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32499166"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 11:27:52 -0800
X-CSE-ConnectionGUID: dzWGKEUlTmWldvedACsdog==
X-CSE-MsgGUID: H4j+VB5LTS6TVRBWDhZGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="127870353"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 11:27:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 11:27:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 11:27:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 11:27:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaS5Ez67FfZ3oH4wVtN7eh8DouzLiQEy4xnmdhuJ/5uGrysnVEgOpmLuPEux40tx0WvPlNyw4vugicHue9AW2X1HH71+JO+RQD63+8DZkiUZPJKDHYnsVH87tQqErP70FxSunCAdg/Y9SC2PNkKm3P0ZmmQDbBvhOUtBvre/pGZwkdt4OOiIDB71GyG471/VAL1ntdugJvK+oNwyqIHPnQf2hzF1ToX4Aaw3JXkZxpuvvRx6C9kry+dx2R5SpqcVmKLBV+mfBHy2m4whhxjAT/JXg7I0XJAZ7FXAM1P0Qjt4wNvMgaKwTxlFl/4egp64kEC1vjhmYh/hqU68CLQs6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fb0xW/MOlXzwP1JJtnj8FGXNk4H4OKCxNnJJTKhAKQg=;
 b=pSAVbLkWIZueGWeMGyt3QXOGqh1+LUwQOx627k2iA3zGtFhW8ngHqw8bn1Xc5/lmR+Vt+7mStN6WdaG5qNHH2Api+nUNCkFgK9+WaCvmCdmgwtfh9uYtPUg7o91rlE/VhM7wlCXWiINOW5v8Q0dXUd8IQZgPQq+vWRSOmgpxQGuJpivkgWtC1wOIMODnTGzoOTi1mD5i9+Ly5OSz75kPKl2gsiTkOedRSWyCeEuEfm1giowIYdAKl2yzXg8TqmpL3JZSRd3pwydjt0aWi/VRbBqofHmLHsBO94ASRaBWroXpXpY+x8ld1Yl84M8rDiXeHGnfWQ5s8VGgMelWvUbbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 19:27:48 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 19:27:48 +0000
Message-ID: <f7ff3bec-27ea-4100-ad1e-f2d62e91330e@intel.com>
Date: Fri, 22 Nov 2024 00:57:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 2/3] intel-ci/i915: Drop PSR + DRRS tests from blocklist
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241120104940.2147075-1-bhanuprakash.modem@intel.com>
 <20241120104940.2147075-3-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241120104940.2147075-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::23) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dddf47b-9deb-4988-ada3-08dd0a6294f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTJ2U0dtdXdIQ3hNSC8zYWlrZTh4c2VNVEYza3JRNEtIWEl5QUcrUFNrTnZi?=
 =?utf-8?B?VUt1RUM5blBVbGFuOHR3VUYzQ0U1K21uTGp0Um1xOHBMOU5SNDhzZTBjaDNO?=
 =?utf-8?B?cHVHaTl6MjBrbFUzcFM3UzMzY0FVUGhhaXFRUGlaSVM1b0lUcjd5RFk5RnAz?=
 =?utf-8?B?TFhGZjNTY2JZazd5ZVYxQkFUd3VLWXJiU2tSNkhFREdLa2R1N09wMUVTcmp0?=
 =?utf-8?B?bCtub3d6WWllZkwzL3VJNlVjbkNUWDhaOVFJWG9OZGhEVGhodVpXL3EwVlgr?=
 =?utf-8?B?aDVBb0NNTDhzbHJJVzcwcng3d2VGTzVlVnpSN2VXSVNrcm8xMkdNU1ZRWE9w?=
 =?utf-8?B?YlBmeXk0bFRScmZJSjBiTTg0SUJLMlQ1TEg3RUQ1dWV5djRRb3J5WUtKSHdm?=
 =?utf-8?B?eDlLdXNPWDBPbjdGaGVmN3pNRW1WbzJhS2ZMbmpYYThsb0ZKaGdrRElxOTIw?=
 =?utf-8?B?U3MxYXp1ZU9sYTE2cDVBZHB6R08wNDM3M2daN0RDMWJtanB1ZVBsY3JYbm0z?=
 =?utf-8?B?L0pmd0RJNW0rWERiSFNTRlMwYVNiSmUxanlYeDZYMWdTaFVjam8vVW9TSXZk?=
 =?utf-8?B?UEUwajNDV3NuR2IwRVZpSWc4OVpRNTZGT1FoWDF0U1FZREh2TDlJeHphNnc0?=
 =?utf-8?B?NkhVajRHUlNDeGFGT3FqY1g3WVZDVUc0bHpEMyt2cUVTUHI3QUZkYkFoRS9Z?=
 =?utf-8?B?eGNLTHVpQnl6eGVhZytVakd5SkFscWpOaGpOSUNzWjgrSWYwNHEyUjM3WjdR?=
 =?utf-8?B?ZGZQeTlrR01ielM0N1dXcFFBajFaTGlUR3NJTVpCbGk3VklPOXVXRCtZT0F5?=
 =?utf-8?B?bmpzemdmazN2N1ZZc0ozdWZSWjFSbVBwRkRPM01zSSs4VVI5T3UrRVFPZHoz?=
 =?utf-8?B?bGtyNVlvak9YeklHdlB4cjV1YUNnZDFxT2o0Sng4b21nT1VMYndhdmN2RXFa?=
 =?utf-8?B?cGlTSWFSM2lTVDVPWjZUaHZkNlpSSkdYSUlZU3UyZktBdjd3NDlzVjVpWkcw?=
 =?utf-8?B?dzNHaldsOFF1b05FM1pNdmlmeEE0TWxuaThPbGt3aUg4bkZqM3hBWUJtN290?=
 =?utf-8?B?RUxkUzNaZWtjWEtaNVQyUGNCOEx1bkJDM0p5MTUyUzJCZGhUQ0tlSVNKMUY1?=
 =?utf-8?B?RVJUSmhBYTBOWlNicVdUNy9RRWRmSUtENmxtVkpkNlROcjZHWHJ0cmNiWkVQ?=
 =?utf-8?B?T25LMDNSWGxMMW1FcW1vY283YURXd09saG9vYkJSZ0N5czArNW5xbUlCQ2ZY?=
 =?utf-8?B?YUVkV2t0SHk4TUVPcHpUU2NpaXVReDJzR2hyaFJ5cXAzSW9XalQ3YTZObHNU?=
 =?utf-8?B?L3hWSkRqT1R3ZUIyMEtiUTJPbU1lR2VtLzVFNWozY29hQVpoUFVKT2hVVkJM?=
 =?utf-8?B?aWMzc2FkSjc3T1JpTENldWpGelBuM2hwZnRFZU9CbVdMTU04aEtJTTdOTUV5?=
 =?utf-8?B?ZkJkSGpuS3VORlRYK08vM05lZ0RjQldBSmVWb245RjMyQ2hUUzBKcnZKcXZG?=
 =?utf-8?B?Nlo0WEdnRHJsbk9xdDk5TUo1a0VNbkNiRFFzVEtKMVdua2hWTE91bFhzWXp5?=
 =?utf-8?B?b1Ard2R3YVFHV1lPeHBONDNpdURjT3k2cFFIajNBUlEyYVFMTUxtQUxLb29R?=
 =?utf-8?B?M1dxczkrQW01R1pScTJwQTJTUVZkTFdQT1lqeHFsajlyMmF4dFlMT1prc2c2?=
 =?utf-8?B?OW91SzVDYW0xWFhoZ29Kb3Biemp0SmZla2JySVVhNVhCUDlGOXlCaklDeUF4?=
 =?utf-8?Q?D06xOZHheCq5hif6t0nKroawnlkQZOXmvc5WLWk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUJ5ZjVBS2xJVDdZWjlWcjBiTWUvVDVJQmtDUUhoNTJaUUFVcEZTTmRlU21O?=
 =?utf-8?B?QUE0R1RUK05QY1JDbmJqYWFTWnBHNUlZMG1rQUxKVHN4UjU0UFljVEUwUW1i?=
 =?utf-8?B?S240NXQvbjNwdnJDdUltWDVnYm5Ob1dYUlBhZTE5NFUxK2V4S0d0U1RVeTVh?=
 =?utf-8?B?NTFVS1lIb0FsdDczMUhDbWF3NWNjU0JmKzc4ZU1HUUNoV1hDVHpYem1xZGZI?=
 =?utf-8?B?S3RKRWZkUEFXbzY5OTE3b2pQdUZMWXdIamhkblovaHF1WWgvNm9aTmVxSzlI?=
 =?utf-8?B?WVNHa2swY0piQWlmRGxkd1BwYkNVMHhPd3JBbFdEWWE4MVZBVkZuZ1E0aGxY?=
 =?utf-8?B?ZW42WTZEKzVHaU5hdGVtRjViZHc5YXZMODkyZE9iYnVxaW5YRVkweEFqcWF6?=
 =?utf-8?B?bDNWT0E3d2xXU2p4c2phMnJUdEhOU0pZY3dFTmFwemFqTzdhMGRZcnRMSVgv?=
 =?utf-8?B?UkZzcngwK2JteUgyeVdSODhycGNYaDRrZjcrT3AwNkxXbnhDa202Z1M4bHZM?=
 =?utf-8?B?czRiZEdDMFZWQW5iUW9haVNsbWFxZnU0Vnk5ZTVXcE5NMU1ZVGM3K3d5dlZE?=
 =?utf-8?B?cmlacG1Zbko5V1pjSzJOWGZiQ1dmRlpBckV2QkV6R1Fxa0dVY0NkNGFkQlF4?=
 =?utf-8?B?dFNEaStZK2VBL0FPcG81WWdFREZ5M0U3dm9qYTZuUENNS1h1U0xqcTB3d1hl?=
 =?utf-8?B?VDJRa3JLaU9waldEcmtlQ3JqUHZ2REoyRnRRZThUWFYxNkMrMTEzVWJZTGV5?=
 =?utf-8?B?SkpnM0w0U1JlMEV3OW1Odzl2WWtTdUNrZWJYMjh3cUtTYkJCVzdoNUhrbVd4?=
 =?utf-8?B?R3NiWEt1dDh5ZCt6ZjB6MXVYa3BRbHhpMG1lVjZUaFFUQXB6ZmUyb0NqT21m?=
 =?utf-8?B?ZFp5VTVHZGd1NnV6T1VDamJacGc0WW9wVnZ6T1lxOUNKZk96VFhlZGtXY29S?=
 =?utf-8?B?S3BIMXY2QUw0MDlZRmk1V1VJU2d2azBGZDFIeGRFYk01RHlNdU5oVGU0NnVN?=
 =?utf-8?B?YmVhNC93L0tRNDBFYURTWGg0M0xXS3YxN0RNT1U4Mm9RM1dVY2hWQlhjQkIv?=
 =?utf-8?B?WjNmUVlJVmxLOWZNVzkrdTdtNXJmK3FtdnpTcXh6OENEOUZKeUVZSGpuTU5x?=
 =?utf-8?B?TTRDVVRwMjhsSzdBWkZhdldTbHZHR2JiVDVMd2pNSGorNHNzTmtCc2N0TzMw?=
 =?utf-8?B?VGt3MnNpNGx5M05tZUxudStMQlUvdWFYRlVkVE5GOHFGVHloK0VsZDBLSUlU?=
 =?utf-8?B?dDY2V1QyUkJxTmFjOWJ3bjFJaUwzWTRjbXNuaUphUUd5SDNJczl4YUZ5aVhL?=
 =?utf-8?B?M1o3c3NQL3YveEloNkxmL3pPSjBoYS9BbEhaTTdWU295WWpUVlE5bTJ3R2Ro?=
 =?utf-8?B?WndocEU1d0tLRlprSVNhV3ZEWFgxMUZ4YUppM2hBc05WNGYwaHduWndicGIz?=
 =?utf-8?B?Qm9aUHZLUXJpT0Zwa05oa0NNbUQyakRuRW04QWhmZlVQK3NIS21XSExaNVZz?=
 =?utf-8?B?R0RhSXBDWi91MmxYa0FEMnI5YmZSUTFSY3U2cEZ6a0xyMG10dUJucURPVnVj?=
 =?utf-8?B?UnZRRnJxM21ERGl0eG51eTFEWmdvcUJXTnlrTWJWRzhJZ3VoK3dNRlFTNjY1?=
 =?utf-8?B?eldqejhxTm4zcjArZTg0L1Rpc2UyYnYwc0NXMWNtOUpiUXBCem5nckZleUdE?=
 =?utf-8?B?K3d3UlZqNWhmUlY4WnpSS0lPcVpET2xKODBOZmR2Q2QwMTFOeDU3MU1mdm5u?=
 =?utf-8?B?V2lzMHNRc1NCb0Q1RmZDa2RXNUl0QmJMY0hVMTljMzRRSXBLaHkvSXBiM2tB?=
 =?utf-8?B?Nm1ZdGwzUCtQODg4UFNteTQvU0c4TTFrbk1UZzhGc05TZnVtMTBRK3pWYmY2?=
 =?utf-8?B?akVBODJ5N1RINFQ3cnFQNjZYUG5UTFFZQXpUVk8raTNkM2RXZEYvVy9mNUZF?=
 =?utf-8?B?Q1FwVGx2b0c5bG1scHk5YWxNbUlETDBRSTc2YXpXRjFDTlJCZFRsUkdZUGlD?=
 =?utf-8?B?RmkxY2pFUDlSVjhIRDJNdk1vL0prQW9ZS294cS80R2R2T3pjZE5sOHVDdzVZ?=
 =?utf-8?B?YTI5VUNOL1k3QmR2ZmZ0UVJtTXdWeG5Gc2FkaFp4bHRRekN2bzhGRU5rVVNG?=
 =?utf-8?B?UTVKbkhLMFNWNlZDVFlvUE40TXNLczV0UzJzVU9oL0RRZ3l3dlI1Q01rTVdw?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dddf47b-9deb-4988-ada3-08dd0a6294f2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 19:27:48.1265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9Twl9+saiYps0k7AqGl5Rng17pCIe2o6mTB1xZw/vFD0T4mReoZcKDUyriv11VPBVs0Dn63kxTjvhoyeR/yVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 20-11-2024 04:19 pm, Bhanuprakash Modem wrote:
> As we decided to drop all subtests with PSR + DRRS combo,
> no need to maintian the blocklist too.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel-ci/blacklist.txt | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 775a4de0d..1236b8280 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -83,11 +83,6 @@ igt@gem_exec_alignment@pi-shared
>   ###############################################
>   igt@kms_frontbuffer_tracking@.*drrs.*
>   ###############################################
> -# Invalid combo:- PSR + DRRS can't be tested
> -# together
> -###############################################
> -igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
> -###############################################
>   # Tends to generate invalid configurations
>   # using CCS planes or configurations that
>   # exceed HW capabilities resulting in sporadic
