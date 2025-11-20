Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFF6CFA457
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 23:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1376C10E7D9;
	Thu, 20 Nov 2025 23:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cf6x/z44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EC910E7D9
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 23:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763681303; x=1795217303;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1GzjFQVUS1vjVdCrrSxCFqZoG7/fUsVI4VJctE/BdB0=;
 b=cf6x/z44DZdIWSZdpxmnp0dfKJzRCKvpPiW0FIBi7KeeWUMn/6vOkEtA
 a93q82cchJ2qRVFufrQdCLamBMdvQ70p00DMCma04Cy6+rnGfrYA6Nw4F
 p3qrw2yI+IdrvwpHLJKFo6oyMmwE/7LVqIxydKQlpdF+5/YGHsJoLqvoL
 B8qDk5IZduLRUPNDE0pY7zz1KW5JcOq9SgE6JrM6yGfpQl9YyKSbdiVF9
 mccJSRL+qoT+TOynZUYWf8t1YPWme7RJcvvY8hH1yhtjy+tBTT8qeZHjd
 F5b/utw8GN/Oe149YGZ//3KbXFPqWC3q3yjyWE3cwEaBLXhG/qSgUDQlV Q==;
X-CSE-ConnectionGUID: qeCpV/fMR765ADN76Sp3Tw==
X-CSE-MsgGUID: 0R7UNfMES1qLUbAHAADzVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83158725"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="83158725"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 15:28:22 -0800
X-CSE-ConnectionGUID: sLe0pf5wQh2qIESzIdLmng==
X-CSE-MsgGUID: DP2jeJSSRga1l4cLLQD4yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="195802484"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 15:28:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 15:28:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 15:28:20 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 15:28:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnh5C93MBnPoFQSDkVx+40T/w+8TANtQGzJ+J6FmBmCzkWuvcqhzkD4sSNCFVskgd0mdScsgbFhjGEgti0wGWMVvQ/0LAYdP8cdrZxT5tlF9KhyMbKALmyJb6tCx0kePUM47nCag0zIg0/GSJftuLgaDqgl9diVCNlv/Mpmnf8qjxZFIaCxtkp6eWEnG+VfdEVv1/T6B6sAsoNr1rgA4KG4mCTEWjvXNSUgccj5iCU41Q5f+hyGU4M+3D2K5zHCUbQ1J6d8ECdx1BprbgdUoAYnTI8ZzaD0NibJiyy3FWt7O72wBNdiLA1KB9/d/1UNwamh4EGNLRx8Vug/OEdzFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0A3mXptbMOGXPlgm4SFqlgJTd2gIWdTcY4lYZWMJ+k=;
 b=P5aREmwRzDPozGa2deky2dgb5U8MlCMN/VOYsWeNahqhbQn8gxFVwDbYyKprZTvq3ebsCUekDiKifwZIS2kD9+SBBjDZDndabtDGEFwRA54i0FyQmPMJI7iu60LTmshT9lkCXs+alLNdD5BLazv+ddMKBSuOOhjwn++w2Ty0D7/1s1Zv9ke/zjx0FlAGhcpJXktkiP807i9amRgUgyXNvnC+feIoWeWoTYpr2XGcraSqVu1+ZAsAHpY/ZMrVg6335TRaO6AibreR8Nz8SvUXCEMiJ4aW+2gFMKLkiiWiAHa2fpgMz8LxjJAwqESDQjWvj0ZfwYpMV4z0UfY7FqRJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 23:28:17 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 23:28:17 +0000
Date: Thu, 20 Nov 2025 15:28:14 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 08/18] tests/xe_exec_multi_queue: Add preempt mode test
Message-ID: <aR-kDm1_J9953DfW@nvishwa1-desk>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-9-niranjana.vishwanathapura@intel.com>
 <CH3PR11MB84340CE1D9A1B920D524B2528DD4A@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH3PR11MB84340CE1D9A1B920D524B2528DD4A@CH3PR11MB8434.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0131.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::16) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: da9624ea-4cdf-4561-265f-08de288c7ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vl4rPZg8Mpky+bXeU8glJKiXqWlvK1sLGJFQQFCk1TLVGRfUrllioeUoKQ80?=
 =?us-ascii?Q?0WZ3OehwuVg6NdP/lPnsOtb/QMTagdL0JTTFKQJiTHFKvN/vqPpJvF7+jxl2?=
 =?us-ascii?Q?aa5jIFF8JXzHW0ovi8MLIEKo8Ko5VR573Yr/aBQQIDyrWCDAxoQussO6xT1d?=
 =?us-ascii?Q?xZI6453Uyb8oj2xaWE+n8EhLcjD6vh5UH0AgE01mNW3JFTDj/0zJZTIUnH1G?=
 =?us-ascii?Q?QH7ch9kE64UJeeN5eYUPcHePLowH9JuzZP7TKy5cHev43RHoc5pWl0neypCy?=
 =?us-ascii?Q?9Ut9op54wWSbN4WNfIIEA79A3lwi6syy8DgZT8rIgfosUcrO1sPxO8xQowTg?=
 =?us-ascii?Q?1doHzuWj6+1ORDB4IoMW1c9KIfxvjSYww3/yMvFfQE5YevYcSGqFzFrDqMt9?=
 =?us-ascii?Q?oBV1XGvR4c5fKNhuCaxL538qbZLhwJF8zm6/+LS9qYqf4ERm6sCkSaAUniy5?=
 =?us-ascii?Q?gTDZBfWiIz0gl9mIy8lFQNspBZo6PCY+Ae4k8oO+vgSt5AMCfqGegjzwJkpe?=
 =?us-ascii?Q?CtN3qIOmE/jPIvmFPqboECnCA0jPOCtb2CwAJWdrWtB1is2Od1KMsX4/V9tp?=
 =?us-ascii?Q?fvDIa8e5VbmCyasLwtm305b887E8U0hXT2l7/b119qqQ+N1xk+2FgepQHvaS?=
 =?us-ascii?Q?puTsDKTYX7KK+hauSqkxITuybcrgJ+sIhXmAZo+DAynN8ooLBDcQa7zRdqOj?=
 =?us-ascii?Q?/5mQRerGF7ed7A1sEkG1XNi0eRkZhPc8pMYDQWv5htEcEEUohnt6Y/2Plm9I?=
 =?us-ascii?Q?SChr8jJ5snykfS7kx8IRvJpiVrUXk9fLmDZlwhv5SPfe9woNoIkGLhZQFHb6?=
 =?us-ascii?Q?Vl4n2GBhH3DSWAiMVycPxEwWojkDhZRT6hs89r/3jdFFp4Bbpg621G1DIBuU?=
 =?us-ascii?Q?1SwgnawU65aiGPSJ75Y/zrpcNaJQ8kc5KLASIEtH/hOxucxleI106Rw2U+cZ?=
 =?us-ascii?Q?YJxLgBx7YvoE9gAkgpDv2I/J7ClW40/jW4gS7Nui6mFiTQ6hIOsBrpb0fWPY?=
 =?us-ascii?Q?7dFdziNap/vhlzArdmPbPBC3wP6hNAl3u3WVXyXDl2PSiC9XGBGKhJ1jJTtU?=
 =?us-ascii?Q?m+DnSY/9lwiWrlkrrpKJxonLNeyFONruN6SUG+LI+8onQgXUIxInstaFxH8R?=
 =?us-ascii?Q?T52OATDCMTyDJZVFSNNYuBHTzgmhPNNNkhgRxXJRGwMkP1Zh5TnPwUuiq4V7?=
 =?us-ascii?Q?dkg+DkIvoDE1qyF9Cghqpz3n39A65xSnCsO5P+xDKZd3/Hnxqzw83vEsVldf?=
 =?us-ascii?Q?BiK6Hu4DmQzVxJEKqF+u+/sKeQSu10DO6bG3wprAbpRGPuzerBk8Al0Z+CAz?=
 =?us-ascii?Q?mp6/GqB+Ls1MlgSGyFijRcSTnqJVXA8d/rirLy806SK3XG1Wc19YKAXOkRka?=
 =?us-ascii?Q?damBz7KRoqAAfwGwfLk1cs1JV0jikumWBTsvoagi4pq1gK36Zr3EDPsnFPT+?=
 =?us-ascii?Q?1VznqPoBaaVKZsOswS4sVlij+2IN8Wwt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XYX1gjDzTV7jV4ykvdQ4HtR9piTebR7BKMmVxATp3F0JyrWV44bBxGmm1bwq?=
 =?us-ascii?Q?/99wXa/dxFImhrkD3JaihSs+1uzbwOYdySLTx+oZR3XuPOELiP2U2Qg+M6Tx?=
 =?us-ascii?Q?zlhBtjOeZ7Y35jDXTfIhyMo+Gts239qvw9RTJFMzpPg/sRTx30hSbEwRRY0z?=
 =?us-ascii?Q?7Ee5FjJSopRzmZWRHGry2RSgzCtKnNRyMVVs9iqfSovHK3WoNHjvgl40QMRI?=
 =?us-ascii?Q?KDgfxPTDhTR/9soMK8uog4itNkO6BaPBBfOPQEFQkJJr/YLU849MkwS+9stV?=
 =?us-ascii?Q?NJJL3Q4A1JD+3E0sWx0ehyPqZMTMiL/jUT8Vo4xgLLL4mh/KF64JTVd1TWMm?=
 =?us-ascii?Q?nqkAcMI9S35h1R9xn4w1zi6WfaLnrdHwsQ+sK2Q85nE3E1MewdUhpPfyX9k8?=
 =?us-ascii?Q?6zbzle2dZHefc4PUpY/AwDahjj2lJz7dHdxkcWi8O/VyzFoOFF67KXlVQps0?=
 =?us-ascii?Q?9J+IgjeirRbbh0JiUQEqHdjz71u4T5G4Zk/ij+T9lHnAYooNWq9wLCSoSsUo?=
 =?us-ascii?Q?UlprryurWF3IPBCRmUf3fIJtGYvXCvRMsbdy9FIrpHmcoDHQBF3Yt10mie1g?=
 =?us-ascii?Q?+Q9bGVqgLY6aZmnL41oGw72dM0f+bDMQr1EDnlLhRXFXpTtDrrAOWiHziyf+?=
 =?us-ascii?Q?N3+v5MQO1DgVB9uV7/XIabcSHpP1/hfyH7opz90btrGnASr09L8WP6wndfny?=
 =?us-ascii?Q?eDvrcZ1yz5MX7VQ/RqCFGOjfHpxlY45LnfLvuirEqBG2Fp511XZBUv3zMEGm?=
 =?us-ascii?Q?barjuZsYGg+0ynpw50+yWGHIdthHx6fsFHdBW91oout8U9oxcVSbU8Wt4O/J?=
 =?us-ascii?Q?AyXbsm6+/9RY85BR9/CsN+wNPfAsWh9XCHgYvIvcEPBfnPMaunKhRuAHGLBC?=
 =?us-ascii?Q?KnVbfPpfbznlJAW8zZemC9iLUhoo6asZKeeq26d9oBoikwJZtDOgF8dM1PAb?=
 =?us-ascii?Q?D36SkD9MBDI43qryRCuW9oQhItYqOObb5dkUali7pZ3FZFfcMtIlP/CQoJhQ?=
 =?us-ascii?Q?GxeDhq6Cs3V1D7xWSnKpIieg+AP0K2W4cXfvpfkOvMgay2JqYKvtCowdfbXF?=
 =?us-ascii?Q?Axf+ktCXFVUSVmj4cajU/3ODtSFh3pUTLRH/7YlAxpIvLejCL/nc7FLed7uw?=
 =?us-ascii?Q?rX5vwK6nsVBjkg0XCsydZQkGbxMcPtPuMQXvWyzr0WO71QwImuMgoh/M2Sr3?=
 =?us-ascii?Q?xzToNHUvfx7reo82khn9jXY6YE2swMdH+76d/zgWLIVwrwKtKX5sdTPvHXZl?=
 =?us-ascii?Q?1ZG4ubGvgaBYYmVXHMg3tv7p12oTnz4+i8XxWrihirQKugpOpVujyStEhc0v?=
 =?us-ascii?Q?arYHSUuYGkeUuAsrk/wvzbtHyZqhRNnQ4lIGlk90078RjH8SIi/J6H7UeVoD?=
 =?us-ascii?Q?laoL9et0WvcJC6ERaJqJELcxU8OQoNA77C7gS+3Iu8YPQv/9FNNs0szMNP9D?=
 =?us-ascii?Q?0VWc/sgCbDY7BJFyF4TvIqK6GWQo+I8/lqgQ17YJVAT8h1Uquzp8861fN2/A?=
 =?us-ascii?Q?6A1gfsnPcNLVxsyFU66yFJLYmwKwObF2abglWgnu/IpFfB0QdSbyf6Ju1v5t?=
 =?us-ascii?Q?cx8n2gbZkmUx4Ih5e+PJWtM2nddzNqUQhpwRKh3iAcUdF+HfpDbIfUIbWw09?=
 =?us-ascii?Q?k2vJa2q7m9xV9qKVXGNqBvM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da9624ea-4cdf-4561-265f-08de288c7ba4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 23:28:16.9965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Y8y8vIO7H3sBAg1s3p955QZdRcHZSkllkcX/9tVoaAmZ3/u/aM/bTLbIzSqKc8Yu3TW/1N7pmfk6NYFZ79ir3XLYttkOXyG0j5eYLILyrzkVeA3clX4SBHk2LjwqJvM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
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

On Wed, Nov 19, 2025 at 09:31:07PM -0800, Dandamudi, Priyanka wrote:
>
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Niranjana Vishwanathapura
>> Sent: 01 November 2025 12:06 AM
>> To: igt-dev@lists.freedesktop.org
>> Subject: [PATCH 08/18] tests/xe_exec_multi_queue: Add preempt mode test
>>
>> Validate multi queue group functionality in preempt mode.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  tests/intel/xe_exec_multi_queue.c | 156
>> +++++++++++++++++++++++++++++-
>>  1 file changed, 151 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index eb40e92d2..191c55fdd 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -18,6 +18,8 @@
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_query.h"
>>
>> +#define SIM_MULTIPLIER	100u
>> +
>>  #define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
>>  #define XE_EXEC_QUEUE_PRIORITY_HIGH	2
>>
>> @@ -26,13 +28,14 @@
>>  #define USERPTR			(0x1 << 0)
>>  #define PRIORITY		(0x1 << 1)
>>  #define CLOSE_FD		(0x1 << 2)
>> +#define PREEMPT_MODE		(0x1 << 3)
>>
>>  #define MAX_INSTANCE 9
>>
>>  #define XE_MULTI_GROUP_VALID_FLAGS
>> (DRM_XE_MULTI_GROUP_CREATE)
>>
>After looking into priority and preempt mode both are doing the same thing, in priority test also pre-emption only happens for secondary queues,
>Here you are extending basic test with additional preempt mode but doing same thing as priority test, why cant we just add additional userptr flag for priority test case?

Priority and Preempt mode are two separate things.
The priority test deals with validating queue prioirity setting.
The preempt mode test is about running in preemption mode.
ie., creating VM in long running mode and using user fences (instead of sync objs).

Niranjana

>>  static void
>> -__test_sanity(int fd, int gt, int class)
>> +__test_sanity(int fd, int gt, int class, bool preempt_mode)
>>  {
>>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>>  	struct drm_xe_ext_set_property multi_queue = { @@ -65,7 +68,7
>> @@ __test_sanity(int fd, int gt, int class)
>>  	if (!n)
>>  		return;
>>
>> -	vm = xe_vm_create(fd, 0, 0);
>> +	vm = xe_vm_create(fd, preempt_mode ?
>> DRM_XE_VM_CREATE_FLAG_LR_MODE :
>> +0, 0);
>>
>>  	/* Invalid flags */
>>  	while (!invalid_flag)
>> @@ -114,7 +117,7 @@ __test_sanity(int fd, int gt, int class)
>>
>>  	/* Queues in a queue group must share the same address space (vm)
>> */
>>  	multi_queue.value = exec_queues[0];
>> -	vm2 = xe_vm_create(fd, 0, 0);
>> +	vm2 = xe_vm_create(fd, preempt_mode ?
>> DRM_XE_VM_CREATE_FLAG_LR_MODE :
>> +0, 0);
>>  	igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext, &val), -
>> EINVAL);
>>  	xe_vm_destroy(fd, vm2);
>>
>> @@ -199,7 +202,138 @@ __test_sanity(int fd, int gt, int class)  static void
>> test_sanity(int fd, int gt, int class)  {
>> -	__test_sanity(fd, gt, class);
>> +	__test_sanity(fd, gt, class, false);
>> +	__test_sanity(fd, gt, class, true);
>> +}
>> +
>> +static void
>> +test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int
>> num_placement,
>> +		  int n_exec_queues, int n_execs, unsigned int flags) {
>> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = USER_FENCE_VALUE,
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(&sync),
>> +	};
>> +	uint32_t vm;
>> +	uint64_t addr = 0x1a0000;
>> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>> +	int64_t fence_timeout;
>> +	uint64_t vm_sync = 0;
>> +	size_t bo_size;
>> +	uint32_t bo = 0;
>> +	struct {
>> +		uint32_t batch[16];
>> +		uint64_t pad;
>> +		uint64_t exec_sync;
>> +		uint32_t data;
>> +	} *data;
>> +	int i, b;
>> +
>> +	if (flags & CLOSE_FD)
>> +		fd = drm_open_driver(DRIVER_XE);
>> +
>> +	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +	bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
>> +
>> +	if (flags & USERPTR) {
>> +		data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
>> +		igt_assert(data);
>> +
>> +		memset(data, 0, bo_size);
>> +	} else {
>> +		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>> eci[0].gt_id),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +		data = xe_bo_map(fd, bo, bo_size);
>> +	}
>> +
>> +	for (i = 0; i < n_exec_queues; i++) {
>> +		struct drm_xe_ext_set_property multi_queue = {
>> +			.base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +			.property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>> +		};
>> +		struct drm_xe_ext_set_property mq_priority = {
>> +			.base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +			.property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>> +		};
>> +		uint64_t ext = to_user_pointer(&multi_queue);
>> +
>> +		if (flags & PRIORITY) {
>> +			multi_queue.base.next_extension =
>> to_user_pointer(&mq_priority);
>> +			mq_priority.value =
>> XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
>> +		}
>> +
>> +		multi_queue.value = i ? exec_queues[0] :
>> DRM_XE_MULTI_GROUP_CREATE;
>> +		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1,
>> num_placement, eci,
>> +						     ext, &exec_queues[i]), 0);
>> +	};
>> +
>> +	sync.addr = to_user_pointer(&vm_sync);
>> +	if (bo)
>> +		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
>> +	else
>> +		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data),
>> +					 addr, bo_size, &sync, 1);
>> +
>> +	fence_timeout = NSEC_PER_SEC * (igt_run_in_simulation() ?
>> SIM_MULTIPLIER : 1);
>> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>> fence_timeout);
>> +	vm_sync = 0;
>> +
>> +	for (i = 0; i < n_execs; i++) {
>> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>> +		uint64_t batch_addr = addr + batch_offset;
>> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>> +		uint64_t sdi_addr = addr + sdi_offset;
>> +		int e = i % n_exec_queues;
>> +
>> +		b = 0;
>> +		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +		data[i].batch[b++] = sdi_addr;
>> +		data[i].batch[b++] = sdi_addr >> 32;
>> +		data[i].batch[b++] = 0xc0ffee;
>> +		data[i].batch[b++] = MI_BATCH_BUFFER_END;
>> +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
>> +
>> +		sync.addr = addr + (char *)&data[i].exec_sync - (char *)data;
>> +
>> +		exec.exec_queue_id = exec_queues[e];
>> +		exec.address = batch_addr;
>> +		xe_exec(fd, &exec);
>> +	}
>> +
>> +	for (i = 0; i < n_execs; i++)
>> +		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>> +			       exec_queues[i % n_exec_queues],
>> fence_timeout);
>> +
>> +	sync.addr = to_user_pointer(&vm_sync);
>> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>> fence_timeout);
>> +
>> +	for (i = 0; i < n_execs; i++)
>> +		igt_assert_eq(data[i].data, 0xc0ffee);
>> +
>> +	if (!(flags & CLOSE_FD))
>> +		for (i = 0; i < n_exec_queues; i++)
>> +			xe_exec_queue_destroy(fd, exec_queues[i]);
>> +
>> +	if (bo) {
>> +		munmap(data, bo_size);
>> +		gem_close(fd, bo);
>> +	} else {
>> +		free(data);
>> +	}
>> +
>> +	if (!(flags & CLOSE_FD))
>> +		xe_vm_destroy(fd, vm);
>> +	else
>> +		drm_close_driver(fd);
>>  }
>>
>>  static void
>> @@ -371,12 +505,19 @@ test_legacy_mode(int fd, struct
>> drm_xe_engine_class_instance *eci, int num_place
>>   * @userptr:					userptr
>>   * @priority:					priority
>>   * @close-fd:					close fd without destroying
>> exec queues
>> + * @preempt-mode-basic:				preempt-mode basic
>> + * @preempt-mode-userptr:			preempt-mode userptr
>> + * @preempt-mode-priority:			preempt-mode priority
>> + * @preempt-mode-close-fd:			preempt-mode close fd
>> without destroying exec queues
>>   */
>>  static void
>>  test_exec(int fd, struct drm_xe_engine_class_instance *eci, int
>> num_placement,
>>  	  int n_exec_queues, int n_execs, unsigned int flags)  {
>> -	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs,
>> flags);
>> +	if (flags & PREEMPT_MODE)
>> +		test_preempt_mode(fd, eci, num_placement,
>> n_exec_queues, n_execs, flags);
>> +	else
>> +		test_legacy_mode(fd, eci, num_placement, n_exec_queues,
>> n_execs,
>> +flags);
>>  }
>>
>>  /**
>> @@ -402,6 +543,7 @@ test_exec_virtual(int fd, int gt, int class)
>>  		return;
>>
>>  	test_exec(fd, eci, n, n, n, 0);
>> +	test_exec(fd, eci, n, n, n, PREEMPT_MODE);
>>  }
>>
>>  igt_main
>> @@ -415,6 +557,10 @@ igt_main
>>  		{ "userptr", USERPTR },
>>  		{ "priority", PRIORITY },
>>  		{ "close-fd", CLOSE_FD },
>> +		{ "preempt-mode-basic", PREEMPT_MODE },
>> +		{ "preempt-mode-userptr", PREEMPT_MODE | USERPTR },
>> +		{ "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
>> +		{ "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
>>  		{ NULL },
>>  	};
>>  	int fd, gt, class;
>> --
>> 2.43.0
>
