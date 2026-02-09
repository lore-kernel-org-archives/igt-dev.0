Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A24EB28F7
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 07:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E576910E140;
	Mon,  9 Feb 2026 07:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0/JSgzK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1AE10E140
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770623697; x=1802159697;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xx/QRzgiEShXiR07BzMux3PRDykqmJfcK1gj8/EX1sg=;
 b=Q0/JSgzKc3tuMzklgVHihfPbYcQv66LX2k08oUk0s2p6YE7TjZLRVuZR
 YZLpXkHg0T5+v7gZ2jXQwuDkPihMC+xMaoIkLZqjmvtv70VnWgy/dwuUR
 zl2uBFc2Y95okhUnugZrRg4RNuxRl6emiOOHYnZXHcnr4Dn11JCWeIe9/
 l6mRT+xzPJeRKLpSCTCXnlnoGFwZBT/bQaYEw/WSQC1CfVnt54Zo9GJ2d
 72LsOuxfMaNmaK4mwUW3YbdGx6YUadXc0m7+aKrh+GInmf8dohSBYDBI0
 k7bSiHizqJdcQZdBaRj4l69JI+LzV/HpviQhqFXF0ZC2cS7bRzKrHrUzi g==;
X-CSE-ConnectionGUID: Fn2jfNWrQR2Dy6bC4vM8rQ==
X-CSE-MsgGUID: WE4Tf8v1Tu2GYAS+rhtPFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="94376745"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="94376745"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 23:54:56 -0800
X-CSE-ConnectionGUID: gtCx/n1gTWWrEmyrayShzw==
X-CSE-MsgGUID: sahAIOlSSUarbcbnoL1mMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="242139714"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 23:54:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 8 Feb 2026 23:54:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 8 Feb 2026 23:54:56 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 8 Feb 2026 23:54:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RANYtUV2R0UhG/RvEMY0X2DBAuLcoao61kmi1i5Z4g08snxy7nfhs0f0qUWDhb8BrL9p6N4bCPd/GqNs+3KK0SlFfBQmo6vD/JfYVv7Gks4/Q/HfyY78sbyGQjSjVJEQ624m+oVWHg6tYdSPjVZmuku4EMjWzQ3jFmhyfyr5AItYo5rzvgsGna5mkWFu+FyWXG15P+ke9psLl3OYj8O1/Jllsg9/2g4ZTzgFTDzBUWgfqjKuG7VJi1lUt5MqvsMFkNjUbYU/CPcs+IqeRjhDo+g8nSu3mMveDlmMOOoITjDI9gUHsWsMwXajx39rYZ281ezJM+tHHDKAb00fmH6eSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxD7MH0Q0A39jNel7s0HAi/otACHwOem3u1k2Yr7rNc=;
 b=MM//K1XilCjpmoGDCdd7zR3Enoxr8Dzm/LJ+uvyRtFhaT1HfpY6YhlE2H1w3ERGxk3PRZioldqOxHZ7fyImToHsMwFyzgOSYKFQ1DnbbP7HSeBNCICmw99+YqgbNi2MhAAi2CP+E6Ifzxfdy3waCfs49tRHfZg/4B7KCLBmA445KBbfrvigTu0A2CxcWYVeZ52LhfIhy64ZqDY80Dv5TJszEaaNHe2oPrIBTZ7+5wZJZB2m5/13uBqV/sOqFcoSwpUkfjDYLxR3mKcXrcaxlcdhWiBvru3+EzmYkVYvuxz+5WXFe1ZhFty2HFhw6GehmfNq/q5LtxggAY+rD/mdxDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 07:54:53 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 07:54:53 +0000
Date: Mon, 9 Feb 2026 07:54:44 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/6] tools/meson: sort tools_progs entries
Message-ID: <lok2v67hjmfqo4324l5h6axrxxvt6jo2b2wf6kbqwiflllry23@s2pxcore326i>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
 <5a029b0e37ce4d57345c86ae910b7aee19cf480a.1770212190.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5a029b0e37ce4d57345c86ae910b7aee19cf480a.1770212190.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DS0PR11MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: d6adb7fc-ac47-4727-a6ed-08de67b08293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3RNeGllNDA2WEtOallTd2p6WWptS2U5SUQ2cWFYZi8xd2dRY0JqM1QwbEM2?=
 =?utf-8?B?T0VlQUZmaXkvdUIzLytIbnZyS21oRzQ0UWNzU2QrTEVYaHZaeEloeUFNRlN0?=
 =?utf-8?B?NTYybTBRSFVDZUpjaXYwTWM2T1AxdlE0K2lveU01UUtmbE4rRitEUUtQS1Uz?=
 =?utf-8?B?ZHlUYnpGYWdQMVZCU0kwZ2hTWXE3MWJkNzU4QmprTlJ3cVh5Uk5WY3R0Mm50?=
 =?utf-8?B?RnlPRlY1bFlNYVJJYUJyOFlyUHVCRS9PLzBnV24wRHE3blBHV2RyVzlDaFBM?=
 =?utf-8?B?NGR3QTl2OFp4eVBFQmgyc1F4RldrZTJaSXNJdVJWN1p0Mkx2VkRldDVSK3RN?=
 =?utf-8?B?TlZRUXl3TWtiSjlzNW1FUjVUWWk3cWI3Mk1EOUs1T0Q4UjlEVlVxeTVUQWdt?=
 =?utf-8?B?WXBxWmJ6ZE1LVm9WaXdobThjVFN2SnZvTjNMYmlBMEJ0VHpCMWhXOXNhTzlo?=
 =?utf-8?B?TDE1VURLYnRhQ3lDNVJiZEsyWlR4eU02TG1Vc08vRDhkeXhHUUJLL1h0STBo?=
 =?utf-8?B?QU56WENlem1WN0ovYk9rTjdnU0FCZFhjdnkyMTFJTDJ0WnhRVWNwb0RHc1FJ?=
 =?utf-8?B?S3dVR3NYM3lLNlhyTnZUaXdxbytFdHlOTDlVL1kwamtNSjRGbXpOOW1zcVFS?=
 =?utf-8?B?R1dKLytxUkJVWUI4NkdXNmd4UGtQTlRUQ29SM3F3UG5wckZUOUU4ZmFSU1RF?=
 =?utf-8?B?eUJsV0huMXNGV3hjQkRYMXFUSVlsQVpiT1E4bTY3UTk4R1U2aFZ6UnpFbDNj?=
 =?utf-8?B?bS94WW5nU3pZQVdsS2NiQ2ZXNlplSFpVY0tzc2FPMXQyTy95VTd0a0g3NWZF?=
 =?utf-8?B?NmdBVHk3TkRiNm03bS91YThvVVFpK002VkVVSW1WSUl5R0psRHNiQTNnREFR?=
 =?utf-8?B?UjU2U2QxOUVWRXJ2TGw3aWRseU5jYWpqR2FwR2NBVXZWMnV4ZTh5TXI5LzhH?=
 =?utf-8?B?NytGV29ybzh1Wm9ZeUZCYktpYmJDejVRQ2N6SmdjdEVGaFRBQzBrakdJVlEz?=
 =?utf-8?B?TDlEL29PSUVVYlBJYk5Vb3h2TVFoUG9mOU1sU3hEY1BTMjlMZkJ6a010eGQy?=
 =?utf-8?B?K0Z5eGxYaEJXeVRWd2piV1psK1Rxbk5ncW9kazNoZ0ZYUGpNTWRsMDhqMmxF?=
 =?utf-8?B?aE9ldkJoNnEvU2NUTW9KNXc2aHhrZld0aHhNMEtqZlJDbk50QTVUam0xbTg2?=
 =?utf-8?B?cGlTK2h3WjNMQW90WWFCVi83QUU0dGJDTFFvQUpSbHhxNW5sL2dBTEFzV1M2?=
 =?utf-8?B?Sm54Y29obS9acVBia3BObXFIWGswaWZRUzUvWDdZZlhOcisxK3B6cUxwY2Yy?=
 =?utf-8?B?anU5U1U5Z0VSNDlNemdRTERRSlhncTlTMGlOS0Y3blFqRUR6MDBuRzlhWkl2?=
 =?utf-8?B?TERHd1Q3RlRXNWhONUN0Zm0vNW1lTExmNUxkcWVrcHpsZzFvcndTNkJtS1E4?=
 =?utf-8?B?NmMrZW9rLy82NlJhTzk0Z0xidklteTdkdVJudUM4c2pJbFR1dEFaMlpDQzBR?=
 =?utf-8?B?SkJEeHlLODIxeGxmZncwZC9HOVQyTXFRUXJJa3NQdFNaREY1UXhlcVdPOXI3?=
 =?utf-8?B?S0hoOWZobHNzalpmeG9NM2VveVl5T3BycDArbXNremxyRU9JamdibzhWajlJ?=
 =?utf-8?B?aGxmczNDRjdLZFJwUmdEVk5ZUVVMMEYrYVBjWHI5NDJWZWs2aVkxQ3Z3ajgv?=
 =?utf-8?B?NnB1NVN1WmlPU29JYTZ3TDBwUGJ1aUFzQ3VBeGJrOGI1RGZGaldlZUV0MWJ3?=
 =?utf-8?B?VU1QMkFuWkdlUkZWVERlT25Tb0JOV2grNkoyVDMyUVVqa0hOd3lHbkZKMFll?=
 =?utf-8?B?UzYzaWd2T0N0V3FlbVhEeDNIdTY4RmZMUGJUKzhmdUgwMWZDMXR3OWtXK0ZR?=
 =?utf-8?B?QldEVmtHZU5UcTJIZXBDc3U4NnlraWxtQXZ4b2tucVVMenA2Vlp2ZllOK0E5?=
 =?utf-8?B?bzFwWHowSklsOVk2aDJWT2J5QVltSm91dEFHUVRmTUNTVmFseWNEUHYvZ2xJ?=
 =?utf-8?B?aktwR0dYMlBaQnpwL29reCtnOERXRUMvcS8zdVdKQUgzVHRQNjB3R0lpYnZu?=
 =?utf-8?B?MC82L09EK1pBcXJKVFBvZHBpdDBqNHdJN0dxQm5GSmtPeWgrK1hMRzZ5NWNT?=
 =?utf-8?Q?0eq4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVcySml4OVJqbm5SSXF1NkR2OWJBL1h0T1ZIUHdpZHkyRkorRUl0b1VKelpy?=
 =?utf-8?B?TXlOSUtUTmM1OFpEQUg3UEtURGxDeU9RSTJpdFYxNlVmblF1T1RJajZkQ1cr?=
 =?utf-8?B?VmwxWnNZY01STS9iMkR0ZkV6dHpmYStJOXRvZlhtMUttKzZGd0VNamd1SlRm?=
 =?utf-8?B?eHljNThUbHY5bFJLZmdLendWWlo4ZWQ4QkRsK0c3akpyaDFpV3dkZzRjVUo2?=
 =?utf-8?B?M2M1MWFuWlpGc1hoc3VKZHJaS1ZYYkpJWkFCUGdBTGlRS05IVmtiS3krQUJv?=
 =?utf-8?B?M05YTEVidXBQYnQ1aDRoWFJJL3BqUnk3V0R3b2FoTGVJV3FJZHZKRElIbnZS?=
 =?utf-8?B?eXFCLzZPYzlZOU5FSjBKVEFqS2VTNmlWaTJZUG81T1VOQnU1VG9tMWZjeUFz?=
 =?utf-8?B?ZDhWRm1DRlpBaW9paWluZ0Zic0xhYjFhc3IwUWJqUk8yK3A2TTdGZ2FweExQ?=
 =?utf-8?B?ZmlLL1dWUW9PS2RiUmJjVTM4QVZTaXFJQVNHdnc2VUNIVSs0ZWx0UXFWa3l5?=
 =?utf-8?B?dEE0RVBOQllPNUFBbDFpNTg3bGVCSjFXZ201NjZneUdwa2Z3dWJCTnoySWQw?=
 =?utf-8?B?cWNGVHN5aVVBMGQzZ3dJMnRhM01od1BuQ2wrSCtYSUFiZUVZM1hCZjVTNTJa?=
 =?utf-8?B?TEVjNEVpVUpjZFJESS9GQy9oQ1A4Y3FObjNoUVYrVExWaFdYUG1oeTBGREYy?=
 =?utf-8?B?dUhpcGJwZm5SdkNkdDU0M0Q1bFVuTDgzVHJ1ekYvUmhXQVBTMGhXVnR4RlJz?=
 =?utf-8?B?S1h4L1VzRXl4UUVqVXlpR3d6ak11WlE3ZEFRUjlkN1kwQnhhOWVsR3Z2NVpj?=
 =?utf-8?B?N1ZDWUVLMnQzWnZQQ2NkRFFTNE13NWQzbi92bnFoTEtxWFU4MlBXaFpxOWpo?=
 =?utf-8?B?akRrTXhCeG1qL1gwYWRPSlYzYlA1NDNkT1JBL0pqMFNENUd2SUFldFlKQXlR?=
 =?utf-8?B?MFNkRFlSQkV5TlZQc3VPYkNFMjJER0tpYVUyMlNqem4wYi9USlUwSE45bGxS?=
 =?utf-8?B?YWI5VEdRNVBsZlpJNmJUSUJWNzRSWENhVU1FTXgxQW5Qakh3dXZWU1VqNGky?=
 =?utf-8?B?SFpWMlNjbTQ5a0dyOUxKM0VPV2ZjWVVCODBpTEJzVEVRTTBTMFY4MExyTEtp?=
 =?utf-8?B?YU45YWNLRnhJQUNFSUdvTnR5ZUpndXZmYkpVSEVCT0M5c0pJdjFncGIyTEtB?=
 =?utf-8?B?WHpmbTJqWHdsenhlMG1xellncWRSYTg3aE5DRDhDbEQvL1ozTE5JSkVHSFBL?=
 =?utf-8?B?aXZEblR0WTE0azZZYklSZXlmWkJhR0xmNFcza0dpUkF1WGVVa3BmN053K2VG?=
 =?utf-8?B?VUxhMEhtZEh5ekZXMUZlWjNmcFZsSFc0ZWxVT3RTWCthTk90UDBFUVNKdlda?=
 =?utf-8?B?TnZTazNKQVg0b1V0L3ZyV0RtQm9ETThCTW1yYW1ROEdMVUpKQytTblpyWnQ4?=
 =?utf-8?B?dXJnazl0Qmt0TkowdDZCVkFhL1lQR25NZHB6N21lRTExS01jTTlNS2dWZS9C?=
 =?utf-8?B?Z0lXY0NaN3JBY2w0cXovRURLeUhhVzh0azZUclBLcDltZEMxTmhHaWttY05X?=
 =?utf-8?B?U1ZqWVMrTlpnUmxiRndqZEZRMUsrTDFTVlBpTDkrM051RE9pU2RBc3hONzMr?=
 =?utf-8?B?eGl6SWdvcUVxOXIwU0pyK05OZ1hpb0llSGlwYzIydVNMN3VZOWFzQmlvOVRp?=
 =?utf-8?B?dnRDdzllbW5MTm1Qa2hmTGptdDJIWkhiVWZnU1NRYjJyOWxXNkFEZDN3d3RR?=
 =?utf-8?B?RmZTMlVxYitYaFJlNXZ5cVpZUFlyUnhlbFpuem9DUHIveWhkZ1cybWtJMVNp?=
 =?utf-8?B?elNHV2lST3BHd0pvR1NWeWduLzk3TFJIWU5Qd1J4bmJ0cXVFKzdMVm4rYkt4?=
 =?utf-8?B?V0M0dldsQlZ6YktVaStuWm1kRlg2QTVIYktwT3kwN1htT2lWOXRxS2JMcCtN?=
 =?utf-8?B?L1ZabVFJenZVakVoQzIvb3ZNa2hJNFJacnBsSE13UmN0UFpTUXhDNk1zUnpV?=
 =?utf-8?B?c3FycnY2dW5FYkRQdk5kQ0EvR01idXYzZFZTUGMwVEtYSVAwV0gxeDlYQVho?=
 =?utf-8?B?QXFOUjk4cUFPUTVLVmVCSjBBZjNQNXhpd1dvK3BGQmRIT0llbG1TTTJZZ2la?=
 =?utf-8?B?a1lQekFuR05CVHJBa3dWbW5TczZvUkdMSzhRSU8zcnZRYlFCa3ppeUVlb1R0?=
 =?utf-8?B?QVh5SDYyRXVYRUNNNnhqZ00yMXNQaWlLOStZMEhqVjl0YXFJbFdtZ2o3MTF4?=
 =?utf-8?B?NTJpU09WcWc4Q3VYUXV4bEtVWUx4R1d5akpxUVppdE9HcUNYYjcrKzZsc1NK?=
 =?utf-8?B?TU9DOWwyNU80Z1pBRUZJNWNpRXU5VldHcWo3cDBwNm40SHBYK0hWeGsxc1M4?=
 =?utf-8?Q?zKOeaC9YBzzO+R64=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6adb7fc-ac47-4727-a6ed-08de67b08293
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 07:54:53.6816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rs95E4PblsPp3GXNNlybvn7zd1pV+g1TR17IOJ16qDMXFPBSavftbPxOAIS48FX+hjCpwC1jV5XgWhfvcBQluzkxhVuhluhkDsrwXUMq4kU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7579
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

Hi Sebastian,

On 2026-02-04 at 15:16:04 +0100, Sebastian Brzezinka wrote:
> Reorder tools_progs entries in tools/meson.build to keep the list
> organized and avoid duplicate or misplaced tool definitions.
> 
> No functional or dependency changes.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/meson.build | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index acd394e23..039103ce0 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -12,6 +12,7 @@ foreach prog : tools_progs_noisnt
>  endforeach
>  
It might be good to add a comment here:
# Keep in alphabetical order

though, I will not block this change with that suggestion:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

>  tools_progs = {
> +	'dpcd_reg': [],
>  	'igt_facts': [cairo],
>  	'igt_power': [],
>  	'igt_stats': [],
> @@ -23,13 +24,15 @@ tools_progs = {
>  	'intel_display_poller': [],
>  	'intel_dump_decode': [],
>  	'intel_error_decode': [zlib],
> -	'intel_forcewaked': [],
> -	'intel_gpu_frequency': [],
>  	'intel_firmware_decode': [],
> +	'intel_forcewaked': [],
>  	'intel_framebuffer_dump': [cairo],
> +	'intel_gem_info': [cairo],
> +	'intel_gpu_frequency': [],
>  	'intel_gpu_time': [],
>  	'intel_gtt': [pciaccess],
>  	'intel_guc_logger': [cairo],
> +	'intel_gvtg_test': [cairo],
>  	'intel_hdcp': [cairo],
>  	'intel_infoframes': [],
>  	'intel_lid': [],
> @@ -43,9 +46,6 @@ tools_progs = {
>  	'intel_tiling_detect': [cairo],
>  	'intel_vbt_decode': [],
>  	'intel_watermark': [],
> -	'intel_gem_info': [cairo],
> -	'intel_gvtg_test': [cairo],
> -	'dpcd_reg': [],
>  	'lsgpu': [libudev, glib, cairo],
>  }
>  
> -- 
> 2.52.0
> 

-- 
Best Regards,
Krzysztof
