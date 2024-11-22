Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB5AD75E21
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 10:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2924810EB4E;
	Fri, 22 Nov 2024 10:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+omXWW4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD7410EB4E
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 10:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732272814; x=1763808814;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vWy3TWKto69h/2z8nBOY7BmkSmnJ6N/emSUv/wy74ns=;
 b=M+omXWW4dO1EhyFpNrIYhpQV+wrxu6nMGQNeeV5JLs0knNlsuiVyJqVB
 Lrf244x4K06G2uEEy4I12ukOPHMP0V1x4AZirgQzNYEMavFihEui2AhTy
 iDyCRLkHA8kVB0R3XV3tUxnE6YkbRHQGQc7LLLQw51o6UEZGqPg+O+hRb
 nbVsrPdwYDU/6BXbpiFkn6DsCPNGgZ6FA/D0741Nh1PYkl/xtagRI3/B5
 0DOzcwcTk6Mxmgil8mS9F82bD4Rr1PZuDN5YT0WBQK6o5iEFCnVfxMJVm
 6v5pAgUDu6uVP8zLli2dXelv63EHceeVogbelM8kcpwIjXBfYYm3SAkY0 g==;
X-CSE-ConnectionGUID: jOQt3VUgQ6mkcRtzxjcbAw==
X-CSE-MsgGUID: 4jTYkHVVQRWvIDKMhaiVrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43072199"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="43072199"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 02:53:34 -0800
X-CSE-ConnectionGUID: IiV/vtfaTvWErs8Ax70Lfg==
X-CSE-MsgGUID: A1Nw+a62TqWf1ZwyVGTRkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90687987"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 02:53:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 02:53:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 02:53:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 02:53:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oThP2XwRxvKEBahCYjzvejh8BDmrTXdWPm6V5KSWu/+gwyZ5LWcKwy6cbDZB+d6oiIu40uTxteHTH+OHAKIP6kPsqK1q9A6BkmUGRagc6tNa9E5GT/YtnJXhBa1/56sKXAl8mT2wVy6Yd6hxBY1jzgrhd+hq3s49kyzUx82y7FXZKVE9Y8XBKh8ILDhSnJlXY/S1DeT1mGiBH3FyjDdr4UIEja0aMzU4UmqW8jmrxNNEPLmVp4ZPWUz9/MpX6H9y0VK3fU+IOIhpnlo0Hn0XDSYHoMyxQxFsEq9MKi4QdFsmifzVCldCOUsMuxPquVaZowdj9Y7TTmrVxya5r+1e7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEQzIgEnSwfRBGxDzklV79U1rv3tXp5w20PwwktZxQ0=;
 b=FWzfMNIB0tPoQox4dHmohwpDMjNxuqplYkZLP1d13vko67KoXJT/3pQ5XyYMt+ripB0BmSeZ2NxdJUoQ+4a0NPMblLIb0+K8jrTo11b5+mJ2BbUOQWdWY6EJlflNu0aHFTJaYxjTuhnW0xQ7LwQ02GLySEk6pXZn0k/ZvhpSC4BcPzF7EoGx88GrNtDSyGDolwdMcPDLbIm0dyDnbweEpqCS689f2EKbkHEoVlHNFCpxuXw+Zt5oMidLtlD+PJMPk5Ti7tYCG6aQoAsu/WRrZqsy/N+t/W1xVngieNzUA/u2SIc5vHpHWPJivNKh5vsYCRwss5CmtY3wJaKvlkjppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 10:53:31 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%7]) with mapi id 15.20.8182.014; Fri, 22 Nov 2024
 10:53:31 +0000
Date: Fri, 22 Nov 2024 11:53:20 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <igt-dev@lists.freedesktop.org>, <chris.p.wilson@intel.com>
CC: <krzysztof.karas@intel.com>, <andi.shyti@intel.com>
Subject: [PATCH i-g-t] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <7occzjselhix5vtg2qumxo52zxm6t2g23jnlg6wtwowp2osisn@ucaa2k2v7tpg>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: DUZPR01CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::15) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|MN2PR11MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ed5912-71bf-486f-10ef-08dd0ae3e74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXduSnhaVk94RnBRNThpb2hKaHlHUy9SQ3ZDNmFDRVRYQzRIa3cxMjJEQ2RL?=
 =?utf-8?B?VW5SbkU1b3hSNkh4SithVmpvbm1uRHcwSkVpZ0RnOHAwVTlRVWhESTNlQWtQ?=
 =?utf-8?B?VC9JR3RwT3NpWHNWbkFtMmUwaG5LVjh3cllqbkVBVVVEdmNNa0lqNlYwTzUv?=
 =?utf-8?B?SGs2REJNbnQyM1N0Z3J4RG5IMmVrTkZQcVJaMzNWaUhtaXpjSWluVFpyTDN5?=
 =?utf-8?B?RjdTM3M5bTU5WTRGUlpBQW5mczJXLzNxS3dnTHhHNFBLRFA2Yi8wamZCWDVt?=
 =?utf-8?B?VVNiK0tzb21YTGh0NzBHU3lxdU1FeStsa291QVNKYVRJaEtxb3dGVEJPa0pI?=
 =?utf-8?B?cHJVMk5qdEZOdkJIZTBsbGhtaitsejFxQlJYRzlaYjBwRXRXM1V0ZHQ2Nm1Y?=
 =?utf-8?B?M3B5N01HRzZsRUltVlpUck4rSE1Sd2xwNFpvb3pXUkExMUsrNnlWbEtIVzZD?=
 =?utf-8?B?ZHdQY2dycWsxUkZmdE9yVGRITXZYRXRDanJhVVFEYUg4NVBTTFYwS0hRK3pK?=
 =?utf-8?B?QWlnVExYTGtvc3hCZzNEK1BwcVpYVFNpS2J3MXVta0NlYmdFeFJMVXlkcGpI?=
 =?utf-8?B?Ykdkbno3a3hoTHJGVVlTeWhUN3VYWThUaFR5NjhveVEveFlpbHFFbG1ZRktk?=
 =?utf-8?B?bGd4QTJ6UnBGUmRiV0xsaWdkUytqVnlEZUE3VGxPV2Jvak9iNnhRVDl0VFRy?=
 =?utf-8?B?R2tJQlVUMU0rT1F5S0ZsSXJwTFZTMHl6TzZxNUpadUtKa1dyZHBvdzN6Mmxt?=
 =?utf-8?B?SitYcFNVRThpczE4S0tBd05NclVMUzZKRlZNVU1MYmRwMjEzaWduZEIybVdY?=
 =?utf-8?B?VWVXblVWa1JTeHZGV0FkbEJKR0UvNzdUMWI2Ni81V3BoOHhsT3U3cDE3RS81?=
 =?utf-8?B?b0pVTmVkWW5QV3YreTlKd2FNL2JNTWoyRTljazhPSWhvVGVBb082dHYzRXZI?=
 =?utf-8?B?QUY1Ty9PdUdBWkVDd2pSYm1tbk5iWFJxaDdkTi9YZWV2TnFnMVNjT3hFeDJu?=
 =?utf-8?B?eVczdTFacjl3dVJXUjBORU9mdHE5bzFWWnM4YmJZTDJDVmRJUzg5S0RQMm94?=
 =?utf-8?B?N3pvU0REbnMxNG1EY01OR0FSQUhjanVBY1pSMzJnemJiV2ZGSGJMUHVtN1dC?=
 =?utf-8?B?djhNSXB4UzloSVByTG9xeHNkbUJHUzF0RFh2TW1sTnowWHdaSm9wNGZQT0hS?=
 =?utf-8?B?OHFiUGMzYXJLRkI5alduZHFOWDFab0tLLzVBTmZoaHJQMlNDK2Y5ejlzQnBD?=
 =?utf-8?B?NGtyWmwxUGlFZTdvWHBlbmxUNi9Gc2dGNkdteVUwelBOM1B6MkUxd3Nmc2g1?=
 =?utf-8?B?b2MvQTJNOE1PMXF5RXg5Y3NNWGFYYlR4eUV1YmpjTHdyQzRFL1c2VEJJNExJ?=
 =?utf-8?B?WWNQVStDUXAxK2VubllGbTFqeDFXV2tXQ21UMHZEZlZ6eVR1Qm9LYUhuZjJC?=
 =?utf-8?B?a2d1SG1vWnp3SmlMY1BCQ2NOcmdiV3E0NGlvaG1tZWhpWnFNNzBkb2N3ZjNC?=
 =?utf-8?B?RFI5aFZGS2JxS1o1dURGMzFHWXR6M2tjZCthcFkzS0swOHJhVGlJQVA5b3Rm?=
 =?utf-8?B?QnJWVVpDWTJWMWtTSXVrb0l5Tkl4ZHRLdGxCYVBab2R4WE9LQzBidlArS0JE?=
 =?utf-8?B?MWNrbktQemJSU2l6bmlPVGZPS0JPV2ZUT3hLQXFHZFFZVUVIaEt6VHMyRml3?=
 =?utf-8?B?S0t0K2UwWHBtK1NpVHRZVWIrWVhETmNHNlRjK3B6MDY1VDdtZXlUZjFQNmIv?=
 =?utf-8?Q?v8vDTA2QZUK+xb6hAGudAa7HCI1GF88IeYG0gm8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZENnOFkrYmRiUGZHVm9CUEExbEhLOW81VlhJN1hKT29lWEVUcFpPQWExclNt?=
 =?utf-8?B?ZW1Oc0xNMGh1TG56NWltb2VSSWEraTZmSEM0YW5QM0ZMYWJYdWNudlpVMjRE?=
 =?utf-8?B?RTBIdU5pQS8wSEp1YzliS3BmRHNhbFJuWGpnSk10ckkxV2NMNzk3RkpwTVZ5?=
 =?utf-8?B?ZCtLZXQzelpoYnRBTUdvVXVQOTFFRi81bE5wRzJ6WWlFZ0F5OFdiV2thYXc1?=
 =?utf-8?B?dzB6d2NsdnU0MTBQOTB0ODV1dGNZK0F6SlpDTSs1bk1raGJ3TG04aG5YMmNw?=
 =?utf-8?B?S0s5NXA1ZS8rU0VuTTFjZjlkTkk2Q2p3Snl1dW1xN0hKc25Va082dTBHam5H?=
 =?utf-8?B?ZTNmNkxFYk82NDlDck0ydi9rMExPTnBpc3VkODZ2d2g1WDI0cGp5R252L3pX?=
 =?utf-8?B?Qk9GMVlYNDdKN2tPSEZXWHdOd1hCVTEzdTdpUURCWnZKVkdJb1U0bDdrdVRQ?=
 =?utf-8?B?SkVEcTE4SzVSdFBpNG9LaktaZS9BTW9TUnpyVFE1Uml3bU8xcGwvU1p4QXhI?=
 =?utf-8?B?elpyZjRJRUFjdlk3RnFuU2hUSXAzbkxwN2FzRURzN01lL3VuZjAzVHl4NUVS?=
 =?utf-8?B?RjkzK0o5b09SbGdGci9wcjlGdVJidVVObmZmcXVCNUtWUlU5MUl0eUZnTTVL?=
 =?utf-8?B?YkhXRXFDRXZPV1k0ZitLSWtvZnpXMW50b1hzelpEWURvLzJFUGI3Qy95WVJo?=
 =?utf-8?B?Qy95em9vSnh5MTRlZjI3Vi9pM3Y0ZGV0VGYwbEVZcUxOcmVib05YbGZDc2xO?=
 =?utf-8?B?RWJ3KzQ1T1BxN2V5UWdrMmhIU3owOW5xUjFyUkVHVENWd0phZEo0ZWVObU9p?=
 =?utf-8?B?OFUrWHE2VEJNaUVUN2IrbUJPTFc2UVZLZlN1WWt5dWNnTUhlRU9DVkF6cklB?=
 =?utf-8?B?eEpHQ2YrMERzUmc4SXZYR3ljMnEvMUZrV1ZXR3h6QTd3N1VpS0Z6b0tZOFJI?=
 =?utf-8?B?TDFrUkxWcEZnSUltbmRFVkNCelhuZC9LT1kwMUZ5Z1ltNkFyRXpkdEw0Vi9t?=
 =?utf-8?B?MlhoeWp4YSs3SHQ0dkIvb2RQK3JPb1VlZE1WSDB2RVdJVklNNkx1MjI5ZWw0?=
 =?utf-8?B?NkN2bnhsSFdYS2xDWmVJRHdjZmp4b1VwdnVXbWY2ZEhoWXRwY0N5eEdSVDZQ?=
 =?utf-8?B?a0N5cjMwd3NSdXhYc3c1d0ZZdk5yWnNucnZKZkwzeXdtRWtaQ2RpemNmQW80?=
 =?utf-8?B?cEVidk5xeUxOYitkVHo4bitNVlVzejJSSmpDZGpTUDlaU2VjdHBWQ3VNRHJG?=
 =?utf-8?B?bkNyRldNdWJuekRGcmxRZDFacU5hQ1prQVBZSzFYUnVvUnZoNi8zWlQ4WVd4?=
 =?utf-8?B?U1FhcHFhbGZ5ZXRZSEdMbWprRDNneHdLRS90RTRGRElYYk9EdXd4Mmd1Q2VS?=
 =?utf-8?B?VTJrejJtcXo3cTZ5RzBBRi9BL2ZMbFpHM1NhWEhNajZaK04yRk9VOEQ3RkRr?=
 =?utf-8?B?Z1E1Z3p0NFFLNXhnVTN4bEFnOUFiL0NwMjFpYTBVb1N4eSszOEk4NHhnOW5Z?=
 =?utf-8?B?b0d0WiticW8weFNGalVWb1ZpamJVdmsxLzcwc3Roa09WMnBTYzl1OE9pR2xk?=
 =?utf-8?B?OW50WDRPekllL2t4bzRZckh4V1d6b0J0TXpqbC9uMVNQZWJIZWhpSndnM0FT?=
 =?utf-8?B?TElPS29nNlhzWXBENktlRmI1bTNpZkdxU1pINUV3RXlVemNOQThpZkltNmRi?=
 =?utf-8?B?QVB1Q1VxN0JLYkVvbDNHSXhjdi9QY3p2WkFPQzREVkprTTVoWXNObnJ1aWYr?=
 =?utf-8?B?NnlVd09zYnh6bk5NUE5ES2licHFSbUJhUmdJL2YyTUZLSUt6ditqbUV6b3FD?=
 =?utf-8?B?QVNvTFJNRU5MMHFyMkIzUDVCU1dIQzJzbVEySmRpTW1IZ0toaXBDKzVJdVZt?=
 =?utf-8?B?d3VFRHNpRXkvaHUvZUV1TWhkLzM4VUFhenNNZjJPUnd6V280d2hTaEFBTDNX?=
 =?utf-8?B?VWVRbGF3ZnByWE9XVUpGOHJRT2tBSGYrWWcyczJHUjJHUW41VjR3aVhjbmg4?=
 =?utf-8?B?citsblc2SXdFMUswVDRlanluTGdNN3BpazF6cEI5R09uWlhaTUpDK2wyMy8w?=
 =?utf-8?B?bmNoZUp4dm1tSDlDYU5RbDE1dStYeXFTbzRQWUQ5R2JKd2ErZkh1Z2dMSHlZ?=
 =?utf-8?B?L0ZQdDdnck5EajNINE1EdE04aml5SlIyeEhsS29wamxlc2dWWXBIMHRhT2xJ?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ed5912-71bf-486f-10ef-08dd0ae3e74c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 10:53:31.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2o9RcJpNpbojzhfWz5zdjRGQYVIE/xdZryr9PVsgs2VfgHjvAmwYKpXARP8btNw24IbUEVMDmJHRs8+Lkg3OeC/9FCF1QD8WGdmvnRMDl/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
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

QXBwbHkgd29ya2Fyb3VuZCB3aGVuIHJ1bm5pbmcgYmFja2dyb3VuZCBzcGlucyBpbiBoYW5nbWFu
IHRlc3QuCkRpc2FibGUgYmNzMCBiYWNrZ3JvdW5kIGVuZ2luZSB3aGVuIHRlc3RpbmcgY2NzMCBh
bmQgdmljZS12ZXJzYS4KClNpZ25lZC1vZmYtYnk6IE1pa29sYWogV2FzaWFrIDxtaWtvbGFqLndh
c2lha0BpbnRlbC5jb20+Ci0tLQogdGVzdHMvaW50ZWwvaTkxNV9oYW5nbWFuLmMgfCAxMiArKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
dGVzdHMvaW50ZWwvaTkxNV9oYW5nbWFuLmMgYi90ZXN0cy9pbnRlbC9pOTE1X2hhbmdtYW4uYwpp
bmRleCBhNTU2ZWVjNTMuLmU2Yjk5YzU4OCAxMDA2NDQKLS0tIGEvdGVzdHMvaW50ZWwvaTkxNV9o
YW5nbWFuLmMKKysrIGIvdGVzdHMvaW50ZWwvaTkxNV9oYW5nbWFuLmMKQEAgLTM2NSw2ICszNjUs
MTIgQEAgc3RhdGljIHZvaWQgY2hrX2VycihpbnQgKmRzdCwgaW50IGVyciwgaW50IGV4cGVjdGVk
KQogI2RlZmluZSBFUlJfRkVOQ0VfRU5EICAzCiAjZGVmaW5lIEVSUl9GRU5DRV9TVEFUIDQKIAor
c3RhdGljIGJvb2wKK2lzX2Jjc19jY3MoY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdp
bmUyICplKSB7CisJcmV0dXJuIEk5MTVfRU5HSU5FX0NMQVNTX0NPTVBVVEUgPT0gZS0+Y2xhc3Mg
fHwKKwkJSTkxNV9FTkdJTkVfQ0xBU1NfQ09QWSA9PSBlLT5jbGFzczsKK30KKwogc3RhdGljIHZv
aWQKIHRlc3RfZW5naW5lX2hhbmcoY29uc3QgaW50ZWxfY3R4X3QgKmN0eCwKIAkJIGNvbnN0IHN0
cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZSwgdW5zaWduZWQgaW50IGZsYWdzKQpAQCAt
Mzg4LDYgKzM5NCwxMiBAQCB0ZXN0X2VuZ2luZV9oYW5nKGNvbnN0IGludGVsX2N0eF90ICpjdHgs
CiAJICovCiAJbnVtX2N0eCA9IDA7CiAJZm9yX2VhY2hfY3R4X2VuZ2luZShkZXZpY2UsIGN0eCwg
b3RoZXIpIHsKKwkJLyogV2FfMTQwMTQ0OTQ1NDc6REcyICovCisJCWlmIChJU19ERzIoaW50ZWxf
Z2V0X2RybV9kZXZpZChkZXZpY2UpKSAmJgorCQkgICAgaXNfYmNzX2NjcyhlKSAmJgorCQkgICAg
aXNfYmNzX2NjcyhvdGhlcikpCisJCQljb250aW51ZTsKKwogCQlsb2NhbF9jdHhbbnVtX2N0eF0g
PSBpbnRlbF9jdHhfY3JlYXRlKGRldmljZSwgJmN0eC0+Y2ZnKTsKIAkJY29udGV4dF91bmJhbihk
ZXZpY2UsIGxvY2FsX2N0eFtudW1fY3R4XS0+aWQpOwogCQlhaG5kTiA9IGdldF9yZWxvY19haG5k
KGRldmljZSwgbG9jYWxfY3R4W251bV9jdHhdLT5pZCk7Ci0tIAoyLjQ3LjAKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpJbnRlbCBUZWNobm9sb2d5IFBvbGFuZCBzcC4geiBvLm8uCnVsLiBTbG93YWNraWVnbyAxNzMg
fCA4MC0yOTggR2RhbnNrIHwgU2FkIFJlam9ub3d5IEdkYW5zayBQb2xub2MgfCBWSUkgV3lkemlh
bCBHb3Nwb2RhcmN6eSBLcmFqb3dlZ28gUmVqZXN0cnUgU2Fkb3dlZ28gLSBLUlMgMTAxODgyIHwg
TklQIDk1Ny0wNy01Mi0zMTYgfCBLYXBpdGFsIHpha2xhZG93eSAyMDAuMDAwIFBMTi4KU3BvbGth
IG9zd2lhZGN6YSwgemUgcG9zaWFkYSBzdGF0dXMgZHV6ZWdvIHByemVkc2llYmlvcmN5IHcgcm96
dW1pZW5pdSB1c3Rhd3kgeiBkbmlhIDggbWFyY2EgMjAxMyByLiBvIHByemVjaXdkemlhbGFuaXUg
bmFkbWllcm55bSBvcG96bmllbmlvbSB3IHRyYW5zYWtjamFjaCBoYW5kbG93eWNoLgoKVGEgd2lh
ZG9tb3NjIHdyYXogeiB6YWxhY3puaWthbWkgamVzdCBwcnplem5hY3pvbmEgZGxhIG9rcmVzbG9u
ZWdvIGFkcmVzYXRhIGkgbW96ZSB6YXdpZXJhYyBpbmZvcm1hY2plIHBvdWZuZS4gVyByYXppZSBw
cnp5cGFka293ZWdvIG90cnp5bWFuaWEgdGVqIHdpYWRvbW9zY2ksIHByb3NpbXkgbyBwb3dpYWRv
bWllbmllIG5hZGF3Y3kgb3JheiB0cndhbGUgamVqIHVzdW5pZWNpZTsgamFraWVrb2x3aWVrIHBy
emVnbGFkYW5pZSBsdWIgcm96cG93c3plY2huaWFuaWUgamVzdCB6YWJyb25pb25lLgpUaGlzIGUt
bWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlh
bCBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykuIElmIHlvdSBh
cmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIg
YW5kIGRlbGV0ZSBhbGwgY29waWVzOyBhbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbiBieSBvdGhl
cnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4K

