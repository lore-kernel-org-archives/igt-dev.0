Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED87BC28B30
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 12:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A084B10E9FA;
	Fri, 14 Mar 2025 12:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EluBp9iY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E03C10EA08
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741955656; x=1773491656;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zMpIR61vnpr5cHNBkgJQlWy/xOtMjee9QHcBmGXknO0=;
 b=EluBp9iYv0rteWhKb2R3gaQjNPw5fMCPBhIw2cROSf1F8etBDWpGA1VM
 xe2xp6ZsKlf56YfHLc+sUakROJ8uid5YHRtecqmmCgDV+Jq+h6pE/IoO3
 ycxYxLuIKCBsezqs5mt5zoTok/92vfabrRqLdbLq8zSBcWZTiPCn8ITsU
 r1Q3vNTnUEnbT71oxmxqcSMt9vGgnwc9691NOm9QN2USZlFQMSrqYH222
 J0cehqfCcF2FsPGg+A27ciGSkruM1vM4QtzN/S59EcJe2JFbByOAnYsZB
 i1+ScePy+O/az6163yek8hKLyofI/6oTM2ZRcsC+O5ZgDF2ZYwz88fbva g==;
X-CSE-ConnectionGUID: QZOZvCvhQLW1nFVL4buK1A==
X-CSE-MsgGUID: /uajcJDkT9SX6lYxAL3Zjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46752762"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="46752762"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 05:34:15 -0700
X-CSE-ConnectionGUID: AFLPDSXTTruVSg5AljZ5ew==
X-CSE-MsgGUID: gW8M0Ri3S3a5J6+oF3F9KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121764349"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2025 05:34:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Mar 2025 05:34:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 05:34:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 05:34:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJ7kUHB5VdVjr2AJ2VM2Q0R9sygesaBI0TpMBbyc7oxQIb2Qkv1nBpSPh1oGZ50j8sMQKNl9VDwRRsd/u5KJCB9KuFl9eKlbdg9qpoJBy6fujkgmhIbUxIewfjjrsS/TFEhJy3pIoKNsJCsDBUkCEW1hJs4cMq1/3toxBlM8D2s2wDvFjnYymKR957HeBBgwHTSq8X82o1Zyl91nPa4WiBwjEwO2yxibzlPDWpLZHcQ0Fk+tvUApAb/6T9tAsEtp/rlMGV8xu+g2VZIn1QDdkP7tr0xzPNDNGciV4GV8HLkScnA5fjO7hjjEK6dG1h/q98sac798aQLevknQdFcxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=387Y9Xkm9L6K//uME8GhQbl1y3JPC0ZpSGREoEEaIa4=;
 b=nvaExwIcCR73n1urCqwKIQPjJDQaSJf6nEHXpiBC2ekbj8U5gcmlgtZ1ghdm02r6hIpgTlIKJfW1+MXC4GVsgHRbm/XoGbFfGpvzvDHGUZYgGYTCg5e41NJzOQVn+bJUWoKHVu7p9syPL9gHxxJLr+1tJU+pfOCP5RWzoc2b8jEUfv1KqFOWCe1z1lw1ILabHs6vQ1a4qosSt1sdUoK57zq5foIRv5RXJ7Xg4vT8H+apIoZYEY79FtkDftmhD/wHrdgfPenXRRGPcA38DIoEknjxywWJE+LCoJJdXFNvdsB2UF6xQaB94/3dEsDHPSaqeyDM1B9guYkxoX0451+egA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 12:34:12 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 12:34:12 +0000
Message-ID: <0b46c164-bc94-46ce-a6be-50c18d95a718@intel.com>
Date: Fri, 14 Mar 2025 18:04:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_color: Enable ctm-limited-range subtest
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250214161011.363157-1-swati2.sharma@intel.com>
 <Z699roJnvD0kO4Ne@intel.com> <7f66b930-2061-4204-934c-fee454992ae9@intel.com>
 <Z6-v-I4F2Os8vXCa@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <Z6-v-I4F2Os8vXCa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS0PR11MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 610834a6-c256-4ab2-0362-08dd62f48643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUJiRFlpdGYrdERycG1OdHZIWVE4R0lrdWlLaktjTVNhVEFFNmVwZEN0ckxG?=
 =?utf-8?B?WjBZWDY1THNXeUcyVmJHSGJBbW9oTWV6YmowZkRmNDl1MUJ1RnQ5VEpyK0x4?=
 =?utf-8?B?WWZsdDd3NVNHdTlsMWFSTWdmcks2WCtFN2J4RkMvQlFwRzF1WUpLRjJxa3FZ?=
 =?utf-8?B?MzZYdG5tQWFkaDNhTVo1dUtvWmw3a2V4MXdDbC9iSXBDeWVtZU1Dd2t6TmEw?=
 =?utf-8?B?ZEtjRXhMRzl1NmV1NVorUWxyck5leFl0Zm1qelFDYXFlM0ZwaEpsNjVuTTRO?=
 =?utf-8?B?RGhWRVlWUGdEazhVTEczMFlrdXlCUmpINEw0WHFtQUZvYjc0Tjk0bmdiYlFG?=
 =?utf-8?B?ZHlLUG0wOUJVRVVqQXdWSExuQmYyYnJkZFkwbTJLTkpVTG1zSnZlNm4rVXBG?=
 =?utf-8?B?dUhyQWF4ZGNyUjFMMEFNb2xiaWVvRmJqRDBwSmY1Vk1MbEdWaWZQMjBxWmxK?=
 =?utf-8?B?YlF3bE5KallXYUlBZEJUT2g1b2FDcU96eTJJTmF6NDBTd1l2SzZ5eTd4MEFT?=
 =?utf-8?B?NlprZWRtaXdFMzhKSiswNjJDNzl6Z3BoME1qbVJ5cFhPMTZRdjBaQzVoUEZZ?=
 =?utf-8?B?bmdRajd3TmJvOS9mdkhUTGhCVGZZNytieVZxcU1LR0lWY3JaTE1nbmhhdVdr?=
 =?utf-8?B?NitkdG50aGt6T0dBb244RXJUMU5NbWdQb1NTVnd6bEFiTWRLdHYwTWliRE1u?=
 =?utf-8?B?OFhWRnpUSUJCN3FOaEhsdTNQN1Z2TnlOVTQ0L2FwSDZOZ0hUUms2WkpjSnpU?=
 =?utf-8?B?ZHk1NytZeWNqaGVpRWRFU3piMXZoZ2EvVTNGczIvM2lEV1hmNkNaNDA2cTRP?=
 =?utf-8?B?YXNicnRDVUZnYWVDejNxZk13SzVhNUVjY05FSGtMSFNTeTdlbENvVUNLMDdV?=
 =?utf-8?B?QlpJQVBoUm5zUHVGcWlVTmZYTU81RjFmcHpXcVVXRFZEOXpMOFJpcG9jcDRk?=
 =?utf-8?B?bkRQUHlXUE83UXlzSnBNb3VaTVRFbUJlOEtrd0ppZjhoRkYzRkxIK1QrKzdF?=
 =?utf-8?B?RXlOUHZuZzZkWkhIakV4ZzV4VjlZdzhiTDRoWE9PbnIvby9nUENqU2cxVkdT?=
 =?utf-8?B?RkpiWng2Z1FMNm1QMDR0NytoVTZ0LzNBTTM0WHNXMFIweW45TGxublJ2TUpS?=
 =?utf-8?B?MkJxd1FQUi9mMnZndnF1aU81dlhPcVIzd2k2YjVMeU5QUEN5WTJjT1pTTUtw?=
 =?utf-8?B?OXE4NkRqcXRHZEdIR2E4dDlkN0lHa1JLak9hbkY1Z3Fabnplb0hxc2gvWmZo?=
 =?utf-8?B?aktsa1BvejNWNllRNzhuM1dNeGZRUzJ5NDg1bTZDTkt6WlZNV1NKbzNlazZs?=
 =?utf-8?B?dDdVRzV0Si9NY0ZWUzFXeE5henBDKzR4eTdVZng0RnRkeDNIZnRKZFBQVzM2?=
 =?utf-8?B?R2k3UitBMTdEbGxQOSs4RlgwWi9wTHRCSHNUK1Fab2RzRkdlRlFTOU9La0hw?=
 =?utf-8?B?bnVrVzZqeVoycnZ6cy9pWDdkSHQ4Ui9tL1pab1FoeUVHRUZKRnpoRTlNL1Fv?=
 =?utf-8?B?cnVOSjF6OE96MGsyZ2c3bGx1ZWhac2dwT0NFUFNUdHh0dExBZUNqSnJhSW83?=
 =?utf-8?B?NEtKZmlWeEJoK3pkTjJqMWFHZ0UzV2pkQWNHZzl6dXlFQzZDdUZia2c0YW9t?=
 =?utf-8?B?UGJDQ2xFOEd5dUQ5U3V6NGtDdEdaNUpIZWdPS3hua0JVZDMvTTJzL0l2MUFX?=
 =?utf-8?B?bXVyaG1LSnorM005dWQvRWtnTi8wTEEyS1Y2NzdORjJObXRzSEozbi8yZW9z?=
 =?utf-8?B?NWxEU2R6N3pTd2h6dXJ3d0U2Nm1PRm40MzQxSnFWUEZVV0VDY0t1WUlDekdU?=
 =?utf-8?B?cnZqNXJIYytYZDcvaXNmR01lbzZSMUtnMnFwQldlY1VvbXhUNmpjbjhSb1Bk?=
 =?utf-8?Q?g8HmfiUW4Xihp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFk3cGlYMllWTXJkd2hncGphekQyVlVmNWpEd1BjeEFkSTBBdEI2ci9BaEVC?=
 =?utf-8?B?cFpERWllUFZZcEl1NVFXS05rWmg1bm9OL1VhbHpYRXQ1WldMU2czSmUrbVQw?=
 =?utf-8?B?U3k1QURBSFcxdXB4bG9wWDdZMU5MRVZJU3FTb1ladkJRSlhiVm5UTC81Znls?=
 =?utf-8?B?L0Y5cEU2UE5OeU5YR2VlTU1rTXBEQWhUOHdDZTdEV1RRUVFNMyt0UlJnVy95?=
 =?utf-8?B?UGhSUFloZTZsSnBSUENNOWNTV1JZakcvRkQ4dTNGVnhiSHdteXV3QmV5cG1B?=
 =?utf-8?B?UThaN2ZaZEgzS0tKWGR3MUpEUU1NMjUrSUc2bGNBbHZ2VDNFWXhUcmFEakdT?=
 =?utf-8?B?alhITEpGeEJJWjZIbWg3blVvaUNGRXBEdmFCa2xkOHhpM1dIMDdGYk5PSXZz?=
 =?utf-8?B?T0o5bzh6SkMyK1dwY3FzbTIwY3V5SU9LNkY3ZkNLMk8xK1NONHZjeFZYSnkr?=
 =?utf-8?B?aFh0TkN6eWFEMHN6MERVWmp6SzdqcllLOVN2SXArVlg3SzR5amNDdmh2M2gz?=
 =?utf-8?B?TFdBRmNwQ3IzNEFPcUIwbUF0LzNiZEp6TUVjM2tGQkpMVzB3eHUva3luWGRy?=
 =?utf-8?B?Rjg2WERBbCthcEFBRC9vOFp3K2cyOE0yN0s5TlU5TllJbWVjb2UyN0Z4dDlu?=
 =?utf-8?B?TjYrYlNXRUMwR1VEMjluR1hiWE55S1I0YWJZS0FObXRlWXhQblRVRCtRT0Vr?=
 =?utf-8?B?OVorTk04VzhlemhLSkE3eGRhVEZ5L3FocEdXRE9SSUxCbTFhaEd2VStZYnhQ?=
 =?utf-8?B?UmplS21iajUzMCs4YXNlOUVFVm1RbkxKK2ZTWDJTeWlaU0hBTXZBcU9WVDNl?=
 =?utf-8?B?clVsV3RjY2toRXNtRVZQVUVCZnpsc1B3dGtOMW96eHFNWnJUaHRrdnZhQkRF?=
 =?utf-8?B?UFBtbFErNENJOGg2Nllhdks1Z0ZSVnJHT1dCUTRJbjRWT2JWT1VZRVVkMHBJ?=
 =?utf-8?B?dWRiTTBHSkg5UUEzbHJWeGFybkZ0T1VjVUN6eFZrQVNuNXQyVmlLMkpiTEN3?=
 =?utf-8?B?L3BqK3p3aG40UmdleEh2VXF2aWNDN29TbCsrdTA3azZQVWN5c2c5aE5GV05J?=
 =?utf-8?B?VTArb0hFV3E4aTV1MjYrSUdWK2doK2ZlN040azB1SkFFMC8zNStoZ0Y0cWgw?=
 =?utf-8?B?dkxQbjFoVzdRRkQxWE1KUHNiOXM3SWhpZEpUTGs1U0RQeTFtQ0dZL3l0R0ND?=
 =?utf-8?B?cDFvR0RFdlNuYWh5RTF5c1ZEcVF1MGZPWU43R3RLRzFIRnBXcjl4TUFJeEtn?=
 =?utf-8?B?cUMzUE50WGR1R0JiaVNYeitBSmhuTU5xTmpLOVNqanltMDFVZFZzNkY3akpm?=
 =?utf-8?B?OHF1b0VEQW9PSzBmdTZjUExZMkpkakFsV1d5b2FNQVZFandQOWZ3eTN2YTBn?=
 =?utf-8?B?MURObFk0d1NFNENiMkRwR0VIbTEvK2RrVEhEYlQ4eEdzcjZtN2FaUW53N2hn?=
 =?utf-8?B?UkFoWHIrYWVLekF5eHBZclJNKzNnZWs5U3VGR253TTlFTkszRmYrcHNEd25X?=
 =?utf-8?B?c2FpdVVhRUVCRDBod241U25YcHl5MVh1dDZOd0lJWk5yTFZnWHI4TE1JdVJV?=
 =?utf-8?B?NmR6QTZWNmVTNzlsaFlhU0tMaDdFNDBRTHgzcFV6Mm5SbkhIb0xubVBETkRL?=
 =?utf-8?B?ejZjSkdmdkE2RFY1MXR0MlRlZUZpUzRjOWFTeW04RDE4ZUllMEQxdnJOMTBm?=
 =?utf-8?B?YlcydHJldW5QVjF3Z29ZKzVKNkFRcEp3cGtIWmhYd0grQld5VnR1cXFqRWFR?=
 =?utf-8?B?cWF2TzU1RXJIcmh5VVNBeG9DSnNSa2NoeExWL2xldDdPUHRqM1l5N3hiK2FT?=
 =?utf-8?B?RmphQXZkSmJYQWR5YnQ5OXhScWllRTdQZDZ5d3N6anhMVHFUTVF3YStqemdu?=
 =?utf-8?B?eGNzTUJNd2twSUVpemhOZzl0anVaRHVkNzRFTFdpV09vcGwvSVJ2Y1d6Ymp4?=
 =?utf-8?B?VElCMUJrZFc3WU9qRUcvQWc3MjZDckQ2bTNmRno1ZW1LeTN2QUdrTm5UaWh3?=
 =?utf-8?B?U1BGK1kwTDRCRjF3MVhGUUpidFBZNFUyYkt5NkxNeUlST2lneE9HWk1mQjk2?=
 =?utf-8?B?QmZDdDdaNXRUdStGQytzdnArUUFUNnNrdE5JVGVEaVVvVEFjejZCZG9SWTZl?=
 =?utf-8?B?YkVvWFdoalgxYkxGNUNScUZUUmhuM1UxTTR4KzhlTWdmeVFPb25tYk9vd2xR?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 610834a6-c256-4ab2-0362-08dd62f48643
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 12:34:12.5389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7jX5m24gMErN/NLisQ+yUlOFcWEk8VBMBCJzPFy1g6DEwy9s3A7slaEz0T4CBvtnsmnHN+SQu7ngP2oAtJ9fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
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

Hi Ville,

On 15-02-2025 02:34 am, Ville Syrjälä wrote:
> On Fri, Feb 14, 2025 at 11:56:27PM +0530, Sharma, Swati2 wrote:
>> Hi Ville,
>>
>> On 14-02-2025 11:00 pm, Ville Syrjälä wrote:
>>> On Fri, Feb 14, 2025 at 09:40:11PM +0530, Swati Sharma wrote:
>>>> This tests is currently disabled since CRC computed on Intel
>>>> hardware seems to include data on the lower bits, this is
>>>> preventing us to CRC checks.
>>>>
>>>> Let's try to enable it back and check behavior on newer Intel
>>>> platforms.
>>>>
>>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>>> ---
>>>>    tests/kms_color.c | 166 ++++++++++++++++++++++++++--------------------
>>>>    1 file changed, 93 insertions(+), 73 deletions(-)
>>>>
>>>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>>>> index 4b71d3dd3..c3b285b4e 100644
>>>> --- a/tests/kms_color.c
>>>> +++ b/tests/kms_color.c
>>>> @@ -58,6 +58,7 @@
>>>>     * @0-75:           for 0.75 transparency
>>>>     * @blue-to-red:    from blue to red
>>>>     * @green-to-red:   from green to red
>>>> + * @limited-range:  with identity matrix
>>>>     * @max:            for maximum transparency
>>>>     * @negative:       for negative transparency
>>>>     * @red-to-blue:    from red to blue
>>>> @@ -623,107 +624,97 @@ static bool test_pipe_ctm(data_t *data,
>>>>     * This test is currently disabled as the CRC computed on Intel hardware seems
>>>>     * to include data on the lower bits, this is preventing us to CRC checks.
>>>>     */
>>>> -#if 0
>>>> -static void test_pipe_limited_range_ctm(data_t *data,
>>>> +static bool test_pipe_limited_range_ctm(data_t *data,
>>>>    					igt_plane_t *primary)
>>>>    {
>>>>    	double limited_result = 235.0 / 255.0;
>>>> -	static const color_t red_green_blue_limited[] = {
>>>> +	color_t red_green_blue_limited[] = {
>>>>    		{ limited_result, 0.0, 0.0 },
>>>>    		{ 0.0, limited_result, 0.0 },
>>>> -		{ 0.0, 0.0, limited_result },
>>>> +		{ 0.0, 0.0, limited_result }
>>>>    	};
>>> This whole thing is fundementally broken. We can't generate
>>> limited range output without using the CSC post offsets,
>>> which are not exposed via the current CTM uapi.
>> We do have its equivalent test in kms_color_chamelium
>> and it seems its passing
>> https://gfx-ci.igk.intel.com/cibuglog-ng/results/all?query_key=af49bc8e4e7d1c69ce04f9a1196c167456e8344a
>> Is it wrong?
> Hmm. Looks like the test has nothing really to do with the
> CTM (despite the name), and instead if just uses identity CTM
> and puts the limited range equivalent data directly into the
> fb. So I guess technically it could sort of work.
>
> For the chamelium version the port will chop off the extra
> low bits so I guess that explains why it works.
I recently dumped port images of this test on chamelium. Since this test
is consistently passing on BMG; however failing on PTL.

What i observed is

/tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-A-DP-1-capture-ece4-ece4-ece4-ece4.png
/tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-A-DP-1-reference-0000-0000-0000-0000.png
/tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-B-DP-1-capture-ece4-ece4-ece4-ece4.png
/tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-B-DP-1-reference-0000-0000-0000-0000.png
/tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-C-DP-1-capture-ece4-ece4-ece4-ece4.png
/tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-C-DP-1-reference-0000-0000-0000-0000.png
/tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-D-DP-1-capture-ece4-ece4-ece4-ece4.png
/tmp/frame-kms_chamelium_color-ctm-limited-range-pipe-D-DP-1-reference-0000-0000-0000-0000.png

CRC of reference and captured images are not same. Ref is all black. But 
still test is passing :/
Is test broken even for chamelium?
>
> The crc version is more tricky:
> - g4x presuambly won't work because the port color range
>    bit won't affect the pipe crc
> - ilk-ivb/vlv/chv won't work because TRANSCONF_COLOR_RANGE_SELECT
>    doesn't seem to affect the pipe crc either
> - icl+ uses the output csc for the limited range conversion
>    so the gamma LUT lsb chopping doesn't do anything, so we may
>    get some differences in the low bits
> - hsw-glk maybe could work if we do enable CTM+gamma since then
>    we'll end up doing the limited range adjustment on the gamma LUT
>    and thus it can chop off the low bits. If we didn't enable
>    both CTM and gamma then the limited range conversion would be
>    done on the pipe CSC and thus it would behave exactly like icl+.
>

