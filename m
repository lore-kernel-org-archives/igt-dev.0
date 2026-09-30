Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1B6CA5FAB
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 04:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F0F10F178;
	Wed, 30 Sep 2026 04:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EiOsRfTk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CED10F181
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 04:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790743910; x=1822279910;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5d0lJV9Cq9VexhR8ZOsJ0GT+8zFcDz6I/tdcESTSteg=;
 b=EiOsRfTkQgrmIhR1cb1L8ArgCVv1x5j6mz5jZEtptCHODHzvtYuqXjsG
 +970mB4fy/Y6sOUXPOXQxGpjh4PG5ZBy1nGqpmBWizqjkp6MDJlf73Zxm
 G8fdDlOVXYxo2wq7dVOEuPsnQ6sjIDdazC4nLXF/flV2KlblIIjWPREVN
 5ar0FtLQzZWUwVrLD6Bd7BYNEM3sicxTBfoopWzD0nmJjhk7dvPWbNSsC
 JL/L0us/u09rXmrySOBo3DEg4EA1NTWDK/NvgqL0FetFm8D3mYQnxHuBt
 H9BIBRqiJ84TbC4yEt828n3bpozSs7XPPfS8WjwK/l+Uet8V2v+QOIjXk w==;
X-CSE-ConnectionGUID: zSekh/JMSXCqzU6CMtKcTQ==
X-CSE-MsgGUID: aLSA1NmbQCyhY+f+qgh6bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="100801478"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="100801478"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 21:51:50 -0700
X-CSE-ConnectionGUID: zUkLTvRWTOi6bf4Rcy/dzA==
X-CSE-MsgGUID: 6V0WCd9lTZKUfxRCAqLLiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="303516473"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 21:51:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 21:51:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 21:51:49 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 21:51:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1UpO8oLH5Mx5GcMm1TpHHegQeIqtEo7Rv6Kj25jhjidC/HooXsGTgcFTmFI/4vEjD2WX5aJTh6JU+Belz/nlSD1PQc0PouMC1b+EDdKMl8euVtKYDvjsYj7kS7wE+GQ4Mo4CVQLCUzvp4Bw6NalteYB34K0LhaJXrN1SMiz8Je7jwE0DDcgcQTsk3141QfUP86lzDe2AdEZAWwjHonCHm3aAFgXkmt6epxnOmlA/fziVJOb6zdQ0Z7VDKqEEjdjRW/cz6FOFQMOhw0HeR/PWz2m+yfjKZLGRF5ISNUHFKpfL+s337cuH9QujFEuISHSM7dTBnvOwwRyBlZu2Xy+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udjzyZe24XwrzmBRt/LtzFhn5vEtLJESeTdp5ZqNI7E=;
 b=WIoJ3cVM7s6ZVonRJpdeT+tUpmXtxv+87WULuHR0BGQ6l/qvG8sTizmgBqtnFbVnlNluD5g+BLtvB/MqlL96t0PiAdz2LUOirPrN+9bKkVkI61fcGrarQ1Dhm80qEwf6ntVf+6WFfa5ek6S7IWJN+vYlpbv1+1dFcSxwkcjwhHNxrcpOX8DZXkJHYihjF7Mnr2/XyFe9h2C8X1pqNAvrrP3Hj4Lqotn3s0UMbLEnWGMVFs1Dmo/FBA2jAmkzwx8FHqZrbyZquZ99+OXFjn8pf0yBppkF/ECFdRnDCEx3uLJoqoo5g/x63vrvshB/uHNGgL2wfVoOaqA2egchZb90Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5181.namprd11.prod.outlook.com (2603:10b6:a03:2de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 04:51:41 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 04:51:41 +0000
Message-ID: <d8bf0a2d-c814-4642-a232-b39bdf9b9b8a@intel.com>
Date: Wed, 30 Sep 2026 10:21:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/intel/xe_ras: Add test for GPU health
 indicator
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>, Karthik Poosa
 <karthik.poosa@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20260915133234.2105121-2-soham.purkait@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260915133234.2105121-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0096.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5181:EE_
X-MS-Office365-Filtering-Correlation-Id: ef778f80-f5fb-445a-d65b-08df1eae84aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: nj30MzhYJo26bvarcPEL54DKPcz5XjNfg3X7Aak4k3e5Sv2dM7L87Iix5i/UH1lwKPu/ddJ2lWCjI4ljdYwGnsRaYWEVXGgTlzfnsqZPLwt3poNXeTcxjPoE8GgFlWIiICNQwOMQjt/+VpjHuyzs1moXaCtwdGisJ+02BTUxg5IEX0Our6P5ow1BpsEXAPSB0iz6xAH/JnP2oJ1CbNlCeaZFYoI220O2NTPm+nu+vFkrrBx1hpr3f7t0Pd1Rmc1j4AbaKiVg09VG9fTML1MAft8HJrAONBw1ue5njTAri7/zsls482acdPco412JjM5XvnV+PKIzxyIEnUvBZy+GB+HIMhwcN/cHUQ8/nJ1ZeTJ31PIOThAa52Xdt67LBiQU9bkyw3BmX847wNmy/ufUDfuKjdebL7kigQBxYglXHBE9tn2LZYQnUA2nDb288WrUlWM3OEixtK6QHlzuK5/EYHVbdYFsPXYKcKJjyOwFK/lN+GE0w65eXVslbID4YpoWNN1F53B1UUARQfNu3mjAhrYsr7gxb54YlqtHUYJRQcj5OLiEVRFfzzaFFhh2pXLN/kpXHPu+uumtBt3R1eVV23wCmCFcHKLkBclialbRGYe+AM8vvnVLyQqtBrXkFGOx1i7iZ1y4SjpixYtJrURQqjg1i/ZN85g/Tv8Wnn4/JOA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk9DTlRMc2lvS2gxRzNWUWZueUZ4aUdNSFNpWmNBbTV2YzZZT2ZuYWVVcWZa?=
 =?utf-8?B?N2I5TUJXLzNGZkxaQ1FDODdNV1JMNmgvMEVtRUNPNi9ZMHdyajMzeVcxQ0dS?=
 =?utf-8?B?aUFRanhHam1mVTV0d2o4UHdvMCtTMDFUb0tYblN4dG9MWjEwVWpmbzdBQm4r?=
 =?utf-8?B?UjM4TnJwb256Q1loL1I1M3NjWmVrZ1BLL2VmVVdNc1VieFQ4Qk1kYlhCWXBr?=
 =?utf-8?B?RWZFSW9IK0FlUDJKYUlTdlBXdHN0T1pjYWt4ZiszUmI2dTlkMGNkelRFeCsv?=
 =?utf-8?B?L2YxWkpYb3VWQVdHcEJuZlB0WlgwWkVmeWJFdXIzbnBVbWN6ZVEvMHF2eGE5?=
 =?utf-8?B?R1dIOVhXeWo4Y1pOYXNvZ0dIM1JNV3J1UU45cGUrRENBaUtxZmt4YTU5UjBr?=
 =?utf-8?B?V3l2eHJXSmdkNHE2bUF2Y0p3NGQ2ZW8xMG5TclNVQmQ3T2p6aVprRmdkMHYw?=
 =?utf-8?B?TGI0WjFEWjY5VGc4cFBPd1p0ODQrQjRwUGFlZXNlbkZZWXdvQ1I3WlF6V0x6?=
 =?utf-8?B?N2d3MjZQRVZjemtWYUZ4RUVZbkpmblcwNDdCdm5aQU4xNEg5Q3FYUVYwOU94?=
 =?utf-8?B?SlRCbW9URG9lbWYwMHlsV3NSdE94RTg2UkJlYzdLM3c5alNyM2FJemVsKzdz?=
 =?utf-8?B?Zmk2RHd1N2FURS9wRGFjMGd2MHZKN3JkWFFhRzdhODVwck1vdVJiMHVyVkJV?=
 =?utf-8?B?eUFWeW4zVitTbWF1YWdQZmpWUjFCeGs4MlNMVDRDUmFsbi8yalhkMnRNcCtC?=
 =?utf-8?B?QnNzL2NpcGo1aVVNNExxQ2paQTdIMktaRUlhYUhSdGUvTlhOZ1k0eEx2SWt4?=
 =?utf-8?B?LzErZ2prOUs3eTN2UWlFc1BzUGdZZGt3Y0R6T0l1RGo4NXEvMmpKd1dVcTRZ?=
 =?utf-8?B?WDdXcjR1Rjk5K1FRVG9CL0tKdVkzMEw5RElOcUtXV0g2Zjl5YnpXSWpIcU5X?=
 =?utf-8?B?djY4bTdBVC94RXpKUkJDWDljTWpFeXJBOTRkeC85eEFtQnpZOHpQQnhnK0ts?=
 =?utf-8?B?TUM1aGUvL044SUFMVW5BYUx0M3NMWHQ2MUtJRktHNVhRTWFkY0s4REVGbVNN?=
 =?utf-8?B?WmY4R3JsNUl2WU9jeDNwbW9jcUtIWG5BbU5VcnBtY3d0YnA1K0RQbElOOVRl?=
 =?utf-8?B?anRxNG13Ny9mbG9LbnN2UURsOUpEUmRzZndjYWxkQythK3JiNzBHSFV1ZUFo?=
 =?utf-8?B?M3ZmaDdJakVleFloWmlqWVNscG5wc2pPZUNDdk5LcUtPS2tKTFpOcFdvdTBP?=
 =?utf-8?B?U1hyb2IrdVJJLy9hcFFlTVAyVWlrMkw2NExJUzR6T3pHalczWndWdXBsQjBT?=
 =?utf-8?B?NjIwcDNBVldGQ3gzYjU4eGpHdzN1Mmo2Z2loMlc1VEJOd2ZNb2ZSWmIwSm9q?=
 =?utf-8?B?WDcyS3lsR2pEUGt5SG80QnZ0QklQL0cvQ2x6eEJNZ1lFMWVwQ0tIRVZ3OUJJ?=
 =?utf-8?B?S2VObmExcmhkS3NUc1pFbVFjOE9YSktaR3EreXVOZTdnU3Nwa3pPdWZ0OXl1?=
 =?utf-8?B?M1VKbFovc3o4YzI3QUdIMmYwbXh6c3ZMNDIvcEIzQTdwTFJBU2lsbFJuMWlz?=
 =?utf-8?B?MnlMVDRuVlRoOEZicmZsK1ZiNEpmNkdMOVlXYWVDaC9jWUNaL2pacUxHbXVL?=
 =?utf-8?B?dDU0M2FqdG42U0Jxb0pFSTMxV2tsYmdKSlkxdEp1TnowQWxQMlBHRFVBc2Jo?=
 =?utf-8?B?c1ZTZlpKR1F2TTA1MEdNR2RVZTVzdk10RVZ1d3RKbWI4c3NTWXdobmcvQkNa?=
 =?utf-8?B?WXc0aUt4Y1dPcUR2OTN1aFhUNy8wcGcxVk1SSGxhWi9JODlNdEgxMjk4d2Z0?=
 =?utf-8?B?aythbmpTaXJZNWdZZmNmY2Y4TGxKZm9RWkpqaG83R0IzZDdDSk9GSzliTTN3?=
 =?utf-8?B?NDhjODBTaWRZTUdFeDliSS83N0QyVHB0OU55NHB0akExU1NKaGRyVjVVN0Na?=
 =?utf-8?B?TzdGeURlTkhJSTNnc282c3BLNGtjejk5V0lVSmVtQVUvc3pQOVlvVmVpUHYr?=
 =?utf-8?B?TklGZkJSQnc2OUV6WnY0SnhRMWhrRTM5OFNUYnNqNTNEZVFnNUNGd09jMmo0?=
 =?utf-8?B?NEJ1c2VjMms1bERyMUpBd1B1MTJLZ1pVTUI3alhTcDhIcUhTazFQczlPajBj?=
 =?utf-8?B?cEtlTEl4c1pvaHEyQlJzK3Q0Q1ViNDJ3dXJiK0Z0NFVvNlBRdmtBVWU3MHRw?=
 =?utf-8?B?T3M4bFhNbi8rSWRwZTU1aWtiWExGR2hQL2pJYjc1a0VhTGpSOUtOUTR5QURv?=
 =?utf-8?B?NG9NK05CNWI4R2w1dTltcEZCTFdKeFVwZy9YY1MydGxEcUpXQ09ESlB1cUt1?=
 =?utf-8?B?SVA1dEZ4RkpCbnpMcythNVNpR0tCOFBaaExNaFJydVdCREk0bXNQZz09?=
X-Exchange-RoutingPolicyChecked: Klwqmb1QvoevGyaja5UNy+DN6Mo2yYsj/gWrNc2aO3I3GTkJf1vz1k9KirQ3Q6NfXC0aDfpZHhLB8n0Ne6KFo4h9kp4+KbHK4ilhoan7/5xX4SJOdTPjVwb/nUvAb4dq7ClffWZOs6g0YWrv6yIk0bw1PTsB4i/acMsVI2tP6DPHWkSqGtIwut56OZHggZMJocWEa+wixdJTJ+SveZxMl+IEHdFeCejCcJ6hab0ba5QSSBpC1ds/lcQeVJFhRGvumSbKNWK8uXiMqPyi/+hj4vcPeV3TjPhlmYj3UHXjKa3lVx9mQttC3ItC5dcOEdScKIl/vqdL95pKBuVDwOYF6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef778f80-f5fb-445a-d65b-08df1eae84aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 04:51:41.2977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+HuwK1VFEc8+cw3aNF6TmustUNl/PHZNgmWA/THgYXxdvbGbLaBGIfKpGNNRE+spYihMShbq9uYdBxueoHoDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5181
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


On 15-09-2026 19:02, Soham Purkait wrote:
> Add a new Xe RAS test exercising the gpu_health sysfs attribute
> exposed by the Xe driver on platforms that provide the system
> controller. The attribute reports and allows updating the GPU
> health state.
>
> The gpu-health subtest validates each valid state by writing it
> and reading the value back, and checks that invalid writes are
> rejected with -EINVAL, guarding against regressions in the
> implementation.
>
> v1:
>   - Add platform-conditional skip and exit handler. (Anirban)
>
> v2:
>   - Add dynamic subtests for each case. (Riana)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Reviewed-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_ras.c | 146 +++++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build    |   1 +
>   2 files changed, 147 insertions(+)
>   create mode 100644 tests/intel/xe_ras.c
>
> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
> new file mode 100644
> index 000000000..91233e72f
> --- /dev/null
> +++ b/tests/intel/xe_ras.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +/**
> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) functionality
> + * Category: Core
> + * Mega feature: RAS
> + * Sub-category: RAS tests
> + * Functionality: ras
> + * Test category: Functional tests
> + *
> + * SUBTEST: gpu-health
> + * Description: Verify the gpu_health sysfs attribute accepts each valid
> + *		state (ok/warning/critical) and rejects invalid writes
> + *		with -EINVAL.
Provide a brief description. Don't we need description for each subtest.

++Karthik for Category check

> + */
> +
> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
> +
> +#define GPU_HEALTH_ATTR	"device/gpu_health"
> +
> +static const char * const gpu_health_states[] = {
> +	"ok",
> +	"warning",
> +	"critical",
> +	"bogus",
invalid?
> +};
> +
> +#define GPU_HEALTH_VALID_STATE_COUNT (ARRAY_SIZE(gpu_health_states) - 1)
> +
> +static struct {
> +	int sys_fd;
> +	char *orig_health;
> +} gpu_health_ctx = { .sys_fd = -1 };
> +
> +static void restore_gpu_health(int sig)
> +{
> +	if (gpu_health_ctx.sys_fd < 0)
> +		return;
> +
> +	if (gpu_health_ctx.orig_health)
> +		igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, gpu_health_ctx.orig_health);
> +	close(gpu_health_ctx.sys_fd);
> +	gpu_health_ctx.sys_fd = -1;
> +	if (sig)
> +		return;
Why?
> +	igt_info("Restored initial gpu_health to '%s'\n", gpu_health_ctx.orig_health);
> +	free(gpu_health_ctx.orig_health);
> +	gpu_health_ctx.orig_health = NULL;
> +}
> +
> +static bool valid_gpu_health(const char *s)
> +{
> +	int i;
> +
> +	if (!s)
> +		return false;
> +
> +	for (i = 0; i < GPU_HEALTH_VALID_STATE_COUNT; i++)
> +		if (!strcmp(s, gpu_health_states[i]))
> +			return true;
> +
> +	return false;
> +}
> +
> +static void setup_gpu_health(int xe)
> +{
> +	gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
> +	igt_assert(gpu_health_ctx.sys_fd >= 0);
> +
> +	igt_skip_on_f(!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR),
> +		      "gpu_health sysfs attribute not exposed by driver\n");
> +
> +	gpu_health_ctx.orig_health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
> +	igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
> +		     "Unexpected initial gpu_health value: '%s'\n",
> +		     gpu_health_ctx.orig_health);
> +	igt_info("Initial gpu_health: %s\n", gpu_health_ctx.orig_health);
> +}
> +
> +static void test_gpu_health_state(const char *state)
> +{
> +	char *health;
> +	int ret;
> +
> +	if (!valid_gpu_health(state)) {
> +		ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR,
> +				      state, strlen(state));
> +		igt_assert_f(ret == -EINVAL,
> +			     "Write of invalid value to %s returned %d, expected -EINVAL\n",
> +			     GPU_HEALTH_ATTR, ret);
> +		return;
> +	}
> +
> +	igt_info("Setting gpu_health to '%s'\n", state);
> +
> +	igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, state),
> +		     "Failed to write '%s' to %s\n",
> +		     state, GPU_HEALTH_ATTR);
> +
> +	health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
> +	igt_assert(health);
> +	igt_assert_f(!strcmp(health, state),
> +		     "gpu_health readback mismatch: wrote '%s', read '%s'\n",
> +		     state, health);
> +	igt_info("Verified gpu_health state readback for '%s' successfully\n",
> +		 state);
> +	free(health);
> +}
> +
> +int igt_main()
> +{
> +	int xe;
> +	int state;
> +
> +	igt_fixture() {
> +		xe = drm_open_driver(DRIVER_XE);
> +		igt_install_exit_handler(restore_gpu_health);
This should be inside igt_subtest
> +	}
> +
> +	igt_subtest_with_dynamic("gpu-health") {
> +		setup_gpu_health(xe);
> +
> +		for (state = 0; state < ARRAY_SIZE(gpu_health_states); state++) {
> +			igt_dynamic_f("%s",
> +				      valid_gpu_health(gpu_health_states[state]) ?
> +				      gpu_health_states[state] : "invalid-input") {

Why do we need valid check here?. This is anyway done in test_gpu_health

Thanks
Riana

> +				test_gpu_health_state(gpu_health_states[state]);
> +			}
> +		}
> +
> +		restore_gpu_health(0);
> +	}
> +
> +	igt_fixture()
> +		drm_close_driver(xe);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 1ac89bab7..3c2d4fdda 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -333,6 +333,7 @@ intel_xe_progs = [
>   	'xe_prime_self_import',
>   	'xe_pxp',
>   	'xe_query',
> +	'xe_ras',
>   	'xe_render_copy',
>   	'xe_vm',
>   	'xe_userptr_pressure',
