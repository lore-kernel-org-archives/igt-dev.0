Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87040C25B4F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 18:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A95B10EA02;
	Wed,  8 May 2024 18:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfDK/9kn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231FF10FF6E
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 18:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715193913; x=1746729913;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3PUpGXmZ+zvmxbw1+fEfaaunodkjSnk07tq2y56eWR0=;
 b=gfDK/9knlZQQMlJezj4HJRoWF1xt0i7fMKB3XIvqmae047kXvSKYMVGC
 U9IxOqZbThXLReQTa9WJsSuFcvtcAeyNUjZyG8QTevxul65AH1cNUHTt4
 Pd16XE4TYdW2GfQicWZWsEew+F6M8A+AefAV+sZZFow0p/h8O2MCYaisP
 txiN0qU89vwzKKN5HtEHwwpR2VDUOZSQCEWOwSQKQam2QKJeFS2nEiDDd
 7f1zHLAc/mWCREmtLt1Dz7byjt2FQm2DiyItTCgA3eNTCh7Wo1WdWryZ4
 VNwXNQWU8CqA5w85ZtymsVjEJHmtvA10+GUgCHKINpRgIuFDpQP5LUp9+ Q==;
X-CSE-ConnectionGUID: WhQ9tDiwRU+18w2+lyovxw==
X-CSE-MsgGUID: 5ohqPx7TTNWlHKAdO0iHlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="36457312"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="36457312"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 11:45:12 -0700
X-CSE-ConnectionGUID: CTIE7W2NR36rPYn/wetKCg==
X-CSE-MsgGUID: nRFNUuhtQhCVuV8ISO+p7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28955239"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 11:45:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 11:45:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 11:45:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 11:45:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMeTIMbBQ///TMfW7vTfuzxTiP2+L20ATz2rabz1k7F/ZpCSJ4i1lLjPoMNnThO43ddm6VD27jOjJ9ckNDaJm3sSxw3hOjq590EVjfGIakCXhi2SisA7Ix7rILcqM6AeQZdJpovFseJ7NX9pHQ+SCPSXc2JNXhMzBXRfvmckBJrAEPK8hIssPy2KdX5RGFao1hKcWNSQpe/ljFGA25/zhZUQ/k2MUQccNwMT6KDghK9UYtawJL5vjSiq6LnF/ZWrqQwQxfmcol8fzJp5sGqXzgcCxMzfkrj7opingznoxIx4CMLSiITXccVDhV5vPXck70+5DG/Zh6zz1WUt+9NrnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUWUUcQFGA7526d8lsUygcdelFgH7/fSvRw1sXjbPJo=;
 b=B05QURjpkTiQCePgmpqic52NS37xzqGZbZMrnPVwwxhmT81bePNbW/ZQwzWHxK/fWq3mC7H4DK8XKVTDGf7MFnZnjifaRA37k52Vm8cnA7nDl5aDih6ImgUNOHsOEj1ERKXsIwYl/zLatUAT9yl3EE1keM9O6Bm3cdGtSrsRtyClZ8bqHLLxavxkV3m7bMI4xJPNyN7UIdtfcYvGMdGZB8caL/yowiFCHihC5Yur0mwLRmsbiZdffCbqgdBniHJ8kOhKeRRz2bhV84d7jkrA21zz+anIBlB9xJnb/MpR5sFeT+XBEMVQCrlP6gZcdODtdPirprlDK9NoGfTsOaONJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB7896.namprd11.prod.outlook.com (2603:10b6:610:131::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 18:45:09 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 18:45:09 +0000
Date: Wed, 8 May 2024 11:45:03 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 08/13] treewide: Rename engine busyness variables
Message-ID: <ZjvIL8XimXrfEkI4@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240504064643.25863-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:303:8f::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 749ce83d-8411-4164-3275-08dc6f8efc54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEFxSzFKN1l0dE1UZzRzQmhaSVN3eTRKR0pOTUJyWmZjQjh5UU5Pa29pd0FK?=
 =?utf-8?B?azZ2Mm5zckFjQ3krQzVLTTcrUkJoSkpCSkpDb0c3ZjhTc09xV0FYR0c3UEs0?=
 =?utf-8?B?VUl0NDdDN1RsYmR2NHFPRzJkekIzWVBrNFlodkJUdFpVK2Q3QXNoNkVrNEZE?=
 =?utf-8?B?V2xsWlZrNGkzVHRTdW1xVldwOWZySno2NWdnaEt3SmQvQ0J4Unc2TjlwZHAx?=
 =?utf-8?B?M3p3ZXBUM0VhNTdLRjVQMTZOb1o5Y2pKK2Fyck5vTG90YmhRem9QUG8vUWlt?=
 =?utf-8?B?Zk1YWVRqc1RQaGpSbEc2MW5HUXU1RGRTcy9Nai80YmNzNUpBVXVpNENzZWdY?=
 =?utf-8?B?RHRRU2J1bUlrTHk2MUkwZnJZcVZxQ21WZFRpNVhIOXMzS25HVnlMLzBuQlQ3?=
 =?utf-8?B?b3l1d0VGWWwwU0RVT0RKeElkWndkSzNRVnlIRjc1YUNxREx6VWNjUDViMElq?=
 =?utf-8?B?RFFVRlEvQ2NCSFhXMlhxQ0FjMlpvKzRwd3cyZGorb3o1QTBzbkpMQm5iRkZN?=
 =?utf-8?B?K05CMDl0bWhMVjBxV3Q5V1ZxNGxJMjRtUGVnbDNnODYveVc2ZGVHd0hUU1FR?=
 =?utf-8?B?MUNvbUpGTFhTWVlxeUhxTWpVaEx5amdwNFdONUhyOWlOTlhQQW10MlRHamtv?=
 =?utf-8?B?OFFHOGN6d0tGeVZFeDhnZFdkNitOazBGZHJsbWM0YkpFQmNwZ3R1bFFZaTdo?=
 =?utf-8?B?M2l2TTQ2YmNPTkIySDlidVNqRWU3T3FDb3BqQUsvTjE1RDJSRFV0ZWVCV2tT?=
 =?utf-8?B?dStWeUhyRjRGUEdHSzd1K2M2MHlHSFAwUEJMNlRkSVBSRjFVTktZQVdyTmM2?=
 =?utf-8?B?ZXhYQlN6eGdEd0IxVUNxQ2tNamZWWWVVdDlUU0hkaHl2Nnl3eDZWcDVEajJy?=
 =?utf-8?B?OHN6QmpWNU9OQVJpVGJSOS8zLytKalMvTDduL2VwU1JYc0lQL2hyRjI0ZlZo?=
 =?utf-8?B?a0UxY1M5LzdSd1JzanlEVUJhcC8zaExMVzl6ekJIWHVGN3oxMUd5ZlE3Rm9l?=
 =?utf-8?B?cjUzRGZIQnVjTGVVV0hSeVZiRUVpWW5HVVNaS1hxcWQyc3JNUWFmQzdpQitM?=
 =?utf-8?B?WC93UGRkT2RjOXZxcXEwTncrQVl0UklGM01VSFEyeU5RQWwxR251YjlwRVBa?=
 =?utf-8?B?a0xZRVVQTGJCTUp6alB4ekxYUE0zenI4UUltTU51USt3UTh6Z05LZDQvL0U5?=
 =?utf-8?B?VVlyaHdTR3JqNWJqNzNIVHdCbnN0djYwem8zendqL0IwcWp4dExhZC9jMlZT?=
 =?utf-8?B?bldiN2N6NnVIMzRqT3pxSHl2a1JlUi9sZUdUaW1QYVF6Z3RnQkJrNFNudVAw?=
 =?utf-8?B?SE5hWTFuaFFvMENjdHNKcVhvMnlEMzU1b2xDRlFKZ0xaeTRKSExFTU1LOWw1?=
 =?utf-8?B?c3hJRE92QjNCMEsrZ29qVEViMGFGdTBjYS92OUlBdmtoLzY2dWJuaDVMME5X?=
 =?utf-8?B?djluZnhVWDIrU2wvT2gvSkRQUGtEcUFQVkc5Z09pOG54dWp0OFR6RWFSUXBz?=
 =?utf-8?B?b3oyMEdzamVxUGlERVBOTEFod2xrOS9wdThtQzlnS1VKVnR3QWpkcG85ZnhG?=
 =?utf-8?B?dVdCVnEwajN0NWZ5TXNMTGRuN1o4S3BYbVBJdzk1M0R1M2E0WjM0OS9kYThz?=
 =?utf-8?B?Vkxud2h4c2x1dUJQMEtEeVhCY0FSVzJPYVczbHNXQkpmb3FteXY0WmNBRExO?=
 =?utf-8?B?ZDFrWnBvVzhIOWJMNU9OcEx1bXFrYzh2QVVJaVhsWDJFWHd6VnIvaUdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9pbUh4OGY4R01GZENJY3hXcjBpb3hjdmg3Zi9SS29JVEpHL2paanZhRGpt?=
 =?utf-8?B?RGRQMnFXT1BXSW1iQVZ1TzY1UVZzTS9LUlM0RE5EVlhyNXZ5K1hBemMyTnB4?=
 =?utf-8?B?bVZZZlNXVjNDTEJpZWlYa0c1aHQ1ejRjRzBWNFJEMG9mRmZDOVJIeXpFRHRi?=
 =?utf-8?B?YnJUQ2YrcU1kVWRwYXdCS1drYlNtQWNwYjMvanNYbE55UmxmL0ZrZTBYNjhI?=
 =?utf-8?B?TkRVeUk0ZDg2cnAxWVRMTzdpeXFUV3d2SnAwWXlZMm0zcFluUGN3bnJqV3V4?=
 =?utf-8?B?WnZDckU0ek5LcWRGTzd2ck1qeXB1N2NoTy9lVDJWUHNiQ1d0UjVXNXdLampJ?=
 =?utf-8?B?Y1RISmovSnN2d2Z4dzJEM1k4UkhZTEJKTzJBcXh1dTNlblAvcHZqZHU4WklQ?=
 =?utf-8?B?L2lRQlNkZjFveTJpWVhsQzhNaHZkRjYzOERBdUIwY0ZRUzByRndrUDlTeWg2?=
 =?utf-8?B?UHZWZ3hFREc1UTlNczZyempTdENBZGdvRVB5S01VVE43YXI5WTRiTDgwRGhV?=
 =?utf-8?B?aEhCY1NvdHhpQlRPRU5DT2g1UnFSeVRyNlVheG5RN01OYWpkRm1kbXprWVp3?=
 =?utf-8?B?MSt2SitOaGw2cUgzdzdpaE5URitSYlQ0KzlEQ0t5SEVETlc1NnFXTG9oNVpV?=
 =?utf-8?B?YWNJUlZTYzFXZzBTanBHYnFYdTdmV0ExOWQrY2twUnRiL2xiVjdvYU9lN1Q4?=
 =?utf-8?B?N3l0Mm85c25Qc0Jucm1zNVhkNDlhZFRFZUVCbmRvTlFQMjE0cWp6eXpTc0o1?=
 =?utf-8?B?eHhYYTBjUDJjVWREaHFQY3JLL2gxbkZkWnZPSnBERndxUS9yMUppNXJrc21m?=
 =?utf-8?B?OVJVdGZvLzc3MS9TTGJRUE12eVFKZXgzWG9QRkZGMjJBU2FqTEJtRXdXTUNQ?=
 =?utf-8?B?a3lYUG1EV1g3VWtscDJoU25PNW1YbS9qOWRnVGZUVGdPdjJVdGQya2RndE56?=
 =?utf-8?B?Mm1iejF0c3JnaFJ4OFl3SlFNVXlNWm91Rzd4NGkwRllXT2lqcWozb2hrcjJw?=
 =?utf-8?B?L1dobk4vZEwzeGdBejl3ZjZoVlRMaHVLYm9ZZjJCd1BDRDdLTUt4OE1PK1M4?=
 =?utf-8?B?dy82eTA4ODZKYXI1bWlsS2NIODRzeS9ISk5EenppT1AvVjVPRE5XdWZVTmFU?=
 =?utf-8?B?MjZjdXd4QUlYQjdybWhoN0wvcDduZnpOWkFWNDEwNENUVktBNVllUUsyZktz?=
 =?utf-8?B?VkNLRkgxS0wzZTdYdTJ4MTh2eFJpMVNUcXNEWi9RQlM1UkpNeFZpRFcwSGxy?=
 =?utf-8?B?TjRQdHZvSGFHcS84QmFkTGF6RlZtZ0w5bllQQlVCZlNTWHdCQU1oWm9xWnZi?=
 =?utf-8?B?bG9qenFZQzdERFZndnMxSjJ1SU9NQjZoSHZLRWYrQW9reW5zTHBxaGVDS2gw?=
 =?utf-8?B?UUpWY2FVcW5mRmthYmJKOWR0b3ROTC9UNC9laEtFQ3l6eEl2L1FYRUcxZ2V4?=
 =?utf-8?B?QWE5UHZhSFp6WE44aUgwRzNxNFhEQkpqZjFtTy9VZ2VHNTltYittdVk1L3NS?=
 =?utf-8?B?OXBiL0duNWNxWnYyUHkzVndzWVdDS3Q2Tm9tQzNVYlpaRkJocmVmRmxmS1FV?=
 =?utf-8?B?VTRKM1Q4dHVzeTdyQjY0UmhqeHZHUzV1QjJUMTVZNVlydXJ6d3c3YWptZ20v?=
 =?utf-8?B?ODY0NTkxdGJabnRGTDZFMXNxUS9jcmlRTWd5djFYcTNrd0poVGpJUGpOSkVa?=
 =?utf-8?B?UTh6NTVWNmUrV25qWGlxT1ZLbnN5a2hPaHpXYlFaRERFc2pvbS9jV2tDaW85?=
 =?utf-8?B?NndQME1EbG1sTEV0MUlxUFIvNHZEeXJUZHltMW9VTGVxMHVDN2JTUC84bjZs?=
 =?utf-8?B?cFQ0T0N3NHAyckVxUmM5aE15Ui8wTkhldjV1VXVUZEtxN21jRWZnZUdLRWlk?=
 =?utf-8?B?UmcvcDdReUtxYmUrWnRzYzdpaGVGM0c3ekU2eUxFQ2d3M01YNlNsK284cHNB?=
 =?utf-8?B?amt3MGdQOHMybGRKWk53ZlJIbGljRTU4dndneU13N2F3bnlaeHgwUjBRTDN3?=
 =?utf-8?B?WlBITVMzckpjYnFjTURTNzVEK3hMOVlwUzFkQ1BES0RzVFBjWDRZM2dZQ2tB?=
 =?utf-8?B?eUtNOWZIcUNiZ3hlVTdzYWNQQW9ZRlFualJDWFBFZkRyMXkzelRsblRPM0VD?=
 =?utf-8?B?OUpyYXYyQVcvNFVKR0xMdC9TaWhjcTlwZ1I1STJySEVEeHVPNHdxMXRZa2R3?=
 =?utf-8?Q?jf/OEQyQMj20a34M0dgnfXE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 749ce83d-8411-4164-3275-08dc6f8efc54
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 18:45:09.0920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iID45t5Ua+/qClt21f/27qynwUzkfpEjlCEXNckRHr4Gcp9O//9g0PfWqcGQyidDR/ntMX+aiMqAS+u1qEIWkY+p9eGEUXgNprzjMDYloC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7896
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

On Fri, May 03, 2024 at 11:46:38PM -0700, Lucas De Marchi wrote:
>In preparation to have more possible ways to calculate engine
>busyness/utilization, rename variables related to the current way: it's
>reading the "engine time in nsec" spent by the client on each engine.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

IMO, I still prefer the earlier names since the word "busy" is ingrained 
in the PMU work that we have done so far :). I would have just done 
this:

s/c->val/c->delta_busy/ (since val is descriptive)
s/c->last/c->last_busy/ (since you intend to add cycles later)

The new counter would just have similar names, but with s/busy/cycles/.

It looks fine as is, so this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Regards,
Umesh

>---
> lib/igt_drm_clients.c    | 28 +++++++++++++------------
> lib/igt_drm_clients.h    |  8 ++++----
> lib/igt_drm_fdinfo.c     |  6 +++---
> lib/igt_drm_fdinfo.h     |  2 +-
> tests/intel/drm_fdinfo.c | 44 ++++++++++++++++++++--------------------
> tools/gputop.c           |  8 ++++----
> tools/intel_gpu_top.c    | 24 +++++++++++-----------
> 7 files changed, 61 insertions(+), 59 deletions(-)
>
>diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>index ab0c2cec2..3f4265015 100644
>--- a/lib/igt_drm_clients.c
>+++ b/lib/igt_drm_clients.c
>@@ -103,19 +103,19 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
>
> 	/* Engines */
>
>-	c->last_runtime = 0;
>-	c->total_runtime = 0;
>+	c->agg_delta_engine_time = 0;
>+	c->total_engine_time = 0;
>
> 	for (i = 0; i <= c->engines->max_engine_id; i++) {
>-		assert(i < ARRAY_SIZE(info->busy));
>+		assert(i < ARRAY_SIZE(info->engine_time));
>
>-		if (info->busy[i] < c->last[i])
>+		if (info->engine_time[i] < c->last_engine_time[i])
> 			continue; /* It will catch up soon. */
>
>-		c->total_runtime += info->busy[i];
>-		c->val[i] = info->busy[i] - c->last[i];
>-		c->last_runtime += c->val[i];
>-		c->last[i] = info->busy[i];
>+		c->total_engine_time += info->engine_time[i];
>+		c->delta_engine_time[i] = info->engine_time[i] - c->last_engine_time[i];
>+		c->agg_delta_engine_time += c->delta_engine_time[i];
>+		c->last_engine_time[i] = info->engine_time[i];
> 	}
>
> 	/* Memory regions */
>@@ -183,9 +183,11 @@ igt_drm_client_add(struct igt_drm_clients *clients,
> 		c->engines->max_engine_id = i;
> 	}
>
>-	c->val = calloc(c->engines->max_engine_id + 1, sizeof(*c->val));
>-	c->last = calloc(c->engines->max_engine_id + 1, sizeof(*c->last));
>-	assert(c->val && c->last);
>+	c->delta_engine_time = calloc(c->engines->max_engine_id + 1,
>+			       sizeof(*c->delta_engine_time));
>+	c->last_engine_time = calloc(c->engines->max_engine_id + 1,
>+			      sizeof(*c->last_engine_time));
>+	assert(c->delta_engine_time && c->last_engine_time);
>
> 	/* Memory regions */
> 	c->regions = calloc(1, sizeof(*c->regions));
>@@ -223,8 +225,8 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
> 	}
> 	free(c->engines);
>
>-	free(c->val);
>-	free(c->last);
>+	free(c->delta_engine_time);
>+	free(c->last_engine_time);
>
> 	if (c->regions) {
> 		for (i = 0; i <= c->regions->max_region_id; i++)
>diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
>index 52888aedc..f2ff13182 100644
>--- a/lib/igt_drm_clients.h
>+++ b/lib/igt_drm_clients.h
>@@ -63,10 +63,10 @@ struct igt_drm_client {
> 	char name[24]; /* Process name of the owning PID. */
> 	char print_name[24]; /* Name without any non-printable characters. */
> 	unsigned int samples; /* Count of times scanning updated this client. */
>-	unsigned long total_runtime; /* Aggregate busyness on all engines since client start. */
>-	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
>-	unsigned long *val; /* Array of engine busyness data, relative to previous scan. */
>-	uint64_t *last; /* Array of engine busyness data as parsed from fdinfo. */
>+	unsigned long total_engine_time; /* Aggregate of @agg_delta_engine_time, i.e. engine time on all engines since client start. */
>+	unsigned long agg_delta_engine_time; /* Aggregate of @delta_engine_time, i.e. engine time on all engines since previous scan. */
>+	unsigned long *delta_engine_time; /* Array of engine time data, relative to previous scan. */
>+	uint64_t *last_engine_time; /* Array of engine time data as parsed from fdinfo. */
> 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
> };
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index 79b72c54d..9deeadd4e 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -190,10 +190,10 @@ out:
> 		}							\
> 	} while (0)
>
>-#define UPDATE_ENGINE(idx, engine, val, utilization_key)		\
>+#define UPDATE_ENGINE(idx, member, val, utilization_key)		\
> 	do {								\
> 		if (idx >= 0) {						\
>-			info->engine[idx] = val;			\
>+			info->member[idx] = val;			\
> 			info->utilization_mask |= utilization_key;	\
> 			if (!info->capacity[idx])			\
> 					info->capacity[idx] = 1;	\
>@@ -260,7 +260,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 		} else if (strstartswith(l, "drm-engine-", &keylen)) {
> 			idx = parse_engine(l + keylen, info,
> 					   name_map, map_entries, &val);
>-			UPDATE_ENGINE(idx, busy, val, DRM_FDINFO_UTILIZATION_ENGINE_TIME);
>+			UPDATE_ENGINE(idx, engine_time, val, DRM_FDINFO_UTILIZATION_ENGINE_TIME);
> 		} else if (strstartswith(l, "drm-cycles-", &keylen)) {
> 			idx = parse_engine(l + keylen, info,
> 					   name_map, map_entries, &val);
>diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
>index 3f641d79d..ea90edd79 100644
>--- a/lib/igt_drm_fdinfo.h
>+++ b/lib/igt_drm_fdinfo.h
>@@ -60,7 +60,7 @@ struct drm_client_fdinfo {
> 	unsigned int utilization_mask;
>
> 	/* drm-engine-<engine> values */
>-	uint64_t busy[DRM_CLIENT_FDINFO_MAX_ENGINES];
>+	uint64_t engine_time[DRM_CLIENT_FDINFO_MAX_ENGINES];
> 	/* drm-cycles-<engine> values */
> 	uint64_t cycles[DRM_CLIENT_FDINFO_MAX_ENGINES];
>
>diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
>index 61c66079e..2d155180f 100644
>--- a/tests/intel/drm_fdinfo.c
>+++ b/tests/intel/drm_fdinfo.c
>@@ -192,14 +192,14 @@ static void end_spin(int fd, igt_spin_t *spin, unsigned int flags)
> 	}
> }
>
>-static uint64_t read_busy(int i915, unsigned int class)
>+static uint64_t read_engine_time(int i915, unsigned int class)
> {
> 	struct drm_client_fdinfo info = { };
>
> 	igt_assert(igt_parse_drm_fdinfo(i915, &info, engine_map,
> 					ARRAY_SIZE(engine_map), NULL, 0));
>
>-	return info.busy[class];
>+	return info.engine_time[class];
> }
>
> static void
>@@ -229,11 +229,11 @@ single(int gem_fd, const intel_ctx_t *ctx,
> 	else
> 		spin = NULL;
>
>-	val = read_busy(gem_fd, e->class);
>+	val = read_engine_time(gem_fd, e->class);
> 	slept = measured_usleep(batch_duration_ns / 1000);
> 	if (flags & TEST_TRAILING_IDLE)
> 		end_spin(spin_fd, spin, flags);
>-	val = read_busy(gem_fd, e->class) - val;
>+	val = read_engine_time(gem_fd, e->class) - val;
>
> 	if (flags & FLAG_HANG)
> 		igt_force_gpu_reset(spin_fd);
>@@ -250,9 +250,9 @@ single(int gem_fd, const intel_ctx_t *ctx,
> 		gem_quiescent_gpu(spin_fd);
> 		igt_assert(!gem_bo_busy(spin_fd, spin->handle));
>
>-		val = read_busy(gem_fd, e->class);
>+		val = read_engine_time(gem_fd, e->class);
> 		slept = measured_usleep(batch_duration_ns / 1000);
>-		val = read_busy(gem_fd, e->class) - val;
>+		val = read_engine_time(gem_fd, e->class) - val;
>
> 		assert_within_epsilon(val, 0, tolerance);
> 	}
>@@ -282,14 +282,14 @@ static void log_busy(unsigned int num_engines, uint64_t *val)
> 	igt_info("%s", buf);
> }
>
>-static void read_busy_all(int i915, uint64_t *val)
>+static void read_engine_time_all(int i915, uint64_t *val)
> {
> 	struct drm_client_fdinfo info = { };
>
> 	igt_assert(igt_parse_drm_fdinfo(i915, &info, engine_map,
> 					ARRAY_SIZE(engine_map), NULL, 0));
>
>-	memcpy(val, info.busy, sizeof(info.busy));
>+	memcpy(val, info.engine_time, sizeof(info.engine_time));
> }
>
> static void
>@@ -312,11 +312,11 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>
> 	spin = igt_sync_spin(gem_fd, ahnd, ctx, e);
>
>-	read_busy_all(gem_fd, tval[0]);
>+	read_engine_time_all(gem_fd, tval[0]);
> 	slept = measured_usleep(batch_duration_ns / 1000);
> 	if (flags & TEST_TRAILING_IDLE)
> 		end_spin(gem_fd, spin, flags);
>-	read_busy_all(gem_fd, tval[1]);
>+	read_engine_time_all(gem_fd, tval[1]);
>
> 	end_spin(gem_fd, spin, FLAG_SYNC);
> 	igt_spin_free(gem_fd, spin);
>@@ -388,11 +388,11 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
> 	/* Small delay to allow engines to start. */
> 	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
>
>-	read_busy_all(gem_fd, tval[0]);
>+	read_engine_time_all(gem_fd, tval[0]);
> 	slept = measured_usleep(batch_duration_ns / 1000);
> 	if (flags & TEST_TRAILING_IDLE)
> 		end_spin(gem_fd, spin, flags);
>-	read_busy_all(gem_fd, tval[1]);
>+	read_engine_time_all(gem_fd, tval[1]);
>
> 	end_spin(gem_fd, spin, FLAG_SYNC);
> 	igt_spin_free(gem_fd, spin);
>@@ -443,11 +443,11 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
> 	/* Small delay to allow engines to start. */
> 	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
>
>-	read_busy_all(gem_fd, tval[0]);
>+	read_engine_time_all(gem_fd, tval[0]);
> 	slept = measured_usleep(batch_duration_ns / 1000);
> 	if (flags & TEST_TRAILING_IDLE)
> 		end_spin(gem_fd, spin, flags);
>-	read_busy_all(gem_fd, tval[1]);
>+	read_engine_time_all(gem_fd, tval[1]);
>
> 	end_spin(gem_fd, spin, FLAG_SYNC);
> 	igt_spin_free(gem_fd, spin);
>@@ -589,11 +589,11 @@ virtual(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
> 			else
> 				spin = NULL;
>
>-			val = read_busy(i915, class);
>+			val = read_engine_time(i915, class);
> 			slept = measured_usleep(batch_duration_ns / 1000);
> 			if (flags & TEST_TRAILING_IDLE)
> 				end_spin(i915, spin, flags);
>-			val = read_busy(i915, class) - val;
>+			val = read_engine_time(i915, class) - val;
>
> 			if (flags & FLAG_HANG)
> 				igt_force_gpu_reset(i915);
>@@ -610,10 +610,10 @@ virtual(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
> 				gem_quiescent_gpu(i915);
> 				igt_assert(!gem_bo_busy(i915, spin->handle));
>
>-				val = read_busy(i915, class);
>+				val = read_engine_time(i915, class);
> 				slept = measured_usleep(batch_duration_ns /
> 							1000);
>-				val = read_busy(i915, class) - val;
>+				val = read_engine_time(i915, class) - val;
>
> 				assert_within_epsilon(val, 0, tolerance);
> 			}
>@@ -700,11 +700,11 @@ virtual_all(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
> 		/* Small delay to allow engines to start. */
> 		usleep(__igt_sync_spin_wait(i915, spin) * count / 1e3);
>
>-		val = read_busy(i915, class);
>+		val = read_engine_time(i915, class);
> 		slept = measured_usleep(batch_duration_ns / 1000);
> 		if (flags & TEST_TRAILING_IDLE)
> 			end_spin(i915, spin, flags);
>-		val = read_busy(i915, class) - val;
>+		val = read_engine_time(i915, class) - val;
>
> 		if (flags & FLAG_HANG)
> 			igt_force_gpu_reset(i915);
>@@ -718,10 +718,10 @@ virtual_all(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
> 			gem_quiescent_gpu(i915);
> 			igt_assert(!gem_bo_busy(i915, spin->handle));
>
>-			val = read_busy(i915, class);
>+			val = read_engine_time(i915, class);
> 			slept = measured_usleep(batch_duration_ns /
> 						1000);
>-			val = read_busy(i915, class) - val;
>+			val = read_engine_time(i915, class) - val;
>
> 			assert_within_epsilon(val, 0, tolerance);
> 		}
>diff --git a/tools/gputop.c b/tools/gputop.c
>index 8cec951b4..80bc94be4 100644
>--- a/tools/gputop.c
>+++ b/tools/gputop.c
>@@ -176,7 +176,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
> 	int len;
>
> 	/* Filter out idle clients. */
>-	if (!c->total_runtime || c->samples < 2)
>+	if (!c->total_engine_time || c->samples < 2)
> 		return lines;
>
> 	/* Print header when moving to a different DRM card. */
>@@ -208,7 +208,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
> 		if (!c->engines->capacity[i])
> 			continue;
>
>-		pct = (double)c->val[i] / period_us / 1e3 * 100 /
>+		pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100 /
> 		      c->engines->capacity[i];
>
> 		/*
>@@ -257,8 +257,8 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
> 	 * Within buckets sort by last sampling period aggregated runtime, with
> 	 * client id as a tie-breaker.
> 	 */
>-	val_a = a->last_runtime;
>-	val_b = b->last_runtime;
>+	val_a = a->agg_delta_engine_time;
>+	val_b = b->agg_delta_engine_time;
> 	if (val_a == val_b)
> 		return __client_id_cmp(a, b);
> 	else if (val_b > val_a)
>diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>index 5b4f94d7d..35122493c 100644
>--- a/tools/intel_gpu_top.c
>+++ b/tools/intel_gpu_top.c
>@@ -793,7 +793,7 @@ static int client_last_cmp(const void *_a, const void *_b, void *unused)
> {
> 	const struct igt_drm_client *a = _a;
> 	const struct igt_drm_client *b = _b;
>-	long val_a = a->last_runtime, val_b = b->last_runtime;
>+	long val_a = a->agg_delta_engine_time, val_b = b->agg_delta_engine_time;
>
> 	/*
> 	 * Sort clients in descending order of runtime in the previous sampling
>@@ -812,7 +812,7 @@ static int client_total_cmp(const void *_a, const void *_b, void *unused)
> {
> 	const struct igt_drm_client *a = _a;
> 	const struct igt_drm_client *b = _b;
>-	long val_a = a->total_runtime, val_b = b->total_runtime;
>+	long val_a = a->total_engine_time, val_b = b->total_engine_time;
>
> 	if (val_a == val_b)
> 		return __client_id_cmp(a, b);
>@@ -893,9 +893,9 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
> 			strcpy(ac->pid_str, c->pid_str);
> 			strcpy(ac->print_name, c->print_name);
> 			ac->engines = c->engines;
>-			ac->val = calloc(c->engines->max_engine_id + 1,
>-					 sizeof(ac->val[0]));
>-			assert(ac->val);
>+			ac->delta_engine_time = calloc(c->engines->max_engine_id + 1,
>+						sizeof(ac->delta_engine_time[0]));
>+			assert(ac->delta_engine_time);
> 			ac->regions = c->regions;
> 			ac->memory = calloc(c->regions->max_region_id + 1,
> 					    sizeof(ac->memory[0]));
>@@ -908,11 +908,11 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
> 			continue;
>
> 		ac->samples = 2; /* All what matters for display. */
>-		ac->total_runtime += c->total_runtime;
>-		ac->last_runtime += c->last_runtime;
>+		ac->total_engine_time += c->total_engine_time;
>+		ac->agg_delta_engine_time += c->agg_delta_engine_time;
>
> 		for (i = 0; i <= c->engines->max_engine_id; i++)
>-			ac->val[i] += c->val[i];
>+			ac->delta_engine_time[i] += c->delta_engine_time[i];
>
> 		for (i = 0; i <= c->regions->max_region_id; i++) {
> 			ac->memory[i].total += c->memory[i].total;
>@@ -946,7 +946,7 @@ static void free_display_clients(struct igt_drm_clients *clients)
> 	 * or borrowed fields which we don't want the library to try and free.
> 	 */
> 	igt_for_each_drm_client(clients, c, tmp) {
>-		free(c->val);
>+		free(c->delta_engine_time);
> 		free(c->memory);
> 	}
>
>@@ -2120,7 +2120,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
> 	int len;
>
> 	if (output_mode == INTERACTIVE) {
>-		if (filter_idle && (!c->total_runtime || c->samples < 2))
>+		if (filter_idle && (!c->total_engine_time || c->samples < 2))
> 			return lines;
>
> 		lines++;
>@@ -2161,7 +2161,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
> 				continue;
> 			}
>
>-			pct = (double)c->val[i] / period_us / 1e3 * 100;
>+			pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100;
>
> 			/*
> 			 * Guard against possible time-drift between sampling
>@@ -2235,7 +2235,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
> 					 iclients->classes.names[i]);
> 				pops->open_struct(buf);
>
>-				pct = (double)c->val[i] / period_us / 1e3 * 100;
>+				pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100;
> 				snprintf(buf, sizeof(buf), "%f", pct);
> 				__json_add_member("busy", buf);
>
>-- 
>2.43.0
>
