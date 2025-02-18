Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7493AC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 18:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C3410E06F;
	Tue, 18 Feb 2025 18:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRyV3xVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39F510E06F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 18:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739903584; x=1771439584;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fbo4WMv4nw82auQVh5cfucJIT92mCy3bNXnoql+EmxE=;
 b=ZRyV3xVie7313mciw7cLppSPuMShRxJUUZhlOhhrTI5bfIUscHYWcThy
 fd/+VPwaJWkQrvMBBbRqpi/R2qd4+KFNWo/ZE53EsXz2WlZf1rUIFGGGQ
 eE7XdSlhnbcz3eIqzm4h/DsFYs5SAdsDfT06b91xdGZr/Fu8QO3TObm5b
 CdVobkkuI8NA5eD8RvDgWrqTU7cl5dShv1zgEg/RLf0OvTpXoQ0aEoqbe
 DybEDO67NfbgUgSXMyopakKdvbAVWtuXuQh/ChxGCUx70O7jpCHYDg71I
 6gVYigf7TLHUO+/t/Q6nVTqDGY2m7OhY3rCP74Y4raVt3kLXdyeIuk48M A==;
X-CSE-ConnectionGUID: jKNIULvOQPCDD/XQznFmRA==
X-CSE-MsgGUID: yV9bNfgYTL24XvHhfhmhWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40538680"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40538680"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 10:33:03 -0800
X-CSE-ConnectionGUID: sVFLcLpKS5mX7PFm3bUJKg==
X-CSE-MsgGUID: PaUYKo3dQMGmchh61s9uiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114657227"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 10:33:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 10:33:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 10:33:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 10:33:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnT2TX8jjWnD0VMpc0R6n1cAxyJTnQiXqAzWbJjS3io2qlM9IjPXC2/UDFD3ICrxVOO86fPBnfqExCDAHeJdD8j/VWSGhpNMT4+AlYNSOWxN6j+lj0iJnl8rtvB+Ay5DOrkGslheKACI7te/Ew0ov6Ief+xofn0SD9PfyCzAxeA7Jdiqii39Te3lYFLCg1IQCvyxfcDlsKvWO4YrGY+CJeodL4mpvuwsE92TruGZ1UefSngoCMTFon4tD3r29vQy2+HaV092jEcdIRDeCQpcjLvIcAwvBo9zWvuYc1WCdS0uKyvBzwO2+LcfOdNieB9vX5CEJitF/r71+c0kG+csgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OceRUuVBYjU/hTO330TYZBK/I/FfSO3+SKtY5pZTEBE=;
 b=oEA+EWWT+IGDiKnawy/siJql+6fEcBU25iPDfVN3U3mMZa6ecDtVI6SiwJ/84vPluIU1ct4g65ZzOipO7CWB8c3vvQMc8FfVS/FGfTxgJTFl2GQpMBU6491W+S+Q1jJlTgNZMHvO/vpbReeDu7behBGS/FbcT7Qe7aAyAwbi9GxtyeSaRp4AYzK2SI+H0XXU7Soo8qpINejOtcN3Nk5Soj4U6OfNYmumeNbOIRG9eRh8xfH+bZ9lioErmqQffQnsytoVshpBrvyZFJujDClfs/TJnURUCa4gkdbk5sRDOwbDVUMfvHKuxC+LMB7EHPqz4EnuipZ0C8SUGN5mrYe2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 18:32:45 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 18:32:45 +0000
Date: Tue, 18 Feb 2025 10:32:43 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 Some refactor, rewrite and fixes for OA tests
Message-ID: <Z7TSS/F0FjNhKIuj@orsosgc001>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
 <173958621795.2265040.5679085843732439081@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173958621795.2265040.5679085843732439081@b555e5b46a47>
X-ClientProxiedBy: MW4PR04CA0350.namprd04.prod.outlook.com
 (2603:10b6:303:8a::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c874e2-9e17-4abc-a0bd-08dd504aa32d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHZRTlIvS0Q4Y3Q2ODRrQ3lIL1cwaTEwT1JGRHNlWjE2cloyV1VSU2ovSmxQ?=
 =?utf-8?B?YnBCNjlMVUxQOFp2c3Q1ekRBNkRpYml5aHNSbjdPelFrSUJBWFR4Mk00WkJD?=
 =?utf-8?B?VkNZQnROZUUzdVdnbHE3a3RwYkcvcjM3M1dJZmdmdjMrOHdzbElsTlpvTzVP?=
 =?utf-8?B?QnliNUJoK0FuVnlzTzhpTVJxaWc1OVRpb2ptWU9BNHRJNWIwRE50Y1ZUSVhX?=
 =?utf-8?B?UWxheFZUaTZVejlzOGdxNGMzNHJUcUNRQ0dRVkhZS1lubVZKTWc4bVB4eC9k?=
 =?utf-8?B?UmJnb0UvM09xT2FWcDJyMVNST0ZvK3Fpc0kzNzZlSmFjYll3dEV5cFZ6WVlp?=
 =?utf-8?B?dkJJc3NhRnUxUzZ2VGpia2FNclNKcFphTm52QTBtVzJHYkc2WWpEZ3pCOEo1?=
 =?utf-8?B?SkNyYWRCNnJqejRxMGpmNi8yczhoY1Nyb21tSXhTVGNSVVZqeGJTWkJsZWRS?=
 =?utf-8?B?eWN1czV4SDcwOS91WTVBVkhrRHdBdEFzQ2NWRG54M3Raa2hkVXNMeDNQazBQ?=
 =?utf-8?B?ank2aGg2b2NYMTFXRmJ4SStpR1BEd2tlWElRM1pzUlFUM2xST3BEVUxsZFR6?=
 =?utf-8?B?UlBBeFppOGNZZ1Q2elZ6dG14MzV2M0FtS0FPLzROT1AycnR0N05YREpNUDZ4?=
 =?utf-8?B?VVJQaXFodTBJNDdQZExKeEpqYUlvaDZHbzBOb213OTliWnk5aTEyTHR6dkNP?=
 =?utf-8?B?YzZneEU5bXhocGRKLzQ2YXgyVHMzaW9SNWRXa2hLMzdrNlhCS2IzS0xVUEh1?=
 =?utf-8?B?NE9oZDlXQ3NKKy93RXZab1RLNGVLUFFWSXJIMFhRakJJZWJHYzVmUlJUWVY2?=
 =?utf-8?B?UkxrUW5OOFJVazZJZm52RXpCUTFudVJOdEEvMVptVlZIV284cC9Xb1N0cE1D?=
 =?utf-8?B?QlpKK2FZQnZNdGFzanYxWTUvTG1CMmpXc2dwZE9WeUdGRnpranZ4eFVheHRS?=
 =?utf-8?B?ZnJmOURrNjljUERna3NobmgvaHNYczhsbVhYM3ZJZFljL0UwRDEveVlQSlNG?=
 =?utf-8?B?Um5wYzducFRaRGtHUnRtS0FpWklLMWdUV3czU0pmT0FMQ2ErQit1QVFMK28w?=
 =?utf-8?B?c1R3blJzcVRpMFNyNFdBZDVPRFNBNVVQTnZ5NEtOaW5KWXlaTDkwMWZRWlhN?=
 =?utf-8?B?Qkk3LzU3aGdlSUFYZXlrcWV6aHp2VEM3QXJTL1ZmUllycjR1K0xiV094UTRu?=
 =?utf-8?B?UjRSVjhWcjA1eklkNkhxNGhIbTFsRmt3a0k0Y1g5UU5CbGRPNy8yeTRLazRR?=
 =?utf-8?B?aEw0Ym82dFFZSUdOTUF0R2tvNklZV2w3RXhzRGR0d2RjdnBPa2syM2E3elFQ?=
 =?utf-8?B?ZEJBbmhCdzF2RXJqbW1Zb2NBb3R6YnhQcVlTM0M2bTR0V1JJeTdoVVMzYkUx?=
 =?utf-8?B?T0tSYkNXVEI5R1d3dnNRY3dHcTNNTkc0QzAzdmtvbkhpcEEwczFnZFJiY0VY?=
 =?utf-8?B?S1lrOUFRcFRBNDdXbGJ1UFlQZlhxVDhSbEFPNEJsODIwdTA3Wm9aRjhLTnI1?=
 =?utf-8?B?YVFyakRGV0NsdFY0QW9zbVhnYXcyMDlsMVlFandNdGh3SnNvbkRkcXQzSEF5?=
 =?utf-8?B?Nk9Ib1M3UXRaUVIvV2JjV3F1QTFyakxnSzA2VStqLzdQWXJlSXJkbnVqNjhz?=
 =?utf-8?B?Qk5MOUVQcldrQjYySTZSRkJza2UvYXhCdllGYVlyYXhRNjZXMHMwd1ZKdlVV?=
 =?utf-8?B?TnhwUVY3bkFmbXpyWWxZekJDK2tnWUtzbmVMOExuelNtRHpyRHpNZDFvekpl?=
 =?utf-8?Q?xhjwI2ucrNJLyyA1qmvwPuotnLe3OlcdW5uyEeU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHdFdzdkcmJIY0NMczJGOFg5R1lKMXV3UzhHUHZPUEVqOCtlRHVXVDVwZFJI?=
 =?utf-8?B?bEdBT1VSeG53NVZpUSttRHBBODYvKzhxaUZWRGp3ZGRObWF6MVJFVlpWZ0dB?=
 =?utf-8?B?K2VGazR6cjhFTDR5M3U5WmxUS2pRcllPZGRTem1WZTR5bTNGc2NIQVczUnpy?=
 =?utf-8?B?ekZZUHBlZ0Z6UmdZd0lPNTNMRmE5dmpyRmlBUnVTUHJPbm1ucG10WDFrbW1v?=
 =?utf-8?B?SG5PekVEaFozNjdwY2YwN09SSjB4OGcxdTNDaWJHZUpCVGJ4bUtDYnc5Tmdy?=
 =?utf-8?B?VnRwOG5vMDF4dk5rNEsvRnNhSzF5dGlRYlhiQmtOc1V4cENRRVdSak9jZk9B?=
 =?utf-8?B?RU1Ba3ZUMWhsU2wydWNLTVhHTFlvanRxMTBERzh4K2ZKb00vRklxZkVYTzFH?=
 =?utf-8?B?ZFY5dm9qOVViMW4zOTk0aXdvc3ZxN2tmV0YwQ2FidkdiT1ZXdWRDSDh4MlFq?=
 =?utf-8?B?NmhSL0RHSktQNklwWDRQUFdadjNwanpjTGpjVEhRUjRpNk9ldldPRkpxSjF2?=
 =?utf-8?B?YmV5WkJjZTRuWVdCcG5WaDRuclQwbjJaK2ttaXRsYldCekJFQzNBRllONVIv?=
 =?utf-8?B?OFI1eWE3TnB2WENmOCsva0FheDUzYmNDaDBQeFZLUUJnaStTUTQ4KzlMZnFR?=
 =?utf-8?B?NW03SExYK3R5OFFyeFhsWkIxUHFrWFptTGtiSE5ycmE3enFTZS9JdVlIZkgx?=
 =?utf-8?B?em1Cb214UnpEUkxaOUlWRmFHMDU3WllhUk44OGdlMndPVXpJbWx4QjFCa29E?=
 =?utf-8?B?WHZPR082U3VzbXA0OUZUNGduSm5QckwrVklEK3dDZlFmZ0NTUVR6ZjZoSm5C?=
 =?utf-8?B?NzlhaDlQSW1LVUFDMEhzMllqR2FWam1oM081cjhaLzBGODRkRVNZRUltTmx4?=
 =?utf-8?B?dWVqRGs5Qnh2NXJRMlBYY1FtenVVbGtIMGVucmZUMkJtUEo4aUthQnpsakVO?=
 =?utf-8?B?YW00K09HWS8rNmhzZklUdURVZUZOeHpHK3pkbW41MlZyQmc3Z1JZcjdLL3pm?=
 =?utf-8?B?YndBNUZyek5ENk9HMFlkZnJwSTZwbXVzeXd3Z1A5THdteUZUMnZWUVhQSytY?=
 =?utf-8?B?ZmZOclJCWHRrVVFMT1JqVEd1Vlp4d1lIM3dBUUNSb2JlejdBMjZWeWtINFRr?=
 =?utf-8?B?eHY1dWJGWm9VV3o1NHliS0tONWZkNHV3emQrc2h5c1lLS3pUQXhUd0pmVm5i?=
 =?utf-8?B?My9xKy8xYlI3dFBONXhPQlJCaWJ3U1dQZXA3cWMzZTl0bEZBR2krblZldjIz?=
 =?utf-8?B?YndzUnpwdlNTdHFJRmZ3K2ZrakV6Zmsxc1ZIVVY5SWtlTnUyZWQ5MjJQamVx?=
 =?utf-8?B?czUzaU5pWEdyYzV5MUtYS0ZzbUsyblRhNzhGYW53VmVaRkFrb3IwK3pDUERM?=
 =?utf-8?B?bVZHOTZlano0SFdSZjRWQXdMaW8vb2o3WGREQkVEOUlHY1BJaXhGKzF1Vzg5?=
 =?utf-8?B?NUNCRit0bGFUZzg1MkZrTzJ0YlBWdklEeXM1WENxSlBOSUs2b2dSMXVyMVpJ?=
 =?utf-8?B?SjJpSUltdi8yN0Z3WUl1QVRvcTdMZ21waGpTSWlxZDJTMnY1V2xiSE5va2RD?=
 =?utf-8?B?aUIxYksxbm5QRHZjdW9rcjc5M1VQMy96d0RPZmdKMWdFN3VFb1NVajd3TGdO?=
 =?utf-8?B?ZEpCeG55NHdZVDlXSmQxY2xCZG5QSU02a0x0VkhNMmc1bVhsaGRLYmZPQTd4?=
 =?utf-8?B?dW5tc3ZlcEVSTjIyREt3Ym9FZU0rRHhYS0V2K3o1c2Y0QUU5eHVvbFdGa1Vy?=
 =?utf-8?B?WC9QaEpaeU83SWdlUzQyaVBjTzhZN2tnc3cwL3ZXNUc1ZXJyM2Q3cHZ6NS9F?=
 =?utf-8?B?MlM1bitIOHpHanJHMHVJM3hhbHZIOTRGbWo1OGhsYU5oSVFkd2ZORmRLMWtU?=
 =?utf-8?B?ODFSVEdvejNnSGdGVlk3NDI0TlBtaWlLRTJrdXVkM3NzbXRSeGF2cDRnZzl3?=
 =?utf-8?B?bklXbHhCMEtJT3ZTSmFvOTlLdmQvZDNXaWxMYXZNTmxlbXM2bjY2NnhEeXhW?=
 =?utf-8?B?MC9lSE1mR3pYZTJpd3BoWUo5SytCSS9hcWcwaGtRZXFtU1BKVVlCTUVSYVg1?=
 =?utf-8?B?N3BKZlNvc05QbzAvZ1JvMXV4a29WQ3N3OEFkQ1o1aXJXSDcrVjloZnZzYnBB?=
 =?utf-8?B?L3Z4Y3JJYzZzc3NxeTFiVWRNWVhwRDNMRTIzbUlzM3FTd3kyR1J2eUhuUGsv?=
 =?utf-8?Q?eNqT7hFhSehXM2rdDcws/BU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c874e2-9e17-4abc-a0bd-08dd504aa32d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 18:32:45.3937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iv3BRJwAnmWDcf/zZWplGlFBcYXSwB/Gww8Mm+rI1B7X65odomoN1YFUihxemdkj1YLuUHpF6NeBP92fAFQUe7JBTHOVZNmEf8ZuBETzSkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
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

On Sat, Feb 15, 2025 at 02:23:37AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  Some refactor, rewrite and fixes for OA tests
>   URL:     [1]https://patchwork.freedesktop.org/series/144916/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12607/index.html
>
>               CI Bug Log - changes from IGT_8230 -> IGTPW_12607
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with IGTPW_12607 absolutely need to be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12607, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>   External URL:
>   https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12607/index.html
>
>Participating hosts (42 -> 41)
>
>   Additional (1): bat-twl-1
>   Missing (2): fi-snb-2520m bat-twl-2
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in IGTPW_12607:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@i915_selftest@live:
>
>          * bat-adlp-6: [3]PASS -> [4]ABORT +1 other test abort

Unrelated since this series is strictly touching OA tests only.

Umesh
>
>Known issues
