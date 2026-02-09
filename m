Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4A8E7E0BE
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAA588F78;
	Mon,  9 Feb 2026 10:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljHAYiX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158F110E3B7
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770631923; x=1802167923;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PByqGX6yjJix7YvWKVXwPtZne+BaVNhypWD4w+R7Bsc=;
 b=ljHAYiX2tN++cFWbT875GLOgBncDMvm3djxhmTxeh99infxcA5O6F5yo
 ANb5uKlm4+BTBfnnuBHGyXR4T2P+4h7hpFx4+dy8/bz5+uu3TKsYniKN2
 4oTTbslJ4X3/rNUcJQyO6ivw8A3w//4Uh2QYDDv/EhGFPM8A/6Dj2ZnJf
 nE1lP0PgIuBw0A4kl7fh36dHmxxQs+dn/OVAQvLGmxIMcnPR3Qd0UACVD
 ozAHqX4cy9I3xpT6BlSZ38B5WggYyAUEsd34ACQSZbX4u1gtxJmqph2QG
 lwW9HrjoSVAmhAq9Bx1dl9oh9jxPCKf1HoBXOeUbRYlnqkATdCp47oXko A==;
X-CSE-ConnectionGUID: HQV+bBEFQpqaMaUecJuYvQ==
X-CSE-MsgGUID: oldWwT2ORii7Yvz0n4JYqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71804920"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71804920"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:12:02 -0800
X-CSE-ConnectionGUID: lgQvx9fxRwe7/1m2XpenPw==
X-CSE-MsgGUID: h4KVm8ZoRSy6uL+ITWm0Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216047437"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:12:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:12:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 02:12:02 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:12:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcqqLcdzSovKfJA77tMOmRCspeY9DpAxylGUnRmFUF+W4u+M5I8vUvvZxy0y6I3sFQxoj9rLQu/33qJY2YdAaZ4scQknC3uUxTVth29XdVSkSRCqIA7ukmdObXVAN8v7QKBTqF6oY0fbWwmAdjvP5wZ0XJKm/MAZRjLr3h1uhNCPqtMDX8be9WGmpbOfhD2uhb3k+ZyRxRZkl5QJyUI5iPsHbiyOUr0mIoe4xD/nKPXOgZXC2eXO5TY0oxzSIXSGHszfb2rB54pGBTyAnSCxnI8ud7RKH5O6Sq93ml6akX2mr2PVUeRSWhsFbOiYuGZF6gPF6mledZekwLZiPoxCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7nZs7Zhr69LItc9flIvYTCNIKVWgSLHqznAGbi66d4=;
 b=uFe23+z1JVOwooXf5EV+ekI1BbyGMQtbnw80zSV67mRa2/IUicaDBo3icp8XUNJrspTftNkyFs3cf5Ka3vXbaHxGsvZE0Mfmr64lIUJ3hvIl/SrpWd8e+HhTvF3AEUar9HzGyqrzQRGaiInT5OZUgZesWhqUzZOan6AbrEdctByJcueR3nmDMRfql+4lmYJu++/Xj3V7XcoC+9w/9p4ceaLtWWuUDrxCNBwWWXxw+/MZKjqoC+JwVuipH74EEo+hZ8VZh+vnuUhrAFz4i37k4t3edKD1ikcgorBP+JS7DXlAUXWT3zF5+ID89VaGPLNOzB/hmigSL/4wyPyu5fwdZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:11:48 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 10:11:47 +0000
Date: Mon, 9 Feb 2026 10:11:38 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 5/6] lib/igt_tools_stub: Add igt_load_igtrc() stub
 implementation
Message-ID: <5kkrprklkh6yx6lmrg2mfdqy2yfgecvtekrshk3l2666kls6kr@eoep4e7kyv4v>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
 <af94dc0971f27dd33a3424377102301c1cb0802a.1770212190.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <af94dc0971f27dd33a3424377102301c1cb0802a.1770212190.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH0PR11MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d483bc-79a2-443a-37eb-08de67c3a298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qnp6WXB0K1R5dldTVGNFKzFvNFMzYXVUZVZpMnI3elE2UTRXZitOaTNJT3Na?=
 =?utf-8?B?NmFwLzRVdUZVZjVMeGVuZDBSOXJmN0Z2b2dUYWNYZW1rTVdpZ2pROU0vUURn?=
 =?utf-8?B?R3NpNGE1UzVjSFcwOU01L3NjRFpXV3kvbUw0VTRHRXl4UWthWXRjQ1pWbWNI?=
 =?utf-8?B?U01zaVBzaDlxTFpSZXFlRU8wQmxCKytTQkdIWXdpSXRkOGdSazY2QmhNcVl6?=
 =?utf-8?B?UlB0WWpRZFYzSVN1czhHalQxMjJFdlBxR3hqVFFmbi9Ec0pwS001Mm91bHJj?=
 =?utf-8?B?NnkxbzYraHFsT0k5TnJCcGdoZklkamFQMmtsUE9FTUErYTNWdUlRemNndEFs?=
 =?utf-8?B?M3RCODBtYjdPUWVLSUJBVklTaEplbGdVbW9XeTNqZUt0eWdORmxYSG1DNW1E?=
 =?utf-8?B?T2xnMUZuRTVTKzBDZTcyMDhZbThoZ015SVVwSWFpSFlJYW9Na25CTWUrbEJN?=
 =?utf-8?B?eTBzTEVWcUlCQzBESUhxWFRNbnRvQWJWNWVNdWJMRjJiY2FWYUcwQTlVYXMy?=
 =?utf-8?B?bkZaTlhjR2dUQTB5UHkvdnorS3dJcTI2bFJmOXNLcCtMWlcwOG1lMWM5dWp1?=
 =?utf-8?B?ZDNXUDgrR3k2bVNUY1g0YndRM3JDQlhwL005bFA5akczeVJIS2Y4QU14emZC?=
 =?utf-8?B?WmV5eVJDejBJM293OXVZQUZ3WVE1Rkc2Y3dFcE8xVnYzQmxuMFpiRWJySmhX?=
 =?utf-8?B?ejdnNmdyY2czSGhTSDg5QTdVZ2E3OEMrNlBVcGJKRkNpang5NzlsRFRSd3BQ?=
 =?utf-8?B?RnJobHYxN0YzVHN5eVZwazBtbGJPWUNxZnFOUGUyajhlUDg0Ynl1ZUFyU243?=
 =?utf-8?B?OUNWMC9vSXkzSWlQTy9iQjlBSmVlazJwRzI5RnBMWjUzbzBCNlVIRXN4dmUv?=
 =?utf-8?B?VmhydnBVSFRQZHdpYllRVVhQZTJIV0FuOS9KckN1OTlzSmNLZ0NXV3NMODl1?=
 =?utf-8?B?QnFYbEw0cGZoT1Qrb2Z6cXBHb3hIMUNCcVNHcVF3RmF2MEp5UU92YTY3cmMr?=
 =?utf-8?B?MkdpVitrdUU2UWRBM2xoMnJkTGdlY3EzQ0lJTm5MclFscjhPblo0cVJkeEo1?=
 =?utf-8?B?V2ZVRGRZd2FBbzZ5WVhqVXlma04vVkc4eHZicHBUSlg1MUNwRXdIWFY0czNY?=
 =?utf-8?B?Q2RsUVZzS3JFYkwrRmVJRnZlYlY5T1luZGZJdk5DRVZRbEN6Z0Z2SnFSK1VU?=
 =?utf-8?B?WGk3VWV0MTZidmNTRU05U1RPbHVURzQ2R0x4UGpNblBpbHZUSnRBM2ZzbHo1?=
 =?utf-8?B?dHpqbUpTUGhOZ0pINDZDL3FvNlVJSXZua2wzQk9OWnM3dEZLRXV3YTJDcE1u?=
 =?utf-8?B?QzcrWm8vVDZURS8rZ2YrNGhMZ0pBdEV3azl0OXE5cndrNlY1a3NNenNqN1NE?=
 =?utf-8?B?RFRqWTdZaWt5NkZVb0tJMEhBM2VLQ0tQb3Q2bDR6WGZRbksvdmhwYzJmaG9r?=
 =?utf-8?B?SDh0cmxiYW5CNmZGQkJPb2djeUk1N3ROV25oRXVBdXljNTdRVWY2NTF4K1J3?=
 =?utf-8?B?LzVPaEhLSkVsQmlRcXB6c1NpTTk3cjE0czdKeEhMa3NDYVdwVTJPL1lwemNL?=
 =?utf-8?B?bFZra2pic2d4RVZPSUtEME41WUphUWhjQzFSSkN5VVNVQnd0Y2ZYY0d3RmdG?=
 =?utf-8?B?MUdhYkRPcHgwaXgrcjBRazd6YzRmKzFpUVZqZ3VrUmt4MFFuc2tkZkhwUGZ6?=
 =?utf-8?B?d0FqTmROU1JWSytBU1dCbVd5aDRtUGd2NVpiMWI2c3RNNGRINS9zTEpjMTRv?=
 =?utf-8?B?UXNhK1BaUDJ5Wm03WFpqcGZ3YUM5RkltUmhzOGRQaDhZOGxTY2xZVWRwRFBX?=
 =?utf-8?B?a2VDU2VVL2l2RXhJNm5odnZHZ3NOKzVJMGRpSFh3aDI4UElYRWZxZ3h3YUpx?=
 =?utf-8?B?RmJ6TnkwZVIzK1NXcFc0ZFZselluUzFSYlIrejVBc1ZqMlU4Q2dCZXlVcmI2?=
 =?utf-8?B?UElFaW13WEJqZnZGVkFaYUVKdWlkYUllT0ZMVlJXQjIzSWVzSUxUVVJUMnlO?=
 =?utf-8?B?WGV1WGtjQU1DRk4vVldhRW1HZkY5ZDdHV3FmQWdwWFBveVBQSGl4Q0NjU3p5?=
 =?utf-8?B?QXN2ZjhYd2xiZU5DZzVHb09TeVpJVGNpK0UrY2tMM2FyWTVGcHRsd0tzYlE5?=
 =?utf-8?Q?2RJI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akRPSXlrcWtHTFBNa2ZqOGlQQ05peFN5NzBPQmlSUkxRa2JXbm9ra3BrYzFC?=
 =?utf-8?B?V0crMjVkd2M3Tm9TeUxwWm5tcC9SOWFaU1UxaS9PUnVVZXRLZitpY2duL0dQ?=
 =?utf-8?B?b1Fkbnh2NTFSSzkxNUM0SGhZVCtkQ1Q5OHlKK2pXTy85aSsrcktKQmJPOTUv?=
 =?utf-8?B?d2hnRWo1V2N0SmIxUmNCMEtXQTJ4MjZ0Z1BiSGQ2Tmtwc0QrY1VQYUNzNXFv?=
 =?utf-8?B?QzQ3Y3p0NWlKNy80SEFsa1J0djJlcTB6YU9vNDJ4THZCVjJaREJxenRsOGQ4?=
 =?utf-8?B?MnUzT3FkREdRdmlDQXE3a0wxMUxMM3VoZXF3RDArazhsZUt4MlVjSTZDaTd5?=
 =?utf-8?B?Rzl1cFdOMnRIRkg3RUdSNldnbmlSemZFanMxeXR6d245cWRtVEk3QkhaWjFj?=
 =?utf-8?B?KzcxQmhjMjAvY2J2NGtCSHZ2cmMrOGFaWTVJZ0Npb25QbXJDRWRVQ2p6eFp2?=
 =?utf-8?B?RmU4R1NHamJCWlgwaEFyL1Z2VGZnYTdXRWFhSFV6dkNoelh1UUZsdEZ1Vlp2?=
 =?utf-8?B?dFZFNnpMWGFGWkszdE8ydWczU1hCVU1CZCszQW1acXpRTDBQWlRxaDdKMXlI?=
 =?utf-8?B?d1VtSzZUdE13TUxEQ2krUHkxSkNoVzBnTkhabWdNODlBUE02K3RXczA0eEpr?=
 =?utf-8?B?TGJZNCtxQ3JPK1FLTjl2T05tRHRKVmFmZnhhUFBqL1VkUWlyRVpHSHM4amNP?=
 =?utf-8?B?em1DcDBEY1JleXlCM2dUbVJWeGlZdmNUTkFhQ0p5WEU0VjNhRkp2ZDZDRm1R?=
 =?utf-8?B?RjZXTE9KdXZ4SFJlNndpcGM4U2x3bkNTOUlBeDhSYytxY2lUY0VKT0NvOFhF?=
 =?utf-8?B?aUJXbzdKTzlONkhINXJ0dThodDdUR3lrM3lCNWZtamxTQktBdVdFR3JZQXdR?=
 =?utf-8?B?UDcxbElPVXNXSTNJbXpZOTU2ZGs2UHZrU1BFUFJhVHlHQ0NZR0VabXFleGVE?=
 =?utf-8?B?OVo1VXhqSEw5dlgwZjhyeCtLWGV0dVBoUDhtTmJVRkgrL0dxODRuMmlLOWdB?=
 =?utf-8?B?aE9RV2x0eVdISjZVZC9ualBSWFBrQlNac1JaT2N0ZTFSYllxdE9ZUmlVdWRt?=
 =?utf-8?B?cHNJalIzSUdkbS83ci8xc2FFWVhjaFVib3Mva3NRaURleDFDZWFrS2poZTU1?=
 =?utf-8?B?bGVjYk82c2NINUVGRzFyWE5XWUlEQVhBdkpKSmw4dWFIWU90RTIvQkg0T3B2?=
 =?utf-8?B?UVhwNWdVOXN6OVRTYnk4ZmJqYnE3c3A4M1RmU1ZKVzFuZVVKa1FNQzFTV0l6?=
 =?utf-8?B?U0RiUUR1Z0UyaytQeDZDOXc4aFQ4U3VEenk5b1Blanc3VTdrWDZsd1lPTjhh?=
 =?utf-8?B?dFp1NzFKdTF6NldpT1ZSaWtBd2J3cVlySjFjN2hjM0U5eEh4WEZwRkRHOUhI?=
 =?utf-8?B?UzYrbUl4eUowVy84VC90RXU1U2VQclBhUTJaRFIxU1NtT0hYelppRVR4Rktp?=
 =?utf-8?B?YWkraEZSUFhST1lJdlJnY1VrTjFsYXhVZWYvaDk1cjdPWEdZQVNuRll4Rk1y?=
 =?utf-8?B?ZWhPRDkyejNpNlpyZjBMSnZhT2Q4cmpmVFFsTTlKSlNGWmE0UVZ6Ym5FeGlG?=
 =?utf-8?B?Y1RJemFWaXFRVkJ0UXFnZkVWRlFwSDBZME50blJ2UkJGL21rMTFhRVByWjZw?=
 =?utf-8?B?Qkc1NURlWjF4Nk1ERkVtQTcxREtjNXZOTVJXazRTU0xYd1o4N0xjak81elVq?=
 =?utf-8?B?UjFURUhhRW1ZNXNaK1F3dDJPbjl3TU83ZmVSLzRGbWliMDdqRXBDVVA1NTBS?=
 =?utf-8?B?U2JLRXRKV3hCRXRZZEdvWmZlSXFkcjc1RGM5WFFKMWI3OFk3bVhTZXc1Tmh5?=
 =?utf-8?B?T0lXUTIrN2prTUkyYlN5anB6b2Zhd3pMQlVpUElBNms1RnVJWUY2SjVaNk53?=
 =?utf-8?B?SVlVcmlzeFJESEt2WVRRZHRkNHpjcDlyeHFnRWlkSmtRSUwyLzRiaExnbGxs?=
 =?utf-8?B?RUJJTkJ0MW9FbXN6QUlISFlodHdZMGlOSm4vaVZlMCt5clp5MG1ITnV5QW1a?=
 =?utf-8?B?RmhSKzVveEpuNVYyLzcwdkxYaURFWFU4LzMwTnlwVjBOQ1FmT1hFdzVOMXJM?=
 =?utf-8?B?RTluOW4rK2F3d2hHMFQrYjJ4TUxBbWkwYVowRDJaYnlKWG03VmxIOWlWcVdZ?=
 =?utf-8?B?M1dpQXkwMU8xb2xCV3VmTmhMcXZJaHgvcG5jMHZmamJxdG9nanQ2ckNoM0Jw?=
 =?utf-8?B?OWZtbnJhd1YreUdDUlVQMk5wak1jMERkYWo3UVpLUjFiK1Rvc0hLWERHby9w?=
 =?utf-8?B?eHU4b1RuNm54ZnEvR0lOWFZnYmt5V241NzYxZXR5ZGVMSEV3bHhJRTB5Q0N4?=
 =?utf-8?B?VDBtTWRuM2J1WXRCNUl1eGg0OXJFUnllampacStUWXVxenVNU0xaUXNkVUE5?=
 =?utf-8?Q?YvnMwx11iD2e80Gc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d483bc-79a2-443a-37eb-08de67c3a298
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:11:47.8385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fk/eOB4Rx9skqiW2k5l0IAuCKNjiAXvOX4htGYLoy41zB13VLbAgvHsc4StzU34mXeFtL9ge/8htazHMa1SOqDfl88MyZogqb1yYn/asrAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

> Add a minimal stub implementation of igt_load_igtrc() to allow lightweight
> tools like lsgpu to load IGT configuration files without requiring the full
Does lsgpu also depend on igt_tools_stub? I only found indirect
reference for intel_gpu_top:
intel_tools_stub.c -> lib_igt_device_scan_build
-> lib_igt_device_scan -> intel_gpu_top (executable).

I think that this change is a solid idea, even if only a single
app would benefit from decreasing dependency bloat.

> igt_core.c and its heavy dependencies (Cairo, Pixman, X11, etc.).
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---

[...]

-- 
Best Regards,
Krzysztof
