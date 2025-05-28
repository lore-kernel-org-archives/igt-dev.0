Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E813BC5AE59
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 09:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3CC10E160;
	Wed, 28 May 2025 09:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyiZTyhe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCFF10E160
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748424100; x=1779960100;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DcRg/cFvW8QWMueeru5OPphd6yXLv2zJa1ZfhtuwNio=;
 b=HyiZTyhe/TM/7ZuU1AaDHH2asJ1UnqKXLUaiunGg0t9ag5hGJoRT8rBs
 jkLbT4yv5CL88uBmrSjn50BM1wY4CZ09yVrAqC72ATSQusu/BxWK/q0JP
 1ccnGx129S6ZLALVpXTZdFr6RKn/8PhCqQ8DVJVvPRYtfQr8HmgZF9e8D
 PFQnNieylTqSnm6wpobiURPNSk6rdXIcBHnM11Ilxkf9e5cQqqO7CMreP
 q9/ub4vnvGgyWI7Elm6PJf7jW1lPty9VPr7Kug/wk7IzOGh8tpHu7i4oA
 ehIY28SQ+Q6QuUrlvu8Tbpc+yswql3fYNcLejSOIdJMi7sAiCb53JEhzp w==;
X-CSE-ConnectionGUID: Q72IiKBtRXa1v0G00n2mDA==
X-CSE-MsgGUID: eujZ7meYQUKqr4PV8f1C6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="72974548"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="72974548"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:21:36 -0700
X-CSE-ConnectionGUID: w4tFKMC3SUS1zl8qSu9Z1g==
X-CSE-MsgGUID: jinmyJHqRiSrkhUTFxdOFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="180419981"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:21:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 02:21:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 02:21:35 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.76) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 02:21:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQ3PfAOb/AI7Tcl0Q/J5CoHtUSo3VmYKmeKs+CtbIhcWE0LZ1OoVlBzVPrZq29e2/vOaTiSytdIsBFsYOLsviXNkqQv/nbwlnrssmlwZLH5tOoMfKNPIuM+HUBnHaMFadROaot6qmq5WV+OoGieX533Va4bsbuvzIPIsXy33PJr4uCxa7WGPn6xkgN7R9ITueW8TfU8thkk8f8bIy7RjXt8TDZxHcIJ5WqzSmRoBghrWifDSj3J8heEj8ZkkRS5s8LzkBtV42VeqyVsr9IYYia2LalHJuOB9kT2ibVEZUj7emOyltTOfQ4Yfuu6xMJM66MJqmR5vFDyaAW/Gytn+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6FhoYNRaUm01V3/hEIm62NAPS5Dmst9f5QS52OObFs=;
 b=KkNmUbfDe3owanDlFi6CS+qFZY/TPBs0/WAch2PWUhUWwzg+N2gD/8bCpAInBePfT675ZNTU6hqPeHfPSWYoqTmLTOnKavcCsXrU0RBkZa7nw1C6DeUuSPpUWMsFDDos7yxNRfjFoO+QM/sXgv3qrhxJbLc7uKumpcfL89BLHErt06b1/XzRMUYschErmz80uMoiECqLslHPPRyFrbDWpQGkIFDNaYgPd1zwqiGWq7M3cJuwyGTgDLIwnLPoT5bz2p6bfQhtHadvuJh3f6he8AA9MyHwRvd5Ok/tQytT94fdhJhXiE8oSXXRRABibcsqCfW9WIVrRseaR7RvPvLQLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8277.namprd11.prod.outlook.com (2603:10b6:806:25a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 28 May
 2025 09:20:47 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 09:20:47 +0000
Date: Wed, 28 May 2025 11:20:44 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 4/4] lib/intel_compute: refactor to remove code
 duplication
Message-ID: <aDbVbBP69kES5M99@fdugast-desk>
References: <20250522075515.168920-1-zbigniew.kempczynski@intel.com>
 <20250522075515.168920-5-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250522075515.168920-5-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU6P191CA0050.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 330e4682-5287-442a-92b1-08dd9dc8ee69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uk41eTVEZ0Y5SVEwU3pWVm40WU1lNTZtYndCQ1Q0TnorblB3RUhwZk85T2My?=
 =?utf-8?B?cXFGNzJhOG9VTjMzOEFGRmVzNUk0dlhhYTB0N1dMRFFXcEZRVG1yQzFrczZs?=
 =?utf-8?B?YlVXdTVTOHRTUGJveS81QnhSeFhVZThhdml0RDNxV3JreXIwQ2FtZUgvcy9G?=
 =?utf-8?B?UU9NeWdjR0g4WmtkQTg2RFhQMHB1UzRxV3BLSzl2SHpaQWdESWl6a0p3VS9a?=
 =?utf-8?B?QzFHdXVRdERjQTg5eFAyeVRqcVZFM0J2NkptWXJHNGJIcE1XdnRndmJ3aDFS?=
 =?utf-8?B?bm1LM1dIVFViTkpadWFZT3A1azRRWHpXVkVIMGZldWU1VDExTjNiT2FMRE42?=
 =?utf-8?B?OXBvdVArQW9Rb3AyYU9xWlRpWEJTYkxUQ1pSY2F0bnkzbk9WVEJ3UE93c2dS?=
 =?utf-8?B?c2h5Rk56aDNuUUw5SmFUWGVZT3F6WG5jS2Z6clFvbHcyaExSSmFWQkJvSGR2?=
 =?utf-8?B?Z09xMVdIbU5ERVptVnVNTlFOeDlOL1NNcktRU1FVa1BxVThCc0U4ODRHVDhh?=
 =?utf-8?B?ZE5DNlJKQ2ZwN2dSKzQ3QTE2WWJvQWdyQmpuR0pQbjJtaEo0dTg4NkhWY1ZS?=
 =?utf-8?B?NFpEMExLR0p0eitvdE9lQ3Y4TnprR2llTjRaaGU0SXRrOVQ5YW94KzBGS1k1?=
 =?utf-8?B?T0k5M0FPTzFYYW9GejZmemtBemtXRnZHZmdBLy9MTExSaXFPRTdNL1RER05k?=
 =?utf-8?B?SEV4VXhlMHkxWDJySnhqdG10ZXg2eVpSOUEra0xiMjdEakJWSkRqQnAzbHdR?=
 =?utf-8?B?bExub2VqVGxNSmkyQ0gxeFJtNDY3ZXRXNnpQaUtOSFJvSXZwemJBSEt2aGdM?=
 =?utf-8?B?TjBhTUUxa3FiZnZHRFZ3MzVEQjFua1JpSmZXZ1dJTEQ4NG5XMWZQVUw2d3Rs?=
 =?utf-8?B?N2ZuMjZTVCsvaDRCN3JXVkZvTm9hVStOWk1ZY2owU3VYb3k2T0NPVUtIWHU0?=
 =?utf-8?B?MHFuR1ZldmxkYlFDZ2I5NkRSSTE0TGFZWEtBY2VTeVhmTlJrbFVLLzlYRTJW?=
 =?utf-8?B?WjhnQS9ZSGwyMWRBZGcxL1UwQXZKaUJZK3lBSWoyQStSZnNvT1RmR2RSbHRy?=
 =?utf-8?B?RUg0aVdLUHpwdEcxV2JLdkNaeUlOZlBGZ1RFRkFvZFpia0NLZXRDTGlaOWFS?=
 =?utf-8?B?QXk4UVhqcWFDaERJdkpqU1JkSy9Na0JPYzJnUHV0Y0tyaFZMQWlvQ0oyMzBm?=
 =?utf-8?B?ejRudXovWktkRDBpQkx1WlFoZ1drbWJVNHN1WEVKcUM1YnBxRkdaNHJWUFJH?=
 =?utf-8?B?Tlo0RDNxd2lQeFdpSkh1RkN2TnFBQ3l1eENwMkNOTlJzZ2o1UzRKM0UxS004?=
 =?utf-8?B?V3pVU1Z0djNKTXFPWjBtdjJYaW1QOFR6bnRmR3Y2RElqK3hOeit3emdFSUo1?=
 =?utf-8?B?WVRoQnJyUVZkTk1Qa0NhL3EyZzdIakxRb3YxcXZ1ZXVjanFYSm93SGEzYVJp?=
 =?utf-8?B?bnMzMFJyMC9oT1F1K0NYMkYxL1pTSFlIVDNxVENQeTFGY3N0M05BOFJ4am5G?=
 =?utf-8?B?SXBuOUFyejhTbWVQeWQvek5RZ1hqb0tzcG5ld3NuazFEc2J3UW15RWJlOXRU?=
 =?utf-8?B?MExGblFKYUI0ME1VNnFScmJJMWo4aUk1ZDR1bkpoWW1qS1dDUEMrVnVzbDlJ?=
 =?utf-8?B?M1RPaGp1blF5Z0xaVURtdjN1WmNsYzUxWUd6TzFYYnRpeTUvMVlsb25JNkI3?=
 =?utf-8?B?OFBsWWxSV29UZmgzZVBueW1zSGdHNkdiUkhlM0xGd0tZZEx0WVB1MkVRdjB5?=
 =?utf-8?B?M2VPZnJCUkdnODVOOG9yejc0UHFUWm9Ydkt3anBCd0Y0YUxZeEVSSGRhVHFK?=
 =?utf-8?B?Z1A0T2RvUm1jRDk5eVU0NEhXZ0tOZVN5dk13ejJrTnJIcWU5NkZXcHpMWHpC?=
 =?utf-8?B?Z3N6WVFMZGVsU3o5aEhieWM0U1dUNkV2c05BN2pmWENvWEVmNEZpMGRBWVkz?=
 =?utf-8?Q?pZ3yqRMRFYE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWk5cHBZOXo2S2EzcEtCdXZUeW5PTzlOenNiTkVjMUQrbEZaWkcyNW9YUFlS?=
 =?utf-8?B?L1BoUzJSR2lhSlFxRk5MNXl5bllCcVpLSVFORUIyVUhVVTBlaEhaV1V5YkZn?=
 =?utf-8?B?TDhtSkRrcjhGQm5UbVlLR3BtYnY5QXozSEhGTWk4dlNkY0Y2QUl0aWw4eVps?=
 =?utf-8?B?M2E3WW11SGthcHVFdFJDVXNPeTQwVHV4TTR1clliTm1UemtCMXEzazNyVlFl?=
 =?utf-8?B?MmhCZlZhNkdYQXpXRDh2V3d5SE1ZZ0J0OXN5YXBmNmEzdnhaZEw5ejhJdEZp?=
 =?utf-8?B?ZWhKellPTDhObnNQUUx4ekxwSFFYSlVMUGQzV3JPQkY4VUtmMWhiNkNJZDNs?=
 =?utf-8?B?c0tlRjVBYmd4MGZnUlFIdkpJcWx3NlhpUU9XNGNzeEpvb3NLNFMzcmt6Ty9H?=
 =?utf-8?B?R3lyMnNBUnNBSm0yY0Mwa1R0bE1GZS8wdVllR3FnUHZpeHIxcVNMbHdNQTQx?=
 =?utf-8?B?SjBxc0V3YUlHNGV4YVEvd2xnM0dlSmVpUlYwRTdOWWE3WmUxb0pIMVZOT0VX?=
 =?utf-8?B?WFcwcWFCKys0djd1bkEyUFJhRldIS05XdisvWEJQVmxRYzZidVJJQ0FpVlFa?=
 =?utf-8?B?Nk9IVUw3YTlPWXQ4b1gzZGx6TTJvUGF5UVFTaWp1Zyt1ZFdYTndsMG5ZOTYv?=
 =?utf-8?B?UVgrYWdtQUNvY2syUHB6ZEdpMkgrbWtQVEVnVHN4KzluV2o2UlNXUVRyMDBS?=
 =?utf-8?B?cjlOODFqa3k0ZEtQN1lCamtyaldjZHo5VWJPZjF1SFp2bTdOalZ0MFZwelFp?=
 =?utf-8?B?QTJmOC9vd1kyUEZKUUtJV0hXc0V6TnVOaldDc2FwY1J1N055MUl6alBrVnI4?=
 =?utf-8?B?cE5WSlk1ZEp6QXdQMVVhNVAydHQ5NFExZ3NJdDZwdGVocFEwS0hDSzBtMDJx?=
 =?utf-8?B?emUxL3JtOTFoS2hOS1FUQUJ6OWZuM3lvNXdaQXhHWlo4aWJuN1VHNnNOeHVI?=
 =?utf-8?B?Y1dhcmJ6YURIUkFlc1lEay92ZmY3bHVHaHRid2t6a2JmcGRRZFJQVlIrcUhE?=
 =?utf-8?B?UWZzZnBYbDdVbytzeXZHM2FMTEthWWZtOXJWL3NISitrdkg5QUxSVE9hVGQx?=
 =?utf-8?B?Q3NMcHN6bUR3TUdHamc5VzhEUStJMFJXa1dpbU1ubldBbWhJekdvTlYyMU9P?=
 =?utf-8?B?YXZaNWVzSkNLektjWndaN1RLVmlzVmV0eFIxajlvL0ovTVgyTlZwb1dNK0Rp?=
 =?utf-8?B?L1R1TlY5Q3JUSTRMdEpHeWFrUzFHamZrTXF1aFQ4dlpmZDNlWTBla09weTht?=
 =?utf-8?B?L0tvbnAxZ3BwYWxiOHZQdUoxMFBtT3RBUXUyNi96UnJsN0s1S1RCT3RWMGp0?=
 =?utf-8?B?OXQ2OHNFUW9FWUlnWm5jTnBnZzNCc2gwSktYWERZa3BpaEhNTHJ4Nm51eXU4?=
 =?utf-8?B?QkpEOW1OQUNYcTRyRndNTlNvYUpNUjM2cGxCVjdhNnpNOFpLYU81NTJwNHAz?=
 =?utf-8?B?UFlwMjh5aW0xQ2V3R0xtbVhTNytyb1FZZjFtYjIwSlpNSUJzLzJLN1VWWEdu?=
 =?utf-8?B?Yk1oYTJMRkVCYWxmSExiTVc3R1liMmJwV0QwNVgzcFJ0djhXNWFrNlUyWGt1?=
 =?utf-8?B?UkV5cXJuN1N5NzIyTjdCMFJkb1BuSTRZWEIvY1BSNGtYSGRiR0x2cFhWMVhp?=
 =?utf-8?B?WWlrMm5EN2gyYnBkYmdjSXZ5akJZSFNPdmxjUUpITVdybS8ycWR5SHd1WDQr?=
 =?utf-8?B?UEFIckZkajhtWkYycFVzUE5Ea2cyOGRTeTlNcm1qU0NnRERsdEtVelNsTXNV?=
 =?utf-8?B?bVhNSjV5cElRa0p2bzVKRlNTbk5vRHJuTnh2N05IYWczdG53SzNnTlUrcW9o?=
 =?utf-8?B?STdhWjZ3bmhzTjZqQmNXVXlaaWIveitLTVVEQzJnOFpBbS85dFVsQkphVHhR?=
 =?utf-8?B?SzU2cTM3aVNEamdSWmJVb3R6bTNtOHFpWjVxYkRXb0N0eTJjV3RRaWw5WVJK?=
 =?utf-8?B?QVVSOXN5Y2FEZnNjNVljU2hVV3JmalFBZjhYdTRERUNGcWN2VGpuZUxLc0oz?=
 =?utf-8?B?Z2pUTU01Vm9XZS9OcUp3aFA5NXg0dWsxb0lZdEFwOXpOSHd6ZnpqM0ZqYUVn?=
 =?utf-8?B?ODRsWEVGTmFFSkZoM3lqbCtFZC9oaVIyNTNLamVPRlBaMHRrYTB5TzI2QWMv?=
 =?utf-8?B?dmJNcWo1OEQyR21RMUxLWnN2ZWY3clZkRkJFMWVNVitIVHA5ZldTVG1jUDVu?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 330e4682-5287-442a-92b1-08dd9dc8ee69
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:20:47.6404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXKTtmRIy+JJhSIBIuh5Lu9y8xsMPrV6/5RFB9WxwV5uIy8Ys8Mw47wtJjd9wcKF8wIYzeWTuhyGMgdUx+bT0upy/aWgMra//UOuoGhI2nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8277
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

On Thu, May 22, 2025 at 09:55:15AM +0200, Zbigniew Kempczyński wrote:
> Establishing input and output data looks same in all compute functions.
> Create a functions to avoid code duplication.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c | 110 ++++++++++++++++----------------------------
>  1 file changed, 40 insertions(+), 70 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index d47e2b08ef..06f831f68c 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -122,6 +122,36 @@ static void bo_check_square(float *input, float *output, int size)
>  	}
>  }
>  
> +static float *get_input_data(const struct bo_execenv *execenv,
> +			     const struct user_execenv *user,
> +			     void *data)
> +{
> +	float *input_data;
> +
> +	if (user && user->input_addr) {
> +		input_data = from_user_pointer(user->input_addr);
> +	} else {
> +		input_data = (float *) data;
> +		bo_randomize(input_data, execenv->array_size);
> +	}
> +
> +	return input_data;
> +}
> +
> +static float *get_output_data(const struct bo_execenv *execenv,
> +			      const struct user_execenv *user,
> +			      void *data)
> +{
> +	float *output_data;
> +
> +	if (user && user->output_addr)
> +		output_data = from_user_pointer(user->output_addr);
> +	else
> +		output_data = (float *) data;
> +
> +	return output_data;
> +}
> +
>  static void bo_execenv_create(int fd, struct bo_execenv *execenv,
>  			      struct drm_xe_engine_class_instance *eci,
>  			      struct user_execenv *user)
> @@ -809,20 +839,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
>  			     IS_DG1(devid) ? 0x200 : 0x40, execenv.array_size);
>  
> -	if (user && user->input_addr) {
> -		input_data = from_user_pointer(user->input_addr);
> -	} else {
> -		input_data = (float *) bo_dict[4].data;
> -		srand(time(NULL));
> -
> -		for (int i = 0; i < execenv.array_size; i++)
> -			input_data[i] = rand() / (float)RAND_MAX;
> -	}
> -
> -	if (user && user->output_addr)
> -		output_data = from_user_pointer(user->output_addr);
> -	else
> -		output_data = (float *) bo_dict[5].data;
> +	input_data = get_input_data(&execenv, user, bo_dict[4].data);
> +	output_data = get_output_data(&execenv, user, bo_dict[5].data);
>  
>  	if (IS_DG1(devid))
>  		dg1_compute_exec_compute(bo_dict[6].data,
> @@ -1109,20 +1127,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  				  execenv.array_size);
>  	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
>  
> -	if (user && user->input_addr) {
> -		input_data = from_user_pointer(user->input_addr);
> -	} else {
> -		input_data = (float *) bo_dict[4].data;
> -		srand(time(NULL));
> -
> -		for (int i = 0; i < execenv.array_size; i++)
> -			input_data[i] = rand() / (float)RAND_MAX;
> -	}
> -
> -	if (user && user->output_addr)
> -		output_data = from_user_pointer(user->output_addr);
> -	else
> -		output_data = (float *) bo_dict[5].data;
> +	input_data = get_input_data(&execenv, user, bo_dict[4].data);
> +	output_data = get_output_data(&execenv, user, bo_dict[5].data);
>  
>  	xehp_compute_exec_compute(bo_dict[8].data,
>  				  ADDR_GENERAL_STATE_BASE,
> @@ -1334,20 +1340,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
>  				   execenv.array_size);
>  
> -	if (user && user->input_addr) {
> -		input_data = from_user_pointer(user->input_addr);
> -	} else {
> -		input_data = (float *) bo_dict[2].data;
> -		srand(time(NULL));
> -
> -		for (int i = 0; i < execenv.array_size; i++)
> -			input_data[i] = rand() / (float)RAND_MAX;
> -	}
> -
> -	if (user && user->output_addr)
> -		output_data = from_user_pointer(user->output_addr);
> -	else
> -		output_data = (float *) bo_dict[3].data;
> +	input_data = get_input_data(&execenv, user, bo_dict[2].data);
> +	output_data = get_output_data(&execenv, user, bo_dict[3].data);
>  
>  	xehpc_compute_exec_compute(bo_dict[5].data,
>  				   ADDR_GENERAL_STATE_BASE,
> @@ -1742,20 +1736,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  				   execenv.array_size);
>  	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
>  
> -	if (user && user->input_addr) {
> -		input_data = from_user_pointer(user->input_addr);
> -	} else {
> -		input_data = (float *) bo_dict[4].data;
> -		srand(time(NULL));
> -
> -		for (int i = 0; i < execenv.array_size; i++)
> -			input_data[i] = rand() / (float)RAND_MAX;
> -	}
> -
> -	if (user && user->output_addr)
> -		output_data = from_user_pointer(user->output_addr);
> -	else
> -		output_data = (float *) bo_dict[5].data;
> +	input_data = get_input_data(&execenv, user, bo_dict[4].data);
> +	output_data = get_output_data(&execenv, user, bo_dict[5].data);
>  
>  	xelpg_compute_exec_compute(bo_dict[8].data,
>  				   ADDR_GENERAL_STATE_BASE,
> @@ -1849,20 +1831,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  				   execenv.array_size);
>  	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
>  
> -	if (user && user->input_addr) {
> -		input_data = from_user_pointer(user->input_addr);
> -	} else {
> -		input_data = (float *) bo_dict[4].data;
> -		srand(time(NULL));
> -
> -		for (int i = 0; i < execenv.array_size; i++)
> -			input_data[i] = rand() / (float)RAND_MAX;
> -	}
> -
> -	if (user && user->output_addr)
> -		output_data = from_user_pointer(user->output_addr);
> -	else
> -		output_data = (float *) bo_dict[5].data;
> +	input_data = get_input_data(&execenv, user, bo_dict[4].data);
> +	output_data = get_output_data(&execenv, user, bo_dict[5].data);
>  
>  	xe2lpg_compute_exec_compute(bo_dict[8].data,
>  				    ADDR_GENERAL_STATE_BASE,
> -- 
> 2.43.0
> 
