Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8998C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 07:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5266110E726;
	Thu, 16 Jul 2026 07:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wc0WQDIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B7110E726
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 07:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784187464; x=1815723464;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cGoCMmQs1j5GuMglTfcE27xUeg75p0RuF0XiNZ7tea8=;
 b=Wc0WQDIistMTstisz6BcuM44Ey8+rzvexUSsg1yzfRdAQtyzlvESvcCa
 pFxG8q+unXwr76vmBbnjzSc5fNE6+4prgZq6ZNd17muemlY4W61yY2Phq
 ARX0OEKZiA3p/QaM3ELaNzIRXwADgmF+lGGtiNvKT2U/hja3kLRuRCxoA
 LA9djtYc5hnbf7ridjSi/GT/uRd2kSOtlPhevoWhMqHVGJ6w2XvoqrlCv
 ixX5NVYfXv7QfrSAuuT/3Izv8Hdz2b0/4uBA0yfiuVA7ilTrKH/n7w643
 Sms7PtcCWvGA3112Eu7ABF0WDTANpmmbbiukmdz2OI7WjkaAwwrIKrWoQ Q==;
X-CSE-ConnectionGUID: PwMqP7yWQumrGwM42quAew==
X-CSE-MsgGUID: DuL01IVATtWigfyZBHnSgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="107635240"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="107635240"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:37:44 -0700
X-CSE-ConnectionGUID: BXENSDzSSqOyBDmDD4HN2Q==
X-CSE-MsgGUID: jAdWB2MNRm2E3kZd9xp17Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="279685227"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:37:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:37:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 00:37:43 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:37:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvP87twVteRFnF3kY8vcYisUB+6P5QFvU8KPBRM2o0jT6rDZbKJ0GlNHPfLeil5XFYt8OyJi+pnJi33kLlH9XtttlbDtXlNGLJuJ1GflWV0f7pJeeOeKX2qNxq7lF1b3yOiV1VI6M34PQqALuMXNS2reSBLFn8t8YK9tTwxKUBGfwk9RDOatIV7lJPvmlutVCdsJThz1moKzgfPKOTnV5tIR2FCeDH8qOqySGPi13NeQi6qzmeBfyNEqPmgDqNH2rsJngdYEwOEaHeHr3wfNFvXdBSZtpKKuM3IQL68dEutxXquwSlMzIHrhFGqng/AHoLBoileu2y0/q5RFdr+xqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yroHpUYByWdlE1ZFBSwoTSoXM3x60mDS6qCORIpRJIM=;
 b=XZKrfvQ+CqBiXmOrQKpBtzQiVisGNjJQhJEn9+uilddB9e5lWO0biTHsHtjeAL8jIP8LmRhdJvd3LVOMb5sGgNZ2cELzjuyjjniIatgglf42irJ+8WLZmtZwxAaPp28x4y8unH4YsveOT2H7nB4ANsXxYcRnns8rOjxHcu6Ot0Xu4g3HmoeH1KS6MrZtQSZYDhXEP9Bwoli26m8fCxw3QzCBMTwpc375oIRrm+IDB8CERbtySCbkR7PPHlBdNVOoXAWJ7YDUY5P0ZaafyugjoohrPtge4RiadK9d9pECwRTws8vaqDvfLQirPL7jA4ZuAPLQZMvlrjiMM17sHCy0xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 CYYPR11MB8329.namprd11.prod.outlook.com (2603:10b6:930:c7::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Thu, 16 Jul 2026 07:37:39 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0202.014; Thu, 16 Jul 2026
 07:37:39 +0000
Message-ID: <f3f2e10b-be18-4b9f-b196-7966920ce3df@intel.com>
Date: Thu, 16 Jul 2026 13:07:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 04/12] tests/intel/kms_frontbuffer_tracking:
 consolidate fbc tests skip checks
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
 <20260601204407.39934-5-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260601204407.39934-5-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0263.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::11) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|CYYPR11MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: e2151f6d-fd01-4d25-cd03-08dee30d1c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: Z68Arf0phrWKds34bp4mB4RIGmmzo+pcbsQgGCdBzqa3uktsa8CYKpktxSUnYlDP7zCVZaBe0l6DifckhbTCwWQ6SxOO+CiEjq8OloRh7UueoSeFX4ubuUJoDNCYMDvhn59eXKNXk6ygRMUa2AF8FVcKVBLItb1hON3lf1M3io8QE7tEUMVGQbsiR7fmAswGH1019u7HicTXI9HZSYGqbrDGDYjetlv/xNNN/H5zAdSzeWsbELMF+FsVQLHHJbzry/pEDHYmyR47CECumC+gNhhWMWeh2N5YA6C/kVD0rYJMiy09K4zkkmHtudhA89fIuLSJlIAsxm6in60hR7apFv8YQoPVqj5Wp+Tc0p/rhYYVGmsilCxhWZxvXmvOxMqtxLov3Q3buq0CkP0ZY0SJ6RHZ5e2vctB0Cck7gJ9UJXXWHZXdr7Oc+rEj5jLTORy2RLST6QCNhkhoav+UiSOOp/9P7+AReY1Kl2z491Kgh0UB6yrp9a6E3gDIcSEUYmSSg8LjRZZwl4Ed/l6otODskSfPaz0TnBDyLRjAuPsV+gdJNBEo/5hTzuntezafq+2h7rhGUgNC7RzRh/XO5lZ8jDp7X5GLQuKcCszZf9dH1O8w/gv0YQMGzYJoj5ggG99uuYPbTFEo2kQodHyNlofjaUMp+ML67TB+/z4kz+g2NoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rit4VVphMC9PSVVkQTIzK3NYOHJLVTVNNU9SWU1ERW1BeUc5eDlxRmI2Yk9j?=
 =?utf-8?B?YStTeXNJdlNBS29LOEF0T2pDYU9oKzF3amdFc2FEamVOQnY2QTRNcGxGZkpB?=
 =?utf-8?B?bGg5QVZHYlpxbXNyQUEvbTRZZjJ4Q1NlVFFUZ21WdkNkc3lROGdTNStDQnl3?=
 =?utf-8?B?Y0Y0OXpUTkgxN254WGgwTGxLMUVrMVNjQUo5WkpnSWM3c2NtQWVTb3dHSHdm?=
 =?utf-8?B?TVlxYzg5V2llaWpMYlNOMjd6eDN0L2l1RVpEZWVNRmxkRFhkcGZBSjl6cUtK?=
 =?utf-8?B?Yi95WjlscVZRUnY2dTRHUjZFN2E5VUdYWXB6U1BLT3pCWkVic3hBYnNEbDc3?=
 =?utf-8?B?cVlKSzFDL1VWMWZ1aVg0Nk9sMEY1Wi9SUmZ4Y3VicktUMDBpTFB2WDZtRUtX?=
 =?utf-8?B?QVNEVnZMTWl4bG1ab0IwdkV0OVlqSUZhSXRZVnZtWHc3b2p1YWFMN3hna0tj?=
 =?utf-8?B?cFMrYlZHQTlDL0ppRW1NWVBwdHhTN0k2aytkK2dZdXY1RFp4Q0NDUmpnYU5D?=
 =?utf-8?B?Ykhob1F1YU9nTko2cjBKN1NDa2RKOGNqSTQ3dzcweUpndGZqcWVZbnhTcEVv?=
 =?utf-8?B?NXZTTklBNlQzUW40Z2ZQakI2UjZiYmdFendEazRubnJLbmFXd29iVi93NFFL?=
 =?utf-8?B?dFl5MHZOL0V4UlhLMjk1aVk3dUdISUE4SXNNN2kydXE4WlZ6TzJ2dlpnL2Va?=
 =?utf-8?B?N1J6Y25OMGhBRG8wMkVQUWpzMHB2bmtXVWdQNVpjbCtvbGNMSGVIbkZCek81?=
 =?utf-8?B?SzhTS29yYjRVYjZ2bXFoRWFuRE1IRHZac20rM3FzTitNRTFYYmpYRzc0dm9R?=
 =?utf-8?B?V01RWHcwaXRXRWt4N0w3SFJIS1NTRS9KWkpWY1R4L0NZUTBMM0RnWDdPdGRT?=
 =?utf-8?B?RU9kYktjL2JIbkFCVmdwNFdXaW5PTFRpRzN3NW9BU2dpTldNVW03Tkt4NVB2?=
 =?utf-8?B?c2ZKZkRZRkJyblkwaEIxL2x6aEZkSk13aWxMcldtMkpmT1lvK3NGVVZpTGJB?=
 =?utf-8?B?eTRKN3NzTlFNUkRPQzNEaFNoUEJEWUNkNWdFdFJUMlhGLzUrRTJ0QUlqdS9z?=
 =?utf-8?B?TXdFRnZqc0JudkhyT3NON2t4ekQzV1dNeFZrVkdYelJuT2NxTithS0pZcWI2?=
 =?utf-8?B?RFVzQ2NNdUxZOWprMzhnUVJlNGNmMTVpa0QzZFluYUZ0d3BqejkyY1N2VWVF?=
 =?utf-8?B?cEJWbG82M2xxNUloU0hpRWNwbU5KMThmdHo1enJ0VzhreVhaQ2FzYmdhRDNm?=
 =?utf-8?B?dnltVmxjTXd6U1VmRnBOZ1UvTlpKaFBKRzREWW1ZM3h0UlZMTFExbStHSk9Y?=
 =?utf-8?B?TDU4Q0htWVVmRWNtdUJ3UjBDdkVBd0gySkxxV3ZCc2cxWW5JVml5eEUrRVRU?=
 =?utf-8?B?cHA4RUxSSUZSSFlhbXhYY0pocktDdGlHV1ljalRrRmNxSjBTR0ZSQ3dMZ1BE?=
 =?utf-8?B?ZUwxNnY2Tlk4MHdnZm5ZMmV3TXROaXZmZWUwSzcyeCtqWGJXdm9TbldIaTA2?=
 =?utf-8?B?RU5wcFRlRm1TWkRGMllKSGtnVTJidFlkTWxkck9PdGkrdm84THN6a3doT2Nn?=
 =?utf-8?B?bXJmMFA0YnBMeFFMaUhqNytpcDRDK216M0VhOVZ0eXNDTGM5ZkpYa0tSM21V?=
 =?utf-8?B?RnFJTjU4ZUpnTVRkdWFCR0k1T3FGU0xYak1FQnZueGl6dFVnMDlVbmVRV09a?=
 =?utf-8?B?N0x4SS80eXh2aVlIQUFDUmVpYUh6L3pNdDZwTis4UVBxUXJ1dHJPSDQvRTJL?=
 =?utf-8?B?ZjFEODc0UTgxOGhoajRka3hnME5EQ2dZQSt4MWtkRE5aV2RDRW84amVRNnFM?=
 =?utf-8?B?NHdvZUo3Um1zV29vTFJDMWJCNHJsSFQ5blo2dGgyRStuU20zbHNhODRLNWFB?=
 =?utf-8?B?aWc2WngybmdOQ2hJVTF0ZXd0LzVTWDhlZkNqQ3ZKUVYrYi9mUDFUNXl0U3Jj?=
 =?utf-8?B?V3BWREpvcHlYaXlOcW1hRlB4RVhTSUh4TlkxKzIzU1JnaktDQ0FXUDdqeHl1?=
 =?utf-8?B?dVNSR1dXWkVDNlIzSjZVNmFtZW5QMXFWdklTWWxKcTl0elBBOXIvVWtkbmZB?=
 =?utf-8?B?amhYWmJZS2ltdUhyZTlPd25pN2VEM0pjK1NCQys2d3ZHNStLUWhTTlVXTWdp?=
 =?utf-8?B?TkJ5aVJQa2k1Q0hOS3EyUVY0aVJSWk52c1hTWGNTTTVyczc3N1FDMjB4ZkRQ?=
 =?utf-8?B?RnpvL1VuNFhxMFVlb3lhZTlBT3JPR2RPWk9Wb2dkR0dkdE0yOUNvMEZHQ1lP?=
 =?utf-8?B?Z3VhTU4va1YwSGl3M3E1SWZvVDVtWW5RMG85NDkxemExNk11dzFRZXlQTW0x?=
 =?utf-8?B?VkdURmg5dXMyTUNieEpkeEpxRjR6eklZa2dDd2FHZHNSWFBCT2plZWlVSVJW?=
 =?utf-8?Q?VtVxvFfeWFXjjtNw=3D?=
X-Exchange-RoutingPolicyChecked: DvBaKJOgcDIpX9f1nG9eiwo8OSc6nTQy66yK3IwG5/5/OCj6Dx8iqwOwidrm2nBwjzniSJ8qJhVtele/azHrhf35ue+sldW8FhJl82c89xdTHJA5O+z2UHAgQpbxeRv4nCZDYhhojcy5NNtPohj22InrUZem4KeP4oU6TsL8HDAKP46e9obXlNMHOSyVC7q9odQjLJPdce5BvRQZp61yIzL6oAKyjDH0IK6NlTmcRRWXFPabh12lQ/5S6C3KUOvPkCVKRkJ9QY2swwBm6Rs1RP9wshJj+5fgaKVkowrX4F7LamVF+KFrG/xNYl4UvWyp/iWFsWQMSbHMSF3tePrfBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e2151f6d-fd01-4d25-cd03-08dee30d1c87
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:37:39.6188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YO5WUe4SAz50bJgfc4wHc8eIHqkAl0cUJEl45IxXGt4ITn7jMaX7ybFuSoO/AOGWQc1ukFgg+8gApsdGiUDMD1jH2Tsle7qMgYSMtZMSc9G+zVJUszslSVjR4Ut45al
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8329
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



On 02-06-2026 02:13, Vinod Govindapillai wrote:
> While looking for "no fbc reasons" and decide whether to skip any specific
> fbc related test, read the debugfs fbc status only once and look for any
> skip reasons. Move this as a library function so that other FBC specific
> tests could use the same library and all the skips reasons can be
> maintained in a single place.
> 
> v2: Use the correct test for status comparison (Santhosh)
> 
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   lib/i915/intel_fbc.c                   | 37 +++++++++++++++
>   lib/i915/intel_fbc.h                   |  1 +
>   tests/intel/kms_frontbuffer_tracking.c | 63 ++++----------------------
>   3 files changed, 47 insertions(+), 54 deletions(-)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index 4e629097a..5692c6af8 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -63,6 +63,43 @@ void intel_fbc_get_status(igt_crtc_t *crtc, char *fbc_status, int buf_size)
>   					buf_size);
>   }
>   
> +/**
> + * intel_fbc_found_skip_reason
> + * @device: fd of the device
> + * @crtc_index: crtc index
> + *
> + * Read the debugfs entry for current fbc status of a crtc and check for any reasons
> + * why FBC cannot be enabled. This helps in skipping FBC test cases where FBC cannot
> + * be enabled. These no fbc reasons are defined by the driver.
> + *
> + * Returns:
> + * True if there is a reason that FBC cannot be enabled otherwise false.
> + */
> +bool intel_fbc_found_skip_reason(int device, int crtc_index)
> +{
> +	const char *const no_fbc_reasons[] = {
> +		"FBC disabled: not enough stolen memory",
> +		"FBC disabled: stride not supported",
> +		"FBC disabled: plane size too big",
> +		"FBC disabled: surface size too big",
> +		"FBC disabled: PSR1 enabled (Wa_14016291713)"
> +	};
> +	bool found_reason = false;
> +	char fbc_status[FBC_STATUS_BUF_LEN];
> +	int i;
> +
> +	intel_fbc_get_status_crtc_index(device, crtc_index, fbc_status,
> +					sizeof(fbc_status));
> +
> +	if (strstr(fbc_status, "FBC enabled\n"))
> +		return false;
> +
> +	for (i = 0; !found_reason && i < ARRAY_SIZE(no_fbc_reasons); i++)
> +		found_reason = strstr(fbc_status, no_fbc_reasons[i]);
> +
> +	return found_reason;
> +}
> +
>   /**
>    * intel_fbc_supported:
>    * @crtc: CRTC
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index 60b86e366..32126309e 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -20,5 +20,6 @@ bool intel_fbc_supported_for_psr_mode(igt_display_t *display, enum psr_mode mode
>   void intel_fbc_get_status_crtc_index(int device, int crtc_index,
>   				     char *fbc_status, int buf_size);
>   void intel_fbc_get_status(igt_crtc_t *crtc, char *fbc_status, int buf_size);
> +bool intel_fbc_found_skip_reason(int device, int crtc_index);
>   
>   #endif
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index fabfe11fc..4155939b6 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1715,51 +1715,6 @@ static bool fbc_wait_for_compression(void)
>   	return igt_wait(fbc_is_compressing(), 2000, 1);
>   }
>   
> -static bool fbc_not_enough_stolen(void)
> -{
> -	char fbc_status[128];
> -
> -	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> -
> -	return strstr(fbc_status, "FBC disabled: not enough stolen memory\n");
> -}
> -
> -static bool fbc_stride_not_supported(void)
> -{
> -	char fbc_status[128];
> -
> -	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> -
> -	return strstr(fbc_status, "FBC disabled: stride not supported\n");
> -}
> -
> -static bool fbc_plane_size_too_big(void)
> -{
> -	char fbc_status[128];
> -
> -	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> -
> -	return strstr(fbc_status, "FBC disabled: plane size too big\n");
> -}
> -
> -static bool fbc_surface_size_too_big(void)
> -{
> -	char fbc_status[128];
> -
> -	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> -
> -	return strstr(fbc_status, "FBC disabled: surface size too big\n");
> -}
> -
> -static bool fbc_psr_not_possible(void)
> -{
> -	char fbc_status[128];
> -
> -	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> -
> -	return strstr(fbc_status, "FBC disabled: PSR1 enabled (Wa_14016291713)");
> -}
> -
>   static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
>   {
>   	char fbc_status[PATH_MAX];
> @@ -2480,6 +2435,8 @@ static void hdr_print_status(igt_output_t *output)
>   
>   static void do_status_assertions(int flags)
>   {
> +	igt_crtc_t *crtc = prim_mode_params.crtc;
> +
>   	if (!opt.check_status) {
>   		/* Make sure we settle before continuing. */
>   		sleep(1);
> @@ -2497,27 +2454,25 @@ static void do_status_assertions(int flags)
>   			igt_assert_f(false, "DRRS LOW\n");
>   		}
>   	} else if (flags & ASSERT_DRRS_INACTIVE) {
> -		if (!intel_is_drrs_inactive(prim_mode_params.crtc)) {
> +		if (!intel_is_drrs_inactive(crtc)) {
>   			drrs_print_status();
>   			igt_assert_f(false, "DRRS INACTIVE\n");
>   		}
>   	}
>   
>   	if (flags & ASSERT_FBC_ENABLED) {
> -		igt_require(!fbc_not_enough_stolen());
> -		igt_require(!fbc_stride_not_supported());
> -		igt_require(!fbc_plane_size_too_big());
> -		igt_require(!fbc_surface_size_too_big());
> -		igt_require(!fbc_psr_not_possible());
> -		if (!intel_fbc_wait_until_enabled(prim_mode_params.crtc)) {
> -			igt_assert_f(intel_fbc_is_enabled(prim_mode_params.crtc, IGT_LOG_WARN),
> +		igt_require(!intel_fbc_found_skip_reason(crtc->display->drm_fd,
> +							 crtc->crtc_index));
> +
> +		if (!intel_fbc_wait_until_enabled(crtc)) {
> +			igt_assert_f(intel_fbc_is_enabled(crtc, IGT_LOG_WARN),
>   				     "FBC disabled\n");
>   		}
>   
>   		if (opt.fbc_check_compression)
>   			igt_assert(fbc_wait_for_compression());
>   	} else if (flags & ASSERT_FBC_DISABLED) {
> -		igt_assert(!intel_fbc_wait_until_enabled(prim_mode_params.crtc));
> +		igt_assert(!intel_fbc_wait_until_enabled(crtc));
>   	}
>   
>   	if (flags & ASSERT_PSR_ENABLED) {

