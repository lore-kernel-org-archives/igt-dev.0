Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECAECD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 12:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E2410ED23;
	Wed,  6 May 2026 12:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqNH/s1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B7810ED23
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 12:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778069775; x=1809605775;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=V4IL54jFEO9t0czLOzyYycpCCWU99TDt/F7tuLOqSqw=;
 b=iqNH/s1mECoIXd88zlyHciuPHvTvrWLRvpqWT4RNVgqv2bF786jyraMu
 Sm2YfC3jarbH9AtlN81nrzBCE2f4vD7k5AmZTXGNr6169feKQoRxfcxYW
 uBMuAdswGxAppR++JF/OSSF4B8dmlxNZMW63ACzW5vDt6/C3VIoNLc/Mw
 hXkzchaoYlIGcRmF/nyF1qcBTSBWBmA+YnNlw24l2GyzGFyvRh9ymPELs
 bgN9eqLbishnM7LOnmWVUYtnRDg8seMMWae0D+oUdlN+bMDCKdst9tRE5
 rMdhWtAO777NNVZpV3ceWfJxj5vh6fpTHH2vOQKkpv9bQFBKUZclKhbSs w==;
X-CSE-ConnectionGUID: rci6x6pCQZGYH3sPL8LUzQ==
X-CSE-MsgGUID: 2RyC4CgGQkiuWzKLx1aPJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104459465"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
 d="scan'208,217";a="104459465"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 05:16:14 -0700
X-CSE-ConnectionGUID: NNuGaWRzQeyDPIJLtyJrgQ==
X-CSE-MsgGUID: hwFWNWRxR2a6ONP0nnDA8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
 d="scan'208,217";a="274260672"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 05:16:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 05:16:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 05:16:13 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 05:16:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJaUvGFUoLX9oQXRKXj34Fs4zevo1khQKDfHb2wRanVDlZZ0kuowPSRc5wHn4E4HaGRASVObXz9XuZeYaUIQiucsgsfdHAqMEjNvhLlSwMytXFidWFYrrFK9PERoo2/rc9RkrsCD+lF2RGJZ16y2y8RwXOWVYYS1CP1KwJFU6ZgM6oaNRvYJOha5IkVoFm2yHtMsp4BfUHogNS6DUDJjXPAu1t9LLyUdchhLgQNu7plNrry9GMAy3Xw6SAZexrgwnKNWxkEdsDIl982MAiWlrxVnM/3xTRwX1B/XrAER67IAgfidE6Mv9fWWb40N3DvD/sQjn6tCIzFR8+8H9Zc0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YVlhZqzapFycHhrIQNUEg2P++6uJmQFNVCRsFg1LB8=;
 b=V2R9RAOxrBokVyqIbVvHggQKpZexsfNEONFKLdNWB0q2baIQY9wHoQnxvoVg+qMve05xgWVPFXAOyS3j0MqDtzn9K5pi3Tp0Xv7Aoa2EHbt4Gi0dlwQuKHMu9j8lVEZ/2XQIQm5vJMopVpgFWII2yFpY+JHpXErSb3H1h+TF/jFKSXesLRyb4Y6JeAedXuDinx9bWWJ/4dLbgvDCKaEpOcs3DE+Jt+tzPWISiUdv56sK8NSlWcfmCsuPCzDSZnYRMuN9WFWHMM5sz/+upGcOkpFuFUn6A48DQHuZJD9edI8Bw7hnkxCnjprMU0DkK06xNOrXZO+TuQbubTWpQtJ5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH8PR11MB9951.namprd11.prod.outlook.com (2603:10b6:510:3cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 12:16:10 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 12:16:10 +0000
Content-Type: multipart/alternative;
 boundary="------------VS2m3kBW26xRcOgv7bhHV4VO"
Message-ID: <baf903e9-bdfc-4107-a703-b65686ab2fd7@intel.com>
Date: Wed, 6 May 2026 17:45:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/3] tests/kms_content_protection: Add per-CRTC
 framebuffer infrastructure
To: Manasi Navare <navaremanasi@google.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, 
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>, Jani
 <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Gil Dekel
 <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
 <20260330032205.467130-2-jason-jh.lin@mediatek.com>
 <CAMNLLoSPncgBBOGc--Mi=Kb8-Uok5ZOxS3Fj+oFQTRJtrkEKYg@mail.gmail.com>
 <CAMNLLoRrGA34vVZg6HAGwqrsVbZWEOtD9F4yKWmboiAwp+2paA@mail.gmail.com>
 <2a95efab-841c-47c5-bafe-f80f59e45a32@intel.com>
 <CAMNLLoRO_-bF0-SaUVgMq0R0T8mc6yk4GmPY=_FCJwhLWohigA@mail.gmail.com>
 <CAMNLLoSiS316uKO-1t31DmMcTaD9AC3ieJ7Kgfp=dF0sn6Nsbw@mail.gmail.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <CAMNLLoSiS316uKO-1t31DmMcTaD9AC3ieJ7Kgfp=dF0sn6Nsbw@mail.gmail.com>
X-ClientProxiedBy: MA5P287CA0105.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH8PR11MB9951:EE_
X-MS-Office365-Filtering-Correlation-Id: 531a8357-3168-4717-b069-08deab694170
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|42112799006|7416014|376014|8096899003|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: QooeGHeahF8j3xXoJfx6nRc7lYUrp2KKlsjJ1SlyQFNZL74JV1GjgkGO4eFC9yZKrPG6NqUFVRLrHRXdPeWXbI+gFbajoJwjrn/0vE/r5AwPD68GZKx7u+MP/ysuwVeKAkiziink/3BD8DvDjlcUZDjP5nmWHmihpVK+jR/wuO+8NtYOlCOAZZOkH7FIUjqJd+lk9BBhGCFva1RsKK5GmmuKj/9Z8Af+VWyFLKCIrasEg3e/SXG8cQh7mkfYxt3mAbeTHE7LMLfK2KmjJwCjgVCzKZC6y0TMjanIbmkxSzpnQRx5/BetYAa/ebYEwc9fIvj1FWtcIx86zH9RUJKXhE3+DnJumFA6Uq0gSRq5aoYF+jwWR08dWsmBaHzwCxZ2Up1CLf0fan4WcHpNLPxvi0VWB9XRtKHQ9e4VeBgD4ckwbZTlIZSFfQd2C4U+7oe4u05mhlrkBvd6pQ4u9uGmm/oCZIDaZO0yVsr2abhz/+ibzHNVLuTKxCkCIKYgwX4SpKz7MvzHDRqv2BcJCo5fGxKcAzxTjkIUJGLKksuplfcMcR270AOG9ZRVz+1qSA8Jc4oPss5BinAzcDgohL4RXBXo3iyrYJZ/4xNT6xLrkYAIE+pJCa4cwFZmNre2ocdD6vX2ZqA/W+3GpEprKFuP4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(42112799006)(7416014)(376014)(8096899003)(13003099007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzRQbUVNNjZuNEQ1bjJhdkU3c2Focms3M0g3MWkwNE85dERQS1hFSzlwQWdE?=
 =?utf-8?B?NVBmZzJ5WVcwc0Jock5xSnBaMkpHSXlRS050L1ppdG9HSld3VENMRTA0cTVP?=
 =?utf-8?B?c0N4Mm53MUN2OFNYMnZTWjJMQWswdEI0d2ZmeW0rcm1CWUJOUXI3SEdaZE9v?=
 =?utf-8?B?azhQcS9ZY2FHcFhJT1hPUEdHYjcwZFdvcFJJS3RneFl0MHpZWGY2a0JncmNv?=
 =?utf-8?B?UUtLc2pnOHhINFBLMm1RUEdscTNUUllhRHVEL1JUcERldW1XekRoL082NHF2?=
 =?utf-8?B?bHV3YUxLbU9EcHdPMmxySzlnWjFTcmV2eCtlcXVSUm4wR0RLUGk5WFJ6Q2Uz?=
 =?utf-8?B?MlNvdysvem5uakRWOFowSW10WE1ESE95R2FtTyt1ZVdrT2wxTS9ITFp5WStw?=
 =?utf-8?B?TlVoeXd3UU5ZektyZkJNN003cTRPUksrWFlGWm9veTNvK0NxS29LZ05MNi9D?=
 =?utf-8?B?SndYamNRRzRmaVZsREd4Z3BPR0tXSXZuaUIxa0dVaWh0WlhvbW1Fbno1aE13?=
 =?utf-8?B?NjdnR0d6eVBMOFhNNEhIU3BTNDZrcXFaaVNibjl2ck5Jc1d1S2pEYjlOMzBw?=
 =?utf-8?B?czM5dDVlZWNkMUN4b1J4anYyYm83TWtzZXZNaDFFeVRYc1U0OEIzeU9kOVN4?=
 =?utf-8?B?ZlluUzlVTXBUUldHRDFsUTZiUEpVMTljazF4TjNWZWNhK0dETHJ2VUxRRGZY?=
 =?utf-8?B?V2t6REtjZkVVRTR6WlJ3ejZKWFZLeHlyK2JoUDEzeFZqS1hKbWxDQ3ZlUmdW?=
 =?utf-8?B?c1Q1S2tjUy92TmtVUnVKUDIvWmZkY3dLVHVHQ0VYWnFBL1c3YnYxR2k4U0Fx?=
 =?utf-8?B?ZnNzTFRlc3l5TGdiSHREQzRncnFjRkdTdTVvWXpYeHd6Tm1aMHdLSUxMVkJi?=
 =?utf-8?B?enJJUHVIYk9sZm15bG5kYUNvWkdxdnEwLzdYL2ZIMWhSaCtqcWJHMHBnVGxT?=
 =?utf-8?B?OHVNS3M5T2dkem5GV25RSTdrQk9DOGtBN3FmcmFEK2N4NHZzRXYxM3hLaWNH?=
 =?utf-8?B?WGd3TUxmeGhIckVldTRhV3IyRFNLWVJQKzA4V0Z1dE1zRTFBNjNmMEFHTWpS?=
 =?utf-8?B?SkNUMm52YS81bGxFUnAwaElPMDFNU2M2Z0wvSDZGZUpwWVB0K0lvTkN6SkJC?=
 =?utf-8?B?KzZYMkEvbC9nazdVeXA3aDBOMjhjaUlOL2NGZE1lY2dEbkQwbC8vNkVhNG9V?=
 =?utf-8?B?NlYrSGdTWU1rZVRDSEJVVENYZ0ZWSlY4bFlRUHR3ZmhPaTJpdk9uYyt0VDdU?=
 =?utf-8?B?bzV5Z1MvNXJyMXgxYWI1ZDhIZU5xUklXSS9rZVVlc3BLYk9MR2ZONFNXMkM4?=
 =?utf-8?B?b2hXVmdPeHlrYVVyckxqbitaYWdjL3ptUVFiM1piQ3FIOHY4bnVLNlZMMGhN?=
 =?utf-8?B?VVphWS9ZR25VVWN5WHgvd296ZXJkNm9qQlpjWWxvTWJkdDFkVTZkTWQzcTh0?=
 =?utf-8?B?R0ZjdkYxaDdaZ2ZaR1VpUHB2YWNwME12bG0wcUViTnM0WEliV090SHl5T01m?=
 =?utf-8?B?cGorWEVXbFhqZmRiRmlaLzcwNVpFbHA0U0FXYVdPUHVMWTdhSGNIMGNGUm1z?=
 =?utf-8?B?dElheUs3YVN3U2V2WCs2bmFraFVXdE9VVkRmZ0NEUjJVbjkrc08xVWwrQk9k?=
 =?utf-8?B?bDMyNzU1Z2VTb3pLcFpJQWRpMm9UdThsZHIwM3BPT3JWZWNySHZPYmV3aFZE?=
 =?utf-8?B?RGpJaXB1SkhlSGUyc0g2Ky9CQTFGeDYrS1BJQTVqdWNYRmJwVVo2eW9DVG1G?=
 =?utf-8?B?azFTK2huakpnQXhWSWRXNjFCdktCSU5xUkZNTEFQa2F1ZzQ2Ym9wV1Vpd3hI?=
 =?utf-8?B?MWhKTmZiU2ZGaFhDRE5ZeFlWcUxqL1RwekJRbmxpVkJKbUZuSVB1aFczdUdM?=
 =?utf-8?B?OWhxdlZGVTd2YU5yak55MkxuUXUrMXN2Snl3RWVqYkZ1MUVERUR2d0xXZnBa?=
 =?utf-8?B?dXRhZmNNSWJWWWtoL3p5aHVEVkh2aitFWkFVMFZjcmlhb0hrKzMxSWJlR2la?=
 =?utf-8?B?ZVF3UzV6MDFCTVRmdU12WlNDZDRCOS9qaVJiVVc4Q2pRbW8rbFoxOVE5VGRN?=
 =?utf-8?B?UGEzOFBKYlhrcEZCNnlBa3NGM3E3RkxsSVZxaGJlQlhvY0Q0SVl4ZHFkdzlm?=
 =?utf-8?B?a0I0NTdPS0JJWU1sYkhOR3p3QkVUd24rZFV2NFNJK1prT1ptMVF2eHVFMTNx?=
 =?utf-8?B?N2FxVVkzVzlnTkhqV3daVklkcHp0eTlScnFYdVcwR0piTzNPbFVSTU1GYzVX?=
 =?utf-8?B?bUwxMXNidTA5M2FmVGlhbXBOZi9zbDNvc3JaUTl0NlZUZFc0NVozSllhSHhR?=
 =?utf-8?B?SUQ2cEl2WWkwa3AxYllOT2d2WVZ3U1JOYk92K1o0RmNUb0ZjMk9zdz09?=
X-Exchange-RoutingPolicyChecked: kgiLPrvp3sLSNi4A45FAoSntxtcnHBrUtnFkyGHz53SY/cpQA+7MsGI+Gq+wEZPMm49Wf5+BljqP9eTtHVAP7ymFUktvbFAidnimbt4PwzrB67t03etD3Lxt5T63SgSGoj9Iw3wSjGxL88B6ToOTQpyS5YwRJfLFw6vDPDDJbX5Idpnp9EIs3paiz4C1DyfZapwdik0nFbnb812z/qrO16CYHyrK1lAUjDiU7uVW9gQMVnjR8ZcWxfzxXCOvgx66IBuUNcNj+tFAxb/mJJyeBPEVAD6LSMUOmWkYTrUHIKtaqxVaf+Ri48VNpMVnqWO+ZRxFCopuQ5IgOFcwmQOF8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 531a8357-3168-4717-b069-08deab694170
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 12:16:10.2740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxrWgJdfl/9PrCkU+UX6I/rMvEVpj1sODFfp3lUv7UsZg5vORu8oqmxuEMAWFzn6uIEBRneWXmXcKmDW3kerJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9951
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

--------------VS2m3kBW26xRcOgv7bhHV4VO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Manasi,

Santhosh from our team has tested this out at our end. Thanks Santhosh.

Will get this merged.

Thanks and Regards,
Karthik.B.S

On 5/6/2026 3:58 AM, Manasi Navare wrote:
> Hi @Karthik B S <mailto:karthik.b.s@intel.com> , were you able to test 
> this locally for regressions?
> If you could add your R-B , we can get this landed as soon as possible.
> This is time critical for us and is required to scale to MTK platform
>
> Regards
> Manasi
>
> On Mon, May 4, 2026 at 1:32 PM Manasi Navare <navaremanasi@google.com> 
> wrote:
>
>     Thanks a lot @Karthik B S <mailto:karthik.b.s@intel.com>  for your
>     response,
>     And appreciate you trying this on your end and for your help on
>     getting this landed.
>
>     Regards
>     Manasi
>
>     On Mon, May 4, 2026 at 1:31 AM Karthik B S <karthik.b.s@intel.com>
>     wrote:
>
>         Hi Manasi,
>
>         On 5/1/2026 4:29 AM, Manasi Navare wrote:
>>         This change looks good to me,
>>
>>         Reviewed-by: Manasi Navare <navaremanasi@google.com>
>>
>>         @Karthik B S <mailto:karthik.b.s@intel.com>  and others from
>>         Intel signal boosting this, could we get some traction on
>>         this, its reviewed by the team, could we please land this?
>
>         Sure, the idea LGTM in general. Will try this out at our end
>         once before merging as this test doesn't have coverage on CI
>         currently.
>
>         Regards,
>         Karthik.B.S
>>
>>         Regards
>>         Manasi
>>
>>         On Wed, Apr 29, 2026 at 1:31 PM Manasi Navare
>>         <navaremanasi@google.com> wrote:
>>
>>             Thanks Jason-JH for this improvement in the
>>             kms_content_protection IGT test.
>>             It makes sense to create a fb per CRTC given that each
>>             CRTC can have different mode timings/resolutions.
>>
>>             @karthik.b.s@intel.com <mailto:karthik.b.s@intel.com> ,
>>             @bhanuprakash.modem@gmail.com, @swati2.sharma@intel.com
>>             Could you please take a look at this patch and help
>>             provide feedback?
>>             We would like to get this landed as it helps improve our
>>             testing.
>>
>>             Regards
>>             Manasi
>>
>>
>>
>>             On Sun, Mar 29, 2026 at 8:22 PM Jason-JH Lin
>>             <jason-jh.lin@mediatek.com> wrote:
>>
>>                 Replace global framebuffers (data.red/green) with
>>                 per-CRTC array
>>                 (data.fbs[IGT_MAX_PIPES]) to support multiple outputs
>>                 with different
>>                 resolutions.
>>
>>                 Add create_fbs()/remove_fbs() to manage framebuffer
>>                 lifecycle at
>>                 test initialization/cleanup, creating each FB with
>>                 the resolution of
>>                 the first output that can connect to that CRTC.
>>
>>                 Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>>                 Reviewed-by: Fei Shao <fshao@chromium.org>
>>                 ---
>>                  tests/kms_content_protection.c | 50
>>                 +++++++++++++++++++++++++---------
>>                  1 file changed, 37 insertions(+), 13 deletions(-)
>>
>>                 diff --git a/tests/kms_content_protection.c
>>                 b/tests/kms_content_protection.c
>>                 index caf3d7a56ae4..df9ff5efcaa2 100644
>>                 --- a/tests/kms_content_protection.c
>>                 +++ b/tests/kms_content_protection.c
>>                 @@ -107,10 +107,15 @@
>>
>>                  IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>>
>>                 +struct hdcp_test_fbs {
>>                 +       struct igt_fb red;
>>                 +       struct igt_fb green;
>>                 +};
>>                 +
>>                  struct data {
>>                         int drm_fd;
>>                         igt_display_t display;
>>                 -       struct igt_fb red, green;
>>                 +       struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
>>                         unsigned int cp_tests;
>>                         struct udev_monitor *uevent_monitor;
>>                         bool is_force_hdcp14;
>>                 @@ -991,31 +996,49 @@ static void
>>                 test_content_protection_cleanup(void)
>>                                 igt_info("CP Prop being UNDESIRED on
>>                 %s\n", output->name);
>>                                 test_cp_disable(output,
>>                 display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>                         }
>>                 -
>>                 -       igt_remove_fb(data.drm_fd, &data.red);
>>                 -       igt_remove_fb(data.drm_fd, &data.green);
>>                  }
>>
>>                  static void create_fbs(void)
>>                  {
>>                 -       uint16_t width = 0, height = 0;
>>                         drmModeModeInfo *mode;
>>                         igt_output_t *output;
>>                 +       igt_crtc_t *crtc;
>>
>>                 +       /* Create framebuffers for each connected
>>                 output's pipe */
>>                 for_each_connected_output(&data.display, output) {
>>                                 mode = igt_output_get_mode(output);
>>                                 igt_assert(mode);
>>
>>                 -               width = max(width, mode->hdisplay);
>>                 -               height = max(height, mode->vdisplay);
>>                 +               /* Find a valid crtc for this output */
>>                 +  for_each_crtc(&data.display, crtc) {
>>                 +                       if
>>                 (!igt_crtc_connector_valid(crtc, output))
>>                 +  continue;
>>                 +
>>                 +                       /* Skip if already created
>>                 for this crtc */
>>                 +                       if
>>                 (data.fbs[crtc->crtc_index].red.fb_id)
>>                 +  continue;
>>                 +
>>                 +  igt_create_color_fb(data.drm_fd, mode->hdisplay,
>>                 mode->vdisplay,
>>                 +    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>                 +    1.f, 0.f, 0.f, &data.fbs[crtc->crtc_index].red);
>>                 +  igt_create_color_fb(data.drm_fd, mode->hdisplay,
>>                 mode->vdisplay,
>>                 +    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>                 +    0.f, 1.f, 0.f, &data.fbs[crtc->crtc_index].green);
>>                 +                       break;
>>                 +               }
>>                         }
>>                 +}
>>
>>                 -       igt_create_color_fb(data.drm_fd, width, height,
>>                 -  DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>                 -                           1.f, 0.f, 0.f, &data.red);
>>                 -       igt_create_color_fb(data.drm_fd, width, height,
>>                 -  DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>                 -                           0.f, 1.f, 0.f, &data.green);
>>                 +static void remove_fbs(void)
>>                 +{
>>                 +       igt_crtc_t *crtc;
>>                 +
>>                 +       for_each_crtc(&data.display, crtc) {
>>                 +               if (data.fbs[crtc->crtc_index].red.fb_id)
>>                 +  igt_remove_fb(data.drm_fd,
>>                 &data.fbs[crtc->crtc_index].red);
>>                 +               if
>>                 (data.fbs[crtc->crtc_index].green.fb_id)
>>                 +  igt_remove_fb(data.drm_fd,
>>                 &data.fbs[crtc->crtc_index].green);
>>                 +       }
>>                  }
>>
>>                  static const struct {
>>                 @@ -1241,6 +1264,7 @@ int igt_main()
>>
>>                         igt_fixture() {
>>                 test_content_protection_cleanup();
>>                 +               remove_fbs();
>>                 igt_display_fini(&data.display);
>>                 drm_close_driver(data.drm_fd);
>>                         }
>>                 -- 
>>                 2.43.0
>>
--------------VS2m3kBW26xRcOgv7bhHV4VO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Manasi,</p>
    <p>Santhosh from our team has tested this out at our end. Thanks
      Santhosh.</p>
    <p>Will get this merged.</p>
    Thanks and Regards,<br>
    Karthik.B.S
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 5/6/2026 3:58 AM, Manasi Navare
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMNLLoSiS316uKO-1t31DmMcTaD9AC3ieJ7Kgfp=dF0sn6Nsbw@mail.gmail.com">
      
      <div dir="ltr">Hi&nbsp;<a class="gmail_plusreply" id="plusReplyChip-3" href="mailto:karthik.b.s@intel.com" tabindex="-1" moz-do-not-send="true">@Karthik B S</a>&nbsp;, were you able to
        test this locally for regressions?
        <div>If you could add your R-B , we can get this landed as&nbsp;soon
          as possible.</div>
        <div>This is time critical for us and is required to scale to
          MTK platform</div>
        <div><br>
        </div>
        <div>Regards</div>
        <div>Manasi</div>
      </div>
      <br>
      <div class="gmail_quote gmail_quote_container">
        <div dir="ltr" class="gmail_attr">On Mon, May 4, 2026 at 1:32 PM
          Manasi Navare &lt;<a href="mailto:navaremanasi@google.com" moz-do-not-send="true" class="moz-txt-link-freetext">navaremanasi@google.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div dir="ltr">
            <div>Thanks a lot&nbsp;<a class="gmail_plusreply" id="m_8697978727895870520plusReplyChip-1" href="mailto:karthik.b.s@intel.com" target="_blank" moz-do-not-send="true">@Karthik B S</a>&nbsp; for your
              response,</div>
            <div>And appreciate you trying this on your end and for your
              help on getting this landed.</div>
            <div><br>
            </div>
            <div>Regards</div>
            <div>Manasi</div>
            <br>
            <div class="gmail_quote">
              <div dir="ltr" class="gmail_attr">On Mon, May 4, 2026 at
                1:31 AM Karthik B S &lt;<a href="mailto:karthik.b.s@intel.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">karthik.b.s@intel.com</a>&gt;
                wrote:<br>
              </div>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                <div>
                  <p>Hi Manasi,</p>
                  <div>On 5/1/2026 4:29 AM, Manasi Navare wrote:<br>
                  </div>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div>This change looks good to me,</div>
                      <div><br>
                      </div>
                      <div>Reviewed-by: Manasi Navare &lt;<a href="mailto:navaremanasi@google.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">navaremanasi@google.com</a>&gt;</div>
                      <div><br>
                      </div>
                      <div><a class="gmail_plusreply" id="m_8697978727895870520m_-2777679078897058853plusReplyChip-0" href="mailto:karthik.b.s@intel.com" target="_blank" moz-do-not-send="true">@Karthik
                          B S</a>&nbsp; and others from Intel signal boosting
                        this, could we get some traction on this, its
                        reviewed by the team, could we please land this?<br>
                      </div>
                    </div>
                  </blockquote>
                  <p>Sure, the idea LGTM in general. Will try this out
                    at our end once before merging as this test doesn't
                    have coverage on CI currently.</p>
                  Regards,<br>
                  Karthik.B.S
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div><br>
                      </div>
                      <div>Regards</div>
                      <div>Manasi</div>
                      <br>
                      <div class="gmail_quote">
                        <div dir="ltr" class="gmail_attr">On Wed, Apr
                          29, 2026 at 1:31 PM Manasi Navare &lt;<a href="mailto:navaremanasi@google.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">navaremanasi@google.com</a>&gt;
                          wrote:<br>
                        </div>
                        <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                          <div dir="ltr">
                            <div>Thanks&nbsp;Jason-JH for this improvement&nbsp;in
                              the kms_content_protection IGT test.</div>
                            <div>It makes sense to create a fb per CRTC
                              given that each CRTC can have different
                              mode timings/resolutions.</div>
                            <div><br>
                            </div>
                            <div><a class="gmail_plusreply" id="m_8697978727895870520m_-2777679078897058853m_1039234134813026890plusReplyChip-1" href="mailto:karthik.b.s@intel.com" target="_blank" moz-do-not-send="true">@karthik.b.s@intel.com</a>&nbsp;,
                              @<a href="mailto:bhanuprakash.modem@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">bhanuprakash.modem@gmail.com</a>,&nbsp;@<a href="mailto:swati2.sharma@intel.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">swati2.sharma@intel.com</a><br>
                            </div>
                            <div>Could you please take a look at this
                              patch and help provide feedback?</div>
                            <div>We would like to get this landed as it
                              helps improve our testing.</div>
                            <div><br>
                            </div>
                            <div>Regards</div>
                            <div>Manasi</div>
                            <div><br>
                            </div>
                            <div><br>
                            </div>
                            <br>
                            <div class="gmail_quote">
                              <div dir="ltr" class="gmail_attr">On Sun,
                                Mar 29, 2026 at 8:22 PM Jason-JH Lin
                                &lt;<a href="mailto:jason-jh.lin@mediatek.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">jason-jh.lin@mediatek.com</a>&gt;
                                wrote:<br>
                              </div>
                              <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Replace
                                global framebuffers (data.red/green)
                                with per-CRTC array<br>
                                (data.fbs[IGT_MAX_PIPES]) to support
                                multiple outputs with different<br>
                                resolutions.<br>
                                <br>
                                Add create_fbs()/remove_fbs() to manage
                                framebuffer lifecycle at<br>
                                test initialization/cleanup, creating
                                each FB with the resolution of<br>
                                the first output that can connect to
                                that CRTC.<br>
                                <br>
                                Signed-off-by: Jason-JH Lin &lt;<a href="mailto:jason-jh.lin@mediatek.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">jason-jh.lin@mediatek.com</a>&gt;<br>
                                Reviewed-by: Fei Shao &lt;<a href="mailto:fshao@chromium.org" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">fshao@chromium.org</a>&gt;<br>
                                ---<br>
                                &nbsp;tests/kms_content_protection.c | 50
                                +++++++++++++++++++++++++---------<br>
                                &nbsp;1 file changed, 37 insertions(+), 13
                                deletions(-)<br>
                                <br>
                                diff --git
                                a/tests/kms_content_protection.c
                                b/tests/kms_content_protection.c<br>
                                index caf3d7a56ae4..df9ff5efcaa2 100644<br>
                                --- a/tests/kms_content_protection.c<br>
                                +++ b/tests/kms_content_protection.c<br>
                                @@ -107,10 +107,15 @@<br>
                                <br>
                                &nbsp;IGT_TEST_DESCRIPTION(&quot;Test content
                                protection (HDCP)&quot;);<br>
                                <br>
                                +struct hdcp_test_fbs {<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp;struct igt_fb red;<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp;struct igt_fb green;<br>
                                +};<br>
                                +<br>
                                &nbsp;struct data {<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; int drm_fd;<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; igt_display_t display;<br>
                                -&nbsp; &nbsp; &nbsp; &nbsp;struct igt_fb red, green;<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp;struct hdcp_test_fbs
                                fbs[IGT_MAX_PIPES];<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; unsigned int cp_tests;<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; struct udev_monitor
                                *uevent_monitor;<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; bool is_force_hdcp14;<br>
                                @@ -991,31 +996,49 @@ static void
                                test_content_protection_cleanup(void)<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; igt_info(&quot;CP Prop being
                                UNDESIRED on %s\n&quot;, output-&gt;name);<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; test_cp_disable(output,
                                display-&gt;is_atomic ? COMMIT_ATOMIC :
                                COMMIT_LEGACY);<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; }<br>
                                -<br>
                                -&nbsp; &nbsp; &nbsp; &nbsp;igt_remove_fb(data.drm_fd,
                                &amp;data.red);<br>
                                -&nbsp; &nbsp; &nbsp; &nbsp;igt_remove_fb(data.drm_fd,
                                &amp;data.green);<br>
                                &nbsp;}<br>
                                <br>
                                &nbsp;static void create_fbs(void)<br>
                                &nbsp;{<br>
                                -&nbsp; &nbsp; &nbsp; &nbsp;uint16_t width = 0, height = 0;<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; drmModeModeInfo *mode;<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; igt_output_t *output;<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp;igt_crtc_t *crtc;<br>
                                <br>
                                +&nbsp; &nbsp; &nbsp; &nbsp;/* Create framebuffers for each
                                connected output's pipe */<br>
                                &nbsp; &nbsp; &nbsp; &nbsp;
                                for_each_connected_output(&amp;data.display,
                                output) {<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mode =
                                igt_output_get_mode(output);<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; igt_assert(mode);<br>
                                <br>
                                -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;width = max(width,
                                mode-&gt;hdisplay);<br>
                                -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;height = max(height,
                                mode-&gt;vdisplay);<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Find a valid crtc for
                                this output */<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp;for_each_crtc(&amp;data.display, crtc)
                                {<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                                (!igt_crtc_connector_valid(crtc,
                                output))<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp;continue;<br>
                                +<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Skip if
                                already created for this crtc */<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                                (data.fbs[crtc-&gt;crtc_index].red.fb_id)<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp;continue;<br>
                                +<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp;igt_create_color_fb(data.drm_fd,
                                mode-&gt;hdisplay, mode-&gt;vdisplay,<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp;DRM_FORMAT_XRGB8888,
                                DRM_FORMAT_MOD_LINEAR,<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp;1.f, 0.f, 0.f,
                                &amp;data.fbs[crtc-&gt;crtc_index].red);<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp;igt_create_color_fb(data.drm_fd,
                                mode-&gt;hdisplay, mode-&gt;vdisplay,<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp;DRM_FORMAT_XRGB8888,
                                DRM_FORMAT_MOD_LINEAR,<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp;0.f, 1.f, 0.f,
                                &amp;data.fbs[crtc-&gt;crtc_index].green);<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; }<br>
                                +}<br>
                                <br>
                                -&nbsp; &nbsp; &nbsp; &nbsp;igt_create_color_fb(data.drm_fd,
                                width, height,<br>
                                -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp;DRM_FORMAT_XRGB8888,
                                DRM_FORMAT_MOD_LINEAR,<br>
                                -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.f, 0.f,
                                0.f, &amp;data.red);<br>
                                -&nbsp; &nbsp; &nbsp; &nbsp;igt_create_color_fb(data.drm_fd,
                                width, height,<br>
                                -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp;DRM_FORMAT_XRGB8888,
                                DRM_FORMAT_MOD_LINEAR,<br>
                                -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0.f, 1.f,
                                0.f, &amp;data.green);<br>
                                +static void remove_fbs(void)<br>
                                +{<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp;igt_crtc_t *crtc;<br>
                                +<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp;for_each_crtc(&amp;data.display,
                                crtc) {<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                                (data.fbs[crtc-&gt;crtc_index].red.fb_id)<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp;igt_remove_fb(data.drm_fd,
                                &amp;data.fbs[crtc-&gt;crtc_index].red);<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                                (data.fbs[crtc-&gt;crtc_index].green.fb_id)<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp;igt_remove_fb(data.drm_fd,
                                &amp;data.fbs[crtc-&gt;crtc_index].green);<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                                &nbsp;}<br>
                                <br>
                                &nbsp;static const struct {<br>
                                @@ -1241,6 +1264,7 @@ int igt_main()<br>
                                <br>
                                &nbsp; &nbsp; &nbsp; &nbsp; igt_fixture() {<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                test_content_protection_cleanup();<br>
                                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;remove_fbs();<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                igt_display_fini(&amp;data.display);<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                drm_close_driver(data.drm_fd);<br>
                                &nbsp; &nbsp; &nbsp; &nbsp; }<br>
                                -- <br>
                                2.43.0<br>
                                <br>
                              </blockquote>
                            </div>
                          </div>
                        </blockquote>
                      </div>
                    </div>
                  </blockquote>
                </div>
              </blockquote>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------VS2m3kBW26xRcOgv7bhHV4VO--
