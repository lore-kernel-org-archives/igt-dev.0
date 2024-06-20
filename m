Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D60EC2BBCA
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DE110E8D0;
	Thu, 20 Jun 2024 23:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaQIGYiM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6536010E2FE
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718925901; x=1750461901;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wt4hjLMuXKdMHkn91AbOZFk2quXoCNyvGGW159jrpJo=;
 b=kaQIGYiMesjDqwBkH4bUGmZn6mq0o+WndwmGRYpYHhI/KyIaoNBAz6tQ
 dQMCmIRye6ftLOEUuNwMUNQ1vQl1IGHFFyJF0xUolbCWR3z3EwVQsT1BP
 BUSyxsEDL4gtIb0m/nZChTLndjIvX1j1xtES1HLia12rcB6vLxZ7Tsa/P
 Ru9IImwCJWskBe6/i40sy88p11ujfH8aajtL7TIoDC6QQwY5xhsZZ30CL
 9tFBKtSW07a5YxppaQIULonHvSzKH/3VnvoHLTFGVHcrdXlCzENYA+txP
 Yqa4OAJDiCw0v5AqHBtvbLOV9CGknP3zOoMnPzPt556yZhcft6jchHHxA A==;
X-CSE-ConnectionGUID: NdMEjZVTTf2p9CvbrAOvDg==
X-CSE-MsgGUID: QhTCT3dcQk6EYQkHY8l6bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33398815"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="33398815"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:25:01 -0700
X-CSE-ConnectionGUID: BjPWbMVKTFyPw95HyPuXDQ==
X-CSE-MsgGUID: uM0z1p/eRCirX+VPyE1kIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="46934472"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:25:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:25:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:24:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:24:59 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:24:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEfwiYN8EMoSAffeqfymJCxYjftJI0wxe1KMmWdKK/9kFJr715CHhj8zvUA2Sy+nqRU8KTod6LBpcml+QLWzLCnYAlBXhYZDNMF4eaP4Cf9arzCreRPVxBkETeD0y7Pc0kEbqvI/JR6VdRH43I0ze6vGYHYwt9xyEsHlGuRE4cRyCRI80kyFXiK/bHWnAaL3Z/EdJODXpotpzRqwbUHBSTAi3ddwhoKhF95q+i7Owf/h2ksJs1AhYdqS+C8hHG+R1Os1ZpBMFOvNRc2cSngfbO0FQ6jejx+BmMP9PqlS7leCov5EPxlKSnl2+BJ6BKDofRjDOLgThhJWP0DCTkBkCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph9JUDHlnIb5Ta0JyQU9Hg2mYRBf+AifOL/SePLQfpw=;
 b=OSEjIPwowsGghRzhk8R4ijP+/MmI2FmFTNJb50Mfq6+x95V+EZlBpeoXucxJwgvOa4N+XRdpCE3cEh67YKYptIoKeCiW8PPPzhO8c18s8yAeZSkhdNUWeJZTF0vAJdcSgKy8qoJytiwmYFG37nXQ5ezyY/ibsEFBdXgC7LvV8t7UC+p0FcuO94fd4esukJBooqf7di8E+1Gl8KpF/qXOiPfBX5a2Pt/yvyhkc4xdZWEpGLbSpzpfwv3vRoJzWyPsa7kZpp+Bggr/F8sgG+DQEelsxWBbg+DorbUWqjPQFs+BbFdfp35bjbZP+SxRc/h1/QCwmTBdsz9P92QDX8P+ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.20; Thu, 20 Jun
 2024 23:24:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:24:57 +0000
Date: Thu, 20 Jun 2024 16:24:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 08/28] lib/xe: Complete xe_oa lib functionality
Message-ID: <ZnS6Rsf19uVfs05f@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-9-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620200054.3550653-9-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dda37ed-4a58-42d2-5260-08dc9180327c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWNRaHgvdFVRZ3ZoOXZua09XTCtxeVV0RCs4K3h5RmxYSGt6cWNNOEdaUFhz?=
 =?utf-8?B?NUNkQndKWlVZamVPK2RZZGFyUkc5TTlYYnlCUWYrSFpydzhYTzhjaTRLdUZ2?=
 =?utf-8?B?a3NIbmE1ekswNTFhVDV6Y1dTV0xPN2d5T0tzaFBJN2VZbE9tQ2thUVNQSlJ0?=
 =?utf-8?B?QnBXb0NFRC9GUzN1T2RWKy90bS9Kc2dnTFhXYUw1NUYvQzlCM29qVWJEckVQ?=
 =?utf-8?B?NVNiczUvV1JMdGx6bGlKKzVxa3lhQWNSV2xjNmwrc3BSN20xby9vM01Uc3ZN?=
 =?utf-8?B?MWxtVTM5RWVWbGx5Q05IblgxRjU4SmRqNkQ2dTBvSlc3YjN0SG1tWHdPaTA2?=
 =?utf-8?B?NU5oR0luNURoWWQzdTFhQ3ZJSDBKR1JtOTVJYmdHZTRqU3pnblRobTZMOVFm?=
 =?utf-8?B?TUNPd2hZMDJ4cERDR1BFRmt6NEFRSk5HNFlURklXMEp5VjBudGo3TVhYT1d6?=
 =?utf-8?B?WXFlODcxN3E5bmZlbjg2bDlaUlRicEwvek9tMmJMOVBWck0wNVdtazNQemMz?=
 =?utf-8?B?R25oaWRNSm1kbjBjRUhiaVJVaUVkaG5CWDFUUDdpZk5BczEvUzRqeDNTR01v?=
 =?utf-8?B?U0FJblF3bkJKNWlsODFHYXE5cHdrWDZkaFVQYnJjeExWSWxFdlJmOVZ4N2RB?=
 =?utf-8?B?TmdmSERHZXd5SVNMZE9BdmxkZk40RFA3TytUTVJCcTBITnU4S2tRNDBSbWFQ?=
 =?utf-8?B?dDRCNWZtaUdxbmVQOTY5WkV0SDkycUR6dTVYSXRCRUgwQjZTdVBBQVd3RFc3?=
 =?utf-8?B?UUhJd0huSGROLzg1KzNmcEZtbXY3TXpCb1g5NkZwallYaEc4cG9UWkc4SE5E?=
 =?utf-8?B?cGs5blpTaFUvMEZzb09nMkNqampDV21xQ2tPVHdiZUtFNkUxTUd6ZkdzK2NC?=
 =?utf-8?B?aXkvQmNUb0ppRjZMNzNIWEY3VG01dU5WMmdCKzJRMFp1RnZwV2pjQUQ2L2JR?=
 =?utf-8?B?dHJTcHhnakdwUk5MZmxiWGhHMDd1Q3lRVHVETEFqVFdXSlNRRitpRm1pV2ZB?=
 =?utf-8?B?d2Q1VFBkVjdzTW9UYkNEQnZIeVlJN2ltOFJEZmFmRlJjTVFMMDlsWEk0aEZa?=
 =?utf-8?B?WWRoVmlYVUhOSFZ3Q1ZvUXprVGJpVkFsSE55U0d2K1podVpXcC8yZzdha0sx?=
 =?utf-8?B?bW1zbTdnMWZ6bzI1STl1S0pXZjIrVmZ4MFdMODA1c0MvbWlIT2VZWVJuQVFo?=
 =?utf-8?B?WVBObjRTVlhQSS9IU3QrbzNoaDVucmxIZUhLWG4zeU1PWWxaeXNJQXBHM0tM?=
 =?utf-8?B?MEF3Tmw2cHNmMUJGdmNGMG9mNFc0NXJmb2RieXgyVUFuNjlwRG5OclRTa01S?=
 =?utf-8?B?b2ttR3VtdHhPTzVNTTRmcm9qRVhMT1A5dWt0OWpENkJUUUVQRytzY0NwTU1z?=
 =?utf-8?B?eHVpSTJ6eGt6MVRVNGRoYWJkQi94dnJGWk53SVY1NENKWjVMM09TWS9Zc2Vp?=
 =?utf-8?B?a1pET1hHelVNcmhqMnF5djc1Z2x3N3FQUm9iL2h0THFlM1pPaHJDQkYwSk1u?=
 =?utf-8?B?eXlNK3Q5Zk9FSEd5aUplUlZKQ1RONFd6akJhdWUvL2tLVFZac1ovdkN0VmpK?=
 =?utf-8?B?VzV4NzZKV1praGRNR0RicFY5TmtnY2xGRGtzMlVpUDExbmNoVFVvd29NSVRz?=
 =?utf-8?B?eklWd3E0Z2xPa0Rsd25lbWlyRnhvK2M0dU5sUEQvS2lSREVPVTVhSzhqK21G?=
 =?utf-8?B?VGZwTVgvUGt2TmtnakcycHdTclpCQzRjYy9pQzE5c2g5K3NSWHFaKzhRMWd2?=
 =?utf-8?Q?/0wqu8pqFnE0fDk8AhlOh0qLqVm0L/xv+IS5i3S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXAvTmc3SWxGSHE3SmZzS0RrcHdnRldnMzl3UFprRTE4SzU2TGpwaFg0bVVH?=
 =?utf-8?B?eVZtTG55MXFCZEtiNUx0bEg1Y3FZcWRMbjFOU0VLYXo1OFpvOWlFVURvZnBL?=
 =?utf-8?B?ZDM0eEExOFRjaDM1ZFJMUVVQNE55R2lHN0NscW5LZWVkRjU0OEEvRWtkRXQ1?=
 =?utf-8?B?bGQ3dzR4WmNCVE95YW4vK2NWeDlkVEYvS2VBMWQrejE3WVhEQTBXcTlTcUpj?=
 =?utf-8?B?eEFhQytQM1ltcjRDTExVUEU0T1cydU9Xa2FaVWFzM3RiVlJaeHlrdksyeUtV?=
 =?utf-8?B?dU5RajNmb3orb3haSVU2TnM1MFRWeThzK1FOOHdiS29NMXR5dW82MEtPUUNw?=
 =?utf-8?B?T3VSdE1aZXVTeDF2RlluNHJHQ0lQWnpaa0hUMFZTQXE2ZElMS25naHMwR0Fm?=
 =?utf-8?B?UjhnOEpwWVdXUlY0ZjFJY1RIVUxHbXFDa3RXdmU0UGJWNG1ac0ptNFpqVnFi?=
 =?utf-8?B?cVlka09Sa29uMkJVNkVpemVBZ1o5M2x3ZzZqTk5xOHRrTTBKM0ZJdm9LTUx0?=
 =?utf-8?B?UE0xUUxiZm43T1lWWSswSjNTb2RiTEZNdTVnTVVKeGNiVzVKNWQ1M01ueW9a?=
 =?utf-8?B?dXBrNFI5eGxoVkJYcTBXa0E2WjVsLzg5Sm9MZjR3Nzl0Q21sRnVmVFM5aGJD?=
 =?utf-8?B?S2prTng1RVAyQUlJSis0b052S3E4R044amtGZGU1Rzg1bm9jTURmNWxZekVW?=
 =?utf-8?B?Q1VIYVNlNE5OeENBeFhXMHAzcXpHM0kyaEhOZWI4TUk0dEczSkhUVFdCSmJB?=
 =?utf-8?B?Y2c5UW9HV2ZDQm9FOGZrVUVpUWpEdnpKUjNXN2QzcWJHT0V4enlMTFhQOTFh?=
 =?utf-8?B?eTJleU83U2podUVvRmxxaUxiZlZEZU01ekk1dWhzaXdyQWgzZXNRWDNTMmN6?=
 =?utf-8?B?OXdITFV5WlRIQXpFQURjUG1GMEdKeXRLMEJDZDBzTGpxenZJZnpzb1laY3N3?=
 =?utf-8?B?Z0UyUXlUdVdvNkdpSk9UYm1jUTF6aVBmUXhzandSRk9WQk5uWHpxWjZobFRp?=
 =?utf-8?B?ajVhM29NNWVRbDRoRlJvTU1Vck50Y3A2ekpZY2Yzb2IwWlVHa3pqQVF0ajls?=
 =?utf-8?B?MXNvYkFNc2N0eXBXN1lmS1NYVmhqVUhneGdDOU1xNEdVWmFUUmpvR3h2aWJ0?=
 =?utf-8?B?WHVMMk1qcXBtNlN2L3U3STRnOEgyVW5OOERwRDdUeVI2MU5wNEpmcm13TzFx?=
 =?utf-8?B?aWRYY1E1b2h1bVhCUWMvQkRScjlQR0J4Wm9reUJnLzQ2TFdUanQzSHhNYnBu?=
 =?utf-8?B?Wm5aWHFqUGMzM1VYUVRkZ2ZZRE0yL1B2VmVrM3pRQ3B0MTExNlM4aE84SUtv?=
 =?utf-8?B?UFNPa0dTazc3Z1VFdHdFSFVkamJ5SzRuMjMva1lNKzluSkZlMVdkQ05VNFh3?=
 =?utf-8?B?elJZUm1vN2E1OXBvU1g1SnRPcDdIS09CbEh1UkdxSlNIaVZkZFhyRk12alFB?=
 =?utf-8?B?N1d2MU1TMVd4R0E0K2ZqTkgvRFFqeW1pYWZRNFlxREFiSFl4UTBCTjBoazV3?=
 =?utf-8?B?cEVMZFdzOVJuMmszQXlSaWdCZjR1L0pGM21jVTZWMXpXMXU1UFpvZEFueWYw?=
 =?utf-8?B?UUR1V0duQmt2dnh4OHVjcmZqdUI0bVJoL2xkaldzR0V5cDNYVzN6MU9jdnNk?=
 =?utf-8?B?NXBoWWQ2dVJrTGtoNm90Tjhvc1d5VlFRV3hEM01KS1BndWR5eVZwNzFaUUls?=
 =?utf-8?B?WFZxN2ZWbk56MU9CQVAvNTVIc1FzeWxLSGpYNnFMTHovcjZoVGEzUDlVb3Rh?=
 =?utf-8?B?S2lJK2lzcElhUDFYdHV5L1owQUx6RXpqdlV2YlZ0U3VlOWVuTHZOQkV2NmZS?=
 =?utf-8?B?ME9ibU95T3lkVEdFd0xQSEFHTW9DWk5SbXAxR2hKV0lMcEEwVXlqeUxZNGs0?=
 =?utf-8?B?U3ZVUGhwcmxBWWUzY2c3endYQXFCVG9UbmN3Qmk1SXErdmNHU2ZLTlMrbktH?=
 =?utf-8?B?ZmJlOWxZNll1UndtSGUrZWpRMGhpV0tBYjExdGZmT3NxbmlScW1vUDBKRTNQ?=
 =?utf-8?B?RU9KcW1OeCtlL3BrT3ZrbjRNNlJEc1ZYVlZrdzFrbTZ4REZYTURMT1N4bUFs?=
 =?utf-8?B?cHY1VjFUcngvc2lqcWkzZjJnbWtQUm1FZWdvRE92YXpxUE1rTFVRMzRxVFYv?=
 =?utf-8?B?T1VGM2VlK25NK0d6cDNIR1dDK0ZLeUpSMmQ0V04wajh4TWtiVksxdlhwR2lS?=
 =?utf-8?Q?KDpn9c54XhwsKMnLZfNxo5o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dda37ed-4a58-42d2-5260-08dc9180327c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:24:57.0094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TiscOxYa/91Z9cL3fHTWlGQT13BHAGBxaR6CemN95zy8O2CWMtm484Y7Nc50/M6SpNVTZ6oIRUaXdOTqXp5Q37wvC2DvCN8EzG0RjSCxuXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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

On Thu, Jun 20, 2024 at 01:00:33PM -0700, Ashutosh Dixit wrote:
>Add various functionality in lib/xe for OA. This includes:
>* Support for OA metrics generation
>* intel_xe_perf_for_devinfo and intel_xe_perf_for_fd support
>* intel_xe_perf_load_perf_configs
>* intel_xe_perf_ioctl
>* drm_xe_query_oa_units
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/intel_device_info.c |    1 +
> lib/meson.build         |   86 ++++
> lib/xe-oa.pc.in         |   11 +
> lib/xe/xe_oa.c          | 1074 +++++++++++++++++++++++++++++++++++++++
> lib/xe/xe_oa.h          |  407 +++++++++++++++
> lib/xe/xe_query.c       |   38 ++
> lib/xe/xe_query.h       |    5 +
> 7 files changed, 1622 insertions(+)
> create mode 100644 lib/xe-oa.pc.in
> create mode 100644 lib/xe/xe_oa.c
> create mode 100644 lib/xe/xe_oa.h
>
>diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
>index 9250abd444..24ac146316 100644
>--- a/lib/intel_device_info.c
>+++ b/lib/intel_device_info.c
>@@ -510,6 +510,7 @@ static const struct intel_device_info intel_lunarlake_info = {
> 	.display_ver = 20,
> 	.has_4tile = true,
> 	.has_flatccs = true,
>+	.has_oam = true,
> 	.is_lunarlake = true,
> 	.codename = "lunarlake",
> 	.cmds_info = &xe2_cmds_info,
>diff --git a/lib/meson.build b/lib/meson.build
>index e2f740c116..02b86a77ff 100644
>--- a/lib/meson.build
>+++ b/lib/meson.build
>@@ -377,6 +377,85 @@ install_headers(
>   subdir : 'i915-perf'
> )
>
>+xe_oa_files = [
>+  'igt_list.c',
>+  'xe/xe_oa.c',
>+]
>+
>+xe_oa_hardware = [
>+  'tglgt1', 'tglgt2',
>+  'dg1',
>+  'rkl',
>+  'adl',
>+  'acmgt1', 'acmgt2', 'acmgt3',
>+  'mtlgt2', 'mtlgt3',
>+  'lnl',
>+]
>+
>+xe_xml_files = []
>+foreach hw : xe_oa_hardware
>+  xe_xml_files += files('xe/oa-configs/oa-@0@.xml'.format(hw))
>+endforeach
>+
>+xe_oa_files += custom_target(
>+  'xe-oa-equations',
>+  input : [ 'xe/oa-configs/oa-equations-codegen.py' ] + xe_xml_files,
>+  output : [ 'xe_oa_equations.c', 'xe_oa_equations.h' ],
>+  command : [
>+    python3, '@INPUT0@',
>+    '--code', '@OUTPUT0@',
>+    '--header', '@OUTPUT1@',
>+    xe_xml_files,
>+  ])
>+
>+foreach hw : xe_oa_hardware
>+  xe_oa_files += custom_target(
>+    'xe-oa-registers-@0@'.format(hw),
>+    input : [ 'xe/oa-configs/oa-registers-codegen.py',
>+              'xe/oa-configs/oa-@0@.xml'.format(hw) ],
>+    output : [ 'xe_oa_registers_@0@.c'.format(hw),
>+               'xe_oa_registers_@0@.h'.format(hw), ],
>+    command : [
>+      python3, '@INPUT0@',
>+      '--code', '@OUTPUT0@',
>+      '--header', '@OUTPUT1@',
>+      '--xml-file', '@INPUT1@'
>+    ])
>+  xe_oa_files += custom_target(
>+    'xe-oa-metrics-@0@'.format(hw),
>+    input : [ 'xe/oa-configs/oa-metricset-codegen.py',
>+              'xe/oa-configs/oa-@0@.xml'.format(hw) ],
>+    output : [ 'xe_oa_metrics_@0@.c'.format(hw),
>+               'xe_oa_metrics_@0@.h'.format(hw), ],
>+    command : [
>+      python3, '@INPUT0@',
>+      '--code', '@OUTPUT0@',
>+      '--header', '@OUTPUT1@',
>+      '--equations-include', 'xe_oa_equations.h',
>+      '--registers-include', 'xe_oa_registers_@0@.h'.format(hw),
>+      '--xml-file', '@INPUT1@',
>+    ])
>+endforeach
>+
>+lib_igt_xe_oa_build = shared_library(
>+  'xe_oa',
>+  xe_oa_files,
>+  dependencies: [lib_igt_chipset,lib_igt,pciaccess],
>+  include_directories : inc,
>+  install: true,
>+  soversion: '1.5')
>+
>+lib_igt_xe_oa = declare_dependency(
>+  link_with : lib_igt_xe_oa_build,
>+  include_directories : inc)
>+
>+install_headers(
>+  'igt_list.h',
>+  'intel_chipset.h',
>+  'xe/xe_oa.h',
>+  subdir : 'xe-oa'
>+)
>+
> pkgconf = configuration_data()
>
> pkgconf.set('prefix', get_option('prefix'))
>@@ -384,6 +463,7 @@ pkgconf.set('exec_prefix', '${prefix}')
> pkgconf.set('libdir', '${prefix}/@0@'.format(get_option('libdir')))
> pkgconf.set('includedir', '${prefix}/@0@'.format(get_option('includedir')))
> pkgconf.set('i915_perf_version', '1.5.1')
>+pkgconf.set('xe_oa_version', '1.0.0')
>
> configure_file(
>   input : 'i915-perf.pc.in',
>@@ -391,4 +471,10 @@ configure_file(
>   configuration : pkgconf,
>   install_dir : pkgconfigdir)
>
>+configure_file(
>+  input : 'xe-oa.pc.in',
>+  output : 'xe-oa.pc',
>+  configuration : pkgconf,
>+  install_dir : pkgconfigdir)
>+
> subdir('tests')
>diff --git a/lib/xe-oa.pc.in b/lib/xe-oa.pc.in
>new file mode 100644
>index 0000000000..e08fa5220f
>--- /dev/null
>+++ b/lib/xe-oa.pc.in
>@@ -0,0 +1,11 @@
>+prefix=@prefix@
>+exec_prefix=@exec_prefix@
>+libdir=@libdir@
>+includedir=@includedir@
>+
>+Name: xe-oa
>+Description: Xe OA library
>+Version: @xe_oa_version@
>+Requires: libdrm >= 2.4.92
>+Libs: -L${libdir} -lxe_oa
>+Cflags: -I${includedir}/xe-oa
>diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
>new file mode 100644
>index 0000000000..e5a340151a
>--- /dev/null
>+++ b/lib/xe/xe_oa.c
>@@ -0,0 +1,1074 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <assert.h>
>+#include <dirent.h>
>+#include <errno.h>
>+#include <fcntl.h>
>+#include <stdio.h>
>+#include <stdlib.h>
>+#include <string.h>
>+#include <sys/ioctl.h>
>+#include <sys/stat.h>
>+#include <sys/sysmacros.h>
>+#include <sys/types.h>
>+#include <unistd.h>
>+
>+#include "drmtest.h"
>+#include "intel_chipset.h"
>+#include "intel_hwconfig_types.h"
>+#include "ioctl_wrappers.h"
>+#include "linux_scaffold.h"
>+#include "xe_ioctl.h"
>+#include "xe_oa.h"
>+#include "xe_pciids.h"
>+#include "xe_query.h"
>+
>+#include "xe_oa_metrics_tglgt1.h"
>+#include "xe_oa_metrics_tglgt2.h"
>+#include "xe_oa_metrics_rkl.h"
>+#include "xe_oa_metrics_dg1.h"
>+#include "xe_oa_metrics_adl.h"
>+#include "xe_oa_metrics_acmgt1.h"
>+#include "xe_oa_metrics_acmgt2.h"
>+#include "xe_oa_metrics_acmgt3.h"
>+#include "xe_oa_metrics_mtlgt2.h"
>+#include "xe_oa_metrics_mtlgt3.h"
>+#include "xe_oa_metrics_lnl.h"
>+
>+static struct intel_xe_perf_logical_counter_group *
>+intel_xe_perf_logical_counter_group_new(struct intel_xe_perf *perf,
>+					struct intel_xe_perf_logical_counter_group *parent,
>+					const char *name)
>+{
>+	struct intel_xe_perf_logical_counter_group *group = calloc(1, sizeof(*group));
>+
>+	group->name = strdup(name);
>+
>+	IGT_INIT_LIST_HEAD(&group->counters);
>+	IGT_INIT_LIST_HEAD(&group->groups);
>+
>+	if (parent)
>+		igt_list_add_tail(&group->link, &parent->groups);
>+	else
>+		IGT_INIT_LIST_HEAD(&group->link);
>+
>+	return group;
>+}
>+
>+static void
>+intel_xe_perf_logical_counter_group_free(struct intel_xe_perf_logical_counter_group *group)
>+{
>+	struct intel_xe_perf_logical_counter_group *child, *tmp;
>+
>+	igt_list_for_each_entry_safe(child, tmp, &group->groups, link) {
>+		igt_list_del(&child->link);
>+		intel_xe_perf_logical_counter_group_free(child);
>+	}
>+
>+	free(group->name);
>+	free(group);
>+}
>+
>+static void
>+intel_xe_perf_metric_set_free(struct intel_xe_perf_metric_set *metric_set)
>+{
>+	free(metric_set->counters);
>+	free(metric_set);
>+}
>+
>+static bool
>+slice_available(const struct intel_xe_topology_info *topo,
>+		int s)
>+{
>+	return (topo->data[s / 8] >> (s % 8)) & 1;
>+}
>+
>+static bool
>+subslice_available(const struct intel_xe_topology_info *topo,
>+		   int s, int ss)
>+{
>+	return (topo->data[topo->subslice_offset +
>+			   s * topo->subslice_stride +
>+			   ss / 8] >> (ss % 8)) & 1;
>+}
>+
>+static bool
>+eu_available(const struct intel_xe_topology_info *topo,
>+	     int s, int ss, int eu)
>+{
>+	return (topo->data[topo->eu_offset +
>+			   (s * topo->max_subslices + ss) * topo->eu_stride +
>+			   eu / 8] >> (eu % 8)) & 1;
>+}
>+
>+static struct intel_xe_perf *
>+unsupported_xe_oa_platform(struct intel_xe_perf *perf)
>+{
>+	intel_xe_perf_free(perf);
>+	return NULL;
>+}
>+
>+static bool
>+is_acm_gt1(const struct intel_xe_perf_devinfo *devinfo)
>+{
>+#undef INTEL_VGA_DEVICE
>+#define INTEL_VGA_DEVICE(_id, _info) _id
>+	static const uint32_t devids[] = {
>+		XE_DG2_G11_IDS(INTEL_VGA_DEVICE, NULL),
>+		XE_ATS_M75_IDS(INTEL_VGA_DEVICE, NULL),
>+	};
>+#undef INTEL_VGA_DEVICE
>+	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>+		if (devids[i] == devinfo->devid)
>+			return true;
>+	}
>+
>+	return false;
>+}
>+
>+static bool
>+is_acm_gt2(const struct intel_xe_perf_devinfo *devinfo)
>+{
>+#undef INTEL_VGA_DEVICE
>+#define INTEL_VGA_DEVICE(_id, _info) _id
>+	static const uint32_t devids[] = {
>+		XE_DG2_G12_IDS(INTEL_VGA_DEVICE, NULL),
>+	};
>+#undef INTEL_VGA_DEVICE
>+	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>+		if (devids[i] == devinfo->devid)
>+			return true;
>+	}
>+
>+	return false;
>+}
>+
>+static bool
>+is_acm_gt3(const struct intel_xe_perf_devinfo *devinfo)
>+{
>+#undef INTEL_VGA_DEVICE
>+#define INTEL_VGA_DEVICE(_id, _info) _id
>+	static const uint32_t devids[] = {
>+		XE_DG2_G10_IDS(INTEL_VGA_DEVICE, NULL),
>+		XE_ATS_M150_IDS(INTEL_VGA_DEVICE, NULL),
>+	};
>+#undef INTEL_VGA_DEVICE
>+	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>+		if (devids[i] == devinfo->devid)
>+			return true;
>+	}
>+
>+	return false;
>+}
>+
>+struct intel_xe_perf *
>+intel_xe_perf_for_devinfo(uint32_t device_id,
>+			  uint32_t revision,
>+			  uint64_t timestamp_frequency,
>+			  uint64_t gt_min_freq,
>+			  uint64_t gt_max_freq,
>+			  const struct intel_xe_topology_info *topology)
>+{
>+	const struct intel_device_info *devinfo = intel_get_device_info(device_id);
>+	struct intel_xe_perf *perf;
>+	uint32_t subslice_mask_len;
>+	uint32_t eu_mask_len;
>+	uint32_t half_max_subslices;
>+	uint64_t half_subslices_mask;
>+	int bits_per_subslice;
>+
>+	if (!devinfo)
>+		return NULL;
>+
>+	perf = calloc(1, sizeof(*perf));;
>+	perf->root_group = intel_xe_perf_logical_counter_group_new(perf, NULL, "");
>+
>+	IGT_INIT_LIST_HEAD(&perf->metric_sets);
>+
>+	/* Initialize the device characterists first. Loading the
>+	 * metrics uses that information to detect whether some
>+	 * counters are available on a given device (for example BXT
>+	 * 2x6 does not have 2 samplers).
>+	 */
>+	perf->devinfo.devid = device_id;
>+	perf->devinfo.graphics_ver = devinfo->graphics_ver;
>+	perf->devinfo.revision = revision;
>+	perf->devinfo.timestamp_frequency = timestamp_frequency;
>+	perf->devinfo.gt_min_freq = gt_min_freq;
>+	perf->devinfo.gt_max_freq = gt_max_freq;
>+
>+	if (devinfo->codename) {
>+		snprintf(perf->devinfo.devname, sizeof(perf->devinfo.devname),
>+			 "%s", devinfo->codename);
>+	}
>+
>+	/* Store topology. */
>+	perf->devinfo.max_slices = topology->max_slices;
>+	perf->devinfo.max_subslices_per_slice = topology->max_subslices;
>+	perf->devinfo.max_eu_per_subslice = topology->max_eus_per_subslice;
>+
>+	subslice_mask_len =
>+		topology->max_slices * topology->subslice_stride;
>+	igt_assert(sizeof(perf->devinfo.subslice_masks) >= subslice_mask_len);
>+	memcpy(perf->devinfo.subslice_masks,
>+	       &topology->data[topology->subslice_offset],
>+	       subslice_mask_len);
>+
>+	eu_mask_len = topology->eu_stride *
>+		topology->max_subslices * topology->max_slices;
>+	igt_assert(sizeof(perf->devinfo.eu_masks) >= eu_mask_len);
>+	memcpy(perf->devinfo.eu_masks,
>+	       &topology->data[topology->eu_offset],
>+	       eu_mask_len);
>+
>+	bits_per_subslice = 8;
>+	for (uint32_t s = 0; s < topology->max_slices; s++) {
>+		if (!slice_available(topology, s))
>+			continue;
>+
>+		perf->devinfo.slice_mask |= 1ULL << s;
>+		for (uint32_t ss = 0; ss < topology->max_subslices; ss++) {
>+			if (!subslice_available(topology, s, ss))
>+				continue;
>+
>+			perf->devinfo.subslice_mask |= 1ULL << (s * bits_per_subslice + ss);
>+
>+			for (uint32_t eu = 0; eu < topology->max_eus_per_subslice; eu++) {
>+				if (eu_available(topology, s, ss, eu))
>+					perf->devinfo.n_eus++;
>+			}
>+		}
>+	}
>+
>+	perf->devinfo.n_eu_slices = __builtin_popcount(perf->devinfo.slice_mask);
>+	perf->devinfo.n_eu_sub_slices = __builtin_popcount(perf->devinfo.subslice_mask);
>+
>+	/* Compute number of subslices/dualsubslices in first half of
>+	 * the GPU.
>+	 */
>+	half_max_subslices = topology->max_subslices / 2;
>+	half_subslices_mask = perf->devinfo.subslice_mask &
>+		((1 << half_max_subslices) - 1);
>+	perf->devinfo.n_eu_sub_slices_half_slices = __builtin_popcount(half_subslices_mask);
>+
>+	/* Valid on most generations except Gen9LP. */
>+	perf->devinfo.eu_threads_count = 7;
>+
>+	/* Most platforms have full 32bit timestamps. */
>+	perf->devinfo.oa_timestamp_mask = 0xffffffff;
>+	perf->devinfo.oa_timestamp_shift = 0;
>+
>+	if (devinfo->is_tigerlake) {
>+		switch (devinfo->gt) {
>+		case 1:
>+			intel_xe_perf_load_metrics_tglgt1(perf);
>+			break;
>+		case 2:
>+			intel_xe_perf_load_metrics_tglgt2(perf);
>+			break;
>+		default:
>+			return unsupported_xe_oa_platform(perf);
>+		}
>+	} else if (devinfo->is_rocketlake) {
>+		intel_xe_perf_load_metrics_rkl(perf);
>+	} else if (devinfo->is_dg1) {
>+		intel_xe_perf_load_metrics_dg1(perf);
>+	} else if (devinfo->is_alderlake_s || devinfo->is_alderlake_p ||
>+		   devinfo->is_raptorlake_s || devinfo->is_alderlake_n) {
>+		intel_xe_perf_load_metrics_adl(perf);
>+	} else if (devinfo->is_dg2) {
>+		perf->devinfo.eu_threads_count = 8;
>+		/* OA reports have the timestamp value shifted to the
>+		 * right by 1 bits, it also means we cannot use the
>+		 * top bit for comparison.
>+		 */
>+		perf->devinfo.oa_timestamp_shift = -1;
>+		perf->devinfo.oa_timestamp_mask = 0x7fffffff;
>+
>+		if (is_acm_gt1(&perf->devinfo))
>+			intel_xe_perf_load_metrics_acmgt1(perf);
>+		else if (is_acm_gt2(&perf->devinfo))
>+			intel_xe_perf_load_metrics_acmgt2(perf);
>+		else if (is_acm_gt3(&perf->devinfo))
>+			intel_xe_perf_load_metrics_acmgt3(perf);
>+		else
>+			return unsupported_xe_oa_platform(perf);
>+	} else if (intel_graphics_ver(device_id) >= IP_VER(20, 0)) {
>+		intel_xe_perf_load_metrics_lnl(perf);
>+	} else {
>+		return unsupported_xe_oa_platform(perf);
>+	}
>+
>+	return perf;
>+}
>+
>+static bool
>+read_fd_uint64(int fd, uint64_t *out_value)
>+{
>+	char buf[32];
>+	int n;
>+
>+	n = read(fd, buf, sizeof (buf) - 1);
>+	if (n < 0)
>+		return false;
>+
>+	buf[n] = '\0';
>+	*out_value = strtoull(buf, 0, 0);
>+
>+	return true;
>+}
>+
>+static bool
>+read_sysfs(int sysfs_dir_fd, const char *file_path, uint64_t *out_value)
>+{
>+	int fd = openat(sysfs_dir_fd, file_path, O_RDONLY);
>+	bool res;
>+
>+	if (fd < 0)
>+		return false;
>+
>+	res = read_fd_uint64(fd, out_value);
>+	close(fd);
>+
>+	return res;
>+}
>+
>+static int
>+open_master_sysfs_dir(int drm_fd)
>+{
>+	char path[128];
>+	struct stat st;
>+	int sysfs;
>+
>+	if (fstat(drm_fd, &st) || !S_ISCHR(st.st_mode))
>+                return -1;
>+
>+	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d", major(st.st_rdev), minor(st.st_rdev));
>+	sysfs = open(path, O_DIRECTORY);
>+	if (sysfs < 0)
>+		return sysfs;
>+
>+	if (minor(st.st_rdev) >= 128) {
>+		/* If we were given a renderD* drm_fd, find it's associated cardX node. */
>+		char device[100], cmp[100];
>+		int device_len, cmp_len, i;
>+
>+		device_len = readlinkat(sysfs, "device", device, sizeof(device));
>+		close(sysfs);
>+		if (device_len < 0)
>+			return device_len;
>+
>+		for (i = 0; i < 64; i++) {
>+
>+			snprintf(path, sizeof(path), "/sys/dev/char/%d:%d", major(st.st_rdev), i);
>+			sysfs = open(path, O_DIRECTORY);
>+			if (sysfs < 0)
>+				continue;
>+
>+			cmp_len = readlinkat(sysfs, "device", cmp, sizeof(cmp));
>+			if (cmp_len == device_len && !memcmp(cmp, device, cmp_len))
>+				break;
>+
>+			close(sysfs);
>+			sysfs = -1;
>+		}
>+	}
>+
>+	return sysfs;
>+}
>+
>+static void process_hwconfig(void *data, uint32_t len,
>+			     struct intel_xe_topology_info *topinfo)
>+{
>+
>+	uint32_t *d = (uint32_t*)data;
>+	uint32_t l = len / 4;
>+	uint32_t pos = 0;
>+
>+	while (pos + 2 < l) {
>+		if (d[pos + 1] == 1) {
>+			switch (d[pos]) {
>+			case INTEL_HWCONFIG_MAX_SLICES_SUPPORTED:
>+				topinfo->max_slices = d[pos + 2];
>+				igt_debug("hwconfig: max_slices %d\n", topinfo->max_slices);
>+				break;
>+			case INTEL_HWCONFIG_MAX_SUBSLICE:
>+			case INTEL_HWCONFIG_MAX_DUAL_SUBSLICES_SUPPORTED:
>+				topinfo->max_subslices = d[pos + 2];
>+				igt_debug("hwconfig: max_subslices %d\n", topinfo->max_subslices);
>+				break;
>+			case INTEL_HWCONFIG_MAX_EU_PER_SUBSLICE:
>+			case INTEL_HWCONFIG_MAX_NUM_EU_PER_DSS:
>+				topinfo->max_eus_per_subslice = d[pos + 2];
>+				igt_debug("hwconfig: max_eus_per_subslice %d\n",
>+					  topinfo->max_eus_per_subslice);
>+				break;
>+			default:
>+				break;
>+			}
>+		}
>+		pos += 2 + d[pos + 1];
>+	}
>+}
>+
>+static void query_hwconfig(int fd, struct intel_xe_topology_info *topinfo)
>+{
>+	struct drm_xe_device_query query = {
>+		.extensions = 0,
>+		.query = DRM_XE_DEVICE_QUERY_HWCONFIG,
>+		.size = 0,
>+		.data = 0,
>+	};
>+	void *hwconfig;
>+
>+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>+	igt_assert(query.size);
>+
>+	hwconfig = malloc(query.size);
>+	igt_assert(hwconfig);
>+
>+	query.data = to_user_pointer(hwconfig);
>+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>+
>+	process_hwconfig(hwconfig, query.size, topinfo);
>+	free(hwconfig);
>+}
>+
>+struct intel_xe_topology_info *
>+xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
>+{
>+	const struct intel_device_info *devinfo = intel_get_device_info(device_id);
>+	struct intel_xe_topology_info topinfo = {};
>+	struct intel_xe_topology_info *ptopo;
>+	struct drm_xe_query_topology_mask *xe_topo;
>+	int pos = 0;
>+	u8 *ptr;
>+	struct drm_xe_device_query query = {
>+		.extensions = 0,
>+		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
>+		.size = 0,
>+		.data = 0,
>+	};
>+
>+	/* Only ADL-P, DG2 and newer ip support hwconfig, use hardcoded values for previous */
>+	if (intel_graphics_ver(device_id) >= IP_VER(12, 55) || devinfo->is_alderlake_p) {
>+		query_hwconfig(drm_fd, &topinfo);
>+	} else {
>+		topinfo.max_slices = 1;
>+		topinfo.max_subslices = 6;
>+		topinfo.max_eus_per_subslice = 16;
>+	}
>+
>+	topinfo.subslice_offset = 1;		/* always 1 */
>+	topinfo.subslice_stride = DIV_ROUND_UP(topinfo.max_subslices, 8);
>+	topinfo.eu_offset = topinfo.subslice_offset + topinfo.subslice_stride;
>+	topinfo.eu_stride = DIV_ROUND_UP(topinfo.max_eus_per_subslice, 8);
>+
>+	/* Allocate and start filling the struct to return */
>+	*topology_size = sizeof(topinfo) + topinfo.eu_offset +
>+		topinfo.max_subslices * topinfo.eu_stride;
>+	*topology_size = ALIGN(*topology_size, 8);
>+	ptopo = malloc(*topology_size);
>+	igt_assert(ptopo);
>+
>+	memcpy(ptopo, &topinfo, sizeof(topinfo));
>+	ptr = (u8 *)ptopo + sizeof(topinfo);
>+	*ptr++ = 0x1;					/* slice mask */
>+
>+	/* Get xe topology masks */
>+	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>+	igt_assert_neq(query.size, 0);
>+
>+	xe_topo = malloc(query.size);
>+	igt_assert(xe_topo);
>+
>+	query.data = to_user_pointer(xe_topo);
>+	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>+	igt_debug("Topology size: %d\n", query.size);
>+
>+	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
>+		struct drm_xe_query_topology_mask *topo =
>+			(struct drm_xe_query_topology_mask*)((unsigned char*)xe_topo + pos);
>+		int i, sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
>+		u64 geom_mask, compute_mask;
>+
>+		igt_debug(" gt_id: %d type: %d n:%d [%d] ", topo->gt_id, topo->type, topo->num_bytes, sz);
>+		for (int j=0; j< topo->num_bytes; j++)
>+			igt_debug(" %02x", topo->mask[j]);
>+		igt_debug("\n");
>+
>+		/* i915 only returns topology for gt 0, do the same here */
>+		if (topo->gt_id)
>+			goto next;
>+
>+		/* Follow the same order as in xe query_gt_topology() */
>+		switch (topo->type) {
>+		case DRM_XE_TOPO_DSS_GEOMETRY:
>+			igt_assert_lte(ptopo->subslice_stride, 8);	/* Fit in u64 mask */
>+			memcpy(&geom_mask, topo->mask, ptopo->subslice_stride);
>+			break;
>+		case DRM_XE_TOPO_DSS_COMPUTE:
>+			memcpy(&compute_mask, topo->mask, ptopo->subslice_stride);
>+			geom_mask |= compute_mask;
>+			memcpy(ptr, &geom_mask, ptopo->subslice_stride);
>+			ptr += ptopo->subslice_stride;
>+			break;
>+		case DRM_XE_TOPO_EU_PER_DSS:
>+			for (i = 0; i < ptopo->max_subslices; i++) {
>+				memcpy(ptr, topo->mask, ptopo->eu_stride);
>+				ptr += ptopo->eu_stride;
>+			}
>+			break;
>+		case DRM_XE_TOPO_L3_BANK:
>+			break;
>+		default:
>+			igt_assert(0);
>+		}
>+next:
>+		query.size -= sz;
>+		pos += sz;
>+	}
>+
>+	free(xe_topo);
>+
>+	return ptopo;
>+}
>+
>+static struct intel_xe_perf *
>+xe_perf_for_fd(int drm_fd, int gt)
>+{
>+	uint32_t device_id;
>+	uint32_t device_revision = 0;
>+	uint32_t topology_size;
>+	uint64_t gt_min_freq = 0;
>+	uint64_t gt_max_freq = 0;
>+	struct intel_xe_topology_info *topology;
>+	struct intel_xe_perf *ret;
>+	int sysfs_dir_fd = open_master_sysfs_dir(drm_fd);
>+	char path_min[64], path_max[64];
>+	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>+	struct drm_xe_oa_unit *oau = (struct drm_xe_oa_unit *)&qoa->oa_units[0];
>+
>+	if (sysfs_dir_fd < 0) {
>+		igt_warn("open_master_sysfs_dir failed\n");
>+		return NULL;
>+	}
>+
>+	if (IS_PONTEVECCHIO(xe_dev_id(drm_fd))) {
>+		sprintf(path_min, "device/tile%d/gt%d/freq%d/min_freq", gt, gt, gt);
>+		sprintf(path_max, "device/tile%d/gt%d/freq%d/max_freq", gt, gt, gt);
>+	} else {
>+		sprintf(path_min, "device/tile0/gt%d/freq%d/min_freq", gt, gt);
>+		sprintf(path_max, "device/tile0/gt%d/freq%d/max_freq", gt, gt);
>+	}
>+
>+	if (!read_sysfs(sysfs_dir_fd, path_min, &gt_min_freq) ||
>+	    !read_sysfs(sysfs_dir_fd, path_max, &gt_max_freq)) {
>+		igt_warn("Unable to read freqs from sysfs\n");
>+		close(sysfs_dir_fd);
>+		return NULL;
>+	}
>+	close(sysfs_dir_fd);
>+
>+	device_id = intel_get_drm_devid(drm_fd);
>+
>+	topology = xe_fill_topology_info(drm_fd, device_id, &topology_size);
>+	if (!topology) {
>+		igt_warn("xe_fill_topology_info failed\n");
>+		return NULL;
>+	}
>+
>+	ret = intel_xe_perf_for_devinfo(device_id,
>+				     device_revision,
>+				     oau->oa_timestamp_freq,
>+				     gt_min_freq * 1000000,
>+				     gt_max_freq * 1000000,
>+				     topology);
>+	if (!ret)
>+		igt_warn("intel_xe_perf_for_devinfo failed\n");
>+
>+	free(topology);
>+
>+	return ret;
>+}
>+
>+struct intel_xe_perf *
>+intel_xe_perf_for_fd(int drm_fd, int gt)
>+{
>+	if (!is_xe_device(drm_fd))
>+		return NULL;
>+
>+	return xe_perf_for_fd(drm_fd, gt);
>+}
>+
>+void
>+intel_xe_perf_free(struct intel_xe_perf *perf)
>+{
>+	struct intel_xe_perf_metric_set *metric_set, *tmp;
>+
>+	intel_xe_perf_logical_counter_group_free(perf->root_group);
>+
>+	igt_list_for_each_entry_safe(metric_set, tmp, &perf->metric_sets, link) {
>+		igt_list_del(&metric_set->link);
>+		intel_xe_perf_metric_set_free(metric_set);
>+	}
>+
>+	free(perf);
>+}
>+
>+void
>+intel_xe_perf_add_logical_counter(struct intel_xe_perf *perf,
>+				  struct intel_xe_perf_logical_counter *counter,
>+				  const char *group_path)
>+{
>+	const char *group_path_end = group_path + strlen(group_path);
>+	struct intel_xe_perf_logical_counter_group *group = perf->root_group, *child_group = NULL;
>+	const char *name = group_path;
>+
>+	while (name < group_path_end) {
>+		const char *name_end = strstr(name, "/");
>+		char group_name[128] = { 0, };
>+		struct intel_xe_perf_logical_counter_group *iter_group;
>+
>+		if (!name_end)
>+			name_end = group_path_end;
>+
>+		memcpy(group_name, name, name_end - name);
>+
>+		child_group = NULL;
>+		igt_list_for_each_entry(iter_group, &group->groups, link) {
>+			if (!strcmp(iter_group->name, group_name)) {
>+				child_group = iter_group;
>+				break;
>+			}
>+		}
>+
>+		if (!child_group)
>+			child_group = intel_xe_perf_logical_counter_group_new(perf, group, group_name);
>+
>+		name = name_end + 1;
>+		group = child_group;
>+	}
>+
>+	igt_list_add_tail(&counter->link, &child_group->counters);
>+}
>+
>+void
>+intel_xe_perf_add_metric_set(struct intel_xe_perf *perf,
>+			     struct intel_xe_perf_metric_set *metric_set)
>+{
>+	igt_list_add_tail(&metric_set->link, &perf->metric_sets);
>+}
>+
>+static void
>+load_metric_set_config(struct intel_xe_perf_metric_set *metric_set, int drm_fd)
>+{
>+	struct drm_xe_oa_config config;
>+	u8 *regs;
>+	int ret;
>+
>+	memset(&config, 0, sizeof(config));
>+
>+	memcpy(config.uuid, metric_set->hw_config_guid, sizeof(config.uuid));
>+
>+	config.n_regs = metric_set->n_mux_regs +
>+		metric_set->n_b_counter_regs +
>+		metric_set->n_flex_regs;
>+	config.regs_ptr = to_user_pointer(malloc(2 * config.n_regs * sizeof(u32)));
>+	igt_assert(config.regs_ptr);
>+	regs = (u8 *)config.regs_ptr;
>+
>+	memcpy(regs, metric_set->mux_regs, 2 * metric_set->n_mux_regs * sizeof(u32));
>+	regs += 2 * metric_set->n_mux_regs * sizeof(u32);
>+	memcpy(regs, metric_set->b_counter_regs, 2 * metric_set->n_b_counter_regs * sizeof(u32));
>+	regs += 2 * metric_set->n_b_counter_regs * sizeof(u32);
>+	memcpy(regs, metric_set->flex_regs, 2 * metric_set->n_flex_regs * sizeof(u32));
>+	regs += 2 * metric_set->n_flex_regs * sizeof(u32);
>+
>+	ret = intel_xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_ADD_CONFIG, &config);
>+	if (ret >= 0)
>+		metric_set->perf_oa_metrics_set = ret;
>+
>+	free((void *)config.regs_ptr);
>+}
>+
>+void
>+intel_xe_perf_load_perf_configs(struct intel_xe_perf *perf, int drm_fd)
>+{
>+	int sysfs_dir_fd = open_master_sysfs_dir(drm_fd);
>+	struct dirent *entry;
>+	int metrics_dir_fd;
>+	DIR *metrics_dir;
>+	struct intel_xe_perf_metric_set *metric_set;
>+
>+	if (sysfs_dir_fd < 0)
>+		return;
>+
>+	metrics_dir_fd = openat(sysfs_dir_fd, "metrics", O_DIRECTORY);
>+	close(sysfs_dir_fd);
>+	if (metrics_dir_fd < -1)
>+		return;
>+
>+	metrics_dir = fdopendir(metrics_dir_fd);
>+	if (!metrics_dir) {
>+		close(metrics_dir_fd);
>+		return;
>+	}
>+
>+	while ((entry = readdir(metrics_dir))) {
>+		bool metric_id_read;
>+		uint64_t metric_id;
>+		char path[256 + 4];
>+		int id_fd;
>+
>+		if (entry->d_type != DT_DIR)
>+			continue;
>+
>+		snprintf(path, sizeof(path), "%s/id", entry->d_name);
>+
>+		id_fd = openat(metrics_dir_fd, path, O_RDONLY);
>+		if (id_fd < 0)
>+			continue;
>+
>+		metric_id_read = read_fd_uint64(id_fd, &metric_id);
>+		close(id_fd);
>+
>+		if (!metric_id_read)
>+			continue;
>+
>+		igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
>+			if (!strcmp(metric_set->hw_config_guid, entry->d_name)) {
>+				metric_set->perf_oa_metrics_set = metric_id;
>+				break;
>+			}
>+		}
>+	}
>+
>+	closedir(metrics_dir);
>+
>+	igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
>+		if (metric_set->perf_oa_metrics_set)
>+			continue;
>+
>+		load_metric_set_config(metric_set, drm_fd);
>+	}
>+}
>+
>+static void
>+accumulate_uint32(const uint32_t *report0,
>+                  const uint32_t *report1,
>+                  uint64_t *deltas)
>+{
>+	*deltas += (uint32_t)(*report1 - *report0);
>+}
>+
>+static void
>+accumulate_uint40(int a_index,
>+                  const uint32_t *report0,
>+                  const uint32_t *report1,
>+                  uint64_t *deltas)
>+{
>+	const uint8_t *high_bytes0 = (uint8_t *)(report0 + 40);
>+	const uint8_t *high_bytes1 = (uint8_t *)(report1 + 40);
>+	uint64_t high0 = (uint64_t)(high_bytes0[a_index]) << 32;
>+	uint64_t high1 = (uint64_t)(high_bytes1[a_index]) << 32;
>+	uint64_t value0 = report0[a_index + 4] | high0;
>+	uint64_t value1 = report1[a_index + 4] | high1;
>+	uint64_t delta;
>+
>+	if (value0 > value1)
>+		delta = (1ULL << 40) + value1 - value0;
>+	else
>+		delta = value1 - value0;
>+
>+	*deltas += delta;
>+}
>+
>+void intel_xe_perf_accumulate_reports(struct intel_xe_perf_accumulator *acc,
>+				      const struct intel_xe_perf *perf,
>+				      const struct intel_xe_perf_metric_set *metric_set,
>+				      const struct intel_xe_perf_record_header *record0,
>+				      const struct intel_xe_perf_record_header *record1)
>+{
>+	const uint32_t *start = (const uint32_t *)(record0 + 1);
>+	const uint32_t *end = (const uint32_t *)(record1 + 1);
>+	const uint64_t *start64 = (const uint64_t *)(record0 + 1);
>+	const uint64_t *end64 = (const uint64_t *)(record1 + 1);
>+	uint64_t *deltas = acc->deltas;
>+	int idx = 0;
>+	int i;
>+
>+	memset(acc, 0, sizeof(*acc));
>+
>+	switch (metric_set->perf_oa_format) {
>+	case XE_OA_FORMAT_A24u40_A14u32_B8_C8:
>+		/* timestamp */
>+		if (perf->devinfo.oa_timestamp_shift >= 0)
>+			deltas[idx++] += (end[1] - start[1]) << perf->devinfo.oa_timestamp_shift;
>+		else
>+			deltas[idx++] += (end[1] - start[1]) >> (-perf->devinfo.oa_timestamp_shift);
>+		accumulate_uint32(start + 3, end + 3, deltas + idx++); /* clock */
>+
>+		/* 4x 32bit A0-3 counters... */
>+		for (i = 0; i < 4; i++)
>+			accumulate_uint32(start + 4 + i, end + 4 + i, deltas + idx++);
>+
>+		/* 20x 40bit A4-23 counters... */
>+		for (i = 0; i < 20; i++)
>+			accumulate_uint40(i + 4, start, end, deltas + idx++);
>+
>+		/* 4x 32bit A24-27 counters... */
>+		for (i = 0; i < 4; i++)
>+			accumulate_uint32(start + 28 + i, end + 28 + i, deltas + idx++);
>+
>+		/* 4x 40bit A28-31 counters... */
>+		for (i = 0; i < 4; i++)
>+			accumulate_uint40(i + 28, start, end, deltas + idx++);
>+
>+		/* 5x 32bit A32-36 counters... */
>+		for (i = 0; i < 5; i++)
>+			accumulate_uint32(start + 36 + i, end + 36 + i, deltas + idx++);
>+
>+		/* 1x 32bit A37 counter... */
>+		accumulate_uint32(start + 46, end + 46, deltas + idx++);
>+
>+		/* 8x 32bit B counters + 8x 32bit C counters... */
>+		for (i = 0; i < 16; i++)
>+			accumulate_uint32(start + 48 + i, end + 48 + i, deltas + idx++);
>+		break;
>+
>+	case XE_OAR_FORMAT_A32u40_A4u32_B8_C8:
>+	case XE_OA_FORMAT_A32u40_A4u32_B8_C8:
>+		if (perf->devinfo.oa_timestamp_shift >= 0)
>+			deltas[idx++] += (end[1] - start[1]) << perf->devinfo.oa_timestamp_shift;
>+		else
>+			deltas[idx++] += (end[1] - start[1]) >> (-perf->devinfo.oa_timestamp_shift);
>+		accumulate_uint32(start + 3, end + 3, deltas + idx++); /* clock */
>+
>+		/* 32x 40bit A counters... */
>+		for (i = 0; i < 32; i++)
>+			accumulate_uint40(i, start, end, deltas + idx++);
>+
>+		/* 4x 32bit A counters... */
>+		for (i = 0; i < 4; i++)
>+			accumulate_uint32(start + 36 + i, end + 36 + i, deltas + idx++);
>+
>+		/* 8x 32bit B counters + 8x 32bit C counters... */
>+		for (i = 0; i < 16; i++)
>+			accumulate_uint32(start + 48 + i, end + 48 + i, deltas + idx++);
>+		break;
>+
>+	case XE_OAM_FORMAT_MPEC8u32_B8_C8:
>+		/* 64 bit timestamp */
>+		if (perf->devinfo.oa_timestamp_shift >= 0)
>+			deltas[idx++] += (end64[1] - start64[1]) << perf->devinfo.oa_timestamp_shift;
>+		else
>+			deltas[idx++] += (end64[1] - start64[1]) >> (-perf->devinfo.oa_timestamp_shift);
>+
>+		/* 64 bit clock */
>+		deltas[idx++] += end64[3] - start64[3];
>+
>+		/* 8x 32bit MPEC counters */
>+		for (i = 0; i < 8; i++)
>+			accumulate_uint32(start + 8 + i, end + 8 + i, deltas + idx++);
>+
>+		/* 8x 32bit B counters */
>+		for (i = 0; i < 8; i++)
>+			accumulate_uint32(start + 16 + i, end + 16 + i, deltas + idx++);
>+
>+		/* 8x 32bit C counters */
>+		for (i = 0; i < 8; i++)
>+			accumulate_uint32(start + 24 + i, end + 24 + i, deltas + idx++);
>+
>+		break;
>+
>+	case XE_OA_FORMAT_PEC64u64:
>+		/* 64 bit timestamp */
>+		if (perf->devinfo.oa_timestamp_shift >= 0)
>+			deltas[idx++] += (end64[1] - start64[1]) << perf->devinfo.oa_timestamp_shift;
>+		else
>+			deltas[idx++] += (end64[1] - start64[1]) >> (-perf->devinfo.oa_timestamp_shift);
>+
>+		/* 64 bit clock */
>+		deltas[idx++] += end64[3] - start64[3];
>+
>+		/* 64x 64bit PEC counters */
>+		for (i = 0; i < 64; i++)
>+			deltas[idx++] += end64[4 + i] - start64[4 + i];
>+
>+		break;
>+
>+	default:
>+		assert(0);
>+	}
>+}
>+
>+uint64_t intel_xe_perf_read_record_timestamp(const struct intel_xe_perf *perf,
>+					     const struct intel_xe_perf_metric_set *metric_set,
>+					     const struct intel_xe_perf_record_header *record)
>+{
>+       const uint32_t *report32 = (const uint32_t *)(record + 1);
>+       const uint64_t *report64 = (const uint64_t *)(record + 1);
>+       uint64_t ts;
>+
>+       switch (metric_set->perf_oa_format) {
>+       case XE_OA_FORMAT_A24u40_A14u32_B8_C8:
>+       case XE_OA_FORMAT_A32u40_A4u32_B8_C8:
>+               ts = report32[1];
>+               break;
>+
>+       case XE_OAM_FORMAT_MPEC8u32_B8_C8:
>+       case XE_OA_FORMAT_PEC64u64:
>+               ts = report64[1];
>+               break;
>+
>+       default:
>+               assert(0);
>+       }
>+
>+       if (perf->devinfo.oa_timestamp_shift >= 0)
>+	       ts <<= perf->devinfo.oa_timestamp_shift;
>+       else
>+	       ts >>= -perf->devinfo.oa_timestamp_shift;
>+
>+       return ts;
>+}
>+
>+uint64_t intel_xe_perf_read_record_timestamp_raw(const struct intel_xe_perf *perf,
>+						 const struct intel_xe_perf_metric_set *metric_set,
>+						 const struct intel_xe_perf_record_header *record)
>+{
>+       const uint32_t *report32 = (const uint32_t *)(record + 1);
>+       const uint64_t *report64 = (const uint64_t *)(record + 1);
>+       uint64_t ts;
>+
>+       switch (metric_set->perf_oa_format) {
>+       case XE_OA_FORMAT_A24u40_A14u32_B8_C8:
>+       case XE_OA_FORMAT_A32u40_A4u32_B8_C8:
>+               ts = report32[1];
>+               break;
>+
>+       case XE_OAM_FORMAT_MPEC8u32_B8_C8:
>+       case XE_OA_FORMAT_PEC64u64:
>+               ts = report64[1];
>+               break;
>+
>+       default:
>+               assert(0);
>+       }
>+
>+       if (perf->devinfo.oa_timestamp_shift >= 0)
>+	       ts <<= perf->devinfo.oa_timestamp_shift;
>+       else
>+	       ts >>= -perf->devinfo.oa_timestamp_shift;
>+
>+       return ts;
>+}
>+
>+const char *intel_xe_perf_read_report_reason(const struct intel_xe_perf *perf,
>+					     const struct intel_xe_perf_record_header *record)
>+{
>+	const uint32_t *report = (const uint32_t *) (record + 1);
>+
>+	/* Not really documented on Gfx7/7.5*/
>+	if (perf->devinfo.graphics_ver < 8)
>+		return "timer";
>+
>+	/* Gfx8-11 */
>+	if (perf->devinfo.graphics_ver < 12) {
>+		uint32_t reason = report[0] >> 19;
>+		if (reason & (1u << 0))
>+			return "timer";
>+		if (reason & (1u << 1))
>+			return "trigger1";
>+		if (reason & (1u << 2))
>+			return "trigger2";
>+		if (reason & (1u << 3))
>+			return "context-switch";
>+		if (reason & (1u << 4))
>+			return "go-transition";
>+
>+		if (perf->devinfo.graphics_ver >= 9 &&
>+		    reason & (1u << 5))
>+			return "clock-ratio-change";
>+
>+		return "unknown";
>+	}
>+
>+	/* Gfx12 */
>+	if (perf->devinfo.graphics_ver <= 12) {
>+		uint32_t reason = report[0] >> 19;
>+		if (reason & (1u << 0))
>+			return "timer";
>+		if (reason & (1u << 1))
>+			return "trigger1";
>+		if (reason & (1u << 2))
>+			return "trigger2";
>+		if (reason & (1u << 3))
>+			return "context-switch";
>+		if (reason & (1u << 4))
>+			return "go-transition";
>+		if (reason & (1u << 5))
>+			return "clock-ratio-change";
>+		if (reason & (1u << 6))
>+			return "mmio-trigger";
>+
>+		return "unknown";
>+	}
>+
>+	return "unknown";
>+}
>+
>+static void xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
>+			      struct drm_xe_ext_set_property *extn)
>+{
>+	__u64 *prop = (__u64 *)properties->properties_ptr;
>+	struct drm_xe_ext_set_property *ext = extn;
>+	int i, j;
>+
>+	for (i = 0; i < properties->num_properties; i++) {
>+		ext->base.name = DRM_XE_OA_EXTENSION_SET_PROPERTY;
>+		ext->property = *prop++;
>+		ext->value = *prop++;
>+		ext++;
>+	}
>+
>+	igt_assert_lte(1, i);
>+	ext = extn;
>+	for (j = 0; j < i - 1; j++)
>+		ext[j].base.next_extension = (__u64)&ext[j + 1];
>+}
>+
>+int intel_xe_perf_ioctl(int fd, enum drm_xe_perf_op op, void *arg)
>+{
>+#define XE_OA_MAX_SET_PROPERTIES 16
>+
>+	struct drm_xe_ext_set_property ext[XE_OA_MAX_SET_PROPERTIES] = {};
>+
>+	/* Chain the PERF layer struct */
>+	struct drm_xe_perf_param p = {
>+		.extensions = 0,
>+		.perf_type = DRM_XE_PERF_TYPE_OA,
>+		.perf_op = op,
>+		.param = (__u64)((op == DRM_XE_PERF_OP_STREAM_OPEN) ? ext : arg),
>+	};
>+
>+	if (op == DRM_XE_PERF_OP_STREAM_OPEN) {
>+		struct intel_xe_oa_open_prop *oprop = (struct intel_xe_oa_open_prop *)arg;
>+
>+		igt_assert_lte(oprop->num_properties, XE_OA_MAX_SET_PROPERTIES);
>+		xe_oa_prop_to_ext(oprop, ext);
>+	}
>+
>+	return igt_ioctl(fd, DRM_IOCTL_XE_PERF, &p);
>+}
>+
>+void intel_xe_perf_ioctl_err(int fd, enum drm_xe_perf_op op, void *arg, int err)
>+{
>+	igt_assert_eq(intel_xe_perf_ioctl(fd, op, arg), -1);
>+	igt_assert_eq(errno, err);
>+	errno = 0;
>+}
>diff --git a/lib/xe/xe_oa.h b/lib/xe/xe_oa.h
>new file mode 100644
>index 0000000000..c16177ec8e
>--- /dev/null
>+++ b/lib/xe/xe_oa.h
>@@ -0,0 +1,407 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#ifndef XE_OA_H
>+#define XE_OA_H
>+
>+#ifdef __cplusplus
>+extern "C" {
>+#endif
>+
>+#include <stdbool.h>
>+#include <stdint.h>
>+
>+#include "igt_list.h"
>+#include <xe_drm.h>
>+
>+#define _DIV_ROUND_UP(a, b)  (((a) + (b) - 1) / (b))
>+
>+#define INTEL_XE_DEVICE_MAX_SLICES           (8)
>+#define INTEL_XE_DEVICE_MAX_SUBSLICES        (32)
>+#define INTEL_XE_DEVICE_MAX_EUS_PER_SUBSLICE (16) /* Maximum on gfx12 */
>+
>+enum intel_xe_oa_format_name {
>+	XE_OA_FORMAT_C4_B8 = 1,
>+
>+	/* Gen8+ */
>+	XE_OA_FORMAT_A12,
>+	XE_OA_FORMAT_A12_B8_C8,
>+	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
>+
>+	/* DG2 */
>+	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
>+	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
>+
>+	/* DG2/MTL OAC */
>+	XE_OAC_FORMAT_A24u64_B8_C8,
>+	XE_OAC_FORMAT_A22u32_R2u32_B8_C8,
>+
>+	/* MTL OAM */
>+	XE_OAM_FORMAT_MPEC8u64_B8_C8,
>+	XE_OAM_FORMAT_MPEC8u32_B8_C8,
>+
>+	/* Xe2+ */
>+	XE_OA_FORMAT_PEC64u64,
>+	XE_OA_FORMAT_PEC64u64_B8_C8,
>+	XE_OA_FORMAT_PEC64u32,
>+	XE_OA_FORMAT_PEC32u64_G1,
>+	XE_OA_FORMAT_PEC32u32_G1,
>+	XE_OA_FORMAT_PEC32u64_G2,
>+	XE_OA_FORMAT_PEC32u32_G2,
>+	XE_OA_FORMAT_PEC36u64_G1_32_G2_4,
>+	XE_OA_FORMAT_PEC36u64_G1_4_G2_32,
>+
>+	XE_OA_FORMAT_MAX,
>+};
>+
>+struct intel_xe_perf_devinfo {
>+	char devname[20];
>+	char prettyname[100];
>+
>+	/*
>+	 * Always false for gputop, we don't have the additional
>+	 * snapshots of register values, only the OA reports.
>+	 */
>+	bool query_mode;
>+
>+	bool has_dynamic_configs;
>+
>+	/* The following fields are prepared for equations from the XML files.
>+	 * Their values are build up from the topology fields.
>+	 */
>+	uint32_t devid;
>+	uint32_t graphics_ver;
>+	uint32_t revision;
>+	/**
>+	 * Bit shifting required to put OA report timestamps into
>+	 * timestamp_frequency (some HW generations can shift
>+	 * timestamp values to the right by a number of bits).
>+	 */
>+	int32_t  oa_timestamp_shift;
>+	/**
>+	 * On some platforms only part of the timestamp bits are valid
>+	 * (on previous platforms we would get full 32bits, newer
>+	 * platforms can have fewer). It's important to know when
>+	 * correlating the full 36bits timestamps to the OA report
>+	 * timestamps.
>+	 */
>+	uint64_t  oa_timestamp_mask;
>+	/* Frequency of the timestamps in Hz */
>+	uint64_t timestamp_frequency;
>+	uint64_t gt_min_freq;
>+	uint64_t gt_max_freq;
>+
>+	/* Total number of EUs */
>+	uint64_t n_eus;
>+	/* Total number of EUs in a slice */
>+	uint64_t n_eu_slices;
>+	/* Total number of subslices/dualsubslices */
>+	uint64_t n_eu_sub_slices;
>+	/* Number of subslices/dualsubslices in the first half of the
>+	 * slices.
>+	 */
>+	uint64_t n_eu_sub_slices_half_slices;
>+	/* Mask of available subslices/dualsubslices */
>+	uint64_t subslice_mask;
>+	/* Mask of available slices */
>+	uint64_t slice_mask;
>+	/* Number of threads in one EU */
>+	uint64_t eu_threads_count;
>+
>+	/**
>+	 * Maximu number of slices present on this device (can be more than
>+	 * num_slices if some slices are fused).
>+	 */
>+	uint16_t max_slices;
>+
>+	/**
>+	 * Maximu number of subslices per slice present on this device (can be more
>+	 * than the maximum value in the num_subslices[] array if some subslices are
>+	 * fused).
>+	 */
>+	uint16_t max_subslices_per_slice;
>+
>+	/**
>+	 * Stride to access subslice_masks[].
>+	 */
>+	uint16_t subslice_slice_stride;
>+
>+	/**
>+	 * Maximum number of EUs per subslice (can be more than
>+	 * num_eu_per_subslice if some EUs are fused off).
>+	 */
>+	uint16_t max_eu_per_subslice;
>+
>+	/**
>+	 * Strides to access eu_masks[].
>+	 */
>+	uint16_t eu_slice_stride;
>+	uint16_t eu_subslice_stride;
>+
>+	/**
>+	 * A bit mask of the slices available.
>+	 */
>+	uint8_t slice_masks[_DIV_ROUND_UP(INTEL_XE_DEVICE_MAX_SLICES, 8)];
>+
>+	/**
>+	 * An array of bit mask of the subslices available, use subslice_slice_stride
>+	 * to access this array.
>+	 */
>+	uint8_t subslice_masks[INTEL_XE_DEVICE_MAX_SLICES *
>+			       _DIV_ROUND_UP(INTEL_XE_DEVICE_MAX_SUBSLICES, 8)];
>+
>+	/**
>+	 * An array of bit mask of EUs available, use eu_slice_stride &
>+	 * eu_subslice_stride to access this array.
>+	 */
>+	uint8_t eu_masks[INTEL_XE_DEVICE_MAX_SLICES *
>+			 INTEL_XE_DEVICE_MAX_SUBSLICES *
>+			 _DIV_ROUND_UP(INTEL_XE_DEVICE_MAX_EUS_PER_SUBSLICE, 8)];
>+};
>+
>+typedef enum {
>+	INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_UINT64,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_UINT32,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_DOUBLE,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_FLOAT,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_BOOL32,
>+} intel_xe_perf_logical_counter_storage_t;
>+
>+typedef enum {
>+	INTEL_XE_PERF_LOGICAL_COUNTER_TYPE_RAW,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_TYPE_DURATION_RAW,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_TYPE_DURATION_NORM,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_TYPE_EVENT,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_TYPE_THROUGHPUT,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_TYPE_TIMESTAMP,
>+} intel_xe_perf_logical_counter_type_t;
>+
>+typedef enum {
>+	/* size */
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_BYTES,
>+
>+	/* frequency */
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_HZ,
>+
>+	/* time */
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_NS,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_US,
>+
>+	/**/
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_PIXELS,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_TEXELS,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_THREADS,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_PERCENT,
>+
>+	/* events */
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_MESSAGES,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_NUMBER,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_CYCLES,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_EVENTS,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_UTILIZATION,
>+
>+	/**/
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_EU_SENDS_TO_L3_CACHE_LINES,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_EU_ATOMIC_REQUESTS_TO_L3_CACHE_LINES,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_EU_REQUESTS_TO_L3_CACHE_LINES,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_EU_BYTES_PER_L3_CACHE_LINE,
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_GBPS,
>+
>+	INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_MAX
>+} intel_xe_perf_logical_counter_unit_t;
>+
>+/* Hold deltas of raw performance counters. */
>+struct intel_xe_perf_accumulator {
>+#define INTEL_XE_PERF_MAX_RAW_OA_COUNTERS 128
>+	uint64_t deltas[INTEL_XE_PERF_MAX_RAW_OA_COUNTERS];
>+};
>+
>+struct intel_xe_perf;
>+struct intel_xe_perf_metric_set;
>+struct intel_xe_perf_logical_counter {
>+	const struct intel_xe_perf_metric_set *metric_set;
>+	const char *name;
>+	const char *symbol_name;
>+	const char *desc;
>+	const char *group;
>+	bool (*availability)(const struct intel_xe_perf *perf);
>+	intel_xe_perf_logical_counter_storage_t storage;
>+	intel_xe_perf_logical_counter_type_t type;
>+	intel_xe_perf_logical_counter_unit_t unit;
>+	union {
>+		uint64_t (*max_uint64)(const struct intel_xe_perf *perf,
>+				       const struct intel_xe_perf_metric_set *metric_set,
>+				       uint64_t *deltas);
>+		double (*max_float)(const struct intel_xe_perf *perf,
>+				    const struct intel_xe_perf_metric_set *metric_set,
>+				    uint64_t *deltas);
>+	};
>+
>+	union {
>+		uint64_t (*read_uint64)(const struct intel_xe_perf *perf,
>+					const struct intel_xe_perf_metric_set *metric_set,
>+					uint64_t *deltas);
>+		double (*read_float)(const struct intel_xe_perf *perf,
>+				     const struct intel_xe_perf_metric_set *metric_set,
>+				     uint64_t *deltas);
>+	};
>+
>+	struct igt_list_head link; /* list from intel_xe_perf_logical_counter_group.counters */
>+};
>+
>+struct intel_xe_perf_register_prog {
>+	uint32_t reg;
>+	uint32_t val;
>+};
>+
>+struct intel_xe_perf_metric_set {
>+	const char *name;
>+	const char *symbol_name;
>+	const char *hw_config_guid;
>+
>+	struct intel_xe_perf_logical_counter *counters;
>+	int n_counters;
>+
>+	uint64_t perf_oa_metrics_set;
>+	int perf_oa_format;
>+	int perf_raw_size;
>+
>+	/* For indexing into accumulator->deltas[] ... */
>+	int gpu_time_offset;
>+	int gpu_clock_offset;
>+	int a_offset;
>+	int b_offset;
>+	int c_offset;
>+	int perfcnt_offset;
>+
>+	const struct intel_xe_perf_register_prog *b_counter_regs;
>+	uint32_t n_b_counter_regs;
>+
>+	const struct intel_xe_perf_register_prog *mux_regs;
>+	uint32_t n_mux_regs;
>+
>+	const struct intel_xe_perf_register_prog *flex_regs;
>+	uint32_t n_flex_regs;
>+
>+	struct igt_list_head link;
>+};
>+
>+/* A tree structure with group having subgroups and counters. */
>+struct intel_xe_perf_logical_counter_group {
>+	char *name;
>+
>+	struct igt_list_head counters;
>+	struct igt_list_head groups;
>+
>+	struct igt_list_head link;  /* link for intel_xe_perf_logical_counter_group.groups */
>+};
>+
>+struct intel_xe_perf {
>+	const char *name;
>+
>+	struct intel_xe_perf_logical_counter_group *root_group;
>+
>+	struct igt_list_head metric_sets;
>+
>+	struct intel_xe_perf_devinfo devinfo;
>+};
>+
>+/* This is identical to 'struct drm_i915_query_topology_info' at present */
>+struct intel_xe_topology_info {
>+	uint16_t flags;
>+	uint16_t max_slices;
>+	uint16_t max_subslices;
>+	uint16_t max_eus_per_subslice;
>+	uint16_t subslice_offset;
>+	uint16_t subslice_stride;
>+	uint16_t eu_offset;
>+	uint16_t eu_stride;
>+	uint8_t data[];
>+};
>+
>+struct intel_xe_perf_record_header {
>+	uint32_t type;
>+	uint16_t pad;
>+	uint16_t size;
>+};
>+
>+static inline bool
>+intel_xe_perf_devinfo_slice_available(const struct intel_xe_perf_devinfo *devinfo,
>+				      int slice)
>+{
>+	return (devinfo->slice_masks[slice / 8] & (1U << (slice % 8))) != 0;
>+}
>+
>+static inline bool
>+intel_xe_perf_devinfo_subslice_available(const struct intel_xe_perf_devinfo *devinfo,
>+					 int slice, int subslice)
>+{
>+	return (devinfo->subslice_masks[slice * devinfo->subslice_slice_stride +
>+					subslice / 8] & (1U << (subslice % 8))) != 0;
>+}
>+
>+static inline bool
>+intel_xe_perf_devinfo_eu_available(const struct intel_xe_perf_devinfo *devinfo,
>+				   int slice, int subslice, int eu)
>+{
>+	unsigned subslice_offset = slice * devinfo->eu_slice_stride +
>+		subslice * devinfo->eu_subslice_stride;
>+
>+	return (devinfo->eu_masks[subslice_offset + eu / 8] & (1U << eu % 8)) != 0;
>+}
>+
>+struct intel_xe_topology_info *
>+xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size);
>+
>+struct intel_xe_perf *intel_xe_perf_for_fd(int drm_fd, int gt);
>+struct intel_xe_perf *intel_xe_perf_for_devinfo(uint32_t device_id,
>+						uint32_t revision,
>+						uint64_t timestamp_frequency,
>+						uint64_t gt_min_freq,
>+						uint64_t gt_max_freq,
>+						const struct intel_xe_topology_info *topology);
>+void intel_xe_perf_free(struct intel_xe_perf *perf);
>+
>+void intel_xe_perf_add_logical_counter(struct intel_xe_perf *perf,
>+				       struct intel_xe_perf_logical_counter *counter,
>+				       const char *group);
>+
>+void intel_xe_perf_add_metric_set(struct intel_xe_perf *perf,
>+				  struct intel_xe_perf_metric_set *metric_set);
>+
>+void intel_xe_perf_load_perf_configs(struct intel_xe_perf *perf, int drm_fd);
>+
>+
>+struct intel_xe_oa_open_prop {
>+	uint32_t num_properties;
>+	uint32_t reserved;
>+	uint64_t properties_ptr;
>+};
>+
>+void intel_xe_perf_accumulate_reports(struct intel_xe_perf_accumulator *acc,
>+				      const struct intel_xe_perf *perf,
>+				      const struct intel_xe_perf_metric_set *metric_set,
>+				      const struct intel_xe_perf_record_header *record0,
>+				      const struct intel_xe_perf_record_header *record1);
>+
>+uint64_t intel_xe_perf_read_record_timestamp(const struct intel_xe_perf *perf,
>+					     const struct intel_xe_perf_metric_set *metric_set,
>+					     const struct intel_xe_perf_record_header *record);
>+
>+uint64_t intel_xe_perf_read_record_timestamp_raw(const struct intel_xe_perf *perf,
>+						 const struct intel_xe_perf_metric_set *metric_set,
>+						 const struct intel_xe_perf_record_header *record);
>+
>+const char *intel_xe_perf_read_report_reason(const struct intel_xe_perf *perf,
>+					     const struct intel_xe_perf_record_header *record);
>+
>+int intel_xe_perf_ioctl(int fd, enum drm_xe_perf_op op, void *arg);
>+void intel_xe_perf_ioctl_err(int fd, enum drm_xe_perf_op op, void *arg, int err);
>+
>+#ifdef __cplusplus
>+};
>+#endif
>+
>+#endif /* XE_OA_H */
>diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>index 145dee8142..84eaaac967 100644
>--- a/lib/xe/xe_query.c
>+++ b/lib/xe/xe_query.c
>@@ -114,6 +114,27 @@ static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
> 	return mem_regions;
> }
>
>+static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
>+{
>+	struct drm_xe_query_oa_units *oa_units;
>+	struct drm_xe_device_query query = {
>+		.extensions = 0,
>+		.query = DRM_XE_DEVICE_QUERY_OA_UNITS,
>+		.size = 0,
>+		.data = 0,
>+	};
>+
>+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>+
>+	oa_units = malloc(query.size);
>+	igt_assert(oa_units);
>+
>+	query.data = to_user_pointer(oa_units);
>+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>+
>+	return oa_units;
>+}
>+
> static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list, int gt)
> {
> 	uint64_t region;
>@@ -251,6 +272,7 @@ struct xe_device *xe_device_get(int fd)
> 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
> 	xe_dev->engines = xe_query_engines(fd);
> 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
>+	xe_dev->oa_units = xe_query_oa_units_new(fd);
> 	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
> 	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
> 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
>@@ -525,6 +547,22 @@ uint32_t xe_min_page_size(int fd, uint64_t region)
>  */
> xe_dev_FN(xe_config, config, struct drm_xe_query_config *);
>
>+/**
>+ * xe_gt_list:
>+ * @fd: xe device fd
>+ *
>+ * Returns query gts of xe device @fd.
>+ */
>+xe_dev_FN(xe_gt_list, gt_list, struct drm_xe_query_gt_list *);
>+
>+/**
>+ * xe_oa_units:
>+ * @fd: xe device fd
>+ *
>+ * Returns query gts of xe device @fd.
>+ */
>+xe_dev_FN(xe_oa_units, oa_units, struct drm_xe_query_oa_units *);
>+
> /**
>  * xe_number_engine:
>  * @fd: xe device fd
>diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>index 54115f8f7c..c33f91ca11 100644
>--- a/lib/xe/xe_query.h
>+++ b/lib/xe/xe_query.h
>@@ -38,6 +38,9 @@ struct xe_device {
> 	/** @mem_regions: regions memory information and usage */
> 	struct drm_xe_query_mem_regions *mem_regions;
>
>+	/** @oa_units: information about OA units */
>+	struct drm_xe_query_oa_units *oa_units;
>+
> 	/** @vram_size: array of vram sizes for all gt_list */
> 	uint64_t *vram_size;
>
>@@ -85,6 +88,8 @@ const char *xe_region_name(uint64_t region);
> uint16_t xe_region_class(int fd, uint64_t region);
> uint32_t xe_min_page_size(int fd, uint64_t region);
> struct drm_xe_query_config *xe_config(int fd);
>+struct drm_xe_query_gt_list *xe_gt_list(int fd);
>+struct drm_xe_query_oa_units *xe_oa_units(int fd);
> unsigned int xe_number_engines(int fd);
> bool xe_has_vram(int fd);
> uint64_t xe_vram_size(int fd, int gt);
>-- 
>2.41.0
>
