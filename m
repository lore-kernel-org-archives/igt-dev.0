Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CECAC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 19:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128CF10E673;
	Fri,  3 Jul 2026 19:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDUYfR4f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AA110E673
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 19:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783107648; x=1814643648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=99/Rr8GjCIKCCXfZBzWrRI/Qyj9/7dWxSFiPsA+Hy8g=;
 b=PDUYfR4frIo0xcyx/1AizYulZ5vy3NE8On7fBMTOEhlIvbklO2DK7Rg2
 F2DlHPWcfkq3nWHWzoA7u/L3/bvXSEhb+sOieY7ragUI214Kpglpk9UMD
 CXR++g+Xvo0RtPRsusy3gz88HzxX+rzNUq8lIRvDIBLRhxdGs3yi9MfYl
 SDPVLFprZe2tOW+Q3DCJliXSYL3y1eyVDDNhjHHYNjKwfQGaQOeu5EYz4
 TWTQauOtNZnMmu3cAp2YTaFzZAQYNc9uOY752/d7TCZRAr9TyMSh3LkUm
 4/a1h6f46oQbaFsgWIlEDadJeYNYPSSzoo5GXvyt8cK519XhL7F6qcOdq g==;
X-CSE-ConnectionGUID: 1r7fUUfCThiO+jnI40nhJQ==
X-CSE-MsgGUID: GjsUfaKtR0O+qbdjs+nosA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95016152"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="95016152"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 12:40:48 -0700
X-CSE-ConnectionGUID: HlbcfnYYQtOHfRWI5LE5jg==
X-CSE-MsgGUID: zb47BJfNQgO0++TMrGWlow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="256751670"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 12:40:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 12:40:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 12:40:47 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 12:40:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wm3VRhJZvUT0L8IU9Nam5FBJKbfFHPCd4KtrQ3fjlpEN7dMzyrmrKIIDftCxm9Zks8u2shw0tMGAMkKX7h+QUZRoZ0xw6vMJ2A6W1trhEymmrFecjGTq0w04yptOHn4fQuOJYyadg8+tXAerJ2mx4YOo1/9tbHiLLTJpyyuLSmvA4c87wp5pEM4BLABFC8QKUnLoRJyZcQjHOjsLlmnSAxr8G/Rep+blaICAtfJwc3k9UuCRpnB4bhE+r6HAuuWf2MpjtMuj5277HRhNrOsltDnea5xfB76YEb9/nwXFUCuQF52WJFgwp6kNPjeqiYAdv7fa975psuNBl0yJrn5VXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6KJ5nJji4S2Vl2jdEuyv3BpQdPwH9XKNGdiHyZXsVI=;
 b=QPr10iFalRbzqVcCrEAgiziKqxrWVG5SFYHzKLGQcVa/U08QCcF0iAecTG1ybx+02znEoP9rVCcnch3bYULjRhV6Wx+9jCJc/98n+QBn4RfTuHzuskRne6Xgp49XelucD/K8UHSLDYkSa1aeQNHqWi/Bw/5CrbwgCc/DVQwCM++pUsqy4CPWUKtl1sJkdlRJWdMCdllb/a/EMlAaDi0iemsVlwDCib53Y7S7t1XKRKytyFtZiwrXqBIj+eVJi6H5AAXgpG5WlfrgplnxraLkxCRDUVF9FW9zZzKhsuMJV+pyDn5rgIt8UnrPzR8MiGY0/ryF02TYSPhOGY3X30DoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by IA3PR11MB8893.namprd11.prod.outlook.com (2603:10b6:208:577::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 19:40:45 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 19:40:45 +0000
Date: Fri, 3 Jul 2026 21:40:36 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 05/31] lib/igt_tools_stub: add stubs needed by
 tools
Message-ID: <xlywlxswu47tqeyuhdroesb63ioxc6q4yo6zqx33k62eglnihb@y54mtsyg3bah>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <4474cc1c9f5fdeb6d7182593ab2fc24c04dc0629.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4474cc1c9f5fdeb6d7182593ab2fc24c04dc0629.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: PA7P264CA0226.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::16) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|IA3PR11MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: d08e2926-9529-45da-26f1-08ded93af951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|1800799024|366016|18002099003|56012099006|3023799007|4143699003|11063799006|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: PA7HdMmp0ZsGCmut5fKYQzuavNJv7M/GUg05r4VPTgMRipLy/4dSrCfEprtWLVm46mVGoFdqDIuWEm+/IORsqzVt1ErinDcEtBsc4WNsOImdELzHLVPfSKvyFgMvi3GBixZOrlj9kxe+ST4h6AdQ1G7NBmFAOiqzYGJVK8WP8mW11AFedDumpivLYb43OR06coC78psSvroCd/14o4hHDW9pQljYYDF1egTGSYP+Kh1PhGIKJPav1Cd7f2NnJF2JajQi0hWefawnJDsEF1Omh24lgKE6jArHsGsKFdbWDDw4PktCNrHkTY0UlAbTAiHwrHraKQ0ojF3jfwYkfFpfbWIGLBmAcPV/EDMUHl+GrOQ31HEdF4vjsp1/AO1gVnp/2LLsIwf7uFYQ7qEhIOLhdcsrVqGqv2XRdAS4hGnl9BNoa3u/fZ36kEiHMkr8zAwD44ksBRNm1WO92XyWCvOMN01ucivJyNa6jIjkryv9gT309N355hVJwkxmfUECtDNqzKhoRQSzQVisZS4tRlVJS1P3oX+SoDhcWqnmooCEEmZZWhE4VfExLtqoS0f+tRNsqQWBds+x5WHUNSyk5itTcgcYFjsKMirnYJ2OodKXRKUVNyOMIp433g23mwGkYmNuBAYvELGN0JIriliuWEe4+WzVnyu7uIpYsOluRU+ouJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(1800799024)(366016)(18002099003)(56012099006)(3023799007)(4143699003)(11063799006)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vy9Ta2VMQnFFUitXc3RUYlgrbWEwSFRpZi9MdkZmTldib3paNEhtZGw0WnBX?=
 =?utf-8?B?a0NKKysydkREZm1ucnppQXdWRFJ2K3FkVUNoYnFOZ2xNTjJzd1MrZmJ2ODNT?=
 =?utf-8?B?WW5ubERMWVNiUzJ2MmVsWEJ2NUF6L1ExODd0RVRuV2h0THdFNHR2UnAxSERx?=
 =?utf-8?B?UUplaFlNdVcyVUIvOFgvU0Ntc3VmV04vVVVZTGJUVmN5a2VVYlJ0amNOeXFk?=
 =?utf-8?B?eTFTOUZjLzJrVTNtVTBTMXhTUS9MK2U4TWZoRmxMWUFlWmlkT3hTRGd0WDB2?=
 =?utf-8?B?dWZOOWlrRmlkZU5haWN5RUFweWxOZTZCRWtNR0hBRS9rUmtFU051a3MxeFli?=
 =?utf-8?B?dlZWRmlROGZNa0t6d1RpRkZ6K21NUmJIcHVDSWxhS3JnSEdKazg0eHBRTXln?=
 =?utf-8?B?YkFxVzFJdkVBYmFkV3RqaVZtR09mMGVPSFFscHhBN0EwNXppRFozWjE5VmRB?=
 =?utf-8?B?RDN1cG1obW9kQnhWTG5LQmNKNzJMSVhBV2lzQUpsK0x6RTh2OCtxTEpFYmJh?=
 =?utf-8?B?MlFGNE1WTWhlU3lOeHJVNUZ0YnBkUU5yN2lqeDRvNlBoYUpYZlJKekNrbTVM?=
 =?utf-8?B?bTlweEYvNkJxajR2QnNhT0t3M0JLZzRTTkVtZjU2aERVYVdjT2dlb1g1NDBC?=
 =?utf-8?B?ZHBmYzBvcGx0blVLSUV4TTFYWTMyQU5yVzk0STJBaktDK0kwRllTbWhlMDF4?=
 =?utf-8?B?WXdCUVQrdHRHdytLT3VBdXVCV1FmSXdXWStjTzBobHZncEtjU3ZqcmRySGxp?=
 =?utf-8?B?ajdvZitDL0dUKzZPYWF1NXZoenNtMG1PVUdxYU9FY0FnNXg3K3pXWkppQ1Mx?=
 =?utf-8?B?QjVsem01UGVpdzZPODVrd3VYVDVaY2I5NW90M1FQVVBScUkva1NjNDNUSFNs?=
 =?utf-8?B?YU1WckhyTlVXN3JiSk1nMi9EZUQyQXFFS0QxTXVEYlMycmdESXVKbWh3N21U?=
 =?utf-8?B?cDczc09LajNtSmlwZVdKODQrNTF0TXViWGlMQ0w3MFkwNDhCaWo5d3BtL2w1?=
 =?utf-8?B?ZnhkTjBQRDFPOHM1TDgyNStoTWlyNHRxVGlaUXVPMll2ZU00QmxFWGJ4UExU?=
 =?utf-8?B?K3hQaUlHakI0TldUOTB6M1h1MEw5Z1pZWkhqMk1BcVIwU3JnZXM3ZXdTcFlV?=
 =?utf-8?B?Z3hRRWREeEpNY0UrUVQ4Si84MHgyOHNUNm1HRG10TTVOeXpxTndKQU40T2l2?=
 =?utf-8?B?U29jdVB6cG44azVxM1V2eFEyeVVYTC9nZEtqWlZvL3VJbmJuOGR6L0J5ZGt5?=
 =?utf-8?B?VkV4aDlmd1FoZ2p3VjVvTWhwcko1Sm1tN0V1K2RzMnhpZDBWSHZHYUN1NS96?=
 =?utf-8?B?QUxzTGJaWEo1REhCQWpTcHIzSmd1cTlnYTVqZXlpSmhQZkZlcUJKR3ptV0VR?=
 =?utf-8?B?b3NGTTdpazBnTmUrOE1ldHN3elQwU1UrbzY2R2xEandUMlNsTS9rcHBoZ3Qv?=
 =?utf-8?B?T3NyTVZ5VWdwQVZFL3ZRNng5WG5QNGRuUVBWQTJBQkRMMm8rTWxxTnk2anFx?=
 =?utf-8?B?dVJtNWdjMjUya1ZEbEtFOHF6aEZjYllpWWlJVjh4Ym83M2NsZlJUcmJzVkNh?=
 =?utf-8?B?TTJZYU5nV1YrQnpTbmNxYzlTSk5GOUdGTzl1Y3BNZkw3dERaOU1nS25WWVhH?=
 =?utf-8?B?SzVDMXg2Q09wWHplWCtxd0pFaVRFR0s1SHFyK2Z2b01jWWNPV2VNN1ViR1NY?=
 =?utf-8?B?M214cVNDbTlBdGFWd0hPSkZDSDZIeHJlWjJ3enB6MURHWUVsMDZEMExLL0ln?=
 =?utf-8?B?WUJQbmxvYXpxb054MzBtTGFRT1M4V1lUZ0pGaWljaGtpREo3aWZENHRWZTJU?=
 =?utf-8?B?ejFJU3p0WDg4N3RibFNEU0JJQTl6WFp3M2ViVmJjanBoNUFTZHVFNlE2N0hE?=
 =?utf-8?B?VklCYzVFblBWaWxJbWRZd1BHR3k4SDFCQmhTREVsQlJXWDZLSFhxQnZ6dWVr?=
 =?utf-8?B?VWhVK3lMN2ZZeEJ1eWVxL3dBRnp4S013dEZhVnp4alpLOExzVG1CUEpPdC9h?=
 =?utf-8?B?aUVRWFhWUGhZaUV5Zjk5aXVYbWxrcXlaU1owSm5ZQW03cURTdjlrQjRocnBW?=
 =?utf-8?B?TXBhVGZTc3pZNnVSTThQaUNGaXN1V2p6Tm1Dd05aK2pVejRreVNpa3RzSXAx?=
 =?utf-8?B?dGdTQzVQcHhFSmxHcnVpQkZ2SVkybW54eTVxR2hORE4yTncreWJ0R2d4K2lt?=
 =?utf-8?B?MHkyVkJXWndUNmlqUGdVR2pIUkQ5VXhTdjE0cXA4cTZOeGRDTVhra0NtMDdy?=
 =?utf-8?B?RmMrMDlwQ3FJNXVGREZMZlZCVzZUZlFCWWJvQ3pYbVB1dzBxV3BjTmJpVG9B?=
 =?utf-8?B?eWZGTnJYU1MvTWFQQ0xJOE5uQnk4dkVIbm9hdUwzeklFdVU5MHhHbEt3djh2?=
 =?utf-8?Q?xWzSdWIYaUy5JmUbgH4iBqzRJPZgXsWjc48nu1sn0Ec6R?=
X-MS-Exchange-AntiSpam-MessageData-1: q5K0s4dwJ47KN7pUF8wsqn/ZcAlHvlzc2p8=
X-Exchange-RoutingPolicyChecked: pp0Y5EmNeFjXpb6dbz7pukeEn/v94LyIOAosddA19LH0GEBKdpX5FPBbQ9SdXvCau2B4aCcjmMxUAs8nc9AToEOs4NHLezZNnLVpT1Gy+NS2j6LGlNfSq+QLZ/oLpU/EapiKuPCMHgye1EADHnsiDjH+LpamWUTKVEEy2L5s7YEVhHAdZfvUO5epQC0Wd8WuwLoa9Swnii8Vg6cjKLEXfy8/r7dHCRguKWMpKVTvceUCcYRNqRRZwjdDUlqyE68dWz9nvKKVUvoOZ6DbIBM5bDT2Yj7+OJ62uw8s/pPqf3MzJSLPentZqvkcdL0Q3hf+jmDuWW/2DDvVOnKIgsjkHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d08e2926-9529-45da-26f1-08ded93af951
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 19:40:45.0157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjG0BcYSwsdvP/m6G/zxaCVWrwe0IRtTLMIuXn5KyvUy1L+UsL5U/qaj0tvjVQLF8mKGZa72BUPQhnf8eu+/TvmP/hYqslecY4Uihexbj/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8893
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

On 2026-07-03 at 16:28:39 GMT, Sebastian Brzezinka wrote:
> Add stubs for functions used by tools when linking without the
> full libigt.so: __igt_skip_check, igt_exit, igt_debugfs_open and
> igt_open_forcewake_handle_for_pcidev.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/igt_tools_stub.c | 77 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 70 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
> index 9a0ec6217..71c850e2f 100644
> --- a/lib/igt_tools_stub.c
> +++ b/lib/igt_tools_stub.c
> @@ -21,12 +21,26 @@
>   * IN THE SOFTWARE.
>   *
>   */
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <stdarg.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/stat.h>
> +#include <sys/sysmacros.h>
> +#include <unistd.h>
> +
>  #include "igt_core.h"
> +#include "igt_debugfs.h"
>  
> -/* Stub for igt_log, this stub will simply print the msg on stderr device.
> - * Domain and log level are ignored.
> +/*
> + * Forward declaration only - avoids pulling in the heavy igt_gt.h header.
> + * The type is used as an opaque pointer; this stub always returns -1.
>   */
> +struct pci_device;
> +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev);
>  
> +/* Stub for igt_log: print message to stderr; domain and log level are ignored. */
>  void igt_log(const char *domain, enum igt_log_level level, const char *format, ...)
>  {
>  	va_list args;
> @@ -36,11 +50,7 @@ void igt_log(const char *domain, enum igt_log_level level, const char *format, .
>  	va_end(args);
>  }
>  
> -
> -/* Stub for __igt_fail_assert, this stub will simply print the msg on stderr device and
> - * exit the application, domain and log level are ignored.
> - */
> -
> +/* Stub for __igt_fail_assert: print failed assertion to stderr and exit. */
>  void __igt_fail_assert(const char *domain, const char *file,
>  		       const int line, const char *func, const char *assertion,
>  		       const char *format, ...)
> @@ -49,3 +59,56 @@ void __igt_fail_assert(const char *domain, const char *file,
>  		func, assertion);
>  	exit(1);
>  }
> +
> +/* Stub for __igt_skip_check: print skip reason to stderr and exit with skip code. */
> +void __igt_skip_check(const char *file, const int line,
> +		      const char *func, const char *check, const char *format, ...)
> +{
> +	fprintf(stderr, "%s: %d %s Skipped: %s", file, line, func, check);
> +	if (format) {
> +		va_list args;
> +
> +		fprintf(stderr, ": ");
> +		va_start(args, format);
> +		vfprintf(stderr, format, args);
> +		va_end(args);
> +	}
> +	fprintf(stderr, "\n");
> +	exit(77);
> +}

What is error 77 here? If you can't avoid the magic number at least
leave a comment.

Also, the style in the codebase seems to be to leave an empty line
directly after a block (so here it should be between the if closing curly
brace and the fprintf), but this is a bit of a nit.

> +
> +/* Stub for igt_exit: tools use exit(0) rather than the full igt teardown sequence. */
> +__noreturn void igt_exit(void)
> +{
> +	exit(0);
> +}
> +
> +/* Stub for igt_debugfs_open: open a debugfs entry for a DRM device directly by path.
> + * device == -1 follows the igt_debugfs_path() convention of defaulting to
> + * the first DRM device (dri/0).  When a valid fd is given, the DRM minor is
> + * resolved via fstat() so the correct dri/<minor> directory is used.
> + */

Unify multiline comments: before in the patch you're using

/*
 * comment
 * bla bla
 */

 here it's

 /* comment 2
  * bla bla
  */

The rest of the codebase mostly uses the first variant, so I imagine
it's better to use that; either way it should be made the same.

> +int igt_debugfs_open(int device, const char *filename, int mode)
> +{
> +	char path[PATH_MAX];
> +	int drm_minor = 0;
> +
> +	if (device >= 0) {
> +		struct stat st;
> +
> +		if (fstat(device, &st) == 0 && S_ISCHR(st.st_mode))
> +			drm_minor = minor(st.st_rdev);
> +	}
> +
> +	snprintf(path, sizeof(path),
> +		 "/sys/kernel/debug/dri/%d/%s", drm_minor, filename);
> +	return open(path, mode);
> +}
> +
> +/* Stub for igt_open_forcewake_handle_for_pcidev: in tool context the driver
> + * keeps the GPU awake; no forcewake handle needed.
> + */

Same issue with the comment as above.

Thanks
Krzysztof

> +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
> +{
> +	return -1;
> +}
> -- 
> 2.53.0
> 
