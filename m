Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D7CEA3C59
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 12:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A1F10E7D2;
	Thu,  9 Apr 2026 12:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9KRiycR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD2910E7D9
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 12:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775736249; x=1807272249;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=auSk2uLQCHsUAJ0zO7aqu+fEXOwPye4lbrgWXp4cUPQ=;
 b=j9KRiycR/GFp0IB5pUoPnC5zCfR+uFtfQpQFXcyHsK7O/3hzWZbUEhbs
 yKTrjwQb9Jd7jPUcAv+PwNbH2yv0DlDF71Yc1zqF1yYZkqI9eXn4qisDA
 26ZLUZ8Fdbxll1H50WIP1zDFh4W5eJ98nrmTcqzwz4fem8YXxyx+BiGNa
 31Ed/u0BPrCRGI+JyIhBWJePZplSBqgfaZ8WmFZUNkFO6GKtpHcoV44Wh
 cYFCmXh0wkXJtZnLXZmT59cUAfV6mSnvjOs2NmZnX5NOvE5nrYHPaLm0s
 E0nBqFTt0YAhDlGcffYC030dXhO6A9+MnGWXWbSpR/hOpHZ8mPbaoFsPQ w==;
X-CSE-ConnectionGUID: kSl/8Wf6SiuAXGk0Festww==
X-CSE-MsgGUID: 9MJd/8kMQmqi8rHsa+5A0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87362387"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="87362387"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 05:04:09 -0700
X-CSE-ConnectionGUID: 0LOJsi92Rdeifb2CxHxhng==
X-CSE-MsgGUID: B9qzEXqYTtCAyh/AFLP9HQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 05:04:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 05:04:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 05:04:08 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 05:04:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdQFEap6HlbQXcq80j0uWPe3h2e4lYc9WhN5Qo1fzWyo0i5zm5l7MCbLU3rMggiWQD+X/VXimokAYtuo6xnicHvk/2toGMPNxfn51X9RYzO1YfYiNuUApYZ3pUgXo0fUCLeuGihW982XSntM/sSVXz7zxf7esBKU0QA0kkXM6Eua4ed/Nctb6sPghn9H4t3cPByL4MvY4jnQ12agmI+r/1Xt3/VQv/sWPwEMVReEjiFpUiMlhuONQg5LMy/iCZi/MK9xtrgNPq4lnaaFISM8GHtR2z2mADfrSumNk2BCp37Oh72ZJZPeyLIMDVPVLfu/SMTqFPT35HUhZVN8M6Ou8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f9aEh2ijwjf/UQNQMI8UKvc9Y4cMeelKsjrNqlX6Dc=;
 b=IeHdyzi9XE2iQ+DDHxnpdouN9yZ4npE/lDVxtI0PboY896WhW//1R5awIXQbDZICy+JGmLJ9X+NhY/BFPWa+hEOcj4x33RDymRywQcn9CliOoUUQtw29TWoKbMTzi+rPVhIOn0Lp9expgbKSy8Qa3xfKZVzGq7iUY6TNrIfUvtfn0KvHgt8IL/a6vO9PXfRUiK/mh8vXx1UNVaJn5cC8wtne8hOdS7FsciK0scFhnf5uDNHgVHMB3wGXJEanYSD+STKrzHaSqHFBuLHC96yVmCkxJHF1izaiugA2kV8A55Pr2BOv/TQQfwUneGO3UVYvDe+2McS2WR536Du6rQTXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by LV8PR11MB8534.namprd11.prod.outlook.com (2603:10b6:408:1f7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 12:04:02 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 12:04:02 +0000
Message-ID: <5d92caab-f7c2-40a8-952f-b0b0f6629e47@intel.com>
Date: Thu, 9 Apr 2026 17:33:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_sharpness_filter: refactor
 test_sharpness_filter function
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
 <20260331190412.1907571-3-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260331190412.1907571-3-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::15) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|LV8PR11MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: c51c128d-8dfb-474a-e7c5-08de96301710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 0AYT+sIs1KV3ClsRbPfAhmrQgEVhyuCSc+ShGM2aDMfs5dbwFVF6QMnhtIywkcqsmJPu2twSJtJDgFLhOZW2n8OOM2X8NAJa7/uOsgosBytPx5UGmO7FnFVEgsrVSpbsSQMyRPgvTfv5ifroorMv1ivknz6FaPg/ctKD9HhuZdzHIfAfESFC+Ev/XXJhjU+z3UC4chDJtEypGg6u3zden5SEhCFv8ezprdpYtm+haF/aylpZb/iQxXTN0xpbrGdxiHz9ZErVubrGtVAk4UZs0fBzKsP/a/zdbhBt1vhwTNo5//NHYjTCkzsvPsRfUbEect6fXrvZKwf29bO3nIYqcqEQR3RjkdHAPXYAWLatStLDYGmrD32E4tzK/f8ywlMrmybLzV3HdHPfi2ssmIqt1s0wdInSfEIaDwKF1u2TDb2RlM+2BnsS83OEPvZKbI2XS9FShosfo2b8aE48+0s17XgIEIjssb66R/YxCdZ/Q3tyy/aIk4Kf22ACTU7txgvfvAaYkPUENxg518uqZ8U9sA6L7RjQmeunwThDht0AhLfW+TuWk2FGe2fEjT6E8i2PlRRyqcGEJl5zoP/hiBUO0IGEpX6EoJ20hMLOfV008bW3xBkqjJ6d+7DsK/++htuYfFR+Ktm9O+IzwW4XsWgRUWs1v5pAvl0oRnLnTX8LSDLgFSWRMNLBWW8jqrYNhb6L+EcPklquDD07r6+8tSjezBMDwu9hEhUGVb2u2nenOdQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OC9IQ2VEU0ZGTFo0L0hxYVVEMU9KSzA2VERtY3pkM1hyUVVWd0hqZytrd1pN?=
 =?utf-8?B?YWprK25JR1Q3VzFlU29vczRGYXdzeUdPS2t6YkpqTEZhTDl6a0Q2aUJ1eS8r?=
 =?utf-8?B?RjQ0YkFzNnNwbzhXd2RraGp1Wk5OaGRxOEk3U1M1aUkxLy8zaEhtaHdRRVBP?=
 =?utf-8?B?dXlMWi90MithK2x6QjlDK1YyOGdmQmwzU2RDWlJqOUtOT1pUcGU4NmU1VXRk?=
 =?utf-8?B?dzE2T3UrdFBGci9TeG9yMGhONUZmYzhZbDViUUR4cTBLQi9UYU9yR0dDbTEv?=
 =?utf-8?B?d1pQZjRvMUl4b2xpMVpnRnJEdkJKM3VRdW1hVS9kajRqZ1FJWXlDamhkM002?=
 =?utf-8?B?RXVKK24rT0w4eEw0d3RJeUgvOWFNWU5mRGNjei8vYmdLb2ZES05VTHhJbVNB?=
 =?utf-8?B?NFp5U2dUT1lmSmt0SWpUMTU0bEp0UmJPKzgreEV4UHBQMGdqbFVLN2xtZWdq?=
 =?utf-8?B?ajNIQS9mZVQ1N2QrSVI1REdIVEZqNVQ1S1FtMUpWUFN3L3pNd1h2ZXlubnNG?=
 =?utf-8?B?UWZ6ZEs0TkZKTEFmUC9TRDJGZmRWS3NqMmFMWjk1cGRBSEx3dzMxM3BXUzF6?=
 =?utf-8?B?S3UvU0E0aXJEaFJmek1uK2JWbGlnU2lNOWdhSEdIejJyQnBrcm5qZU9odUY1?=
 =?utf-8?B?QXFGUTgxdStweFg4andXbmlNbE5WZkRoUzdxNmNrNjRzSHZYb0kxbXJzYlRU?=
 =?utf-8?B?WFd5ekhIb1p6R08xeWNEem1Ob25CN09XZnk5MDZFSGFFODRmVGNEKzF3eFJN?=
 =?utf-8?B?WkljdzhDSnBma2oxV0RITWNXTDVpa1Q4bkFlWEtjeGQzT0F5UUtscFJHZ2di?=
 =?utf-8?B?N1Q1WVU5QU5RQUN4TUxycmtkMjJsYktNNlZLQTNQTXJCY3hWdG9OS2RXcmw1?=
 =?utf-8?B?Ty9ja2ZwdXE0RldhMUc0M1Y0SmI0UmtzRGxsWTl2SDJncFk0QjdFa2Y2U2Qw?=
 =?utf-8?B?OUQ1ckd4TnR1Mk13aGdDUWxiZmRBalE2OFNWNnR2dmFBcklXdExObmwyVnMw?=
 =?utf-8?B?YThxZE9SUGpHOHRhTGw0Zm9HYS9NaXpwRGNyMU9lYUkreDQ1TUdLZjFwUDJy?=
 =?utf-8?B?KzRjSnMyUmROUVR0bmxNS1daL3hBbENCdS9HR2RkU0FCR2I4aEc0RDArL3hC?=
 =?utf-8?B?MlR6OG1UNzZJQ2lRRlhxb3MycEplRVdmMFVjM2doQWo3bTRaMmpEZGFRTzk2?=
 =?utf-8?B?bzludThXTFB1dnlmd3NKVm1WenEvZUdCS0dRdGNEWWdhVEh4QW9JaXF2aGRU?=
 =?utf-8?B?L00wdHovUzBhSGJyaXVlaW5vUWs0TjdZSHRkN0FHZCt3dmRFL0s0M0FQbVc2?=
 =?utf-8?B?cnhXdUU5RjBtUFRQQ1RDQk5PUjF2ZTdmSXprblNrcWRBNTNOWWZsVFZRVkZO?=
 =?utf-8?B?S3NuWXdCR3lyb3JUNUwrKzJwdVdOZGU1UUdJaVdqY3QxcElFNW1sMlZLVHNy?=
 =?utf-8?B?cS9BVkVXcWV3dElMZTBzYk43RVlveFg1aTVOZW5heFJtdEdnR0hJMlZDMHVO?=
 =?utf-8?B?OE00cjFvY0txcmZacVNWdk5DRG1BSVNkcHBwNjZTR3VPL2ZCZXFBRkdRcjM2?=
 =?utf-8?B?Zkc2Z1p3VGowdXdNYVRrSHV3K3Y1UGJMSGhsdkpIQ0U1R1kyUWcxWWtPRXRC?=
 =?utf-8?B?OWdCYU9ITE9YN21HR1QycWlhSk12MWRXc003czBNbjdxK3pHQkU0VUtyclN4?=
 =?utf-8?B?clE1alBOc1BnZG8yOHVOamZNa3R1RHphM2VCNzYwcUlzcURrbXR3YXcrNnYx?=
 =?utf-8?B?WXp3WGFJWCtZQmZsQm1ZYS9RYkZLOFJvQkNvYU4yK0FoMEtzRk5FdGU3Ujc5?=
 =?utf-8?B?K0p6U3BWWVQ5Y01wWGJlZ2dQckpjRkhoSi9ZeDR6S3BxYkRJWlNHRDM5S1hB?=
 =?utf-8?B?ZlovQlA4MUFEb014b3VPNUx3SlB0RVBvOWtYbVFYNEtaaThtQjVuZmhneHdY?=
 =?utf-8?B?MFNCU0FMYmY4SzBkNjNtdU0wdHpESjZNek8xM0crZHkxNFdyejZHQ0JHZ2kw?=
 =?utf-8?B?bUVRWHF2bDFXUDZsYWZGT3cwTCswREFyMUowdTlNVnovRWNuLy9sQVJKSXlP?=
 =?utf-8?B?NENEdkFEZFhKbm1CeHBDUHV6dUw5eWtOeCthNWQ1MittNzR2T0R6ZWIzVzF6?=
 =?utf-8?B?N0NaNE9HMkcyVGVrd2FyOVByL21BUnUrdHBrbitIQVZqS0FIUnUwTVR5Uk9a?=
 =?utf-8?B?b2NEdVRZOUlmYkNqVDY3R0J5WnBJOVJ0b082R1Bnc0hKMjltQjRjU3dYdFdn?=
 =?utf-8?B?WnVrc0VoWGd6Y1FkdzFQOVp5M0l2eVRZUjdoc0Y5L2NiK1NBK1IyV1lSdXJY?=
 =?utf-8?B?dlNVUzlhRVhwVFBSZWt2cFhFZFcyNG5HS3MrMzRWRjVuWENzTWpjUT09?=
X-Exchange-RoutingPolicyChecked: jyhQoswPjLOcDTGCGRDYlwUZBR7QxWrq3p2bf7ctwsOtiEBZ7PuFtyoapaniSV2TVEX91wNVWNEIVFgd7uoouVeUEexKS5sng0+yjXwZ84VsUd5KH/KbbBn5siBmyeyn+84ELYqyUfCOuWtRJ5OW75GRGZB93TvjguLAb6UM5Z5Di7DQCrv+1yJHEqIl2wqgzNuajQRB8WJ5NZIPab9KlWySA9KjFF2dLB36v6uRgOJguxsvICY1eIbcPOP0WRf/DKFDqH/PDA/+SBpe1Rh3KVg3dr/u/GXuW8VFbYEBhGPjOyIoLTbwkUHogBJzEh86LsDmGQOcBVptRcbJ0lvivg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c51c128d-8dfb-474a-e7c5-08de96301710
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:04:02.6616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iibdQdCIXaa8OhS051+VAkCYyBgnuxd4kBFkBvY5YHA4xJJJsKcPxe1+Z4ijMfBIPqnGEc/XkfUKYJcH181vuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8534
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

Hi JP,

Overall patch LGTM. One small nit.

On 01-04-2026 12:34 am, Juha-Pekka Heikkila wrote:
> refactor to make it look more nice
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 108 ++++++++++++++++-------------
>   1 file changed, 59 insertions(+), 49 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index 029b735bd..ed8d2e48c 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -88,15 +88,6 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
>   #define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
>   #define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
>   #define NROUNDS				10
> -#define INVALID_TEST ((type == TEST_INVALID_FILTER_WITH_SCALER) \
> -		   || (type == TEST_INVALID_FILTER_WITH_PLANE) \
> -		   || (type == TEST_INVALID_PLANE_WITH_FILTER) \
> -		   || (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
> -#define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
> -		||  (type == TEST_FILTER_DOWNSCALE) \
> -		||  (type == TEST_INVALID_FILTER_WITH_SCALER) \
> -		||  (type == TEST_INVALID_FILTER_WITH_PLANE) \
> -		||  (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
>   
>   enum test_type {
>   	TEST_FILTER_BASIC,
> @@ -327,12 +318,37 @@ static int test_filter_toggle(data_t *data)
>   	return ret;
>   }
>   
> -static void test_sharpness_filter(data_t *data,  enum test_type type)
> +static bool is_invalid_test(enum test_type type)
> +{
> +	switch (type) {
> +	case TEST_INVALID_FILTER_WITH_SCALER:
> +	case TEST_INVALID_FILTER_WITH_PLANE:
> +	case TEST_INVALID_PLANE_WITH_FILTER:
> +	case TEST_INVALID_FILTER_WITH_SCALING_MODE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool needs_extra_planes(enum test_type type)
> +{
> +	switch (type) {
> +	case TEST_FILTER_UPSCALE:
> +	case TEST_FILTER_DOWNSCALE:
> +	case TEST_INVALID_FILTER_WITH_SCALER:
> +	case TEST_INVALID_FILTER_WITH_PLANE:
> +	case TEST_INVALID_FILTER_WITH_SCALING_MODE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static void test_sharpness_filter(data_t *data, enum test_type type)
>   {
>   	igt_output_t *output = data->output;
>   	drmModeModeInfo *mode = data->mode;
> -	int height = mode->hdisplay;
> -	int width =  mode->vdisplay;
>   	igt_crc_t ref_crc, crc;
>   	igt_pipe_crc_t *pipe_crc = NULL;
>   	int ret;
> @@ -343,57 +359,31 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   		      "No requested format/modifier on pipe %s\n",
>   		      igt_crtc_name(data->crtc));
>   
> -	setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
> +	setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +		 data->format, data->modifier, &data->fb[0]);
>   	igt_plane_set_fb(data->plane[0], &data->fb[0]);
>   
>   	if (type == TEST_FILTER_ROTATION) {
> -		if (igt_plane_has_rotation(data->plane[0], data->rotation))
> -			igt_plane_set_rotation(data->plane[0], data->rotation);
> -		else
> -			igt_skip("No requested rotation on pipe %s\n",
> -				 igt_crtc_name(data->crtc));
> +		igt_skip_on_f(!igt_plane_has_rotation(data->plane[0],
> +						      data->rotation),
> +			      "No requested rotation on pipe %s\n",
> +			      igt_crtc_name(data->crtc));
> +		igt_plane_set_rotation(data->plane[0], data->rotation);
>   	}
>   
>   	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
>   		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
>   
> -	if (SET_PLANES)
> +	if (needs_extra_planes(type))
>   		set_planes(data, type);
>   
>   	set_filter_strength_on_pipe(data);
>   
> -	if (!INVALID_TEST && data->filter_strength != 0)
> -		igt_debug("Sharpened image should be observed for filter strength > 0\n");
Since this in NON-CRC based test, should we keep this debug msg?
> -
>   	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
>   		ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
>   	else
>   		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>   
> -	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
> -		pipe_crc = igt_crtc_crc_new(data->crtc,
> -					    IGT_PIPE_CRC_SOURCE_AUTO);
> -		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> -	}
> -
> -	if (type == TEST_FILTER_DPMS) {
> -		kmstest_set_connector_dpms(data->drm_fd,
> -					   output->config.connector,
> -					   DRM_MODE_DPMS_OFF);
> -		kmstest_set_connector_dpms(data->drm_fd,
> -					   output->config.connector,
> -					   DRM_MODE_DPMS_ON);
> -	}
> -
> -	if (type == TEST_FILTER_SUSPEND)
> -		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> -					      SUSPEND_TEST_NONE);
> -
> -	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
> -		igt_pipe_crc_collect_crc(pipe_crc, &crc);
> -		igt_assert_crc_equal(&crc, &ref_crc);
> -	}
> -
>   	if (type == TEST_FILTER_TOGGLE)
>   		ret |= test_filter_toggle(data);
>   
> @@ -409,13 +399,33 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>   	}
>   
> -	if (INVALID_TEST)
> +	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
> +		pipe_crc = igt_crtc_crc_new(data->crtc,
> +					    IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> +
> +		if (type == TEST_FILTER_DPMS) {
> +			kmstest_set_connector_dpms(data->drm_fd,
> +						   output->config.connector,
> +						   DRM_MODE_DPMS_OFF);
> +			kmstest_set_connector_dpms(data->drm_fd,
> +						   output->config.connector,
> +						   DRM_MODE_DPMS_ON);
> +		} else {
> +			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +						      SUSPEND_TEST_NONE);
> +		}
> +
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +		igt_assert_crc_equal(&crc, &ref_crc);
> +		igt_pipe_crc_free(pipe_crc);
> +	}
> +
> +	if (is_invalid_test(type))
>   		igt_assert_eq(ret, -EINVAL);
>   	else
>   		igt_assert_eq(ret, 0);
>   
> -	/* clean-up */
> -	igt_pipe_crc_free(pipe_crc);
>   	cleanup(data);
>   }
>   
