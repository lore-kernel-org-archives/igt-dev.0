Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10370CD37AC
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 03:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A3B10E2DB;
	Wed, 13 May 2026 03:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nzwgqk1Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE0F10E2DB
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 03:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778641730; x=1810177730;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NmZ9m1iAgnPJg6hP94CImXLY/8pOd9RCWwG4PjxbEqg=;
 b=Nzwgqk1Z5yBc5itxwAOzhn8Qp2qfKgxAWhvpP1rw63lFgUCRBxYCmdL/
 zdAOD5cp3885so4uWeCF8k9kcMMvSHknfeM8PlRhHQsLHFxMI7cPe2RX1
 f/WnNqJJRNQd+kNyYl0q1MLmCIA+Dlrv8Gptx/9PYdn/t09V8GMHewtFc
 CwYSGx2n/SYiRz6sCgbwM5l+CcF8h9FTy0i7o8GgLQk/RZtEABtTpgzP0
 8WLa521UVzUiCumNOnzecFsjaNRIYI9eV7toZj1hL1V1pZHaTNdiHKg2m
 P7bhyc3LU55syLJBH1FeUdd+kDS4fVmH9/U928xFPhLQWqw0Hl+szw5ih w==;
X-CSE-ConnectionGUID: jmrY219qTiaoCmAgRKOeHQ==
X-CSE-MsgGUID: DGcoBsukTAS6I+TZ7xnUng==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79513815"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79513815"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 20:08:49 -0700
X-CSE-ConnectionGUID: XZPQPKvjRt+q4kXbJTVWoA==
X-CSE-MsgGUID: hkLofeniRjibP2tKz1cHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="237103376"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 20:08:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 20:08:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 20:08:48 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 20:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjwYBS9jjCF23qVJT7oYQK7C7ixg2au7QFS9UAglZg1CixeqGe0Pedtwn3LqErHWRQa0/20P5XR4Sx/9HaWgQgdfkW8t9LtTsBxG0Rsydk/7jcL2ZZLEwH8C5RombNSpyE6PkdQdt5cc6G1yY6qVnHuwSSoLFHNnUYVOcEk0w/qN69W6VC5TLCmAQ6jciqa9kvmDqWWpVnZWbWy9WQ0n3QgKJa1j5aliiW76vGLGE1UnU0mgveFvuf6xlh2PaA2TK7S6Yl2qWiFF8LuHYUJ/pKHy7KWQnsI7bEaTNd7Gc6FXpYgmyIPhfzvaWCU4pa01kducZEl94IK2uROF4VfFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMfDbNT71ODM3QnuZFK27NnuDHivRJd9w4qWjIGObm4=;
 b=bYfXG1Qfui//2Nujx1AJDx3UqnsuFuojeYivOieUMDOdGudApWmJqB6WxWfqCSJPHbXeazrdZB30MSBIlu8WgzmClrxwyQvYo0OVFT7CEnVXXIYvwT/KPtRO/DqPi6xncsPtiQPakdq/v6ng920xYXZEjWDjGeQ8WgVgg/CFOjVvwIPmVzGjotDF1/SKWH7qTvMMfShSk1MBqcOJFWm5Bu9eLkA4xxbKJEeXHjDaNcegjgllY6cvZs/0RTFBp8kM6aC2kd2AJ0Rneh8SaExg8FUWHkHvD2wXctcHMSoXtKesv3yEkU5FDNkyhKcogqHC0bIpxlqPnT7XPAlMhPBVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS4PPF641CF4859.namprd11.prod.outlook.com (2603:10b6:f:fc02::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 03:08:44 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 03:08:44 +0000
Message-ID: <4bb85e06-d16a-4a54-bb7b-2e190a2c21f4@intel.com>
Date: Wed, 13 May 2026 08:38:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel/kms_pm_backlight: Add
 brightness-with-suspend subtest
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <suraj.kandpal@intel.com>, <swati2.sharma@intel.com>
References: <20260512112019.676242-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260512112019.676242-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0197.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS4PPF641CF4859:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd8902b-bcf5-4616-a384-08deb09cf0c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|376014|56012099003|22082099003|18002099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: AbRDAKyu4rse+Fo4JASAKoU4IYjogT+IAVWAQsVA0G0EFSJuw6PbXFkyvQovB7An4MvvXX79PamE0q9eScpC2Oh7ivfXLmWKZLloFktPi/hExNEx0JzPKNhqlv9N6Y3N24m9xntkv39NSvlmHkSGvLsQezJkccQt6fM/X+UgMB4zb3CCb8BY7q0iH1JIaOEWjKv6ZH1nFLwUWH1rAKiBIpftkZkkC78B8U3t5U64JCrC0J7agpsbsLBUmFY+LYCMdtO5gXlV/otdmU2FbOEdmlmGK3AkqK9n2aNJmBpn/dch0fjh9zxlDV2+l4WQ/raqdfSpnvAUoHsF02ZTIzRAaG5Yy64i5VAfl4l/qyseByw4zRZTsBA8ODO6xWdc1bE7IT++uv2uWymSNgSkLKpCJ7PK5gw/GrdQRe5OfVEC7Pr2jUsSGToLisGw3ScrtCfUyCVabOQHeXwFSuCCiPQzPE64mSw10vh1FFX6sd+t5CgzrUGGbkwABAHgLBhpDOfqo2B2Wo9C/r9aSkMlWwtUeiK7GjijQ4YcEfraKKfNT1aLmy9GbYxybDYKwoq0pGqwpgydktf/avsGs5THcI7zhW4irXUktZbaX84w+vpHVw1LkKRAMxoErFg6M6lAdpKD+D4hYhMSc87pkb+ODePFt4iZHjFy6RSFFKqBX+POzlW+UM1Hq+kAaLwt3A9jXp7g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(56012099003)(22082099003)(18002099003)(11063799003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3FlYjdrTjBsQnFwbFVXOTRyMi9RL1VHWWpjZDRPUmUzZ3RUcmdPUkU4OUFW?=
 =?utf-8?B?dWJwYWVLYWhKSE5NVUQvdE1NRVZTV0NON1dzMVo0SmU0RVhDQU03b2pBY2FZ?=
 =?utf-8?B?RkZhNkkyUWR5bVlHeWg0dDZZZ3VWM291WXYyNHd1b0hNR1NSR29sb3cvNnJ1?=
 =?utf-8?B?RFo2YktaV0xjTXlUVm9xM2JIeDVNZTdBaE9naFh4WXJoV1lQUmk5d3RqaXRD?=
 =?utf-8?B?bkZFU0FqU0tNTnk2SXNvTno1M2FRQVJSdlZ3b2JlQ21xeHcvNThud2ZJRnBH?=
 =?utf-8?B?QmcrSWo0WWVhcVJBa242ajdKQ3I0ZmxVRGVDek44RXZEZThPMmNuem1JSWp3?=
 =?utf-8?B?NG1OMG5WY1hPYnNqYkVpSkE2a25wTkRJb01XU2hWRm44RWorejgzaFlUTnF3?=
 =?utf-8?B?RUVXTXJML2dYeXRDM3YzWU0zMXFsd1QrYWswU0hkemYyQ0h3SmwxSGN5aGhz?=
 =?utf-8?B?SFE0ZFpJRnZlakFsMlpxQW92TUFJd2dqTGlaTUFxdGREYVJEampHMURGem1H?=
 =?utf-8?B?c2NlTnA4bjRjV3M1N0J0WVN3dFZlTnlWSjRmMkxNeGgrZUljRFN4NjR6Vmlx?=
 =?utf-8?B?bmswd3JWbVc0SkRYd3N6V2tiNkdNdXlZMkduZy9jMG1OWmVDdmRZa1RHS2gx?=
 =?utf-8?B?cFZTczYrUVd3bHNmU211YWZnRm5zMHJ4NFhtZGI0blVwT1E2ZEQxSDFObWtV?=
 =?utf-8?B?a2MwUk5SQ0JqdHU4TnZmM2ZCaDRmZllZOFdvMjBuZEx3Z2xDQ3Rka1FFUmlj?=
 =?utf-8?B?cWtLTFl1elhGZ2p1elhHOVhMOHBScHJleFg0UTM5MXRpMm42YkZ6MEN5dVl5?=
 =?utf-8?B?bEtJaVBFU1dGcjRjUnd4UDF3TlA3K1YzdGgyQW9ZZ3BLcW00ZE1sYjlvTmY1?=
 =?utf-8?B?NHhtK29rSEVoZ3ZFZHVPTDBuVDd0TzFvZDN2MWVBU1RORExHdjB4V0I3dFB3?=
 =?utf-8?B?aXRDWGtuY0s2bk95REpYaGQrTEpTR25haXRwRFRzVThzUlovWDlnc0I1TDhz?=
 =?utf-8?B?TjJwaTI2VGlTcFdVZHYvNXhsU1M1dExGaEZDSXFNZm1pS2dKeVpHMEg4RjFB?=
 =?utf-8?B?ckdQT3Q4YnF5UmpxVHprNkl3bm9LR2xNU2xJSEJSU0RHdnlhS3hFN0lXZkdF?=
 =?utf-8?B?NStVRDJyc3J0YUNSbmJXWjlQSnpWZmJRMWx5RUt0UENoUjh4dW1XejFTTTRS?=
 =?utf-8?B?dWhnaVFEd3E5c1U1K0tyT2dFY3piK0RUQkZleWF4dUY0U3lGc1Q0ZWxxeVYz?=
 =?utf-8?B?YjFQRytoUTB0aWVFREJLbUpYZ09nb1FHRVp5alk0TnA2MjJnMzJqQ2lzcUpk?=
 =?utf-8?B?RllsYjNKRDlNRlp2U08vemVId08yVGZjTktYTEhFb0toUXIvVTZ3blRuKytJ?=
 =?utf-8?B?VVFsNEw2SVJab2RIck5JS092TWtXLzJzeG5SdFNnaXJMZFc0S0s5SkxEbFB2?=
 =?utf-8?B?dWRMOVV2OGd3M09MaE5ZWjIySXcycSsvbGVXa1hMZktSYzBWY05maTd3bnFq?=
 =?utf-8?B?b2FCNHlZL2l1Njh5Q0txR3Rmdi9nd2ZOdU9ObzdLVzZISkhBUGUvdmoxTG1l?=
 =?utf-8?B?S29UTitWYitaVjNFcHdoMGl2SkIxQlQwWTdEV3JUOHlwRGpocGcxSHREMTJy?=
 =?utf-8?B?QVpTcjVqbXlKY1d1WTJ5ek5MTkFSeG55SFJTNnBLVFpaKzdJUXI1cXZ5aG4y?=
 =?utf-8?B?WFp4T1VJdForSFQ0d2pWTTVzcTBybElFejBkZ0FIek5tbXdBRDFCQXl1ZG84?=
 =?utf-8?B?VWw3V01HQUE0eXlwMG1yRCtDZCtCTExCVzRIUGJKNmo5aWQwSFdlQTFZaGRQ?=
 =?utf-8?B?K3ZzWk90eXdhZWFNeTN1bG41MHNNa01xYXN5dUNJZHhpajRQNE05dEpmZm8v?=
 =?utf-8?B?ZFBCcndxeVV3a1Z4WXBZNUY3SEorcDJ3bUozRDVYOFBQaHZ0OG1Jdy85bXdP?=
 =?utf-8?B?OWFERGR5NmhUb3YrVG00bERqN3lPY0RRRXZ3eXFUdEI5SDR4dTV1SjFpUDkx?=
 =?utf-8?B?UGxlK05CQnFOdWNMMjQrWGxNWkV0NU5SNzNLdUtrbm15RmgyNHBJQVlNaU1x?=
 =?utf-8?B?MkJPYVVEK0l5cWtRYjNZdEJCUXdPdVJsUUlUYnF5T3VlbUx5ZDlreElRUWM0?=
 =?utf-8?B?QXZacDlSTVRLbTMzOVptUm5rSUpFZTMxOUs1ZTdIVjUvbVlpekNxV3ovTjdU?=
 =?utf-8?B?UFlSOU43UnQycXp2SFp0RUVKamhiS2NnSVJTUTFPcEpNL1FEOTEyMzFGckx3?=
 =?utf-8?B?UFplcENab3M3QWpPdW43b1RTaUpRNVdKR0U5Q3dkNFdGcFhiSm40bW5RM04y?=
 =?utf-8?B?WXA3Z1ZUN3JEcUk2SzdiblZodnpIOCs2bjZ6ZTZTa0svUmlGbjh6UT09?=
X-Exchange-RoutingPolicyChecked: BrhuAnCMfNV+5Vg+9Y9uH+Au8pUjiqGwRrzY+HWNQCFpa4pFyj8uGlXqOoYzaPYvJbCiiWTbxiVhlv6kQj+zgShWZg2ILpTI0LxCyKGCddL5ZtynIAIAiNniWrLeAI1RkFV8zeFRrd8CvYCBiDbEVseXSVwJUv3uxHYj/+UxNl7MjK9CGng12L01/aGf3ewrmK9rFKDMyZMYF16gmD99MUy9oONRG2+fhvGd/UE5tOmsc1QITCl64gAjoiTCsat+MVSv2/JOELP7EJUK6GjW1He3yX2Bs/KjIScSAHcmhbJl10XtPtO+JTdzSO2mUJTuF6aRRs7SjOz0gyDTMel6VA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd8902b-bcf5-4616-a384-08deb09cf0c1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 03:08:43.7762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEom/vxHpO5L91VgYDJFys+Jd8h6nsU456j+E6xO2M6B0KAzbirK1uKbkfpjXEI5B8XQnxF2kPQ4Z2FbIvwkMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF641CF4859
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

Hi Santhosh,

On 5/12/2026 4:50 PM, Santhosh Reddy Guddati wrote:
> Verify backlight brightness is preserved after suspend resume cycle,
> The test sets backlight to  a value , suspend the system and checks the
> brightness value is preserved after resume.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_pm_backlight.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 58c0b4427..c2228986e 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -65,6 +65,9 @@
>    *
>    * SUBTEST: brightness-with-dpms
>    * Description: test brightness with dpms on and off cycle.
> + *
> + * SUBTEST: brightness-with-suspend
> + * Description: Test that brightness set before suspend is preserved after resume.
>    */
>   
>   enum {
> @@ -72,6 +75,7 @@ enum {
>   	TEST_DPMS,
>   	TEST_DPMS_CYCLE,
>   	TEST_SUSPEND,
> +	TEST_SUSPEND_CYCLE,
This enum is unused, can we use TEST_NONE if we need a default enum?
>   };
>   
>   #define TOLERANCE 5 /* percent */
> @@ -188,6 +192,8 @@ static void check_dpms_cycle(igt_backlight_context_t *context)
>   {
>   	int max, val_1, val_2;
>   
> +	printf("Toggling DPMS...\n");
> +

Please remove this stray print as this is unrelated to the new test 
being added.

Regards,
Karthik.B.S
>   	igt_backlight_read(&max, "max_brightness", context);
>   	igt_assert(max);
>   
> @@ -206,6 +212,24 @@ check_suspend(igt_output_t *output)
>   	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
>   }
>   
> +static void check_suspend_cycle(igt_backlight_context_t *context)
> +{
> +	int max, val1, val2;
> +
> +	igt_backlight_read(&max, "max_brightness", context);
> +	igt_assert(max);
> +
> +	igt_backlight_write(max / 2, "brightness", context);
> +	igt_backlight_read(&val1, "actual_brightness", context);
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +	igt_backlight_read(&val2, "actual_brightness", context);
> +	igt_assert_f(val2 == val1,
> +		     "actual_brightness after resume [%d] does not match value before suspend [%d]\n",
> +		     val2, val1);
> +}
> +
>   static void test_cleanup(igt_display_t *display, igt_backlight_context_t *context)
>   {
>   	igt_output_t *output = context->output;
> @@ -273,6 +297,8 @@ int igt_main()
>   		{ "brightness-with-dpms", "test brightness with dpms on and off cycle.",
>   		   check_dpms_cycle, TEST_DPMS_CYCLE},
>   		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
> +		{ "brightness-with-suspend", "test brightness is preserved after suspend/resume.",
> +		   check_suspend_cycle, TEST_SUSPEND_CYCLE },
>   	};
>   
>   	igt_fixture() {
