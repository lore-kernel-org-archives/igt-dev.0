Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A79BC79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 18:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76D310E17C;
	Thu, 10 Sep 2026 18:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjUKxHCb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE8A10E1D0
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066381; x=1820602381;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d7DbJ+rWvIqkfA0hbG9+PE4W/7za2CXZ5PhiX9xwWYg=;
 b=KjUKxHCbvdc1SwVFGWQU2s71C+i8bCyOKcOH1ekGVOHJnWZQ/iPVTGk/
 ypz9gUHquNCS84ALEWy+QfebjVkh1InWwfrQU3zrUjnohI3ZQ2lTjDcIL
 w7gg+o5SFhnV3NQHwv5R6nlSPw9TG46Kmoiz89R28hW+RkMj62KVuaxzz
 H8UtiYj1CTfvNoCIcRdlnri1RCsPihGn0z3rm17DAbU9nuF8+jkyds4X/
 llym523Y6vy4frdwUneQi+vO2704y6nIZWpEXpxI5FUPpDWz7oFFLIzBF
 ygrXSRrD6l7QDEBLaA9MoANZFo7fo+nIFkB4azeWRrcJ24PefGnbEUN1d A==;
X-CSE-ConnectionGUID: bjEB1TqHRa2UR1YCEwOnTw==
X-CSE-MsgGUID: h9cgpiFiRtKYa6VYGtGeGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="106895540"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="106895540"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:53:01 -0700
X-CSE-ConnectionGUID: yM6nbSB6QWOUv8oDC6RZ2w==
X-CSE-MsgGUID: w8Hs2hcmRkyvp8Uj609qiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="269959951"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:53:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:53:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 11:53:00 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 11:52:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMJNX/UjGE5F3xUzFtTgVpSq05uSAWDYRJTacis38PdoAIwwmtu8wLaZiWlIAt5twT9DsRjmiiJx41KssbGfiOyOum9JIRFvJd5V05Np17xHQpvEjK8kGFr9PmQp4NlsePO6AW4lHmcwwiEFZw7K1F2anhsKHZUde9rDJv3Bp4bFTaa29ej/UGrW3zox10wOcrNqgsuHJpetdo1pk19whIx6iNxdH9uYx/p6rr20mEP5kDkFY7ASnh96ypsSXAH1CCB8KiOsTb3cEnRKFrkurAyyzpro4QuG3zXfmelRnA5jA4Pg46BkbQW0Xq+gIkFcnt+GzQl2LU4NNlGTKZ6CYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l90WTSDrekuP085ZBxZh+bKkuHsGJMTLq4G+9Fb2VBw=;
 b=R0wibEuEL68NjvVuWy/tB0VZkMw40qlbrZJvOARId1uidVBJu27FZE6wlBc+Ngp7bpauXBUr8/LvEH9RPxXdHajgflrxo8RBkwdBcgAQQ8L0NTMiHGmD1gM/bpaAGuu+goG4Y1j+hKWvqDFvBE2uajhxm62D4d3Lm9sQUs08qRz7zVqigixHn6DeKZ0+zDbyDwiYOjkKGAOgJTZ97DFDLKaeLmBGU3slhL0QLn5wOsPPouXO9cvgIsx3JyOKjxn4yOKwS8FIefimJAdnAITOO5uK/5B25fzrtycyErtlbdYFiJ3rX1GevBWw/6t9qsAjWSj5h43AFc1adOHbOXzAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) by
 IA3PR11MB356129.namprd11.prod.outlook.com (2603:10b6:208:61e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 18:52:55 +0000
Received: from DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd]) by DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 18:52:55 +0000
Date: Thu, 10 Sep 2026 20:52:51 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Nemesa Garg <nemesa.garg@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v3 17/17] tests/kms_hdr: run on 3 outputs when
 testing suspend
Message-ID: <wr2ykig5t542xj6jxoujc75pw5iyjtooqxzfjtlcwxcd3jromm@cwdcmoke3y3p>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-18-michal.grzelak@intel.com>
 <8b3ee84f-cf48-4673-9d5a-8bcd54a45cb0@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b3ee84f-cf48-4673-9d5a-8bcd54a45cb0@intel.com>
X-ClientProxiedBy: DU2P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::12) To DM4PR11MB7256.namprd11.prod.outlook.com
 (2603:10b6:8:10c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7256:EE_|IA3PR11MB356129:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d9c2a3-3b34-49e1-c43a-08df0f6cb969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006|3023799007|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info: dgNbwzzMobDjLcBVDSdvF/dA7xcQ3zziOqAAQa8x22zYbd9hvXR4fqisnhMtqvWbFO7XirnP526Yf4rWIPH0lNR21Plvgj+ff6hzBD9CZUmad7DzeKgGdDr5tP5qQacbsBW0PNhFCg96d82gUSeZKMOiNnwco2vsfH1b4/ntP6/DCMcnaIx5QBuMqJJftj1E64WDW9ftsNeE4j92KKQ1ag2bQbdfCj9e7L9uMaSq5Tts4BMBsJk+YXaugOyfxaXcKF2yFCDRwjq3qUz6JJn9upSZofevdJ/TSMKxOrAQaqkHgLLC12xwNzL5uGXR92HinSnjxrlXDMsssL9iUqSE9lOGSlIXFrKAhcUPMF7U23cZBWLpR3Btb9NjXuDWaq0MZV7YikDcBWa02LePQFy0g1yooRHCDFeqbqtFhafnpgEIP7zxf6F4kyQkh3uQsk70b/bEXI+qlmWcYLSQjFOh0Zuo6y0WEzNV//1tLwQtnVU1CJBu9Iv1YfIGGhYHM5xk5k1/KXAffIZC93+JoGIVTxGADTxO6YxVGnfleXl8EmXRtpZKbxdEMRXJvCstG5LZRGU4BUqYWXJF/xYsvaB3igRu5Vmq5f2R+XNGfbf0MTyuGPjHsqNSPcw7ijM5/ReptnoPhUlumArk6n5twFQTWeUdU/nIKLcvOw/of/KWVXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7256.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(3023799007)(5023799004)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czAxazhxZDlWa2o1a0M2WFladGVWeFVBVjZsY21oOEF0dUlLYjRKNFBHMVpM?=
 =?utf-8?B?RXp0bW5jQzdtcXNXN3VJbmJLL1dTTSt5M3FTRW9CdGtQNHpDeU9qY2IwUDNG?=
 =?utf-8?B?bU96Mmh3TFRzdi9Ud2hLRm5jQnMrKzAzbmVPWEJEbktzUUgzZ3pMUmI5Snlo?=
 =?utf-8?B?V3lzNGhXKy82OUYyV29lQTVmbGo0TDJKajh6VUdSTkRDV1JkY3VwWWozSzdy?=
 =?utf-8?B?TEU0NjhiU0Fkbkp1Tmt0R3NRaGROL1Y5RUFWcDJSajV5YXZuMnh6b2lNWkNX?=
 =?utf-8?B?aUlXUmlFVVZUZWtqYVd1MSs0dDJYUmhkSGY4RXJ1RVBFbjRlR215aXNPRmNy?=
 =?utf-8?B?Wnd5UXJUekFCcTZsWHdYT2p1cGx6dG95MUgxZ2ZKR1cyOGZ0eStXdnJmWWFB?=
 =?utf-8?B?QUpUSGlDMHJzdnZ5ek5PeEJMeEhaUWh4ZE5Ydzg5OUdjbk8zRzRtY3pzbnhv?=
 =?utf-8?B?ODNmK0dNTWhDNVF6Ri9KZ0pMOEhDcGhib3phUFVQeDJ0cDRXeVdqUk9MRUtr?=
 =?utf-8?B?VHdGT2VjR1ArWFY0eWQ1akdROGFBc3J3WXhNV2VKZkNjVnAreGtrbngyQ3Yv?=
 =?utf-8?B?Q1djTjd6aWx1OXhsSU15MUFhYXR3T2RXK05veThRQzlidW85cEVrM2hCaHc0?=
 =?utf-8?B?UUcvZ1M4eitpaWtJUnQ5bzI5c2Vpd1JmZ2xhRUxpS3RpRUt2MjRLUWF0eUpS?=
 =?utf-8?B?RHpWa3hLZXhoYmRMcElBSnUzZzNrV0M1R1YwM25salNnZmR5bkJPNmxXL1BD?=
 =?utf-8?B?S3FxcnNoRFlEUjg2K1dvQ0tta1IvQWpJMXJxaXg0eEwzaEtKY1ozVWN5c2ZK?=
 =?utf-8?B?ekJTRTJQVFQ2SmdGKzJ5YkdZYVZ4NmdKYTk3WFdhT0dma2x2L0tXYkdlbjRE?=
 =?utf-8?B?dVkxTUs1YmdKQ0VOZVFsMzBpVFNlLzhPYjVrWnRBOXB0OW1ablVkTWVEbnBE?=
 =?utf-8?B?T2E1bC9vVHJabkVxSHVodmhEZEh2M3FFS2twWndsbUE1Qk5zT2FFZmRZUzhE?=
 =?utf-8?B?M1BjNjhlRjM4N3AvWGdKTjZxMFRmZktrRWhCQlZVRHU3bUFRN1J1a1NRZUtI?=
 =?utf-8?B?NFdnRHRadHFwTHJNMThpNTRlaXczVWQzY1pFWXNSb3g2TGMrTWNBVnpvU3Vo?=
 =?utf-8?B?N2NSWnU2VmVkMVVncWtQdDdGeXNNVW4rZ2dFTXZMQ2tHWkdZcEtobE9NQmhG?=
 =?utf-8?B?SW5tRkpQYjQyaGs3NkxFK3IrVzRNd01uNHdKSUQwVi9aU0MxeFFXc2dkTUtq?=
 =?utf-8?B?eGdoS2kwVEFmOEZvSWFqNTk0T3k3MUxCMTFEUUpxSytDMEE1aFQrSWptYU5V?=
 =?utf-8?B?Y0tYSWNXSmJwaWFZQmNvK01lQ2swZ0VPYy9HWitSZGczV3BJamJMMldIZzVi?=
 =?utf-8?B?Slk4czJqSGcyblFkTkNWMi9LNk5qelA4K0RqQkdPaHRtUUh1UG9JZGNlTi9u?=
 =?utf-8?B?bUU1UmpETFd0UkpUdDlDaExoZGp0dUFHQ21DTmFHRFpTY0dhYnByQkhHUFIv?=
 =?utf-8?B?cW5IaFRLaCtWY0IzMEJkVUtOQ2NsNHM1S0daRTEzWm9MY01zTnh0NEo4aHB2?=
 =?utf-8?B?ZGh0VnkyaExqc0JrU20wMEVWZ2R1a3RwaVF2SndOeStOdUh0bDVEa2V5Si9X?=
 =?utf-8?B?L1JOODJTRksyMnRpNEVhU0hFSmRTT3BuTHVDSTBoOWoxY3RXNGpFTndJeUdY?=
 =?utf-8?B?ZnFlZnlIVEhXQUVKOTk3LzVDUUtwNTdJUUp5UHN2ZjRaZTl5YUdFYk5Ra0Ev?=
 =?utf-8?B?cGw3N0hrcVJjZHFmc0l1WDFYQmhJcXlrSU1Gbjl1V24zU0FZZ2IvaUVFNXFl?=
 =?utf-8?B?elZ4YWJReEpzQUxUb3NCK21Nd2dOMVJaUUJlWjN2YWg0UjF4KzRObVFFMFNp?=
 =?utf-8?B?YlVLQVNjVHRCanAvcmRjODlJRFFRWnRBLytSYXI1VkNBckxlMnRacXRqdnlT?=
 =?utf-8?B?ZDEvR2FJTGk0d0d0ZlVLdmFJcUZwWEZ6dzlMdUZnYnAxa29HWmZ4M1BKRnBl?=
 =?utf-8?B?Um04STQ3SDloWVF0d0Y1Q1BqUnc5b1RnMFByaTlOWWxzODJ2MVM1MjdJSHNM?=
 =?utf-8?B?RmtOTzFOd3FMQ3VmV01teUExRlhVMVQya091OEYvYm5uTmRaK1FQMytaRFBh?=
 =?utf-8?B?NlFGUEJNWVZvckdKcmtpTFErUXZmRFE3eFBDYzFZRUR4T0k0ZVVaNW9rOEdK?=
 =?utf-8?B?Qm1nLzA1WlJWTTdJTDVJYkU4eDd5aFN4NUNhOVloc2RUOHRnTmdSUlV5SlRE?=
 =?utf-8?B?YjVsYW83WGh5ZGNNQ1VKOWNnRWw4cFFndWRSTVkzUlFoQjNwZkhQNWJKU1VJ?=
 =?utf-8?B?V1BGK1RoYVlGblpidVBhYm5BYlNmR21maC96dzU1dWxtOG9icEphTjVCZzNv?=
 =?utf-8?Q?dNbIY6tjBs1jYl+c=3D?=
X-Exchange-RoutingPolicyChecked: gAAs5gbVxP8jW789A11UDBTsfQ8hOP4J4sSoc4n8QRYoFeb8J9WPM7FyTQRuWq+NwiuRaK/1wxkTfZlVdxsRNsg3OT6HtEAPPR+nW23jy6ZzZ4uZpTqXBhJY326z0fQhQ9mppCy/aCFw1p1xQ5Ycb1RnT0OE6iv24/LXHdbfj0+D6XPSK3hJiCmEfE/4YzdUySPHNM2v14id30VTGyA1Kd6fxaA8UAKybeyaVCSy2LyME26zcl+z/cNM4ThlzBTFRfwWdVoeObIEdUKxvgm7lqxw/Imt2QXCnmDwPxryRgbCQbUDuVnnNwaxuexukhyw37WO+PSmQtFMc1reCxWmjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d9c2a3-3b34-49e1-c43a-08df0f6cb969
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 18:52:55.3057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKpO9qor/B0UA+FkTK71dGPISNKwJCSNNNVF0ywgjD9FZNvxVWUrbGx3AGIOo/bivWe8q/umw0SuycTJ6wzmOzXBvyuQStpQyj+qFVPAfsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB356129
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

On Sun, Aug 30, 2026 at 11:55:42PM GMT, Thasleem, Mohammed wrote:
> 
> On 21-08-2026 06:18 pm, Michał Grzelak wrote:
> > Each suspend test is executed per output. Limit number of outputs tested
> > to 3 by default. Add command-line option enabling execution on every
> > output.
> -->Any specific reason to cover this for 3 outputs?

Just to have maximum number of outputs covered without hitting
igt_runner's timeout. Here 3 should fit.

> > v2->v3
> > - add patch
> > 
> > Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
> > ---
> >   tests/kms_hdr.c | 30 ++++++++++++++++++++++++++++--
> >   1 file changed, 28 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> > index e23d5e4691..95a7344ceb 100644
> > --- a/tests/kms_hdr.c
> > +++ b/tests/kms_hdr.c
> > @@ -74,6 +74,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
> >   #define BACKLIGHT_PATH "/sys/class/backlight"
> > +#define OUTPUT_LIMIT 2
> -->if intention to run on 3 pipes as per subject make it as 3
> > +
> >   /* HDR test formats: 10bpc + FP16 */
> >   static const uint32_t hdr_test_formats[] = {
> >   	DRM_FORMAT_XRGB2101010,
> > @@ -110,6 +112,7 @@ typedef struct data {
> >   	int w;
> >   	int h;
> >   	igt_fb_t afb;
> > +	bool all_outputs;
> >   } data_t;
> >   /* Common test cleanup. */
> > @@ -250,6 +253,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
> >   {
> >   	igt_display_t *display = &data->display;
> >   	igt_output_t *output;
> > +	int output_count = 0;
> >   	igt_display_reset(display);
> > @@ -273,6 +277,11 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
> >   			continue;
> >   		}
> > +		if (!data->all_outputs && flags & TEST_SUSPEND && output_count > OUTPUT_LIMIT)
> -->add parens around flags & TEST_SUSPEND
> 
> --> should be :output_count >= OUTPUT_LIMIT
> 
> -->One more subtest: test_hdr also covering SUSPEND don’t we need this check
> for it?

Good catch. But we don't need to check for test_hdr(); after one pipe
has been tested, for_each_crtc() loop is terminated:

                        /* One pipe is enough */
                        break;

BR,
Michał

> > +			continue;
> > +
> > +		output_count++;
> > +
> >   		for_each_crtc(display, crtc) {
> >   			igt_output_set_crtc(output,
> >   					    crtc);
> > @@ -674,10 +683,27 @@ static void test_hdr(data_t *data, uint32_t flags)
> >   	}
> >   }
> > -int igt_main()
> > +static int opt_handler(int opt, int opt_index, void *opt_data)
> >   {
> > -	data_t data = {};
> > +	data_t *data = opt_data;
> > +
> > +	switch (opt) {
> > +		case 'o':
> > +			data->all_outputs = true;
> > +			break;
> > +		default:
> > +			return IGT_OPT_HANDLER_ERROR;
> > +	}
> > +
> > +	return IGT_OPT_HANDLER_SUCCESS;
> > +}
> > +static const char help_str[] = "  -o \tRun on all outputs instead of 3 when testing suspend.\n";
> > +
> > +data_t data = {};
> -->make it as static
> > +
> > +int igt_main_args("o", NULL, help_str, opt_handler, &data)
> > +{
> >   	igt_fixture() {
> >   		data.fd = drm_open_driver_master(DRIVER_ANY);
