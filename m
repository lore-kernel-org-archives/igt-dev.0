Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0571EC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8F610F93B;
	Fri,  3 Jul 2026 21:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Exl2M0kY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECDF10F931
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112914; x=1814648914;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q2e9/YDmYbJ9KITfJgL4ancTv+9YfKzkOfcN6g31LjQ=;
 b=Exl2M0kY4eRKKt5EES+5M+Td84wdoLSlxSxLrHjrOU2qSW30tPHiuP82
 +fVO2FOJUdJDmNjA2r0af69SuIchquiUDh3l8tE6b50Y1CuAG8h3I0BLh
 oltj8Nn1n4kmPKOMDgem2xCpFyVPRmuhT4P9vILzhkJw73Cr4LXdG3Mj6
 4zVynLg1S2lcojaGTjjw0GT2hos4Od5pXW4pHdsTuGGEc6Qw5F9/PQt56
 CjaafK4bIGtwSMZzTxaWTbMf52WYusd5wY3mQYZK/LR2vkn/IMCpz3Gar
 qYbkl1wBIMFA/T6l2Z11IDXAMVAhUV97qb0ElwCUv7E1kjj2nL4D0Fuio g==;
X-CSE-ConnectionGUID: CwtQ8UZwR5u1smTycEegDw==
X-CSE-MsgGUID: k0bfIRS0RjaAdeDZorpZnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83637851"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83637851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:08:33 -0700
X-CSE-ConnectionGUID: ZdWOK2DyS8KVkhlO1F/j6Q==
X-CSE-MsgGUID: iOwvKwO9SreCS3X/JgeKvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="248736866"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:08:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:08:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:08:33 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:08:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1hrBp5rNYvkVmW7RWhE7AukPDCDdyLyUAVugS3ALNOlm57AvpIu3uJIsWROhV/0uqkxPhcsDbv7PrTbr2T+KagYBIci1VSpgE45/13/A7krROmf+b+tN7ToBhsQjcZKCtVfWXCxxjQWOJ8cyDRO5ShT1vDWdxTlrNnISP6nbLweaBsWjFplMW7V9E3IY7d53JQ6Tai88IwU/Gk5MEF0Q9D3Qici4V/zBKM2x3WeqaORMbAjynJmjahvoSFIsxW4ezHIqSfRlsPBvnT4bHyIsH8uMSFeor1ggWYKJff+RJbe88JzM1Q0Mc1Da2QRKMW7cckjOyKB+m37+bsWml4KqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKO6CLMB0zLlXnl2lJVpkth6rk7ZBFuCu2mQxgA63y4=;
 b=brPjscGjunCqZS7yTdJFqp+OrcwB9AzemHeYOKx3RWX0nlzy2ltZJoZZczyw3B4/bWSIDrRHmhZlGlrNXKhmvWKf8e97oIrNKDmHiysRCIrJHHkTfXUIBV0FRqQZW+LoFKn7/i2+KNN8DJVdPA9Vuyl8HZYxgEUsXdAsuCHZEaPP9YQj+RUWuvPCHCyuYzcjaZ3jYTojghJpt3vpS4E1rI+2dU9pSEAqhKYnHuwbD9RyGUpIhOrqR2uWC4uzYWdzFSObHUiYkTQpC5O4Ejl9PkaPaS9CjkObKZe6T5/2gvnj4ufOivyc0UodEn54O3495CzHCtdbz40NVOTaLvsu0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:08:30 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:08:30 +0000
Date: Fri, 3 Jul 2026 23:08:24 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 25/31] tools/intel_infoframes: link with minimal
 sub-libraries
Message-ID: <glbcmtgeh3v7e6skrmn3q7kdkq7hugbkf3watf2hzlsmmmoh2e@cvknrbjawzjs>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <f3d4fcf025c904933886d0880a5c538b7878098c.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <f3d4fcf025c904933886d0880a5c538b7878098c.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DU7PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::17) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f02a84-885c-43dd-17cb-08ded9473bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003|27256017;
X-Microsoft-Antispam-Message-Info: 2LQq/YE+I/svYxqVXz0TMt1/zuyKSmjRmqpmZcniEBmhDK1Ltr/qjXMtQN3my/Y6oY3eo+XCzP92QYw7G/Y7s7Tyo5tHW/zME2nsM/lxc6jIsNCxQEU+aQhUqjlRsPKnoDKINs762ghfil48yJwx4OrUkLXBlaJ8SCKw64/LApwSpma7I5IfGbEGVmh2xfaoIP2Ti0KWJLdzf71Je4U3j1xrRDUlb9AJnS1Z8cZOeYcNjDC3WhfpAvnLJZjXgvwpZDjFKtuXDpOwkXaMCXaGoOeGpjXZMRQh5QxwObqp7cow/j1bFBGHfLbVAQIrXVQS6nhbxuap3Hr8apWm7gSyBZ4suuzNLh+k3eiSzThBpGdNzHQHS2IamH9RQqMB+qqGuIHCMdFboh3XCxPq4CmGVLPRh/n9OH/Qu8YdaA9gaajZAMrapRyQxAwwiJ1cHrhG7Y+mbunN1gNWpTUSQVpQCSHjcVa5ZdJmkdSRaAsDPQ3Da3MCnvoO2IXzf/hbGazNiqH4ZTbu2aMYE2ZD0F3TLDth25xrYFNrs+B7ES16ZDZKI8zQwzrfW1TjolshHFEclRd9sIpwoRa1M/imH0BGZZtZEZUtLMy6VjrodW2NFK79X4rs6IfDfq8rjayccHu50tCEu9ZufpZ7zFwFr2Rn7kjV8IFaahi2JA8j/uhNreVov5xqHQPUDz5/hbKgNNSiyMYJK+Un5jfNkDxcOgmaKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW50L0I4VDNmNXFDQTBBM0dpcTA4U3RUUHlydnRReWtXMmxLeGlhZ01pQmRP?=
 =?utf-8?B?cVlQSXpQZk9XeE93MVVDR3ZtY2hHQ3Y1TTYvS3YzSnAvVkJIaWRsNUZKYWlJ?=
 =?utf-8?B?ME1HRnFiUjRGYUttZnJKQ1VDb1FpZXBjbWFRWXcrZ0I5L20rQy9rWmR2c2pG?=
 =?utf-8?B?djZGeUw1MGMwampwNXowYWJaUWRzbWFFQ04vU1FRdXgxWEx3V0tPRE1Xdjcx?=
 =?utf-8?B?Unlmb2VFSkI1VVJSZTlQdWZVcXRkcHFOenRVcWlJQW9iY2xlT0xzcmhCU0g2?=
 =?utf-8?B?ZWNXdERQeVlIMWdsRUpLTC95WXprNnV5Nk1XYmd0a1llZkQ5YWNWcXc2RUxT?=
 =?utf-8?B?RFRwSk1jZmdFY0FkMUNhc0NxMlQ4MHZtUUo3aFdKOTg2YjlSOU90OWtuekYx?=
 =?utf-8?B?dUxxQnhQSDlBc1lMZEk1MEIrb05xakRxUUd3bzl2MU1jZEhwdDVxbXhOcGd5?=
 =?utf-8?B?WnliTUppMStyZVVKcnNMTkVsd1V2c1pvanVldStOZEVPNDFMTkFUd1E2WmRL?=
 =?utf-8?B?Q1FVdWlJVkF3aFdlVkw0YllQLzZhamxSZGxvalQyRGxOajJRUUlFb1M5TjJ4?=
 =?utf-8?B?QlNMekVPL1RDSVVaL0Z5VFh0QWhRTHBjS1Qxc2NQb1dWREpGUDl2UzRUelhB?=
 =?utf-8?B?U2hZR2taeW91NWJ3Wk1RNElLYW5aKzRUWVVWOHVpcTNHaGo1QWh0R2F3ZXVP?=
 =?utf-8?B?Nyt1R1phYjYrZ3J4OENHOElMdmtLdjJQN3YyUUo2eU5pN1g3dE5SSmIwMlB4?=
 =?utf-8?B?UjlTNlNDQVFJanpMRit3L0c1eU5qcG0yalYyU1gxZnNqaWt3Z2xQR1dnZDZF?=
 =?utf-8?B?bDZMT2t2VWFJWGlLcm1YQmF2VmRvV3ppekhVSTdTVHlCQVNKUGlXdUFpS2Yz?=
 =?utf-8?B?eGppYUlvZHJQUkJqRzhzV25VaHhiQ3Q3aGdEbHZJU09pdWRweXVxbFdrbnJL?=
 =?utf-8?B?TWxxR1FoUDUyL01UNG9MN1FVSGVXYWNHN1NBdHhxMUNLcnZ2cm05aEJpMnVD?=
 =?utf-8?B?TUJGL0xidEZOUDhQdVJxcFFicHhaUU5PZnF2SWZxQWJTdjlkVStISjZoTVds?=
 =?utf-8?B?aDhibkl0V3dSbDhQOUhydnFzSjNVUW5LOEw4bUpzZ2dLQlZXTlEwcm0xQklq?=
 =?utf-8?B?emJxUVA5M1lhWWVaN0FBdkUrQkxzd2ZEYUE1N0VkRjRRRUtsWjFOL2dpNlB1?=
 =?utf-8?B?UEpvNlB1TTl0ZHozZCthSW16V0NLTm9EdUU5K0I5VW5NVDl5TS94KzVCRjBX?=
 =?utf-8?B?UFY4NklpenZLZTU0MzBHSTNPWS9URGVrMWZFVUhRbTJGb1hISGl1Um12azBN?=
 =?utf-8?B?MzVnY2h5Z2h0V0doYjVFZndiTEVDWXJsSjNCWDdsZ094S0owRGxlYzR2dnZB?=
 =?utf-8?B?UHBPcDhseWthdUswampGZFNrTUl5MEtoT2gyKzdRTVJrTmRKemRjeHFQM0Jk?=
 =?utf-8?B?eEJQN3NGUE01RmpvVFJwVnUyaXM0ODUzQUptRUFXTjhmUkJQVnI3TlF4bFl2?=
 =?utf-8?B?N004ZWdUd2tkOHdPWi92bC9hd24xNEw3RzVZZ2tPbGN4ZTZhT0pjVkQ2dlRX?=
 =?utf-8?B?S29pellsdS8rRXJuRXZXUWRQcGVrOGxFOXZPZDRlbEJZODJjSzVpNHdFWDF0?=
 =?utf-8?B?RWVMdEQ4dVZKcjJabkw0WXVNR3RCSGtxOXhUOE5mbXZ5Wm5YREI4V3ZpVjdp?=
 =?utf-8?B?VE03SmsvVWZIUzY1MUF0MnlIVUc0YlR0WEhjNDcxRDZia0gvRElxY0ZMTk0x?=
 =?utf-8?B?eE10cTdNbEZBdnVEMHNNcXlzRGppTGgzU1VzZCs4WjIzTnU2WkoxT01qYUpX?=
 =?utf-8?B?dVVITWkwUjhLbjV3cFZWOXNzTmNnOHdRd2U3UnU0TWpRMitqMzBOb2FzeUc3?=
 =?utf-8?B?Sy9DMkc3Vk5lNFhuc1J3RlJCWFR5L1VjVllKZHpJSzVFOFBkUVpyekxpc01n?=
 =?utf-8?B?OTc4WnRHK2VKOUZnWXJFQXRVejRQN09RaHRkN0xoODQ1L3hzSEdjYnJTSWxs?=
 =?utf-8?B?OE1LUUN1VU9SSkFadERXT1FaMEtnSTdSR0luMnlVQXp0Z1VCODJ6U3o4eHdj?=
 =?utf-8?B?TFZjdmVySWpjMGxLWlhZVityOFFjYjU5NUpLRTZ6WW1EYjNnMW9vVGxoWStZ?=
 =?utf-8?B?eGlmRDFvWDNvMkRvb2M0UWRFU1hjTTB1WmZNQU1XU3YyM0VBVEpNaFpEdHZu?=
 =?utf-8?B?aTA0RDdvUjhYT2ZWaG81WnZKR1UxTjg5ZGFGSEJwS3hMTXBLSEpiMEV4UEs4?=
 =?utf-8?B?NFJyWDM5TXNUUVVtdlpwL0hoRzlSV1VFRlhyUDJHcE1NM2dpNi9OWTNCK2Rj?=
 =?utf-8?B?T210TkRSRDVkcHM4Y09YSytjeUNaOHgyd2hxbGJOL0tqczYzUERKYmRObUxO?=
 =?utf-8?Q?UvYXD3vcfsFG6UICPk0tAnMuEAP5Vp2MxH6jVGkOe4dXl?=
X-MS-Exchange-AntiSpam-MessageData-1: UFJ4SuQDm+r7LYAqj4//WIgOKRSMfIM3X5I=
X-Exchange-RoutingPolicyChecked: nvikAtq93gjyZ42sDLsvXn3i/Kz83f+x9sxuzKXBJhcvXLSer3msTFxru2i5EAmiMnBHlessMVdN+ejw1pD0cbNgim7mOuUjDvb8Xdg/NmVC1eopUEdop3spqiqNspUjBfCvI1Xe+zvBXHCV43MAeBpaS906rVG/EUlPOBix+/uDW4C3sxOUNZ/F3hchMZNxjnhHi/vCyAU3mjuxy/AWIHWQ7EEskbsxBGVHU0tI5g+hvQ/H4WEccGskB7iSWOkSXkdEXbkKtceJS1C+HGn4gVQgOZDbP5p2K/F35UwiTFznwdaMM4z+9nP29jX/E/1O/7blnsIJv1Lj4PnmFux6Yw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f02a84-885c-43dd-17cb-08ded9473bea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:08:30.5347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XX4Te3CUTgOpMQFvgUgVsLxmQ9j6PjsyRh2DEv6x3MN2D31J1WrBJZqs3W4u6thRBQOXuXUeMevAy9ADW83MowMaSwc/UrPys+IMla/3JIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:28:59 GMT, Sebastian Brzezinka wrote:
> intel_infoframes only needs the register/MMIO helper subset, not the
> full libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 32a345e9d..a31b6d0ed 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -20,7 +20,6 @@ tools_progs = [
>  	'intel_display_poller',
>  	'intel_framebuffer_dump',
>  	'intel_hdcp',
> -	'intel_infoframes',
>  	'intel_opregion_decode',
>  	'intel_panel_fitter',
>  	'intel_perf_counters',
> @@ -116,6 +115,11 @@ executable('intel_guc_logger', 'intel_guc_logger.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_infoframes', 'intel_infoframes.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
