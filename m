Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABC3C36010
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 04:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD1210EAB4;
	Fri, 11 Apr 2025 04:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXTaRmZy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6103F10EAB0
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 04:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744345744; x=1775881744;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dnYQDDDXNDdrUF4JEX7VBRBPIMVIRltAJZDnXVw1HVg=;
 b=XXTaRmZyUMnlvgROtIv1AF7fyBecTVPiH1o2MoRndyxF2N/67j1wtVKV
 9y2QxbtC1DRzb7qAD6AR61zKcpTjxzO6qpAHj83ygIKdjvLO1Fg8HwYhE
 GCAXu0MBhQRHWp8FRWckRsXb/FbC7WV77Q4baNWUVNgnuj8jOIDVbJJTU
 xBUmvzfs80WA0eyrkcfLk+jRZhGmEBnbeJLwakrkqEfpoXtOQhOtJLRuy
 KQLh8yUDsBkCrRnSGwfHpjZZ997SGAy3VwxcJsyqSHS0cwGWdjKLPtIBd
 Q8YuNNXk4DMQS+eVKaaPyvS67EvhgUQgMaqOjHvdrMBQcpKlJfBUIEH2c w==;
X-CSE-ConnectionGUID: imPS2T3dQ8aVymWnP973Zw==
X-CSE-MsgGUID: Lv5ZT6bZQXuqVw0AyRprMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57259916"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="57259916"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:02 -0700
X-CSE-ConnectionGUID: TSDAf+3OS0modS+R2Z6hJQ==
X-CSE-MsgGUID: UwX+wCjPQ1eoSFP60GYCDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="130066292"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 21:29:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 21:29:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 21:29:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 21:29:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsgaN32iJq4eZCmKxMM00RWDq4WOsuJkj2QoZwt66T1BKgyNSbQZ4BCLTDHzMYLK3JdBxLNpS0CaRv9MMqWPWDDyv4CYuvXsbEL95GKXa4o502xQypj0Dc9RypqHZ9dg+ucnBmAAfkNzqojMNG1EmGDS+Tn9yH8CofNyjNZT7RbPUg4QHJD2cbiYWHGpYfF+szmgPd8FPlg0RaF+L4lI36blKRt5/wVmBUP4OqtOBM05DB3BdQub4pZZqPhTqE4kXtSW6QMggmMsOliGEb+6iyFnJkbVqhpfYA5opnxFkGIUdYHlm3LkNKSp/nGOiSjikwgoDmJO+7EZLSkgkycWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J55/+qYXSatSRVmATd+W0Mx8jyprzwtPaDcDhNoq06E=;
 b=q4hRBKWJwDMHX37Li8OAN84ePUFujMGytoRU//0H7YhpJrXGTJduCawQsoyrtB/ik3zzgto7RVUS97HX5fOyP+dFgJx2rWIQMkdcVTB2JweLvZ9oPYDm0xMO7ZuhPXI1vuQFfyvAXduXrEYud+jQCMskTBovJADeQEjMXKG6qbHlJ8r08xaVMzM51O1POWWdxXQLDtN81/RVyozw6qGINqLm+v58k7V69gbCD/ctTtu9UlNcQxz1rMcFJ5uIv0+pU/JqWYExdfGQLMGBYeO9V5M297cYt0kXFzbwh2wLbllhhJUGNqL9CQWzLepavKcQlceRzqHn27g8oYn55tPoYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS7PR11MB6221.namprd11.prod.outlook.com (2603:10b6:8:9a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 04:28:53 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 04:28:53 +0000
Message-ID: <62bd0159-a24c-4bb1-975e-48fad72f4eb2@intel.com>
Date: Fri, 11 Apr 2025 09:58:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] tests/kms_vrr: Bucketize refresh rate tolerance
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <ramanaidu.naladala@intel.com>
References: <20250404043709.955109-1-mitulkumar.ajitkumar.golani@intel.com>
 <20250404043709.955109-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250404043709.955109-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS7PR11MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea4a11b-250b-49fa-32b5-08dd78b15da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU5pQ0ZQRVdyay9uZEtpR1k5SXRZMVo2L1FueWxLVUlycE9iUWE5cTJ1cFVK?=
 =?utf-8?B?RFFVcEpTNWhZdCs5M2g3ZVc0NHAxaE9qeFpVeS91VTJFZ0MxbDJCSGhrWU9I?=
 =?utf-8?B?SDJlNllLOElRNXhmVlRSUW5QYjQzdWk3Sk9SMlVhenRGV1F0eHVMbG1OUmt1?=
 =?utf-8?B?OEx4WGU5TkRIbFl3Zk1sR1ppZnNNRjY2MXhpS2pkbFBJb1VoL1htMDE5Wlkv?=
 =?utf-8?B?QWl5U25iYmVyQ0hWUXFEZFdPSzVpMDZnN09IWjJWRjkwYWxJQnI0Z0UzblJQ?=
 =?utf-8?B?a0dlU2owZlVMaUtFZGRiOG40aHRXYndRUHE3ZGRHYVlCRVFxV3EyUWkwSUpi?=
 =?utf-8?B?d1F3NWRRT3FFWW9rdVNjUUV0Q0V6aUsraVlCRmVPVDRzakY2NUM0TTRIcTRr?=
 =?utf-8?B?S24xZW0yL0U3S3k0aTBHd3VKR3llZ0lmK2h3SE93SWJaUGQwcFdISGFacmli?=
 =?utf-8?B?WlBlL3BkV0c0bWtKdmN6QTZHNWxZY01Cd0duaEg3ejczSnBLUHZucTlnR1pt?=
 =?utf-8?B?Z0VaQno4WVdRV0RXWkZqVEFEOFRzM1N5cElXWVJwd1JGUko3M2Q1WTV2NFBu?=
 =?utf-8?B?Uy96aU1hcU9FdHBLQmdRbG04MkpuWnBZcGcrZXUzMmRvSG9Mc1JMZlZSQ3ZO?=
 =?utf-8?B?WldKTlFMakJFeDJ0OWdQdjRxUUt3KzRZM3NtdlhIU0RsOEczbkhsR2pYUXB2?=
 =?utf-8?B?Lzg2QVlYSlJ2U2FrVXMwNW5tcTNnbzFRQTlwblhwckxGT0lFL2FQY3grLzZI?=
 =?utf-8?B?OXRIdGhoYkpDam9wTHEwSTlVNXIreExvSlh2ZWFtcmovR3dldlVtRUE0cUlZ?=
 =?utf-8?B?cG5tVzU5WEFLNFlOa2dYWUtNTmJHMXNBQW9sa0F2YThQOEJOcEE2MVZnbnJX?=
 =?utf-8?B?cmdoZi9hREVsLzRmdXNuNTdNL3VnOUJOOGtSNk1RMExNaWNuRmRlUkxob2N5?=
 =?utf-8?B?WnVxb0UxRk9wdkhXNU1YWVRmRDF3YXFPZDRLTzV4N0szQWhRdWdCM2tPclR4?=
 =?utf-8?B?cENzL3RQK2RpMjdBR2ZXWklEZ1QyMkhGRlJiQkhiOGpNV3lJUXc4V3hPMFky?=
 =?utf-8?B?ajJLTEs0eng3ZVFEQ3ZTY2tCbk9JSHVpUW5JbERaSnFaNmNKQ2lHZ0E2L3R0?=
 =?utf-8?B?UUJiVXJHTm12SXJiS3Y0cmJjT3RiSUxqQ0cxdEw4bkJ0dXExSnB3aW91R0xT?=
 =?utf-8?B?OVAzMzkwc0Nma0hHSDhNTGUyMHF3dVJrYUs1VFJUampwb096UWszTWd4NTg3?=
 =?utf-8?B?WFlUSGdVS3hHb1BXWWh2TW91ajJ3N1pYajNReUNqZndXYlhVanZZRnZrRXdk?=
 =?utf-8?B?UlJTNk9MaWxkYTNnajZZcEluRTV5emJLc282TTRqTWY3ejRHRFBWVHBhaHo3?=
 =?utf-8?B?eTdNS21ETVVvV21aKzlBUnZqdTl2dDA5NXJyTEVXeEd2MFMzVFNBTXVFSmdp?=
 =?utf-8?B?YStla3p1bHZOZEZ5WkYvb0Jsb1E5R3ZaazNZL1lnUlZaRVZmWDROdE53MG5E?=
 =?utf-8?B?L3M5MFBRNlUyZnV6RENleUhrRThZd0M1MjcyOHMrZ0ZMWDlyb1JSR2NSdVJy?=
 =?utf-8?B?cHkwZFZTYXBlS3A5c2FTOE1OL3FxbnFMQkZKWkRoQllDQWIxSTg0ajJ5TGdz?=
 =?utf-8?B?WlJaNUdVVEpKaWdiOGJETHBiZ0JrZlpUZTkvRUhoenI4REJXeWd0TEd5ZGhO?=
 =?utf-8?B?M2tkcy9BWWpNSmpDa1UyKzBjb3BYN2lnOStBS1B4SmNsRVMzam1oNGM0bmdt?=
 =?utf-8?B?ZXgwVlI2am1UcFlLTURxS1kyUm5BOURYbmIzQzhFOXhIcHBKWVpLWWZDdDFm?=
 =?utf-8?B?WHhyM3pDY3c3OVYxTGNFcVMybnhRMGZFNDVjbE5LeWVNbUFUTmRkeWtJNXhU?=
 =?utf-8?B?d01ldWgwNkJyb25VQ0N5ajZLUmdkUTFObldVWW1qbWR2b3pyRkZsV3lLZFB6?=
 =?utf-8?Q?M2nejqSaGRs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnY3Z2ltQXdLTVNpMlhVMEFReEc4aFhRS3lxQUx6dDNrSHk5YVlLMHdCczNu?=
 =?utf-8?B?Y0ZpQmZJcEFjT3cvVXBYd21EUjBJK2o4M2xxRk1QNGJrTzUva2RUdVNXVHdx?=
 =?utf-8?B?bEpSN09iTFZMQmxEbkZnL1hUVG5YbUovc3RSOWNnSlN4aUNrWFI4cmplYzFJ?=
 =?utf-8?B?STluallGMTZyc3E5VFZSUzcxWGJKYlhFV1B3cks5V08zT3M0aDB2SUJvemdS?=
 =?utf-8?B?T0lYY003VUFPdC95S1RrTTM0Mml1SjQ1UWRqcklmQ1Zzd2tmY01XRFp3bXlG?=
 =?utf-8?B?bUsxbEdhc0VPb3Nha0MvT1Q3eU5Pd2tQZEM1VjJMVFlxRkhiS2ppZHVGdGVR?=
 =?utf-8?B?OVI1S0FZQ2J5OUF6aUNkT2xnTXhOWkJDbDRJSGdCUDFSR0NnejJOa2RPcUNi?=
 =?utf-8?B?REZneW04QksxYnBTdmh3eTdVWjRsK0FiUjRwWlFFYW5VRnJDb2JrbjlpY3Vo?=
 =?utf-8?B?NU04L2E1V2piU0U2TndlRHNTWmxjQ0dHS0M1a0Y1cEpQWlY5S0pieHh5UVY1?=
 =?utf-8?B?Z2FGcWxETkVLQ2hXamExQ0hkNVFSeEtuU3F5VTV1RWNpVHRUek01SGtwQ3Y2?=
 =?utf-8?B?TGdkUFZRVEFEUEFSK3g0d1huSjVpSEYxSmRJUk4xSFN1aHF6SWQ1c0ZMS3dy?=
 =?utf-8?B?dEFEN0laZXdLUnNBYTZoR09CZ1ZESXd0cTJwR3Ftb0ZtZXBELzBsQ2c0ODhU?=
 =?utf-8?B?Nkd3Tk5KUmxVWmQ2MVJOenVLdjFaVGlmZzNKWmFLRE11VGZHZ0FVM05yVTVt?=
 =?utf-8?B?VkxtbktBdzlUZ3JGNXY3aFc4bSs4YlhyczNwTmpDQ3hPQVRGU2FlVFVqYjYw?=
 =?utf-8?B?eUtiSk1CeVVGSm5QWGpOK1gvMm5XcklmT2FDTzl3NUtzbkVvMlFZblN3Sko3?=
 =?utf-8?B?Rkp1VzNLTit4MjJpNVJpR2ZrT3NrdGlNTmFOVjZvQzFMSWNKd3lBcHVOWVpk?=
 =?utf-8?B?ajNubW9CTWZKTGdjNkF6WjU5Z0FQYm5EcmcrWDZBS2ZiVmUzZjZ2S2t3bHBE?=
 =?utf-8?B?SnJYMFgvQllHMGpaa2VoM3pJMTA2a05PM1N2NnROMk10Y2lCTzg5U3BIeVJQ?=
 =?utf-8?B?SS9rcmRFZVNCWmlsc2NCNlJqbHhJYkZMdjVUWUtzUmhoVjdZYnRzMmlEMVNy?=
 =?utf-8?B?djF5VGQ1RElhRkxpQjRWRWRTc2RBOVl0WDRyNFQ5aFA1ZEJiYllKWHRiZnQ3?=
 =?utf-8?B?WCtVRGJxaWFtOU94TXpxUnpWMkRaSlR2amdVWjdWcmJaUFAzV29xdm1ZVXIv?=
 =?utf-8?B?WU5kK0FBUWplZjF6K0lBTzlMT09STVJVYWU4cFZ6YzNEMmp2NG9KNFRWK01X?=
 =?utf-8?B?N3VEUjBwTDN6MGM0aVNESld6dm05NTB5N29lY1kyNnJKMlFtck9JVStBZUIz?=
 =?utf-8?B?QXVhV2VPQTdiNTRicVg5eGpIL2lLQnRUS1NBcDNuZnlobEUzd1poa0JQT0to?=
 =?utf-8?B?MDJKNDlvWnFtREtWMExVTzVOUFlPK1Bod1NnM3J5Y2gyWEJNclpPbHBSczll?=
 =?utf-8?B?TE8rckl5QUZ3YWlTQ1d5SFB5ck91M2JVR3g2N1paM09PVlMrOW81N3ZWWER0?=
 =?utf-8?B?Qkt0Zlp6RmRXdzFmajdKYzBCYUVSKzlBc0VkVDlMQldrcE1OcHdLQ1JsdjdU?=
 =?utf-8?B?alpJTjY3VHJNMlVqeDluWEhHaHVsR1hOMGhvY0NWY2F3RnBWNzJhT3pCUnJY?=
 =?utf-8?B?aG9JUWtKcG5SM0wvK01CYkJja2taNy9RczZjVGMzejVOYlhEN3MzUzJGOXJz?=
 =?utf-8?B?WURjY1VFM0dQdkUzelFNZlVzRjE2NWV1WDVFTGRvcWJUb1NFanVjaTJRTzJZ?=
 =?utf-8?B?TTBWZ1JseGhSVDYwZ2E0cUl5UU1sMGlETVVyaTliUVdwQjNGNHRBUjltWmZo?=
 =?utf-8?B?aVRXa0V6aU16VFRMQXlRSDlHRldmZGNlVThlRTFla3h3QW1LaGY5V2ZWTFJB?=
 =?utf-8?B?MzVUSXRtazFyQmNTczRWZVBwSGJEQ2kzR1F4bHVVTXQ3TGZpR1U3WDVqNVh1?=
 =?utf-8?B?VmF2M0FqVmJqRlNnMEp2M21tZFk5THE2dms3S2h5dnZZYndVUVA5ZXhHM3ls?=
 =?utf-8?B?emNtSTZlajk4MHhlbW9HZFV1clN0VnJLbDV0YXc3T0VCeVhBVkJJdlFwek1L?=
 =?utf-8?B?V1NUV2VWdWQ0ZEVFUFkybHZpamJtOGpJZUVMYUxzQ3dibzBKK3B4c1I1NDFN?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea4a11b-250b-49fa-32b5-08dd78b15da6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 04:28:53.3589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KE75gl+Lb9hyhfr7qcFQEwC5T/JQr8nRpn310m8Y7zytf0asj4BXWvkjrtlqtIkzEPWpV4B+UqrCNQ+FqaTjRRQ9IHCBboMYR1peRCCnrWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6221
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


On 4/4/2025 10:07 AM, Mitul Golani wrote:
> Reduce false failures while preserving timing accuracy. Introduce
> a small tolerance buffer based on refresh rate which accounts for
> HW/SW latency without compromising validation on HRR panel.
> Although an imperical number but already IGT is living with that.
s/imperical/emperical
> This also ensures that asked refresh rate is not too off and always
> catch the real HW/software issues.
>
> --v2:
> - Refresh rate criteria changes.
>
> --v3:
> - Comment changes (Uma).
> - Add FIXME
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   tests/kms_vrr.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 56 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index c4bb30f6a..ccf32f453 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -410,6 +410,52 @@ do_flip(data_t *data, igt_fb_t *fb)
>   	igt_reset_timeout();
>   }
>   
> +static void
> +calculate_tolerance(uint64_t *threshold_hi, uint64_t *threshold_lo, uint64_t rates_ns)
> +{
> +	uint32_t refresh_rate = NSECS_PER_SEC / rates_ns;
> +
> +	if (refresh_rate < 0)
> +		return;
> +
> +	/*
> +	 * Current IGT implementation follows this sequence:
> +	 * 1. Perform a page flip (`do_flip`).
> +	 * 2. Wait for the flip completion event.
> +	 * 3. Compare the timestamp of the flip completion event with the previous frame’s
> +	 *    completion timestamp.
> +	 * 4. Adjust CPU cycle burning based on the relative frame time.

Perhaps need to add a step for mention the tolerance step and about what 
it does.

5. Tolerance Check: Determine if the flip completion time falls within 
the acceptable range.



Perhaps we can add something like below:
"We set a tolerance value as the acceptable range of time within which a 
flip completion event should occur."


> +	 *
> +	 * If a flip completes too early or too late, it is marked as out of tolerance.
> +	 * As a result, additional CPU cycles are burned to match the `target_ns`.
> +	 * Even if the next frame is on time, the total frame time now includes:
> +	 * Burned CPU cycle time (from the previous frame) + Flip completion event time.
> +	 * This leads to miscalculation, causing **false out-of-range detections**.
> +	 * The impact is more significant on High Refresh Rate (HRR) panels, where:
> +	 * The allowed tolerance window is smaller and more correction time is required.
> +	 * i.e. for 210hz (4.762ms), allowed range is 209hz(4.784ms) to 211hz(4.739ms).
> +	 * This comes just 23 microsecond tolerance, which is much lesser
> +	 * for accounting HW/SW latency, CPU burn cycle latency and correction logic
> +	 * applied in igt for validation.
> +	 *
> +	 * To address this implement a Bucketing Strategy:
> +	 * Provide a small tolerance buffer to allow IGT tests to account for correction.
> +	 * Based on range of asked refresh rate. This prevents excessive failures due to minor
> +	 * timing adjustments.
> +	 */
> +
> +	if (refresh_rate <= 120) {
> +		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 1);
> +		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 1);
> +	} else if (refresh_rate >= 120 && refresh_rate <= 240) {
> +		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 5);
> +		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 5);
> +	} else {
> +		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 10);
> +		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 10);
> +	}

These ranges and values might need to adjust. More ranges might be 
required later.

I am wondering if we can use a table for this:


struct{
intmin_rate; /*Min refresh rate in Hertz*/
intmax_rate; / *Max refresh rate in Hertz */
inttolerance; /* Tolerance in Hertz */
}tolerance_config;


/*
* Tolerance values are determined based on predefined ranges:
* - ≤ 120 Hz: ±1
* - 121-240 Hz: ±5
* - > 240 Hz: ±10
*/
struct tolerance_configtolerance_table[]={
{0,120,1},
{121,240,5},
{241,INT_MAX,10}
};

Then any further changes in the values will not have impact on the code.

> +}
> +
>   /*
>    * Flips at the given rate and measures against the expected value.
>    * Returns the pass rate as a percentage from 0 - 100.
> @@ -439,9 +485,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>   		else
>   			exp_rate_ns = vtest_ns.max;
>   
> -		/* Allow ~1 Hz deviation for different reasons causing delay. */
> -		threshold_hi[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) + 1);
> -		threshold_lo[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) - 1);
> +		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
>   
>   		igt_info("Requested rate[%d]: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
>   				i, rates_ns[i], threshold_hi[i], threshold_lo[i]);
> @@ -497,6 +541,15 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>   		wait_ns -= diff_ns;
>   		target_ns = event_ns + wait_ns;
>   
> +		/*
> +		 * FIXME: This logic makes next immediate frame time calculation
> +		 * in inconsistent state, even if next flip comes on correct time,
> +		 * it will be marked as fail due to time difference from previous
> +		 * flip. Needs to reset at every cycle for correct measurement.
> +		 * Once this is corrected, igt can ask for more stricter pass

s/igt/the test


I agree with the idea in general. Thanks for spending some time on this 
and all the experimentation.

Regards,

Ankit

> +		 * criteria.
> +		 */
> +
>   		while (get_time_ns() < target_ns - 10);
>   	}
>   
