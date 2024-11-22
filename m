Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626C5D75E49
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 13:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212B310EB8B;
	Fri, 22 Nov 2024 13:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WroY0n66";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FC210EB8B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 13:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732283309; x=1763819309;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8VQQjzV0+t4dMXE9UnK97tNR1UOIf5DlVD0peSrOSqU=;
 b=WroY0n669eOXShX2GkJHVJCnXm6l/XcLKYYxBKPiI6HWwlz8tZ8matma
 6rGu3WyKm8eC9Nz4zONIanUxxTtNgjbLlQyFGfTdPFAuD4MVJeKNFqWHE
 QjLlptu0QgjGb6vQSJI4TvN3isy3GFop+d9RUsX+v5HfWmIQytSdkWYjj
 VZuOdwljk7ohCTZs/qIiNYDOKAkSjgt7MMCYptaSkG2T5Aid0W50rnhTx
 fPz2lBmVzFCB8lIwqOPTbVX+9Ed1q08Jj9CKCpKZUUXDVeXYboHRgtX/T
 YNwWsS46+qSp4pPwwkh4FXrRNCUfgJfNIiXoJyNN7hZ9rO04pMH5SQPr1 Q==;
X-CSE-ConnectionGUID: ENwA/NpqQZqwkDTQUcn+EA==
X-CSE-MsgGUID: JqIOwZ2hRx+ltMHlEcFR4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43817922"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="43817922"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 05:48:28 -0800
X-CSE-ConnectionGUID: dLYY57r7R9mpbWtl0UTY/A==
X-CSE-MsgGUID: AxXsFl6NR4iiWoBaQEwHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="95644821"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 05:48:29 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 05:48:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 05:48:28 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 05:48:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TngS/17FWaLgF3XRCDQ5/C/z19PHJOFC+RjuHk4/v+OmOHtTktSmPVZUeMqEnKx6RmFOAJaU9A5AZMtLnWj81Ka/vmO2Jd5Vdw0ITcDWSkq8tyjBE+3ZWoDFF+/2KpQI82gej5N56Dp634qN7V4pzQwFWRkLRlBzxkQWzz+c9/LKPUqTDp1Q3C4LpFswyuVIbHgusgUoM/gYFnezToEU/BeV7yT/sQ1Fz/aQZK1R3bexHq/MtcLcGVvNJVKGC/ErUdScvErRD7M9vxmjWj4z3BMpN9gh+tEkxBoxLw8lG857htKQ0Jv0ik1d4By0ROcuIv7Cpnno8QCz+FGq4YjzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baQPuQbfSenh8smcReQA6lHSFkQm1775KYcj5QxQi6w=;
 b=JdfZq8tbUZ5Q4thg9LCom7HAri23AVcNCyHmwq5llrmpmRjRErNYPRQrp37oStrIQmSlX1qCWjHHBCpryzHwt8awGz9rC51RTh7QsDjO7gFUovwS8HbTyzvFXXxUXeRE0CK59R5R6mH+4hqYxXdSvyIt4aVL+v/KftK1DptDeI60opqMb9OKX/0FVy6aq3ipeEa4aQ1FGrsSJXw9i4z1laPYsbjANtZ5ZQ+GaIQzDJ96Ce5HNv6CLzkwF8JdnZU/3lVffYDOzUANsFSwoirCRbEGSJweq0mz7Vhk/mUbYG9nn6xKxr2ZyloCIoHkXlUjVt/vUay/qsk2aTQVw8efmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 13:48:26 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%7]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 13:48:26 +0000
Date: Fri, 22 Nov 2024 13:48:16 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <chris.p.wilson@intel.com>,
 <andi.shyti@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <dfnqg7q644dirf6vyypysbj3ofbhrvyxfe5eez5qcr34yhskww@bqyfnswxi3jb>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <7occzjselhix5vtg2qumxo52zxm6t2g23jnlg6wtwowp2osisn@ucaa2k2v7tpg>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7occzjselhix5vtg2qumxo52zxm6t2g23jnlg6wtwowp2osisn@ucaa2k2v7tpg>
X-ClientProxiedBy: ZR2P278CA0034.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::15) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DM4PR11MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: 275a2034-b9a7-42a2-37b6-08dd0afc5617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWoxWUpsTm05YWdtYmh2ekFrbzJjY1lITHFrMWliMFRTdUs0eW5FVWdCVEE3?=
 =?utf-8?B?MzNwSlpkcEFvazVLNEJoS1RrN1BkTlZudmFpZC9wNG1UYkJieEwyNTBORDJp?=
 =?utf-8?B?MEhJVmd4OG9MSTY5ZkpRU3laTks2ekRwYnlNVGI0M1A5V3dKKzA4dURrdGda?=
 =?utf-8?B?VGxON1dCTEVEbFdoaExwRXZKc1NPUnBrZ2xMdlFseVo4SVo1SFZjMmhKcUV1?=
 =?utf-8?B?ZHFKWFg1cjBvMHFBTC9Ia09LMUJkZG1Gd3diVnRoVFlHNHFQTFpHMEo5TGJi?=
 =?utf-8?B?YXFYRmFZbGF4cFl2UnFlNStJOFV4WUt1OTRHOWdvaFlieXlOSzMvcDljYUV3?=
 =?utf-8?B?Rks5dWVpcUdGQ3ZxT0RuVUpjQmZzVWtpQU9KMGUxdzFBc0JKbWNjazlFWHlU?=
 =?utf-8?B?TWN1Skh1V01BYlVRVUtNS29yZ0Q3NWpQYjhGRkc5U1NBbWs4cGVrWEVibGl0?=
 =?utf-8?B?eU9QMi9SSUhvcW1wMXFIV084QXhBZkxHZmluRlJJdnRHVDZRQmxQcmp4UU5Z?=
 =?utf-8?B?aTFHUldtVkJ4cEpQVHNRL1FGd2dxSlNSMjBMejFialpXVzFiQjBPeHJ0M3JD?=
 =?utf-8?B?eGVZaDZHQWFhRE5zamM0SmJvZy9iZ2tPcDRUVUtjZjlTTEcxdU90NUVGS3Js?=
 =?utf-8?B?SXQvcTRGNUYyMEt2VytNczFKVlBEaUtwWERXcHg4KzVieE94SWVpMVFuNi9M?=
 =?utf-8?B?djAzSitNSDcvWVB4dVhTZGczYkxHN2hYSG5HQi96cGxUeFZyenp2Um1JMkJx?=
 =?utf-8?B?ZFg5VUdRQ28yTlVidTdaNUUvY25CNVBNV2h0cGtTbUpCTUVmK0FWVldOaDZV?=
 =?utf-8?B?ZVVnVi81eWJodHJxYVBmVCs2U3N4M28yczM1WENkbU0rQmMwL0hJOS8xVi9O?=
 =?utf-8?B?Nmkvc0JVQ05QQ3FqS0NwemdnS1dyVTNFWFRQeGxOUm9Hb2NCZmRLbUppejk0?=
 =?utf-8?B?cEVYK3lIYllOMGR2akN6bVpuTEV5ZnoyMmFxbnV3NjhIeWV5QWVPQW9ocFdW?=
 =?utf-8?B?YUJHRjN2NW5PNTkxWitrd2dKeHRES0FWZTk2RWZhRkt1NHhJQWtwTVJhYW90?=
 =?utf-8?B?NGk3WTJqRCtJeFB4OWdiLzZ3UmlXSFZvYVZWM3NjOXpxaytjYUp5Z3Y0OU82?=
 =?utf-8?B?TE93Z2IrRDNjVzhrUFIwNDNGQmQ1K1ZNUC9odEQ2ZmxQUDZxeVRpY25Gd1Yr?=
 =?utf-8?B?dnAvZTFWMHI5bndpQmp2bkxWUmpwSFAxZkdPK2ZLaUltdWJDVnBGakc0bGlB?=
 =?utf-8?B?TGIwRFJsZUxtYWVMdFpET0ZxT2NBcXg1aUxZTjNYS1lyUytTYldMWEpETGRj?=
 =?utf-8?B?OTRFRkFDZlhpQ01rbERpbjlUN0hZWGwybUpNTXc2T1RvcE1PazVrWHVqWnhM?=
 =?utf-8?B?SDBpdmw2NXBOMlpyZXo4aC9XU1hoOVRXdTdkc2NSdGx2NnNmcHZqbVYxRGxx?=
 =?utf-8?B?YndpaG1jZDRzRVd5ckliQ1lFd2FvcVFYUXJVbFZFbGlJZUh4dytiYzJJREFo?=
 =?utf-8?B?OUxLVkdRZ3U5RGZyWEM0aTJWVmV6YitCK3dMQmZEMy9ZUEY1M1cvV0NidXVV?=
 =?utf-8?B?TlVxTnNyZjlqYjRLU091MDZKeWVROFFQdmh1YmNFOXpERDAzWXVFMXFvdTNj?=
 =?utf-8?B?WWhsaElvcDVnU09RNWZnUnNtcXExemZaMlg2ZGpyT3JyKzk1aHhXYWxvTTJr?=
 =?utf-8?B?aG4zRzlmUk1ESjRRQS8xK0YrcXFCVldheE0zcXZGQXAxQTlHR2FCSS9uZTdl?=
 =?utf-8?B?Zll5QnlCaGpseVRYMHI1ZmhJQlFMUDcwRXhtVmdkSmpKRysyMGVhMjlOQmtY?=
 =?utf-8?Q?Fj4WykgRYGEnfHaJx25wz/0j2FfUyZMsTWnH0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cndqdGxXd1Q4L3JwK0NoNnk1emVOeXBOU2ZSQzZMeHVyb21qVXdnRGNXY1Jn?=
 =?utf-8?B?eDFiOXFmMjdqZCt0UHA5SDQrMTBKRGFWTGFBaXBJV2dkNTIrZVZrb0JMYkZP?=
 =?utf-8?B?T0ZaL1ZqNXozMEhsTDd5OEV3cHFqbDVGaFoxQUdCTU5UM1M4UVRvOFNvSmRi?=
 =?utf-8?B?SlNaV0xNSFloMEdwTWpTOUo0cTRYeTVtbndEbVc5LytSVmFBL1hSMDU1ZnlU?=
 =?utf-8?B?dFR4RVJBem5DZ3pDbzlOVVJLNkpvcHB4VDZ0L0dYY3oySHQ3S3U0WnR6bkdY?=
 =?utf-8?B?TUdEMXBySHdQdDBybU1hV2lXcTNZcDdIbkFmaEd6MXBvZkJtek85ZU5DNzBE?=
 =?utf-8?B?Uk5RaTlSd3orWGN1SVhJNU10VmVGUmlvMElVSDlXcmQwQ0l3TTVYQU1WVGkz?=
 =?utf-8?B?bmFqcnhzeDhVRC9lSXd5NWYzdzU5dlF0QktHWWhRRTIwMjdiRitpZlJKU254?=
 =?utf-8?B?UG9xeEpBR2NDY1FpZWNGS1c3U3BBTU9HWkUvSnRyVDl3azdmWFY3MjBlQ0hy?=
 =?utf-8?B?aFJxQVZvMVphOCtYNlRta2pyVzQ4ZGFQeGdUS0dFRThuVVFxNkJjR0RLMnpX?=
 =?utf-8?B?L0JGV3FkWURkQW5aaGJlOWJqVjc3ZmNyclBxSzlEcGU1UmpJQW1kUlhUL3Ju?=
 =?utf-8?B?V21adDN6c2QvcklLMEFUSXIvaHpIVkI3a2RXRkFINnVmVXlGZW9vRzJ1dkR5?=
 =?utf-8?B?TXdMNHIxVFVHL05kUGRnVVBhYVhHSDVaUWl4QXpUaFpTQjNad2k0RGY1NFFO?=
 =?utf-8?B?S0dIdGxaQnlnOU9ncllSTERBaHYxRkJ3ZkE5NS9FNk9JSVZDNWFCTHlmeXpI?=
 =?utf-8?B?SUZ5Y0MrNE1Vd0lhM0x4Y3dyM3lNcHl3UXljNm9DdXFXMEk2Umt5QklBK1Ev?=
 =?utf-8?B?eTh6Z0I4THJNbGpJR3ZnbkszWUxlY3VES2NBdDJrK2tpc3NwWkczN21wT1ky?=
 =?utf-8?B?ZGhZekhuZlRxL0xGSGxjMFp5ZVRDdGh3RkVqSmZVcmEzYS9YN0tnTVoyOHlK?=
 =?utf-8?B?ZHJBQ2xqYlViRHVEL1Z1Y2h4ME8rQkVZTUI2WW02ZnpCcXEzTFJRRmszVDAv?=
 =?utf-8?B?MlBMcjBjNG5IQmovVVVEMXhZQkdSMWJrdW1VajRsMmlPaFR4UksvZlhPd3lC?=
 =?utf-8?B?ZHRhZnlodFE4RFpEZnROMVlJK1VMQ3kzYTZzR3ZvS0N1VHVpdHltdHFML0VV?=
 =?utf-8?B?Qm4rdkFJTk92L1o5b0ZLK1V0cW1WNmZTTXVQMkZjeWg4T1VLOEZmNFdaengy?=
 =?utf-8?B?K3U2S3N4NnNjNUp1ZkRtemdEUHlBTDRVeFo5RVlxSkV6andFS2puczMyc1VX?=
 =?utf-8?B?RlZzaUdvenNZT3o3M0Qwa3pJVjFEMWo5OGVCczgyR2dic0VleWN3dEZEUnp2?=
 =?utf-8?B?bmIyMFBaYTI0Vm5EUEMvWlJVemxtMHhSY0hxT2xRTlZqdEdQNlpaWlF6WFNH?=
 =?utf-8?B?ajM3UERKOWZ5QVptUVF6UGE1Y3U5em01eXJqN3dhWFhYRkVxZE12NVVOMTNk?=
 =?utf-8?B?SXlvYXFhdm9PUTFXT2I3K2FIelN0dEFaNnRkVWhrTkQ5VFlpQ3dnRW5WY1gv?=
 =?utf-8?B?VVZ3WW82U2UvOTJvOEcvMGNtMWtsOXVIa2lQQjQwSTJ6VU52TUZIYldMMUFE?=
 =?utf-8?B?NGc1MjNnVlRzNHgrUFFkcmVyK0I2K25rYXNQVGdOV0xPUWVrdkd4Smo5aWdT?=
 =?utf-8?B?aklpaDFYWGdWU1lIbHVRcE9OVEttZlJLZ3hLekxLazRuK0dob2RHVnJGY3d3?=
 =?utf-8?B?dUVmV1V2YVNuazBpcTRkL1dBUHBVdnZsV0hqOFNKRlFvOHkrdmh0eVQ5OFlL?=
 =?utf-8?B?ZWYwMjAwUzlTZ3dXSVFOUGpSbGoyNDZQMGN2ZDdqOHNOSXVXb3RJQXBGMWJp?=
 =?utf-8?B?emw2eUYwWEhMbkNVL0VCQ1dZSXVMRnFwamozak91VmNCOXRFQ1JrNi95NHVG?=
 =?utf-8?B?Tk9LOUllY3hpaVN5WTdLTm1vUFF2ZHc0ZFQrTXRTelVBYXJmeXhveEtZYlVu?=
 =?utf-8?B?UWlzMzdHMzBiMlh0dUVEMjE0bW02a2hLOVorVnl4eDU2dlFWalB2MDhnd25Y?=
 =?utf-8?B?cUVMd3g5Vk04ZXY0eVdDcFhxTG94V3QvRDdZUEswNXJucGZIWlh1T0NtbWhz?=
 =?utf-8?B?U0pRcHdoOUJubE9vUFcyN0l3WjM1d0VMWVpnNDRDRDZ3RytLQnA4dWtYZHdG?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 275a2034-b9a7-42a2-37b6-08dd0afc5617
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 13:48:26.1100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLB1K5dJRssF0cCRMwi3o0sIxVFu/zIYq6G1sOxR+RD8QjAwy79l7/hPBUwpt027gESuXA3SWEICSjluRFPva2/prbo/w9aWUlpW91fPvI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
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

Hi Mikołaj,

> +static bool
> +is_bcs_ccs(const struct intel_execution_engine2 *e) {
> +	return I915_ENGINE_CLASS_COMPUTE == e->class ||
> +		I915_ENGINE_CLASS_COPY == e->class;
I think you could swap these around: e->class ==
I915_ENGINE_CLASS_COMPUTE || e->class == I915_ENGINE_CLASS_COPY.
While logic remains the same, you'll show that you check e->class
for certain values, not other way around.

> +}
> +
>  static void
>  test_engine_hang(const intel_ctx_t *ctx,
>  		 const struct intel_execution_engine2 *e, unsigned int flags)
> @@ -388,6 +394,12 @@ test_engine_hang(const intel_ctx_t *ctx,
>  	 */
>  	num_ctx = 0;
>  	for_each_ctx_engine(device, ctx, other) {
> +		/* Wa_14014494547:DG2 */
> +		if (IS_DG2(intel_get_drm_devid(device)) &&
> +		    is_bcs_ccs(e) &&
> +		    is_bcs_ccs(other))
Does for_each_ctx_engine() "know" if e == other? If it just iterates
over all engines, then you'd also skip cases where both point to the
same engine (e == other == bcs0 and e == other == ccs0), so in result
nothing would be run in background on those.

Krzysztof

> +			continue;
> +
