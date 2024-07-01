Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAA8C3065A
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 18:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7139210E1E5;
	Mon,  1 Jul 2024 18:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETAFIrcM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C400910E061
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 18:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719858396; x=1751394396;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vOErGfY8mgRCzcRUQuIhJf93xDeznmqMdIA6DcW92Is=;
 b=ETAFIrcM472E1bCJX4I0Wr+5dEGKgV5JcHjMiYtRPpnlFFWuMUiakVqi
 jMvgZi8m47B5gaKpm/z5ZIGxfcLNw0wwCjihDyaZoLAHXwg9+leYYpc5b
 qQiEllZoRCC9dj1lfL+EIl/5Q9fPOQkhWSLnfX153sW+LWVqUOcasWBYz
 HSdQtiXB3Tl3Lv7mSg+m2QJ5+T17iWx+Nc8+l90BVrXYDQ0P2bwPQlVbH
 NUcNkqbd4uTeprq2ZhUSxAhNqWXh0Lt+D+kSsuAAv3mg6Y/RY6WMgJeO6
 NZR24LDrC/h0EePoEyvtcMFX4wLb/UdEecUA2UocFlNzpGUf7weS5hmX3 Q==;
X-CSE-ConnectionGUID: w6F3IrnaQ/uSK4HJoJP92Q==
X-CSE-MsgGUID: N+34iQmUSi+EOqngKks8eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="34449081"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="34449081"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 11:26:36 -0700
X-CSE-ConnectionGUID: vZQ0v9mJRuKlTtzph1ew1g==
X-CSE-MsgGUID: BqiFrPvbTjSilxZybfplfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="45512034"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 11:26:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 11:26:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 11:26:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 11:26:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 11:26:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTI1XvA6dcQaMK9X8NAaTD5oLLV07mo7pVFf7ox/3pIPjNN8Vmvrq+gJzGUSn5vtDG2RJUtHJ1EkpN4n75zG9dnPbkAzkdGCsn4+F5huUEUYVhbuoxxw6oxRelO2y7bln0gA+nH8G3/gtVy6TjyXh/0fgg7BpNX9u5gXu3xB4UsdMQlE7JW39fBgKmN73X45XcBCica+ozmEdXxPJ2wJgkh/1UvkFaqw9fXPFYY2Qj2VMttbgcBCgc18TlqkhUNzYuOqOQWztSbVRpBQZ8eLddy6Pktxn9TdoVaOkP61S11JkzCPMVbJt7d94FzDLDIrIyTLg5PI+K5TlwoALKcrPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoZl2v5y3Di69oVzpIoE1AXif3JY+vkEdCEwU2/YuOY=;
 b=crTb2SyUDfqraDItWcUUvvfxbJfYkpD+4u9hUtPG4tfOTatHtGnxmUjgvfekiS/Clw904qvFU3XmRxYhvCAHFfwJsCROumFPmUWk+faRE5bf+qKlCScN/SJbtYBQTt5FJTRiblCKK7aOU040F9O/8YQfToUszrm0FWFpfUCHxZ8v/a6TmvHN3NpZSmyvg+CVzio+9KKAB4mFccDWREPJ2g/yo2tsAtPrSgxyRA/rz0pKhUhGZIWZM4nlBK405TksQAvctYBJWkKizhPWl4mrJRUf+gw9WUc5AS2P77BHqCtt1gcqxfw1gqVZvoKxumgZCs1T3mUj/GNG6IE6ZHsEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Mon, 1 Jul
 2024 18:26:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 18:26:30 +0000
Date: Mon, 1 Jul 2024 11:26:27 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/8] tests/intel/xe_drm_fdinfo: Add single engine
 tests
Message-ID: <ZoL009g5Pd+J8XDw@orsosgc001>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
 <20240621230102.238397-5-umesh.nerlige.ramappa@intel.com>
 <hbv7noflzphd4rlkfqbpqfwqaygqfezuavd7p7ovddvm3y4vl5@445l423pjo3n>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <hbv7noflzphd4rlkfqbpqfwqaygqfezuavd7p7ovddvm3y4vl5@445l423pjo3n>
X-ClientProxiedBy: MW4PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:303:8c::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN2PR11MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa51a78-81db-44bb-d075-08dc99fb541f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rlh1WFUzZUFmb09lZ2N4cUlhWmRvMjNLbTlUcjcwL00vL2NSUVMxRmxJTkRX?=
 =?utf-8?B?VXNNTlgvOGl0VGZpbFV5RjZ4NnZyZVh2aVpvaVUvNjMxQ3V3cUpGb2RKd2hQ?=
 =?utf-8?B?WnJWRmRFcGY5NVI5S2ZiWUh1RzFvemxHdkxrK0MzS1U2ZEozZkYwUVNhcGVH?=
 =?utf-8?B?S2pZTWFXTSthOEJicFgzek1oZFI5U3B6dytPcTZLMjlWVWpBMkE3UUZhdFFL?=
 =?utf-8?B?Y1dFMlBIV3Jxc3ZiWlNGL05wVmJxVS92cmZpNkE1Qk9pd0F3YkhuM2I0Y2tE?=
 =?utf-8?B?M3hKV1RPTUhjOU5YUG56RXIzVlNMRktwUGc5VFZ6V1cxU3RHOVNMN1FaRUNn?=
 =?utf-8?B?MWJPRWU0Y2h2cVZJT2h1dVZTOFNTNEp5d2Zndkt0bWM5Ui9OZ1plck1mV1Bs?=
 =?utf-8?B?b2lOK21aZ2hpNWZjRU1reDhva0QwOHhiRzVGeHl2VDIzaG9Ta3gxQkVLbXo4?=
 =?utf-8?B?MkpDYzhLcWNPNU1kOEs2UzFadGhhUFkyK0xScCtWWEFXY2pWMnFFaVVucmI1?=
 =?utf-8?B?am92clMxTWxhM0pEV2hNdVEzTDdEVDdpWXozSGxqUFRiSXhMUGk4VWlKbjVV?=
 =?utf-8?B?SEtPQ3IxRkROZmpsZkhFWHBUZGxOWW1lazNPbzhhT2lJS0N0cUxmRStndkVm?=
 =?utf-8?B?MHJVUUhaTU5ycFo3MzVlK0h0Vzg4cS9rdTdnckV2YzU1RDZqVndVWVhDVHp5?=
 =?utf-8?B?cGVaTk12eE1LK3owcnVyaFlxVHd1MmJLYm53bU1odDcvSE5PL3FJaEZldk9U?=
 =?utf-8?B?VzFZRHVCcWE0NzJOa0ZIZ3QxM0pwRUVNd2NML3JzUnhBMk5UT1hjQ2RlUkNm?=
 =?utf-8?B?S0pOc283VFVOZm5nWFMwL0sydzVwVGFlamw2MlZVL2gyRWE1UmYvU1FqUkU5?=
 =?utf-8?B?MVh5Q3l4SEQ3a09ERjVtR0w2aGRDbjN1T3pZem83NDI1RnRidE1VZ0Y3cDlW?=
 =?utf-8?B?SVlQdys4dVRUSzBKVGVWUjVNUUN4L2QzTWJZdEp1MlRRTlZuTzFZLzI5VFNs?=
 =?utf-8?B?YXVlNDZXa1F5dnpSdVN0QlRnL3lGdFJXTTNyMHl4blFBUnZoZ3hXdFpiVks1?=
 =?utf-8?B?NHFmUGtBWmRSYWJmancvME9VbWJCUkRBcmFhd3I3UEg3UjhlWWYzdU5wTkZy?=
 =?utf-8?B?YVc1Zm9yd3RoM1Z2Z2FmL2hTOW10VzVpWVZkNnRGZGRIbDZ5cGRWTVc2eVh0?=
 =?utf-8?B?THhQL0k1K3ozTUJLRzZTaTg0bEhBdzNjdUM2bG1OUlZGd2JQdVo3N2psNGRH?=
 =?utf-8?B?Q3AxMFpvYy90NldKNXZObm0vVTdVSU4zVVFucEhKVmhoYUZ5K3Z0RG9vWWJC?=
 =?utf-8?B?MDlteVRyd0c2TkJGMGFKWFRDYVZMeXFwdmRvMmY5K0V4SlBxYTEyeGZnM2Rq?=
 =?utf-8?B?Q1BuYXloZVVJdFU5dnJxenAyUXk1RmNnU2RZLzFodnJhdHBraU0xUFp0b1Fw?=
 =?utf-8?B?MjNudzgvalJwQjBtRzJZT3JaRVpGUXpCZUJpOXJDZGlvRTBvNForRzVqOFZo?=
 =?utf-8?B?N0U4QnRGM3ZPTisvOG1JdEZxZDg2aVRMSTdyaDkrQ3Rrd3Bja3FZa1B6S0dG?=
 =?utf-8?B?NlZqVkw3VWZIRklydlA4a2dyeURTTUFac2NheUpsYWdkaWhaMUI2d1FuVng4?=
 =?utf-8?B?bzJJUTlOcEowUWdJU2dIK0x0RUswV2ZITU4wN0hjQVcxUTc5OVpUOGJ6RXA3?=
 =?utf-8?B?ZWJFOE1KUTVJdWdabXFJTDFnMkRhMTN3dWF4anljR21IVlQ1NGFkOVZGc3Ba?=
 =?utf-8?B?SU85ZVZhU0NSYmZBSFF4UDZKMk1CUEFYRVA3czl4Ymo1QW1oMmRzZ0RRQW1i?=
 =?utf-8?B?RDB6R0RRQ1hhWE1qbXdLdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdLZlRSazgzMXhSSXZWYiszdHdRLzNOSThydjI5dk5mcDFRK1RZd1Q5WEg1?=
 =?utf-8?B?NEtIRVArNnVqRS8wYnFENTV3K2dPQVVWZEFuLzNlR1BMQkVzSkU0NG10cUwy?=
 =?utf-8?B?QTl2TDVkbG1BZ1dVNnJlWEVDQzZsT3NocUtmRnlKNjRYeTR6VWxJYWRLQ3ND?=
 =?utf-8?B?Z1VLeFE3SlcvSXhTMndBZ0JubllMek1lRXNzckR4WHhZb2VQL3ppU2VER0Rx?=
 =?utf-8?B?SlpqM29KTnBidmMzUTArWkIzUUlxY1FUZWZlc2F6cVM0ZFFBMFY1TS9mM0ZP?=
 =?utf-8?B?ZkFMdkE4cVR6Qm9tMFlaNWIwRlM1cW9GVjhnWERrV0ZmUkRKL3dxbUJkSEFT?=
 =?utf-8?B?S2dWUXg5TURWaEU1MTQ4L2FidDY2VzBLYWdOS0x1aG1zVnY2SUZ5UDkwMURZ?=
 =?utf-8?B?V1Y1Y3Y4YTRVWXgvZlRKSE83YVBYWlVlTzQwUjVVZW9JK0FnK2JxUzFpcEdH?=
 =?utf-8?B?NEovbnRBdGEra0lWOUs1eWpqOFhNem5nYS94em9HNXdZaTFkZ2hIemZHK3pr?=
 =?utf-8?B?N1QyOXk5RDN4Y3RHaDl5dng2NjBWeGhoM2FoWW9DYXF2ZmpsSG5RUENpZzhP?=
 =?utf-8?B?YWNtSDlqeDBrU2o5VThLRkllS3UwVkp5QkRzajQ3K0hBSVdvazJmYmtOUFVs?=
 =?utf-8?B?TlVyZDdZTnVad3JjazYrY0NaNHA0ang2Yklzc29VMWNUR2NHTmhUcVlyRjg4?=
 =?utf-8?B?RlBONmMvZElXKzlCaHhteUhvZDMxVjJUNlpkcnZzZERIMTVvaWk2VUxaRVpB?=
 =?utf-8?B?KzZUY3ZudzJWK1lnenhTTWNUcC9wbEt5RnQrS2lYTmRJQWNRczk3ZE5EazhU?=
 =?utf-8?B?Um9GeDVTK1lBbGtzdzlXZTlHOVkwMHp5NTZVejc4Z0Y0cVp5ZkIxS21kV21C?=
 =?utf-8?B?bjV2WlRTNjU4MW1iWDRqUHBKemtHMTZwNFdOcStkVEh6T3BORmp3YVB2ZE01?=
 =?utf-8?B?Njdaa0RzcmhUd0E5MWI4SnNJWk5zN0FoNGVwVlRFU3Z0RVVRc21VTWZxRWZV?=
 =?utf-8?B?MFB6M0YxSGIvQnpiand0b2E3UytsTTY0dWtlWlV4UFZsVk8vK0dvZnp4eHhE?=
 =?utf-8?B?QWdDNCsvb2U4dENoYWFzUFd2OG5scC9pWUVySzM0WnRHdFZMRTlsa2ozSmk3?=
 =?utf-8?B?aGhXcVJZWEM0TkxTWkFFaHE4cEJvQnplYXpxUmhIV3ZHYU5WeG5KVjB2TWhE?=
 =?utf-8?B?YlVCNHdSbGw2anpjdkowb21nQVJwUGVZK2tBdmVJZXE3L2xCUUZBRnY2Nzk5?=
 =?utf-8?B?WDFsaDB1UkI0YTNMeUhlSFdxRGx1TTJJYTF5YWp5Q1ZWUm02V3h6dStmZ0Nv?=
 =?utf-8?B?d2hjd3pKYXpaZlJiM3VFT0hGbE1WWjZ4Mm9pL1lVQTVQaW94biswalcyeThM?=
 =?utf-8?B?SXBld25jRkkxc1JhQkVNTGViSUdJVVIveTMzSEoyVTBDUmJFYUtGUFZJVlhU?=
 =?utf-8?B?dU9JVHlHYjN6TDU4d2NncnhHdE13YklpN3k0a21qZnQwTU5MUHZLRkZDVkVu?=
 =?utf-8?B?MllTd01MQzM0YUQ1V2IwcUVWYmtmSkRvN3hMR24rbmxnVzEzejBRWGFhVEI4?=
 =?utf-8?B?SGpRWThjbG13QTZlbEZiNEpZbysvWlExK0FpRVVyWWJ0RVVkcFJaeEdTME5j?=
 =?utf-8?B?OHh0UEMzZURDWXRoMXRIWjl5YnVXUkNLNXZkSWhxaUVyQ1RVblNKbFBxQVF3?=
 =?utf-8?B?Wk5DSXJDZnd2Z2pCWmZaaURqcEhvMDR3MFlVUFVDY0E4SFJ3N2VMRVRUUUZr?=
 =?utf-8?B?dWlkWFNTaVE0N1BhWk1rbFVDbmN6T2pVa1Q3U1BCVmd2Um9XUnlzVjErWUlZ?=
 =?utf-8?B?cDhIVnd6Z0Z4ckR5RmVpUVFoRllTYnJUOTJXYVM1cW5EV1VzTjFUeGNBWC9S?=
 =?utf-8?B?ZmhXSjJZeTEvVDFuTWcyRWJGaEhpNWYzUmllS2JrR1hycmtIMHN4aVNJcS9x?=
 =?utf-8?B?b3RGc0NKdEtSMmVyUHVkQ0tGaEVuaHh2cis5ajhRK2kyZGxIMmpWbUtPRVR5?=
 =?utf-8?B?bnIzMnU4dnVkb3VRZjFZRUwyUlBGNkN5TnlXR0J2V25nOGpDRTFCdVY1ajNn?=
 =?utf-8?B?ajJPaFVpZ2t2Y0FVSmJFQlQ3VXFKZzRNYXoyZE5wdHM2R0dheGxBdnlaMTgw?=
 =?utf-8?B?QVNtVmc3aFNZTjVjcjBKVE05cERQZ0wzTHRHMlBIdlF2d2hyYm02Y0hKSjM2?=
 =?utf-8?Q?KQlbTNghhr3viKP0354XQ/o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa51a78-81db-44bb-d075-08dc99fb541f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 18:26:30.8441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/JNiwBI/ydgBbxlaci1nKFScONazbOaEUkDvq+aTAY59x0Y4XqF77GLNllgPfTuI4Y2fRSZoextORRsl47dBEIGtH3E0CGUdoYXWkRK480=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
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

On Mon, Jul 01, 2024 at 12:35:24PM -0500, Lucas De Marchi wrote:
>On Sat, Jun 22, 2024 at 07:00:58AM GMT, Umesh Nerlige Ramappa wrote:
>>Add simple tests that submit work to one engine and measure utilization
>>per class.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>tests/intel/xe_drm_fdinfo.c | 109 ++++++++++++++++++++++++++++++++++++
>>1 file changed, 109 insertions(+)
>>
>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>index 27459b7f1..852931d71 100644
>>--- a/tests/intel/xe_drm_fdinfo.c
>>+++ b/tests/intel/xe_drm_fdinfo.c
>>@@ -25,6 +25,15 @@
>> * SUBTEST: basic
>> * Description: Check if basic fdinfo content is present
>> *
>>+ * SUBTEST: drm-idle
>>+ * Description: Check that engines show no load when idle
>>+ *
>>+ * SUBTEST: drm-busy-idle
>>+ * Description: Check that engines show load when idle after busy
>>+ *
>>+ * SUBTEST: drm-busy-idle-isolation
>>+ * Description: Check that engine load does not spill over to other drm clients
>>+ *
>
>can we split the mem-related basic check from the utilization-related
>basic checks?

will add a separate basic subtest for utilization.

>
>> * SUBTEST: drm-total-resident
>> * Description: Create and compare total and resident memory consumption by client
>> *
>>@@ -39,11 +48,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>>
>>#define BO_SIZE (65536)
>>
>>+/* flag masks */
>>+#define TEST_BUSY		(1 << 0)
>>+#define TEST_TRAILING_IDLE	(1 << 1)
>>+#define TEST_ISOLATION		(1 << 2)
>
>shoud we document the mapping to the subtests?

If you mean something like what the xe_exec_basic (below) is doing, then 
I can try that.

{ "basic", 0 },
{ "basic-defer-mmap", DEFER_ALLOC },
{ "basic-defer-bind", DEFER_ALLOC | DEFER_BIND },

>
>>+
>>struct pceu_cycles {
>>	uint64_t cycles;
>>	uint64_t total_cycles;
>>};
>>
>>+const unsigned long batch_duration_ns = 500e6;
>
>please use * NSEC_PER_SEC
>
>>+
>>static const char *engine_map[] = {
>>	"rcs",
>>	"bcs",
>>@@ -76,6 +92,27 @@ static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>>		pceu[class].total_cycles = info.total_cycles[class];
>>	}
>>}
>>+
>>+/*
>>+ * Helper for cases where we assert on time spent sleeping (directly or
>>+ * indirectly), so make it more robust by ensuring the system sleep time
>>+ * is within test tolerance to start with.
>>+ */
>>+static unsigned int measured_usleep(unsigned int usec)
>>+{
>>+	struct timespec ts = { };
>>+	unsigned int slept;
>>+
>>+	slept = igt_nsec_elapsed(&ts);
>>+	igt_assert(slept == 0);
>>+	do {
>>+		usleep(usec - slept);
>
>mismatch between usec and nsec here in the first sleep. I guess it's
>easier to convert the arg to nsec and then always have the same unit
>
>>+		slept = igt_nsec_elapsed(&ts) / 1000;
>
>NSEC_PER_USEC
>
>>+	} while (slept < usec);
>>+
>>+	return igt_nsec_elapsed(&ts);
>
>wrong unit? you receive usec as arg and are supposed to return usec, but
>rather return nsec.

Hmm, there is a lot of unit mismatch in this helper. I think I will just 
convert everything here to nsec.

>
>Also, I'm not sure why exactly this is needed. usleep() from the C
>library already guarantees it's going to sleep for *at least* the
>specified amount.
>
>usleep(3):
>...
>DESCRIPTION
>       The usleep() function suspends execution of the calling thread
>       for (at least) usec microseconds.  The sleep may be lengthened
>       slightly by any system activity or by the time spent processing
>       the call or by the granularity of system timers.
>
>RETURN VALUE
>       The usleep() function returns 0 on success.  On error, -1 is
>       returned, with errno set to indicate the error.
>

I think the requirement is to know how long the delay actually was  
because the "sleep may be lengthened". All utilization/counter 
comparisons will be against the actual delay.

>
>>+}
>>+
>>/* Subtests */
>>static void test_active(int fd, struct drm_xe_engine *engine)
>>{
>>@@ -451,6 +488,66 @@ xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx)
>>	free(ctx);
>>}
>>
>>+static void
>>+check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>>+	      int class, int width, unsigned int flags)
>>+{
>>+	double percent;
>>+
>>+	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
>>+		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
>>+	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
>>+		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
>>+
>>+	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
>>+		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
>>+
>>+	/* for parallel engines scale the busyness with width */
>
>s/parallel engines/parallel submission/ ?

will change
>
>>+	percent = percent / width;
>>+
>>+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>>+
>>+	if (flags & TEST_BUSY)
>>+		igt_assert(percent >= 95 && percent <= 105);
>
>percent should never be > 100.

Yikes... that's a miss. I did see a couple >=100 though!! and modified 
this to check how far it goes above 100, but completely forgot to debug 
the issue itself. Will debug.

>Also, for >= 95 to be true this needs to
>be the only client.  Should we check for number of clients and skip if
>we find others?

Didn't think of that. Wondering if there is a way to enforce a single 
client somehow in the test. If not, then I agree to skip if more clients 
are present. Any idea how to check if there are other clients?

>
>>+	else
>>+		igt_assert(!percent);
>>+}
>>+
>>+static void
>>+single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
>>+       unsigned int flags)
>>+{
>>+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>+	struct xe_spin_ctx *ctx = NULL;
>>+	int local_fd = fd;
>>+	uint32_t vm;
>>+
>>+	if (flags & TEST_ISOLATION)
>>+		local_fd = drm_reopen_driver(fd);
>
>so you have 2 clients in the same process... Maybe add this info to the
>subtest description above.

sure

>
>>+
>>+	vm = xe_vm_create(local_fd, 0, 0);
>>+	if (flags & TEST_BUSY) {
>>+		ctx = xe_spin_ctx_init(local_fd, hwe, vm, width, count);
>>+		xe_spin_sync_start(local_fd, ctx);
>>+	}
>>+
>>+	read_engine_cycles(local_fd, pceu1);
>>+	measured_usleep(batch_duration_ns / 1000);
>>+	if (flags & TEST_TRAILING_IDLE)
>>+		xe_spin_sync_end(local_fd, ctx);
>>+	read_engine_cycles(local_fd, pceu2);
>>+
>>+	check_results(pceu1, pceu2, hwe->engine_class, width, flags);
>>+
>>+	xe_spin_sync_end(local_fd, ctx);
>>+	xe_spin_ctx_destroy(local_fd, ctx);
>>+	xe_vm_destroy(local_fd, vm);
>>+
>>+	if (flags & TEST_ISOLATION)
>>+		close(local_fd);
>
>humn... it doesn't seem this is actually testing any isolation? It's
>just reopening the fd and testing the same thing on the duplicated fd.
>
>what I'd expect of an isolation test is, e.g.:
>
>/proc/X/fdinfo/Y
>	drm-client: A
>	drm-rcs-cycles: 0
>
>when executing on another fd:
>
>/proc/X/fdinfo/Z
>	drm-client: B
>	drm-rcs-cyles: 10
>
>
>so, check that read_engine_cycles() returns !0 for fd where you
>submitted the spin and 0 for where you didn't.

will do

Thanks,
Umesh
>
>Lucas De Marchi
>
>>+}
>>+
>>igt_main
>>{
>>	struct drm_xe_engine_class_instance *hwe;
>>@@ -485,6 +582,18 @@ igt_main
>>	igt_subtest("basic")
>>		basic(xe, num_classes);
>>
>>+	igt_subtest("drm-idle")
>>+		xe_for_each_engine(xe, hwe)
>>+			single(xe, hwe, 1, 1, 0);
>>+
>>+	igt_subtest("drm-busy-idle")
>>+		xe_for_each_engine(xe, hwe)
>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
>>+
>>+	igt_subtest("drm-busy-idle-isolation")
>>+		xe_for_each_engine(xe, hwe)
>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
>>+
>>	igt_describe("Create and compare total and resident memory consumption by client");
>>	igt_subtest("drm-total-resident")
>>		test_total_resident(xe);
>>-- 
>>2.34.1
>>
