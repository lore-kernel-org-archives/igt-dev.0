Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD67C0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 13:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602CD10E219;
	Tue, 11 Feb 2025 13:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gT4CFdWS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5C710E219
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739280489; x=1770816489;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eGWUZttjsOnnma4FQDw/QiIMlr9cjN6cHkRpX2NvJfg=;
 b=gT4CFdWS+6H/ZxO3zvSEg0Rc1uUDLkkViARAPbSdaiVCKrMUwuR0zm+g
 DEqpzyZTSYSjqrDgf0K9me805x6XPctc/+EAEiQ6a9DH/FCDYBUw+t+rq
 QC5Yz/Acex3Nu36NeGpEiVZLyo8J8sD/GBkZX9QCV9d4BiXP+tb405wk+
 +4iifAfP1yLwB+t27pAeadAXwm1P/Kiqgo6DybExO5AA7a4fL+LyrpW0f
 cX3sfKkud+kbPROMqvVrZGyGNxAWhqAUActMaaFMHTo/Uw+0gTp/G+OHj
 GOLdbPn0ewBY9owlff+/S0ocSRd0KTtSz/LEVXsctQpYQB5FGHLFNtVnQ A==;
X-CSE-ConnectionGUID: 7bDfrbVwTqeqgCbDN/sZhg==
X-CSE-MsgGUID: 2PVo/DAjTk61kZLLz4GvAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39814118"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="39814118"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 05:28:08 -0800
X-CSE-ConnectionGUID: ST9LfQm7RUyvsqFPgRLy1w==
X-CSE-MsgGUID: zDsvVygtQLqP8+MCrLMwAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="112472220"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 05:28:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 05:28:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 05:28:08 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 05:28:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TByto5wBdixeXAQIbAAwegVALZrepDNWx31e1aPl2OC7pm8JAVQ4rxrHWB0jRNX9KP3LgG+e24P19232yDbWRumHS8pQJueXVvfy0MSUYsPxDeYldnC9FcKmXQPJGVioe5RhS57AjUXkkf9LC+q8a9bOsQrOyo2ZsaCo76ZixzA106GHJBkVUHn4SCREssybFlgzJ7tlFzH6e9DnJeqJdRqbOWSZJIptlS4zkyMNBYrbRbzv1+HwvB4Noq82aNHHqIxGvatshCD5w87zaYw+zXpyrpQyr3CO8mgBdrNgUqufLrJaG+e90x7aES5TyuG9HKZqTbY0aNeyPPN9RAsTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKBG62FyaTTeducQ3EGk2ZXe/BexhLQc5JA799pm83I=;
 b=blYlMzY8Sw0WUn7SsLr7A+uCDpIQhLAZZ8f4Tdp6Xkq1uKRsHqMlv7YTJlEXwlpqt4wVJ1gIZFX0rY+TWYwC8dgbd+zt46DmOtlYvZJPvinOq3R8sikyoGozTLnyOhDvsAG1LHJwQPU6k0Var/zptIVhPL3+g69ynefk5tmpk01JOk9xO3QAAjMNdCl+6BBtRu3JqgC3OD7Kz2hUioT8MRSedb3C1j/y+DgEPmwzXylkby0Rfk5PM89X9Oxr27szpcPZrw8aTSZCGUyIVLOGn1el5QnUGTr30x+4MEDqnrp665bPO2W+vKaQYMLWMJ9MWmT0uqmwNf+5BDMHuuRsfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 13:28:05 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 13:28:05 +0000
Message-ID: <ff8cdb31-4785-414d-9b1f-3881b5b8de9e@intel.com>
Date: Tue, 11 Feb 2025 18:57:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tools/intel_hdcp: Introduce intel_hdcp tool
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kandpal, 
 Suraj" <suraj.kandpal@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>
References: <20241204095654.3185959-1-santhosh.reddy.guddati@intel.com>
 <20241206171858.wtozqz4n2ntslj43@kamilkon-desk.igk.intel.com>
 <SN6PR11MB2704C4588767DCA7E173E21CDB032@SN6PR11MB2704.namprd11.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SN6PR11MB2704C4588767DCA7E173E21CDB032@SN6PR11MB2704.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|DM6PR11MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: 27600534-7df9-4490-4d03-08dd4a9fea51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnQvd1o5RWlFbU9EYkIzSk1jejdKTGVndmZNcnFvRDUwdHozMlYwOElnYldT?=
 =?utf-8?B?QTRKdFBVM0tEOEtsRjFTUlI5RWJlZEJCTWFBUy9PRCsyRUk5bDNXVHVLZnhO?=
 =?utf-8?B?T3BoMVAxT0YrZ2RIMWZlU0s1RisyOGxLQytVZVZkUnpNQkFUUzVJSHJ2YlU5?=
 =?utf-8?B?eis3NzF1QThLSlZIVGhOeGlmM2s4dlUzbU56U1lzZ0NmRzZ0VzV0TURNdll4?=
 =?utf-8?B?YUtwbCtjeUdBMWdUWmtLeWZyN29ybmhXek1HakYvZHY5a041UDM3WW5xWnVa?=
 =?utf-8?B?eElCMEYzc1lSWHdNOUMwMi9waDlXK2dkb3dzUEU5ak9MelE2RmpjaUkwSTAy?=
 =?utf-8?B?VmdCV1dNUEtOaVd1Q1RnaG14RUIvNFovQzVKeC9CQ3ZieUhROEFnT1lzRW9i?=
 =?utf-8?B?OTNxNEF5Wk1sMkFIU3dncXc0SmFiKy9EVHJWZXo4ZVdIZmhQWjhKbVFsQlVl?=
 =?utf-8?B?MGpNaUd3amwrazJoQVFPS044c25WV2gzZkxFTHZZV09LMGhKTU9XRWZ1eU1F?=
 =?utf-8?B?Y1BrOHZ0UFl1VzM0Qlk4OERsSUZjM1hZTGRmamNoR1R5ZFZTSExMNkJHZjBz?=
 =?utf-8?B?VEtKL2k1aXJXVVhTazNNYTdsT3hNRHpLWHNEWHNMK0REelZFSE4rUXh6Njh2?=
 =?utf-8?B?dTdBK2JMdVVBZE05RjlnNnRQc3hEOWdXZG9UUE02WWtmM0UwK2luUytOb3RE?=
 =?utf-8?B?a29vOTM4WGJIcVZncFBLR21jb3pjS1l2YXV1WjloMHpHcHNkYVpXeEtLc0JI?=
 =?utf-8?B?RUJlWEVaYkdSZE9ySHhsMUVrV1gzZit3dFd6Z1NZQ2FPUndxdzB3QlhuYVJy?=
 =?utf-8?B?dFU5TjI4N2pjT2M1RDRCQ1ppdWU4ZHVnZW1remkrbmJFaFUvbGtQeXphbzdR?=
 =?utf-8?B?N2xxWGRBcDBTKzhXZWxTdVhzNUd2cUorZlI1K1FnSFJXSDNqeWdZSTU1L3gz?=
 =?utf-8?B?SDNiTy9KMUV5VmNERE1KNmRlTENjcEl0dVdXVGk2TEdMUlpQUkRNM1g3L3VB?=
 =?utf-8?B?UUhBMGYrZ09hNkFLKzU5WFJYK25VbCtLOWhQc0FBS2ZHeS9VSTMwakUyZVVR?=
 =?utf-8?B?MDR2Ny9HMFFxY2RkQlpNc0V6b1RnTHRrSGJhNlJrU2pvVzFaM2RHTGJ3WS9J?=
 =?utf-8?B?aVVwRnplKzlyM1ZyRUlxcFM0Mm5hWVZGd3dReWk5SVNKcGE2cXNERVIvUTdQ?=
 =?utf-8?B?Y2loQWQ5OUtSODB0WGYvUzV2K0lQcXk1eW05NStHVlljSC9FaEs0SDc2d0Iw?=
 =?utf-8?B?OCtpWkswNkN1NWlOTjM2dXZMRHlVYVN6emxSVU8wNmgxV0tBQUxPSFJBNjI3?=
 =?utf-8?B?Nldad0hhdEtPUDhNWlRJUndSRzJHU1lOTkZZQ1VRZEZIcFYxTzZRQlFsdSsr?=
 =?utf-8?B?UXVxTDNsYnRuOHNmbHhBVnJXeldMT0t3eW84VHhGOXNCRW8vaTJHdk9BNTZj?=
 =?utf-8?B?bWhYM3pwcW5QVWZlU2xCOGRrTmNmL0lvd0V3RFFrWU9BUkJRdFh1bkgvTTNZ?=
 =?utf-8?B?eEd6NWVaM0Fjb1VCcnhiaGNuUGtoNzY2LzVYL3F1RFNFdThUQ2NFOWJCQUdr?=
 =?utf-8?B?OS9PVEY0TnhBcnN3eXA4L1hCSlZXOXJ5NHNaMDBYZWlXTUZMSTh3c3JNeG8y?=
 =?utf-8?B?Yi9XVmNnYnI0UW1XZjk3SGJjOStVS1JDS3Zqa0sxTWhCQktmT2VrUWg5MTk0?=
 =?utf-8?B?T0VHOGlSUjBiV2FBaG1BNEtsMDhCcjhhQkczQWR4YnhkZWY3bDlpZWJmZjZS?=
 =?utf-8?B?WjZMNWU0TThFWlVmaDhFNjlCRzdRWWMrcXo2NDdlNjdlUkN0dCtLTVZPVndw?=
 =?utf-8?B?TTV0Z1gyci9ZandDVlZFVEhZTzk1SFNXSG5VeHAweDF5NzhOWVJCZ3k1WW1M?=
 =?utf-8?Q?Vkf1GG3JA58Fg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzVIY0F1RlpJQm0vNURkUUlEaXl0K2FqNEFveHFiYlZhRHpBS2w4ZGNHRFc4?=
 =?utf-8?B?a253Q1NlUWhEOGtWL09zR29DeitXRFFQaER1d0JaT0ZqNTJoTGxyMzlXZHBv?=
 =?utf-8?B?aEtZQytSelRwcUJpdWZGSWdwSnpCMFBXTEpZUkdvN0g0NncvS3VsWHBMTExR?=
 =?utf-8?B?cHNpNjQ2M3p0bk9DaWQ3ck5IUHNxc3F0R3AxQlJha1puQmtZOGwzRm5acUdE?=
 =?utf-8?B?dWNrZllVMjJLZkJWZnhvZFNEalJzMVRGSjdlNVVXTTh0WjlhazBPTHo2aGhl?=
 =?utf-8?B?MWlncW5JSVIzS2FnOWRhT1JZWWNtTHd0Y0Y1eEpwU0czbmdDRUgvVWwzOHhF?=
 =?utf-8?B?bjJRRGRldHZSckY1dkRHdXJBSUVwZEZ5OGpvUVBBK3V4NG9Uck5QYjMwbCt1?=
 =?utf-8?B?aFZlWUpzc1lpemRZYXZNODJHU0lJUGVvRWMrSXA4OHZaS2hNMkxGZzJLWFZQ?=
 =?utf-8?B?SDRJRjFacTF5NjRQd0NYbENiMGlBemJ6dFo3QTFndmppS2xoenM1RGRIa0Y2?=
 =?utf-8?B?VzBQbGY0U2tCTjhqV2xabysxRDBnY1RFQ0t5V2JDdDNWMyttWGpuaGlPTEVO?=
 =?utf-8?B?Z0N1REZrY2dRbUVBNVI5MXBUQWFHamFTd3d6NnNlVTB0bzNyTW1GQS8zRHUw?=
 =?utf-8?B?cjZydk5wY1NKZm9teEVzbzRuT2VJUjhzVTZOSUVvK1h4MllKb1hlSmZXRzlt?=
 =?utf-8?B?eEsxZW1IcnJwa2l2MG5RdytTczlYcndnbXNRNHFFQmlmMFpBQ3E1dzVrcmFZ?=
 =?utf-8?B?MCtBVUhkdHNDSk9pdzZpd3VqTzVmSjA4MHBtc0JsR2E1SUkzVHc5Yi9wcGVy?=
 =?utf-8?B?dEhHaWFlOUZDM2Z3ZFdGeG1Da1d1dEpsNkRBM0VPSlB3OXQzKzJRbkZiUWFT?=
 =?utf-8?B?QU9YSC91RFM5V2FzZVhhWWJXS1o1UEZPaDJ0RG9zNTJBZWp1aDdxUmZOTmZZ?=
 =?utf-8?B?cDRic2Zld3F6MFhJa1VENVByelgyVHlQaHFFSmFkZXk2L1RkelZXMmxaTnYx?=
 =?utf-8?B?elNJcGczOHZJa1B3eVlaSzY2RjBWcGdXV29PQmwvNGYxdCtld1VGMG5ETUIy?=
 =?utf-8?B?YzFNWGRFek04OGRES1ZXNXhYTm9ac1VYVGQ1Uy9VcnJ3aUo3TU54SlF2T3Fo?=
 =?utf-8?B?L05HcjFjQnBzcUpWZHRSWTRrYnN2ck8ybHdHdWlKWUgvTWl5SkRzZ3hlbmlU?=
 =?utf-8?B?WkFPcnY0VWJibjMweGxENEpNR2Q0WXBGckVjWnZLcEl1N3pCaTduNCs0aTNS?=
 =?utf-8?B?ZFk3bEZwSm1TR29wODZuZXZvREpHakV3MGgyQWp4TFNCZy8xWUxNL3lnZkxv?=
 =?utf-8?B?QTV5b0prK2U0dUxkcG5Jd2ZPNTljWXRLSyt2dlk2RnJwWHJTSmxrd1ZjeFg2?=
 =?utf-8?B?SG41WE00eXRRZUVzSXBZbUJZL09PMWRMQno0UzV5T1NqeFZOSlduMU92ZVJ6?=
 =?utf-8?B?UXQ3UkptbWZ0RWwwREVSSDIxeG0xOHRrZVFpMGkxdEM0ZUErek9NQk5sMCtG?=
 =?utf-8?B?Vzl5SXRtMEVVRll3ejlFVzZNTzY2SmZQSnN5UDU0V2Z4ZlgvSDM4MHQxSmc0?=
 =?utf-8?B?WUIxb2JLLy9lVkVwOWxHbjdNWFhFT0FaaXJRZ01NMHg1clhPUnBURGI5YUkr?=
 =?utf-8?B?WE10SmNzankveXV0dTJwN0VoYkI2NG5LUnJGUVNqWmdCOXovWWNSTXdVQlpN?=
 =?utf-8?B?YWpLcTVWQVpoSGc2V1kwVU1HcFAvSXM5VnlTZzVrUXVZMVV6TFpwWllYQVZW?=
 =?utf-8?B?blJFeFhMMDF2aitiR1hVZ3BGYmtIenVaWDF6VXhCa2FwaWxDWGFvOUhtRWZK?=
 =?utf-8?B?NTc2V2QwYmhRRVU2Y2d3WkhLL3ZqelBmZktZSWRKVGgzSmRONEhrazB3M0hq?=
 =?utf-8?B?RSs3Yng0TzM5bmc0VC85TzNXWHhQbFVtVnErN1Z3TmwydzRQdnJibGxIWUsz?=
 =?utf-8?B?ckdjRWRlSlFMWkczNDNKMmdBTFptbXhWUkdNdk03dkNSd1pzbWdFRDN1Uzhm?=
 =?utf-8?B?Nnc4QkJkVm5wWFpDTmNNMGtmWS9vbEZ2K3N0UEh6ZldSSzY4WWNaK25nU0VH?=
 =?utf-8?B?M2JvQ2NpZ0x0Q1cxV1ArcEJuRTZoRXUvR3N1dWxYak1oTWFQN0ZFZmx6eVFL?=
 =?utf-8?B?S2loamRRS1ZldlI1NERORTZQY1htRVFGRVUvQXBXVXp2NVQ5YXI1WGJzWmRT?=
 =?utf-8?Q?aVK39FzyqceOpvCbzb/6Xzg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27600534-7df9-4490-4d03-08dd4a9fea51
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 13:28:05.2393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59ug2T7IMqfFC6K2ipK4pfGU2Oz93YESF6q70i1s89pUA3BIMIfiBdoA7lkUYU0cIfRUZw2AreJlFE0fY2t9qKtJTss1+djNocLx3jRYQpfZ5t5dH0M9gENTgFQQoDeD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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



On 24-12-2024 14:01, Reddy Guddati, Santhosh wrote:
> Hi Kamil,
> 
> ------------------------------------------------------------------------
> *From:* Kamil Konieczny <kamil.konieczny@linux.intel.com>
> *Sent:* Friday, December 6, 2024 10:48 PM
> *To:* Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> *Cc:* igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; 
> Kandpal, Suraj <suraj.kandpal@intel.com>; Nautiyal, Ankit K 
> <ankit.k.nautiyal@intel.com>; Thasleem, Mohammed 
> <mohammed.thasleem@intel.com>
> *Subject:* Re: [PATCH i-g-t v1] tools/intel_hdcp: Introduce intel_hdcp tool
> Hi Santhosh,
> On 2024-12-04 at 15:26:54 +0530, Santhosh Reddy Guddati wrote:
>  > Add a new HDCP tool for self-testing and easy deployment
>  > to client machines. This tool helps diagnose issues,
>  > determining whether the problem lies in the driver or user space.
>  >
>  > The current changes include tool skeleton and get hdcp info
>  > on the connected outputs.
>  >
>  > Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>  > ---
>  >  tools/intel_hdcp.c | 203 +++++++++++++++++++++++++++++++++++++++++++++
>  >  tools/meson.build  |   1 +
>  >  2 files changed, 204 insertions(+)
>  >  create mode 100644 tools/intel_hdcp.c
>  >
>  > diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
>  > new file mode 100644
>  > index 000000000..8c0258092
>  > --- /dev/null
>  > +++ b/tools/intel_hdcp.c
>  > @@ -0,0 +1,203 @@
>  > +/*
>  > + * Copyright © 2024 Intel Corporation
>  > + *
>  > + * Permission is hereby granted, free of charge, to any person 
> obtaining a
> 
> Use SPDX, see other recent C files.
> 
>  > + * copy of this software and associated documentation files (the 
> "Software"),
>  > + * to deal in the Software without restriction, including without 
> limitation
>  > + * the rights to use, copy, modify, merge, publish, distribute, 
> sublicense,
>  > + * and/or sell copies of the Software, and to permit persons to whom the
>  > + * Software is furnished to do so, subject to the following conditions:
>  > + *
>  > + * The above copyright notice and this permission notice (including 
> the next
>  > + * paragraph) shall be included in all copies or substantial 
> portions of the
>  > + * Software.
>  > + *
>  > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
> EXPRESS OR
>  > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
> MERCHANTABILITY,
>  > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
> EVENT SHALL
>  > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES 
> OR OTHER
>  > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
> ARISING
>  > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>  > + * DEALINGS IN THE SOFTWARE.
>  > + *
>  > + * This tool designed to mimic an HDCP video player, capable of 
> performing
>  > + * self-tests and easily deployable to client machines. This tool 
> helps identify
>  > + * whether issues are rooted in the driver or user space.
>  > + *
>  > + */
>  > +
>  > +#include <stdio.h>
>  > +#include "igt.h"
>  > +#include <fcntl.h>
> 
> Sort alphabetically, first system headers, then igt so:
> 
> #include <fcntl.h>
> #include <stdio.h>
> 
> #include "igt.h"
> 
> Btw are you sure to include igt.h here?
> 
> We need this to use the igt defintions here to stay consistent with the 
> other tools in the igt_gpu_tools repository, We are using the igt_* 
> functions in the existing tools like
> Igt_dp_compliance, igt_reg etc.
> 
> Please let me know your thoughts or if my understanding is incorrect.
>  > +
>  > +#define MAX_HDCP_BUF_LEN     5000
>  > +
>  > +typedef struct data {
>  > +     int fd;
>  > +     igt_display_t display;
>  > +     struct igt_fb red, green;
>  > +     int height, width;
>  > +} data_t;
>  > +
>  > +
>  > +/* TODO: Implement the actual HDCP enabling logic here
>  > + * Steps:
>  > + * 1. Open the appropriate debugfs file for the connector.
>  > + * 2. Enable HDCP on the output using connector properties
>  > + *    IGT_CONNECTOR_CONTENT_PROTECTION and 
> IGT_CONNECTOR_HDCP_CONTENT_TYPE.
>  > + * 3. Check the status to ensure HDCP is enabled.
>  > + */
>  > +static void enable_hdcp(void)
>  > +{
>  > +     igt_debug("TODO: Enable HDCP\n");
> 
> Tools is not a test, so maybe just fprintf(stderr, ...)
> 
>  > +}
>  > +
>  > +/* TODO: Implement the actual HDCP disabling logic here */
>  > +static void disable_hdcp(void)
>  > +{
>  > +     igt_debug("TODO: Disable HDCP\n");
> 
> Same here.
> 
>  > +}
>  > +
>  > +static bool sink_hdcp2_capable(data_t *data, igt_output_t *output)
>  > +{
>  > +     char buf[MAX_HDCP_BUF_LEN];
>  > +     int fd;
>  > +
>  > +     fd = igt_debugfs_connector_dir(data->fd, output->name, O_RDONLY);
> 
> You are using igt lib function here, make sure it will not assert.
> 
>  > +     if (fd < 0)
>  > +             return false;
>  > +
>  > +     if (is_intel_device(data->fd))
>  > +             igt_debugfs_simple_read(fd, 
> "i915_hdcp_sink_capability", buf, sizeof(buf));
> 
> Same here, using igt lib function intended for tests
> can bring an assert, it is no expected in a tool.
> 
> 
> 
>  > +     else
>  > +             igt_debugfs_simple_read(fd, "hdcp_sink_capability", 
> buf, sizeof(buf));
> 
> Same here.
> 
>  > +
>  > +     close(fd);
>  > +
>  > +     igt_debug("Sink capability: %s\n", buf);
>  > +     return strstr(buf, "HDCP2.2");
>  > +}
>  > +
>  > +static bool sink_hdcp_capable(data_t *data, igt_output_t *output)
>  > +{
>  > +     char buf[MAX_HDCP_BUF_LEN];
>  > +     int fd;
>  > +
>  > +     fd = igt_debugfs_connector_dir(data->fd, output->name, O_RDONLY);
> 
> Same here.
> 
>  > +     if (fd < 0)
>  > +             return false;
>  > +
>  > +     if (is_intel_device(data->fd))
>  > +             igt_debugfs_simple_read(fd, 
> "i915_hdcp_sink_capability", buf, sizeof(buf));
> 
> Same here.
> 
>  > +     else
>  > +             igt_debugfs_simple_read(fd, "hdcp_sink_capability", 
> buf, sizeof(buf));
> 
> Same here.
> 
>  > +
>  > +     close(fd);
>  > +
>  > +     igt_debug("Sink capability: %s\n", buf);
>  > +     return strstr(buf, "HDCP1.4");
>  > +}
>  > +
>  > +static const char *get_hdcp_version(igt_output_t *output, data_t *data)
>  > +{
>  > +     if (sink_hdcp2_capable(data, output))
>  > +             return "HDCP 2.2";
>  > +     else if (sink_hdcp_capable(data, output))
>  > +             return "HDCP 1.4";
>  > +     else
>  > +             return "No HDCP support";
>  > +}
>  > +
>  > +static void get_hdcp_info(data_t *data)
>  > +{
>  > +     igt_output_t *output;
>  > +     igt_display_t *display = &data->display;
>  > +
>  > +     igt_info("\nHDCP Sink Information\n");
>  > +     for_each_connected_output(display, output) {
>  > +             igt_info("Output: %s\tHDCP Supported Version: %s\n",
>  > +                       igt_output_name(output), 
> get_hdcp_version(output, data));
>  > +     }
>  > +}
>  > +
>  > +static void print_usage(void)
>  > +{
>  > +     igt_info("Usage: intel_hdcp [OPTIONS]\n");
> 
> Same here, imho better just printf() here.
>  > +     igt_info("Options:\n");
>  > +     igt_info("-i,   --info          Get HDCP Information\n");
>  > +     igt_info("-e,   --enable        Enable HDCP on the output\n");
>  > +     igt_info("-d,   --disable       Disable HDCP on the specific 
> output\n");
>  > +     igt_info("-h,   --help          Display this help message\n");
>  > +}
>  > +
>  > +static void create_frame_buffers(int fd, data_t *data)
>  > +{
>  > +     igt_output_t *output;
>  > +     drmModeModeInfo *mode;
>  > +     uint16_t width, height;
>  > +     igt_display_t *display = &data->display;
>  > +
>  > +     for_each_connected_output(display, output) {
>  > +             mode = igt_output_get_mode(output);
>  > +             igt_assert(mode);
>  > +
>  > +             width = mode->hdisplay;
>  > +             height = mode->vdisplay;
>  > +     }
>  > +
>  > +     data->width = width;
>  > +     data->height = height;
>  > +
>  > +     igt_create_color_fb(data->fd, width, height,
>  > +                         DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>  > +                         1.f, 0.f, 0.f, &data->red);
>  > +     igt_create_color_fb(data->fd, width, height,
>  > +                         DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>  > +                         0.f, 1.f, 0.f, &data->green);
>  > +}
>  > +
>  > +static void hdcp_init(data_t *data)
>  > +{
>  > +     data->fd = drm_open_driver_master(DRIVER_ANY);
> 
> Imho you should do an open yourself.
> 
>  > +     if (data->fd < 0) {
>  > +             fprintf(stderr, "Failed to open DRM driver\n");
>  > +             exit(EXIT_FAILURE);
>  > +     }
>  > +     igt_display_require(&data->display, data->fd);
> 
> You are not in test, you cannot 'require' a display in a tool,
> imho you should inform user that no displays were found and
> just exit, no igt SKIPs.
> 
> We need this to use the igt defintions here to stay consistent with the 
> other tools in the igt_gpu_tools repository, We are using the igt_* 
> functions in the existing tools like
> Igt_dp_compliance, igt_reg etc.
> 
> 
> Regards,
> Kamil
> 
>  > +     igt_display_require_output(&data->display);
>  > +     create_frame_buffers(data->fd, data);
>  > +}
>  > +
>  > +int main(int argc, char **argv)
>  > +{
>  > +     data_t data;
>  > +     int option;
>  > +     static const char optstr[] = "hied";
>  > +     struct option long_opts[] = {
>  > +             {"help",        no_argument,    NULL, 'h'},
>  > +             {"info",        no_argument,    NULL, 'i'},
>  > +             {"enable",      no_argument,    NULL, 'e'},
>  > +             {"disable",     no_argument,    NULL, 'd'},
>  > +             {NULL,          0,              NULL,  0 }
>  > +     };
>  > +
>  > +     hdcp_init(&data);
>  > +
>  > +     while ((option = getopt_long(argc, argv, optstr, long_opts, 
> NULL)) != -1) {
>  > +             switch (option) {
>  > +             case 'i':
>  > +                     get_hdcp_info(&data);
>  > +                     break;
>  > +             case 'e':
>  > +                     enable_hdcp();
>  > +                     break;
>  > +             case 'd':
>  > +                     disable_hdcp();
>  > +                     break;
>  > +             case 'h':
>  > +             default:
>  > +                     print_usage();
>  > +                     break;
>  > +             }
>  > +     }
>  > +}
>  > diff --git a/tools/meson.build b/tools/meson.build
>  > index 48c9a4b50..8e24005eb 100644
>  > --- a/tools/meson.build
>  > +++ b/tools/meson.build
>  > @@ -27,6 +27,7 @@ tools_progs = [
>  >        'intel_gpu_time',
>  >        'intel_gtt',
>  >        'intel_guc_logger',
>  > +     'intel_hdcp',
>  >        'intel_infoframes',
>  >        'intel_lid',
>  >        'intel_opregion_decode',
>  > --
>  > 2.34.1
>  >

