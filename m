Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9380DC83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 14:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4749F10E684;
	Wed, 16 Jul 2025 14:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cnrPyOB9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E71210E684
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752677455; x=1784213455;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tVaPDjreImhr+SnWPOoK7BjXU3lFhM9yGOIcYk02rHQ=;
 b=cnrPyOB9w1xxFEc6FXcto4o8eoRzGi1QO0yhlDutyy7XNLaG25heGsBo
 DygLdNRizC1K8crD13RT5FdMSu20NcDvqj6O4wA3NX4O9Wi4elOB8K+D5
 ujqSIKdIPqfjeSiD0jXykhJoJPVLS3GBHw81jXDn9LOCJWyTTwaTVTux4
 8VDPpaWdS6aQh7ddwv4OK5eU2hiEJs0xUrks9MQC8GiXUgHGYf9dTmSwo
 oW4SxDzTBiOfSLMZoQBwLQ0hCpZMXoNaAfINOJ0T5MaTaPUJyJsGrFL5Z
 pKCHojPrtK5VF5NY87N7MS1yjoasfBYaANV2dJ4ZjJPidoRomWQbpnj4K w==;
X-CSE-ConnectionGUID: vS460GxQTT2vWhYY4Y14Fw==
X-CSE-MsgGUID: gEq5gqF1TzSWpFFl9c1O9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65187135"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="65187135"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 07:50:54 -0700
X-CSE-ConnectionGUID: 1/Da48rqQmKRycMOYzolgg==
X-CSE-MsgGUID: Z3HsaU4aQwy3tp+7bUFpug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="157878111"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 07:50:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 07:50:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 07:50:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 07:50:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wA2Jd/CJDRJvGl5D0kyCIlHC78UDHuUxNQcS4X45jrloh0IH9FaEiJnQzYr06mCmo2pOcK4qW4CWl40dQ52C979dmH14ABcUC3FO7R5ipEORvvKvBjD7Nk0OhvlrCJBkIwOm5ADVCWDhaZDmvf0lUwRJNc5e2jBAyHY8uoHhN2W/zk8eials7I84lWg1mXeo63ZhNTJiOZllr7cJ/4l4zQRmWGgTUnzHSFfxZlrRftKtldX7DJoFDNRUb8WFvzvHtyZ2oxcoFM8cb4J68Jp5cy0IhxikLxW3tQSIaOd8ngZiJXNyXr0StSMq7SIgNgxTgf5CzrwtfRK3tpqMLwsFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KCgTWqxhFQLnkKD0ee2KkUSxatdAreiumZaeGCJoCs=;
 b=VUPzIOBiNmNoACH9Ro2ZGM/ktDRrkiFPfQz1/EveNv0ZRho5OQ3ziAskxjdV26wj2HrukiVcvZIygUgyl+DObWB3Sj0dtWgmnrJa0ZgacKsYVaRmmWcxx4w/8GNzxGoNw5ou6vd6rl/N/DOXPJXJQgOhtsMwjBok2PSqaO42UFeynPgw6tEp3edplA7RVlRUqxh061kTc8M8g6HtfOEQhdbtLO0PuxfzRvDaM0/s9QUmWg8RCNkuOXM15Pt3XfDm8Lzu3OgxIY7Fm9wdUnwhZyr83TsGpQAj9tc1DuBuwhACfCcy9XE0ZtZbk/NngUE3dnQOtiHURKE5RLANMzjDzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 14:50:27 +0000
Received: from SA2PR11MB4811.namprd11.prod.outlook.com
 ([fe80::e790:74e2:d7b6:9fe4]) by SA2PR11MB4811.namprd11.prod.outlook.com
 ([fe80::e790:74e2:d7b6:9fe4%7]) with mapi id 15.20.8901.028; Wed, 16 Jul 2025
 14:50:27 +0000
Message-ID: <2f061322-cd5f-47d3-90e7-26c986874426@intel.com>
Date: Wed, 16 Jul 2025 20:20:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_content_protection: Add a test for
 HDCP-MST with suspend resume
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <jeevan.b@intel.com>, <suraj.kandpal@intel.com>
References: <20250702033750.711418-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20250702033750.711418-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::16) To SA2PR11MB4811.namprd11.prod.outlook.com
 (2603:10b6:806:11d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4811:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b8e4e5-ae1d-444b-3e0b-08ddc4781a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REY0OTg1V2Z3Q3RUSUdzRHlYL1VMTzlVdzl6UkcwRDZ5ZlFGNm5EV1laMU9w?=
 =?utf-8?B?TXpHN2lNUFpmRGlnOWd0K1NqSENMNnJtOFZ2SFNFOXk2R0JIYjFOQ2pkbDJG?=
 =?utf-8?B?TkE0SDhOSVUvMmxjc05nelV0cHFycGtWTnVBRjYraCt5RFovb0dyY1dWQkMz?=
 =?utf-8?B?dHJiWitDc2krVXFTdGVhb2ptV2p1WSs0TElRdUxwUVlPajdsS0hvSzhjSFJh?=
 =?utf-8?B?dlJ3eVpSNFhySWE5NU9VNzAwYnJVVzlraFpra3lmUDFjQVlFTmRMR3pvMHF5?=
 =?utf-8?B?bUR6c2s5S2ZrZzJvQVl4cHdYVFptUG12dU9FWFZHWFRHcnVIWldGYkpNeVNu?=
 =?utf-8?B?WVU0SlpyTGhhQW1UemVGS3E5TjNRWVZ6YWtXa1dKTjV5cE9YZmlkTjJIRHRU?=
 =?utf-8?B?RWt3UmQ2b0ppbWN3ZzY2VXZDUHg2YnQ1NTZ2MjBKQlVIMTV0cWNLeXYyM2dO?=
 =?utf-8?B?NmxqOWgzcit3SFpaT0VrSFhNWWk2Nk0wc2huWkZVak9tRVJIN0dMa1RWR20v?=
 =?utf-8?B?SmIxOTVvYTZINHNKeEVGRkx1Q2gwOHRUMnJaMDJ5S0RaZTl3dnRZdkpwZ2R4?=
 =?utf-8?B?OHVBZjR1b0dGNGFBRnV1d3BhVXV1NkdNclVVcWpMd25kOUdOM1c4Y0dvM2N4?=
 =?utf-8?B?b1RLUmJVNzE2dEdwaVMvM3o4ZHNsRTAxd1BYbkJYWmpEcFVEMkZvU3pRZTFm?=
 =?utf-8?B?RFEzWS9QZG81eFpKVCs0UGZGNTFlVEx2WEdVM3U5N2JWOXBMV0VmSUVqTXZk?=
 =?utf-8?B?ME9ZSGFFWUNIcGhJMElQN3ExZkZOVnh6Y0ZTeWhpMDYyeFhWcmdsK05xcUlG?=
 =?utf-8?B?WEhMdEl1M1R1RDg5c2UxNUdEZGlpL243MUd3MTVXaCtaSnJQTDZnRTB4K2x6?=
 =?utf-8?B?YWRud2JVUjVobTNlRnlHS0dGQjNqMHh3Mzl2K2FjMXBDS2NudFBOTHF0RUo2?=
 =?utf-8?B?alY4YXZSTElrejgyN0c0Y2ljRTVSYnVDSHgwZTdaYTF6dWpMR0pCV2hicGI2?=
 =?utf-8?B?aldsMmxTc1J4RG01UXp4RHl0L1RNWUNWWk8vbFdyYVVPMFBHMURwZXFjZVlj?=
 =?utf-8?B?ZVEyVjRsQXJZSGxwSUl5dm9FMkdBRTNiVllBREFmTHBLM1MzdGM3STg3cjVJ?=
 =?utf-8?B?NlphSVh0Qm40bmNjaUVlSjVVeUI3OE1BSmRVMVV5VTh6R29DSERSS1NkcU1F?=
 =?utf-8?B?dy9QSmo2Zi9XMHRwT3ZEQ2pMdHc5MzMvZDRJYU1RbCtIMjRGTFRwVnRKeWNO?=
 =?utf-8?B?OGt0eVpXMGkyTzhWVStaQjIzdnIzQjB1a3NWMWhKNWtySHd6dm5HRmIreTU1?=
 =?utf-8?B?ZWdIQnJod20yK0cvUG5GQkVmdW9ieXMrb2FLeURlL3dRdTFTMGNSTXZTcnhp?=
 =?utf-8?B?N1Q3b2Era0ljdEtmR0Nha0hET1dMUzJ5VUFHYUkzQWlzaFNPL0xXbHlrd2Vt?=
 =?utf-8?B?N2pPRmxNWjlFSmJPQWpqbGZGcThDRUxabnRJeFJoL3JWMDNqTTdqdFUwaXNH?=
 =?utf-8?B?NGxTbG5NbUFWZG9SSVdjcG9JcWhLdFNkVlNycWttclJKY0ZMSnNRYlBzQkE0?=
 =?utf-8?B?VlRFZjR3bmNxRjJSVWxKK2FYbEJDazJXM0pVZ1d2cERrcTlDU2xCSVNwVmRW?=
 =?utf-8?B?MjlpOHl1Rlh4S0V0VmtralpvNlpYay9WMzVScHB0OHVnUWhINktnREg2Uis1?=
 =?utf-8?B?eVg2V3k2eDJjejdjMUY3TEk4U3FhYmpMbDhLb0ZVM29yR1RGQ1dNcVlNRzBo?=
 =?utf-8?B?NUZKdVBNbUxSbHlKZ1BRWnprZnRENkwzaGxhQXVha0MzSWIrVXFvN2pLa2g2?=
 =?utf-8?B?N2lOVHRER0JYcmtTU2VMVS9pZk5hZlpycUMxeTIvWlp6VXp5V0VVU0w4Mldq?=
 =?utf-8?B?T2U5S2hXYWl4Z1ZyOCt4M3F3UjE1QURrZXBGYm9kWWZOcWpnUXhkVnRQVHlQ?=
 =?utf-8?Q?pDfIstU5YiE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4811.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmJEaVE1QUpWMVlFWlJ2akxsYTBpZmlWaTlPbzFhUG1jYXJwSTBzcWgwYWkv?=
 =?utf-8?B?SlI2Qmg3TDVyUndKa1JmLy9aMUo1Q095NmMrSklSamxHelBJcmRnQUJEVTNw?=
 =?utf-8?B?ZWt5VXhINkYyNDVHYVhjVmhKdVBybHJlK2liRUp1dkFoMWVsb2FodThwTzZk?=
 =?utf-8?B?bE9xTFA0NmZ6alprVWxyeFAwalpwWUU2bDhKK1ovdTRFd05ySXRmQzdQOXk4?=
 =?utf-8?B?ZVZUWFR0N1dJUU5FVzk4eDg1RGFTQWJ3SGp3OXNKaXQ4bC9YR09pMGlNZG9W?=
 =?utf-8?B?OSs3L2NxU2ZCYTMvZHM0OXBrYm10Z1M2bUNmSUxGL0dGUWVtL3p5cWE1d1R4?=
 =?utf-8?B?SFpRRmZ6SEs1cG5aYnJGTExUTGIzcnh2MFNGZi9TRzVRaDhuRkd1TE9zZnFy?=
 =?utf-8?B?a0Zwa25PRGpmc0tpOUJHb091MmhlREJNVW9yUW5yeTRKQSs4ZXNoYi9DOCto?=
 =?utf-8?B?WlNvUWNtcTAvRUlDeGtjS1hrY1ErZGV1a2JycDg2bElVNkR3VllQRXA4bFFl?=
 =?utf-8?B?ekJaMWtDcmZZaHd0blUwMnkwdVhHODRINS9MMG0zOHZKYUQxcXpxU0cxenpV?=
 =?utf-8?B?d3FZYnYxdElUdDUydS8rVXJPQUl3eXhCSStQbVZza2dWWlRyZGtxcW02SVpw?=
 =?utf-8?B?SmFGajJZY081QXVscDAwV2JKQlNtUVBtYVFMbDl4YXRWbWEzeEU2cytVc2pa?=
 =?utf-8?B?VHJHL2R4dW9iTFRXVThRSWhJL29vbmYvOU5JRGlHd0NYeWVXM29sQXBqWTVV?=
 =?utf-8?B?V0dqT1Jod2RsdDNsaXY4eXRnaEJtTE5ncVhnVWNZSXpvOTZRWVZIK2MyRFB3?=
 =?utf-8?B?dWNDeTVUL083SGJBK0FpZUxXVGdKUW9LcEJKd3lKTTZxM3QwcWx3U0l6WTJa?=
 =?utf-8?B?Q2MxYjYrbit2VDF4bkJSTThIRkpyUkVVZm5JQ0ZHM0NiSVRtajhnNExOUzQ1?=
 =?utf-8?B?UDdlcE1HZEx6dFNOcVdXa1M3aklnSU45UTZMZDVNTWVwaTF4emtHdnFqRTJq?=
 =?utf-8?B?Yis3MjNGazAvNnROcVNybGlZMGxMVzk0WFhBMkRPcnN2RlNqcnVvVFM3OFkr?=
 =?utf-8?B?RVRoMWJsRnNQM09XQ3NZQ3oyaWRpSm5PWDJPSmhnRkU5NEZQWjFmRkpic3U1?=
 =?utf-8?B?TXdyczJnSGw4SGwvQVVHeHVyeUZWaFp4SEM1a0JYdWRhRlNNYzhZd09ESUt2?=
 =?utf-8?B?SlN2b2pBcEJobE9VTDFMWWZ1UkVTVzZRUFI4MXg0emZkWGV1RjhKdVZyU3pS?=
 =?utf-8?B?aEdIZy9KWjlMNG4waHcwdVZKclN3R2J3UzZ0QzZaR2MvaFhZUGluZ3hUeTVa?=
 =?utf-8?B?KytON25ldklyeUhEdUl1VDF2cW54ZVlCbzZ2UFlLUEV0UktuWm92Rlo4RFJD?=
 =?utf-8?B?L2VvZWlZZmxpWE9NbXJnQ3hUbkkrSUhvKzdMY2VnWlN5a1RyT0tWNjZTd1dw?=
 =?utf-8?B?dC9ia1B5djBKU0svemlTTm5HMjZsUkVmTE5XT0FnZXpIRnlmMkIyTWc0Q1Np?=
 =?utf-8?B?ZS9sL2dHWndCL2tSMnl3VzR2ek5ZWmJBblg1ZmwrSDJwdmJtYitoMlpUY3Z3?=
 =?utf-8?B?SjNrVVlYZU1WQlM5dTBHRTNyVERnWG1IY0tKVkNEUUZEUWtnekc4bHYxNEUr?=
 =?utf-8?B?M3B2NmtxZzVrRWR1alMxYTRBc1V5Q0xHL0orQVloazJqOUd6RFk4bWxBSFVE?=
 =?utf-8?B?N3dJVElMK3Q3aDN5YVBueHZNa3EybnR1MEhRTi83emVtTGpIWldCVmVCRWh4?=
 =?utf-8?B?SXhSaHBxK1pxdkc5R0JSLzVlUUovWEpQNWsrUXVMWVh1ZWtVUkZVcE5nTGdz?=
 =?utf-8?B?SjZ5aFY4NzNnS05XaU5ZNmt4YXV2azhxNDlURnI5N0cyQVpwWGFMTFVyL3F2?=
 =?utf-8?B?Yk1nejlrelZNWnEvdVFxelVndUQwc050ZE1XT0x5TTJSanBoY1FubGxqVTVO?=
 =?utf-8?B?NGp6OG5RN0dob21GSGhJQ1hEODAxYm1uRVpOWDNxZnRTRHpZSUtYcEVRdENx?=
 =?utf-8?B?QS9TRnBLNEFzRlptdTNld2lOUDRSTTBIOEdWSWdmS3ZYN0VqUEpaN3Z1L0hs?=
 =?utf-8?B?TW9wSVdjRTQ0bmVGYTVad1VJTWwzd1g3VUt0dHN5UFptZTh4Q0tzaFY5ME5U?=
 =?utf-8?B?SEJ3bHlNbUlGUFM1bnoxeTM3eVB6RmcvRWUweUVlVVEyZlVxcEF4YlBLKzRv?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b8e4e5-ae1d-444b-3e0b-08ddc4781a11
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4811.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 14:50:27.4560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZogKNWcGeCvbqQLD20xm4xmCjiv3bqcBay4tfg/Ra6QJcQQz7p87ItIA40hYULM8XdnO30DYb3tE1TFMyuVFE/U8pdCGKE0QJ2un7tMw80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
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



On 7/2/2025 9:07 AM, Santhosh Reddy Guddati wrote:
> From: Jeevan B <jeevan.b@intel.com>
> 
> adding new test to validate HDCP-MST with suspend resume
> test check for valid output which supports MST and HDCP
> then commits and check if the content protection is enabled
> before and after suspend-resume.
> 
> v2: Change type-0 to type-1, try to authenticate hdcp few more times
> as suggested. (Suraj)
> 
> v3: Add a new test for suspend-resume non-mst.
>      Added suspend-resume handling to existing mst and non-mst test paths
>      Updated test description and documentation.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_content_protection.c | 38 ++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 51fc1d3be..d17d1702b 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -74,6 +74,7 @@
>    * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
>    * @legacy:         legacy style commit
>    * @type1:          content type 1 that can be handled only through HDCP2.2.
> + * @suspend-resume: Suspend and resume the system
>    */
>   
>   /**
> @@ -86,6 +87,7 @@
>    * @lic-type-1:   Type 1 with LIC.
>    * @type-0:       Type 0
>    * @type-1:       Type 1
> + * @suspend-resume: Suspend and resume the system
>    */
>   
>   IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
> @@ -104,6 +106,7 @@ struct data {
>   #define CP_MEI_RELOAD				(1 << 2)
>   #define CP_TYPE_CHANGE				(1 << 3)
>   #define CP_UEVENT				(1 << 4)
> +#define SUSPEND_RESUME				(1 << 5)
>   
>   #define CP_UNDESIRED				0
>   #define CP_DESIRED				1
> @@ -479,6 +482,18 @@ static void test_content_protection_on_output(igt_output_t *output,
>   						  content_type, false,
>   						  false);
>   	}
> +
> +	if (data.cp_tests & SUSPEND_RESUME) {
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +		ret = wait_for_prop_value(output, CP_ENABLED,
> +					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		if (!ret)
> +			test_cp_enable_with_retry(output, commit_style, 2,
> +						  content_type, false,
> +						  false);
> +	}
>   }
>   
>   static void __debugfs_read(int fd, const char *param, char *buf, int len)
> @@ -813,6 +828,18 @@ test_content_protection_mst(int content_type)
>   
>   	test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, content_type);
>   
> +	if (data.cp_tests & SUSPEND_RESUME) {
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +		igt_display_commit2(display, COMMIT_ATOMIC);
		--> Do we need this commit, kernel should automatically restore the 
display state after suspend/resume. Please recheck it once...> +		
> +		ret = wait_for_prop_value(hdcp_mst_output[0],
> +						 CP_ENABLED,
> +						 KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		if (!ret)
> +			test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs,
> +						      2, content_type);
> +	}
> +
>   	if (data.cp_tests & CP_LIC)
>   		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
>   
> @@ -833,6 +860,7 @@ test_content_protection_mst(int content_type)
>   		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
>   }
>   
> +
>   static void test_content_protection_cleanup(void)
>   {
>   	igt_display_t *display = &data.display;
> @@ -941,6 +969,11 @@ static const struct {
>   	  .cp_tests = 0,
>   	  .content_type = HDCP_CONTENT_TYPE_0,
>   	},
> +	{.desc = "Test to verify the behaviour of HDCP after suspend resume cycles.",
> +	 .name = "suspend-resume",
> +	 .cp_tests = SUSPEND_RESUME,
> +	 .content_type = HDCP_CONTENT_TYPE_0,
> +	}
>   };
>   
>   static const struct {
> @@ -969,6 +1002,11 @@ static const struct {
>   	  .cp_tests = CP_LIC,
>   	  .content_type = HDCP_CONTENT_TYPE_1,
>   	},
> +	{ .desc = "Test Content protection(Type 1) over DP MST with suspend resume.",
> +	  .name = "dp-mst-suspend-resume",
> +	  .cp_tests = SUSPEND_RESUME,
> +	  .content_type = HDCP_CONTENT_TYPE_1,
> +	},
>   };
>   
>   igt_main

