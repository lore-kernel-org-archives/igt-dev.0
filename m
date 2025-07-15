Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04ADAC83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 13:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A8F10E5CE;
	Tue, 15 Jul 2025 13:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lc8udZND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CA610E5D6
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 13:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752587128; x=1784123128;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=sI5GorO6QaPzXLwEhbQY1iC0IRj5bMB3qkxM5sXGwks=;
 b=Lc8udZNDPf46ju3DERjfpImBPTWk3pqVhtQGm4mLDa7HDxOvza3OEdt/
 Kz2HLzNdOdXB3TGKzUbRBKwIOyI4yIHSWgKxYfdcP5EshSGb4uAUptdf1
 B4y6Ic6me5VUeD+pBD0iKqnpSXgsMxi4nfRNl2fW7Jd7UO46RGXnBgq3M
 s41J0ZO9xmMaqghqSo5he7PdjMzyrfo8PpKHsVHTVxDVpLQK3xLBdEXFx
 Q6tXvM756QJ7dutqSftnRKj3wxti6CoCqZQfQ405XXU5uEQaEh064J7gM
 HXdplF1g7d0CMBoBcUN76Ik/LBEcG9htk9EVdmjESu7NUYBx+ROnC56+v A==;
X-CSE-ConnectionGUID: kkblJfp5SUeFhrdL6hHHgQ==
X-CSE-MsgGUID: Wzu6pLR0Qre8T2mDh8+Rjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="66164749"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="66164749"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 06:45:26 -0700
X-CSE-ConnectionGUID: ZCsnhUcpT9KIW5v1ABMLBA==
X-CSE-MsgGUID: 4UrWgK9CQkegMPBH8gDG5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157774184"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 06:45:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 06:45:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 06:45:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 06:45:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVA/dvk3+98DSlwWmd6Q2uWPbv87JR9xHcdtsES5eE+yJuspQScZz8wVZp2SofbXun7Wx5/tASH06az1bunTMeRpE4zrY3cskSjtmeoUGn2I5GG/QKSFUR9U63znwXIonjFUvwWe/Pg5vxisIaEd+U8CfcPHsH5hPRjTwCUGHtrBNzGNz6nyAZU2/WBYSD/EGDAT4Tyo3wDyaeJ7MsmeK43vXUCqCKncvSu8nmG8bAfbD8L5gsBYTMOOyBj0waM8I6bqIIeKefZOY0joiN99+hEhEhZQaIBmW332ee7EGgJWmo35iB6V1vXrZqUfsZFKDuEZeUTzS7y+ReH0QHSE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkCOeNeKsVCI0NJnTCAjxQ29nbHD+Vevjk/pC2W3FkQ=;
 b=Dzf8PVv7hgST5S1BCPPkJkF++uZyXVcwc/aw3FCyt5k6/9H0r2uY2LkciQLC98JtZb/df7nJkdBNc1B5pAZWP+BowmV0UpkZwbEMjsuZgMtuE52ooHoXEsUS1M1Vx6OoNEq3RrduLihzSAjxutRF7AOvqhqMXiMvXjkD76uis14P7MTwzjVoDzP1lXHpY/xRrptF8Ysv0RLjzAoBt1xwLMvy7NjAsS0YpyKoOaMrioQjNdwMRH5MdQ3SyqTHpPw1Vn1fBqC3RvYdi6Ge5otIMRAa6DYj+8x7FJnX8kZLBWPKhBJnMM1B7/mTyn0MccQLKj8nx2bOKWC6sD4x0HNNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Tue, 15 Jul
 2025 13:45:07 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8835.026; Tue, 15 Jul 2025
 13:45:07 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250715133722.32559-3-peter.senna@linux.intel.com>
References: <20250715133722.32559-1-peter.senna@linux.intel.com>
 <20250715133722.32559-3-peter.senna@linux.intel.com>
Subject: Re: [PATCH v3 i-g-t 2/2] lib/igt_kmod: Add IGT_HOOK_POST_KMOD_UNBIND
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Tue, 15 Jul 2025 10:45:03 -0300
Message-ID: <175258710318.1809.4498007926297615296@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:303:b9::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: a2163075-700d-43bc-dcca-08ddc3a5cf31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVE2b2NkbUtxRXRRN2hWMFlzZmttMk1kZlMxTGVtVUN4RXNHMVB3Wm5xUXVl?=
 =?utf-8?B?NlVFR2FrN1pUZXVvQ1ZWVkx1amJkMjBTZDUvWi85YkFmVDAvb0hZRmFvUHVU?=
 =?utf-8?B?VEkyS2poSjlQblFRSGNoT0ovNTVYV3ZHMmM2Uk1wdmdHQVlDRExxcGt3SHY2?=
 =?utf-8?B?alJHSklNbmsyVDAvODlDanZVQTRWRmRCbWVnNzlTcUVLU0lMOXBrT2RHTFRl?=
 =?utf-8?B?OFlldTg1Qmd5OHNrb1k1YUlwNFBlZTYvUVZUbG1PNTBUUmNvWUhyNkpsMFdL?=
 =?utf-8?B?NHQ4dm03bnZrdkJzRVZ6WUhiWjBrWllIRGYxSkdBeEFHM1gvUHhBZjZTeVI0?=
 =?utf-8?B?eTlRcWppTVpabEJMSjRNaWluZ05rNGRCSWU5Q3pidzludHh0clczNlJUTDJh?=
 =?utf-8?B?eGhkNTdPTUJmekdnekQrYUN0UEFET0pFSmVYMnp3bkthOGpLdWNjRGJTbDRt?=
 =?utf-8?B?aXlRUDVoSGlZaVhwMWROVWVPQWxIWmRrekVsUFJTS0g3S3hBTzY0ODRMSHJz?=
 =?utf-8?B?UmVrbEFidzRBTkdPd3ZidUd3aVlmNzZaL0p3NGFFMGhaV0loVGFsMEtaWXBM?=
 =?utf-8?B?NFRzdE55VmNGNndwTmorenp5c09DN0w0RVpISHpkN3dCYzJ2Q3hCb2lKU3dB?=
 =?utf-8?B?THZjVm9XYnlwSUxEcWw0MWI4eTJkd0JCVVg4OXFLYVZPYmRXVVhGZkQ2blRZ?=
 =?utf-8?B?SUxtTTJkVVBYdm1EVUZyU2N0ZUJnaVdKaXVXdy94b2RjM042bWdMTFhDLzhE?=
 =?utf-8?B?M2tvaHg2TE5GWXpWTUl2bFpwOGsxT3FTR2Zyd2grZktsMXg2KzFjMFQvWXFI?=
 =?utf-8?B?dm5Sa2syUVhHMGxTMmtpbnViSDJHa2lwUWFmWXBCSUJ4RHJyNFpUeFJabVBR?=
 =?utf-8?B?bGZFNU1qeDZGL0xWSDBYcjE3Z1UyUXhSMEs3QlJCdHFGNWZCTHEwa2dsMGx5?=
 =?utf-8?B?ZHZiMmZiL1FLKzhQTCszWmdEQzQ0UlVZd2p6WE91UStHUDRuNy91S0ZRVmlC?=
 =?utf-8?B?NldGVXFveENkVVM2ekNlRlNvcTE5VjN0bHJtNHNrL2hodU5KUzIrSlBzZEFl?=
 =?utf-8?B?ZmV2a1ViYWg3UkIrQWhxVHhVTFNLSEZpOVprTENLdFBzdGs2UitaSUIraGxn?=
 =?utf-8?B?VlpIemJlUzdnTnd2YkdaWkNheUphaGF2eHZSOHczbWxtNEFKZGp1dFlSeXFN?=
 =?utf-8?B?aUZ4dTFNL2VaUUo4VnBNelg2NDUxY1pNTGMzWHR3M1lUdmNjTHpyTWpzRmY0?=
 =?utf-8?B?YldGNlNzVWZzZGpwWnJSMnAwTXFFb1J0UmRXdzVzRDJvdmw0WVNYZnZUbWg5?=
 =?utf-8?B?SVpoZ2RFUlozK0ZiS3BQSDgzcFRDbjllajNIbUJUU2o4QTBXZUlnUVEzb2ho?=
 =?utf-8?B?NDE1Y1p4UG9aQ3NacXhlam5DaFZhQ29DUHROWXdzQlJoR1lzMzNRMUc3OW5j?=
 =?utf-8?B?aFc0Si9mRmlZRkxjMXFMNHkxVTErT2JmelZVdDlldjVYdmo5eFdkMmFnMVR5?=
 =?utf-8?B?QlNWQ3VuZkl4d1VXYlVFWExvK2lSTGNUMXBqS2VHVURGbDltYklxeXFuWWtJ?=
 =?utf-8?B?K3VkUkx3Zjd6VEFxL0Z3QlNJTkI5TzlWL2Fqd1ZqV0hMeFVOS2haYnFqSWpN?=
 =?utf-8?B?Kzd4OE1Nd0NRNlM4OVgzbVJWeGFNUHZUTXdTSzcwd1FEUG5ENUMwdkpGNEts?=
 =?utf-8?B?VkhTbjZEbStHV3pvV05vRzNPNFBVME9SamtVNUFnUXVYWDZnUlAwa0liSzdF?=
 =?utf-8?B?cnpQSWRNWFI0ODVJdkxiSVBTeHMyejNDZEpadHZGYmt6VEtUS2F1ajBsdXRK?=
 =?utf-8?B?QzZlWkxjUmpNMGl4TGZ1d2JwcFdKbE5nbzI5MStHUWtKRklQSXllRkxPYndj?=
 =?utf-8?B?Ni82Slc0OFJVeUNjSGorbmp6V2ZkWTNRT09HTHVESVc5dWdwdUdjMnl0QXBF?=
 =?utf-8?Q?CiX8s7YQUgQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzRsaW1YS3NlWGRwRXNnYno0WDE5MXhJZ2FiMnNKdENVVTJ6eEtwWGpaVmV2?=
 =?utf-8?B?L1Z4YU9sUzVrTnJCcDF6UE91NE80bjMxL2I2dHRlVlBlRGxJMTRUNm5mUnZh?=
 =?utf-8?B?WTJNL1AycGxINFBHR0hxUUFQOENTN0EwbzFhWFRRbTBYQ1czS3I5cE9HMkZp?=
 =?utf-8?B?c1JSZlpPdWttRXZ1M0JYaFdoUncxdWtVQXZDMDlyWEhQOE82WXphaDVsNmhS?=
 =?utf-8?B?NFRraVBhOTZjaElxS25iM2pIU1ZWN3Q1VzRkRXplVk5MT1JjQkQyRnl1UCtw?=
 =?utf-8?B?Kzc4bXVoKzlVbmZIL1I5QmJtV1BoS0M0VC9nNExzc0J1eFBPN2U5b2o2ZUcw?=
 =?utf-8?B?WHFsSE5jVkhrOGtTUmo1ZUtFQjYvTFpKd0R5NisrZVV3dklCN0dRNU5FbEtZ?=
 =?utf-8?B?SHdsRHpjYUJnL1JsRUdmNXpReXhwcE8yRzRLQm56SnFFVWMwK2k3RUZIK0Zk?=
 =?utf-8?B?KzZxWCtXN3hSUmxYWHhheCtXZSsxZVJOYnpFbzVubU5FdUM2djJDT1g1QXZz?=
 =?utf-8?B?K0pmNFhsVFJDcWhHT2tDazBsK294RU1RZ3o4N0ZZS2ZsVGo2T0llR3l0dzBo?=
 =?utf-8?B?ekJGM2htemYyK0tjTEtNY29naEJXcWMweXhqVWJIcmlMT0IzZGJZS1JGMHdF?=
 =?utf-8?B?ZXIvbzBDcFB4T0xUVTQ0TFdaSHg1aFc5VW5pZWZUZUpkK2F3cVV2alJUbFUz?=
 =?utf-8?B?VlFtaG1jMkJPdE05M3Y3c0hnLzE3WE9MZHdST3FCNVV1ZnNlUm0wcklvZGFj?=
 =?utf-8?B?UFM0S3o0ZGVZN0VPUlNuZTl2dkUrSXdTV0hOVzF4NkdETWI0QnRpOXMwaTF5?=
 =?utf-8?B?SmIyR3FiVS8xYVNCYURJTllSdEF2RHJUdS81aDdBOERydXdrWXNUZ2srYWVE?=
 =?utf-8?B?bGJLZVdDSWlzRzNwb2dtM1RwUHR5WkpzS0lSY0ZlMU5DcU1GNlpTaVpaTTBi?=
 =?utf-8?B?bDYwaTE3ZG5hZ0l3VGNYNFZMcWJONkVieWtGMEFraDdmOHJpRkpmRzdHRDZ2?=
 =?utf-8?B?OFNpNHJqY3dtTkc0MUxqWlp4UVdldW1SVXlrclc2NTM2a3J3MTd1eVNpYjJN?=
 =?utf-8?B?ZU1Wb2pHOUt6d000Z2M0OVlobDZpL1AyNVpaQWJxaHVVV1Q4VnNlWDY0ejQ2?=
 =?utf-8?B?bVFpVm85WkZ5RkpsWGkrSm1Ud3V0dFRiVG9TUmNkNnJVZTV4bFYxaE9lc24y?=
 =?utf-8?B?d2pCc3pyOFcvbm84MkcrSk0vTnlyb0paYldUK3JBTmNPeDU4T2VVWVJMN1Qw?=
 =?utf-8?B?MjBBd3VCR1RINlI3ckZSQnd0bTN5c2hHYU5qRGRNYWl1WE1vTkc0VDdUQkpS?=
 =?utf-8?B?MU9XWGZVVHdab0RweEhYcDcyNUFnOTJVcWJOTitVMTVCSnZINzgyNk5ETGd4?=
 =?utf-8?B?amo5S2UwRmdVZEZiSGFsb045RGhVajBZZ05ZTUxxWDFPTWwzUmRmb240MEtp?=
 =?utf-8?B?S0lPQTBzK09wRERicXRpRS9OenRja3E5dXhXUUhXa1UzaVNaTkFBaFRkU0ZF?=
 =?utf-8?B?WFRBdXgrREFMTFIreVhhb3ZkMWxLYlIvOStOTUltRlNPcFZjVm1NLzhzem1w?=
 =?utf-8?B?VUJOVjBSQlBvN3hQRk5vSDhnRERNVEM0NHk0U1N1c2hreVJjQ1dCaU5aendp?=
 =?utf-8?B?NmFQV2NnSjhBbG1UN1VqcmhUQTRwa01UbGpMcTVvVlBLYXp3ajhqdzVHWXhJ?=
 =?utf-8?B?Z1dNek5kdkZXQUt3bTNrbU9XVWE5ZFlKTkhoYm00eEdiaGJIa0Rzd1o0L3NC?=
 =?utf-8?B?Q3NJVEQzcS9zcWovUkJlWXlCWE1STWZxcGpvN2x5Q2VobXFjV3FmSnJSd29r?=
 =?utf-8?B?bEFiN0JLdllCRWZRYTk3N3JLUUFLbTBYSmw1dlRQVUNva3lWUGNUcEYzVmdU?=
 =?utf-8?B?V04rTzc5SU1uNlg2RGN2c3k1UlZRNFFESENSUjFPQzdRSHRPMXBkaHh3STFa?=
 =?utf-8?B?WndaaGZsd0JPRVlWSmZQVHRQNXZTOXJnRHcxWnNzVU5iS0lIbkpCbWVJZEVv?=
 =?utf-8?B?bCtyaWpBa0c5TWkzM0crRkxvMVhlOE5yT3kxM0xPdzNWL3pNSlpSTzQ5WUJB?=
 =?utf-8?B?VXpRQm5oS0N5bHhUTkVqUmMxZllhRURjL1VLNUlEK1hUbmV0U3pLTzdNVkNl?=
 =?utf-8?B?QWFpYzNhUEJEdlV6VVNleGcweFF6Y0FRdFdweEE3aUEzbDVXdTY2eFJMa3BR?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2163075-700d-43bc-dcca-08ddc3a5cf31
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 13:45:07.2939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tLn5eBLN8wPc74gCyz3JVHcXGLpTKBONVcdyHVgsvxHblFR2S1/k8eCIKH4bc+87CzTH8urbVz6dTyS9AcExQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7753
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

Quoting Peter Senna Tschudin (2025-07-15 10:37:22-03:00)
>Adds an igt_hook after the unbind operation of the kmod intended as
>a strategice entry point for kmemleak scans.
>
>Can be used with --hook  'post-kmod-unbind:...'
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
>v3:
>  - Renamed the hook to IGT_HOOK_POST_KMOD_UNBIND as the unbind can also h=
appen
>   for snd modules
> - Changed the logic for the IGT_HOOK_KMOD_UNBIND_MODULE_NAME env var so t=
hat
>   it is only populated when the correct hook is used.
>v2:
> - Added code ducumentation for new hook
> - Added env var IGT_HOOK_KMOD_UNBIND_MODULE_NAME and extended help text
>
> lib/igt_hook.c | 11 +++++++++++
> lib/igt_hook.h |  3 +++
> lib/igt_kmod.c |  8 ++++++++
> 3 files changed, 22 insertions(+)
>
>diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>index 8932d118d..f86ed56f7 100644
>--- a/lib/igt_hook.c
>+++ b/lib/igt_hook.c
>@@ -74,6 +74,8 @@ static const char *igt_hook_evt_type_to_name(enum igt_ho=
ok_evt_type evt_type)
>                 return "post-subtest";
>         case IGT_HOOK_POST_TEST:
>                 return "post-test";
>+        case IGT_HOOK_POST_KMOD_UNBIND:
>+                return "post-kmod-unbind";
>         case IGT_HOOK_NUM_EVENTS:
>                 break;
>         /* No "default:" case, to force a warning from -Wswitch in case w=
e miss
>@@ -335,6 +337,8 @@ static void igt_hook_update_env_vars(struct igt_hook *=
igt_hook, struct igt_hook_
>         setenv("IGT_HOOK_TEST", igt_hook->test_name, 1);
>         setenv("IGT_HOOK_SUBTEST", igt_hook->subtest_name, 1);
>         setenv("IGT_HOOK_DYN_SUBTEST", igt_hook->dyn_subtest_name, 1);
>+        setenv("IGT_HOOK_KMOD_UNBIND_MODULE_NAME",
>+               evt->evt_type =3D=3D IGT_HOOK_POST_KMOD_UNBIND ? evt->targ=
et_name : "", 1);
>         setenv("IGT_HOOK_RESULT", evt->result ?: "", 1);
> }
>=20
>@@ -470,6 +474,9 @@ below:\n\
>                 case IGT_HOOK_POST_TEST:
>                         desc =3D "Occurs after a test case has finished."=
;
>                         break;
>+                case IGT_HOOK_POST_KMOD_UNBIND:
>+                        desc =3D "Occurs after the kernel module is unbou=
nd from the device.";
>+                        break;
>                 default:
>                         desc =3D "MISSING DESCRIPTION";
>                 }
>@@ -504,6 +511,10 @@ available to the command:\n\
>   values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-*\=
"\n\
>   events and will be the empty string for other types of events.\n\
> \n\
>+  IGT_HOOK_KMOD_UNBIND_MODULE_NAME\n\
>+  Name of the kernel module that was unbound from the device. This is onl=
y\n\
>+  applicable on the `IGT_HOOK_POST_KMOD_UNBIND` event and will be the emp=
ty\n\
>+  string for other types of events.\n\
> \n\
> Note that %s can be passed multiple times. Each descriptor is evaluated i=
n turn\n\
> when matching events and running hook commands.\n\
>diff --git a/lib/igt_hook.h b/lib/igt_hook.h
>index e9f97b79b..11d839dfd 100644
>--- a/lib/igt_hook.h
>+++ b/lib/igt_hook.h
>@@ -26,6 +26,8 @@ struct igt_hook;
>  * @IGT_HOOK_POST_SUBTEST: Occurs after the execution of a subtest..
>  * @IGT_HOOK_POST_TEST: Occurs after a test case (executable) is finished=
 with
>  * the test code.
>+ * @IGT_HOOK_POST_KMOD_UNBIND: Occurs after the kernel module is unbound
>+ * from the device.
>  * @IGT_HOOK_NUM_EVENTS: This is not really an event and represents the n=
umber
>  * of possible events tracked by igt_hook.
>  *
>@@ -39,6 +41,7 @@ enum igt_hook_evt_type {
>         IGT_HOOK_POST_DYN_SUBTEST,
>         IGT_HOOK_POST_SUBTEST,
>         IGT_HOOK_POST_TEST,
>+        IGT_HOOK_POST_KMOD_UNBIND,
>         IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
> };
>=20
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index 6d7f5705c..a10626eed 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -41,6 +41,7 @@
> #include "igt_aux.h"
> #include "igt_core.h"
> #include "igt_debugfs.h"
>+#include "igt_hook.h"
> #include "igt_kmod.h"
> #include "igt_ktap.h"
> #include "igt_sysfs.h"
>@@ -604,6 +605,7 @@ int __igt_intel_driver_unload(char **who, const char *=
driver)
>  */
> int igt_kmod_unbind(const char *mod_name, const char *pci_device)
> {
>+        struct igt_hook *igt_hook =3D NULL;
>         char path[PATH_MAX];
>         struct dirent *de;
>         int dirlen;
>@@ -634,6 +636,12 @@ int igt_kmod_unbind(const char *mod_name, const char =
*pci_device)
>=20
>         closedir(dir);
>=20
>+        igt_hook =3D igt_core_get_igt_hook();
>+        igt_hook_event_notify(igt_hook, &(struct igt_hook_evt){
>+                .evt_type =3D IGT_HOOK_POST_KMOD_UNBIND,
>+                .target_name =3D mod_name,
>+        });
>+
>         return 0;
> }
>=20
>--=20
>2.43.0
>
