Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC41CF8FA84
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 14:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8310610E8C3;
	Tue, 21 Apr 2026 14:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjSGmAdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6EB10E962
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 14:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776781933; x=1808317933;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/6k4LlW777P69l6sEwKddA+bm1R+6VdsJMOD3GWQ9ig=;
 b=UjSGmAdQKjW9nmUjdmUYOK+E69eNp0Z6SZcCgLZMqvPqSNFRHdwj91j1
 jBhaBvhwr+mXTfbUVw846SCA0qyhr9sBzjVnX0dn/aQrQwYkl7LcjX/Dz
 h0Aqnp4NcsVVC13ltx2+daE0PPHF2OzCHcke5ProM3Zw1LqovuNcKUh8q
 qXYhXzx+t46WI5t/TJmxKv01ueazP1B+KIj4+UbnaScbXnP7nDj31JcGx
 7q+JZfCimwODvxbQVqSGsreEEm8YnNl9wh7yTQj9A/GRbHs85cdIXh7By
 jABmefbt6Tcfu/1NTKqeRHdu11fciloTEvlD/QvXoppjVkkrSZvZ1agY7 Q==;
X-CSE-ConnectionGUID: 3eItv53sTuyyXAwu5ekJPA==
X-CSE-MsgGUID: P64sBBCcQy6IcBBNuCdx9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88413161"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="88413161"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:32:13 -0700
X-CSE-ConnectionGUID: UcvI7rNHSMO+/xPpgxqGkg==
X-CSE-MsgGUID: E1nuBXDeQ4G1z3Zjk+fGXg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 07:32:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 07:32:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 07:32:04 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 07:32:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZArzOruriaVi68oOpSRY/GWm3a114ukPb4KLxs6z7lTiEsxQe9Y5Wy5C1FIzVefpeIBt8rVBxU75DXk5RA48NFKjKoXnadkew5NDx+x+LFfkA6dFY6JISkY1JFegYBr/wWJuB+qFI4NmF2R2JC3xB1b/RS0288dt16/5OXWUJ/LM8/1PS2Xxy910jWSLm9XIYiSjfUXfj7ymKksSiIgzfj3WMbOvoS/fj0un92VQFDK1kJNpmUM59Gs0fY0k2xQdZzGo6jY1/CB8gBAdncsUUHcyYCkEGckifSZK3sQJn8P9Hjb9OQ66s1Sgb8AIrX3nLII9Do8d0lpsNNkpg5PcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGmtMRlktLPpkUXsCAYAGDmyY0CBfYl+7Ry5FOhgRkM=;
 b=WVb3hvclz0Zw5W8GW1qbUyCNJt+rrazVs5Rp31zSJOynmDtN+sM74yUJJXwm9IzCKgzPa2jYm1Ka23/YIV0anLmfJwX/4majWxHLpkxnvGQtbbGXdt0FoStrCcrT0uDhe3uMy9cxzO+5FRAL/NjJPQcR4xjjtoO1WUdntvx9Mvjucys84NtYTNtfH5G19RmGiOqryqin9pNnHmmk1AuaXzgabL08RJufQ6JQ1c3kR5QaHLnMitNc9KBLRBDYUx21dTxtxAkB4nymnsK++10S06QLAuwT0/KMPoLM3oGeriTfDaSVxfvv0uiv0KUf8JbV+iMFlZ2Nual6U3M8EuAZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8000.namprd11.prod.outlook.com (2603:10b6:8:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 14:32:02 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 14:32:02 +0000
Message-ID: <e2d8deea-dc49-4cb9-bddf-8cadd00d3bd7@intel.com>
Date: Tue, 21 Apr 2026 20:01:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 1b85a9b04681
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
CC: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>,
 <kamil.konieczny@linux.intel.com>
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
 <20260417041031.2187889-2-ankit.k.nautiyal@intel.com>
 <4b8f88f0-e1c2-4702-a262-651b3104545b@intel.com>
 <3bd2ed35-97b4-40f0-8d18-21e23f697826@intel.com> <aeIL84BK_pmBS48s@intel.com>
 <da72e919b7cbd787e793f0141697f7c37957f998@intel.com>
 <aeKFxTbWGjrh_N9K@intel.com> <aeKHmVtlO__WehBe@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <aeKHmVtlO__WehBe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: 761e06d6-ae53-4077-b9cd-08de9fb2c0a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: yhDPiYteMXh0imQEUVf+vBjwHQxN/s6RJQsBrY7PDrOEZQlEFnWwJKOYDRJG56wXgfZ5gTSjfAKSmGNIorITQCfP3diwgU+y88e9lPaS+g1ISpDoUGJ5Gqc9B0tkIt0KnJ6We352X8ia6MZmFzgh2M2Es3CWLJeMSfWhDRrKEp4+kVTc2IO7qFb/t2TAPcUZDwjmz8mzRYX5wCNbjCYwRMhcK2Ys4uRfwdIIW5TfZegGL0pev16oHabAP5hsnZyQ1YkbDBgPA3R/W+EpIlxhATqeWG3X/JFRobdhii8sbF07JJvEZl4SbvSgeLil68Po+uBYfiikilgQt+p/mFgh4cVx+l8puax2xKzmy4jac6vluoFiy022M9dp6nPMbBFi2ThFMA5vzuixh6UadhHNy/qh2pQd/bAYrXWkuroM0YAVEacqjfIC1Ac7lERcMtV8CBWE7soPppKFFbTyYkmkNneopdvrd75q2mZTPrTNr5gGHPY/rLOV8kywbD5ilS6BsiSU3r7oJg5/6G7V8INPNkCoLdN8z+QDVXvd9Y4PAGpdSYmUhTMHasFiZe4g2GO6dwkcgvNAhdlEKZdmHFT0q29Q++rBifxmk3hnvOMs6QOXjNHA3rhe32Lg4/MkMLz1rifSWcODGfgGNYjORuFAPxA+96632mcVWZuV9fTsTgXSDIFpPi3Xml6qBdczKJ/lq9d6acSkt/JQ3AWwSIu8E5HRnrPVYp45LXZrKaz5kHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGt4VUhYTk1qVmhKcHByYlZtVGozb0d4dWo4V2NyQzdlenBZRnFHREJqVHBs?=
 =?utf-8?B?d1ZvdFJTV201N3dSa1I2Z3pXWUM0cHU1UUZEMGZNWWJJTCtPNEhNT3p1ZjEz?=
 =?utf-8?B?VzZkc2ZrZVVHbEcrc3p4Q3NKRVlEak00Q3kzbUczaGJOYTEreUE1UG5OY1Yw?=
 =?utf-8?B?dXZJWDNDRVFZMHFxSERBWFVKNjY0cEhEa2YydUhRYXIrYlJZb1FDOXA2U1F2?=
 =?utf-8?B?bzR4cUI3bEtINDMyTWhBZmxqUnNxTmNybGZMMjRlSWlsbEhmZFp5aGFvT2h2?=
 =?utf-8?B?c29XcTFzc0pzWGRsZFdwWElEaFlXeDhuQjhXTVBmSDUwUEZwWHh2Z3cyR0Rh?=
 =?utf-8?B?cy9jcGsrT0R2WlVxaDhHM1FQQ0lnSlVpczhZN2kzOGF4UmVpK2JCa3lNUnpm?=
 =?utf-8?B?UnFCODJjSnNHaVhDc0VNUWZrRXZNV1I1cEo3dHBGaTZFd0dOSTdnVEJYZVhk?=
 =?utf-8?B?NUtVbzM1S0hpVldUekUrMDY3djZzelZHblZHYy9TTmUwcWdtb2VVRjJudFM5?=
 =?utf-8?B?MER3a0grNGdqMVZGcVFVVE5LZXpRVnBTMkk2MUo1Q2FNcFM3Z21RZndDT1c4?=
 =?utf-8?B?ZHhsMEk0b20xWXltV24xY3NRVHVVZEMzRVZEeURCeFVXZUhuRXpxN1JPcDZL?=
 =?utf-8?B?T0ZsYytWc2R5RlhGMG1NTG16NU9rcWxBcXJGM1JIS1FEKzdrcU5FaDZYTG5Y?=
 =?utf-8?B?MjFmUUpFd2xMVW81MHk5Ukptak4zalhBZ2c0MGZyQkFWUGlMV2t5c1BWMHhU?=
 =?utf-8?B?K2kwWE4wTEE4YWgwZkVEZmVIb3dHSkRZWWNVNHRFa1g3cU50dGxGSG05UXl5?=
 =?utf-8?B?VGUwaCtGRStCVTRzRVNRQXRGMDdHRWZIVHN1bmZpRDUxRzl4U3ZFVHZ2QVVD?=
 =?utf-8?B?ZUZ5QWF2b0tSMkJRbFI2ZE0rNWZSbmlteks0VDlxWXFKVHUwN1hKbnRIbEV0?=
 =?utf-8?B?ZTZWazAyR0lhZFhHWUdNWnpWTWp6SWJmRmx3SWt6TEsrWXpvbEhaUmw3RFVj?=
 =?utf-8?B?cDAwRS9GOXZGQ3B0aUlEZUpJKzk2Y1MxTjl4cEREOEdvWE5EVm1QaG9mdXdR?=
 =?utf-8?B?alZ5NDNxcm4rUHNqT3Y2cml0TVhQbk1YcTQyc01IQUpNdWNOcTNCTWFaeTBG?=
 =?utf-8?B?a1EwZWJWejdJSk5uNm43alV0RUp0TUsxZFJndE9VcWRBSkFjRmkzdldFZ0Mv?=
 =?utf-8?B?dVQzTUZqU0wzajRNMzRndUQ1dFRxUFo4ZXRGV3NEZmJ4SVBpZWQwS0JXamlm?=
 =?utf-8?B?ZHFjeFRCbCtJVllIR05sTnVzOGs0WTBCNGlPTFl1dVVZL2w1MHpGeTZxMCtz?=
 =?utf-8?B?TDVLMG9xd2xPRk9wRWRPOXdEVm1VY3ZsdUFqQlUwZ3Vzcm5SUG51OHczVll5?=
 =?utf-8?B?cnBaSDYvQ2lOaFpacWNmeGdNUEtLZE1SSTMyMmVKRHR1NnpMV1hWWVEraHYw?=
 =?utf-8?B?SjdQRG52R1Q3UWR0UGl6MlBzSXR1MFAwazFZRjZtUmM3bEhobXFBWU9QdDJ0?=
 =?utf-8?B?VVBVN28rWnJ4U1F4bSttQmpjYTNLMUlFTnd6dkhYYUtWQ21BOHVFeC8wTkEz?=
 =?utf-8?B?YndtM2FMRkQrUlFINkd4TWsybTJ1OE14aC90QUJLUDB3dGY0N1ZYdWk4Wm1W?=
 =?utf-8?B?WU81Q2wxNllIbkR6QVR2ZjRJOFd4QW5Sd0VBemh6MUlEa0lteERFd1AwZHdC?=
 =?utf-8?B?aUNPVTNob0NZZ2F6VXkvS04raDVSSDlBY2s5WEpoQXVuSkF2QzluamxETHhM?=
 =?utf-8?B?aWtmZU5pUERMZVlFTVJ2OCsxenJHbTdGMnVjZis3U0RabFFWODBsK201ekJy?=
 =?utf-8?B?L1JKWXVkMEZ2RTBtMS8ySFVwUW5lSXBPRWJOK3pNamtONHNUdzk2dkVwMGEx?=
 =?utf-8?B?ay9kcWJBU3gyelNmYnlRYk5OaHVQNndMNjZqUG4yRS9CQWxJaHN2UDRKbnMz?=
 =?utf-8?B?dDlneFBEYlozeWUvU1hRM0JBZUpPWWVtaGNpT1poZUdkZWR4Z2dYUDBzd3Bh?=
 =?utf-8?B?RHQvR3lsd1pPZXlNTWxVSm90MWMwYkRXd29BYWlNNWUzOFVsOGJ6YXhDYjlX?=
 =?utf-8?B?M3RKelBqeHFCNFRsRE5HU1RlZGVZMy8wMGR1aEJ3T0hvTytFdmNVZVd5YmFz?=
 =?utf-8?B?TzIyMHpjSldPU3FFd3dKOGdkV29QQzZ4S2toZ3VaSW5ZNnZGMFFFcktCUjVX?=
 =?utf-8?B?QURGME5IR1ZHODZXOWU5K2xzUUlwd0NJUzI1aERjV21XSG5uR3luUDV4M1Jt?=
 =?utf-8?B?akRCaUJidlJzTXUrQWcxUFBTOUdIcWlKNENucVVzOTFyODZUNUd0UERQWmlk?=
 =?utf-8?B?bEZVQUlQWU52a05ITWRiejg2V0dCMDR5cFFLVVlEd2owb2xiaUFuSmtVb3lm?=
 =?utf-8?Q?kC6ncxoB4XAzY+2g=3D?=
X-Exchange-RoutingPolicyChecked: HyKwo19BH/VAM5w1Sraa9sWNNZH8rLGgFOrx3PnfDa7etMOTahMHMQr8QGzExLzSQW5AuUC2GdaY/h6o8f6cXdPhsXyYtgggkZVRKEtVB3ncN7Gkh25o9yXoj+NwtxHwSpeRC3qacxgkPRuqhy+mV8RkWYPtpNpuOcZu2L7OZBy4WBQqNmIYBQmpyls97XP6Ll0cTWS1DWcAq5fezckI6lJ2nFZ4Pi5LK9H3RNKI7JExZVMhLtSgsJCHZ6p1tIv2lxakO8xQBSxap00PQ2K+CglgtPG4lRllNsfjd7MDlGM5FG78hxQkjMjtblnS9Ym7uyae6R6V437/oy4B1jmTTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 761e06d6-ae53-4077-b9cd-08de9fb2c0a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 14:32:02.1463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMTg1yckTxW28GO9NbCc4201VpY9mBlld0dHicGNYn5d5K2cEFe7Q5aBGi88qrTPUT3gELy66U7YnHj9X51uaXkQaoHtswma5Yz4VjkXgNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8000
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


On 4/18/2026 12:48 AM, Ville Syrjälä wrote:
> On Fri, Apr 17, 2026 at 10:11:01PM +0300, Ville Syrjälä wrote:
>> On Fri, Apr 17, 2026 at 02:54:32PM +0300, Jani Nikula wrote:
>>> On Fri, 17 Apr 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>>>> On Fri, Apr 17, 2026 at 11:47:14AM +0530, Nautiyal, Ankit K wrote:
>>>>> On 4/17/2026 11:09 AM, Karthik B S wrote:
>>>>>> Hi Ankit,
>>>>>>
>>>>>> On 4/17/2026 9:40 AM, Ankit Nautiyal wrote:
>>>>>>> Synchronize intel_vbt_defs.h with kernel commit:
>>>>>>> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
>>>>>>>
>>>>>>> Bspec:20142
>>>>>>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>>>>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>>>>> ---
>>>>>>>    tools/intel_vbt_defs.h | 1 +
>>>>>>>    1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
>>>>>>> index 6612d3a4ec49..550a9bfba868 100644
>>>>>>> --- a/tools/intel_vbt_defs.h
>>>>>>> +++ b/tools/intel_vbt_defs.h
>>>>>>> @@ -1090,6 +1090,7 @@ struct bdb_edp {
>>>>>>>        u16 edp_dsc_disable;                    /* 251+ */
>>>>>>>        u16 t6_delay_support;                    /* 260+ */
>>>>>>>        u16 link_idle_time[16];                    /* 260+ */
>>>>>>> +    u16 joiner_enable;                    /* 261+ */
>>>>>> The variable name should be 'pipe_joiner_enable'. With this updated,
>>>>>>
>>>>>> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>>>>>
>>>>> Thanks Karthik, will fix this and send shortly.
>>>> How was this even different? You didn't retype these by hand into the
>>>> igt copy of the header did you? The proper procedure is to actually
>>>> copy the whole file from the kernel tree.
>>> Yeah, this. The commits aren't in the same order as in the kernel
>>> either, and they're missing one.
>>>
>>> I've scripted this years ago, for both PCI IDs and VBT defs, and I've
>>> shared the scripts too. Here's my current version.
>>>
>>> Change KERNEL and IGT paths to yours, update the repos, cd to IGT, and
>>> run.
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>> #!/bin/bash
>>>
>>> SINCE=962601ac4c78
>>> KERNEL=$HOME/src/linux
>>> IGT=$HOME/src/intel-gpu-tools
>>>
>>> declare -g -A map
>>> map["drivers/gpu/drm/i915/display/intel_vbt_defs.h"]="tools/intel_vbt_defs.h"
>>> map["drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h"]="tools/intel_dsi_vbt_defs.h"
>>> map["include/drm/intel/pciids.h"]="lib/pciids.h"
>>>
>>> cd $KERNEL
>>>
>>> for infile in "${!map[@]}"; do
>>> 	outfile=${map[$infile]}
>>>
>>> 	echo "processing $infile -> $outfile"
>>>
>>> 	last=
>>> 	for commit in $(git log --reverse --pretty=%h $SINCE..HEAD -- $infile); do
>>> 		if ! git cat-file -e $commit:$infile 2>/dev/null; then
>>> 			continue
>>> 		fi
>>> 		if git show $commit:$infile | diff -q $IGT/$outfile - >/dev/null; then
>>> 			last=$commit
>>> 			break
>>> 		fi
>>> 	done
>>>
>>> 	if [[ -z "$last" ]]; then
>>> 		echo "last update to $infile not found"
>>> 		continue
>>> 	fi
>>>
>>> 	for commit in $(git log --reverse --pretty=%h $last..HEAD -- $infile); do
>>> 		prefix="${outfile%.*}"
>>> 		base="$(basename $outfile)"
>>> 		ref=$(git cite $commit)
> I presume that's your own git alias, or at least I don't have it.
> Would need to be typed out fully for other people to use this.

Right, git cite is a custom alias.

I already had it from something Jani shared earlier (I was CC’d), so it 
worked for me without realizing it.

For reference the alias is:

[alias]
     cite = log -1 --abbrev=12 '--format=%h (\"%s\")'


Regards,

Ankit


>
>>> 		git show $commit:$infile > $IGT/$outfile
>>> 		cd $IGT
>>> 		git commit -as \
>>> 		    -m "${prefix}: sync ${base} with kernel commit $commit" \
>>> 		    -m "Synchronize ${base} with kernel commit:" \
>>> 		    -m "$ref"
>>> 		cd -
>>> 	done
>>> done
>> Good enough to put this into scripts/ with a quick howto at the top?
>> And then reference it from the generated commit messages so that the
>> next person is more likely to find it as well.
>>
>> -- 
>> Ville Syrjälä
>> Intel
