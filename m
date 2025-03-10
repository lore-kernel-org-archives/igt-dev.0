Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4B8C28B28
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 03:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B77D10E396;
	Mon, 10 Mar 2025 03:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gyGW5EUX";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0DB10E396
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 03:07:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chYNhcEMMfg+Pf4yhCXTkpybom+aC/jyG4PVYNboxmA7VSrQuz3lbHSDd/qNAE12iz/vrqNOg5b7ZvGJE5jsi352lou0rhqyMcDqDC00WD9wKHwCYWl5Y2fMhO3aUCWq2FlzMnO5ymttYtL6r8OgIQKp63SLMBpt+yK9Ra0mOHQpV+xewjEpx27c3yUwytgNzZLq6YrlW0r2dG/5rVW1kQChq3auEbg+xiN5AFp4Wu/jFcTpnb/5wlIpXGaTYN0LkDBx1UpMA3jC2k64ysfCzKbqfQ/s2gLJxOpRQvLv1wT1IVrk/Lls/+yH3JFNiOs405ZYR8xw6LEXHDd43nevHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onl7oTD6ngI1rv6rYcue38WeJ6JSH9Xet+AR/vrJ6VI=;
 b=vtAjVCaoo78xc7cY1H1z1RvVYAgHJJKbbEc+GtT71fEDi4XjCI52eSF4sbZEg2COTYr8h6OS3TgC9qka7L0WomTmiR3q5PTWD5zcAFRb0qGPU2VPJNs5DVAfY/M7z+Llb6o7TNi0GcKpAreAtWg5YVdgKiS6xrnSIz92kgFIeKpZNVF+kktpxMBSh56StrMxNub5CsqEoKgjGc8IjH26WTrR13zb1+UgEHff21uIONrWTfRhPcQwsaNvTpYTe1Mo0tMqSCTGTFc5XkTTenjnsIwK+CJM4so4KlnTgef6GhQ6WAKbimgtTBHFZg6ptTjI0USJQ0FTEd8BReDUYVwqng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onl7oTD6ngI1rv6rYcue38WeJ6JSH9Xet+AR/vrJ6VI=;
 b=gyGW5EUXDLQ5WEivEeE5mX2XUM8oYiruewS3d2V2/txyYZtngQ8BoMY3F7OnJqxh8HOTQVBZzGGWno8mKqHp2bA+jn0H9f2Dcatc5+gQPgwKEIxLlZP/ZCWajGD/7UBDR95tfLI03CA/LryYUyOeiucT2fv/0plQSBUo+j1gono=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MW6PR12MB8662.namprd12.prod.outlook.com (2603:10b6:303:243::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 03:07:47 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 03:07:47 +0000
Message-ID: <0ed20d8c-532f-43f2-ac16-82866b641670@amd.com>
Date: Sun, 9 Mar 2025 23:07:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 i-g-t 3/3] scripts/run-tests.sh: Add support to
 kmemleak and igt_facts
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
 <20250307093426.90479-4-peter.senna@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250307093426.90479-4-peter.senna@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::19) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MW6PR12MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: e3414984-bae5-4c48-abca-08dd5f80bc48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2FxSi8xb2ZvcTlnVVphNXN0UWxGYS8wSlUxc1lna3pRYnJjZkFJSmZKQXlT?=
 =?utf-8?B?ZUJSNGYxdlAzTnZRbjRoM1RCSTQzT2xSUEtEZVhnRnh2Y25tM09oV3JJZjVi?=
 =?utf-8?B?b3l3UHNPY0crMHZHVC91NUNXYkRBdVM5TFhCT3ZFTzViOFpKUkxhMVVWcmxh?=
 =?utf-8?B?dFZCWWJjMHZQSm11azNmRmZvQitaOHJpT1Zoa1NRNFd1bEdRR3ZST0s2MGNj?=
 =?utf-8?B?SXVuMmhMc2Vna2NKOUl3VEEza0VseG93cmhBdGVNcEhLeUUvMlFqbVJ5OWZS?=
 =?utf-8?B?M3FEWUxIbWczbVN2ekQ4YUI4ZjVlSzdtYytSWm9VMGF1amdCeTdsR21UZlpJ?=
 =?utf-8?B?SjEzWkhWcTNyVmtDZUcvVVFieXdzc09STSs1MGlMUEc1Nko3cWRTc0s4bXI3?=
 =?utf-8?B?NDR4b09BajlGbGtRWkhGU2o1SU84dWZkRW1HOHUxa3k2TVU0TU00dVcxMUh5?=
 =?utf-8?B?eFhMUUhqd0E5NUZpNEhoK0plWm9nTE9rU2ZNcG9jak8rbUpEejc3T3VoUElY?=
 =?utf-8?B?Ym1OUER0bXY2amF4MStnMERqbG92MWEyZzVWTnV2em52SUFxcTlreEs3dGZU?=
 =?utf-8?B?aytvWFhvaEV4cy9SaVEwTlZZd1FWb0k4NVRRZ0pGZTVKWTVxem54Y1QrWXBE?=
 =?utf-8?B?ckJxK2N2MTc1dG94TEV0c0xQNVdZeU5EbGVOc3hoLzgyVzZxZ2dkMG9KbUt3?=
 =?utf-8?B?aXhjT3FpMkZzRkFxMXUvbkpUbVF0cTJxaEFUck5SMUFnK2oxWDJGY1ZKcE13?=
 =?utf-8?B?YmR1TWJleVlqTUtNZGczNDdFQjMxN3NGL0l2VnFRVGR2Q2dIVDh2N09HMmpz?=
 =?utf-8?B?MFN5YXRxa01OMmU4TjEvem0xVEg1V2hRTDhja0ZFdEoyT2xNbEw5cm1ZS2l3?=
 =?utf-8?B?VXNNcWhBNlZZV1JQcm44RWVXT0FoL0ZBSUQ0WFByNXBXOFhZUW1PS1FYMFI1?=
 =?utf-8?B?alljdllrMU1qRkduakVTL3BxUVNRSHdIOExSUTIxeTU2ajI1SUJzSVRTcUlk?=
 =?utf-8?B?TFpFckVnejltTi9VaWdwOElMUkt3bk5Ibjl3SFp6MU1OR3dyYlJUM0laUEp6?=
 =?utf-8?B?b2pYNXF4amd1aWFBTlREbmtiNnhNb1F0MG5IR3BrZVN2UkJNUE1TLzNMdmRp?=
 =?utf-8?B?d1VPWWxQWlpPWEl0V1VNTkVJTnkybVBmZm5kUG1CN3k3TjVXVldyaExKV0Yw?=
 =?utf-8?B?MTVjSURiRGh3cU4rV1JMOEsxZnRBdXVLeG1ZQU4wVXhRVGRUbVB6Tm43NTJt?=
 =?utf-8?B?c1g2MHVHb09TOFQ2L2tsalREVEdqNTN6RTQ3czR5aHgzUXhVTEVYVHpiQ0Nl?=
 =?utf-8?B?cFQycFUyQmtuTjdXSCtVSTdndmxnc1lOcDhEd0gyN1Flb0xBWVh4cW9QVXR0?=
 =?utf-8?B?NU16NUlCVThjMEJqZkhwcEdCN3NXRHlJZ0liRmlna1dBS21wRFpCSk5qSEU2?=
 =?utf-8?B?NGc2dXJ1aXNXNS9GRkFiRmk2Vk1BQUIxa3lrWWJjWE9PcmJrQlYxeFh4UVBn?=
 =?utf-8?B?bXg1YkdtZDR5RFhQZmhOMi8vVThwNWlRcHlpNmdXeHhteXBUVzNTZWJiQmN2?=
 =?utf-8?B?ajNYUWVaZFE0OHcvOHdzSE5rNm9tdlNaNG03VnNvWGlTU3JBamdRUitldGsv?=
 =?utf-8?B?YWxKNDQ1clJoZG16bi90WmVodEFEUEUyM1BMT2JrRkVkYWduSXdDT3M5dEdL?=
 =?utf-8?B?Q1cwRWwzdldtd3JYejlJeUFwUFg1bERuM0luRDM2TjlCVkxKMG94SXZEL1py?=
 =?utf-8?B?aWpIVE0rZHBVa3djcHZYaG5iTXFNTmMzVm81T2tNR0xIY0dJTEV5OSt6L3hD?=
 =?utf-8?B?MXRIMTR3Vis4ZjdGYVUzWlNmOHdrQXhCMlFrdGVBRzVOSHI5V1dEbDEzT09z?=
 =?utf-8?Q?ILGbp8MhMhQ3k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djR0N2p0WG1JR1pqOHRSWTdjdjRycndDblRGZ1hQbmt6aDJhZFhWV2l2R1l2?=
 =?utf-8?B?Z2xXSjVhSWY1OTVtUHFGRUExWGg3WG9td0RGbWZIZ3Urc0NzamR1bG9LUUhQ?=
 =?utf-8?B?cTcwNjVFbUF4ZTFId0p0eUEvdzk1MzlSYjVrc1hudnc2bnFKS0tXbXpySCt1?=
 =?utf-8?B?ZjBBUXNNcVkyZmRpSGMrV2wzQ0lwaGxWVVRpUFFpdnZ5YWhRNzB0V1ZxSXFn?=
 =?utf-8?B?aC9RMGVtc2JCN1FDTzhNN3BYUUFKTTU5bHplVGRIQ0FDUzVza1ZpT3FtdktM?=
 =?utf-8?B?NkpNTithenJZb0JlUW1ibTlMNVRFMkJ3VUZZT2NUL1VBcHFYaW5wdXBHeHpC?=
 =?utf-8?B?WGVzWm02SDkycGY4ZXVvcU4rQ0RKZTlhV2lmN2FMVDhmVCtFQ2l1K3QwdlV5?=
 =?utf-8?B?amxPVno1ekRXOHYxdExFRWg0UWpQYWh3aVIvc1VRSnhVZnNFcDBpM29sbUwz?=
 =?utf-8?B?VlZvNCtCeEU3d2hOWWlZeGZZUHN1NXc0OWJTanMzTWlxTDZLMTdpWnNpTTBR?=
 =?utf-8?B?WFVkaUJtNURUdm1XUW95UFJCTkJLVVB0d3orY0hvZkQrRDg5TFhTQkdhbXBB?=
 =?utf-8?B?NDdNVStYNmFrWlduN0NJWTd3ZE5OM2hEQ2pjSkRpaEVEVndzcDVKRU9zS3hG?=
 =?utf-8?B?UkFrN1BtNnhYTVNvaktPUWZNdFQ4T0VsSEJEbmJMRnR1UHdvQnVjNHdJT2xk?=
 =?utf-8?B?b3VUdzVKRDhyTTZsK0Y1c1ZvYlV6QW9YOHVOanJLTVBscWdzQ2xaSVRuTTh4?=
 =?utf-8?B?RjVCUkFpSW1wNVByT2podC9QTkxvYW81azkyUHgzRnB4bEFaeXJLM0IyOXpa?=
 =?utf-8?B?a1JEZ3JtTDNpeXBISjlMM1ZnaC9jQ25MTmlzYzFHK2hDNlNmYmR5NEhTUzFm?=
 =?utf-8?B?bWxvQUZYZW9MaEZJMkdjOG15U2xoVjBkK3BXcnVPc3Z5UkR6K2pvNm9MMldk?=
 =?utf-8?B?SUNBN1RUODdWYlZoWVM3SW9rTmErNktielZOLy9hU3RjcXA1SUR0Z21UT09Y?=
 =?utf-8?B?VjBPSkkzTUhzTzFaUEEyMzI1SW45ZnljOVkzYUV4SmloQVkwL2xHdU1iUko1?=
 =?utf-8?B?enA2c09uMWhhRENwaHdKeHJXemNRNXgycTNJM0dqNjdad0pnalQ4VGdLUlpi?=
 =?utf-8?B?UVF6S1N6dmpTdnptTy8zOWRYWFB1amxpbk56YWY4NFFnR2ZIUWtGT3ZTb0lh?=
 =?utf-8?B?ZkZjNWpUdW5HZEthNXlsOHQ2RmMwbWFvMURGeG9FRHZ4K3lpT3p5N1ladVJ1?=
 =?utf-8?B?VDZORGREVVFEbTRyK2FoZmZYZXljdmFSczMxWlBKemttRkVZcFdPalhhSTBv?=
 =?utf-8?B?RXZvdldHdGFtajlGZGQ0VkY0ZWhXdkNMZm1WMGdwcWRqZVVWWmlNS2xrNUVS?=
 =?utf-8?B?ZjlxV0l6WG4rZVF6RlUveExCNythSCt4SVkrQUgzWTk5dXdteEZqTkZxL3dD?=
 =?utf-8?B?U1o5Z21Wb05LL0NuVkZFa1VpRVJPNFNHb1E2TEhpV3NPdmc2d1ZGUVh5WmVm?=
 =?utf-8?B?enIwWkRxTERIRzVsQUxIZ2orQUwxUDM5WDBTYjdkTXhUQy9rT2JLVVlJeWYy?=
 =?utf-8?B?bnVyUHR0THduUnlmcUM2TXZ2Y3ZDY0NqSCs5NVoyc1pFU3FGY24xSHY1bVQ4?=
 =?utf-8?B?c2VJSGdMRTNLNzU1aTFZcW8xY010YStNNEVCWlNOc0J1akVmSHYyRnRlSkE3?=
 =?utf-8?B?Z1phOHowb3E5TmNBRVJhVmc5S2tYckg1dWxZK3BadHJGTjFMN1F4aVExZEVF?=
 =?utf-8?B?RjdhM2t5cjh2cFlYSzJqYmd6M0xva2FRSHd2bHU0TjRiQzEzNEoyQzhGMlVr?=
 =?utf-8?B?YkhOVHF1aVpSSDAzRjUrV0RiQk1QR1VzRmNOSDI3eU1vWGIwTjFydUluNG54?=
 =?utf-8?B?Wkk1eWcwSHEzNkVuUVhIeFc5RFVFK21rS0pHN05Rd3hOcFR3QXJwdW9IRkwz?=
 =?utf-8?B?VWJXcDI0MWtybUtKblhHeHFSUUhGdVQ3TDZHR2RhTURMWlpZRnpNRzllU3I2?=
 =?utf-8?B?cTA3Q29NOGxmWk9PNHN2bEp6WjlHOFZRMkFVZTkzY2NnQ0xDMVpaNUVObTJa?=
 =?utf-8?B?YkE1bDUyN3lTT2tEZlJIZ0hJL0thUXlPMkRvdlBqZThHQ3BHZ0NlWGsyRWEr?=
 =?utf-8?Q?Menlb3cflmLj30dcC12fTGBYY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3414984-bae5-4c48-abca-08dd5f80bc48
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 03:07:47.7949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1yW9TAWxc9drEunNnJE9+OlOf3Ji61cabi0hk/f+PjtciCBHJfxjOSQZLxj+Dwz64qi6iZBXdG9/Z1VgZBhfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8662
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

Hi Peter,

Version 8 of your three patches looks good to me. However, I haven't tested them locally.
Let me know if you’d like us to run them locally ( not CI)

Thanks for the improvements!

Vitaly

On 2025-03-07 04:34, Peter Senna Tschudin wrote:
> Updates scripts/run-tests.sh to include the following options:
>
>  -f:        enable igt_facts on igt_runner
>  -K <mode>: Linux Kernel kmemleak reports
>             - once: run a kmemleak scan after all tests
>             - each: run a kmemleak scan after each test
>
> These options are simply relayed to igt_runner.
>
> Cc: vitaly.prosyak@amd.com
> Cc: christian.koenig@amd.com
> Cc: alexander.deucher@amd.com
> Cc: jesse.zhang@amd.com
> Cc: harry.wentland@amd.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: ryszard.knop@intel.com
> Cc: lucas.demarchi@intel.com
> Cc: katarzyna.piecielska@intel.com
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  scripts/run-tests.sh | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
> index 082ebaa5a..1fb9be478 100755
> --- a/scripts/run-tests.sh
> +++ b/scripts/run-tests.sh
> @@ -132,9 +132,13 @@ print_help() {
>  	echo "  -P              store code coverage results per each test. Should be"
>  	echo "                  used together with -k option"
>  	echo "  -d              download Piglit to $ROOT/piglit"
> +	echo "  -f              enable igt_facts on igt_runner"
>  	echo "  -h              display this help message"
>  	echo "  -k <kernel_dir> Linux Kernel source code directory used to generate code"
>  	echo "                  coverage builds."
> +	echo "  -K <mode>       Linux Kernel kmemleak reports"
> +	echo "                   - once: run a kmemleak scan after all tests"
> +	echo "                   - each: run a kmemleak scan after each test"
>  	echo "  -l              list all available tests"
>  	echo "  -r <directory>  store the results in directory"
>  	echo "                  (default: $RESULTS)"
> @@ -160,12 +164,14 @@ print_help() {
>  	echo "Useful patterns for test filtering are described in the API documentation."
>  }
>  
> -while getopts ":c:dhk:lPr:st:T:vx:Rnpb:m:" opt; do
> +while getopts ":c:dfhk:K:lPr:st:T:vx:Rnpb:m:" opt; do
>  	case $opt in
>  		c) COV_ARGS="$COV_ARGS --collect-code-cov --collect-script $OPTARG " ;;
>  		d) download_piglit; exit ;;
> +		f) IGT_FACTS="-f" ;;
>  		h) print_help; exit ;;
>  		k) IGT_KERNEL_TREE="$OPTARG" ;;
> +		K) KMEMLEAK="--kmemleak=$OPTARG" ;;
>  		l) LIST_TESTS="true" ;;
>  		P) COV_ARGS="$COV_ARGS --coverage-per-test"; COV_PER_TEST=1 ;;
>  		r) RESULTS="$OPTARG" ;;
> @@ -256,7 +262,7 @@ if [ "x$RESUME_RUN" != "x" ]; then
>  	execute_runner 1 $RESUME $RESUME_ARGS $COV_ARGS "$RESULTS"
>  else
>  	mkdir -p "$RESULTS"
> -	execute_runner 1 $RUNNER $RUN_ARGS -o -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER --prune-mode $PRUNE_MODE
> +	execute_runner 1 $RUNNER $RUN_ARGS -o $IGT_FACTS $KMEMLEAK -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER --prune-mode $PRUNE_MODE
>  fi
>  
>  if [ "$SUMMARY" = "html" ]; then
