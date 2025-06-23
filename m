Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0424C7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 09:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8046B10E2DE;
	Mon, 23 Jun 2025 09:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkMxq8Ad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D8210E2DE
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750672300; x=1782208300;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vXetuKunMPeW90Nuq41OuSn4yB2PuaxXfK3y+fZX9XA=;
 b=AkMxq8AdIOAS58QykqWr3wrgAAlfg+e/U2v2LDd0OLo/tV42oY9fj/n4
 NzTU6/QPcFQ7BBk9itwmFWjE+1yOseuWPNfuWC0fP86gVw3xfOIlPZy/s
 jEXeLWR1fzLWffquSDbqjjWqhXBDiNc9RTUd3kwVC1vVMYV9IZhPnQ+9d
 UVyDY0AUClyxA8yTVpNmrhcK++nevXS0XyzC9bO9iH/RY3Co4aaILx8Hu
 0QpUEiSzsgh32ZsWKNli5blDO2nts3z7miiuq5SM/7h6r2WFfAWnLWPQp
 FwHw2rtwUhWBK4EVoGV4EXnP033CfiHYUsLHaknYZWsEJSBW50rD0NUEY g==;
X-CSE-ConnectionGUID: SYqUC6rYT7KxpFBEB5FwMw==
X-CSE-MsgGUID: n+5n4+3NQdivobo06/3R8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52738803"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52738803"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:51:40 -0700
X-CSE-ConnectionGUID: U0Kt0UnwQWyiVd7TaBs64g==
X-CSE-MsgGUID: lEo9esMFT9KUARf+jQpwHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="175157540"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:51:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 02:51:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 02:51:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 02:51:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sT09lCmszsoA/VUkZopUDJ8Akill3RLCChic1atFi3C2wfZooLoHoj9WsFnO9a3Z8tg2MjtdKs/W5GqjxJ5/TtIxeLububyLJhIhoTkUnKBaqVnr/t8kEaUqnrW59eoDpYQvOaxcIeHcVtiBP4mBrBH7BUcslBH0dOb84VWssrDXgVVybSFeWNkLLnV+EYUnd5bD8wE+rsjXL5sa0g++m8gOHZkT/dmUUkqcf3VgMpzReWr+vywQBFASEkkLu4iedSIj40lrOJxEiAGmKx8CWf/B56h6Tk3rLs7hrgU3YtpgPlQwOSa7M7ThNu7MyDg2AM/fMxp/Al1wxwjD4+2qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dn7I1DlIyIpqXA7MSvwJ2XXsRhNZXzAAjCDk3wFepMw=;
 b=OdvpoM0lFomffh/OoEbXIYNmXw4JXNsaabwtOS/dDj3slqoGXZjXSiwPLnUmB/aow/pQXRir+Qa4jk8cSbmGIrcAywzrQeBk2goPEXraYCrZ4UysmrOim2j89IDM7UStg9Cev2OgoeSXs9PDGdfYOri5mIrDoRj8/bL+Gxp0yyyEWPwmlH6jNsSTVvQ+v+eEbBKjmFMtG7uo1bPO42hot/hFwsWnZfyprqel/4brkHE/mNrIebtNezNPogJgQub6qBlIdA6oiUa5f5PdjhMLIDRJ32Uw+WjlIPBvBNsYPPwF/ISevP9WbhtI6ieebFJQJdEwqdqsKepiWU5crwXldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 09:51:06 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 09:51:06 +0000
Message-ID: <6bd6761a-392a-44b1-8da6-8b3e73d963bb@intel.com>
Date: Mon, 23 Jun 2025 15:21:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] Revert "tests/intel-ci: Blocklist unsupported Xe
 scaling tests"
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250623080515.130665-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250623080515.130665-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::28) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1f3332-09e5-411c-8dbd-08ddb23b78c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDdST3hzL0Y5dHJObkg3U2tvMi9kVmpna2hVaWl0STFSWUtmVU5Wa01MTGdy?=
 =?utf-8?B?bE9oNXNqNktsM1VOMWlMdlgyUFFmVnlFU2FEQ0p0eHJCMGgvQ0I4Q3JLelJQ?=
 =?utf-8?B?MFVkaVpFT2liNUlkSEpsMm9jcnBIcXlCYncrdXpvUkRsYkJrK2NFTGxSZzNs?=
 =?utf-8?B?QmVYZW56VFRDVk92MVBmZTAzVnpyT0Z2QmRseFNEcW1SRTZ6ejJFeFo0L21G?=
 =?utf-8?B?NFlNUXdXOTF5Wk4rVG1GZzlSdmxjUDZHQ0pKU0dkYmVHVUpIQk45SXB5c2xI?=
 =?utf-8?B?L05Sc1dRbC9ZQXptb2l1YXdFbEs5QjlYWWVHOE5RbFg0QkNsQVBpOGpmYjJB?=
 =?utf-8?B?ZUd5bkliZG9aWWVBd0thOVR5VDQ1OCtNakpSMFdDWjVWQWhNZFB5cVRSc2VU?=
 =?utf-8?B?ZjBwbC93RW96aFBvcFdXN2pKdHV4M25SSVBuTDNVQ01NZ2NMTTRIVWtMMjRE?=
 =?utf-8?B?Y3I2bXVwYjh5VDJQTjg0THZ4UiswK1ZwOHNWSlRWUGFMU2tRdUpnbVgyUTF3?=
 =?utf-8?B?OU0yTjRuRWNaNDdUVldUL09aMXRBd2praUEvYklEakRCczZwTFFHQTVPZHZF?=
 =?utf-8?B?QVd3UnZ1TkdrakNIY1F5UXJUaUc0U0R6NTI2aUxkUUtVbXpTbThOd3h5RkZq?=
 =?utf-8?B?MTQ2Nk41TUNoUFlCSmNYUCtmRW9oQ1dTb1VTV1JLb3JNc1BiaGkwdUFhTTNt?=
 =?utf-8?B?bnZDd2pmVXd6T0pZbzFuRlRPSHFvdGJjaTJ4TmZ5NFcxUzB1TFJJd2JleVBs?=
 =?utf-8?B?Z09GNHJYVERZZGI3Q1ZLWkE2d29xTjROMFF5dW9mSEFlUXZjMXYzQjhkRlo0?=
 =?utf-8?B?Y3Q0blpDZ1FycVdsdUZ6Zld1Ukc2bXEyQ0hMRVJ2SFFGSUVaYnJCYUpwbWpR?=
 =?utf-8?B?ZFpEV1ZvRXU3UHNZWDQ1MHY4QjhGMzRpa1ZrZ3FVYnFYQ1k4QkRTSURnejY2?=
 =?utf-8?B?Vkh3K29Sdkk0VFRnbi8zQTlsRTFMTDdIWjZsVUh6UlpKZDZucGwzRWNoUGp6?=
 =?utf-8?B?SUFXZWRQbEpIZXRCeEtFdHJDOVIxUVk0cjJOR1VYSVNkSE0yRktvUzhtczM3?=
 =?utf-8?B?VndtTFlvNkl2OUdRa1ZmSm0vak1BVWJ1dzlmVnV1OXFuM1YzR1N5SnpCTVMw?=
 =?utf-8?B?ZnZERFV2dFpmeDV5RmQrVTNLZzZYMHdCM0RUVHAyeUwzZ3BvL1ZpenZHdnQw?=
 =?utf-8?B?UXNhZTdJUUFiRzZmSjhhL0FhakpLajdMOTZBUXBvbGVKUW16SjZrMm1OdXFD?=
 =?utf-8?B?dVRoTDFIVkpzMXlmMWdaTmV2TEpJcTJ3VkRiWTR4UUxPVUxXd2lQNWhscFF4?=
 =?utf-8?B?WW1UcllSMENTVi9mcldPM3FPU2JOYy9Yb01SK0JZYm5Wb1FQcGFMbzExaHRN?=
 =?utf-8?B?ZXFLeGhtNm8zUWY2SkJaczZzeVpZSmJNTE1kblFZcTJDa0ZLZWowcGt1RHBX?=
 =?utf-8?B?SnhhQlVHNVFDN09XZ3JZM1RPYUQ1TjhNMkEybVh5azZwV0pMazRRSDVtMzY1?=
 =?utf-8?B?ZnpuNy9SL3VmYWNick55TERTQXozYXk1VjNYZWZjSHhQdEJHYXlvaWEvaG1K?=
 =?utf-8?B?dUZBUFRkYkhLM3pWdDV6YWx5V2N6YVlqcGUreFErOTVEM0ZqblpRTVFLT0RS?=
 =?utf-8?B?NXVBWXRLRkExUlZRZTR5dWVJR2ExNGVwTlh6QWJoTEZtNnFiUllUMjJIbXhu?=
 =?utf-8?B?d21PV0NXcjljcEIrMS9YV1I5YlRYVUdOclJrUnR1U2ZGcmdOWG0vUlcwUnFR?=
 =?utf-8?B?cFBxcExzMEptS3ZzTllKeHpkTTI1Q0tHaTViQzhxaW1RMkhjaVhJdWJqbnRo?=
 =?utf-8?B?NlUzTnkrdEVBUEk3TUk0YnlSVmV3MjdmUlorbmxqWGFFdDh6NDZkSFltMmFj?=
 =?utf-8?B?ZklTM0MvWk5pWVpsbHVNL2pyNkM1bjlMRDRtclpMVVpmcHE2Z29MMHc4OTZV?=
 =?utf-8?Q?eGdP7RQVKh8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHU2WkRmaFhJY2dxQXNqWDk3OWZtTHRabkFjbitVdmJsSENCK0Z6Z3gwWUhJ?=
 =?utf-8?B?ZStHUURyRDdWWm5pdVQ5R3U3ODNjaWhsR2xxa2xWd0x1YkR1Wkl5aGU1aS81?=
 =?utf-8?B?MmpYenNuM3VNZWNNeVFCbFRWOUtxUW5TbWg2Q3R1N3VRK2U0M1V6eDRYMmlw?=
 =?utf-8?B?a0tLcVdxQUFJRlF3SFVvZExETVBOZGMrSFd6MHNtMUhOS1NLYm1XTGt1RVhB?=
 =?utf-8?B?WUN4dkJsNzV6R0lWbFNrMVBjSlRXL28yV21kd3ZWc2JMQm1sRmwyUGY0TVZR?=
 =?utf-8?B?dlFNN0RDenpYejNuTjE1TXFPaFgwbE9wdWU4dmZ5VkFnL3Brd0p4RGNNenRU?=
 =?utf-8?B?U3VOYS91OHpGSm9CN0RPWFE2Q2N0ZHNUcmVBQWdmRUEyNDZtTGpNQW9RQTFC?=
 =?utf-8?B?MVVUVnR6TmZ5MVA0UmVwYmxoN1phdXZWZXNNOFB5eFNGdGRiV3kxaDFkdXp1?=
 =?utf-8?B?NUV4a1V6M05sSXNva1Q1Q0U2akVuNW5jVlMwM25iWGhBVzlreElsR1cvNlZP?=
 =?utf-8?B?dFlVamVHdkRkbEJ5bElTU09ac25TeVl0OGtrSHdLVVNRMlNkT1p4aVgwd2di?=
 =?utf-8?B?OUNXNE9LTVZteXYwZXZWSW1ZNzFmQlZWelo0dnlObXg0MUtka3ZXaVJXY3lQ?=
 =?utf-8?B?WGpkU25zbjZRYnM4UHlUUWh2NVpyQ2lxM1BJbzRpb0dacUNFbUpSS2FkRnBw?=
 =?utf-8?B?ZG00djhlbVZjMUdNZGRBTUg1OGg3MGRGWXVObVJ1Q0NQQk92Y3hsSTBPelN0?=
 =?utf-8?B?elgvdktwcjZOcVVMYzZiL3dndnZPMUZkZkF2RExHQzh4ZGUwOHpQZk9ZZG1M?=
 =?utf-8?B?TEZ2dENMNi9JOFdGQUl3WVZaTW1FTnZpeHF5VWxBejFMRHV6SnZ2bmx3NEdC?=
 =?utf-8?B?aEpLNjRwbU5adWZjNXFEUi8xTXhjYmxIM3d2bm90aHV0c05MK3NudHRFcG9r?=
 =?utf-8?B?Q2JGMmNQRGNyak1tSWJydHljOFFLczkxb1ovWlJJRVJmSm5lWVg0ZllMRUZk?=
 =?utf-8?B?dDdmdmVLb0ZZVDl0L0pPS1VFdkg2bW4xeU1pY1B0K3ZONUdlUXliKy9ON01S?=
 =?utf-8?B?d09ZMG1aRUF1WFNVM2MzdUYwZERJRUg3RmJud05JTDN0Nng4SzhNazlKT2kv?=
 =?utf-8?B?RnFQWUFxVmEwc3Y0c241WDloSElRTWpmUDhrRG56bmlmbm84OXFKUXNwQ2xH?=
 =?utf-8?B?cm5lcEE0UTUwa3NDaSt5dWlFY08rYVA1TU95RGx6bWQ2cG5KdmQweTJwYlJ3?=
 =?utf-8?B?THBITDV3bVp4Q21OcmpBVmJ3VllOK05YRGg2SFQ1WU5teEFSYWI1Nm9Pd0s0?=
 =?utf-8?B?SnVrK3lRdDJaSEhGRFRMWU9WOUZIUEE1eWhaeDVScXhydjdJb2Y1UFNyRWM5?=
 =?utf-8?B?STZKVnRSakUxMTlHK1lta0tOcnIrNklNTTNDUjMyWkVmNWlQZS9kcjUyUXNW?=
 =?utf-8?B?Y0wvM0hISVB6dUIzZ3RmQnlmQ2p2UVFFZ3MxSmU3a1BNaU41ZWo2OHIrUjVs?=
 =?utf-8?B?c1QzQXFzWXRwQ2I4LzY2aXBBdzIrbWJQTmhtMktuVzRhVXlGRVhtOUJZaXdE?=
 =?utf-8?B?ckkzZHlmSGYvc0xlSm1aVnJ3ZVNVdG9CT2plc2lnOXp5TVRlQ2Juai9WSzJR?=
 =?utf-8?B?aFU4NyszZG4zMkl6NUc0SGxtaWdEdVREeTVIKzdLWHJhWjFmTGNNTE5vSE1u?=
 =?utf-8?B?MnlOK3IxSlgwdUllZjJtZmd0TlA4eHYraWpMbU16K3ZNRHR4dytpNUhTcVdT?=
 =?utf-8?B?RGNIT3RRbE95SHRmMjVKLzZpM3VHdU93aUFOa01HSmp0OWs1MTU2cFA3Z29N?=
 =?utf-8?B?ZXJaZHZpZU05cC82ZmsyNTg2RmtBL1I3OGtqME1NQnNTbVpONDh3VEJmdUc4?=
 =?utf-8?B?SG5aYW5XeDl5VWN6NFVYSWdtR1Q4Z1o0dDRuKzBjM0pGL0FHaDJaSi9lUFpu?=
 =?utf-8?B?cDQ4emFoNlR1ZFd0ZVNxSU0wTzNHVzRiOWpkY2ZQaHBCcU5ZMjhBUG9CK3BN?=
 =?utf-8?B?SS9jLzlrMnlWbXhPem4wVkc5UUdoNzRNWUMwTWhadEdvZ0NVc2F0QzhrWG02?=
 =?utf-8?B?a1ZOWHpqemVIQlJNNmJ5dUtwY2FsbWo0M1RtVGdrWGdZVFFwcmRUTGhONUxL?=
 =?utf-8?B?NzJKMGd5b3RFd2FGejd0NHZZWUIzRWtwTnozMTVwRk9EWm5ZamdOck1BTXZn?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1f3332-09e5-411c-8dbd-08ddb23b78c5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:51:05.9240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UhuRoypiKGHAQ3eYpZVNlbctNzAl3tL9VlE2pHfE9CGPjHHH0N25WSLPUC9CQHzhvLdhOpWz49WEhHZtzO61A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
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


On 6/23/2025 1:35 PM, Naladala Ramanaidu wrote:
> This reverts a previous change that caused unexpected failures
> in the adlp/dg2 xe test runs. These tests are expected to pass,
> and the patch introduced regressions that need to be addressed
> separately.
>
> This reverts commit a0d787e069ce10aa444c54b7d1ffdf5894826c68.

Please add your signed-off-by while merging this.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/intel-ci/xe.blocklist.txt | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index dcdce8b20..ebe1ff006 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -82,8 +82,6 @@ igt@kms_pm_rpm@cursor.*
>   ##################################################################
>   igt@kms_atomic@plane-primary-overlay-mutable-zpos
>   igt@kms_plane_scaling@.*downscale-factor-0-25.*
> -igt@kms_plane_scaling@planes-downscale-factor-(0-25|0-5|0-75)
> -igt@kms_plane_scaling@planes-upscale-.*downscale-.*
>   igt@kms_prime@.*
>   igt@kms_scaling_modes@scaling-mode-none
>   igt@kms_writeback@writeback.*
