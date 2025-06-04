Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B0AC5B549
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 21:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5D010E1A5;
	Wed,  4 Jun 2025 21:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOjxsSPp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F5D10E1A5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 21:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749072279; x=1780608279;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OJlHtnSNlBZpMiwnK6gxalZNpHlOlMPxD/TPhn3T1X0=;
 b=VOjxsSPpF8wxhC+Di2xr5gyEnU/Gj5ekFvG6VC5kGGtY9kEytbtTnEry
 VokTsfAStLZMUp4VlPYx175romGX61Ydh0auaMj2qJK/WOHDOvdzIRvWO
 3fu+n4BMS2EEjQpuXOWewIGN5lO148BsEExkJPVD/rCJ2pIS++H4g4e1d
 4QF0dZoz2nrBkhjVI9iwYr/8JvmMbaOFMqNk4fzsrFXfjcLec5C8v0NCE
 Ib1Zwe/yyaMcfCuSX/sGtucFCwOLNN5KMt+wM/drb8FjTxUm5dnnvGYiX
 /6BA8/BwAok5J4ttmXIUnCRqPZgkUAYwck6GX3M5Q1Ymv8YyIlDi5oqdA g==;
X-CSE-ConnectionGUID: /xb1Iq5dQNi9+MUP9jlhAg==
X-CSE-MsgGUID: o/KknCRPRBywynTsADGPlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61793322"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="61793322"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 14:24:39 -0700
X-CSE-ConnectionGUID: d1ho3Y6RSQO+4CFTICuZDw==
X-CSE-MsgGUID: HRM5yEDUQpuLduMBnD+0YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="176183425"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 14:24:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 14:24:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 14:24:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.53) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 14:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jh2zwATOTLA12XvFEVcAs0qDQg0VbcoMYTmSu8JJylQrFX3rgns58GFtre53Sv4ncffWONCP/1c+0yuY0R0TffxV+epf0T2RIR3pVdmexPArcVKOgNLs8aEs4myQxQj1n8CUit/QEQrdzcF2FWoIRcvsxGulzMZI7SEgeeuqlwUYHWpQ381lrzsAOzaK6GIIfDurXgtOuQmxYymOEJvk8jT93N9WGHjn4X3E8zbVAMoSkVg5eEg0tqnBCCCzN6iuSW4hRMQzTt0Apdn7pHVROW/o1qJ8kG4CL0oUcWGr69z+QHemU4QpD0wsxMOTls9WkSH5gy9qK49uY+zVZxUjmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJlHtnSNlBZpMiwnK6gxalZNpHlOlMPxD/TPhn3T1X0=;
 b=eMyqwm+oalza2zaDB77pB4saKr1sTQp05MDSdgvJ9JjVIu+uFYC7UsD0iJuRljqOwwgeQ9D8AoT4hKtn32Nu67PVDOgh3hBzr4dBwK2B2VkZVCg8Mg6xTRzL3iLx1ctjvRD82JafAIXq+4G2/uBlcWpLZn3BfVMhFZWy/Ntv1xNAKjW6EPGLNSZrVaIi9YOmzReWO5ZDY9lceu4TIxL4Sk1I6ss8PFjRn4rippre7P1LVfR7x1LWoLlwdUcdiA3jsTBXH5Zad8W75BcM3LGVL36tRGYPYPLN80SNv2PMqPb5oImMclDxV1nJuNtdhcQvQ7/KYPkkBXQu0ETImsA/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Wed, 4 Jun
 2025 21:24:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Wed, 4 Jun 2025
 21:24:35 +0000
Date: Wed, 4 Jun 2025 14:24:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t 0/4] Add test for active context utilization
Message-ID: <aEC5kSx-bin2UQRm@unerlige-desk.amr.corp.intel.com>
References: <20250520232027.351497-6-umesh.nerlige.ramappa@intel.com>
 <7wg5je2qhq2vxhxeh5cpvqk4owyc5sgpiazo2u3iusjbh2bwrc@us23g77jvyne>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <7wg5je2qhq2vxhxeh5cpvqk4owyc5sgpiazo2u3iusjbh2bwrc@us23g77jvyne>
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW3PR11MB4714:EE_
X-MS-Office365-Filtering-Correlation-Id: deb247e6-6c20-450e-9965-08dda3ae3427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG9IQzhMOEpYSlFsOUxPbURJWG9RWkVyUUxaZFJYQ3BBQnZsL3NGSW5lSUNC?=
 =?utf-8?B?cHRaVks3S3FPZXNKUEMxZDFTRXd0U1d6ejNEbnJKR3BXK0FZdlA3NklMYjFQ?=
 =?utf-8?B?eWo4bERPbExqVlZEcHZHODBLbTF0SnBTeExNSFVidDdCU3NRUjdkbmU2YXk2?=
 =?utf-8?B?bkJWSG1jdU5Ja0lvVUZTUDZvUFBhTEZCSkNtbE5oNW5tU3dHc2tpSnNJcmJF?=
 =?utf-8?B?WEQ4WGxCMGQ5OEdGYmlEN1NCMWZSbUREV0x1R2ppRmtEZ0kxOXJpejdPUDd1?=
 =?utf-8?B?MEpNL3ppOGdmMUNBTnlENTNsa3lkR2NyYXNTa3pLeUEwNDV1dkNBQ3ZYVlFx?=
 =?utf-8?B?cWtKYmZ6bVZkT1IzZnQxbS9rMzFjeXAxbTdlMW1vRFZGT0drVmluWUxxTzAz?=
 =?utf-8?B?T0JsWWVYYU0wUGZXcG5BdkQ5Q2p0NUo3QTdzS2g1bWFxWmZRNHNZeWlZdTJF?=
 =?utf-8?B?c3ZoWm4rdnV4V2tVWjduR3lrTlZYNEtPeWJEdUhiNUttejJyejlxMUllcndv?=
 =?utf-8?B?M1RFL3hWMzlLVC9GTmFIRG9XSDE3b2Y4SmJLUVhsOEZiOFM0Ky9UU3cxbzYx?=
 =?utf-8?B?NzIvaEtkWGhwQnFwMjZta3dsYi96WmhZbTUyTFNTVHIzRUdWZ3k3bEtlOW82?=
 =?utf-8?B?YUMzNlJuYm9zdWdjdnJJdWY3TXN0Z2VYeng1aVRRVFVHclhDM1FhaGhjeUx2?=
 =?utf-8?B?bGZSRTUyc0hCTE1jMXVWOUVqUGVBK3dQVkMvR0YrWmgvbnBPbURoK3B3bDNy?=
 =?utf-8?B?c2FpTkE4KzZVU1VxRDAwN0Y2VEw3NEtsT2hTdU5FYWxIeTNjRThxRklXSTNw?=
 =?utf-8?B?NEFGTEpkVFVTVFRQbFJ6Tzl0L3diWVpKcnJScW1iTkl2N1ZwS2pwekVSTE15?=
 =?utf-8?B?c2tVNXJLcHN0SFQzMU5TbGhPcDhmMGhkZVlBTUxXTDNCbEdzWUhHVVdicUIx?=
 =?utf-8?B?VUhPNEs3QlJQMjRwK3JXWE5FaTZ1cFphdmcwLytzWUFJTzRuT043RkF6Q0tl?=
 =?utf-8?B?QW5DMmlKUlNuNnVIZEx4SmVwZjRyNDlTVmFPZnRkUjdZZnAxZnVFRzNOQmRn?=
 =?utf-8?B?TkxJc1Jac0w5S1R3bm9nUFMyZ3FMTWg1MHhkK2tVUWY4V2VvVisyMUY4WmV4?=
 =?utf-8?B?MEErV2dFSHI4bndhak9nM0FwK0w4WUoySFZNTzFycmdsMUlMd2gyOCt4dUFx?=
 =?utf-8?B?akRFekl4dndvY1RldjRVbG1udHVrdWpjam4vSDJFSTJzeGJQdUpuZ1RabHVH?=
 =?utf-8?B?OGN3S1NJb1lZS2dGUmxPNmRLZzlpaVByYUZCOTc5SUIzd0V2UkxPaGgrN2RK?=
 =?utf-8?B?M0VPK1huUFFmUmVYeUsvWnA1aWpZRlNWdHBXaG1xcjI4c3owQWxBWFpMMy9E?=
 =?utf-8?B?U2VsTEpyR0pEb2pVb3ZUaDhCSEx1d3ZmdndTY3crL3FNZm5OWUFVcWtocDBo?=
 =?utf-8?B?T01lQlYrMzRxTDJTbGl6dzBlSExORWM2YmV4NEZ6dzFmUXBYZGh5RUZXNnd5?=
 =?utf-8?B?UlNlMGUwbkFuV1FmTlJKYzB5THp4ZkxrMFRSRWg4T2N0aWxTeEtkOUNXa3hx?=
 =?utf-8?B?cHgvZ2Z1S3pSNEV4dkUvZENsK2FnNktQWThzK3VBUmhhM2NoaWlRaFk2aVRE?=
 =?utf-8?B?RTZobW1uWWIxUGxYYmZCclNQREFEOE1xcmsvczdweEV3KzkvbENMWG5XSmhv?=
 =?utf-8?B?eXNmcTFsR2FuczZ2RkFFL2x3bjhGUEo0UUoydnNwWnpmUEhkVGllL3BvUmpE?=
 =?utf-8?B?TzRFcGdaSi9rRTg2akFUMmZKRjcvRitmOTJnUi9YVE5WVzVEanNETWd2VGxT?=
 =?utf-8?B?NTMwYVJ5UnIwMUR1T0N1RWJzOFVUREluMUhzU0VvYVdhb2tNK1hJZTNIRFhm?=
 =?utf-8?B?L1Z4M2MzWi81Rjl6ZjljUHEyVWJSRk0yNi9HQktKa3lmcWJubzJmSzd5a1l1?=
 =?utf-8?Q?YRrWv4KZuT4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmNudmdkcHVHY1lxUjRwSjRERUhRaVdCbTMvK2wrN2Rjc25yM0RtMjZIOUd6?=
 =?utf-8?B?N0U4MVVBTGMyTENFTjFQcjBRNEdNOGE3d0RXRUs2QUdidWFxazlHSE1tTkRF?=
 =?utf-8?B?dVk2R1BIS2NtamRlR1YyQWQzcCtCZjRkWFVlSkF4QnpmelZsQ2hWY3lyd3Ni?=
 =?utf-8?B?d0J6V2FZcHNBbWdkWXBrUVB0OTVaLytBMm05bHM1L1l1d2RJMStMTmNyZWFC?=
 =?utf-8?B?RTJSSDVZZ3FtcWVZM29vbEk3Z0dRcVFJTVVSbG5ZSHZpUSswcjlwUS9iUTlT?=
 =?utf-8?B?TERGT1J3Sk40TjVlNXlmZU1vM2htRlFSQzFGMnVYcExFM2x3WHVGOGVFNEdZ?=
 =?utf-8?B?bHFmazVPbW1SUG05MDdaTEJld3pjTlhHTkRvT1lCWndOcUE4M0tqSGlDZ0hN?=
 =?utf-8?B?SjFhSEpsKzExdXFuU2ZvUTdLRDAzaGg0dHVDMGpGeHRtV2c0WHZlZXpPMWpa?=
 =?utf-8?B?d2FCUE9YdDRTeDNkdHZCN1pLVDI4L0prSEtpNTZMTW5VcGhoalF1V0s0K0tG?=
 =?utf-8?B?Nk0yMEphR2JBUUQxQ280WllBZDRxV0hzMi9OUVU4NEJUN2dwNGV0dDBVSHNq?=
 =?utf-8?B?SGJFQko1ZmV3Z244NVFHczVDS3ZEbS8wN3E5Um5GbUxSLzc1alE1QTd2UUY1?=
 =?utf-8?B?azhRcHN3MERDMDM0RWgvQ2U3bjI3NFNwT1pNbXdvRW11aWRKSk5yUTFwWFc1?=
 =?utf-8?B?QXlXOFZtTDk5TXNOZmJOUnNDS1g0Q3RSdThER0FZbjQxWmE3bFI5VzNpclh2?=
 =?utf-8?B?ZGZyemhBU3VJMW01OElIT1NQQmdzbythYkdmZkREdG56M3RjRmxOSm84anpC?=
 =?utf-8?B?aGR4STFnVWtoRTlXY1NIbzJBVFVHejAreFNmNmc3eUE0U3JyeGNTT2lXOE5t?=
 =?utf-8?B?M3dvV3hMYjV3YTErdlo1ajRVQjhGNHJSaFprRitTaVhzaDZGWS9VcFFIbEhK?=
 =?utf-8?B?K2RuWjZNUUdoT2RTZjNSSy94K2s3M0d6YVJwUS9yQkc3OFhOQW43dFZqby9R?=
 =?utf-8?B?TnRzcmJWTU9NdUluOXJCdGQwYzJVcnZqN21iR3BteEVEWUozR0VUWnB0cFFE?=
 =?utf-8?B?R0tQRGkrNHlLRXIzamwrL2VlRGd3MDkrdWlqa2hyeGVWRS9FekVVU2daVVR1?=
 =?utf-8?B?RW9BWFg1TkF3ZWxucjltRm9zRFdZU0hadnF6c2pLd1hJcFhQWDdKM0pUeDgy?=
 =?utf-8?B?NUFQNmFGNmpIMHhPQnNRWk90bXJXcHBSK1VnQ0k0MWpFbjhXK0dxb2RCNDRl?=
 =?utf-8?B?UmNxRjlCUStJeEhDMjRIMEtPQktNU2FldU8zR2FqU1RrTGJJNGh5OC9CMkhj?=
 =?utf-8?B?VkdTQy9UZEd1WFhKNlgrL2ZVVHdrNVZEc0krM2l2RXF6N1oxQmpiRm03Uy9P?=
 =?utf-8?B?TnpwOG9EcXk0aHczYnFjNmE5N3ZQVTNpaWdYU0VLUXRJQ2RLU1h3OXdiMkhk?=
 =?utf-8?B?cnVIZGRjRFZ3U1p3R0Y1cm80Uys0a1BiNGdwKzNKNmMwWC96Wm5DMWx0NnVV?=
 =?utf-8?B?RnU2ZktHL2lRRWhYbmFtSzUwRFVsaWRzeDF6dklSUVYwMmVZYmtkSHo2UWtG?=
 =?utf-8?B?RUZEYWIrcTZJSlNoSU42WUFiT0l4YXFuQjNhaVZkcVI5TiswcFcxWUtZRmty?=
 =?utf-8?B?OEV2cnM1ckxCRFQxZ2ZkSFVPL0tjZXlRV3dRZGptQ1ZPRG9iTW5SMjdxQm1o?=
 =?utf-8?B?V0RVZjFGOWhwZUl2WnlWMkdKRmhiWjVZRGd6ZGxleG1lTkZPSEJOMDRWTXZT?=
 =?utf-8?B?L2MwZVZUUmZFcy9Vay9VcnlGMWd2bVlaU1ptN1hpeG1RUisyeDlyTE5EMCtO?=
 =?utf-8?B?UzJYSStSalNoajcvV0RWZkFqSkpWT2dtSnBpS0NTQnVXVjV1bkhiZ1YzcUQx?=
 =?utf-8?B?b3dqMWJMUElzaHZuZHpPNXcvbjZPNWhjK1lLTWc4cXhBQ3FWRkZPV1B6ZnAy?=
 =?utf-8?B?WmdEdFZrL1ZrL29TOERPUjJQZXc5ZTg3TmxOUktITWI5T3EyYVByL01ZdWV3?=
 =?utf-8?B?aHZJaDQ3aXJtZkl5RFJhUFA0OFdpR0daeVA0eFZqMFB6OXVVdmZNcndRMmUz?=
 =?utf-8?B?d1dlNW5UQm95WW5aSXNDSFVBQmEwUlE5elorUlRLd0hkR2Z4cEF3VHhMWkZH?=
 =?utf-8?B?ekVqMFJVaEdTOTllZUhVQU04cGNLb2hORnlCQUNLb3V5cFdjRFZTUVpPU1hp?=
 =?utf-8?Q?9yg4XmGBbRyd1qFiU5vFlpE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deb247e6-6c20-450e-9965-08dda3ae3427
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 21:24:35.4230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmDUzqesC3+stxMW7Ioo8sQYZBXbVZZuoOsTUgVmPi3UpjwwiTP9pZvZb7z7j7BviVY76eE5lCXJcGaARyLQ07AgwGsan9X8B0sE0RrjZqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
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

On Mon, Jun 02, 2025 at 12:57:58PM -0500, Lucas De Marchi wrote:
>On Tue, May 20, 2025 at 04:20:28PM -0700, Umesh Nerlige Ramappa wrote:
>>Add test for querying context utlization when it is active on an engine.
>>Refactor some flags in the process.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Applied, thanks.

Thanks a lot.

One flag was messed up due to my copy paste error. Will merge soon.

Thanks,
Umesh

>
>Lucas De Marchi
