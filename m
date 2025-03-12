Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F033DC28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 09:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A267610E05F;
	Wed, 12 Mar 2025 09:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfPo+D/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C5110E05F
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741770871; x=1773306871;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GUnOplhtBsxX9yPS/jMzxFZwBXFUEvzumaOrrRRBC74=;
 b=gfPo+D/Q6W0/KGPw5kXzdJ1FWp6FjQaL5swCiR4qWrp45bhJBMfrToha
 TdRRaW3Nnr+ZIi/L4afOKg/68K4avvrV+o3sFCzLZTvTcJhhJO3J/Sdus
 XLyMkl/lL41Agt9Rn9ntZdPZgzH27E9bEMC9kSjxx/aaqLNMko8Hvjt76
 xWPm6OFjkjDcp2ruMP22X79w7KHtQiXo7x/HvvavUbKbsd+diNpj0819z
 gTSw4qh85wOFdVgj4DNvlHDgm50lrMLHgdspFO6AvTZImdmnRONDd5ef7
 lN4mgtD3/kB8clcpC/5hXoT6H8NhEDsx1Ce+hLOnvO5F4E1FOS2DAV+/v w==;
X-CSE-ConnectionGUID: LwdD+ixkRluvkMaZDshu+A==
X-CSE-MsgGUID: iBAfHNWmTP+ux1r+f9J5dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42972934"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="42972934"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:14:31 -0700
X-CSE-ConnectionGUID: e221R7JNQU6zpRmA4WJeuw==
X-CSE-MsgGUID: pUVUqs+DRy6ySo9uLpWZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125476306"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:14:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 02:14:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 02:14:30 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 02:14:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3U0oU2GGWyNkhsdfgXhQc2ysUucrM27jImsBBrS/O9CbS7H3TcCTFa6z1tJ8tSH1q/NoIhK6iY/tw1simNWosg3wMoDNHmuu5+EARlVp50MmR6OrzS1DTP+WSvCduM1373AF1HTk6RJEC3XEsD9lIr4JKKeDRgLvaP/HXmpasxrgLC2Xc+UwTITB789MQx/TlrJ059r6RkLsD49fGZwrWsdqsf6lq5l3E+hqmRO7wTFDZZh+X0QlRvfn65yOA+YBDChCt3N2ljdWkwMe5jIqD/gQEd2iUdreoAb+nTcS4yJ6SiTx8dTCPrpZylecDcDMXg8GmJK6xgYZnzbGP6Ngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faSKCCIrsSbLQlUqyjit22maHgrqZu+ugk033KO7P5w=;
 b=oCBZkrgWI04k35EH9dxkFHxpBgD79eSzwIckVHtL8TwBEyop7cf7DJfAE4O+SNicmNz4iAENKFASLlaL9g9nhVTuGllUZIRXNylk9MSw/7MMce4iiEfmavtMlvroXYhp3P1SrU1Jpf0pPUUjDQBuD9csCelqRgjrKCM/OVgmKvbMCc1oZ7oD6Xkp8aHlml84jr6jCwNdZ7W/AQHARSDbzomkEUksBoZVI9q1L4+uG0vquDqsZETN4hRlDFza9DpSqxSyfLgWDs5teQ4SfyLX6nYLB6uKpKhuJ5NDH3xSfyQ/mJVAUSOhWamKl2O3Av6YAICeY5Z1QXHyuXCoYDl/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 09:14:22 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 09:14:22 +0000
Date: Wed, 12 Mar 2025 09:14:12 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ewelina Musial
 <ewelina.musial@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v5] runner: Parse results harder
Message-ID: <oiemcttwodncycyal335izqroflp4n2i2fnetzxncb6csvnvjs@m2gcvk3vdvfz>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250305193137.295162-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250305193137.295162-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: MI1P293CA0022.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::19) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SA2PR11MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: 765f3746-a229-438e-1f74-08dd61464653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTA1VWJnRitwaTFseFNoVCtBQUxKNnFLSkMrM2NRdXRla08xN0I5SmJxanZm?=
 =?utf-8?B?K3VXSXNZbG0yREN3Wmx4QmlTRlJNUVB1a2crWlUvKy8vTk5VRmVLRFdwMWVn?=
 =?utf-8?B?Z0lrMjRwNEwzNDZKcDhNcUp2OUJuOEIyTExpejl5NGFPZ1hPdWZCOUZTeGhS?=
 =?utf-8?B?dlRjaHFkbEE0eWx5d2dwVEZKazBCQ1ptQ2l5S25mV3dQaXNBOTl2ZmIrSGVr?=
 =?utf-8?B?eXpScDJld3JvaUtyU2VMTXl4ak9kT05wVHZSeEZTWERGdExOM2pSRFZZUGxU?=
 =?utf-8?B?eEttVzNRc3Zvd0dBL0JxL0lSODA2Qm5qTnExME9BZXJJUnkxOCs1UGZpTjQ4?=
 =?utf-8?B?ZHpRajdFYVdvdUJENTZxSktoRjRSMnN6SWhaMkNsZ3lWeGw0NlBOTnhoemc4?=
 =?utf-8?B?RXRBY0czQzRaWDdacjY5d1J1VGsreDlrbGRiL0hadjVkcktMMy9jVkxKODVB?=
 =?utf-8?B?LzFEZk1pRlBSc0VySDN1UWM3Z1J6emFjSmkza0ozL0Y3TDljb3B0VFFGdlV5?=
 =?utf-8?B?WmczdVpHY2pnWHJPOW5MR1NudWt4MFRqK3hwUTIwM0pQdHhxMHQyYmNleTgx?=
 =?utf-8?B?Tnc1WHhDV0dqbi9mTGluLzBoc3VERlpCcUVWb0dvRmFOd2p1bUhsakVjSkVL?=
 =?utf-8?B?WUdZZC9SWHgwS21QR0FRcVJ2TmwwNDBEL3RSV3Q2UVZ0T3d3MnBQZFN5Mmda?=
 =?utf-8?B?QjhKZkNYTXdZNGc5OXo0SkRRRWlLZGRxSmJzbHFuK3RJMFZTUk8rbkN1WElB?=
 =?utf-8?B?dDEwTWpUY2FZenU0dzU3TjRkNGF2SXE2RG96OW45U3F6Ylo3a2kvQmgzem5G?=
 =?utf-8?B?R254cWV5dStVSm5qVVk4VjNZaDFJNkpqRmt2alE0STdveE1wUEszSlhoVXFH?=
 =?utf-8?B?YlJhQklLOHdjdTB2azBoRGpHYWpIS0NacEw0N0hQTnowQ3JVdXh6LzN2KzA1?=
 =?utf-8?B?bnZaOXI3enpLdVZZZTFkd08wWVVLL1pQcEkyd1JvaHR6Mit6cS8zVkZuVjJt?=
 =?utf-8?B?OUZUOEUyNTdpSmFLR2pKUFVuVVhzU3JxYURXOU9YREtjRlV1K0NMNkt5b1RZ?=
 =?utf-8?B?SWdDSWllU0ZXOUt5NzBINHR4K3RFM3ZEMmlndUV5S1dyd1lKWS9wNVBRQ1ZI?=
 =?utf-8?B?QzFwb2h0THFhOUlBMFQ5ZEtyZ3c2a1d3amlnWnZTVE5LZDgzYkNzUnVnU3h0?=
 =?utf-8?B?bXZoUXMxZ2J4U01lOHVmS3c4ZzB4UnRnS1JMTEQyZGl0ODRkRG1Sb1lLOVcx?=
 =?utf-8?B?aGUyK2t6Qmd0UGsrZm9pTngvYlZvMHJXeWp2dFozUXJVWitUUTY5YVNSWit6?=
 =?utf-8?B?MDJBY2gzSmpLL0JEb09XSEpnTUVEWGZPYXRkaWkzdEJNbU1qRHBCTW45Slhh?=
 =?utf-8?B?aFRlb2dBalRoeVFwWGt5YjBQU2ZqOG5GOW1pMmFReDgrZW9KSTErVm1HbXBJ?=
 =?utf-8?B?eG1wOGdpbzZHZktScWpEWDdBR1gwNlA5TEM2QVQ3NSsycytacXl2UnlpQWNH?=
 =?utf-8?B?UTdnNEwxSDdMN2RLd1NFaXR0ZHM3MkJXaTBXbTFMUGg4VS9mVUhlMVgvcVh5?=
 =?utf-8?B?eFBzd2hYV2F6eW95UmJvb0hhbUl1bHp5c3FTSXhWdWhxVTBIdDlnNzE1bzhR?=
 =?utf-8?B?MTUvR2RsTGlWcGo1dUc2djZ0SHVkdVBzYUFhZDAvYjR3NnovUHJEWUhTT1Zw?=
 =?utf-8?B?S2tkS1BqcG1qUkFsZUcwM2tFWmVNcXZGQWdiMEdGMmlqbjdIN3hvckxuTndP?=
 =?utf-8?B?d2JtYzFMR0NaamtWZmUvV0NOdHVwbW1UeFBQN1RjWklkeWdjR3V4aDFoaHg4?=
 =?utf-8?B?N3VMcUhkeWkvT2NVd3pWSzM3bWhWeEMremNSeVkvL1loNkwxWjR3OVluTXh4?=
 =?utf-8?Q?qPVBG//Jmipwr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVJQY05FWTExdk5RTVBTUVJTREtLSFdlZ3h6ZUVQcnp5bDRmdExWUElNWmli?=
 =?utf-8?B?MWxDOWNHcXQ1Rmw1VG1rMUNFRmRsaFowdjZOMkxpTjR0NGtrcHBCQXA3dXlm?=
 =?utf-8?B?RDRkUmVpem0zbWxaRkJqT1NiUEIwV2pOM0lyRGQ2VFFWOVZkNGJpcGZEMDR5?=
 =?utf-8?B?UmVYN2xURmMyaUUwUWY0UWc5eGlnNTEzRDZpUVpKODFGMHJFMk1ZUWFqVWpM?=
 =?utf-8?B?RE9XVEl3ZkYraVo1KzlWTGNpNTVDZUx1WWI3YzRvNHpaS3VGUGsyMDhUQXZB?=
 =?utf-8?B?STZ0amU2V2pTcHRvRXZyazZJcVd4Y0RBNGVKcERIOWVGSDNpYk4yYmoxa1VU?=
 =?utf-8?B?MlNPemQ0NXVPS1Rwajk4bk5veGxHT0NZWEpGTU1CNmlUUlVIdzY2aU0xbXZI?=
 =?utf-8?B?SVlib3JocWtnZEp3UlJnQlhYVldPbG10YkJ3aEZ0SlRCOHA4S1BVbkNoVmsr?=
 =?utf-8?B?MXJVS2lYeHR1WTBOc3hBMTNGem1JU2I0MmpTeXhTTFQ5VGszNnRUUU9XbDZk?=
 =?utf-8?B?SXhjUXFyUlAxZm54eGxUSWFqTGQ3NGR0NkFrc2IwcHRSemRVUEJrcDVGOW9o?=
 =?utf-8?B?UzRpYjlqMldnSlVOMjVoNmk2NjlJdWpNeVhpOGtiaGVMK25jK0RaWmtVSHFm?=
 =?utf-8?B?TXBTajBlcThEUGhZTC92VDRhMFRSNSttQ3hnVHMvTmk2STY3aWU3YlYyQWdE?=
 =?utf-8?B?YlZJTjFJTEQvbERPWVdoZzk4QlY5UjRUd1hlZlByblFQSElYM01BenMxc3d5?=
 =?utf-8?B?N1hHZXVFbm4rVzRwT2tDcThMc3FTU3k2RFNhMjNhdGV0aUtlSzdPMUZOSVl0?=
 =?utf-8?B?RHB2NWJvc3RCWStTU0ZYdlZJN1ZGM3JwcFZaTHVKMDNOdTFiM2F6UnlxUitC?=
 =?utf-8?B?RUw5bGx5TEJWaEkyUklFWjVxSFcxMkhRcEJkVjBwN0ZxYkJueVkrY1d4MHJC?=
 =?utf-8?B?aVRrQ0pETm5DOE1QK0pzZWJvYlZ2SDdORXRpTTVSc0VwNnU1OVh2QlY3eVVZ?=
 =?utf-8?B?QkkrUDk5YkN2akdZb0ZxTjExeUpyYW02bkEyY3JMajJCZEVVaVIrOTMxS1Va?=
 =?utf-8?B?bm1DbTNFc3ZBUHpESTlqTmdFZFZyaWxmRzM1MEZYQjFVTmJQcllHaVNUaTB0?=
 =?utf-8?B?VnVLNC9ILzQrN0ZiTDdMS3B4UGF2WXZvbDEySTRqQ0pRcy9IanpPZDBSSEk4?=
 =?utf-8?B?R1JNbnVPTnpzZTF5M1BMNmJteXNRYVhLNjROalpTazkxVU45SUs5S2Y4OUdB?=
 =?utf-8?B?Zzd6TmhKWDFUS3R6V2JkUVU4V21qVXJNU2J5czllK2RybnRkaUJNejloUksw?=
 =?utf-8?B?RmtnTnlsQjE3NXIvbEx2eFRITHRacEgvUDBCcUkwT0hiL3Y0dWVGZU5Pc3hr?=
 =?utf-8?B?eVQ4OHd1U005OWhyUGxlNWoxRVFueForWURLSURNdmdDNFhLVGpnRVJzRXc5?=
 =?utf-8?B?REV0eFQwWnE2N1k2L1FhYkxLSXQ3ZEtQc3VaUGtEWWhDL1VMa3B3SFFxdlZ3?=
 =?utf-8?B?UmJqYzFlMlhIbW03MTFsNjZaMGNIcFAzNFhPenJGRko0VzdqKzVTZVFkcVE5?=
 =?utf-8?B?eDhuV0N6aTMzMTRmR29tZEI3UnF1ZDQ5TmQyWTF6Sm1kNm5tRU84TFBrdXhS?=
 =?utf-8?B?YjgwY3E3ck05YW00STdlVnd0cWVFZ3krNS9WK3BvMGFhWDFreEcrWFVrbTlP?=
 =?utf-8?B?eXM2N2hzQTIyWU5heGwxcHBpdjQ4OWpydG5MQXBhUk9nUTVaK3dSQTV4eGhG?=
 =?utf-8?B?eVo4bG9SQlF0OW0yT00zTldXNEI1UUlLZHZkZlV5ZiszUmcvdDliM2pyZGFq?=
 =?utf-8?B?aE83TFBpa1orb09wK3JtOE5SUmR6SmRtRHhrRVc3Zk9zSm1LTVBDb0V1cFNU?=
 =?utf-8?B?Yk56VjRLQ2gvdGdGK0djci94L0prRmVROWRBSWhrbkJzTWhNVDZqMFVlNjNR?=
 =?utf-8?B?OXBXT0d4YjluV2Q4NXZYVmVZMFJsVHAwL1g4TTBabER4T3pRMThMSXBSdEdp?=
 =?utf-8?B?NEZUZGVPK1RXZ3V4NWpDRmFleUM4Yk5xVVFNRHVTS0NTMWNLaDM3eW9IS09i?=
 =?utf-8?B?MjhFYXRSTEljcEdXdnN1dUhJaVJlNFVieDAyN25id1lnQ0E1T0lKVGxTTXlS?=
 =?utf-8?B?QWw1UFFvWCs4VHRjcFVtNlBTSy9aV3Qxb2U1RjZOZVlEOG9NSk5JOTNEVmls?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 765f3746-a229-438e-1f74-08dd61464653
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 09:14:22.3436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sG7ck94HZpuW3EhvM+gs+ozFLvC/YrjP/2/E7RAw9ri/owAW9Xc9Q/q8GqFPVoOUR2Lv4LfzFdWMSYtymBq05ZyzytaoyOgLWuyUU/84tHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
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

Hi Kamil,

> Sometimes an error happens in kernel or in test that leaves
> output files in corrupted or incorrect state. While runner or
> resume will just move on to executing next test, when generating
> results it could end up with no results.json
> 
>   Try processing outputs a little more persistently and use any
> output file left there, even if only dmesg.txt. Also, when no
> useful output files were present, instead of breaking out add
> notrun.
> 
>   Inform about processing results for each test so a problem
> could be spotted more easily.
> 
> v2: removed ')' from 'notrun\n)' (Kamil)
>  using bool var, added more prints about errors (Ryszard)
> v3: reused open_for_reading, removed bool var (Krzysztof)
>  closing only positive fds[] in close_outputs(), checking
>  file sizes also if all opens succeeded (Kamil)
> v4: reverting to v2 and addresing review comments (Krzysztof)
>  closing only already opened file, drop early return when empty
>  output files as this changes run status (Kamil)
> v5: reverting to returning false after any out/err/dmesg output
>  is missing, simplified later checks and printed logs, fixed
>  closing outputs (Kamil)
> 
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
