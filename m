Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9001C5AC7C
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 08:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4026C10F3BB;
	Fri,  7 Aug 2026 08:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eu18b6An";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677E410F3BB
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786089646; x=1817625646;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vzZMMsP3ntqPRb/RncI9zGP0UYVF0hGhriRABnMhmbk=;
 b=Eu18b6AnT/S0cOB0uvfZhzZ6lrPSR6Ri7k99a3thAn2dsS5f/V8kMEX5
 yKiuINEP7pFFO+9a3VZkTwoQpYZWSK0fU44ILh9XixbWPiMGcziKgBvF3
 7Qmpm3gyL6vuyUqwnGWx388qcw13eZsyZUV0qk4+/m4tgJd51VFudDdFU
 1CMYQcERcj2HYUFopomqKzDuqIHr/giwJq+1E7D85oK1RjBuf4HG3q1vc
 c3yzzEOV7eCmJv+/OfRjt0l9gYcOU4SISd9mtHINA3NJIBOq3q+AV9Jjz
 WDn4YYFssmxHhwj3lpBk6eY5CrBy6XEop34MNh60w8wfwmh90rM6eAqDB w==;
X-CSE-ConnectionGUID: ZqsW24/LQNWBoWQtWlH2pQ==
X-CSE-MsgGUID: gvoCKJbfSUaUJF8QxeE/eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97848694"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="97848694"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 01:00:45 -0700
X-CSE-ConnectionGUID: Kx5oYa4xQXqUAcfIyILgVQ==
X-CSE-MsgGUID: gkjVhikaR/eW3/zK3AgDxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="265813052"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 01:00:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 01:00:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 01:00:44 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 01:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnIqNoIanmSvq+lSIs7lyNb/HCJmealqHva0jbPAYLqGZ8jXMv/c2LmM8c4LOQYuR8fDVpbafKllfJp9Ge2umJYlq1NpTaEGkzc/oNUKiAmQuCXnjE1J/B0LYiz3Gb/ZnxSKzP1+3rCWQlcbRf24oXafBRU7yoR4ZWw+FLgaP0rzoPBf/hgnbrJHn9Btg2HUVnmbbxkP1G260ARJtbu8+8zt619IfEnc2+1HcYuFhcfiPw0UsEZvsOL4JQ4/VeUn66Dcxd6KKrhgZxQLXGf2gfoUWe8sKJZoINnV2dwDq8mQNp1RwE5WL6jf80o/Z285R80KS/6r+juR4wvSfpQRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2O0+b3SfZWzcMtH4BfHHfjRoXyX9ZxY/mHiNO2QOJo=;
 b=yEetqym+npbSRxN6kodS2eYcT4buYA8NKxMvNKpIqrnvlxdG8UyjIikOYgiQM7TH1T4jJ52fhjQUsUlDuWgXOVnAuziphiMiUGheVK7Pgwd0WlDhZ1B1lBxlVBsIQmkKc8nTRoEogq40pKnmfoQ9hcjZqTJ7TFZWkdqatGmMisRPIkBilMgYPB1shOFc4ULXNt11N/gG7TRzF3G4bg/MgngGbmP1jLVArQlqvwmKgm0aFqX1t1d+aWjVSX5UTe61YLLpMMN4JS1jkNeVCSe24vQCQzadFUcOWjOLa66N/wmIcgisL6Ht5XvnBtnSZCpo815EeVzKygtri7vC2XqICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 08:00:41 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 08:00:40 +0000
Message-ID: <478bee66-0b21-437a-bf2c-d35e1f057082@intel.com>
Date: Fri, 7 Aug 2026 13:30:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: skip tiling tests on xe nvl
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260806222230.42508-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260806222230.42508-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0031.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b026c8d-b6d6-4023-f56c-08def459f8e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|42112799006|376014|18002099003|22082099003|10067099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Db4dUK7OLrOTmW/PJFJJmT9/0bsZfHNmlWQuhNchoHRIfsRbiHHHsKDFsdgKGiO4u5NyVHZGJwLd1fYUBNxFEh4tMMbCOsVg97djI7FH+qXbsK+BjQz6jc3sLH78/uP9zAPQ7p0FbDRGyYaU5wj9xHlEmxoyRw5QQgiroMYbUYgd7pN2Gl5QV4j1qxE7lwDEtMc+JrwINVEaoJvESXPunjX9Xs5148LUxfuy0tO6SP+8CIPRshqTy/jCCKb5DsE1JJX56eD0ISaLQPXSfbMWGSHHwR7k8KqGIJ5HfX0fTxEI40J8VjnziLjtPrItHvhvFkF+V0EWZ5auZhfMha5b8/JkBKnYXQ5zm/ijxg7AxLivARLKMtaGQysAPIHZCfCRuoO1dhQfqzRa9CUCOZ7ay5Yaa+3CDAtVU0iuZG1wYyjI+oZlQdrUnEg1OpF1Njp6bx5Zwr9xF1IulNHYLf/iknjKfpVRAJK0txMmDendirLYX0t+4yrn5pP5GbEIAxg/rDMzV0QgWewLZ5QpMqBJplLOV9jUizIrmUzasGG5Oj9sJnqEUX21zhj9cvXqu8a36eXF3kjynHm4jvDnBiS/R4Tl22FKnzah5hBD9b3GbVmVreQ4FOLimEPJcp7ycY9hkV6JndyBgd92DunFkvLKrPMEdXnyf91S4YIN8ytpfyM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(42112799006)(376014)(18002099003)(22082099003)(10067099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clFtWEpkZC83SmxueUdXZDRDZFYzOG9Gc3VTcUloTGQyQ2pMZ1V4eE9tY0JV?=
 =?utf-8?B?d1gyR0hTb040RGVQT2ZnR1dDN1RzWEtLQ0s4Zmk4YWg5VDFjMHk0L0ZHREVz?=
 =?utf-8?B?ZjFWVmhMQTBjSzRNOUtMSmZ3REViaTFFcDNmaEk3UDNVY3NxUlVETEd2cEtz?=
 =?utf-8?B?eVg2a3V4ekZQVkxtWktVa3JIV1R4MWptSEduT2FTajhlREU1Vnh2MU9GZ0Jn?=
 =?utf-8?B?ZWNUMFFyRjB0NStDTGJSbW0vZW5sa3BIalBEU0hMMXdCWHpHN1JVYldweWpF?=
 =?utf-8?B?SW51N283ZkhLYkI2TTVia2V6Sm51TlpVa2lzSk1XNmlxZnpEaDZjSXJJclBW?=
 =?utf-8?B?ekh4bjVWb2c4YWpLbkdKSnhEc2xOano2SmFBeXhZVFY0QXQ0L3ZYNWVodVNQ?=
 =?utf-8?B?WVVOK1lYUEx4TkhPLzV0QjRGQkRkYm1Yb0ZnVURNTzNHTkpwYmhvMFcvSzBF?=
 =?utf-8?B?Y2NtbmR0N25qWm14QkFXVTA5c0k5UzhzYnFJWlVBSFpkb2VxcTVwQ1BCRDZs?=
 =?utf-8?B?ZnhWL05FR2FkU3pNVG9mdlBSck5ZN1cyZG1LSUZ6SjZPTFEzWkM3ZDM1YTRu?=
 =?utf-8?B?enVyUC82a2E2RFFLZEI4TkMzNnV4Ykt3OExoQXlZOFBqREl3clVvUFg1Z05D?=
 =?utf-8?B?b0MvU1BJZmRyTUIvcHdaUm9MVExDS3ZNVWJ3NjBpaGp3d1BnL3BuL3JtUmVw?=
 =?utf-8?B?WE1tdGk5bEIwd05SNXdLeEd4SGdxRzB1WDk4V3RXMElEVmtlTjBJQy9uN0pp?=
 =?utf-8?B?dFBKWk9hcmZkdGl5YWZWQkdtUzJJVzdmOUhSWFM2M0dFcXlZWnMzb0JOcWQv?=
 =?utf-8?B?RWx1M0xaeDExc0VMNFBaNEYra1ArSGkwS0lSZnZQeFpGM1E0WlQ0T0Z3RXhX?=
 =?utf-8?B?amZkVDYzZmdZaXdkZklteThtRTA1NDBsaWdrS3hqdjB1YmNxM2dPbEhsUFlW?=
 =?utf-8?B?N2pYYXVZZmluMnV0UjFnY0Jnd09rTkNOUUpyUENzNWl1NEJDb1pGUjFacHFQ?=
 =?utf-8?B?YVpYeVBybUFmUDVvc0MxS3R3bzlnam9WbDA5MDUrRGxaZVFTWkZnby9KUGJr?=
 =?utf-8?B?WHFZUTFBWlVqSjR3cm9maUNoRUFaT2luZ29kSzFpUkJ2UlYwQVRad1UxZjc4?=
 =?utf-8?B?Y1gzQ1NZYVNYVzVkRlh3NlhJRDN4c3pSTTk3L2JXOTJrRE92WktxOFBocGYw?=
 =?utf-8?B?TU1tMkJwa3dJSWdQVEswUUx3ZlVHNlRkNkZoNDk2b05XdWpiR09XeFFYZTVq?=
 =?utf-8?B?QXJBUmNhaG5mRHROTEF2SHhtZzZUV2t6U21uVDVIRCtGTGxFZmV1aHM4YXpX?=
 =?utf-8?B?OVduTTRpQXN1bHBNZUhMWU5WVTdKRnN2OVpOaWZXQkN6UGlDVXB5TnM1SkVs?=
 =?utf-8?B?RTNtU3BuclhtVmRHcmROYmZqcDBaVk9wbVpuWm1ITzQ2UnFCMVBZajN5Qmcw?=
 =?utf-8?B?Y2Zqbzl5Mit5ak5hTWpTelc5M0Z0b1RMcDJPQkVGL2Z6aGNnVks0NHNTMi9u?=
 =?utf-8?B?alU5c1dhWEFpYjQ2bjdFNHZERmZtbG9Ma2ZvM1JibXZPYlNHNGF0T2k0N0R0?=
 =?utf-8?B?UjRPUHZ5K0xQR3RwU2xNKzNkNTYrTUMyMTBUSzdMOHZwZ2wyZERKdS9NOTdo?=
 =?utf-8?B?bStiUndYdzNIU1lhSmt1MDE2WEVkbzlneEdmYUtteVBOS3hBM010Vm51c2E2?=
 =?utf-8?B?eVlTRFdyb3dJclBBQUdIdGNZWkxEdTdBcVBCQzgrL0t2WndrL3hYYU1DNTB2?=
 =?utf-8?B?bENKWStPZjJENlNvODdtc0l6d2txZzQrTGhZek9iWDVMV0dmVENvUFdwWEIv?=
 =?utf-8?B?TVU2TGJBbC9uVitiQ3hTMFI1eGJjY3oyT0xWQnNvTzB6UUdrekZKbWpaRXJi?=
 =?utf-8?B?Sk42cThDTDRRbjNSU0x4TlVLVEFVVFZDOFhNd3lEM2llVXA0SmN4cXl0c1pL?=
 =?utf-8?B?VjNrSlJOUDNQQmZsdmNaSWtqaTM1WEJkQzRCMnA2dWVJZ1pTSVJtRlJZSnpm?=
 =?utf-8?B?TU14aDRJQTRsR3JieFJGZXRqWUk2dFpTekR3TmcvSGtkOHQ2YlFoYkc2WTMx?=
 =?utf-8?B?aFBycE5PUjN3SkIzR0g5MHZLVGpCdG9pOEN4YStmejdmSXNxeENqOEZjQ2gw?=
 =?utf-8?B?Q3lTMXc3dThQZXZzK0h4cm9iNzR6alZMeXhzcGRWdWx3UjJ0SEtXOE9meWxJ?=
 =?utf-8?B?YWZsb1E4WVhlSzBHcVo1dERBZHNwRXc0czdwSXk0em85MzdiSEZmT1I1QXhT?=
 =?utf-8?B?blZOWC9qa0RKTkExMzdLS0g1N2hyMjlka0RsMWpNWW5ya3VOSjQwTkVvdXRt?=
 =?utf-8?B?RktWaG5wZ3R5ZkJJWC9QQmZxaWJkbnkwU0Y4TXc4UE9JVFhCc1MxUT09?=
X-Exchange-RoutingPolicyChecked: WLgCIjxYx/Y4clTz3zS5s+ZObJg8RwM70ijsQ8r9cuaZqtV5stDug51epcNOY0kotLHpH/MgmqttqbNe3SA0W93eqLAXxCZViTlnrBuvJ5qE9oFaH/H9fOUZv70+Qoz4938M+8YlzbPw9TDLtyc3FNZG+UAXxfc3XTZiN4Jlr8Ei96XcF3dELjqglqmhw1t1UnvyfG/K63/hHm1l5nmszC2EZE0E8sDBHdH/gIzhtJENa80FydXzsz6v3mrQZw+n/Y4882elTUDYTQl6rSGsIwjDtliRlaB9NW6QIznp6zIay7vNXzz/LhT8bb+X5Pb5nLV147q/YXmjmAPgKK49rQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b026c8d-b6d6-4023-f56c-08def459f8e5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 08:00:39.9866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uogmU3Thg8AeRDnbqMoa+PKgVGo8tFqZr1Sr4DLvUWow8i4fQ/NX5DGLEfH/Fe9OPkX5yLaVPPnFCdGpPjOcEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
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


On 8/7/2026 3:52 AM, Swati Sharma wrote:
> Skip tiled display test patterns due to missing configuration.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe.nvl.display.blocklist.txt | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
> index c57766ce2..05c9f7f5c 100644
> --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> @@ -95,6 +95,10 @@ igt@kms_content_protection@mei-interface
>   ##############################################################################
>   igt@kms_chamelium.*@.*(vga).*
>   ##############################################################################
> +# Valid skip: Missing configuration
> +##############################################################################
> +igt@kms_tiled_display@basic-test-pattern(-with-chamelium)?
> +##############################################################################
>   # Valid skip: Use either of connected/non-connected kms_bw
>   ##############################################################################
>   igt@kms_bw@linear-tiling-.*-display.*
