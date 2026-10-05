Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC94CA5FFC
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 16:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D27B10E071;
	Mon,  5 Oct 2026 16:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hS3vHox3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5553E10E240
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 16:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791217747; x=1822753747;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=TIjGrIsKJVJzd6Y1EH6tnKNGbDuw2kOohbIl7cQYhvA=;
 b=hS3vHox3JQXVzylLDQS6hETohS1RAICuhVCQ89SwUq344r9JFVdFIBUr
 biZJhv1wBXFjzjmzAO3b6SEp9gMCZceG3jmz/KxkM8kag1S/qdIUn9KJI
 pZabDxNgpv6jHrPriogpyrc7v8df1ENq/gGkrHthg8Zfup+lrguvCuSlu
 TH+NcWwnN64GfIiqFV31N2pqXrE2sTt8VRKCP3E9vIaTYwZPSEJmggKMq
 gaSFcJFWKYXkPPxWld1cmlT+IPB1/CLovQFKTWAX7bt7MPej0jvdM4T2X
 AJd+jtaI5cecFKvfRQT33MgX4jbbR7C5XkMjNUbfNlEDJNSZvSIrRoBT8 g==;
X-CSE-ConnectionGUID: oA4w2VcxQ3GQM6/KW6kRCg==
X-CSE-MsgGUID: u/8xl0PdTOyMHvaswtK3MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90663956"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208,217";a="90663956"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 09:29:06 -0700
X-CSE-ConnectionGUID: Yr619xqfT8GKOV0siGF6HQ==
X-CSE-MsgGUID: Bz1OwuJDQjGmqZfAuIREiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
 d="scan'208,217";a="273258086"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 09:29:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 09:29:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 09:29:04 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 09:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFYoQawloz6eOA09OUeyDVatVuNui0H/9suLGz1JnlWvsI9fA/rWZLWCnA8J5UqX851hI2wGcgOp0BCoNJH+GJcfA94jkFDNqAzjVl7OF1UgWx68oo2+D2HSBfVQCj4/sN1QlLqlN3wCT/EBpXJPw8+78A1oYhEC2UN6A4a3BDyQc/ySn6sZVFPECsSAlLwtEdW4G44iZ+XZfHK26PhB5Vn/AKvn3mE95ORLHIKhcFsw88M8zom9wm3EgLstyK0pyHp9BFpTwGXX98mozzJQhm4kP4V6dgvy8h9xlCOtMQAaJxr6QY33z5bm39VsPZeP1fiM43FCspQAQJfdoaZ6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxbvGs8xFpzQZuzn7fOBom2vniaKDY3thGq7G7xntQo=;
 b=a7w9RZ1hydQsDmJVUdITEaPKqyMjZ3GTdWvueeLDSs/u9Dr9T3C+yo1qcjUT4+zc5YoYOfXBdHaVLEfbmAKZCANgHEzlM0G/4Jp47gJArUAI9pdeGCT46am0xcImklaTSoJcE7FMmzzrByBeSYaINd1+pEKf3r6hJRzcCOv3nm75NfV2Boamdoqw2YI9w+Wmn8KvgtmpO+5/RI4J7MDeaQSWETwraXZhicj2ACiVuUeBY/gaT0QBNQeb8TX7CoFTrTa+F0Ohiwsi5yGPfMPZ0nf/G5iyCzJ2Ab4Ot0H4ft28GOpbhOP4aIpm7yH7g1damrl0oLy6y9bTbPgx/wYgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 5 Oct
 2026 16:28:59 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 16:28:59 +0000
Content-Type: multipart/alternative;
 boundary="------------PESUmiBvE8jq8oP9CokLjK58"
Message-ID: <4f9938c6-f2f9-4fcf-a218-48e602405bf9@intel.com>
Date: Mon, 5 Oct 2026 21:58:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm: Validate host memory for
 overcommit tests
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260925094930.2647997-1-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260925094930.2647997-1-sobin.thomas@intel.com>
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|PH8PR11MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bbe186b-ea6c-43ce-ee32-08df22fdc218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|10067099003|8096899003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: ++MiIvtsj9TSIE9o15jKRFFPwa8g4Ti8tumAs6xHiK6UTX1bMSYpffvBg6BMfcsB/LEMWv1f6qX4dUYnEAZT8pBQnNIP94SNBx+3ZOTBgpR/ntr+F5/QJ9bLUN4QVE9T1FNpUSubqnFV1j0NeacTeYThO39/Cy+OOJ0QMyOrdwfIqsTLf83aMdRTXKNn2MgI++FVEnksP7gJ1DQvgoUeXE3lvMMCmFnHjs1ULjbhZi+rblDlNQgnrQF5wwv3c3Fq/YWaCabpkG+ZuVVn5YWCsn7ui2XY/AohoYE6nlZHlLz/GKJxZUmRML1c21JLHw2W88mOqZWWISQCu1lI49c5qqhfQHVPewR5Hc7PlSI4Br7uCpeNQZMl5QEDpGvDobAlh4MJ+pH6k0wOsOJm/7liRExEOcJz8qwdaxIwamdsw7G2vRhB585B81fFbe+D0H8lDPCrUrEgZgqJCXgEG8nOQqPK82mUb25JVXPER3ivePdgtGCGhANaFJgsMRD7dl3cL8zhFduJpDLW1HdCxK+UNTILYPa4QDo8gFWtkst+3nQUsrG6uuWxB2CktMQ+f3AaQOH7vrRNNZpq2MwtytMOPUdVoFPdHAivMao2lnYSRpspeEchHr3eaOdLdRuwe/IBNfMPkCN2VEQ6Su9kdRaNO4XIidLGEBAdd4lZWXyouA4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(8096899003)(56012099006)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09wRFpuaEtRUDE5RUs5NjRTclFoOGs2S1BndldWQW4rZ1VNQ0FETXVqY3Jt?=
 =?utf-8?B?VFhBUHpkcXh2TFgzYUc1NVJubWtFeDEycENHVVlSRkNzeVhMWGdKRnl2Tkxz?=
 =?utf-8?B?UEVLVk13VjZPTjQ4Q0dCclBDSGowVkZOSUdkQUdCZHpQS1VWVUZXY25xN3Bh?=
 =?utf-8?B?ZzFSR0Y0R1hmRjYxaTlrVnBVYlp0VnlieHlzOW1sK2xrVGZIRHc4dGdFTkNn?=
 =?utf-8?B?cDdEWG9iQ09GU2NKMWNyQjNhNWxlTGt1SXhKUEVSb2d0M2NzOEpaTWFXSHdO?=
 =?utf-8?B?dGliNk9BcGFyMEw3b0djcHc0V2xST0hDZGhiOE8yNk1EOHJQWFRVR2pwUFRq?=
 =?utf-8?B?ZndJUGwwUjkyajg0OGVGUThYaTFWbUkrTlNqdzBZa2duVmZDMjh6by9VcG1j?=
 =?utf-8?B?czc1V1krcTRGNDNKVDdncERBTGVpb0o5YTNVYXpZcFNrOHF3dG5rQTBFcXNR?=
 =?utf-8?B?cFo3UmJod1BaZjFmT2pVWVVSMHp5YWR3S3krSlBBUlEvc04zUmM3VDZVMGxK?=
 =?utf-8?B?RVF2TVNpc01Dd1paVFVQVHJRLzd2NmVRd1VpWlFicGt2UVNoeEZkdldRZVlh?=
 =?utf-8?B?eEdVSHozV1VaUUcrcVptM1pJcUFUOHN1YnkzcFhWMkpKWGU0Ti9NYXFpWHBT?=
 =?utf-8?B?MW83dFdQUVVmWjdETnIrRGE1ejU1VytIL0RvUlpUak16Y05xVW5iNzJ2bG16?=
 =?utf-8?B?ZkhFRGVHREl3YXhoeG1aT0FCYWxxT2J0UWRUNHJlRHVvbWt6Rm1vRTVTRzVp?=
 =?utf-8?B?cm0zeTJoZmc2b25WVERSNjBQQWFJWEFISys1bHNheDU5T0pXc0R3RUhoeDgz?=
 =?utf-8?B?MmJVZVpnMjRjbW5XTmlJbkY4WFVNa1VJbzdRUFdpUzlySEFaWjdLYlY3TzJL?=
 =?utf-8?B?MFoyYWZ6MFNXajcwbFdyOVBjRWpDY0JJd3J0dEk2KzhoYlp1SlA0VFNvSlp1?=
 =?utf-8?B?WXkwL1c5YWVwZ1UzK0J1S2w2SGs1cEpFOC9mWmFkOGorRUxHZWRYWVRLbVpO?=
 =?utf-8?B?MWc2aWRpSlBLdVYvOCtDSzNKd2tEeWprUGl1aXIveHBkY211MFNYK0Q0YTYx?=
 =?utf-8?B?TXJUZTkxVGxGR09sYkNqZHlmL2dUQTdtemQ5T3hBYUw2MXNaUkx6cGhmYXY5?=
 =?utf-8?B?RUFBNkJtZnZidjhZVzN0V3FRV0syVHFTVjlBNXg4enlYZmhyV3pWdEJXblFz?=
 =?utf-8?B?ZFhaUDlOUVRKVFI1UUtWNXFjUTUvYlBzMGlzTkoweDIvYXFPdlRzUVdzdkdj?=
 =?utf-8?B?SEEvdTVBRGE1WnNSOXQ1ZGJyYm9tRGF5R2thOTlXK0hUYWtadWJDcy9PdzI1?=
 =?utf-8?B?c2R3eHl5VkNPNUc5dGlMWVJObWFzZjk0Y1phbDRuby8wWGNJYVY0NGhrcHFN?=
 =?utf-8?B?aVM0SGZsU055bGpHVjNvanhDR1dIVXI5a2xtYTV2QlJTNGt4VUx2RXgrRmFG?=
 =?utf-8?B?WFI4cC9vTjhlNjROQmZDMDJDbjJoeERkaE1jbVBHVjNKRFlNcGVZWkV5YktJ?=
 =?utf-8?B?ajBGL1pWTVRENFU2RURHblBrVnZ2RURTNGFCL2JqS3QxMW4yejlYT0lNQWZk?=
 =?utf-8?B?SWtTTHROOEpyUzVKSHBaTm1pZWRSTDVCdnVla1VzYXJUZDF3N3B1czI4YlY0?=
 =?utf-8?B?NitEbXROMCtsNHNUelJaOEdva0FrU3RQSDI5MTloZCs0Sm1ueE9idmhTd3FO?=
 =?utf-8?B?Vlk5R0xQU25kUHYzandZYThiYk5LanlBaUFsTE1tOWhvSnA1SllXYXpiWmhl?=
 =?utf-8?B?R2VTSHp3T3Y0eDg2Q2pGcG5UOG51R2JRWlFOWVBCVlFGYldvN1l4WEEvWE9I?=
 =?utf-8?B?VUl1dE9peUxqdDhOSWhVVEdWb0JXQkpRdVpCYkhBQWtwTGRZQW9saGpnZ3Zx?=
 =?utf-8?B?YzFwZW8rSTF5ZDhiRFlRMjVKczZCU21jdFZneFBlQTVwaVZFZndhN2c5VTFx?=
 =?utf-8?B?VVBMRVExZTFPbW5tQSt3R0g3cEFLTVdwWENNdFpzcDhZdVdSNFV2aEp1OXFk?=
 =?utf-8?B?Nld1cEZxS2Fub3M4dDVPNDJOYWlOSytFcXpGRTdyTTJUd3poUVlCTzZSMFZu?=
 =?utf-8?B?aFpTd0t5NXZRdi9SQXY2czBJenhydkhaa05hbXdsQU9zbFpjRGU2VHZhR0hI?=
 =?utf-8?B?dXVXZ3FxSFVaQXVGRW9iMlRRbVBMMzFxN3N3M2hDd0tHOER1eG9yYktQKzZB?=
 =?utf-8?B?RnVmZlZKTWpYdkNxVlhURnh0aHdqOXRhcXhvN1BNUFBCMnl3S1NpMGZ0c09S?=
 =?utf-8?B?dXlZUHlWdWpMbGxaQStHOFZXSm92b1RST25YRytkWUQ4c255SnhISHJTdnpY?=
 =?utf-8?B?alhhdlA0UDBJSkhaNFZZbExsanhZU2k4bDhYNzJTQzZGV3YxRzVDdz09?=
X-Exchange-RoutingPolicyChecked: QyMIq3GtA2wmyiCQqOBDR5cW1LaC5X0KkgoWgT5yJ4xqkym9UU22Re7Nc9nqGOFZVRWDP88ut9JubJ2l27utAqaIBQcwsaHNYNkhu3MU4d4SqG0kLzJ3yywy+iJy2WJ+EOlogmhBe9LZE7IRuZg5MctmpCdVvIwVmepvuCQaSjfghMPUFcxUmQKDJRwUS7NTQ7oXU3/YoZonMUJYSnA9lwHFr8kE9wV0RULt3eQXanUBjrHcGe5uJ5RYxEwu2aDPCGKwm/y4WLu+TmBwcdTvXX/rUc8P+tUl7UeBsJGuOswsdoymTSdDYAa2HJl4iAyU315hi2N43raTgyOljy+ysQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbe186b-ea6c-43ce-ee32-08df22fdc218
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 16:28:59.0814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q61snt/i215IzGJCkPuivnJ2aZQTaDE+Y+En0ayApwmMn8OSzO1UtPcgnEo2duKX2j30kPOU6wuxQxd5Z0ruqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8039
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

--------------PESUmiBvE8jq8oP9CokLjK58
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 9/25/2026 3:19 PM, Sobin Thomas wrote:
> The amount of VRAM available for the overcommit tests varies
> across platforms. As a result the host RAM and swap required to
> support the overcommit workload also varies.
>
> Query the platform RAM and swap space and visible VRAM before
> running overcommit tests.
> Require a minimum swap capacity relative to the platform memory
> config and limit the overcommit working set to 50% of the currently
> available RAM and swap size.
>
> Signed-off-by: Sobin Thomas<sobin.thomas@intel.com>
> ---
>   tests/intel/xe_vm.c | 37 +++++++++++++++++++++++++++++++++++--
>   1 file changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index a0a6616c3..4ee2ebbc0 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2611,6 +2611,13 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
>   	overcommit_size = ALIGN((uint64_t)(base_size * c->overcommit_mult), 4096);
>   
>   	num_bos = (overcommit_size / nf_bo_size) + 1;
> +	igt_debug("Overcommit sizing: case=%s use_vram=%d multiplier=%d "
> +		  "system_size=%" PRIu64 " MiB vram_size=%" PRIu64 " MiB "
> +		  "base_size=%" PRIu64 " MiB overcommit_size=%" PRIu64 " MiB "
> +		  "bo_size=%" PRIu64 " MiB num_bos=%d\n",
> +		  c->name, c->use_vram, c->overcommit_mult,
> +		  system_size >> 20, vram_size >> 20, base_size >> 20,
> +		  overcommit_size >> 20, nf_bo_size >> 20, num_bos);
>   	bos = calloc(num_bos, sizeof(*bos));
>   	igt_assert(bos);
>   
> @@ -2634,6 +2641,8 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
>   	/* Create and bind data BOs */
>   	actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, c->use_vram, data_addr,
>   				       c->bo_flags, eci->gt_id, &num_bound);
> +	igt_debug("Overcommit BO creation: case=%s actual_stage=%d num_bound=%d/%d\n",
> +		  c->name, actual_stage, num_bound, num_bos);
>   	/*
>   	 * On EXPECT_CREATE nothing was bound so bail out entirely.
>   	 * On EXPECT_BIND with no BOs bound there is nothing to execute either.
> @@ -3499,9 +3508,33 @@ int igt_main()
>   		const char *mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
>   					"fault" : "nonfault";
>   		igt_subtest_f("overcommit-%s-%s", mode, c->name) {

you can call igt_require(xe_has_vram(fd)); and 
igt_require(xe_visible_vram_size(fd, 0));

here so that if vram not available test is skipped before initializing 
below variables

> +			uint64_t ram_mb = igt_get_total_ram_mb();
> +			uint64_t swap_mb = igt_get_total_swap_mb();
> +			uint64_t vram_mb = xe_visible_vram_size(fd, 0) >> 20;
> +			uint64_t avail_ram_mb = igt_get_avail_ram_mb();
> +			uint64_t required_mb;
> +			uint64_t budget_mb;
> +
>   			igt_require(xe_has_vram(fd));
> -			igt_require(xe_visible_vram_size(fd, 0));
> -			test_vm_overcommit(fd, hwe_non_copy, c, (igt_get_avail_ram_mb() << 20),
> +			igt_require(vram_mb);
> +			igt_debug("Overcommit host memory: case=%s mode=%s total_ram=%" PRIu64
> +				  " MiB available_ram=%" PRIu64 " MiB vram=%" PRIu64
> +				  " MiB swap=%" PRIu64 " MiB swap_ratio=%" PRIu64 "%%\n",
> +				  c->name, mode, ram_mb, avail_ram_mb, vram_mb, swap_mb,
> +				  (vram_mb + ram_mb) ? swap_mb * 100 / (vram_mb + ram_mb) : 0);
> +			igt_require_f(swap_mb * 100 >= (vram_mb + ram_mb) * 35,
> +				      "Swap (%" PRIu64 " MiB) must be at least 35%% of "
> +				      "VRAM + system RAM (%" PRIu64 " MiB)\n",
> +				      swap_mb, vram_mb + ram_mb);
> +			required_mb = ((c->use_vram ? vram_mb : avail_ram_mb) *
> +				       c->overcommit_mult);
> +			required_mb = ALIGN(required_mb, 64) + 64;
> +			budget_mb = avail_ram_mb + swap_mb;

For VRAM cases (all 5 current cases are use_vram=true), required_mb = 
vram_mb * overcommit_mult (= 2×VRAM)

The demand is avail_ram_mb + swap_mb which is like 4 × vram_mb, on low 
VRAM systems test will be skipped

When VRAM is overcommitted by 2x, host memory only needs to back the 
excess over VRAM capacity something like (≈(overcommit_mult - 1) × vram_mb)

It can be something like:

mem_mul (you can use different name) = c->use_vram ? (c->overcommit_mult 
- 1) : c->overcommit_mult;
required_mb = (c->use_vram ? vram_mb : avail_ram_mb) * mem_mult;
required_mb = ALIGN(required_mb, 64) + 64;

> +			igt_require_f(required_mb <= budget_mb * 50 / 100,
> +				      "Overcommit working set (%" PRIu64 " MiB) exceeds "
> +				      "50%% of available RAM + swap (%" PRIu64 " MiB)\n",
> +				       required_mb, budget_mb);
> +			test_vm_overcommit(fd, hwe_non_copy, c, (avail_ram_mb << 20),
>   					   xe_visible_vram_size(fd, 0));
4th argument of this function is system_size which in current test cases 
(user_vram = true) is unused, dead code which can be removed or any 
other plan to use this in future?
>   		}
>   	}
--------------PESUmiBvE8jq8oP9CokLjK58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/25/2026 3:19 PM, Sobin Thomas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260925094930.2647997-1-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">The amount of VRAM available for the overcommit tests varies
across platforms. As a result the host RAM and swap required to
support the overcommit workload also varies.

Query the platform RAM and swap space and visible VRAM before
running overcommit tests.
Require a minimum swap capacity relative to the platform memory
config and limit the overcommit working set to 50% of the currently
available RAM and swap size.

Signed-off-by: Sobin Thomas <a class="moz-txt-link-rfc2396E" href="mailto:sobin.thomas@intel.com">&lt;sobin.thomas@intel.com&gt;</a>
---
 tests/intel/xe_vm.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index a0a6616c3..4ee2ebbc0 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2611,6 +2611,13 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
 	overcommit_size = ALIGN((uint64_t)(base_size * c-&gt;overcommit_mult), 4096);
 
 	num_bos = (overcommit_size / nf_bo_size) + 1;
+	igt_debug(&quot;Overcommit sizing: case=%s use_vram=%d multiplier=%d &quot;
+		  &quot;system_size=%&quot; PRIu64 &quot; MiB vram_size=%&quot; PRIu64 &quot; MiB &quot;
+		  &quot;base_size=%&quot; PRIu64 &quot; MiB overcommit_size=%&quot; PRIu64 &quot; MiB &quot;
+		  &quot;bo_size=%&quot; PRIu64 &quot; MiB num_bos=%d\n&quot;,
+		  c-&gt;name, c-&gt;use_vram, c-&gt;overcommit_mult,
+		  system_size &gt;&gt; 20, vram_size &gt;&gt; 20, base_size &gt;&gt; 20,
+		  overcommit_size &gt;&gt; 20, nf_bo_size &gt;&gt; 20, num_bos);
 	bos = calloc(num_bos, sizeof(*bos));
 	igt_assert(bos);
 
@@ -2634,6 +2641,8 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
 	/* Create and bind data BOs */
 	actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, c-&gt;use_vram, data_addr,
 				       c-&gt;bo_flags, eci-&gt;gt_id, &amp;num_bound);
+	igt_debug(&quot;Overcommit BO creation: case=%s actual_stage=%d num_bound=%d/%d\n&quot;,
+		  c-&gt;name, actual_stage, num_bound, num_bos);
 	/*
 	 * On EXPECT_CREATE nothing was bound so bail out entirely.
 	 * On EXPECT_BIND with no BOs bound there is nothing to execute either.
@@ -3499,9 +3508,33 @@ int igt_main()
 		const char *mode = (c-&gt;vm_flags &amp; DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
 					&quot;fault&quot; : &quot;nonfault&quot;;
 		igt_subtest_f(&quot;overcommit-%s-%s&quot;, mode, c-&gt;name) {</pre>
    </blockquote>
    <p>you can call&nbsp;<span style="white-space: pre-wrap">igt_require(xe_has_vram(fd)); and </span><span style="white-space: pre-wrap">igt_require(xe_visible_vram_size(fd, 0));</span>&nbsp;</p>
    <p><span style="white-space: pre-wrap">here so that if vram not available test is skipped before initializing below variables</span></p>
    <blockquote type="cite" cite="mid:20260925094930.2647997-1-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			uint64_t ram_mb = igt_get_total_ram_mb();
+			uint64_t swap_mb = igt_get_total_swap_mb();
+			uint64_t vram_mb = xe_visible_vram_size(fd, 0) &gt;&gt; 20;
+			uint64_t avail_ram_mb = igt_get_avail_ram_mb();
+			uint64_t required_mb;
+			uint64_t budget_mb;
+
 			igt_require(xe_has_vram(fd));
-			igt_require(xe_visible_vram_size(fd, 0));
-			test_vm_overcommit(fd, hwe_non_copy, c, (igt_get_avail_ram_mb() &lt;&lt; 20),
+			igt_require(vram_mb);
+			igt_debug(&quot;Overcommit host memory: case=%s mode=%s total_ram=%&quot; PRIu64
+				  &quot; MiB available_ram=%&quot; PRIu64 &quot; MiB vram=%&quot; PRIu64
+				  &quot; MiB swap=%&quot; PRIu64 &quot; MiB swap_ratio=%&quot; PRIu64 &quot;%%\n&quot;,
+				  c-&gt;name, mode, ram_mb, avail_ram_mb, vram_mb, swap_mb,
+				  (vram_mb + ram_mb) ? swap_mb * 100 / (vram_mb + ram_mb) : 0);
+			igt_require_f(swap_mb * 100 &gt;= (vram_mb + ram_mb) * 35,
+				      &quot;Swap (%&quot; PRIu64 &quot; MiB) must be at least 35%% of &quot;
+				      &quot;VRAM + system RAM (%&quot; PRIu64 &quot; MiB)\n&quot;,
+				      swap_mb, vram_mb + ram_mb);
+			required_mb = ((c-&gt;use_vram ? vram_mb : avail_ram_mb) *
+				       c-&gt;overcommit_mult);
+			required_mb = ALIGN(required_mb, 64) + 64;
+			budget_mb = avail_ram_mb + swap_mb;</pre>
    </blockquote>
    <p>For VRAM cases (all 5 current cases are use_vram=true),
      required_mb = vram_mb * overcommit_mult (= 2×VRAM)</p>
    <p>The demand is avail_ram_mb + swap_mb which is like 4 × vram_mb,
      on low VRAM systems test will be skipped</p>
    <p>When VRAM is overcommitted by 2x, host memory only needs to back
      the excess over VRAM capacity something like (≈(overcommit_mult -
      1) × vram_mb)</p>
    <p>It can be something like:</p>
    <p>mem_mul (you can use different name) = c-&gt;use_vram ?
      (c-&gt;overcommit_mult - 1) : c-&gt;overcommit_mult;<br>
      required_mb = (c-&gt;use_vram ? vram_mb : avail_ram_mb) *
      mem_mult;<br>
      required_mb = ALIGN(required_mb, 64) + 64;</p>
    <blockquote type="cite" cite="mid:20260925094930.2647997-1-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			igt_require_f(required_mb &lt;= budget_mb * 50 / 100,
+				      &quot;Overcommit working set (%&quot; PRIu64 &quot; MiB) exceeds &quot;
+				      &quot;50%% of available RAM + swap (%&quot; PRIu64 &quot; MiB)\n&quot;,
+				       required_mb, budget_mb);
+			test_vm_overcommit(fd, hwe_non_copy, c, (avail_ram_mb &lt;&lt; 20),
 					   xe_visible_vram_size(fd, 0));</pre>
    </blockquote>
    4th argument of this function is system_size which in current test
    cases (user_vram = true) is unused, dead code which can be removed
    or any other plan to use this in future?
    <blockquote type="cite" cite="mid:20260925094930.2647997-1-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
 		}
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------PESUmiBvE8jq8oP9CokLjK58--
