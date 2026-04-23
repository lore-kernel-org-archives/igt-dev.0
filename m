Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0CDF589C2
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 12:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DAE10F0FC;
	Thu, 23 Apr 2026 12:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vzs5TEpe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B0610F0FC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776948632; x=1808484632;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=hjqGqy/IvQ0mz+yYCVYULhgtHFQJJmHRGONtIPtHII8=;
 b=Vzs5TEpehSzEz4qiOhatNFfnYO2M/p8vMvKB22JWfK/Xolw4+sR1eOzk
 yhYAVeCvczgJFJEzVcdd8+Iq/mzT0kY2sbNq30SxqB6iaBDibRGAF1oMh
 vLh57VMPnZo7fybiDdax7RF0snIzZ3JjwXCmG7a2K63N65eEyvZRCtWXF
 KQl/a50z4SV1bgj4Mb4txQ5EuCiqgr5o6FhLC9b9PGRnOwlq4HZebhIDD
 ZPEj7UvUqJkBA5v58HkOfPwW3z0hxseSqbEx8EHI57EAncJoCwrsXtcdZ
 yEQd0DS/gKSnlLAUyaBUKfFcgsRdOK9Yr3Pd6ZG6BOZkrAp491kcSprvw w==;
X-CSE-ConnectionGUID: 8VSxDPWnTNeKMAUUGMRszg==
X-CSE-MsgGUID: D1K2qQlzRbGdFtLFnKylFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77795324"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="77795324"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 05:50:30 -0700
X-CSE-ConnectionGUID: iAQpT1cmR+ejI1PUehf2PQ==
X-CSE-MsgGUID: 6fwgAf6wSau3/q6fh7imVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="256136476"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 05:50:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 05:50:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 05:50:29 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.19)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 05:50:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVx9XrgNMkKgpLQ56Ctn8oYk62y1aHiiciGWQ4aQNQ3dPinN7Z8NaoKnambCtSRZ21eUeC1iC7xSpm0H11hKpzLaxmJxjaDZDrLHpZivm8lxASSDrvbP2yZlJTKnBC0uUE6UBjceLoKTBB5EraBOmhXqrNnbSsvOOtWtU+wan5ZmEFITj9h1BMJWiUEu3wXqk+aEe45uIEW5nyRrIdgUJPHI/Nrcwu7xYvBp8z8IzJdK9KNy8vHyWSGjRnq6vjIG3m1ckXKVvSiW9bb6GiW/NVTEqbhxUTyXIBng7gSLql6995FPpWb7Brc7yprubkE/BVqRweSFaaMlflBEPEyXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59d88/wJ/b2MoG7dU6PbOZaa80yZ+e9biDiA5lqM1kA=;
 b=bRn9jDqwN9g85+cXZrJTjpHOOCYvpLtES1QJp9KfgY2zjgIxWE9c7JGQ/FPscwgzOS2ijMTfbGAJ0HsWHu8wD64S5cVJoSDYspxCqa4hBbJddyy+LwN+cJYJrFCNIMNR9nQ9uSvdkLihgie9ylL/TCP74lHYx8HIFupfzGEfiT3WwAIdOOY0fy5LzB9BDMiGVb04SASLJZ0Sh6Sc9V9xR6Ls2fHomVdrOCzr3qjYlDLYGPp2tflX9UVPKi8FveZQz13YGSgDbRg8hPBlcF7O+TXM+RUTBFVzLjEGl0y8yWYlEHUfke41/qwlu+ocsF6C81h5mEqfDXBI6ttqM9wIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH3PPF91320C45A.namprd11.prod.outlook.com (2603:10b6:518:1::d38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 12:50:24 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%3]) with mapi id 15.20.9846.014; Thu, 23 Apr 2026
 12:50:24 +0000
Date: Thu, 23 Apr 2026 14:50:19 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests=2Fint?=
 =?utf-8?Q?el=2Fgem=5Fexec=5Fendless?= =?utf-8?Q?=3A?= Use the per-gt
 interface to set frequencies (rev3)
Message-ID: <r6q34vwtimvgx3v6jauzw7b3e7bv5msd6hxn3w42viz3up64jd@2a6scjlhuxsb>
References: <20260409140640.48827-2-krzysztof.niemiec@intel.com>
 <177580535535.449804.3114478055884551797@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <177580535535.449804.3114478055884551797@a3b018990fe9>
X-ClientProxiedBy: DU6P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::8) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH3PPF91320C45A:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f357854-5ec6-46d2-016e-08dea136e30e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: lUQv2Y+S1PV/VsuAZg1dn4MQUPHTht5WNAqIhPFIDvExgfbfoJXohP+Kf5g3Q6XNEl6wBdCvjLYdMLMc1JpnhQjkBLJRpU3+ymb7mLllS++sOhflqI48+Mrxlk67tzWYjTaKlFjT+i4+jvxIPCA/R8BHXnYpOg4bl/sR1gKkYGx3M7rjRd4RK1X+P+zkACzsfO4KO3rvqMSMOgLVOuViyZasXRTAHliqPhc2wLksS4f4wcBigfSsmcJ6NXyOvzCl7RCiYOmryzyP6nbFtFxQl8Q2cJGfEZ1DmTJLdrXHWVdjywhF/5c6VAQdHNapZQsuSlUG2mxc0q1aY/RIWWSPJDQ7AVCUl+PGiDCTqQ4ij6sP+CbqtSW/CpOrBcaF5fFI51B6RShBv93QsDevGPDifinWlSN8oMbGBGhkTL/9XxQ5GwSTyNqJ/JiiPcBeeQI1xn0W7JDP6k32WOuH5SfSNTxaYdaZnKC/lOkFuo1wSEPOmHQUANQCDFI0rIPSfdBDlcHBafMDzLwJO7wNHLdPL/nKyXC2nFmSJ84xw20LxKNe9MIz1Dt3LlWBEVCoMN2cNz1UtqaV50+KHHGNC7QNT76IqlBd8JcLJ7AtsB9H3dFXHIN3/VnXJMCdXEZt0iLfWPOlsA+5W/W4sESTBdcvBTqFp3ZC/hlWHyGLyiwq3ltvmIcEsc90MO+rIM3gRpIL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnBTZkcwSW43NEJjckRvYVhJRVB1MDh1RDRhTzhZZFdQVVVyNjdHYjQzeXdJ?=
 =?utf-8?B?T29CSFp2T1AveldBU21NKzJoeDh0OW94dzVvL2xEUzJQMGFTMzdaR1BFeFVD?=
 =?utf-8?B?WnpFczREQnhBNGoya3AyRExYOVp0VFpCc1pOSFV5Y0FCQ016NmVNd2xmSEpE?=
 =?utf-8?B?YTQ2NHhQVG1PNFVhNnptWTJCVklueWJMS0l5cSt5dmVLOE1uanNpWkdPbXFH?=
 =?utf-8?B?dkVGMGNpLy8rUnNWZytROFpuYWY2VStHSlVzdyttcldoQzBaVHNqMzNrNmFy?=
 =?utf-8?B?WmxJR0ovQTU2THBKTGVTUnNjUVpDZVRKdk5TNlN2TTgwVVZyYm5Ba0lmNm9o?=
 =?utf-8?B?MUFod3M5WE1ITHVZMVZaL3ZWZzFPcnNuVHF2c1JxL29hTkEzaXNabzhuTDBK?=
 =?utf-8?B?QlR0aGY4cXU3UmsxRU4wejAycVhnKzhoOVRyQlRZc1VsQys3bGFuWHZ6UTkr?=
 =?utf-8?B?cFlWZzBIb2RpejAvYjc0cW9SOU40dElnWXNkWmwzbDBPMUg5bDM0NDFLb1Q2?=
 =?utf-8?B?bXV0cmYyQkdMelRxckNRZnZycFhvL3M1Qnc3Y0pscnFHZUtLVVhpbWJoUWk4?=
 =?utf-8?B?MENJdVZDUFlpZmwzaUtSRXhnTCtHK0l3cGdpemFacXpXYVV6eFBETHgwUmhu?=
 =?utf-8?B?Sk43SHc2Q1lCVGluVnJBU3hEdEtHem9kM1BoZ0ZkZS9UZXJ3bFU5ZWN1bUsy?=
 =?utf-8?B?ZzZ5VWpYd2dtYnhWM1JzY2E4L3p2cmpudnlDalFwUW9CN0lOVFpBTFAvMnY5?=
 =?utf-8?B?YlJvbytTaWdSMllHUENLWmZrOEZVTkZnU0l6R0FKZjNzTHFGb2dHYnRIWTUy?=
 =?utf-8?B?QjRTQVgrUExrMnlmQlVpZjByVXMxUVE1WFJWeW5Vc0toT3NScy9iYXdxaTNL?=
 =?utf-8?B?YWMzdzVrOWtHVHlrZkgvTDJIVWhsSVJETHhjZk1aOEFRUHlycnlEdm1vR0or?=
 =?utf-8?B?ZTRrcHFMeDZnamxFejA4Rk41ZXBnUTg4OUtQcTJNbFNOUFNoUkxNTzM5a0dv?=
 =?utf-8?B?Z0hVK0FYNlZEWmZnTFFnU1dVN3d5SDNCR0cxRVA1c0hlQWhPZEt3SmpkdXJB?=
 =?utf-8?B?WkZJYkl0ckV5Q2xBU2hFWUJOWDg5Z0QzS2RSaHVKWElqVEoxZ0hGSlNCY3lC?=
 =?utf-8?B?cDNVSlh2ZHRHMVZvWGFYUktXdm11STEvNUhic0MrSVV4SzlBbVllY04wMGpZ?=
 =?utf-8?B?T0hveUlRWE1XVHNwQ3RqY3ZWL1FmbDMxWUZHUS8xd1U0OEZ1bk50dHQybmd6?=
 =?utf-8?B?eEZ4Ym1HZ1F6d01qZHZYRjdUMWlSYjZzMDJ6T1FRUUF0VUV2TGk3UDZuanEy?=
 =?utf-8?B?R1pHcmhXeDIwSU1KRkFkUTc5ak9EV3BvRzFTNEsvUUsyQlRyRlRQOUs5Nm1B?=
 =?utf-8?B?MUdQejdWd2dOSlgzYkZYVDY0LzNKMkJ6dS9oTGF5bGp1Uzd5SFZBaUJkcDZI?=
 =?utf-8?B?QWlTdWFDNEVNeDkzK2t3dTFReGlLVjBJcWthLzFpanpuUitvbUdLT1B4MUxi?=
 =?utf-8?B?bkhERVlvSTNETzlPZk5wRUJVUjRxdWJiaUdLUGYwczdnVFdHaWdLYk9MU29m?=
 =?utf-8?B?cGYrOU53STBBa2tKdVovdWgwYm9xZ1QvTTlvVWF2L1JWNythbTRJRUdQSUIx?=
 =?utf-8?B?cmZwdUFPTXA3U0p6Vk5SbWt2MkY0K2xhbS95NktjWmNoTnRuNkdTcnh5ZHdw?=
 =?utf-8?B?U3ZMR3I3UTVMb0diN3JaN0F3LzFQTVA3c3VFcGllUmcxWllWVCtNNWtFc3Nv?=
 =?utf-8?B?cmlEZ005bk03M1o2V2tMRFVnMHllY2VpYTVZd1Jsbkltc20wL0g1RUVYS2No?=
 =?utf-8?B?N1F6N2t5eWhTRDhQWE9yOXRONjNEaHJDYXp6dmVmd2ZZRmRSZ1dxNmRncTFZ?=
 =?utf-8?B?OVdyL29RL2Jqa0JoZUYrSGMrU2FmTmR5UVBDM0hiRk92YnJuVDFnMnNOc3py?=
 =?utf-8?B?d3BudnZUWlB3aEU3djBDVXF5UlBmajVSNkE4WWtMUUtiaVJJbC92azRaUytz?=
 =?utf-8?B?dFdDbjFVNkxkZlJJQml5T2I2NXZEZVdaSGZqUzB2VGxPUjVDMkdRZ1lxSTR1?=
 =?utf-8?B?dFhBd1BCWjRRcXdrWjBvcmNqYVMwR3dJV1VuRm1qUGVWeTY3VTdHdmo1c1Bi?=
 =?utf-8?B?V25BcklDbGdyeldQY3YyZ1FTaG5QTzBMUVZ5UFJDOUxScGFMYXJCaTRPMHpX?=
 =?utf-8?B?bjFxTHdjcmsvOVdUTVAyZk8yN1RVMm92Nm9sNTI4WEtnUjB2d01DZTF3bWF2?=
 =?utf-8?B?cWtLdGxRUkh3NmFhbmJuYVQ5ejBoK3BxQ0ZucTZEM2Y2cG1HenJvUy84ZENx?=
 =?utf-8?B?Yy95NmpML0luVjBKYkgvdVI5a0NNUDYydlRILzdXaE5nZVhrYkpkSnpNc2o1?=
 =?utf-8?Q?un6Tt0TVixCrE7CI=3D?=
X-Exchange-RoutingPolicyChecked: BgcVKTYPSW8z4qi42rn3AhhJmHaQLKo/U/bBks/6FCFlGrNc01h1WPQvZN7OV0q33Yu56s1yaoa/QYrSXJNS5NWbUH2nOxKQXwZrN+AOwm8TM0/Uds/W1q/THHixNNQsbsOlUyTEfPxrglf2SJUDEcB60AzIz1I+N/zLt/ajA+1VyU80h7wPt2DspXIpLwoEw8qDsIIzHPrpdnFO1Oh3rvzaONMMHCj1Plx6vFAzVzQ2TsIJ/dbsDI4zi4Htuw32qF0n4NmEwPlVkZ3A6nw4fzonTasYtvtxuAmpm6bjKcXWv411gDA8rmQkK02fWvriwmvuoa9K6edEulFL6AjScw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f357854-5ec6-46d2-016e-08dea136e30e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 12:50:24.5429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0wQmEyZSEWW1JIM0vJ7WUwEg/dY2tDvNMvPEWOLIcJ2Q5GA+fA/uqfphUAvFMGUhbLOkaUCVb2YcPPQBt1zwYoVdxhc9e3fhN39rj3VN7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF91320C45A
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

On 2026-04-10 at 07:15:55 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_endless: Use the per-gt interface to set frequencies (rev3)
> URL   : https://patchwork.freedesktop.org/series/164291/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8852_FULL -> XEIGTPW_14957_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14957_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14957_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14957_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible:
>     - shard-bmg:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8852/shard-bmg-7/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14957/shard-bmg-2/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a3:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8852/shard-bmg-7/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a3.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14957/shard-bmg-2/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a3.html
> 

These are unrelated to the changes in the patch.

Thanks
Krzysztof

>   
> Known issues
> ------------
<snip>
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14957/index.html
