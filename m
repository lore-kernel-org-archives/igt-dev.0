Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7551BD64081
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 07:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE9910EBCD;
	Wed, 17 Dec 2025 07:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrP0olsr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9AF10EBCD
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 07:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765955109; x=1797491109;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=+C9nBtPvK9PXOgpla9jlzSzLed+bbyqyltRd1oM/ve4=;
 b=nrP0olsrO3fqQT4E1A2oCDiiD/p2IyoGsgAVRaUv8WmYGCWLyquZMm3g
 Uu+acTqfx6v/wicNZS7PNF+CrJrHuznDM2UI96UHfkmjbLUjCpesnZdFk
 4MDnrP1/sUrjES7ooLsSLIKXUjKsQ/5JpvmzclbElphnFMXvpcf4LWndZ
 NJp22EhMYqYmdrQaEU4nu2uviB9fRamcj6VRHzxuA37MsMJ7ma+5cWWmg
 MMcfB1DVUrCul/P5Gp4vySHvZXP4SQa1FkwIpF7b5vP9Mx/SMuBqq5FFN
 8OgtxQmsIZmNH7hnTdxeR+8SbblulEASP+B/i80Ij3Lf7i7e0Vvg+Apkm A==;
X-CSE-ConnectionGUID: JFhYKOQYQP+tlvKei9tn0Q==
X-CSE-MsgGUID: 9Ehj1QxmQQeZXBzWdmlDVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67638628"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="67638628"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:05:09 -0800
X-CSE-ConnectionGUID: RTyWeYzmQySuXr3lPNXZCg==
X-CSE-MsgGUID: nIHKwOi3Tgqnv/5K4zq5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198485315"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:05:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 23:05:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 23:05:07 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 23:05:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXjY+Hz4cd+7+PraanA6/ivtrREcJn/AcDujz8hud08hzQ/497We3nnR1JGF6KbKYCjdKxK4TUdBr+8JrbpIvsjVucvWOAYUNf7xOZ5WxR2tK85/NI7R2a+pE7nP2K/vqcWx19qcMcnFnMASIJS7HgQX7BD0LULOHeMV3ZlS6UiLt+U+CNZlM/MSceGvmHIYTpMDgxIg9rRa5QkH8wo12ETtr0OyfVKIhl0f8mL0TLbtmrjRms6wxDmtArkxCUG08qRvr3dBMV52L5g42cfjUm6fk8dCQgSmpfQVZVW9/+TvIswQFwbSt/RczRYpRewLVG/ntp1LE2N1AuEynuvtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTnJj/4TXkfvuhC5O/Gpf5jXUPtC7IAz7WeYoEcI9fc=;
 b=Rb2M00mtsV6nOHwQJTa+8AGiqserVj2CfKBvLZiccCdCrNUiGGLhWHSUSfGFOkJDMBuAfPKTkMrZgZCIhj3tvX4lPxWsfz6PV6NV8ggUgO+AujjIp5j9FbQYdvyqR9b5+6yO5FHWTstB5vpwAvU2U0JmDeIvef5cIHKEBWsTYgtWVNZu0b2n59LWNrQ3RrUnHzsGvl1+tvmOzjvXx+78G2pBaEULvPPiLWpXD2fMQTcc5/5uO1dtTb2J4YeTZDUEyrkpWjujR1caa+ucUy4fm8Ui6egCd4+aHVej2UxCGX959UCraWTBVwE5DNoOoZWHVu2I37/6kIlnwxKpEI7Wbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SN7PR11MB7567.namprd11.prod.outlook.com (2603:10b6:806:328::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 07:05:05 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%7]) with mapi id 15.20.9412.005; Wed, 17 Dec 2025
 07:05:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Dec 2025 08:05:10 +0100
Message-ID: <DF0AUA96GTSN.1UWEVS3F6M94I@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: prevent losing original
 pointer on realloc failure
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.21.0
References: <dda88be9f499aec000d32ea52b4baf18751d9de5.1765809053.git.sebastian.brzezinka@intel.com>
 <257cafe7-a9ff-47d1-a862-488305b169a5@ursulin.net>
In-Reply-To: <257cafe7-a9ff-47d1-a862-488305b169a5@ursulin.net>
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SN7PR11MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 79577bf7-9290-40f6-7c51-08de3d3a9b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emIwczBWMXRxMEU4UE1UcUwwUVROeCs5WjB4SVhXT3ExR3I0NUk2eHF1THU3?=
 =?utf-8?B?NDE2L2xzVVJSYlUrV3Z3TXBUMEFlQ3dCYitQNWdTWVhST2R5L0FjRTRrazl6?=
 =?utf-8?B?UzVBVThYcG5KUksvcXRwWVdDRHdDaWJuSWhRUEdJRmloU3J6cjNMeDQrRXcx?=
 =?utf-8?B?QllKcm12QWdRWUJnVXA3ZXJHOFp1b2FIakd1RUxObHZJeVhqOG9ZUWpHcWFq?=
 =?utf-8?B?VmNGZHBpZlIzRHQzSjB1R1VvZDR0VmV2anpZREgxdkhGQXNDVE0wOFZzTVF5?=
 =?utf-8?B?c3FOK1V5b1NVVUxqT2M1Y3doZjBFUjhoR1E0d1NXTmcvaWJOdllEQjVrd1B4?=
 =?utf-8?B?eXRENGpvT1VuKzBVcVBlUlc0OFRDeEVmdXVaU1BxU1AwQnBXR2VhTE9zTnFU?=
 =?utf-8?B?Smc5Yk9adzFyb0UydWNPY3VYRjdEM2wrU1AwT0p0Vk8yRHFKUjF5R3JpZ3N1?=
 =?utf-8?B?Z3RKdmZIeFFGWjNMSDdDVUN1QmRzSGZSaUM3N0tmY1NZVjVaNFZPR29UK0U1?=
 =?utf-8?B?RU55bEpoODlzWE5wanVra2s1VjBTaUFGazcvd24wSUR6YWxjck5RRk5QZEJs?=
 =?utf-8?B?Ykp5VHI3UW53VGhpTzdyYnQyR1JVNmthL0gyZjlJaFJQSzU0azAxOUxoWHFT?=
 =?utf-8?B?RmhzTFdDcHJNaStsTGZPR2pJdjd5U1U0OWRxOFpvODNiK3RKbi9yMHd6akRt?=
 =?utf-8?B?Rk8rN1RmR3FSZFZUbzlWZFppQzVTS29Qd3o4SVNFekxFckgreDZkNy9VNVZh?=
 =?utf-8?B?SUQzbmJsalYzZkVBTHh4Sk1LNVY3SFdkMWpDOXhuLzF5VmRxSWc2Mll0U1RP?=
 =?utf-8?B?Zms3YmZzRTR2dTNRaStnTlZ3NXZVMEtucWtFK0NCclNYUDh6L0p2V1d1ektO?=
 =?utf-8?B?dExFOWFrY3VvaVg3MTJTVnY3eGg1RGJTYkJCb3RjQUJVNkRVL2tTdWhBZWQy?=
 =?utf-8?B?L2J3MjhwSWNFWTM3YjZhYTdHNWQ5R05JQWo4UDBnMm05VXpON3MyZ0xURUpW?=
 =?utf-8?B?QzJQQzFxODY3N3FHQW5mMFV2NkxRU1ZDMW1EbFIvcVpLK0x1VzFoa1JURzRh?=
 =?utf-8?B?QmcwREd4Mlcrck45VmhlTWlDeHAzd091MWwwZGxYcVJhWmpTcUI1VjVqbXMv?=
 =?utf-8?B?UkZhRzh4azVLclczb0xCN3NnRWdyWUNLZ2dQd1kwejkvWktSbkhxUkJZYUk1?=
 =?utf-8?B?ZU5ZWlBqdHlOYU9XZ1plQ2gxS2J6V3MxYUorK1AxM21nUnFMOFE0YmtXT0U4?=
 =?utf-8?B?MGF4ZURZKzR4YW85dG40eUxXaGFndUNnRHhCRko3UjQyN29wejNIUWl6eWxT?=
 =?utf-8?B?NDZxR1l1N2FQU3A2bU1MY09hRFk2QlpPV1Blbjh4NUliL1VkNnV1dnVZVC9H?=
 =?utf-8?B?blUwNzkyM2tuMVJJUmI5c280YkFVYlgyaTJydHRsT0lUYWI3OVZTRW9xdnU4?=
 =?utf-8?B?K3QwZUFSUE0ycEZFcXg1endhU2w4NldLVHNQUmxOSkVzVytJOVR3cHcxV2py?=
 =?utf-8?B?VTNtYTVWVzQrMGtVK0dwZUFZeHhOS2ZYLzhpa3hERitmaVhjQldxMStxYUV0?=
 =?utf-8?B?UXpUZmtOTjM1OVQ5T3ByRHdEaHhaMTlTYUlMRkNHK1psQjlMVnZROUdTR0JW?=
 =?utf-8?B?VGRLcit6cDBLdStNbnZFbjlHc1dPczI3Q0pCWnQ2SEJzcER0WFA1aG00SjFQ?=
 =?utf-8?B?bGRRa2pZRmhnZHowTlNmbVlFUHVVc0c4L2dicEtHQ01UaDBzR0pvenVjcVox?=
 =?utf-8?B?b3dtanAxWU4zS1pLaElkNWpEUGVoWUI3Y1kxaExiT21CRjdDTHg1SlFoNkg2?=
 =?utf-8?B?VFB1T3RTbDdYTHdjd2VXRDZVOVlSMjczUkdzYnpHZmY2TmpuZjBZQW5IQ2R2?=
 =?utf-8?B?WmtUa3V6bWNXUXltWlhtcHJVNHpNbVR2UnRreC9DTkVzWXdEOGRtMWNObjIw?=
 =?utf-8?Q?Ph8Zhru65LvJ/u/BD/aPafAkEcIka1Ya?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnRQb3I1bkNvbmR1V0dWajFJQzE5VzRETCtoQTZvN0x2TjVEN1FyMTViZzNi?=
 =?utf-8?B?THVDNDJtTzJjTmNtS1RIalROWWhpM0xRdXBIOFE5a0xHLzNMa1VBZ1lSbzZs?=
 =?utf-8?B?eFA1bTVCUCtlRDJJWjB3dytSSGVZUmtsNGFzU0FybUlXV2xXQ3ZOWFdwVWtt?=
 =?utf-8?B?VzE3bW1JZ0g3d0lFMnhaQ3Z2TDB3MDdBOXBxQmk1OWJ0RFRCLzBxb3ZzNjBo?=
 =?utf-8?B?SFBYR3pzQTFYMUdTcnlNK0MrTUg2Qzk2djIwR1RoaVBINzFjM2RlSm8rd3VC?=
 =?utf-8?B?R2hnNEFhaW1GZldWNUxXUVY5ckg2SGZKVlRPNW9KWkF0dG1SMmRtditwSzA3?=
 =?utf-8?B?UldqcS8rZTBNVk1nMVJWL2JvVnNiTDBVQ05YcStEYUhtZHpIc08xYnovMll1?=
 =?utf-8?B?elgva1I5VnpvY0ZzeTc1R0hKSWt3M1h5UVdXNTByQW9XaGlGeVpGQkRyRU9l?=
 =?utf-8?B?V2k4KzFSQ0JYYmU1ZkhEbWIweTZLUXNOV3VYYTRFUGFHUlFtRnU4c21obU14?=
 =?utf-8?B?Z0VMd3p3THR0RlZhK1lCdkFtUXZNamJha3N6QWNVNVRpbXBLVXlyZE1PRUFE?=
 =?utf-8?B?dGZBUXNwYUl2cGtSbHJTeFlxVjNob2p0SHdYOFZFam1kWmhtay82REZITEVa?=
 =?utf-8?B?WE1xdmVqMHBmUWRRUHYwY1dVVVhBd3liRktzeENDbXh3YUZQQ1diQjdJeDN5?=
 =?utf-8?B?NmlGTE1DbVI2UjNLRmN0M2VMSEVCdDliOGtBVHlCd0h5ZlB0a0lBOW1JVUJn?=
 =?utf-8?B?SDhMalpUbkVYc1BieEZ3SW94SGV1aGd4K1NrUnJRcUNhVTZaWFVhQjNOcVhx?=
 =?utf-8?B?WWhzOGZwUDNUUnpLcXU1Q2NhRTRNYUxYZ0IzRHZjSGZiN29ubHYrMFFVc3hs?=
 =?utf-8?B?bENOVm8rYjRCNHRxYll4VmF1R2ppTHRhSktCQkdGK2pycDBUNk1yY25uVnZh?=
 =?utf-8?B?Q3RBcWthYTd4UEhCZzdLQlhCZDdSTWtsblhHajl6MXdoN0t4Tm10R2IvNFlq?=
 =?utf-8?B?Q09EMGdjcVhNc0FUV3l3TlhuQWh0eGpMaWZRaUJtYzdaVzN3bFJoYlVjWi9C?=
 =?utf-8?B?Zm15bFRGV25NSklDRURXa2Njb2JkMk9TK3RVN3M3NlVOMVQ0QmRBanJwc1pJ?=
 =?utf-8?B?QW9FekxoWHluamFvelc4WXJBWWowNjZMbERZNy9FanZFa3dsMEZKWWxzRkl3?=
 =?utf-8?B?M040eXpqa3NhbDlKcUM1TUUzaXBYUHd1cHNBS3ZaSHd6MDQ5NDlZUUwxL2pP?=
 =?utf-8?B?RFUzUUNnUmh0QWNTVkYxTnAvRm9LQ3plb1pjTFJsb2J4dklHdWdJNDN3VTFP?=
 =?utf-8?B?YzdWa3pEdFpBTFhVb1hKSktRYXJ2cTBUZkNaa3ZhZ0t0Tko1T0JuQUpPZXpl?=
 =?utf-8?B?dGVyc1dlTlc2L1NxODhMMnk3d2hjemNySlJTRmVMbjJUS2wxUVovSGdRcytL?=
 =?utf-8?B?WnM3cGZRT2NmSUVaQnBDdktlM3VsczdhM2Y1SncrWStxcWF1VXZVMmdTTzNB?=
 =?utf-8?B?ZnNmaVVjZDByS2RBRG9iREZ6UmphM09pOHgzbWFCZDF0aTBSakYvZUQ3ZGda?=
 =?utf-8?B?NnVCRmxHZEZRMDhWNXJNb2JXeHNUOHlTMWRUMUV1U1RxQnlMcHB5YUVpcG4x?=
 =?utf-8?B?RklQZDFqRmRwUmFtNDVtQ3dUR3pnNXprTDBSR3hKYURoQ2JWL1dJdWprRFZm?=
 =?utf-8?B?bDJtU1EzcTdpZ3FzajAvMXFzdTNOY1NVWTlKNkF0aW56SjJsUE9NL01VcjNQ?=
 =?utf-8?B?ekdza1BaaDk5NWw5bUhOVEVzZUZIQTVUbHRmRXpIdFlyai82clg5cmdYaElU?=
 =?utf-8?B?QU5aLy84SVhJOG1GM3lTcEY3UFhCZWJENEpJVEJYWkxSTC92WHl5SWlqTS9W?=
 =?utf-8?B?YkttWDZwUllacU1zK01ockx0cmtjUmZyRDU1Rmd5ZXFFOS9DbXhrdk41VlRw?=
 =?utf-8?B?eWRaZ2t6VllNVFVZT2JpWjZKNXZIZWxuZGNmUUJyZ3ZRZmIzQlp3LytZVDJh?=
 =?utf-8?B?QlhGSFNicEFDdmdnQXorNDgwSUtNUU5MNE9oL0JVYm9zbVczaTUxeGNFVEFU?=
 =?utf-8?B?RlYvZEw3V29LYjlpMFdHRFR6VFFiMnpUeHpvdVh0bU9nMWJ0bHB4WFE1NG1E?=
 =?utf-8?B?OXlGNStTTWRrOWdCT3VBUjdHQkRrZVNDSnpCMm5pdmdXdTRtcFdGVVZBQTRC?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79577bf7-9290-40f6-7c51-08de3d3a9b5a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 07:05:05.7951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSTlYnJTBdGUYLbq1P4uqGEh/XX6Vl5nfhyG72+gwRSW5O+3yhKCxtsnlcdye69XjPxUxw6DqfOH0ExLFZX7qJTixseAvZ7JoA+BP0mmsOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7567
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

Hi Tvrtko
On Tue Dec 16, 2025 at 8:02 PM CET, Tvrtko Ursulin wrote:
>
> On 15/12/2025 14:45, Sebastian Brzezinka wrote:
>> Previously, realloc was called directly on engines after incrementing
>> num_engines. If realloc failed, it would return NULL and overwrite the
>> original pointer, causing a memory leak and leaving engines inaccessible=
.
>> This patch uses a temporary pointer for realloc and only updates engines
>> after a successful allocation, ensuring the original pointer is preserve=
d
>> on failure and preventing data loss.
>
> I don't see a memory leak, or any other problem really. If realloc fails=
=20
> the flow is this:
>
> static struct engines *discover_engines(char *device)
> {
> ...
> 		engines =3D realloc(engines, sizeof(struct engines) +
> 				  engines->num_engines * sizeof(struct engine));
> 		if (!engines) {
> 			ret =3D errno;
> 			break;
> 		}
> ...
> 	if (ret) {
> 		errno =3D ret;
> 		goto err;
> 	}
> ...
> 	return NULL;
>
>
> <back to main>
>
> 	engines =3D discover_engines(pmu_device);
> 	if (!engines) {
> 		fprintf(stderr,
> 			"Failed to detect engines! (%s)\n(Kernel 4.16 or newer is required=20
> for i915 PMU support.)\n",
> 			strerror(errno));
> 		ret =3D EXIT_FAILURE;
> 		goto err_engines;
> 	}
>
> So tools exits with an error message. Maybe I am blind but, again, I=20
> don't see a problem?

When realloc fails, it returns NULL. If we assign that NULL value directly =
to the
original pointer, we lose the only reference to the previously allocated me=
mory.
Since that memory is no longer accessible and cannot be freed, it effective=
ly
becomes a memory leak for the remainder of the program=E2=80=99s execution.=
 The operating
system will reclaim the memory when the program exits, but during the progr=
am=E2=80=99s
lifetime, the leak still exists. After the failure, execution jumps to err_=
engines,
which skips the cleanup normally performed by free_engines(engines)

--=20
Best regards,
Sebastian

