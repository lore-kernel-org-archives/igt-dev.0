Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE81D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 16:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DE810E046;
	Mon,  1 Dec 2025 16:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmLDTpnI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5D810E046
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 16:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764605481; x=1796141481;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=auB4Jxr7pD7Hd2Kby0SHpBRrjAlDEV47QJwzu1reeqQ=;
 b=lmLDTpnIS949kpXcxBLjbRZ4KtjnAtndtB+DA63p3W79EbiNkPj3/24S
 ulzRYXFFpvpkzOiGyWxtfHRBGGfY4OHzL8xfOLtoRQ4ojgGBBH0OT7nIO
 2Rm/NKYBBxjTGWOYOxOP4dZ9MgkMmdAtwlU6aEWlF86dDc646X5hQm6G+
 T/bKxULt6aW3lpP7UJRIR/70VbC5cd7PlY0F3xgwYj5VIGGoztMCWajxc
 jhBcUU0Q19lQE40lYusJrwWncpCpKy8mFSArce8ALw4nvgKBVAYosFyMx
 vwHoPt7HALpLJIxUSuXDIMgG7aPPQ4O2tdle8OX+bbLm/MPOPzrvlurpI Q==;
X-CSE-ConnectionGUID: C90fII3ySoyiTnGy2qUbhw==
X-CSE-MsgGUID: QPp6FleFRqiZ6y7R6+QKEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84153499"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="84153499"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:11:20 -0800
X-CSE-ConnectionGUID: iKkwDRd8TCSsTbR+VXNcQA==
X-CSE-MsgGUID: j8uRYwBhQtm3QJZCcY0u+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193768525"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:11:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 08:11:19 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 08:11:19 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 08:11:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqqZtt76ryvqi8+Riun+j7iIbPvGiY0/yi0/cyNrS5a9RBTgj9PH2rscvDNP0iJH3byRS3w4rmaHHphhXU37IIZw0YctC8CXIfjKThv/zMFD2+7FaOTh9k28CqwMNPldXVN129Qj155iT1oFAfreT6b880Sgd08hgUuwcMkg5mYnQQiLVcPvHZdirY/xWbe6+9QbkElA32uA/jJZxge5i3hz4krDLVGLGn6FxLJJpMlq0QZv43Rgoh4Lf4N2RexwGm8R76gdPFwo3/Z3eqojSZ+f20PC3yaunUD/p/7iw9osMN7Glp/y+OcfPQNGaNI/1C9C5ZxPvJENkJmsF1OFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auB4Jxr7pD7Hd2Kby0SHpBRrjAlDEV47QJwzu1reeqQ=;
 b=pNJlHGcKrC4Tm1ga33PlXLm2ow6n8Vp7PzTsCKKxP0f2qoWkxsaAeMsCUVUEdjM/bx4n1E+BLKSDHMIm/EskmhYQS1nD27ZZEQmiSbh7KxbVJp65JbLRlnvK0deMXZ/+5M0dLWrYk6SzCS6fvQ9X0qH6EUZVYOsI5UStwPSnbJWBekrz3XN+xtvTTzYK34dXj4YvgbfsP4mElK9gs66b9lH1G2nYj1YDvF8AQ53aYZKZcJ/01MQnuJGCwFU8z37xiOror6mFfq+M2L7STfyGdPZjfSz3WLVMtr+9JkxsaP+lMz0E+iEJrkbWS/8q7qHpQqPn1WAZD2IcrRjcDdh6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CH3PR11MB7894.namprd11.prod.outlook.com (2603:10b6:610:12c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:11:16 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:11:15 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gurram, 
 Pravalika" <pravalika.gurram@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH i-g-t v9 03/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU xGPU memory access test
Thread-Topic: [PATCH i-g-t v9 03/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU xGPU memory access test
Thread-Index: AQHcYqFvVEviGlqNiUKkrZJidpbqULUM8vAAgAABx5A=
Date: Mon, 1 Dec 2025 16:11:15 +0000
Message-ID: <MW4PR11MB7151C7F3589E421838F4FB14E4DBA@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-4-nishit.sharma@intel.com>
 <20251201160358.lcsfiwmh465ojjxa@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251201160358.lcsfiwmh465ojjxa@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|CH3PR11MB7894:EE_
x-ms-office365-filtering-correlation-id: 98f0b79a-0268-4bee-06a9-08de30f4414c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dnl1aXdFYlR2eXJzRHVxT3NFMVIxNC9nZHl3TFEzaXNlUVVYSHpZWnNGN1BK?=
 =?utf-8?B?cGxNMWlUemRxY05EMkZsNUpBdzI1MWtnclkzUU8rSE5HVUM1T1drRjVNYjZO?=
 =?utf-8?B?U2Y3S2RkVkJiSzNkVy9tRHFtMnlUOEE5NTY5K2xTemU5dTViSHB3KzhIS3hU?=
 =?utf-8?B?eEltbzlGYVd3djROZDlMbk5Fb2ZNYUpaUVFKQ3RUeHp3dHUweG5PVnhueFdW?=
 =?utf-8?B?bnBMemhFNnZxZktsbFBRcC9kZlZmZmlwYUN5aDFyVDNCY0d3dEN5TkhPQWdE?=
 =?utf-8?B?TGVlcDBJNU1TdzRGeWNaR2o0Z0dIbnBWRCs0eFkyL2Q4TThEZWdObVRScGp3?=
 =?utf-8?B?dERzN0MybExkZTlNV0lUKzk3L0lnckdDUHh6STcwN3E0NGZXRUFBcGtUL3Av?=
 =?utf-8?B?VUhCUXQ5Q1NPaDdLT0hUTmxrVGJqVkxMaFNXcytJNjdHWnArLzMrb0pkTUpJ?=
 =?utf-8?B?WHhnWVRKcVRDZlJwb21QUVhmb3JqeVZYa0JLb0dIL2tpRERkL1VKNG01VU5J?=
 =?utf-8?B?V2RkMm92TDhrb3lmVDcxZ1BIeTVaZVovTFFDVnViZ1BIMVNKQi9qYkZ4a21q?=
 =?utf-8?B?UmVZVEdGWEhSZVJRa05lRXhsSXRmMENnUkkybE9pT3ZJZ1FsWk1EZnJtcHhh?=
 =?utf-8?B?OHRHOTF1c3NGZlpKZXNSbEVzRFFSVTJ3VDdnOTkxK0x0RitWVGJRY3U1clNo?=
 =?utf-8?B?d21JK1JsOXJqa2J5Nk5mOU5QZzRmRURRQW53OHJIeU9CbHo1c1ZiUm4yd2Uy?=
 =?utf-8?B?UUkrSWM0TFJ0anlNaUhZVlJPaHQ3ckE5cFNDUWtvUTRZY1AyYlNoaktmRUF2?=
 =?utf-8?B?ZXNQTFM1VXpDRUZGSEZLY3F4c0g3aGI2d2V2aTUwMWhXallEWmZrekthbzZs?=
 =?utf-8?B?ZVFyL0p5WktnUkl2WE1PTjcvbkJmZzM0VlhXVDBiQTVCQ2JHYVF4ZDg5QWYw?=
 =?utf-8?B?bE9BWjUyOUdOaEZFMDZ1dkRTWnY1ZTZKNy9leHBRbSs4NjhxZFhoV0QvUmdX?=
 =?utf-8?B?UHp5aUIzN3ZkT1cvWlFURDJlZVRyU01KZXZXbm5RYlZXeng0YTZKY0tNN2lW?=
 =?utf-8?B?SWtHdFZDNXV5Ukx1amV2TUFPbDZ5YU14YjI2UTM1aEpJR1NzMDQ4RmtjK0w5?=
 =?utf-8?B?U3pnSnUzR1FBcFpxMmFRcTZjQnFNYTVmRkY3ejk2TXkrYS90NW1aQlRvUFJw?=
 =?utf-8?B?bklkdm4wYkNhTjVmZUNld3JrdklsU3hLZllKQ1JQZzRub2thYkZTWmZDZzhh?=
 =?utf-8?B?Uno5NG9iSk1MblZiem1zZU93TDR1Uk1KVTVqUFdKOWc0QTd5bWdsMjBzME50?=
 =?utf-8?B?MXBqYkJvQ1l5dTdxZU1EK3h2Q0NPQTdtM0haOFZwclVuaEV5OTA1ZDJjZVRR?=
 =?utf-8?B?U0d1eWtLVzIwRnpVRUkzRmIyVklkSENVamtOMHUrdWhvMzVtaHBQVjhicy9l?=
 =?utf-8?B?STZhOExrNENVOXhtZzJlbFFpaS9vSGZMZXI2WDV0aDVySjNKTjh2clk2MHVh?=
 =?utf-8?B?S0llTzNVV1VGSVoyaWRNZTVYTHlIaUcvWGRZeE1WbE1JZmRFaEZIMW81QVpv?=
 =?utf-8?B?MVR3U295ejVnZThjYzB2UjhlakJpdmkzRkhiSHVTUUpWYmVRaDJOa0J0dVgw?=
 =?utf-8?B?RFBjYm1NRFBlMlVocitwaDI0ZFArZWExUURVM3MyOVZ3RitPUG5DM0trNlpp?=
 =?utf-8?B?NHFYRWQ0T2NxK2Jvcy9PWlMxSDNnbGlJSnBRUDN0Qmc5dVozRUhoMHJtK1Fa?=
 =?utf-8?B?eFZvWU5tYzNNN3p0cEJMSDV3RHlOZXNHUkdsdzkxVDB6ejhZZTR6SHBUS0dh?=
 =?utf-8?B?c0FMU3h0RnBmbjBnbFJrTFBqRkErUy9MeHk2dC9ZejZtZXpjOWk3a1ZUcHNj?=
 =?utf-8?B?c0RrYlk2RVlrWWxKSEhINkd5clJma3plaHQ0aCsrb3hYbm05STg0aEFkc2dM?=
 =?utf-8?B?NldNa2NqcDRHakYxbURnejVMZ2libVVHZHFacCs5Ynl5WHc5QWxPWGFVS0tu?=
 =?utf-8?B?dWZOMWVwUk5jQ1hjcWZtV2szM3g0alNPL2trZ1NmY0c1RytvdDhvaFlhM3Bj?=
 =?utf-8?Q?E91PmO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnMxdTlUSnh6WURweXZjVmVSbEN2NG1XeGFBSmVtY3dZVWdKWWh3ZURPdFBY?=
 =?utf-8?B?Wk1nenlHLzNZUDVvR09jTEhEME1WeStXN0pLWmR0NkliNDMrWFFoWnlURnd3?=
 =?utf-8?B?YkJBSWxsTmZROExicU5WNjZiMDRLcmNwalNqcG5VWXVPeHc4U0taNDl4WitI?=
 =?utf-8?B?c2RSR0lBaXRGdmhLRGdoS1l5bmxic3dmWWRLTTdldk8zOG5mOWVvcEErY3Zt?=
 =?utf-8?B?eWxGcFVKbGRvQWVkT2JoTy8xQlc5Z3kwbnJKTVpTNmpKckg3SFFrejFETGhP?=
 =?utf-8?B?VzJycUg4MFVXTHJTY0ZFdjAzRzIweTdlREhHNG9pOUxTemdPUkF4SWFNSEwr?=
 =?utf-8?B?UkFJUWZQZFdPT1JINGVOaW9Jc2J6TnExVmdMMDFkMWYzckV4R3hpcDd6Rm9s?=
 =?utf-8?B?eW1ZZkMxaHIwM3lVQ3B3N0hKYm5mZVdiL0VNd0VtV2pMVlRGRlJCVXB6OWFS?=
 =?utf-8?B?N2Q2ODEwblpETVVqMVF5LzllQkJRUm0wMENOUXlwYjFkNXFaRWs1VVVmNGk1?=
 =?utf-8?B?K0lMWWhDd2Q4NnhxY0x4dm1FU2FWU3kwREtFbkQ0LzZCRUdSb3ZOcVZKcjhq?=
 =?utf-8?B?ZFZra1JDd0VDNklwdXdKdEx3cUxqVXNxb2ZodVFFcGhRclN3Qm1MT0IwTjZy?=
 =?utf-8?B?T1BZc2ZYUTJIVHR2M3U4KzdRUkJtUTZuQmVYd1JlV0wvT0FlVHUxak1zbmhp?=
 =?utf-8?B?cXpPSkUvcjJlaTE4M0lVQys2UFZSQXR0TXVyamdLc3FUOVhFTjZka3NlL1Yr?=
 =?utf-8?B?MlJVK2M2bXh6aHpTSGV0SkpNT0MvbVphelIyeEo2VzFWOXJMdFh6dUtnZGF6?=
 =?utf-8?B?Q1BFWnY2TFVOMXdLTzdxVTF5dzhmMVlHbXEzVWhxNFBIOVpQaVgxWWJOdFRj?=
 =?utf-8?B?TjVPVDgrdys3TXU3VTNqSlRUaEtvbC91bkpNbExXU2gxV2Z1aytQRitueUgy?=
 =?utf-8?B?WHRFdFpJMCtEUnhLVDcrdUFpSzc2VmFqSXFaZUVSNjZ0MHp2TnZ0eHFodU5E?=
 =?utf-8?B?a1hQRmdXVVJuY1kxc2tNSHlMcE9xR1NLYU5vc3pHTGpYQ0NlaEM3UFlRUFVH?=
 =?utf-8?B?NWNIVFdZNGRjcTMrOCtHWlBQRlFBWDhLTjlUZVdkOVVLQzg3ajZtSkU0Vm9K?=
 =?utf-8?B?SlQ2Ti8ycndFN0xobHZ0Z2s5VnF6UDBPeUF6Qi80dmVEWU9SNjg5bUhlYy9p?=
 =?utf-8?B?eFpTSG1WSzVuRGM1VjBBOW9LSGFMS2dpTGZzZEErRmZYVmdkdnJENExtYjA2?=
 =?utf-8?B?N3o1bzBUZkc1bnZWMzU5a0pQME4vR1pWdkZ3Y1c5bTlHaE1BM1NXSUJTcVFr?=
 =?utf-8?B?UnZ6MUp6MnVYUnl0NjJLM3Z4NHIrWjVMR3VxWU1hVzBuM2ZvblVVMmVpRmRO?=
 =?utf-8?B?K1NvTVhzV1FScmpVcFJ3V3JCRkYvQVNBNzVQY0VZb3JHTjdpQkhPZlJSTERN?=
 =?utf-8?B?c0JQNUpKUTZqdXdHcDVMMWMzeTVYTmRDZ3loZ2Y1N3p3OTM2Q3BLUndTdlBR?=
 =?utf-8?B?Vk5qMXJ5WVdIMi90NnpYb1ZmSjFxUDM2UjdaT0lFQ1hOSlJLK0FmM3VNSE5V?=
 =?utf-8?B?S3FldzU1bnF5UjJnOGRrakNTR3M4U0RRcUtwY0VpQXU3K1hId2Y1R0s3T1o2?=
 =?utf-8?B?RllzVmFnVGlkU1pFTVprRUVPM3NkcHgzcTV1bEpYWXJibGJQRjJ6R1hqUHZQ?=
 =?utf-8?B?Q0VHdHVWSGVNQ2pTSnJlc1dZbVN2Y3Rwa2F1YmllTXhSd2VMK0xpOFBybTR1?=
 =?utf-8?B?czVPYVBuK0NLblFsR09KaW5tSHJwMG9GVHk3TnRtNWRWZS9kRHJvbWd6UGxG?=
 =?utf-8?B?ZzRBdGpYTlVkS2xmZWRhekpVZ1l6czNYTzhXNFIyUkhsS0c5WVVsbWYwYUsy?=
 =?utf-8?B?T0JOMjlWRWpaZFp2bzBSdmZJa3lmcXluMWJtNC9yU0YveVhpcXRVa3FvUlhn?=
 =?utf-8?B?R3p2a1pJaDhvQjY0aDYyQUVCTzRqVko5RHZxQ2VwekNSYURyTG9TTXA0V3FD?=
 =?utf-8?B?TDFmSVZVTHdsREhzL25PL2NaZFdXNlVyNGg1U1FwQnlKcHFwekFvL1lCSG1l?=
 =?utf-8?B?RFhLZFpYd0cwVW13dFUxK2tJNnZBc3hKSWc0bjFxdmJIc2xYNDNWbDgrdVg1?=
 =?utf-8?Q?Whq+Y/YhDfbyDTnvVw9wfEBdp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f0b79a-0268-4bee-06a9-08de30f4414c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 16:11:15.8258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBrAHGNxZF7gGb0z1Se+gaJw9Hv97y0/G3E/OhmTBc8CCleZqqcoHIDI3yJyXTXZiddEeLi18OJDjgJq1DTyGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7894
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

SGkga2FtaWwsDQoNCldpbGwgdXBkYXRlIHRoZSB0ZXN0IG5hbWUgYW5kIHJlc2VuZCB0aGUgc2Vy
aWVzLg0KDQpSZWdhcmRzDQpOaXNoaXQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpT
ZW50OiBNb25kYXksIERlY2VtYmVyIDEsIDIwMjUgOTozNCBQTQ0KVG86IFNoYXJtYSwgTmlzaGl0
IDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgR3VycmFtLCBQcmF2YWxpa2EgPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPjsgVGhv
bWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KU3ViamVj
dDogUmU6IFtQQVRDSCBpLWctdCB2OSAwMy8xMF0gdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3Zt
OiBBZGQgU1ZNIG11bHRpLUdQVSB4R1BVIG1lbW9yeSBhY2Nlc3MgdGVzdA0KDQpIaSBuaXNoaXQu
c2hhcm1hLA0KT24gMjAyNS0xMi0wMSBhdCAwOTowMzo0MiArMDAwMCwgbmlzaGl0LnNoYXJtYUBp
bnRlbC5jb20gd3JvdGU6DQo+IEZyb206IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50
ZWwuY29tPg0KPiANCj4gVGhpcyB0ZXN0IGFsbG9jYXRlcyBhIGJ1ZmZlciBpbiBTVk0sIHdyaXRl
cyBkYXRhIHRvIGl0IGZyb20gc3JjIEdQVSwgDQo+IGFuZCByZWFkcy92ZXJpZmllcyB0aGUgZGF0
YSBmcm9tIGRzdCBHUFUuIE9wdGlvbmFsbHksIHRoZSBDUFUgYWxzbyANCj4gcmVhZHMgb3IgbW9k
aWZpZXMgdGhlIGJ1ZmZlciBhbmQgYm90aCBHUFVzIHZlcmlmeSB0aGUgcmVzdWx0cywgDQo+IGVu
c3VyaW5nIGNvcnJlY3QgY3Jvc3MtR1BVIGFuZCBDUFUgbWVtb3J5IGFjY2VzcyBpbiBhIG11bHRp
LUdQVSBlbnZpcm9ubWVudC4NCj4gDQorY2MgVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxs
c3Ryb21AbGludXguaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IE5pc2hpdCBTaGFybWEg
PG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX211bHRp
X2dwdXN2bS5jIHwgMzkyIA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQoN
ClRoaXMgaXMgYSBiYWQgbmFtZSBmb3IgYSB0ZXN0LCBvbmNlIGFnYWluIC0gZWl0aGVyIHhlX2dw
dXN2bS5jIG9yIHhlX3N2bS5jIG9yIHhlX211bHRpZ3B1X3N2bS5jDQoNCkltaG8gYmVzdCBvbmUg
aXMgeGVfc3ZtLmMNCg0KVGhlICdtdWx0aScgd29yZCBpcyBoYXMgbm8gcmVsZXZhbmNlIGhlcmUs
IGl0IHNob3VsZCBiZSAnbXVsdGlncHUnIG9yIG5vdCB1c2VkLg0KDQo+ICB0ZXN0cy9tZXNvbi5i
dWlsZCAgICAgICAgICAgICB8ICAgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDM5MyBpbnNlcnRp
b25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3Zt
LmMNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYyANCj4g
Yi90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYyBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRl
eCANCj4gMDAwMDAwMDAwLi5hODAxOTNiOWENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi90ZXN0
cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYw0KPiBAQCAtMCwwICsxLDM5MiBAQA0KPiArLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDIz
IEludGVsIENvcnBvcmF0aW9uDQoNClRoaXMgc2hvdWxkIGJlIDIwMjUuIFRoaXMgY2Fubm90IGJl
IG1lcmdlZCB1bnRpbCBjb3JyZWN0ZWQuDQoNCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8dW5p
c3RkLmg+DQo+ICsNCj4gKyNpbmNsdWRlICJkcm10ZXN0LmgiDQo+ICsjaW5jbHVkZSAiaWd0Lmgi
DQo+ICsjaW5jbHVkZSAiaWd0X211bHRpZ3B1LmgiDQo+ICsNCj4gKyNpbmNsdWRlICJpbnRlbF9i
bHQuaCINCj4gKyNpbmNsdWRlICJpbnRlbF9tb2NzLmgiDQo+ICsjaW5jbHVkZSAiaW50ZWxfcmVn
LmgiDQo+ICsNCj4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiArI2luY2x1ZGUgInhlL3hl
X3F1ZXJ5LmgiDQo+ICsjaW5jbHVkZSAieGUveGVfdXRpbC5oIg0KPiArDQo+ICsvKioNCj4gKyAq
IFRFU1Q6IEJhc2ljIG11bHRpLWdwdSBTVk0gdGVzdGluZw0KPiArICogQ2F0ZWdvcnk6IFNWTQ0K
DQpZb3UgbmVlZCBhIERlc2NpcHRpb246IGhlcmUsIGl0IGlzIGdsb2JhbCB0ZXN0IGRlc2NyaXB0
aW9uIGxpa2UNCklHVF9URVNUX0RFU0NSSVBUSU9OKCkgdXNlZCBpbiBvbGQgZGVzY3JpcHRpb25z
LiBBbHNvIGRlY2lwaGVyIFNWTSBzaG9ydGN1dCBpbiBpdC4NCg0KRm9yIGV4YW1wbGUgbG9vayBp
bnRvIHRlc3RzL2ttc19kZWJ1Z2ZzLmM6DQoNCi8qKg0KICogVEVTVDoga21zIGRlYnVnZnMgdGVz
dA0KICogRGVzY3JpcHRpb246IFJlYWQgZW50cmllcyBmcm9tIGRlYnVnZnMgd2l0aCBhbGwgZGlz
cGxheXMgb24gYW5kIHdpdGgNCiAqICAgICAgICAgICAgICBhbGwgZGlzcGxheXMgb2ZmLg0KDQpS
ZWdhcmRzLA0KS2FtaWwNCg0KPiArICogTWVnYSBmZWF0dXJlOiBDb21wdXRlDQo+ICsgKiBTdWIt
Y2F0ZWdvcnk6IENvbXB1dGUgdGVzdHMNCj4gKyAqIEZ1bmN0aW9uYWxpdHk6IFNWTSBwMnAgYWNj
ZXNzLCBtYWR2aXNlIGFuZCBwcmVmZXRjaC4NCj4gKyAqIFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9u
YWxpdHkgdGVzdA0KPiArICoNCj4gKyAqIFNVQlRFU1Q6IG1ncHUteGdwdS1hY2Nlc3MtYmFzaWMN
Cj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICoJVGVzdCBiYXNpYyBjcm9zcy1HUFUgbWVtb3J5IGFj
Y2VzcyBpbiBtdWx0aS1HUFUgU1ZNIGNvbmZpZ3VyYXRpb24NCj4gKyAqDQo+ICsgKiBTVUJURVNU
OiBtZ3B1LXhncHUtYWNjZXNzLXByZWZldGNoDQo+ICsgKiBEZXNjcmlwdGlvbjoNCj4gKyAqCVRl
c3QgY3Jvc3MtR1BVIG1lbW9yeSBhY2Nlc3Mgd2l0aCBwcmVmZXRjaCBpbiBtdWx0aS1HUFUgU1ZN
IGNvbmZpZ3VyYXRpb24NCj4gKyAqDQo+ICsgKi8NCltjdXRdDQoNCg==
