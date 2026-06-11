Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C242CCD98C5
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 02:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654B710EC69;
	Thu, 11 Jun 2026 02:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3kehISJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C3110EC69
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 02:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781144098; x=1812680098;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=M23zS5vp6cxu5284yPSOXZqo3IAk6HLrXshsK66WFOU=;
 b=I3kehISJ/ft2F968ij+XO00Y7WSbs/IWM2o5eXhQioX2kXZErSk9lYgH
 q1fqbocbqczzLQxogDWb58VsPAjSTr385juteIpDdQxRDbh7izMqL2Isr
 OzrgVAGGKSW0/vq8/hNzqeAvTUeyXlIdOt/yzLwY5/NnaqCd/a5/cSIPQ
 +VtUbb3QMG7SiqT+IjNy8XtgfwJyUgzEo9BNxhzN7B82K7zI4EXNZXQj5
 3nZy8LV/zXxrCpsF2Lo7GsB6kaMymfaPu8DkVzTMLMX2H2XP611kgTppf
 9S3g2T644HFJ7rTjM0LJ1p9Wd+ZuWpi26WckDMCkSdR4tkvEokdW14IM3 A==;
X-CSE-ConnectionGUID: EI6WX7+gSRGI+OCuVxp/0A==
X-CSE-MsgGUID: zYmmYsBERF+0cjLPFdio2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104615840"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="104615840"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 19:14:57 -0700
X-CSE-ConnectionGUID: Ka3N9ksfRZyEvQ24TuUa3A==
X-CSE-MsgGUID: fwhobdJYTAuh3rkftzwDvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="245223029"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 19:14:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 19:14:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 19:14:57 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 19:14:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGs6hkbjUBbkC0o9QgLRKJAazf7otbU4znhh9jmM5Fx/oPqmPEK9P6nMreOLYDtpyQqK0Wjf5xz3eQosJ5tr5C3RqVfyqCFG0P9IXISkP2WyhnXuJQAn4n1qdce9iXD8ABag2RdCI0N4bm8CoQi5/2sCCJ2P7cz89Am+M8UaWOUdZ0Q1DYAfH6+81XEhgnCy1bHvO0lXAdoSHKHMow5s3VPfVcI1ttb9obbaocQ7PTc8uendLnKNbXjYbv/wJQQBu2XsVKZke5em2fAD2RynVwuV+yRI8XVCb1nl4en/9GvM9UML3ITWllEwadn/Egt8fC2ZTiwEhz2BFqG8VtZhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAMuYTlPeDaF+znMnUdJ2VTSGzRUcnGh9EwoOg2+Lw0=;
 b=hsL+5F7SjdUmpMI9mm9no9bu1PaHAgtT3InvyDF+SgqfcbqKp5W7UGMOVQE/ifhyD0pUEn5wom/uj45BhFt/qXgxIOHPbCXVJiBEEKDRd/Jy8vHe7uiaXaYV5r6Q4Mo/szQzOhkFvRFfrEhc6AvvY5e6stULgF/dGELlgGWKqstJ0JTWjXC1ROaC/LtTEw+MapyFLhiG5zfguXebUvriHy6MrCOrbVuWLpwlKRRpZXr6z8BVraaKgBYa/8CTQpPNg+zdksLwQIkZnYh5UVgZ1N7k9FpUQIFXYPGukw8CSkzBfEG/XnYeG0+qZ5W5pmGlme5w6l9TzAZ7ERlHhXMwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 02:14:53 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 02:14:52 +0000
Message-ID: <c88bae25-6b0e-48d6-ad3f-00a7a8ae1032@intel.com>
Date: Thu, 11 Jun 2026 07:44:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 5/5] tests/prime_udl: Move into intel/ and add
 documentation
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260521174820.167237-1-kamil.konieczny@linux.intel.com>
 <20260521174820.167237-6-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260521174820.167237-6-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 64719b89-8e37-4484-e226-08dec75f387f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|42112799006|366016|376014|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: t/kaxwpH8a3N0DeRrPd2UD8zmMsIBUeBkNZbNpM2wAfmvPbKoUxSn5k3Wz3XT7jUDGQjnqyI5HfKumCx2sCGvlkoyIzEeHQKhRkOQWZBLlglkpAbVklt8VHs7ZLOh7Wed4Un3PBuIMhLuEXvqPFKzFTPDQs8ELGIQ7xMH5r9rcJomW5jp/ZSAzgtWZ4Fce32mBJYvwfhtvTQ8AlUIDUMWRzLZc6PAtkdI7o4By1MiHe7gb4pGP7/tLjq3ee0s1DN9CtItJm79B/Tc7+Z1t/kHJnB/0tppcVBxxiBAmsPbGiKBKzfGV60hHJ9GqsNV/vwJ5DoCeUepXPDu5HizUc297+0ZBHU15dhCjBdOz4QQeUZEFwtahySiTa3P3T1iYz3x9+d0UC9bqM/H4dPflQo4TkYFlu6VQDYiKKzUG6gqTCeOk2XjW/xHx63XSnvmh8ah1guie3XKL8OcKx7jUx1VmrgNLMl3QdVQaBocLVPi6N4UzU6als2v0H8i59sAW6evkZse1znecY7wfpnaq9I9fgWD/SPw60WXsgngAtFCO0OozGRUn1u49zuHgTsUmtsfam+QDZYtxQIixqPd1R69V/Hs5Zx5cMotUqw+vHfEoMpON5Ft4LehWpkMmsOsQEuup06Z7pLwxJofbr8X643NHesFk0EDdU15Jjha2p/0amqFZ5duyJTu/Sk7S0x3eww
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(42112799006)(366016)(376014)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHh3UXgyazltZ0NtZGp0enlTTXlMUlBvd2p3dmlqRDlPS3o1QXFMUmVnWVA1?=
 =?utf-8?B?eHRqNHAzL0g1YlVkMUQ4bUkvcVdteDJJRXVQYk0raFMvSUwrTTRpSHVESVls?=
 =?utf-8?B?N0hKS21jL3FKMlFJTGRuL1ZBSTFXRUtFZU9EdTJhNjZZc1BabFJLNEZPbFBl?=
 =?utf-8?B?RWVjT2g2Y0E0SkozOHVQNEtxQXNlMkdtZVJJQ3Y4SU1jaGdWdlBzUWNrUGRQ?=
 =?utf-8?B?eUlWVlN5TWRaSVBHVFU2M1owOGs1Q3BSTkdaNUl6MmN1aG8yYzhzamJ5S3c1?=
 =?utf-8?B?MWNaN0ZLOXB6VlpMYTVGTjNCTGh4MEpmalAzd24wcVNGK2l3Smx1L3ZNMkwr?=
 =?utf-8?B?TkVTdVl0RUFvM1lkeXljeFIranJBOGM0K1VQUFFyK3g0OG5UbURYRkR0UGt2?=
 =?utf-8?B?THB3aVg1ZGJNOVN5Nk03Y2hiM1ZZMG5QeU1nTUMvQ2tKZ1ltcFFWVFFlUGt6?=
 =?utf-8?B?cWJucGlwa3dFWUg3aDRjbitiZEgyVnc2aTcwSGNxb1R3dEV2MEhKUFJxS2xu?=
 =?utf-8?B?ZzQ2cUg5OG9DVmIwekdwaWs3NEhuMDdBOFNXNEpEOHZyeENKMWlSMzFUUmNw?=
 =?utf-8?B?TnpYQUpadi9VclNNOXFTWXpIWit6L3ZNbmdFb0c0SWdlam96aEJxTFdhNU9a?=
 =?utf-8?B?cTFGZkVTbTBoVk43cnNsUTVHei80dWNuT2ZKSVBJWWNqbU5yL2xNV3JNeXdT?=
 =?utf-8?B?V1B3cWJ2bWkrRk52cjdER2NXN3d4SlBGUTduUWJCTjd5QUZOcFlzZUs2ZXV1?=
 =?utf-8?B?MXpYMmdhTjdSUWJPcmorTCtCeGM3QkdVaFZheWM1VnI5NXlJZERrZnpETmJN?=
 =?utf-8?B?UnNMTkRmcGw0M1JHNFR4MjkrK2tXVHNwU09oMk1PRnJXWFVsOHMxZk5yTEZ1?=
 =?utf-8?B?aFdDMWlSRmp3b3cyTTZlaVFtb1BiNTZZalFabEFNbWR2QXNDK3dPUTBnSHlr?=
 =?utf-8?B?WmVKd3R0V3UrZmFVRVdFcDgrYWRsa2krbkNET1EwSmhaRTVRTXJUM2NZQjBC?=
 =?utf-8?B?UHJFOXIwVHVLT0g4UG1HNXR6N3JPTVZrVitpdUtvNDJjVGN5ZjlhZ1Y1VUc2?=
 =?utf-8?B?QjkxVTV6VEdWWTRYZlRaZ0wvREFDU05yZGxwNXIxM3hhb1R3TTBVaEVhejdj?=
 =?utf-8?B?ODJodUhGNmN0SFcxclM0TC9wa3YxckxETWRFMCswQU5tYkpvTU9uQ1h2Q2pR?=
 =?utf-8?B?RnFxUVUrVG5UY3ZKWXgzUFdrang2Y1hIeGhJMUNNU01nVklVcG91UUpDekxn?=
 =?utf-8?B?NFJEdFUzb21haCt5bHlnN3lyQ1J3K2xwNDFWM0lFOGI4RnlnWUVCVFBoQWoy?=
 =?utf-8?B?UFM2ZGxJNk5WUkhTczhteVZYM2QwaVZQL0cvM2VlN2dIQjhEbUZmTysyMnMy?=
 =?utf-8?B?WGVYNG1iV2tQcWdTTzBDVUFrejQrUkU1R2hzM1BPWGt2LzVpNU5HWDcvN3Y2?=
 =?utf-8?B?bXFIUXo1Unhzenp5K1hVZFl3MUNSdWE4NlhlblJkWU1KQ1Fidm9pMWVxOGhq?=
 =?utf-8?B?eExkSjAvYXBpNlZteUloYWI5WFJQdUd2SUJMR3BIVHJCTERBM0dqamIydExO?=
 =?utf-8?B?MWlVNWxFUUw4R25nL29pa0FTQ0tOb1Q4WWR3WmZzc3N3eFVSNUhqSElwQm16?=
 =?utf-8?B?OVVlZmxFeVluV1EvaWxuSmFncVZuTmQvK2hJa05XdTlwMFQraVdlcW1odmtH?=
 =?utf-8?B?QnhlNmZMRTIyVUlpZWxPOXNobUNoZXJwcXNQT1FJd1RpeFJwalU5SzVHOXZG?=
 =?utf-8?B?RXlvcDVHK1RzZ2RwcWhqNlNkbktSbXdjaFBkNlk3WUNFRDFpdTRPQWc2Q3BS?=
 =?utf-8?B?dWVOQ1pLK0lDdko0T3doRVlGYlZEQkRSZ2xNUlducU9FMWhFTUlIUEhJNzg1?=
 =?utf-8?B?aWg1cHlrQnU3WXJnelRvNm5vcElpY0YvY29sT0g5anlaOEtyb3dyVE1QV2Fk?=
 =?utf-8?B?V1pwb1VjUmNITVp2TVQ3SFlsLzRMeXJxUFJVUG1BdklUekZZRWd0MkRiWS95?=
 =?utf-8?B?WGpvY01LU0hpM2oyV01kemtqQ1dadG4yb2lFbWpTRTZnNFhqWHVSbDBiaTA5?=
 =?utf-8?B?VWgvSURhNTJTUWZBMFA3alRHdFdlaU9zWTNrVTRvTTBUQ2VERFovS1VFUTlE?=
 =?utf-8?B?VnVaYS9pZDEvUzRiNHp1VGZxMkhtcG1YOE1KdEMxN0htQ3dCWXpSNkpDbEpO?=
 =?utf-8?B?QzU1MnQ2cU45YnQrSERlOUt6cFlTWU9ycGhTT3poV1RmMkhaQXpDZ1BhdHlM?=
 =?utf-8?B?Rlpld0l6UDlTZ0RCenpOK2FZb0xlWS9iWVc0dW52NEpFanNzaFdoa3VFQ2hj?=
 =?utf-8?B?OHZNd2JVRi96dWkxRlg3WDFJSldWQ2ZSdEwzSTBYejFock1DVnROQT09?=
X-Exchange-RoutingPolicyChecked: A7f4/3EPq8j44g8pLjdgB82AcSYg9rrz9CBHyIWnPj1GShRB+E2fnOmBnrX/UPvW5ZdfKBzuU2A48hB4awfkNmP6nU/dKxW7EuPXfLsUKEO5c89z2S+CfaiB9Agq/QCoykdyXyOvYaxaLh5y+pitQ0blUn8SR9gP92ZYAuhzDS7nXgZlckj4FqNoL2TjCCvTi43edtX9G0eol1KPX571PeogiDGt2xzyWUkDz9p2A9aiT+gw3/gtF5AjOd861BmGdngpxiuBS2fpHJLPv7Panjf1XaAJCtUKIefqLX93BG0cy7y5OCXp/7JwVPr+ysGKHvclgeLOGE0R82yMXRgYKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64719b89-8e37-4484-e226-08dec75f387f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 02:14:52.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9rK8XFFgQwpkUj1YyBbuZNtAm/SS+IEaspE9jf4MxQ7WT9Nw8DWtDBmS0sn6QsFEzqvSgz4UlTpuRolwqlA5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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


On 5/21/2026 11:18 PM, Kamil Konieczny wrote:
> This is an i915 test so move it to tests/intel/ folder.
> Add also documentation so build will not become broken.
>
> v3: keep old name, add documentation in subject (Kamil)
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Suggested-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/{ => intel}/prime_udl.c | 17 +++++++++++++++++
>   tests/meson.build             |  2 +-
>   2 files changed, 18 insertions(+), 1 deletion(-)
>   rename tests/{ => intel}/prime_udl.c (88%)
>
> diff --git a/tests/prime_udl.c b/tests/intel/prime_udl.c
> similarity index 88%
> rename from tests/prime_udl.c
> rename to tests/intel/prime_udl.c
> index db83152fc..c6ef4a750 100644
> --- a/tests/prime_udl.c
> +++ b/tests/intel/prime_udl.c
> @@ -13,6 +13,23 @@
>   
>   #include "i915/gem_create.h"
>   
> +/**
> + * TEST: prime udl
> + * Category: Display
> + * Description: Basic set of prime tests between Intel and DisplayLink.
> + * Driver requirement: i915
> + * Mega feature: General Display Features
> + * Sub-category: Memory management tests
> + * Functionality: prime import/export
> + * Test category: GEM_Legacy
> + * Feature: prime
> + *
> + * SUBTEST: share-import
> + *
> + * SUBTEST: share-import-addfb
> + *
> + */
> +
>   IGT_TEST_DESCRIPTION("Basic set of prime tests between Intel and DisplayLink");
>   
>   int intel_fd = -1, udl_fd = -1;
> diff --git a/tests/meson.build b/tests/meson.build
> index fe0818118..0207b7da8 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -72,7 +72,6 @@ test_progs = [
>   	'kms_vrr',
>   	'kms_writeback',
>   	'meta_test',
> -	'prime_udl',
>   	'prime_vgem',
>   	'sriov_basic',
>   	'syncobj_basic',
> @@ -239,6 +238,7 @@ intel_i915_progs = [
>   	'prime_mmap_coherency',
>   	'prime_mmap_kms',
>   	'prime_self_import',
> +	'prime_udl',
>   	'sysfs_defaults',
>   	'sysfs_heartbeat_interval',
>   	'sysfs_preempt_timeout',
