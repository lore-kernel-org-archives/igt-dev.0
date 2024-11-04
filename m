Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB38D1BDD4
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 18:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70AA10E0B5;
	Mon,  4 Nov 2024 18:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFCY6hLL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D83910E0B5
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730744084; x=1762280084;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=l+a6e24ez4oPT3Q9URyEASM8nMD6ArycF1DYbCz9c/U=;
 b=HFCY6hLLAhPlmO3sKBPyFuT6nQ0EPGoTmLIEgTMkdFDBWu1UJYmERJqG
 zH5BN/qBKpecqb00vn11IkAS1jWkFbtXT8n+3IJbdeYq5VvbjADIeJQI1
 dWA4wZPzSrW1Mq2FDmcfJ1lDuoCNftEWuVRCGucU48HGU3sL+x0UI0FZ/
 cyg6kgMLde7Rl+2TEk5dPaN+6KHKTSgmFCmdDKUMG1y76WKaKPt+3aGus
 c7BjolNT1sNNGrpzfcJA0V9M+pq+4cehtdAmxtxn3HMfLlEvKCrtV2iXN
 XHQN2XxJ8ELXFdHlPYLbKRhdWYvqQDG8wfFZudiZDOwbeJzyFi7hOj/70 A==;
X-CSE-ConnectionGUID: j6Q1QUtkRWSGKZ5ntq/9Rw==
X-CSE-MsgGUID: TVLSe7y3Rz2t3e9yZ5GukQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41008529"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="41008529"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 10:14:44 -0800
X-CSE-ConnectionGUID: 8tNCkKgCRv6z2usJc1sLQg==
X-CSE-MsgGUID: D6JZbD9PRLm9SUQtFMajpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208,217";a="83667162"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 10:14:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 10:14:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 10:14:42 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 10:14:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUekzPEhMvdgEn1nwlrSuaBOOueLc2XjyqVUcB3Ko5rMa7fn2NTgcGbOSLrVZWk9Gw2Hj0wpItacIVHt2HcOKKUEvnuDyNoj6g3b3gQ7SpVzgKSB9qhLAfT+Oc3JJUsmdbYI9trV9Rc82dZo60D+uv7+UjiaZRu8QCtip48CGn8rxTX2OnBPAi3ODr3wq9etmcVTGAPI/1OgnmZfSE1BfOykBS6e/631c3B00mj9RnKgxoPXZMOwGwH7gaNFIuRToNQPp3ySd4XLQJA5QcdEbStdhJbqBwCys/CPfn7XyGyis8c/l+9tZeBTYTR/XUw9HsAt673DyXVpRz6MapQgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNV1Ga2ww5wwcbbqZfoUEzQCqBVcCwuYgX5LCv5kO88=;
 b=YIVpKvJm1rYrl/QFnZNhaU56xFgtKciQHSDr044X437vC5JF18V7h36ayRhhWzmx232vDQxT8YmSh9vAhwOB50p5fpLp/RHYSVZmGgP01pa7/RsjeQJm5m2oeAhx6Pbsy9Dkg4QqIz617v6b/nS8q02HR7S4BrOqeGAQ1UHSlQ9PQH7i1/jwG3cJ01zj/pCrJc5+CUE9dtbSYX4b9OfAGngfAy4DJBJ8nSPMhDwmE/IYbh/OllWzm4p/jKBd7T+Z8ix5PRIf+vUFp/m47ezbLgWEhBsb3TV0FFYPFyhubXPLnQsYnhRgJS9WxzNszYgKD4gFn0xGICnAboaIiGh/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 18:14:39 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 18:14:39 +0000
Content-Type: multipart/alternative;
 boundary="------------i2cASimQGYn0zzNB54gi9BZC"
Message-ID: <3ad69385-d65a-4d9e-bdbf-983b6ae9dac2@intel.com>
Date: Mon, 4 Nov 2024 23:44:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] RFC tests/intel/kms_frontbuffer_tracking: Introduce
 plane-fbc-dr test
To: <igt-dev@lists.freedesktop.org>
References: <20240904161221.494423-1-santhosh.reddy.guddati@intel.com>
 <20240909041441.528638-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20240909041441.528638-1-santhosh.reddy.guddati@intel.com>
X-ClientProxiedBy: PN3PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::23) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|SA2PR11MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: f28c5b3a-950e-40f8-57a2-08dcfcfc8c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2xXd1V4WU1wNTFHV3NELzdxVzdKc01zTGR6OWxNVHovb3JKa3VPVzcyMGxw?=
 =?utf-8?B?ajJ0QVJXZkQrVysrT3BFVDJNNDQwUE1GWnp2ZjFoSGZtMGJVczJOb3lrYy92?=
 =?utf-8?B?K0dZcEx5MkhpL0s1Q0pEZmxabGFiMURDUFlMeEVqNUNsOGViK3BRcFY2Q3NJ?=
 =?utf-8?B?RXg5dlVIZTArVUE3bU9ZTkNsODBmOXNVaFRPUHBmdzdmVVBQMmZUV0ZOOHlP?=
 =?utf-8?B?YUVNZVo4b2xkbVJOSlUrL0hHMm41bGQxQlE3U0xFL1dqaTJYV0RlZnlPd0tn?=
 =?utf-8?B?aTJIYytSTDQrWWhGaDBiZTVDZUgybkRCV2wxOXpNT0VYdGI4Y09FTGE3RkNl?=
 =?utf-8?B?Y0E0MFd1bEw5UkV4eE1nbGVYZnZCVWY2Ymp1aStVQnRDRXpUN2hvQ2hTUUhv?=
 =?utf-8?B?QkdlR3o0NzBBWEdnS2pWSjdyWTBJNGV1Y1JCeFU3QVJyRFFoWjBqTjJjQTgr?=
 =?utf-8?B?Ny93VS83emJjZjdXd3Rick5yS1RmaktFTUNUbHVJUWhQT29aSEI4RHc4MUVX?=
 =?utf-8?B?dTBYN0x4OGRmUWhBQlVmMUMrb085dThSakFtWThjQWtoeTJEaEl0WEJHd1R4?=
 =?utf-8?B?NWFTdWRnSkF6cUFGcE91NEg0V2s2dGdRNmZSYURvalhuVGovNjh0M3dnc21W?=
 =?utf-8?B?aWtyNkQ1ZnI3YXBTbTdVdG4vTlNuVjcrSDhZLzB3SEgyS0dFb3JtT3J5UktF?=
 =?utf-8?B?ZmlhM2I0ZzU5YitRQWYvZVIxZDdTMm5nRzdEcy9lOXFxcUxMSmtubzJ1UTVF?=
 =?utf-8?B?cW5NcFRJckxnNGdnenArV1NXWlRhVXg5WFFpaHdkdWc0UXJGZDB4Mjc4SFBx?=
 =?utf-8?B?S3B4M0V3c09oZmorc2lxcFJ5M3dpcG1NNWJldHZSQmxoYUIveitnK2VuV0FL?=
 =?utf-8?B?RWR1V0w5UExHdktueGZUTzVOSWZGNithRFBoUkpDV1ZOWDdpSGdWaWZuVFJn?=
 =?utf-8?B?bFNmcVl2QU1xbUt3WExYUnRPWStFczdBcGlyYzFZNkR2MmwwTE14TmtHZHFu?=
 =?utf-8?B?U0RJQnhKQlFkVFhqV0xWckk5MXRmYkF4eEpFNzNGT01FSVl3c25UYSt2S20v?=
 =?utf-8?B?MjdKenRmYk0vbUR4VlVkMVBDL0VidEdYa0RVQ0NGZ3ZiOUxZWm04MTcxTHZD?=
 =?utf-8?B?bkVsY2hsZHdhaHRKS2Z0dVBLMFNGYnliTVoxMHdUQnM5QWN4SnEwNW9NWmJ3?=
 =?utf-8?B?UE1LWDVMV0Q3QU5Dcm9WUzF6VU0vM0RNMXh3K1pkZ3lJUmlYQTJabXFMc2Nm?=
 =?utf-8?B?MHJNQ2VCMm53bVJRUjcrSm9OZ2Jac2RWTjVIL1NKTU9xL0ZLWFRDVFNDN0dI?=
 =?utf-8?B?UUJvbm5yMGJ0RTZDNVo4Vmt3cUpWMXhSbEtvSm9zYSs3djkxRmx4M0hMZnJ5?=
 =?utf-8?B?T3JYckZqY0doTG9kSk9ab2dBVGNBTkQyQVNoRFIxVi9vNzJSRVJvc0tKcnho?=
 =?utf-8?B?bnVMMVRYWHhTNWxZaWczQ2d1VU1lYkU4aHVHb1VrRDR5TkRWbmVaV0orQ3pG?=
 =?utf-8?B?YTdXYTVzQXJSR2dLMG5uWmF4VVN4Nzl0dlg1cEkyYkwzZ0FJN1JYKy9wUWlG?=
 =?utf-8?B?RThVaUhPVTZJS3ZHTHJTb216VGR0b01EWmZzb3VSQ1J1ZXRSMG1FcHM1LzZF?=
 =?utf-8?B?czNRcitmSmo2K2FlQWRnZVpaSU93SVU1L1dXYjZKZnVVVXp1S1lyRnVTMUZM?=
 =?utf-8?B?dG84TlpjMFpIUlNOTEM1ekJjQTZMRzk2bnBDVEg1cmlpdWdCa1Z5NXlqYjFl?=
 =?utf-8?Q?vf5doFUcurYjCD0Z0cywY5yo6n6QpT4kIbmFRcV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1JnblhwVldQaGswb2pPcjhuT1dBUG1UOTZrd3FnVlNLeUtIa0plVWhPcEFP?=
 =?utf-8?B?dEtaMkJLRVk5R0NSWGFTQmF5R1U0U0hmdlF5cmY3YlFLUUJkNWNYQU8yL3VE?=
 =?utf-8?B?U2FlVlM2NUdzc3hBZWU1d2MrbnloUmhuNzdhbU5qekFLY1R1WVRONUtRdUFa?=
 =?utf-8?B?SzR1MVA1enRyaUg0eTRmeUxVL2pWcFVSa2Z0NG1TSW5kc3hzdU1QbDgzS3pL?=
 =?utf-8?B?d2JyNFl6cHI0R0hYY1hSMGM3NmJ1VFVqRHVQQldwYWZicE5BVFJCb0NkNHZH?=
 =?utf-8?B?ZXRXR1BwSjJuSGpnRmc0RjY2WHlMVnpjR1JWVmNxb1Rrc1E2ZDhFaDZOdW5Y?=
 =?utf-8?B?d0ZuWHVjcXp2WlB1ZkVSNEJaOVl3bWx4K0dtZmhmRy9Rb0MxZlcvNkRQK0x5?=
 =?utf-8?B?Wmpialh5NTdhMmZ3ZEtDYVI4Y0FFS3J6RXRGdGJ6VHRoZkpsT0hZMDBFdlJT?=
 =?utf-8?B?WjMzVHJlb2RFaEJmN2dYR2lKaDJSdGtHcWdLUVpwK2tTR2p2YkZqbEZ2RXEw?=
 =?utf-8?B?ZE1pTzZrUFhKMnI1b3pSVkkrRFl1eFdIZDJ4ZGp4UUUyNE8zK25rd0t3K0wy?=
 =?utf-8?B?aHdXMloxZktONVhqT05oZmlsV0VQNXErZFJjbnVpQ0NlSlF5UkxXdkcyakRH?=
 =?utf-8?B?aG1RN2N0OTF6Y2kvU3RQQmZRRmFUTVBnVlVReUJSNS9jMnd2bUIyS2YrSGhr?=
 =?utf-8?B?UzVJRk1ScUZhbVp6VVp5SjJpU295c2FidDEvNndjM0orTjdXQkVVeVR3M1VE?=
 =?utf-8?B?SFp4cWU4VkNyb0sxcjN3ZUNiVmFadlY0bGdSUWxJUTdWdW5NMGxaS0F5Zlll?=
 =?utf-8?B?R0VPSklrOUpNam8vZDJaU2ptckdjZDNSNlc0KysyUWYycmZlNEpsWXNMUjY5?=
 =?utf-8?B?QkRjSTFCUnN2MTdxWmlYUTF3eE1tNFcraFpOdWpJTDQxb0NEcDNTc1hXdmtj?=
 =?utf-8?B?MnA3UHhNR0pJME0vSWhKaTUyc2lHUm9rK0lJVkhPc2RmQWNDL3BtVDhaU3A0?=
 =?utf-8?B?ZUtvRTIvbFBJVEk1R21EanVBV3ZXTUNxM1daOVVaMmxIOWRpTkFmanhDcE5X?=
 =?utf-8?B?TFoxVmNKZTgzbUU4OTlQR0ZNMFptYTc0SjZ1REFSK1BDMWxJK1AwQWlpOXRR?=
 =?utf-8?B?U2VhU0VBcW44ZE43ZURRK29sUzJqbkRMSVpuRDg5SHlDTjM4M2pyQS9xMUFk?=
 =?utf-8?B?OGFscmJCOVRhYnVlUVU5Z05CVWtnbVU4akppZHdhc3pkakNNMVE4OFZhOHZK?=
 =?utf-8?B?UEJqZDdsZHArRENDSVdQUEg5YWdjMERsTFFnU0pRdEJKUndzS0xBbUsrQkgr?=
 =?utf-8?B?NWpMTW4wMGU2WWhHS2NYanRTV3dNTmcrVHdrMVpPdHdmQjg0RkhaaVkxM0R6?=
 =?utf-8?B?MDd0eitqNlJlQm5KdGhJMUpEZkdvSUVZNTdlSThNNG50UGk1VVhYZWZ4aU9u?=
 =?utf-8?B?MUZGWFkzZGlNeHpFc1JDOFRHcklYOEVjcHR1djN1U1haVmt4akc3T3Q0M2pB?=
 =?utf-8?B?YmRTNEJPOEJET25kWDMvWDBEaVdaZXVza213T2dMdWh4cGRzTlU5TEN6RVBu?=
 =?utf-8?B?QkR5TVZEZi96YWhzcC9tRlExNGJBMmRJSkRDbkRkeWhOMk54dEwyUzhNbWZW?=
 =?utf-8?B?ZmIrTG1TVHlXbkhVSW5uSndBVlRzM2Ira1hETGhFY3k3SWlOZ2RIZzduK2pF?=
 =?utf-8?B?Q3NXYTJ2US9MMVpMZXhsY1ZsWHhTMWtsMDI3bkxOMng0Nm9wMWZpVUwrVXMz?=
 =?utf-8?B?dmQxY2hqNlJMNFErazJBTjdTZDlTRmlYRVZPbzE2bGRUMC9jZG5UOUU1ODcz?=
 =?utf-8?B?TVVmb2Vud1NGdEdQYWJuM0pORk01SGVyL1N0bEFyQlN6RjFEYmRIbm13bUgv?=
 =?utf-8?B?U0lMbDA4M0dob3dBaUo2T0cxVThqanBvb0x1MEVCNUVrOHVza1UyWVJyb3JH?=
 =?utf-8?B?MlpxTEFLeEMyVW05N1E5ZUZuODBVcWZGdEZXMEhDdmhUdnBpbjd5MFg4bmdl?=
 =?utf-8?B?YWwxSG9Ob2xLTEFvSVlJYTk1U05FUkcydjlyL3Iwem1tTXkxSFlPR3Q4SzVn?=
 =?utf-8?B?LzRMZ0NEN1RBVTFXYkVQUkxudlpSSjFPTG5PZGE0eThtZXAvdy9sOXBUdVlz?=
 =?utf-8?B?c2JKNm40TDhpNDVFTldMVjZDd0VTU1h5Q3hUbldYcGEwK0tjejJqMSs2T3JO?=
 =?utf-8?Q?8fyYt5oiGa54OSUNHGplO1U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f28c5b3a-950e-40f8-57a2-08dcfcfc8c54
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 18:14:39.7108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bq5b4Ebtrg8QOJ+hskHqbsrlz1Yo5JqwmEVcNWrxKTZDw/GBr2TGoT8pLo0V1GmVpbFN5l3cbOq+NebepHLowb6fKaJ77SZqX0N8Ud+5kEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
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

--------------i2cASimQGYn0zzNB54gi9BZC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Santhosh,

Still observed some styling issues in the patch.

On 9/9/2024 9:44 AM, Santhosh Reddy Guddati wrote:
> Use the FP_DAMAGE_CLIPS property of the plane for non psr modes
> and fill the damaged rectangles on the plane with framebuffer
> coordinates and verify that fbc dirty ctl is enabled.
>
> v2: Fix typo , add version check for feature support,
>      extend support for all pipes (Rama Naidu)
>
> Signed-off-by: Santhosh Reddy Guddati<santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 78 ++++++++++++++++++++++++++
>   1 file changed, 78 insertions(+)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index e45d17dd6..b15527209 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -57,6 +57,10 @@
>    * Description: Sanity test to enable FBC on a plane.
>    * Functionality: fbc
>    *
> + * SUBTEST: plane-fbc-dr
> + * Description: Sanity test to verify FBC DR by sending multiple damaged areas with non psr modes
> + * Functionality: fbc
> + *
>    * SUBTEST: pipe-fbc-rte
>    * Description: Sanity test to enable FBC on each pipe.
>    * Functionality: fbc
> @@ -1168,6 +1172,7 @@
>    */
>   
>   #define TIME SLOW_QUICK(1000, 10000)
> +#define MAX_DIRTY_RECT 3
>   
>   IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
>   		     "its related features: FBC, PSR and DRRS");
> @@ -4288,6 +4293,73 @@ static int opt_handler(int option, int option_index, void *data)
>   	return IGT_OPT_HANDLER_SUCCESS;
>   }
>   
> +static void fbc_dr_subtest(const struct test_mode *t) {
> +	struct drm_mode_rect rect_data[MAX_DIRTY_RECT];
> +	uint32_t color;
> +	drmModeModeInfo *mode;
> +
> +	igt_require_f(drm.display_ver > 20, "FBC with dirty region is not supported\n");
imho, Add this Display version check into main function before dynamic 
test start.
> +
> +	prepare_subtest_data(t, NULL);
> +
> +	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
> +	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
> +
> +	mode = igt_output_get_mode(prim_mode_params.output);
> +
> +	for (int i = 0; i < MAX_DIRTY_RECT; i++) {
> +		// Full Frame update
> +		rect_data[0].x1 = 0;
> +		rect_data[0].y1 = 0;
> +		rect_data[0].x2 = mode->hdisplay;
> +		rect_data[0].y2 = mode->vdisplay;
x2 and y2 should be mode->*display -1.
> +
> +		// Half Frame update till last-1 scanline
> +		rect_data[1].x1 = mode->hdisplay / 2;
> +		rect_data[1].y1 = mode->vdisplay / 2;
> +		rect_data[1].x2 = mode->hdisplay - 1;
> +		rect_data[1].y2 = mode->vdisplay - 1;
> +
> +		// last 10 scanlines update
> +		rect_data[2].x1 = mode->hdisplay - 10;
> +		rect_data[2].y1 = mode->vdisplay - 10;
> +		rect_data[2].x2 = mode->hdisplay - 1;
> +		rect_data[2].y2 = mode->vdisplay - 1;
> +
> +		igt_debug("Dirty Rectangle data = {%d, %d, %d, %d}, {%d, %d, %d, %d}, {%d, %d, %d, %d}\n",
> +					rect_data[0].x1, rect_data[0].y1, rect_data[0].x2, rect_data[0].y2,
> +					rect_data[1].x1, rect_data[1].y1, rect_data[1].x2, rect_data[1].y2,
> +					rect_data[2].x1, rect_data[2].y1, rect_data[2].x2, rect_data[2].y2);

Shouldn't this be aligned with the opening brackets for readability.

> +	}
> +
> +	for(int i = 0; i < MAX_DIRTY_RECT; i++) {
> +		igt_plane_t *primary = igt_output_get_plane_type(prim_mode_params.output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_fb_t fb[MAX_DIRTY_RECT];
> +
> +		create_fb(t->format, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay, t->tiling, t->plane, &fb[i]);
> +		color = pick_color(&fb[i], COLOR_PRIM_BG);
> +		igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb[i], t->method,
> +			rect_data[i].x1, rect_data[i].y1, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1,
> +			color);

Shouldn't this be aligned with the opening brackets for readability.

> +
> +		igt_plane_set_fb(primary, &fb[i]);
> +		igt_plane_set_position(primary, rect_data[i].x1, rect_data[i].y1);
> +		igt_plane_set_size(primary, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1);
> +		igt_fb_set_size(&fb[i], primary, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1);
> +		igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS, &rect_data[i], sizeof(rect_data[i]));
> +
> +		igt_display_commit_atomic(&drm.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		fbc_update_last_action();
> +		do_assertions(ASSERT_FBC_ENABLED | ASSERT_NO_ACTION_CHANGE);
> +		igt_assert_f(fbc_enable_per_plane(primary->index + 1, prim_mode_params.pipe), "FBC disabled\n");
> +
> +		igt_remove_fb(drm.fd, &fb[i]);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_display_commit2(&drm.display, COMMIT_ATOMIC);
> +	}
> +}
> +
>   const char *help_str =
>   "  --no-status-check           Don't check for enable/disable status\n"
>   "  --no-crc-check              Don't check for CRC values\n"
> @@ -4513,6 +4585,12 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		plane_fbc_rte_subtest(&t);
>   	}
>   
> +	igt_subtest_f("plane-fbc-dr") {
> +		t.feature = FEATURE_FBC;
> +		igt_dynamic_f("pipe-%s", kmstest_pipe_name(prim_mode_params.pipe))
> +			fbc_dr_subtest(&t);
> +	}
> +
>   	igt_subtest_group {
>   		igt_subtest_with_dynamic("pipe-fbc-rte") {
>   


imho,
Add one more subtest to create dirty rectangles in different places in a 
frame (e.g., dr1: (0,50), dr2: center of the frame, dr3: last 50 lines). 
Then, provide one atomic commit for all three dirty rectangles.

--------------i2cASimQGYn0zzNB54gi9BZC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Santhosh,</p>
    <p>Still observed some styling issues in the patch.</p>
    <div class="moz-cite-prefix">On 9/9/2024 9:44 AM, Santhosh Reddy
      Guddati wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240909041441.528638-1-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">Use the FP_DAMAGE_CLIPS property of the plane for non psr modes
and fill the damaged rectangles on the plane with framebuffer
coordinates and verify that fbc dirty ctl is enabled.

v2: Fix typo , add version check for feature support,
    extend support for all pipes (Rama Naidu)

Signed-off-by: Santhosh Reddy Guddati <a class="moz-txt-link-rfc2396E" href="mailto:santhosh.reddy.guddati@intel.com">&lt;santhosh.reddy.guddati@intel.com&gt;</a>
---
 tests/intel/kms_frontbuffer_tracking.c | 78 ++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e45d17dd6..b15527209 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -57,6 +57,10 @@
  * Description: Sanity test to enable FBC on a plane.
  * Functionality: fbc
  *
+ * SUBTEST: plane-fbc-dr
+ * Description: Sanity test to verify FBC DR by sending multiple damaged areas with non psr modes
+ * Functionality: fbc
+ *
  * SUBTEST: pipe-fbc-rte
  * Description: Sanity test to enable FBC on each pipe.
  * Functionality: fbc
@@ -1168,6 +1172,7 @@
  */
 
 #define TIME SLOW_QUICK(1000, 10000)
+#define MAX_DIRTY_RECT 3
 
 IGT_TEST_DESCRIPTION(&quot;Test the Kernel's frontbuffer tracking mechanism and &quot;
 		     &quot;its related features: FBC, PSR and DRRS&quot;);
@@ -4288,6 +4293,73 @@ static int opt_handler(int option, int option_index, void *data)
 	return IGT_OPT_HANDLER_SUCCESS;
 }
 
+static void fbc_dr_subtest(const struct test_mode *t) {
+	struct drm_mode_rect rect_data[MAX_DIRTY_RECT];
+	uint32_t color;
+	drmModeModeInfo *mode;
+
+	igt_require_f(drm.display_ver &gt; 20, &quot;FBC with dirty region is not supported\n&quot;);</pre>
    </blockquote>
    imho, Add this Display version check into main function before
    dynamic test start.<br>
    <blockquote type="cite" cite="mid:20240909041441.528638-1-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	prepare_subtest_data(t, NULL);
+
+	igt_output_override_mode(prim_mode_params.output, &amp;prim_mode_params.mode);
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+
+	mode = igt_output_get_mode(prim_mode_params.output);
+
+	for (int i = 0; i &lt; MAX_DIRTY_RECT; i++) {
+		// Full Frame update
+		rect_data[0].x1 = 0;
+		rect_data[0].y1 = 0;
+		rect_data[0].x2 = mode-&gt;hdisplay;
+		rect_data[0].y2 = mode-&gt;vdisplay;</pre>
    </blockquote>
    x2 and y2 should be <span style="white-space: pre-wrap">mode-&gt;*display -1.</span>
    <blockquote type="cite" cite="mid:20240909041441.528638-1-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+		// Half Frame update till last-1 scanline
+		rect_data[1].x1 = mode-&gt;hdisplay / 2;
+		rect_data[1].y1 = mode-&gt;vdisplay / 2;
+		rect_data[1].x2 = mode-&gt;hdisplay - 1;
+		rect_data[1].y2 = mode-&gt;vdisplay - 1;
+
+		// last 10 scanlines update
+		rect_data[2].x1 = mode-&gt;hdisplay - 10;
+		rect_data[2].y1 = mode-&gt;vdisplay - 10;
+		rect_data[2].x2 = mode-&gt;hdisplay - 1;
+		rect_data[2].y2 = mode-&gt;vdisplay - 1;
+
+		igt_debug(&quot;Dirty Rectangle data = {%d, %d, %d, %d}, {%d, %d, %d, %d}, {%d, %d, %d, %d}\n&quot;,
+					rect_data[0].x1, rect_data[0].y1, rect_data[0].x2, rect_data[0].y2,
+					rect_data[1].x1, rect_data[1].y1, rect_data[1].x2, rect_data[1].y2,
+					rect_data[2].x1, rect_data[2].y1, rect_data[2].x2, rect_data[2].y2);</pre>
    </blockquote>
    <pre class="content" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: white; border: 0px; border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Shouldn't this be aligned with the opening brackets for readability.</pre>
    <blockquote type="cite" cite="mid:20240909041441.528638-1-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	}
+
+	for(int i = 0; i &lt; MAX_DIRTY_RECT; i++) {
+		igt_plane_t *primary = igt_output_get_plane_type(prim_mode_params.output, DRM_PLANE_TYPE_PRIMARY);
+		igt_fb_t fb[MAX_DIRTY_RECT];
+
+		create_fb(t-&gt;format, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay, t-&gt;tiling, t-&gt;plane, &amp;fb[i]);
+		color = pick_color(&amp;fb[i], COLOR_PRIM_BG);
+		igt_draw_rect_fb(drm.fd, drm.bops, 0, &amp;fb[i], t-&gt;method,
+			rect_data[i].x1, rect_data[i].y1, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1,
+			color);</pre>
    </blockquote>
    <pre class="content" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: white; border: 0px; border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Shouldn't this be aligned with the opening brackets for readability.</pre>
    <blockquote type="cite" cite="mid:20240909041441.528638-1-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+		igt_plane_set_fb(primary, &amp;fb[i]);
+		igt_plane_set_position(primary, rect_data[i].x1, rect_data[i].y1);
+		igt_plane_set_size(primary, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1);
+		igt_fb_set_size(&amp;fb[i], primary, rect_data[i].x2 - rect_data[i].x1, rect_data[i].y2 - rect_data[i].y1);
+		igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS, &amp;rect_data[i], sizeof(rect_data[i]));
+
+		igt_display_commit_atomic(&amp;drm.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		fbc_update_last_action();
+		do_assertions(ASSERT_FBC_ENABLED | ASSERT_NO_ACTION_CHANGE);
+		igt_assert_f(fbc_enable_per_plane(primary-&gt;index + 1, prim_mode_params.pipe), &quot;FBC disabled\n&quot;);
+
+		igt_remove_fb(drm.fd, &amp;fb[i]);
+		igt_plane_set_fb(primary, NULL);
+		igt_display_commit2(&amp;drm.display, COMMIT_ATOMIC);
+	}
+}
+
 const char *help_str =
 &quot;  --no-status-check           Don't check for enable/disable status\n&quot;
 &quot;  --no-crc-check              Don't check for CRC values\n&quot;
@@ -4513,6 +4585,12 @@ igt_main_args(&quot;&quot;, long_options, help_str, opt_handler, NULL)
 		plane_fbc_rte_subtest(&amp;t);
 	}
 
+	igt_subtest_f(&quot;plane-fbc-dr&quot;) {
+		t.feature = FEATURE_FBC;
+		igt_dynamic_f(&quot;pipe-%s&quot;, kmstest_pipe_name(prim_mode_params.pipe))
+			fbc_dr_subtest(&amp;t);
+	}
+
 	igt_subtest_group {
 		igt_subtest_with_dynamic(&quot;pipe-fbc-rte&quot;) {
 </pre>
    </blockquote>
    <p><br>
    </p>
    <p>imho,<br>
      Add one more subtest to create dirty rectangles in different
      places in a frame (e.g., dr1: (0,50), dr2: center of the frame,
      dr3: last 50 lines). Then, provide one atomic commit for all three
      dirty rectangles.<br>
    </p>
    <blockquote type="cite" cite="mid:20240909041441.528638-1-santhosh.reddy.guddati@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------i2cASimQGYn0zzNB54gi9BZC--
