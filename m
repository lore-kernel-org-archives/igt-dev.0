Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21165C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 14:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CFB10E362;
	Tue, 18 Aug 2026 14:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbVrI3Kk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19BD10E00B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787062539; x=1818598539;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jo/2jfOGc6fy3GmC4kXIGJCK5plky8M4inAd1lUvnyw=;
 b=MbVrI3KkPCSdfgYYqZA4TX0xb+KDgb4yWNiqbAS4IDh4l1/Y4zcj3+p2
 CrFxwi/bCf2TUk/MLxaK0hU7eNySwPUQ99rELRfFx0C+YPZERAKjY/kcU
 NXpY31FW/jMcyRxuE19unmFRgybbxR9AVI1ZZpUzSIHEdkNzhjPhuAlFS
 ho4kL256S3+l0pMxxgn92C7zMTP1agZcFW54o1sfBxfPIOl/X7ROWd1uz
 ZbaSZuIJKh1+hrKbkf2ZKj0tpyQMPdFFfQwdjvbiV/hRf/5nheVp6/Mp1
 YdF7ANn9hBUd+ovhubRTuivTTKm9/srOPIHijKaj07xCUQ8UtIACteMvM w==;
X-CSE-ConnectionGUID: fr6ZGcKkS7O/LzFDrzTbog==
X-CSE-MsgGUID: rnDvILtjR4qMANZBlsPiQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98709882"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98709882"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:15:38 -0700
X-CSE-ConnectionGUID: AGRUln8ATqmGY5kf16Ctgg==
X-CSE-MsgGUID: RtDsXt0USzCGSvYWK74lmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="264794248"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:15:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:15:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 07:15:38 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 07:15:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WvFNrOrFQQ9kxdHxEv/16jV9IiGkKFoQvVZdLgkblLM0+cc6682D7B1XC+1EgyZl3sHVC8z1gZQLYlGOsEO8QkS5yRUJNbSjZMLR3II8ZKSam1QVqxNabyqml51zJJen33xdRK5PjZZkyliYuKTgQqFLqcu+yHR4cnXhCB90BCIwb4/32GdGVgekb9V00znjg3/c6fpT8yK/h+2K1oKhEhmFIQTMtoJD1p4jixyo/5mxHk0/bMyrePQo8a6sp5CBnSTAB1Ddq45IzVA+iWoZsklZIrHp0bSdHXL5mzwvWjcGNijc1zWqB8kA7vT9rG3c1XX8W1ISwGfCelF1AX+W6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/co+ot2O8slhcqzNoZ2wcsp8qDPeUAvMcsKWBpGOCA=;
 b=Ud2grDHKwBxJTiFHPT02wAEbltsupbgL5oliEcr6OZXWOXBho8J+dg5oBZ9GiICVmRAQZdjnIpdiR+tMpKzoewtf6HfO/XkS61mlFnxbTEn6g7PNb8MBzgV1ICf6ZoNGuKf9onz37M+3+Dh2m9MNNnY3/zjUZDHuUqJWMPfat/bVbIL42ZgCjYwZZeDBC8L7cV3HbeE+JOoa6b5pZSBvvSD52yz/GrGRlos1I/515K+qV3+96LzutTQDF03kiChEJiaSdm3f0+S9XbtAHZrIEdvmq+8LQG1oiiNRS0tzkV1xYZ+EozAwNcej51VEBtRBUejC0bTyu7zgYCQ/SY+wYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by LVUPR11MB9857.namprd11.prod.outlook.com (2603:10b6:408:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:15:35 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 14:15:35 +0000
Message-ID: <0c717c70-881c-46d3-9227-9f6eae589fd8@intel.com>
Date: Tue, 18 Aug 2026 16:15:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/6] lib/xe/xe_sriov_admin: Add bulk scheduling
 params setter
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
 <17c3a7f8e02e94f11b7beb6e3359dbd8afeb4567.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <17c3a7f8e02e94f11b7beb6e3359dbd8afeb4567.1787056235.git.marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0059.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::29) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|LVUPR11MB9857:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e769ae-11e8-4619-ead6-08defd332b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: Gdk4+x/JoL57TcsD7nKIds07aiIZwV0csrnY9gAzfS9d8iW1R+i3Jfnein4h5ngm6bEbhRMqWz2pj+Bp9FmJXBSoB2187HuFnxSV9nGZaYRV11HufxyseuW9NZE6uJaHCucRlihk4VPtqmf318Y27ljXIvHopwzSVy0f2SNb1hw3VVkYyDZOQJW/jdrQW2qQqtHApYGAWImWM9fUcKmwSuuOe/R9gjDj7gWeMFKjL5mF3ZOLvebuovuSxOH3yC/GkoVajV8QO1saz3bPZkOtbwig+4dpBxj06XENEp/OxJ3TVgwkLyh0xArdurLiUAoq3edWetVSeCNjaFxxApyBrIaVztb8EykMsavNoORu4Dz5P775HJR5AtbwG4ukAEyHiMZ7mu8hFLvCS2Rb024+MFrl4ymRaS04e2jWRpQfG/PtZWQZvlXVd0K2uFPN5Q+1sc8yFAtkFGMpDE6q5KU4xm2nb3m5IzUbvCn5JStivzh2d36JzaZGBBMJU6VNqsBW30ZKZyQMm29R2XK5k1IZF9A+g9AEbL8XvdJpKrFwX9S0a0Duh23qtIbBjCkCh5L0ob13sIURWl+rWs4NO0/uFVJPoL+hnIqMOGPA4gfAIHfqnjrJsdg0LxdiOOT0IYdiyJIkiNUSIn/J7t2xvNqjqrkt2wqeXQEz/IhLkblQltE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkZTMitKaDg2a0E0SkUzVVNIeUgvT1F2Y2dyWEdKeGg4S3RQWXZsbjk3Rm1r?=
 =?utf-8?B?UFdueWJEOFlsa1N4OWhHOUU2ekhVaVZHdzFrRXFUTWhlcjFCUGpJN2RHcHh6?=
 =?utf-8?B?a2hkNGl1aVdXWCtuMkh3VnFFdHIrRVpieEQ4dUw2TzFSNFNBWnhjUEJhSWZl?=
 =?utf-8?B?SEJJNDI1Tm9SRnU0OXRvVTkyYUUrVnU0OWd4VUg1TXNpV3pUSjhhZ1B3MHo1?=
 =?utf-8?B?eEJXOUU0SVBsZGIxaFZma2ZWZHNYdENXWjhxOWdyTmFpSVlDRmlYZHpNNjZT?=
 =?utf-8?B?M2ZKSW1CbXVtV0NadXlTKzJUYmtGRTJGc1hBNTd6ay9kOFRSdEphUTVyOHRD?=
 =?utf-8?B?K1pQZmNGbURUMHVZUTdJY1plSUp3L01kd0FWbDFvUTY2Y2JSNmZML0VsSHkw?=
 =?utf-8?B?WmFZS0JtdVhkUDhqa0RqeGRKVjFRQjc5TWtaYnhvOHNGRVVQalJ0QVZUazVo?=
 =?utf-8?B?Tnd3TWFDRkxGSlpZb0hCRXN0bUxjSTZvc0xuNE5HcVJJYjArUWJvL3BITkpX?=
 =?utf-8?B?eE50VHpMdUUxMGVOYWx0bmV4M2dmVldFQmlBVzVNeFBhZGhZY1poMllJUXJm?=
 =?utf-8?B?REhwcndDRlNZR0pTOGdwci9lNC9hVGp3YUthR3djNFdRbjhDQXRkck8zb282?=
 =?utf-8?B?L0NXS1BScEpsNDVrV3BUU29Ubm11R3kvWmQvdUlkQkRpRkdYWTliQ1ptdktY?=
 =?utf-8?B?cisrMmd4c09qTUNUWXZmNW00amkyRHJBRmQzd1Bpem5HOGFBVExOYjJSckNq?=
 =?utf-8?B?eGpaZjE2NHJ2ZDVhbVljREwwM0NHSC9LS3hIMHNLbndxdWpJUDQydXUwTEFX?=
 =?utf-8?B?UHBrNEZrbTlLWFdoQ2RnNzg2NWM0R1p3cCtCbng2QTdsUVFKSnVyekZZYWZY?=
 =?utf-8?B?ZjhmK3A2RmQ0QnNuc2Y1aXdXelo2QldhVUdsaW5GdUFITWp6Vm5RMVVxRVFY?=
 =?utf-8?B?YjIwTS9DV0V2MWg1b0pLbUkrY2J1ZEhZaXVHenRwMlpUWmdPYWYydXVJNHRS?=
 =?utf-8?B?cGNmcjF5WDdNWlc1SWcvb2lHR0phcGl1dDBqaEJ4ZUJzajlFaFdUS3QrRjAr?=
 =?utf-8?B?SmkxWTlodXN6dExJTm9jMVM1cEdTWitvQUZwU2xhUVp2QVE0ZXZ6TU1WUmJj?=
 =?utf-8?B?UWNUYkcrMUxJRExhcmhuNzFrci9OUzhoSCswWWtCUWx0Sy9XSHNPNm5HVHQ4?=
 =?utf-8?B?bHhLQXJ4WHlOOFRKTHBwRGtkMjJWemxCK2xPcXpHd2xIaHM0N3pMeWVySUdL?=
 =?utf-8?B?T0FTRytPL20rTnJsODVUZitWT1FqVjNsdFVxVGdCU1ZTa1lscnpMbjE5cWFZ?=
 =?utf-8?B?eG12Ull1NzV0WExwd29ab21qa0gxQjVGc29SbVR3dFVTRE5IbHFLU09MM0Yx?=
 =?utf-8?B?TzJmTUZUTStCcTVxQ1RHS1gwcWFLOGExK01DSG1FOGJUZTZaNkNRd1JSU3Vj?=
 =?utf-8?B?UElJUk5MekNjVmNUK3pLdzdqaGVURytzV1FKeEhMbDgycjVrL3NTdDNSWmlT?=
 =?utf-8?B?QmU0T051QTJFaFBkMDhQcjhFK0ltVFM2YkJqZDJ3MmxIMGFrVm5HZ0MrTElm?=
 =?utf-8?B?Mk5sbllicEQvSHNWRjlYSk5PS0ZDR3VJdFBEZWd1SHZCd3d2MXNTemQxOXlp?=
 =?utf-8?B?NGUwT0pnSllRV0xZMkZYMjViMnErazhMQnljVW5TQlNqaGVMclhQazQ4YllX?=
 =?utf-8?B?YjMrL0ZXNGpuRW01Q09Yd2U1U2VBQ3pLdlZBZ0JqbGhoOFRGeTludzVUTXlp?=
 =?utf-8?B?bDZSVW1kUU1vRWRvR1VNRjRuWFBGVzVZOHpSM2l5dGZoNE96RzJUNUI4V0lM?=
 =?utf-8?B?cHJpY0RlN3NZUWszN2pxZ0QyNFZKZU1JN3R6bFlHSXkyWGE2MGZwRmNEKzRG?=
 =?utf-8?B?dnE0VXExa0o4Z0JaZCtqc3pyc2FNQzcwOU9xdFFzeHFLQ3ZKT3BVdWdGZTVz?=
 =?utf-8?B?VWY0eUF6clhMdCt2SWZwMUYyRm9UdXYvejFrV21TOU1ZajJxMFUxY2JZTUEw?=
 =?utf-8?B?aWJYeURDZ2RXRk11NVdrTlBBRVJITWNTMVExL2xhNnhDRmoxOTAwZHc2MXl2?=
 =?utf-8?B?ekZWeXBlUWhSU0VYQ0U5WEpzSHA1cnZ5U2xNdGQzV3o1NndJdnkwWFg0SnlB?=
 =?utf-8?B?aUFEaHJvaENLcGZnN05lbjZBU2NpL3YwL0RJT1BnNngvOExzRWpJa0paeTh4?=
 =?utf-8?B?YVFuQ1UvcjFrbjZlbDNBNmNRbFBpaVNGTVZKd2xWOFR1VSs0dHY5dVdybDlB?=
 =?utf-8?B?RHhyazlGM0ZGTVk5Yy9RckxZNGpMTS9RMDhWN2o3dGlOSjh4SFJodGtMUXJY?=
 =?utf-8?B?aG13SDVodEZ2bCtXSHpablU1ZGZ3Mjd5N0h1eGx2OEJqRjdxN2lQdz09?=
X-Exchange-RoutingPolicyChecked: iRBXXvyZrFiJjzohun7PiFuf/Eqr/gARfxrD2ZXR7HySic9EdmT9WRV4tOpGQmhc1zBDfw3uSukYT/ZOavhybeHiY/AFGokoPrKbZM0m5sQ8a5a/2nnXKVdHiwCV5yqbx45sBvZPTaVePWNGYR/eQseDUCjiLx7/yZ67O9q16TiMuzVz8//cVpXMpjopY7//HyJsAVomfShqHz4xzibpduh7HXVA6K1ReejhMFiHwoSqirjpc3MUqIcRb87fR7KQVsN7cg6HuplLXwH2CtYJISTEhdL5oyRb2lewsdlVmnr0ah0hOWo9ZE/zqk2CMfu2KZx09LpMyKhLdYTFgr7JdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e769ae-11e8-4619-ead6-08defd332b66
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:15:35.1278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IJmtHRx8NINul0RsUfwKW539hEJ1h9dt0qqiAGo4VPQbC95ClNohFwn6N3201i9uvfdbpea4iCXXzojXq4KDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9857
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


On 8/18/2026 14:39, Marcin Bernatowicz wrote:
> Provisioning execution quantum, preemption timeout and priority is not
> order independent. Priority above LOW combined with infinite timeslicing
> is a risky state, which can be left via PAUSE/FLR, so timeslicing has to
> be programmed before priority is raised.
>
> Add struct xe_sriov_sched_params and a bulk setter that enforces that
> order, and that rejects infinite execution quantum or preemption timeout.
> Together with xe_sriov_admin_bulk_restore_sched_defaults(), which now
> lowers priority first, callers get a safe setup and cleanup pair without
> having to open code the sequence.
>
> Assisted-by: Copilot:Claude-Opus-5
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   lib/xe/xe_sriov_admin.c | 53 +++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_admin.h | 20 ++++++++++++++++
>   2 files changed, 73 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
> index 0433ddcfc..2f47d0965 100644
> --- a/lib/xe/xe_sriov_admin.c
> +++ b/lib/xe/xe_sriov_admin.c
> @@ -505,6 +505,59 @@ void xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
>   	igt_assert_eq(0, __xe_sriov_admin_bulk_set_sched_priority(pf_fd, prio));
>   }
>   
> +/**
> + * __xe_sriov_admin_bulk_set_sched_params - Set scheduling parameters for PF and all VFs
> + * @pf_fd:  PF device file descriptor.
> + * @params: Scheduling parameters to apply.
> + *
> + * Applies execution quantum and preemption timeout before priority, so that a
> + * priority above LOW is never active while timeslicing is still infinite.
> + *
> + * Both &xe_sriov_sched_params.exec_quantum_ms and
> + * &xe_sriov_sched_params.preempt_timeout_us must be non-zero. Use
> + * __xe_sriov_admin_bulk_restore_sched_defaults() to restore infinite timeslicing.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_bulk_set_sched_params(int pf_fd,
> +					   const struct xe_sriov_sched_params *params)
> +{
> +	int ret;
> +
> +	if (igt_warn_on_f(!params->exec_quantum_ms || !params->preempt_timeout_us,
> +			  "Infinite timeslicing requires restoring defaults: eq=%u pt=%u\n",
> +			  params->exec_quantum_ms, params->preempt_timeout_us))
> +		return -EINVAL;
> +
> +	ret = __xe_sriov_admin_bulk_set_exec_quantum_ms(pf_fd, params->exec_quantum_ms);
> +	if (igt_warn_on_f(ret, "Failed to bulk set exec quantum=%u: %d\n",
> +			  params->exec_quantum_ms, ret))
> +		return ret;
> +
> +	ret = __xe_sriov_admin_bulk_set_preempt_timeout_us(pf_fd, params->preempt_timeout_us);
> +	if (igt_warn_on_f(ret, "Failed to bulk set preempt timeout=%u: %d\n",
> +			  params->preempt_timeout_us, ret))
> +		return ret;
> +
> +	ret = __xe_sriov_admin_bulk_set_sched_priority(pf_fd, params->priority);
> +	if (igt_warn_on_f(ret, "Failed to bulk set sched priority=%d: %d\n",
> +			  params->priority, ret))
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_admin_bulk_set_sched_params - Assert wrapper for bulk scheduling params update
> + * @pf_fd:  PF device file descriptor.
> + * @params: Scheduling parameters to apply.
> + */
> +void xe_sriov_admin_bulk_set_sched_params(int pf_fd,
> +					  const struct xe_sriov_sched_params *params)
> +{
> +	igt_assert_eq(0, __xe_sriov_admin_bulk_set_sched_params(pf_fd, params));
> +}
> +
>   /**
>    * __xe_sriov_admin_vf_stop - Issue stop command for a VF
>    * @pf_fd:  PF device file descriptor.
> diff --git a/lib/xe/xe_sriov_admin.h b/lib/xe/xe_sriov_admin.h
> index 4eb9c83a6..6d482f8bf 100644
> --- a/lib/xe/xe_sriov_admin.h
> +++ b/lib/xe/xe_sriov_admin.h
> @@ -13,6 +13,22 @@
>   
>   struct igt_sysfs_choice;
>   
> +/**
> + * struct xe_sriov_sched_params - Scheduling parameters for a function
> + * @exec_quantum_ms: Execution quantum in milliseconds
> + * @preempt_timeout_us: Preemption timeout in microseconds
> + * @priority: Scheduling priority
> + *
> + * Zero @exec_quantum_ms or zero @preempt_timeout_us means infinity, which is
> + * only valid together with %XE_SRIOV_SCHED_PRIORITY_LOW. Use
> + * xe_sriov_admin_bulk_restore_sched_defaults() to return to that state.
> + */
> +struct xe_sriov_sched_params {
> +	uint32_t exec_quantum_ms;
> +	uint32_t preempt_timeout_us;
> +	enum xe_sriov_sched_priority priority;
> +};
> +
>   bool xe_sriov_admin_is_present(int pf_fd);
>   
>   int  __xe_sriov_admin_set_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t eq_ms);
> @@ -48,6 +64,10 @@ int __xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
>   					     enum xe_sriov_sched_priority prio);
>   void xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
>   					    enum xe_sriov_sched_priority prio);
> +int __xe_sriov_admin_bulk_set_sched_params(int pf_fd,
> +					   const struct xe_sriov_sched_params *params);
> +void xe_sriov_admin_bulk_set_sched_params(int pf_fd,
> +					  const struct xe_sriov_sched_params *params);
>   
>   int  __xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num);
>   void  xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num);
