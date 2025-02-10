Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9452C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 05:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E3B10E173;
	Mon, 10 Feb 2025 05:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UueI+2NU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9444910E173
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 05:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739165924; x=1770701924;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8soTipzCuIgXoccbRb3JZWauaRCLU9pMIhebkr9xLhs=;
 b=UueI+2NU7R/o6JtQajEYnZVhRu869er2xKh5KphCzOzvi38isXHh0bAK
 HWA6dvF15V4EqBR/pAuPkYVw7J0X8fptp2xc8oyrbxvANL9w6oo78hSW1
 LS1fHHYhDlU+jqoVi+q7L56b0etDx+JQwB0MnyL8QDHCrv7M02gGVXpTC
 QETFxDUp++wKQBk7mK93Z0Kb3nOEsZpyxYfwUTa8rZUZqWwTLSXwLtaPx
 NhK3yD1kPFpvXiPRFdZ6rttBb9gGL4DPm3k9bZ8Vp0V4lmIXr3E/InlDc
 9SDFv++cHiohatiCbPSOMY4dLQ1NRz4f1ht+QTNA5oDEumojt5c6yDKtN w==;
X-CSE-ConnectionGUID: OUk3H+qdRoKdZ2j09oQcNA==
X-CSE-MsgGUID: V8mqHnf5Q5ejFJ0ItdufUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50359471"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="50359471"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 21:38:43 -0800
X-CSE-ConnectionGUID: aOqXiNrlSr24bRbUqz1OqA==
X-CSE-MsgGUID: YlG3IovGTYSuuwF3RqoBAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142971250"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 21:38:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 21:38:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 21:38:42 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 21:38:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNw2nYP2Ya70gR/1dbXP6cykr7ZyZykSMbhAo9SFIIdfgJYf8aCwzWA4F7uZb7hrFHYaKUhlNKc9auom3k54W4U3w8lm7T5wt+aYZoRDHW0DbNg3MvzdMv3E9eo+BjY4B8Sqmren7rSp255SgzAoRR6GEjLfbMx/vmlwW4SWW1vRUNVjebM87ORtowLG6I5V/nkWnfLF+AU9gGR3szBG/Cq7HTEDKTICT8OcoYGX66M8RaGsSg/s6A6Xt4BTVdoETnJTv2Bs3aO7P9tVj3u1KlHlgVrBs2/hNugLpiKXvwB+AlU/+5LOe/x8vad2P//ycuCCsIhkI4K38cusM1Hokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLNxYDNBiv51EnEY4tjabWs7KBUK46gJVyRTK/TvLqI=;
 b=NlicldcSDhBGGwXH30K+y8+7mwm0Ypdq0M9o34SEmzwIwzmkgOgOhmiqBdqwoJIUIY0SQA/SMb5VW3sWakgrtAMPVtfQ3qpA3ASjjII88b16oowKgZEsou3IRv49r+hmS/IrtPmiYV7l/yVfGKEHEAcQMyFfZ75zXFpRh4gEz86p+evoDnMq5RLJ+C/yAV0fLjMhF0zzRUs2XKnQqsIV2kP2jScek1EHeYR3RTzyH7wj7Z4jt3ABvTV9pyiZ0N+IJPAa+Zb/eMklcdQwGfdTPsWrmkU73BBGPKPTMkFA9QgezUfPwqquxd5kjVyYSlzMuk8n2jXmp1FkX9t1pEVJ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM6PR11MB4643.namprd11.prod.outlook.com (2603:10b6:5:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 05:38:40 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 05:38:40 +0000
Message-ID: <5580de3a-772e-4d64-be55-661c942197e2@intel.com>
Date: Mon, 10 Feb 2025 11:08:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Require minimum 2 outputs
 for extended mode test
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>
References: <20250210053551.1228000-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250210053551.1228000-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM6PR11MB4643:EE_
X-MS-Office365-Filtering-Correlation-Id: 99100927-3144-4845-a68e-08dd49952c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVNCSzJydzl5dnRGSnFiWXR4U0d6Wk5paUlheGJ2cVNMcmVScDZ4Q3ZGQVJM?=
 =?utf-8?B?SzRQcWxEd1g4UFY2WHNFTkpzbkhFMHpJeldlaDZlVDU4NjVkZ2pXbVMzelIy?=
 =?utf-8?B?OWVSYnp6RUMyYnNFajBHdHlWNjR4TUxhK2FZS2pmaHhCUVlDTGhDSXpvdFJE?=
 =?utf-8?B?TWM0SXAwaUZtaUtJbFNWWWlvanZ5cnRvSFJsUXI5V2pCdjNiK3NMZnJPaDBP?=
 =?utf-8?B?WGhyQ2o0R01Wc2dhUnZyNUxaNU9jSnoxOVZZVFRYU1RMRENUclkwMlVSRG1r?=
 =?utf-8?B?aG1MMkpHTklrZktybGVDMU5ZeFU2V2IvYlBwNGJIS3R1MnhnMmJoY2l2b0xn?=
 =?utf-8?B?amdITkdNYjJ5cGdlTGNrL1ZGV1FwZkJhbmh0djJFTXNHL2V3Sno0UlBJTk52?=
 =?utf-8?B?N2Jrak93Mmo2elYvWEROWEVMR0poYzgrbGhQQkk0bzNpcjNsKy9GWnpaOU1Z?=
 =?utf-8?B?YVhyK2RKTy8xMTcwYXAxc0dlYWlNTVN0UmprcEl0c2VNbG1rbCsrYUxWa1kx?=
 =?utf-8?B?OWdETGxCaCsyb25MOWpOSUFWZUpnMEhLOFFJTDJmSW1jYlpHWG5pajB0NUgr?=
 =?utf-8?B?aVJBVlk0RVZCTkl3Q0dxYU5WTUFpMWx5TkVGSFNMcGxvMkdFSitodlRER1M4?=
 =?utf-8?B?eGVEdmZYUEh4RnVDQlhFYTBMNkdvdTVSRzI3b0hiOXRHYVJvUElaYytldWRz?=
 =?utf-8?B?c3c4VDZydUJUcjQ0TDZlQUNTOVpjV2QzU21LT2t6NVo5VmxVY1Q5dlI4d1o1?=
 =?utf-8?B?Y3U1WHh3K1NlQlZ2ZS9lME1yLytYT0ZjK3R2RXUzT3dwck8rZnpBUmFlTThO?=
 =?utf-8?B?UUhTRHhVTDlqMjRCOENxSnNYajZFVHZXalYvZEF1OUlPa0JYdVc3WG5yd0kv?=
 =?utf-8?B?SHJqMy9mVVBaM3hkelZNY2crZmxvdTErUWJsSFlNLzRSSDByeFM1aTVpK0ZC?=
 =?utf-8?B?TmxZOEFZM2lCSWFVaHJXdjloNlZBSFl0T3dKZnZhUmlORk5TWDdUcEhGS1cy?=
 =?utf-8?B?SHFrL3VHaHgyRHc4K2h6UkU3cDFGeGxiOGxzVWs0T01ySXpYS2t0UUFubVRj?=
 =?utf-8?B?YnJLeFBNU2xLWXV3aW5JQzFjcy96ZnJMNFY4T2RrRitHaUlUZmg5ak0ycjdW?=
 =?utf-8?B?VEVkUm5rdlM1U2RIcG9Lbk42T3I2QmVCNTZrQWNjYkloS2swSFRJLzhRY3hu?=
 =?utf-8?B?UTN5VWpZQkdQb2NQclVMZ1Vyc0FGUW9XS0tzUVRpeDdCams1aWJrT29MMFk0?=
 =?utf-8?B?U09VUG1VR3phMi9pK0YwRW1EZ1N6b1FwL0NoUlNtaXlRRWZuV3hJWEJ4Unls?=
 =?utf-8?B?dzlZS3Q0UjJzSEpxSUd5WkE1NkU5MFpqdGJPMm9CZWRZTWZXQTRLUGM2dkNV?=
 =?utf-8?B?MWdoKzZIQk9KcGw2S0VXbTV5cjRxekluOUxqQXNHcmpDYUNSemhmcllMaWNO?=
 =?utf-8?B?cnJDWkFoOTdGei9CejBITTN3ckdxVTBHRldyV3NETks4bTB4WDFGTC9HT1Y4?=
 =?utf-8?B?Tm5rUFRBWW9wL0MrSy9YeEhrcFdJZWdCR1paVnFtNnF3L1JlenphUEdoWXpF?=
 =?utf-8?B?MzFxT0ZjZ0tGcmljNGMxNnFUMExCazQxZUp2ejFnUVFvblg0S0lMbTNNZXBk?=
 =?utf-8?B?eFAydEFhTlF1aS9Ua3hiVE1qRlpYWXRiMUhRbTZyUlIrMVRPUXRnSVN6MVIy?=
 =?utf-8?B?RlRXZEEvV1pKc1dzaGhENnpJWGFHVWRUcTlpVHNibVJ5VVkzSjVHbnR5STNG?=
 =?utf-8?B?eU9wL3JPRUlhdFhKRzN3L29vVEpZeTFSeHJ0WHY0emVwbzljOWI1V2ZFMFAz?=
 =?utf-8?B?d2hKd21wS21CdDFsYW14YXNxSXpZUWt4bUdtRThodlFnUmk3N3dQNGMzOVZG?=
 =?utf-8?Q?ipRa7vH/6VzIq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVBrdXF2NWtzVjRiQWRxR3AraUt6WXh6SjNSUmRQUjdwWENhaEhEcDZ5NUhK?=
 =?utf-8?B?Mmp2V2JRcS9yQmg3Zk9YZUhJcFZ3VUpZd0JDR0Q0ZjBGRjUza1lOSjAyNDdI?=
 =?utf-8?B?Zi9vb2o4ZEpTWlc5UXd6STdkVTNlRVc2c2w0OUkycEh2MUsxeDd1dnc1M24y?=
 =?utf-8?B?TWZmQ2RRTVViMHBERCtBREZBR3hkRVYvN2JiNFdwUkxNUk9XVUVYNy9QRGoz?=
 =?utf-8?B?WVQxTHVmVUc1NmhSakdoMEcvVUdpVWZWS2FQSXE4RU85N291SFpqQlVBMWl6?=
 =?utf-8?B?N0F3TGdSVldpcHhZRzZLSnQwSEJnY0s0bkFhODMwRWNnMW92dkNYNFRhRmdQ?=
 =?utf-8?B?bldVRTYzd0FWNkpWZkE2SGRWQk1reWRYZk5QQnEwV1h3bVZCZGZNeS8reThR?=
 =?utf-8?B?MnBJRGFwNjhRL3Z2NTQ1ZUNGUk5XNVNLc1E3ZUNkbXl4aDN6c05aNGl4bkVC?=
 =?utf-8?B?T3JZb2hEQlZITzFPb0lpQkU3eWg5NmJPS2MwZUZsYUtKcy9yYWF5WmNnZmt0?=
 =?utf-8?B?WC9wN3diS3pYRjVJQW1XMUhmSU9EVnRwR3lIZkxmMzI4dE56ektBbTBaU29V?=
 =?utf-8?B?M3NGY1dTNlpaVlg2ajdMd0VxM1ZpNWhzV0c1RnZvWlJkRjdHSEdHblByTy9z?=
 =?utf-8?B?QVZiUGFlL0IreklldWVTd2JYTHVmWVhicUV2S3didVZaeDVybmpSdGNqc1Bm?=
 =?utf-8?B?c2daUWUvYlJDTEw0VUtoTU5wRkNuMTZOWWc5YUNmSmdkdzdFK0xkSUNhTWRR?=
 =?utf-8?B?YTlNK1RzSFZHQUxlOEZ4ZktTbithejlkUkFhdVg2R2lxTmNlK0JXV1JUMzlm?=
 =?utf-8?B?R09WRkpYV0FNclNpdWNLaGtmSm5XUHd3OTZ3TzFrcm1YVUVOZnRFOCtPRTIr?=
 =?utf-8?B?YnBpZEtjZGJaM1ZZUFM1V1ozbUpEckNNS3BFa3I3cDc3T0xGSkVGUVlrM0o4?=
 =?utf-8?B?M0NvUTE2N01KcG5mVERFcnI3V21PTkVxSGFwWHVIRmdpbVhxMi9XcWxieVF5?=
 =?utf-8?B?SzlLZ0FZUTc0SUhRbmhHaXpuaWZBWFFuV1JlREVWNmQwaHdqU3JLa1FGa0p2?=
 =?utf-8?B?dzlRRVhGcndWbG5KN3prekFkVGhJVUVHNGJ1Q3JGbkd0cVBVSWljQmRTcmV2?=
 =?utf-8?B?M1BrUjJVeTJBNTZselFrQWVkajhsOUs5cVBhbHl6MFRMKzJWaUlYVWh0QURr?=
 =?utf-8?B?aW1jazcwd25CTjJXa3BzUE5ONC9INWVBWGZVTXhudXJLaStjL3d4ME5TR1la?=
 =?utf-8?B?NkNqaFZQYXF6SkRJZVpWN2x3Q2hFY2NHdDlKd3RSbis4TkEzVVF5a0hQWkw0?=
 =?utf-8?B?WnhMUkR0d0NsQVpHdUJnaEFCbnlHQ0M5Q0RMakY3bmQrOHFIUEhIUUdNNzBN?=
 =?utf-8?B?QWQrSGtKaHdzS1ptcmNDQ3BsajhXTkdDNUZKeDNTQi92TWtNdUpNRnJjeDBs?=
 =?utf-8?B?SEJGdU8rRDNYQmNmVHJnaUY0VWRrRExMT2xyeTJhUVgxbTdIM3N5bkplL0tG?=
 =?utf-8?B?VFZucFJMa25JeTFSSFo1SUgyV29OemhvbURKYk1mcXFVdFkyT3ZVdWtydWM1?=
 =?utf-8?B?citjT2MxOTZFd08vYzdJL1BoakFqUWFXT0RXbUcvZHRkQXhwV2FDOEtxVGpw?=
 =?utf-8?B?SVNTbWsvNWhqeW1oaWlRKzF4WlhtclBSM1ZveXpiVTVKamswbGFFNlN0MkY5?=
 =?utf-8?B?VDgvQ3FTL01qamsxV3N0ZTZJRlh2RGNxYnEwU1U4T3RUSFVjWHBoREI0SS9y?=
 =?utf-8?B?VjJQQUJKVjk5c2ZQemNJdytBc2ZsQzdzUFhTSEZneUhQblc1Qi9GMzg5K2tj?=
 =?utf-8?B?bERpNlJnZ001T1IvTGhybGMrMnhiTE9ldDhlOG01QjN4V2x3U0lkZkdOZWVw?=
 =?utf-8?B?cm9KaTdOM3NsK1dCNnV0WDlidXNBSEVwV0tiUWJxWEhvenFUeVZxeVRTN3oy?=
 =?utf-8?B?cXY5VGZ5cjA5REZ6QmxQSVNGVzVKUkFBYTRtUUxyTnlqeGl6OFU5dGtEYkFJ?=
 =?utf-8?B?a1U4OU9RTXBBUmE4ZEVPN0xBa25qcTBPeEFwazVkZSs3QnNxUXRQVldIM3dX?=
 =?utf-8?B?OVo2ZWhPZDAraTQ4VEFlQ1VwYy9lWlIvRlJ3d1BZOUZmWjA4QnhBS1dqUW9L?=
 =?utf-8?B?d3dVZEtMVnhVK29xL0FyUG9PVmZXTzR3RDFsUGcva0RwUVZwM1RFOFU2VTU1?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99100927-3144-4845-a68e-08dd49952c6c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 05:38:40.4216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6eBRDbg+09+1DOTjwpv0JXmWwuRI9O7earFMiaZlAHMMOiVm95PB2fzaBWv9rNrsjluSAi2EIfoz+xevnAW8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4643
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

Hi Jeevan,

Please make subject as

"[PATCH i-g-t] tests/kms_display_modes: Add check for ≥2 outputs in 
extended mode test"

On 10-02-2025 11:05 am, Jeevan B wrote:
> extended mode test needs minimum 2 display to run, so add igt_require
Also, start description with caps.
> to check if the required criteria is met or not.
>
> v2: Fix commit message.
> v3: Update subject.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index e41c60cc0..117f82325 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -335,8 +335,10 @@ igt_main
>   	}
>   
>   	igt_describe("Test for validating display extended mode with a pair of connected displays");
> -	igt_subtest_with_dynamic("extended-mode-basic")
> +	igt_subtest_with_dynamic("extended-mode-basic") {
> +		igt_require_f(count > 1, "Minimum 2 outputs are required\n");
>   		run_extendedmode_test(&data);
> +	}
>   
>   	igt_describe("Negative test for validating display extended mode with a pair of connected "
>   		     "2k-4k or 4k-4k displays");
