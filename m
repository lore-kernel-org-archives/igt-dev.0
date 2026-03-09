Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E19F3C241
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 12:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6250E10E4EE;
	Mon,  9 Mar 2026 12:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luGgpNVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388D710E4EF
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 12:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773060870; x=1804596870;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6dT/uwAHZkIgE4E+S7wR4chcwdnvx4MBnRF/KEvMZOw=;
 b=luGgpNVyr2nUBbUISZ/+WBq+3oJpD2baBqPUayP+FQTCr4krrkrS/p2Q
 NoM2t5IHvDup6vK5jpkv6954dDerK6OQAx2AukdPndaRGMtLEcDUhUuVD
 e1W+/YCi191iX9mcjngm/GaXKT/SoYm1jEYmtyVV0VrK6+ztAkzKk3fo+
 sev4GRf0EjbOdQ8rbNtsqeFF/mSK7dbYUxazPjCWMrRDIImh1zNl+UGTm
 +KtdwMAjXNCbv4FwtdebJgGp6FPwq5cgBLIg6rR2cKEM586FBw2A7ej1M
 pFxPngfVGooDyYZiZE+NIQxxZm1Tcxa1k+gxRd/W2dlRAZZhMAkwTIy5N w==;
X-CSE-ConnectionGUID: gsIKm8z5Ry+aHOPGhe+igQ==
X-CSE-MsgGUID: nD086Aq/RH+Qdf4uldrbvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="91651854"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="91651854"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 05:54:22 -0700
X-CSE-ConnectionGUID: C2r3BRFyTXibysqUhJUinw==
X-CSE-MsgGUID: EKxoCmodTySIDHCLZsH/Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="222414722"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 05:54:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 05:54:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 05:54:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.56)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 05:54:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQpU7Y70YHIbmxXqjAriXKTLEXUbod3GPNIlyXiJjpYWYBrb3spjLPT1Ke8ObfstpSJ5cx7aBscFZ0xgIWJbu6xeIN39qOb38SIkc4M+lrcXmbZnPTLANzuFJ3wZXt1wKm94+ATBrEKeiH5NpajKHVdnGpFC2NQ7XZFnvadC778TAHjyLB90qeQgY8j7IQmWuqHVWb6nA00rs90KRvR8jRVTQJy2y9uTSHNgVPTCt3MePMc3zbucSpxBe195Gu/24A6AE2mZMISqfdsuvGUxzjR/FHIiLc+C7rUV5R0wXYJJTSNFHhLepEXKooi5opkKXQtpDlD2i5k5iDSQ7+OK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeBMwrizpqeH3SOoH4KUdTKDPSJ1lStGnODzRUIH1dU=;
 b=Y4t4PRixkx7Kzm+3U56Z1smAaGntsiotNHkaEnvYgGx1bIibeNEJcr8leXgxN0aSU4cCj2poifNMvTM1mevd5zI9v2NAhFvlS5E77lMCjIwQYyvOOuFy4F2aqSnlAO9XaOpf1Yz0KH8yCc9vdcPn6kcRA2eCCihEj7OciUKubUzXoZVO7zhcu+QT2tLjEiA9yrV4ri+PbPUVNC8iM6nMVAjINi7/Ppz99ft18a8qpNg74p5sBNfVwjBYSpCRJF0Zjw3f5dzI+MUQUGS//EGgtb3n+AhhJxJgl1w7mKtq853hjNaMH9WN3i5OvyCUhIKVigusBFiB0gPbuGPv1hgg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM6PR11MB4515.namprd11.prod.outlook.com (2603:10b6:5:2a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 12:54:18 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 12:54:18 +0000
Date: Mon, 9 Mar 2026 13:54:11 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Nishit Sharma <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 4/6] tests/xe_compute: Extend compute test to
 cover user passed buffers
Message-ID: <aa7C8wf1kuZyBMBp@fdugast-desk>
References: <20260306091430.1234990-8-zbigniew.kempczynski@intel.com>
 <20260306091430.1234990-12-zbigniew.kempczynski@intel.com>
 <aa6mkV3qNtFsgXjB@fdugast-desk>
 <o7lhuimythzhzjqdadjylmgh3pw7e36tsbr5qwiue37hiutr6l@se3agvt6zgam>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <o7lhuimythzhzjqdadjylmgh3pw7e36tsbr5qwiue37hiutr6l@se3agvt6zgam>
Organization: Intel Corporation
X-ClientProxiedBy: DU2P251CA0004.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM6PR11MB4515:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8664f1-0598-4cc9-2aa9-08de7ddafa0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: t0P09jzU6YwK7aEGq4fqahb/2gUUgEo+NrFc8FXbn02/QCTwTFOGaKoXGVV5D4zrP20y4CnPnj+OQ8PqcfJBMi3JKC9soDhyjx8+an7Y3GxAWVqGfYUU04rwcv7P9Qk8+t/pfd2l/T6h5mvdTsQHC4X0wjK4Nj8OASrjmEHV2tuDCjtPtr5bzgfmHpsqTEY24DlmX88lEE6K6otEtzzcpZXTbaWvenIAyxH/LBEdShdOtehqyF3Ja8GdFvhz9ava6KC7MyqhvlmOFw2P87HEfVwrOjhtK+9EoBAM/2UXbvkMglSIv0l6CazqhhPEZDpnqAfkswyJAmF9OUxpYdZROI5000wXM1NEXZaesA9O1OUqEzl/O7Zeo5m/5WRuG7x1xKiqJzMLIAvrUghwnCNCuMPQxqKPIZ10SZ6TMSf3zffAW3BPsEBHQomRssFrJMphe+90vZqqDLsQuv7WNwTBI4x0j9SCUrrteEfo30+u0ycSY6YMQWMnOSAV8fIOhz+i5CKKw4069oMI32iZYbyRkHnQLvd4Emz4a9+QJfG7ZXDz9WF1u/c9wlqt/W2N1GlaSEYxMVHLDklxwjbGsR+cp/YbkptV61+sV+ckdP+VIl9jhLsHZ92T+SJsv5wYe/bYPxmb/bA+UyLbBkRPm1EoJmzvCEYWNc+McuySTCHAE07/37+qMkyRpfIOJ9Y4RF92LQhcCUFJAXsbjPNysJ71KWKZxwk1PifzvnI6yxPc1As=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU1tRzZXZnJrWTJWT1ZHQ2EyRlppZ25zbUlIRmZTQ005eU1BdTJESEl4UERR?=
 =?utf-8?B?L2lPUlZEdVJjc1dIejJxVnJYSkdBTC95NGgyWWxCSEl4OThHRGdrRFhFQ1BC?=
 =?utf-8?B?K2w0aklXVDQzRC9aQVcxSVFaT1g2ZE1UK09FY2hNaHB3bVRocWtxdHVFQ3V5?=
 =?utf-8?B?c3ZFQ0lTMEtOZ01oaVhSbDRqcW9UOEF3UzE5SmVHYnVmNTBMSlBPd3c0cUZS?=
 =?utf-8?B?VnVVTVNNdHIySkdTdVV5TTU5aWFYWUkrUmZBVldiL01kaUM3dnlXMXl2OWZk?=
 =?utf-8?B?YXJvUFFSNmM2Ym1jM1htYXJ1Mi8vUEMzbXd2TzhLY2NZZFkveWt3VS9LTHJR?=
 =?utf-8?B?N1NZSzlKYnBvWkNDckptUUZrMkhrTWM0K29aMnJ1bjdldVk1eFpEc2xEVHpV?=
 =?utf-8?B?YjVZY2ppd0o1WHNKZ2tFMCt5TUdVbmxaeGx6TVhyRXdvSGNyOHpOMkpyOHo1?=
 =?utf-8?B?TlViQWd2b0J3K1FNZDhvZkl3ejZHYVd4MmlKdTJkMk5YVFlxODNnUzlLRWpG?=
 =?utf-8?B?TWU2QjZZVVJjM2ltS2FMKzAvOGtIWHFiLzY4S0Roei81WENvNVdCVnFGQXJo?=
 =?utf-8?B?cER4alpDRTJaL1M1QmNhRDJyV3dSdkV6T3lLdjQwem51djFVMXRGTTU0NHNV?=
 =?utf-8?B?c2crSU92YVE2dVNTZ3RUK0RKTHY3VFZIWGhMTlc5aGlRc1pTemM4MXlvODht?=
 =?utf-8?B?RTBCVHM0R1ppU0QycWdjZDJmRGpwV0xCYnhKZkRIWnBSUVlDZmRPYWJ3UFky?=
 =?utf-8?B?UnFUL2RLZmZGWHlzUmJqNjJDdVZDd29oSUVOUGkzeGp5RGpzcm9iQ2dEQTRa?=
 =?utf-8?B?OC9TRWc4U3J4Y0RTSWp4UldvSy94RjFidmxkcEpheGs5NEdnVTA0emYrMHox?=
 =?utf-8?B?ZSttNjVoL0N6TStGendDd3BmRlIxVm9PZWFMNGRnRitBVVRmSTg2U1BKT05B?=
 =?utf-8?B?bnhtWEVBWVdOeDZuNThXYmVNS0YvcXdsZU9iN25SSGN6R0ZwNTNHcUxxNWVH?=
 =?utf-8?B?eEd3TFg0UEpJbkkzUXNrSVdGbmxZTFhrZ0JBSElaMStwOGdwTWNuNndjbDU5?=
 =?utf-8?B?R2VTQjRWZk02VDMwN3Bkb0RCdmRZak1OTW5MdXU0RWVQNjQyYTZXREhvVkJC?=
 =?utf-8?B?OGVXNlBGalBJN3htZitvcTAwNm90c2g1WC81bkp0eTJudkw0cmRuNjdOYjU0?=
 =?utf-8?B?bnkzMjk1Tk9ER2RBOHNjWUZpVUNub1l2VTkvZ3NRYkpBK0NqMHN3ekw1NmRL?=
 =?utf-8?B?Rm1uQ296b3A3cGN3cytLaG5zeXdWMGZBYU44c3JBYk50RjhDWW1rUWdNQUdt?=
 =?utf-8?B?R3JqMnJZKzZlT3FoUzFjNTVoS3dVZGp1K0lyTGU4SlNEUXFMNmpKaWRiYTgr?=
 =?utf-8?B?empXTFZTNVVaL2V0Mkh3OURCT1VvWDkrN2p5VmVMckFScEdQOFd1YmxSemQ5?=
 =?utf-8?B?WWp4SWx1ZmszTXFCaVd5eFhUays1S21CK0VmSWRDVHVvby9CRlhEaFowbDJj?=
 =?utf-8?B?Y0hJOHZGS3RtZFdzNUl1UktzYVVWRVBMZ0twNngvOGg4V2RKTitJaVFwT2xS?=
 =?utf-8?B?SHdVTEhxWXM5NnpCOUdlU3o1V0NqTUZwcmRHVFVGbmF3RlpIOC9KNWdZT09G?=
 =?utf-8?B?bzQ0Zkk5YVY3SU0zZmRWcTFydzlKME80dGJXVU12NE5JbDRoMG1hbnJJVXUr?=
 =?utf-8?B?THM0Y21SSldQOEROWnJlQXFjTmVFeW8rOWZrZ1JUcHNZL0J0Vm5lTUVwSHdZ?=
 =?utf-8?B?bUJGbDdyRG1hNzFPSkdYbGVWWW91VXd3Wll6MkRvemVRVTltRm1HejJqY2Rm?=
 =?utf-8?B?N1hVUFZRZDFJMkJJWlNWaEc0LzFqVXB3dG4yTVRsTmdkYTlJa1g2a0dsR2xx?=
 =?utf-8?B?WmhNcGtyb3pSYUxrc1BncXgxWFNBUGNTMDhnZmM3M2EwV1lNVU51QThpK3Rt?=
 =?utf-8?B?bzlpcFp3a1Q1T2FiYW5wSnVXOUY4NUpaUmIvRWF2SHdyeHFmWmVsbjBaUzJR?=
 =?utf-8?B?TXVWb1pOeG5TeS96VzArTmhtU2Q5UndtUHNJL0Q3SEtiTndMb2ZkM0xxNWwr?=
 =?utf-8?B?UUhVd3RaUFh6eWZyN01OcmJYeFpnWVZoNmh3Tkk3eTREYWxNR3FLN0JjYlM5?=
 =?utf-8?B?U0pGK3g5Y0Zmc2xSSmhqeDdpcW02Wnlsay9MMUxyWE9FTzhZdzlBZmU0YTk0?=
 =?utf-8?B?MVJCY0Ntek9aaGQ3MCtMRGYzUThPZ05VQ2hLMEVCbTdGVysxZS9NRjh6d0RU?=
 =?utf-8?B?TmFITm5JMS9aUWF3dEE5VDhZYWpNMHJwRHl3UXlmcDlpQmlyVWhDYlE0TXI5?=
 =?utf-8?B?RkdRSmg3NGxORWR5b1dzZUIzeHJ2RzFxZEwrWTFTc2tobzVxeFkya1JtS3p2?=
 =?utf-8?Q?q6OeV+0WorPqv8p8=3D?=
X-Exchange-RoutingPolicyChecked: Z94ySkUio2BG1WDcrj3Uq3L+Dlu0ZhFbGTBAe423DMxqN32ut/ImpcAcHZxocakBoLNO4rZqxesBJ5gJ7zsAXltUkFEDy147LEEkFH/9YGnlBMKkjYyvctlx4qAaqlPd3GK1XVoTzGYxzVTNrNPPz02gBOGC8ZTVc2qTzIW8Ssyfi32pHY9hP1d8NOW7mb8vkJi1rATHAqxvTtIsF3KbiZyp55CwxVlTcZdh9NC4oAix42TTO3NmPXPR4Rd9mDQ47ZruwuYpZ1SOKjdG9ksQqYi7bEUgftz2ft4XTGmX3fZ5qWz70KTJua8yde7Miq7zh/ygrJVmdcL7Od0cV0ZXGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8664f1-0598-4cc9-2aa9-08de7ddafa0d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 12:54:18.7032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1XTZQXPnp+YH6bDVarVOtvRroKtyhVPZtnwrq9FTpxxF7OqkvlEVDuhN0udX6DlgUzCBkVhliRbNz0ZcOimArUqZ0/J0ER4WLoI2PfQGgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4515
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

On Mon, Mar 09, 2026 at 12:14:01PM +0100, Zbigniew Kempczyński wrote:
> On Mon, Mar 09, 2026 at 11:53:05AM +0100, Francois Dugast wrote:
> > Hi,
> > 
> > On Fri, Mar 06, 2026 at 10:14:35AM +0100, Zbigniew Kempczyński wrote:
> > > Compute library allows user to pass its own buffers. They may be
> > > normal buffer objects or system allocated buffers (SVM).
> > > 
> > > Verify input and output buffers added to user_execenv are properly
> > > handled and data within are fully on user control. Execute compute
> > > square on these buffers and check data are correct regardless
> > > allocation strategy.
> > > 
> > > Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Acked-by: Nishit Sharma <nishit.sharma@intel.com>
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > ---
> > >  tests/intel/xe_compute.c | 150 +++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 150 insertions(+)
> > > 
> > > diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> > > index 310093fc56..e5367b4c10 100644
> > > --- a/tests/intel/xe_compute.c
> > > +++ b/tests/intel/xe_compute.c
> > > @@ -510,6 +510,144 @@ test_compute_square(int fd)
> > >  		      "GPU not supported\n");
> > >  }
> > >  
> > > +/**
> > > + * SUBTEST: compute-square-userenv
> > > + * Mega feature: Compute
> > > + * Sub-category: compute tests
> > > + * Functionality: OpenCL kernel
> > > + * Description:
> > > + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> > > + *	taking buffers from userenv.
> > > + *
> > > + * SUBTEST: compute-square-userenv-isvm
> > > + * Mega feature: Compute
> > > + * Sub-category: compute tests
> > > + * Functionality: OpenCL kernel
> > > + * Description:
> > > + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> > > + *	taking buffers from userenv where input is svm buffer.
> > > + *
> > > + * SUBTEST: compute-square-userenv-osvm
> > > + * Mega feature: Compute
> > > + * Sub-category: compute tests
> > > + * Functionality: OpenCL kernel
> > > + * Description:
> > > + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> > > + *	taking buffers from userenv where output buffer is svm buffer.
> > > + *
> > > + * SUBTEST: compute-square-userenv-iosvm
> > > + * Mega feature: Compute
> > > + * Sub-category: compute tests
> > > + * Functionality: OpenCL kernel
> > > + * Description:
> > > + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> > > + *	taking buffers from userenv where input and output buffers are svm buffer.
> > > + */
> > > +
> > > +#define INPUT_IN_SVM		(1 << 0)
> > > +#define OUTPUT_IN_SVM		(1 << 1)
> > > +#define INPUT_BO_ADDR		0x30000000
> > > +#define OUTPUT_BO_ADDR		0x31000000
> > > +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > +#define FIVE_SEC		(5LL * NSEC_PER_SEC)
> > > +
> > > +#define bind_system_allocator(__sync, __num_sync)			\
> > > +	__xe_vm_bind_assert(fd, vm, 0,					\
> > > +			    0, 0, 0, 0x1ull << va_bits,			\
> > > +			    DRM_XE_VM_BIND_OP_MAP,			\
> > > +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
> > > +			    (__sync), (__num_sync), 0, 0)
> > 
> > Not sure about the reason for moving system allocator tests outside of
> > xe_exec_system_allocator.c but if we go this way then this ^ should be
> > moved to libs as helper instead of being duplicated.
> 
> Because it on one leg is in xe_compute and second one on
> xe_exec_system_allocator. Tests here exercises both kind of buffers
> (bo/svm) and their input/output variations passed in userenv.
> I picked xe_compute as imo it matches better.

Ok, agreed.

> 
> Regarding macro - yes, this is copy/paste and depends implicitly
> on fd, vm, va_bits. May this be follow up series or you want to
> refactor it now?

Follow-up is fine, I just want to prevent that more tests follow this
pattern and we end up with duplications all over the place.

> 
> > 
> > > +
> > > +static void
> > > +test_compute_square_userenv(int fd, uint32_t flags)
> > > +{
> > > +	struct user_execenv env = {};
> > > +	uint32_t input_bo, output_bo, vm, size = SZ_4K;
> > > +	int va_bits = xe_va_bits(fd);
> > > +	float *input, *output;
> > > +	int i;
> > > +
> > > +	size = ALIGN(size, xe_get_default_alignment(fd));
> > > +	env.array_size = size / sizeof(float);
> > > +
> > > +	vm = env.vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > > +				   DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> > > +
> > > +	if ((flags & INPUT_IN_SVM) || (flags & OUTPUT_IN_SVM)) {
> > > +		struct drm_xe_sync sync = {
> > > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +			.timeline_value = USER_FENCE_VALUE,
> > > +		};
> > > +		struct bo_sync {
> > > +			uint64_t sync;
> > > +		} *bo_sync;
> > > +
> > > +		bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
> > > +		igt_assert(bo_sync);
> > > +		sync.addr = to_user_pointer(&bo_sync->sync);
> > > +		bind_system_allocator(&sync, 1);
> > > +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> > > +		free(bo_sync);
> > > +	}
> > > +
> > > +	if (flags & INPUT_IN_SVM) {
> > > +		input = aligned_alloc(xe_get_default_alignment(fd), size);
> > > +		env.input_addr = to_user_pointer(input);
> > > +
> > > +	} else {
> > > +		input_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
> > > +					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +		input = xe_bo_map(fd, input_bo, size);
> > > +		env.input_bo = input_bo;
> > > +		env.input_addr = INPUT_BO_ADDR;
> > > +	}
> > > +
> > > +	if (flags & OUTPUT_IN_SVM) {
> > > +		output = aligned_alloc(xe_get_default_alignment(fd), size);
> > > +		env.output_addr = to_user_pointer(output);
> > > +	} else {
> > > +		output_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
> > > +					 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +		output = xe_bo_map(fd, output_bo, size);
> > > +		env.output_bo = output_bo;
> > > +		env.output_addr = OUTPUT_BO_ADDR;
> > > +	}
> > > +
> > > +	env.loop_count = env.array_size / 2;
> > > +	env.skip_results_check = true;
> > > +
> > > +	for (i = 0; i < env.array_size; i++)
> > > +		input[i] = (float)i + 2.0f;
> > > +
> > > +	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> > > +
> > > +	for (i = 0; i < env.loop_count; i++) {
> > > +		float expected_output = input[i] * input[i];
> > > +
> > > +		if (output[i] != expected_output || output[i] == 0.0f)
> > > +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> > > +				  i, input[i], output[i], expected_output);
> > > +		igt_assert_eq_double(output[i], expected_output);
> > > +	}
> > 
> > This seems like a copy/paste from bo_check_square(). Besides, a few lines
> > above we set:
> > 
> >     env.skip_results_check = true
> > 
> > to skip the result check, which seems contradictory. Is there a reason for
> > this duplication?
> 
> Results check assumes square what if we provide own kernel might not
> be true. And in the test I show how to control input/output set/check
> from userenv side.

Please as comment the reason your test does not rely on bo_check_square().

    Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> --
> Zbigniew
> 
> > 
> > Thanks,
> > Francois
> > 
> > > +
> > > +	if (flags & INPUT_IN_SVM) {
> > > +		free(input);
> > > +	} else {
> > > +		munmap(input, size);
> > > +		gem_close(fd, input_bo);
> > > +	}
> > > +
> > > +	if (flags & OUTPUT_IN_SVM) {
> > > +		free(output);
> > > +	} else {
> > > +		munmap(output, size);
> > > +		gem_close(fd, output_bo);
> > > +	}
> > > +
> > > +	xe_vm_destroy(fd, env.vm);
> > > +}
> > > +
> > >  int igt_main()
> > >  {
> > >  	int xe, ccs_mode[4];
> > > @@ -525,6 +663,18 @@ int igt_main()
> > >  	igt_subtest("compute-square")
> > >  		test_compute_square(xe);
> > >  
> > > +	igt_subtest("compute-square-userenv")
> > > +		test_compute_square_userenv(xe, 0);
> > > +
> > > +	igt_subtest("compute-square-userenv-isvm")
> > > +		test_compute_square_userenv(xe, INPUT_IN_SVM);
> > > +
> > > +	igt_subtest("compute-square-userenv-osvm")
> > > +		test_compute_square_userenv(xe, OUTPUT_IN_SVM);
> > > +
> > > +	igt_subtest("compute-square-userenv-iosvm")
> > > +		test_compute_square_userenv(xe, INPUT_IN_SVM | OUTPUT_IN_SVM);
> > > +
> > >  	igt_fixture()
> > >  		drm_close_driver(xe);
> > >  
> > > -- 
> > > 2.43.0
> > > 
