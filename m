Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773ECCCD1BC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 13:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE1710E8FE;
	Thu, 23 Oct 2025 13:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aT/42D3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C8210E8FE
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 13:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761225708; x=1792761708;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q1xaOlmMRjEhx2iZylcKIOfHGQvYIB2D+80kuSWNgb0=;
 b=aT/42D3SPbdyvaHNsEkV8d3Ks/OpKAqe4+fGdCCDHfCZLCD6XJwLXt5w
 J0zKDlMKnIefzLcyPm6vl3YNCqeVaCBW3dNFlI9KLAprX+jWlYd33jytZ
 ZERlEUla96nt8FeGoLbjTy7B3iq7Tsw/doPAWNdhZh0kVOqanfUtUh21D
 1AU+xugT0ht4/Alj4KTBiZuZm4Kh+QkcfKWbiOC2xuvb0gGz82tVgZQxQ
 Cw8o2MBMcdNvVBp3zZd/LHOPWGtmR10wOUogj/0cDfYZPbJEcQWyo+LnU
 iybgYOaVHlur3gdACuyUWS814HT7ls3kCyaHhNKJWo0Ml21OzYBJIqV7d w==;
X-CSE-ConnectionGUID: 8itgofZ2QmiqhVbz1b9qdw==
X-CSE-MsgGUID: pXoFYWFeQaKt8dK2Ta9Mnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67231004"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67231004"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:21:48 -0700
X-CSE-ConnectionGUID: RbFrrJ/wSqC8uNi95F/xmQ==
X-CSE-MsgGUID: VkJDa1PpT/qACfXyd8M7RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184048753"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:21:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:21:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 06:21:48 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:21:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyHpiFTxYnhJhOzBYx5w0PfF6PkDNaHvulsrmQ/utaLzgrzWQcCBflZUwRDaDwg4UsZblJxb3fpm2e0DSA5qvvPX4nngkynNgdJKl9wWUX66D0n04wuHJngMPDA8EqlAz/zVCM9F4isRJtepkhr4HbRsGeamRYGof+0n38MAoB6kzZNEK3kc57dAunZf9SinK6unDirCnjWRWFK88JCwlnv9fZ4aKpRp5BogwckNUEBZraVDfQdMwaoRrB+S8lGmGWcx+ebe4bUfCUiqLj2Je+uUFNLsqfKf0VttUbvKzgCuIRxXqRYVElfdc+Zl5+oErioLPS3L5PaHyd77MtgNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJpL84NbPKFInz+zGSZP3Sk2Gb5LFZk16NDNIzIfGKI=;
 b=s5v9j3bOJd4JZFODancOcVBIKlx4IJu8m+f48Ebs44/y+9qT4hK9Q1nq1A9Yu4VHOEwbp4GhSt/Rr5N72V2iIc5QMWHXk6PguwJftbNLrUaqz5S/j7oOebll4UHBDCXCHyFLRvSW5gSKxY1V9dDjyBD+P5DveUBZXE19fZxeAZgxQgxNzlvOvjkv/T/THRVul3bO5/+hxkMVzEi+KfDi7qhUrRXGyYhkIhZyddDt+2ppEbQNySxcAgvIBOOeIAZNchQhwYcjJ6nG41yl55TCvfDrojgdaSow1BMdQBRMNWaDvBJrTKo1KZG0IP+YDNnaUaizj/utBHZQvVqHugq+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:21:46 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 13:21:46 +0000
Date: Thu, 23 Oct 2025 13:21:41 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, <dmitry.v.rogozhkin@intel.com>,
 <sebastian.brzezinka@intel.com>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <dmitry.v.rogozhkin@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t 3/3] intel_gpu_top: Add usage note about i915
 compatibility and Xe driver transition
Message-ID: <26d376252a4ebc1ca256e476bba0b42611769225.1761225010.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.34.1
References: <cover.1761225010.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <cover.1761225010.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0280.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::26) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: c36cbb4c-8f92-4e60-3106-08de12371d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3pKaURyOTZ3aDluSkpUNG1PWE1BRXZaamFKR2l6NkIvSUNHZmUzOEhsTXpr?=
 =?utf-8?B?bzFwMlJsOVk4TVNyUEdHMWVqYWNOdjg0MTEzOGdhUHJBZnFTWmRoenJBYjZL?=
 =?utf-8?B?c2ZUUkRSb1FKRk1ZOVVOZ3pOU0hPY1FXUk14V0w3MHRHUmtNL2VPQ1NFa29L?=
 =?utf-8?B?YjUySDU1UjlJNUpNQXJWNHFsb0N6N3FHUG5lS3JlU1JyKzhINmlyaXo5a2dX?=
 =?utf-8?B?MElyMXhsNXErY1ByckxRcmEyVTNKL3RCZHg0ellFOHdHUmthTGkvd21JRC9E?=
 =?utf-8?B?MUV2bVdUSnFzWSsyalNJdlpHUVhvMENhUm5hTUlvWTcrWmYvS3pZQ014WGs3?=
 =?utf-8?B?VEFRc1RON3VlTlE2OU4yb1IwQTA0YngvcUJWK2Rjb1d2MzJkVEpnWVI5UkNT?=
 =?utf-8?B?TkUyc0diekQvK2NOQXBacjA4bU50aTQvQkxJemhRaWQzUUgzcWVDOXNUblM3?=
 =?utf-8?B?cUxXVG12UnAwaDZTV1hFVjdQSW96dUE4Y1NubG5kdkRPN1doY3M0QTlsWlNX?=
 =?utf-8?B?aFpvQTFyNHB2UDQ1OW9TQkQxWDN6ZEF1Z29oK2ROWEFrODJ1V1VvSWVSbmNm?=
 =?utf-8?B?YUxXaTVENFpTRkVXVW5kVTFZbHByeEVQa012M3hLcXJCaXF4OUJJTjU0ajN1?=
 =?utf-8?B?S3RQSW9ONlVzQVV5MDYzalJ1UXZEdXJPc2RFVGR0T1VRbkxQR3RnZ21XZ2lJ?=
 =?utf-8?B?SnpFQXVvd2FnRzFTWE9YM3l4REEycDRtZzBDMURoT2pLY0lmYVB1eG4zMTlE?=
 =?utf-8?B?Q3k2QjMyRDA1QlI0VWZqUHNXeDM4T09NYWprU3V3c3dWcHhTa2w4SGJqTDhL?=
 =?utf-8?B?SFNxV0Mxby90RDZ3c2ZsWEkrWlI0MU55ajVBVVZZam9MVzhjczJYSTFMdzc1?=
 =?utf-8?B?OVhPWG40eU5qbUJvaGVMRkNRNGFYVW1mOTVRdE41bkdtNEVBU3hQTU4vVlBx?=
 =?utf-8?B?VjVMa3FSNHlyWFFzRVl6SU0xTkFhckNHSHpFL05nL29KS1ZQYU1OeGpuMk53?=
 =?utf-8?B?d0ZCN1dOcFNKZUFPMW9OWWc1NGFVSmJXTEZpNWtGbGtQU0xpbjVtNGJrNzd2?=
 =?utf-8?B?enZ4ZjJKc1FQeXQvdStsNTVITnRJMmlreU91MGRlT1J0M2YxbEJCWWVlZGl4?=
 =?utf-8?B?TnkrSGVkM0xoblVYUjI4b1R4ZGU1TDRRRURHNUlzTkNlYlRGdEVQM21NMkVo?=
 =?utf-8?B?azFqNnN6bTBNOGtTYklKWDY2Wm5YTU5rK1I5L2xIVzN3bTdJSDQ1b05FTzR6?=
 =?utf-8?B?U000QTVtbVVaM3ZaN21wT2VqaEV5eUZLZDkzWXU2Qys4V0lhaDgxSjN5bjFY?=
 =?utf-8?B?MG0vZjZUVUM0SHVKSFlXZTdFZXdWT0VvNmc2YnpLVHRSMGtzbXJhZlIxZlg2?=
 =?utf-8?B?QkhTWVpBS3VsbENsZU5KcFZoU1FNemx3NUpDeHJwYjdROWgwV1RQR2hWNWZi?=
 =?utf-8?B?SjZsT005YlF6b0JjTVp2OTN1cklYclNGZGNTdzhJbWNUZjI5azQrRURhSmgv?=
 =?utf-8?B?WE83T1NvMnRNRk5CZTZsVTlydXBCWkVvS2VkNi9sNmxBb0t4NFpTc0owakRp?=
 =?utf-8?B?QXduM2U4RUpOcWlXMUFhdHFCeDd0QnMzakdpTmFWZ1ZlRUl6cWNsVHpWVnlN?=
 =?utf-8?B?eGZJaGhKcHJpSEVjUG96TXZEMGhXOURhZDB5T1RnWHc0Zy8vWlhxbklIcVVC?=
 =?utf-8?B?RFVRWVpHMk8wRUZnRjFGSTRmRE9jR0tob0ZSUkczTEJZSzFLMlhEdFNMbTdZ?=
 =?utf-8?B?eW5aMy95dElOa1hzU0x6M0pkQlBZUFRTT2hROFJPUDNpMTBMMzJxMUU0NWk0?=
 =?utf-8?B?SGdnNTNrM1BJeTBKbVdIUkV3M3JaMTlzclVzdVVCL3BKemNUQ25aRmFFWWM2?=
 =?utf-8?B?OFp1emFUZGJVbE9IZDZONk1KSDRwV2dwWStjUXQrYWN3SUFydW5TOWlybmYy?=
 =?utf-8?Q?VyXus7sfYxzG8icSznCRKegO24Kg6D1M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2xzcnFBQmVLcXFUbHlDNTBFeisrUnc1YjEyMDdlcHZmTVFmVmUrNHRWblF5?=
 =?utf-8?B?TlZnV0d5ZlAySE94a1BqUDEwZHZBYXZZVk0wNFp3SUVkU09KQlVrTzZCcDdN?=
 =?utf-8?B?V09MVzkxc3hRanVTMTBIL3h2RTlIZjZBd1l6UUk4c3ZBWTZzMjBPajlBUDMx?=
 =?utf-8?B?ckFpVktkT1RMZXFmQUN2Zi8wNTlWSG9paGJEYjd5Qnl4bm9ITVRGRTNzeThh?=
 =?utf-8?B?eTRhRThuS2RnWThsbWE3N3RUNC8zZzBKUFpUUm1BNVNMYThWa3BwNDU3eHFz?=
 =?utf-8?B?RUJMWmd3Y2d3NXM1aVBoTHNERHFXQ3VOYjYyb3Z3ZUFCUnVRMVFhNTUrR2lY?=
 =?utf-8?B?RE1DV2hMNWFBZmtaNUtlVUVIMEl3UGgxM2cxVTJiMFBpQ29vTytIZkpiUVBn?=
 =?utf-8?B?Y291eWJmd2NCQWROM0g0a21oOVAwbWVGQ2l4cy9WTFE3eWlhamhmb3dDblp0?=
 =?utf-8?B?bE95U3paTjBFS3QwWWtTem5kS0U3RHIxdnhSUmdVTzZ6bzNrUkk3ZnNQQnYx?=
 =?utf-8?B?bG5VTzRwSzB6QlpBZ1dMOC8zUUFJdG1YTzVnakY3WnpEdkZ2bU1MU3FsRnpC?=
 =?utf-8?B?VThLU2tYUDJ4VDFjdDdVUEo4VXBKeGMyMjN6RExKRXJUQjBWOVhXR0JHd1Bu?=
 =?utf-8?B?ZnhjcWNsY3pkdlMxaW1DNXhyeWxGNWhvMHJFUGRRaEJscGNTSFlhSkxIakV3?=
 =?utf-8?B?Q0pjT0l6encwamd1bWlKT05hUkFmazB4OGNyOFdFSDlSdzVtWFRuYWJFSk5V?=
 =?utf-8?B?Y1JWeVZSQ0tGSytoM1RBSHMydkcyVmVpTHhQS2hTd3JmRlBBOTNOWE1odDNk?=
 =?utf-8?B?QmNnU2tzN0F5cm9XQUJrQm1oQkdJdVlPUHcwNEZiQXI5ZHphSHBjWlRNWmdv?=
 =?utf-8?B?bVdGdnJ2TnlUcGQxanNIeGU5MmJwOFpSREtnWk5Jdi93Z01WWFpUWVF2VDJr?=
 =?utf-8?B?RmtCZldjaS80RVN3OUNoV2tPc1l4MVg5NTBLQXVxN1pvZnAyY3JIQnE0QlZ3?=
 =?utf-8?B?OTVjUTNxWE1DZi8rNnlPbmxqOVhrakJyd2pPekxCa2paeExRMC8zWHc5a3dw?=
 =?utf-8?B?dWJNYng3TzE3RFBSZVRBN0kxUms5eFRpLzZJbldzWXMwbi94OVZYdFZhMjRO?=
 =?utf-8?B?QXlaaVZrc3BOTzYyZlViZ2h4cEw3ZUtRU0pHMHZuYVEzS1U0V3BnOWdEL0hk?=
 =?utf-8?B?bEF5OEgyTEpSc25VY3FQeSsxZ3hJVVpBV1hPRnIvdWZmRXJscEVTRFh6K2tL?=
 =?utf-8?B?NHFUVThVSll5ZFd5SjgwTFBYb3VDcXpiRUZ2c1V6dmhpWlBiQ0NxRE8zZmIw?=
 =?utf-8?B?clhxS09PcVJKWWhJWXBkd0FZV0hqaVpMT0krZFBSZlVtWUxnWGUrdGxJVDZ5?=
 =?utf-8?B?ZXFmelBGaU9ndTByTjRaWk9kNk5NaEhyZUx5SVlxVlJhZWg1a3NaT0tUM3o5?=
 =?utf-8?B?NTRjeWk2V09PVFMvYnlHek9kMldiVVJuYjRHT1l4YlZBVXNza0dvMXN3bG1h?=
 =?utf-8?B?ZVY2dzV1UGlZL24xRTh1QUtWMnR6QVdYbk8zUStNOC9oWDBONndmSld0a2Zl?=
 =?utf-8?B?ekZ5U1VuMGR4WmVla3R5S2V5YzcrMy92VGFpZXNRUDFvb1FmWnVqUlJiSkxB?=
 =?utf-8?B?anVLWEgwRzIyOU91RGF3NFg3Q3U1OEVadmpKR3NRNklOaTlJZDZhcXVSb1Z4?=
 =?utf-8?B?NDZJbUhBK3VicHF3ZHpFcUFaUTdXT1EyZSt0ZVBIM09YRGVmQ2RvbmRWT3RO?=
 =?utf-8?B?TG9DdWYrczIrMVNHWTJlV0NSZXF0TUVyZHNPUDI0SnhDeDlyR2tYdU1WaTlQ?=
 =?utf-8?B?akYycE9hNDJyS2tieHBqd2J3eURVZUM4WVFRb3Nwemh3NHA2ZG5lNm0wU3Az?=
 =?utf-8?B?clVzYmc0YlBwQWh3c2g2ZGFydDRaVFJIVmhLUGVCYmxmRks4eHk3R1YxV25J?=
 =?utf-8?B?am9ublA1OTNTbUhxS3VCa0V0bE9IVGQ4VkRvUURIQTdpOC9HdWhvbVdQNVNY?=
 =?utf-8?B?aFJUbTlHRmNJelJhQlkrd3Jid2o3OXFzZldDY2VqbGZIWjVaUklRcHFIWnM5?=
 =?utf-8?B?NG00ZTdIcnlpU0RPL0NRUHR3bHhjVWRUNHhSdmRvL216blhzRUNzYjhmQktu?=
 =?utf-8?B?VElRY2xGS01nNThjSUFlemFsK00vUG0xUkVYQUJkcHNaU2IzWHdVZ1AwODBT?=
 =?utf-8?Q?dMrWUGFFtsd5mHfp33sH4I4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c36cbb4c-8f92-4e60-3106-08de12371d79
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:21:46.2508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8xJwh9zh1YWmvoDl+1MOdVTvfvuFXAiROf1SqPnqg+bfI1OPB3AuNdYvwWC+Am3RJyeaRpsCuXIBrSoRYSll0lc6RjXpGtJtuaJvuV5M2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
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

Updated the usage output to include a note clarifying that intel_gpu_top
is intended for Intel GPUs supported by the i915 kernel driver (Gen2
through Gen12/Xe-LP). For newer GPUs such as Xe-HPG and Xe2, users are
advised to use gputop, which supports the newer Xe kernel driver.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/intel_gpu_top.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 1bd88ba7c..0d0d03717 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1067,6 +1067,12 @@ usage(const char *appname)
 		"\t[-m]            Default to showing all memory regions.\n"
 		"\n",
 		appname, DEFAULT_PERIOD_MS);
+
+	printf("Note:\n"
+		"\tThis tool is designed for Intel GPUs supported by the i915 kernel driver,\n"
+		"\tincluding Gen2 through Gen12 (Xe-LP). For newer GPUs such as Xe-HPG and\n"
+		"\tXe2, users should consider using gputop, which supports the newer\n"
+		"\tXe kernel driver.\n\n");
 	printf("To access interactive help, press 'h' while the application is running.\n");
 	show_help_screen();
 	igt_device_print_filter_types();
-- 
2.34.1

