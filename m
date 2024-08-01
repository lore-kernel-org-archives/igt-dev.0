Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBD6C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 14:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B932910E978;
	Thu,  1 Aug 2024 14:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhDiv36k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50F810E978
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722521425; x=1754057425;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q911J/boWS0NCKYpqsaWi2zcVQOzLr3sZFi7d/O+Ows=;
 b=RhDiv36kRgdvWgaL8GhDAjDyYs72satgxDLU1osjnFT/0xdI4xyI9sNN
 KdZtYvD6TONWLFLh4iBfLY2wTE6OZ/rp4ieojNAWd07xB7XJnAbug0i/8
 rpvgasWvFFx/TPI83brqhlfJcm3PfegXXrB6uJtVXwxECae8Tyfi/or74
 Far2ev6kUZua2fcLHRRfGlAzB5aqFZH5mlHo/XZRoRczYEOvRfW1jTGfG
 cfOjyz5Jq0P7TjFpTkjfcctEEG0ya6vdnVCx2pAQ0Dc0ALyAh3/YqfcH7
 hp63yqakUT50Xs3rpWFg34w+4o1pb7XJwgk5gabVJfTzc4tKe4TYZPARL Q==;
X-CSE-ConnectionGUID: pEBX5+xhSKWmaESe0+MoRw==
X-CSE-MsgGUID: bAm4ze/HTqGkh1swniR+YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="37987752"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="37987752"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:10:24 -0700
X-CSE-ConnectionGUID: K57kuAYwQxWzb3QizaBH5g==
X-CSE-MsgGUID: rqsclbqSSnmNZOWaAxw3CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="60077374"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 07:10:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 07:10:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 07:10:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 07:10:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 07:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKPsQtSvEcRkoZOG43meoimXhgkhnzhzg4KsXnHcuLCs5hMS8xXxeakFZDrWuunUSrDGhkPs38R2dD3OIub1qasW/w9lzz7CwXmQg6DNQieQoAfSuK7pyLTgGXYM4F0xlwTbsnGNGIksSGSNsWNBsybuQ99FIASl6V6TnB50L1m4RokC2Lv8sDG4XQSFuSCSxbnTAFMWJR9a6VGb8W4nujuTqt5DKDLZG+Q+MpeqAfmg6fCXJoC8A2L2PM3NB+M8XSe8iQG5HU2ABFZf1PWVLrUGocQfmICIi77gv0R57m3zKlWzDyeqRnjJPZYY8CcC8FX0GXiubrdH9EHB6iLLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cxbbyRfpXrTbHvW0yCPgd6TDaCyvzrO018kkDM6k6Q=;
 b=vF9lzKRy8Vl2xJfCnlP3kSEqGoG1X+KYdlkDlqhskC4hRhtNgSZ8vBj6GoL5fi5bfdjtzWu594G4RUCBrHlxp9lTftJtjlQc3UMGaGHzLodMm85XoT3ogM4dgXEzW5Q0liWyrBvYsVyCw56AyAoagszIQMNUSjO5hG2W2CpdebcN5sUQbkMRfBOIwEuskmxu8ngxDmIjnOJiQzRf9pitp9BA1wkOCwwVWUHvqMehOKRNFfvkomxU3C+YFQsXDWTQCSKS6ixu4zfyLfAnn0pOXFwRWvWAzSa/bj0hjpIYJKKiAyx/YRieBdEwwz8y7FmwAniVi7AKnfHmaJSxEkaj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Thu, 1 Aug 2024 14:10:20 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 14:10:19 +0000
Message-ID: <631f42ad-662c-4e97-adbb-2e78b302af3e@intel.com>
Date: Thu, 1 Aug 2024 19:40:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4 1/2] tests/intel/xe_sysfs_preempt_timeout:
 Porting sysfs preempt test in xe
To: <nakshtra.goyal@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
CC: <janga.rahul.kumar@intel.com>, <sai.gowtham.ch@intel.com>
References: <20240731143029.3661149-1-nakshtra.goyal@intel.com>
 <20240731143029.3661149-2-nakshtra.goyal@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240731143029.3661149-2-nakshtra.goyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW5PR11MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fff4141-5407-47fe-a4b5-08dcb233ac7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVI4SFArR1ZLWXFWMFR1VXhtbEl4SEQ2NzVCRU1hSjk1VVFlSkNILy9sK2N6?=
 =?utf-8?B?THgrckMvU2EveUs1Snl4Z0NFZ1J0OU5raTJSM3FCWGQwcWhBK2lFbmYxZ1pj?=
 =?utf-8?B?bkgwcExMZkZBcTJESnRxRlJHZGVXRTVqbkxrNVVQcGxsRytMd3lVWlBjVHNy?=
 =?utf-8?B?aHgydWxkKzFGS1RmSnlvWUxsQk1kd2VRakV5aFEzcHJINCtXeS9UbWJ2bzEy?=
 =?utf-8?B?bHRBLzF2SjR5SU4vWXVhQ2hXRXRxV1Q3cEpzVFkvTzJzakUzYnljUmVYR3o4?=
 =?utf-8?B?bklXQnk2cFFZN3Qwd2RYeFk2MmpZOUxkTjZDVFBrOFR0UWlEQm1STjk2cTdX?=
 =?utf-8?B?RTBFcEh5TjhPejhURnF0cTRJVjEyaHpRNHJnMzhjdjZmV1FWYjl2UVVXcHQx?=
 =?utf-8?B?bVliZlMwVk5CbmZPZ3lrTjhsKyszQ25zZlM3RlVuNWtJQ0dYbEttVjE5VnM4?=
 =?utf-8?B?ZU9XQS9ZT2syREJ5Sk45dXB6bHQybTN3RVVLRkVadzlQVWllNk1MOTI2YXVJ?=
 =?utf-8?B?UFdMNEhPSWptTStkTFNabjRxTFFSWEt6Ylk0UHhKbzRVVURURmJ2NmVDT3hz?=
 =?utf-8?B?b3poekNLSDkyUzhtN3h4UXZnYWpUUlZ5M2hnYnNWUHhNZDFNNTJmUTUxQytG?=
 =?utf-8?B?SU4yNG85TmU1ZmFYOENXUXFPZmNuMk4wcmxUSmh2bSs4ZmNBbkZXMmtVK1pO?=
 =?utf-8?B?Ym4yWk4xbVU3elQ3ZUxFMVlKd3BmYjdnVlZwemsrbThMWjQ5OGNEOG02UGNZ?=
 =?utf-8?B?VkQzM3BDUHZZNnZhc25vQ0dzZXl0cHBnZEhRRXBpckV3TUNmaFNEbFNDbzZJ?=
 =?utf-8?B?RUc4enlPZERDN0VGWWdPZWxnbzl2WXdoSzl0eGo1dllMejBscGdSTHJnaTBh?=
 =?utf-8?B?SWVKL0g2L29jcHVEbHkzVzNXQkJrODEyL3ZlTStRL2tEczZlTkoydW1wYmk2?=
 =?utf-8?B?U1lGdGVSUU82ZWdOMEdCQjgzNXphVmhBNjM4Q29QdjNqTm03cE9FQ1c5U0Z6?=
 =?utf-8?B?RUk0UXFtSlRnRTZxSmI1LzIwa21TZ2t2M1F6N2RvbE1ZM2Q1QmtDaDN2SEpG?=
 =?utf-8?B?MzB0MnphS1FYUVkxcmJIQ0plQkZwL1E1OTIrYmVmSEdPYnkzUGNtWHVScS9j?=
 =?utf-8?B?ODNqVTV5R3JaZkRDT0pzQnowY1BXV0hEaUVGRGgzMURwUTBpcnNSaWRkKzQ1?=
 =?utf-8?B?d2tJdkkyTmNTZmMycXNBRmQ5OTRsZ1gweXgwbGU4VDR4c2Z2a0NBbXkzVXh1?=
 =?utf-8?B?bHZGa25NRm1oOVBxdTdlU0hWVDlFbDNsTVQydm9hcnJZNnlvNytyVWhYWWpJ?=
 =?utf-8?B?ajUyRUZQWnRUKzV4ZTZmNlp4QlJxU2g4T3dUck1kQkZIUVJLM2ppam9LbmpO?=
 =?utf-8?B?TEVtM2taM1RLTEhrY1NTRVVoRDFCQ2psZlhyY2VsOHhVR0tqQTViUTlPemRW?=
 =?utf-8?B?TzdFbS9ySGYyUmFMK2hub3FvbHIyeGx0ZTNVbXdaM24yT29wbzNHUGdXRWtQ?=
 =?utf-8?B?Z3puTW5XcWFzb3B5a0Q2ZHBRN3FZd2c4enFnNWtpZmtMMUhqNzE1dWF3U2RI?=
 =?utf-8?B?OWdFeGNxemNwYjNMbklEVktXdGVnWS83eDdiZXZITlJFSlgzaTlYdkhLYkli?=
 =?utf-8?B?OWYyd0Z3WTFtRkJwTDJhV0lWcmRYOVFyNnRvbzZDWGprbE9oejRPWEVkNE5n?=
 =?utf-8?B?OWVobWlUQzFpREVDWTYzeU55b1diZzZpcldMaWVNQ1pGOWdJNjNPWHZ4Y2Rl?=
 =?utf-8?B?OFFsZzZ3UjhhTHJEanduR1pVa3g0SjdaRkJUcWI5dklKRXlQR3p2UUNMQkR1?=
 =?utf-8?B?blhjU255S0k4NlFGeXFXQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0Z2bEJscTZ4cG8xUzNQWnZ2aWFldVdYeU15aVRGSnRGWTZkRHFkeFRKeHp2?=
 =?utf-8?B?UEx6OXczWU52cktFV1RaMVpkdjBFVTJpb2FaaDd3aFQvM1hrZXVnMkZyNmhB?=
 =?utf-8?B?TEFCalNCNkJFNldqbThvRkdnaXhjeGVEcFFBRFBsVkRvMCtPL3hZWk0wTkFH?=
 =?utf-8?B?UTZ4NTRrdThLb0RCVEhvR3VtTStBVnl4WTcxQ1NvVXlrYk1YSkRRVjI1bEdK?=
 =?utf-8?B?VzFzb1ZvRGo1K0FIUGJvSWpsb0lTL3NWSjRVL1Z1bmdZYm92MitZMGQzbGxq?=
 =?utf-8?B?djJYbWxaZXhvUktFeFQzR0JENFBQMHhGb3ZkeXFjUWNvZml5YUtrYkpnQ0Jk?=
 =?utf-8?B?cXJMelF5bUx1VFNYdmpsaVNhSHhsejBuWmYzWVJhbXpPMVFOblpVYXBsQysr?=
 =?utf-8?B?WHNsRUZxSDVZWWxYUktLYkdPTk5sL25aZ3NJRzJpbE1DMzMvbFpMRTBGeDk3?=
 =?utf-8?B?ZEkybFR4SEhHSHM0WDFoeldmZ2lna0YrSmVEMUEveTVFa1ByTi9teWNlYnJ5?=
 =?utf-8?B?VEdpYzFhQkVTZDlRNjFRWFJGYjBrQU95Y09qZ1lUdUFoNW9NTFU0d0JGL2la?=
 =?utf-8?B?alZEUjZRbzZsbVp0bGNVdnpobElwbStOcEoyaHJhZXJnTXR5dW1nWEVWZGlF?=
 =?utf-8?B?anhoMnlkTE9yU20wdnA2ejRyQmZ2NjJMVEJZV1VpeVVPQUtNSDNLbWd3SUtD?=
 =?utf-8?B?NVBhWVB4b1RYdFBhSWNWNXdEVTZZRUpuQW43cEdTTGZuQURNUU9ZcUFvYWUv?=
 =?utf-8?B?dWUrRDJ6STdTYUlONWFQbFhxZVNobEpVYnZDNXZ3TjRib254RDNGR0kwZlZ0?=
 =?utf-8?B?RFFPaUtpY1hTM2FUMjZzNi9SL1FZMXZDZUVFL1FWWDY2K1pWTVhLVWsvZFBt?=
 =?utf-8?B?MWF3U2IrM0txOFB3V1JSRlZjanBkZW9kQmFHSEwwci9vR3gvVjVKMGpJaUVu?=
 =?utf-8?B?UlRIT3Jsa212ZlcxbjdsRjdJZlkzNmhqbTYvRjFIL2d3VUxVN1NXTllVR3BW?=
 =?utf-8?B?bU1FVStJc0Z4eXk3NlVCS0RPMm9udktzTHVuaW1qTFJKY0kxYlRZWCtiRDFY?=
 =?utf-8?B?R1NWTis1Qjgrd1h3WUx6b1RjZ1VSZGZXejJlOUhwTzQ4ZDJoNmVBbnJrZTlY?=
 =?utf-8?B?cC9tcnU1YWhRdzI0QWNUQ2FtWU1DZDlvUUpOSWxmM1d4OHZjLzYyMDgrbDEv?=
 =?utf-8?B?UDllbjVRMTlEdFl5RVRhL1dCVjlEa3NrMlM5VTd5cWhGcEg5K29qOEgvaDdH?=
 =?utf-8?B?TEVpL1N6VVZmb1NXQmdZbWVOY2NCUTZlM3UzclBQbm5vZkdpNzdiYXFEMDZW?=
 =?utf-8?B?ZkhiWVVXQTRHVk1rb1I2YTFMOVlmRVBHMFQyL0MvbTFTcE9rRWNvbHdpWklJ?=
 =?utf-8?B?R1RXZE9CTTFxczNhcVEzZ0VrMnRhbU1JRUJjVWtaanUwQjhtaVhUb2YvRnRY?=
 =?utf-8?B?NlpQU1lUOWMzTUpWS2Y2RVVjRFVIVDBkUjRjb2xOK1BLb05NMzhORTVqdk1s?=
 =?utf-8?B?aGZHdmhidWlGQ1VTek9jaVU3eW5tbVZ0RDlsNmpVdmhzM0hZMUZiMkVQUmpm?=
 =?utf-8?B?OUw0N3UxaVB6eFBTRjZ3eEtjU2pPOFlMcFZRTmpRWEVzaHJ1ZVRkem9MUUpq?=
 =?utf-8?B?bHJtd1VuMEpRYmtoejQ0Uk1KWUVpeExaSzIrSTJQSy9KdlZCdDFlMDdXVUIz?=
 =?utf-8?B?LysyaC9yOXEzM0U3T09DNFlFbDN3dUpuKzBpNlA3bE9ob3B6TldZai9oeGZE?=
 =?utf-8?B?Z2djYzNqaWZJWFQxc09Sbm4xbDF4RzZFY2d4Yy9nMDZrR1FqVytNdnQ3UERS?=
 =?utf-8?B?REFYUFYvaU9nR1BzQUhNQldUUmJBejQrb3R6cVpkcDdaOUQxdHNMOVJ2cDg5?=
 =?utf-8?B?dklFeGdYNk1DUTI4THp6Y1FZcHppazM5azBPUkFSc1pIMENRNndtS01XNDZM?=
 =?utf-8?B?RE5WUHZIWFBaRnpyNUhvTEt5ekZaak05ZTJNUnczWm5uRG5xcHBKZmxURnFt?=
 =?utf-8?B?VFdleHRNK1l4U3p2anorQkVDcm0yblJIdkl6aHlVTG5tUTkwQmxSUWtmeE85?=
 =?utf-8?B?cFp6b2M0T3NYQnZBYjNUZUJPcjVYUzZOeEpEdmRHQ0t3UXNmVlZsbmJBZVpa?=
 =?utf-8?Q?a3AFymZofnU/eV3VAOXnGkTI5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fff4141-5407-47fe-a4b5-08dcb233ac7f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 14:10:19.0593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yij2mIFNpPu3KhZ6CeeFCQYx7tSdpZ3XbzU+ABq9wZuuWThkVs5npYD609HdSRM24N5Yg96OV6mazIBDh+6WsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
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

Hi Nakshtra

On 7/31/2024 8:00 PM, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Using single exec, removing unnecessary headers,using variables of same
> type in single line according to comments in v3
Add a brief description of the test and version history separately
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>   tests/intel/xe_sysfs_preempt_timeout.c | 221 +++++++++++++++++++++++++
>   tests/meson.build                      |   1 +
>   2 files changed, 222 insertions(+)
>   create mode 100644 tests/intel/xe_sysfs_preempt_timeout.c
> 
> diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
> new file mode 100644
> index 000000000..a77741fcf
> --- /dev/null
> +++ b/tests/intel/xe_sysfs_preempt_timeout.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: sysfs preempt timeout
> + * Category: Core
> + * Mega feature: SysMan
> + * Sub-category: SysMan tests
> + * Functionality: sysfs preempt timeout
> + * Feature: SMI, context
> + * Test category: SysMan
> + *
> + * SUBTEST: %s-timeout
> + * Description: Test to measure the delay from requestion the preemption to its
%s/requestion/request
Sentence seems wrong
> + *      completion. Send down some non-preemptable workloads and then > + *      request a switch to a higher priority context. The HW will not
> + *      be able to respond, so the kernel will be forced to reset the hog.
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @preempt_timeout_us:		preempt timeout us
> + */
> +
> +#include "xe/xe_spin.h"
> +#include "igt_syncobj.h"
> +#include "xe/xe_ioctl.h"
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
order alphabetically
> +#define ATTR "preempt_timeout_us"
> +
> +static void set_preempt_timeout(int engine, unsigned int value)
> +{
> +	unsigned int delay;
> +
> +	igt_assert_lte(0, igt_sysfs_printf(engine, ATTR, "%u", value));
> +	igt_sysfs_scanf(engine, ATTR, "%u", &delay);
> +	igt_assert_eq(delay, value);
> +}
> +
> +static uint64_t __test_timeout(int xe, int engine, unsigned int timeout)
> +{
> +	struct drm_xe_sync sync = {
> +		.handle = syncobj_create(xe, 0),
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +/* high priority property */
indentation
> +	struct drm_xe_ext_set_property ext = {
> +		.base.next_extension = 0,
> +		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> +		.value = 2, /* High priority */
> +	};
> +	struct drm_xe_engine_class_instance *hwe;
> +	uint64_t ahnd = 0;
> +	uint32_t exec_queues[2];
> +	uint32_t vm[2];
> +	uint32_t bo[2];
> +	size_t bo_size;
> +	struct xe_spin *spin[2];
> +	struct timespec ts = {};
> +	double elapsed;
> +	uint64_t addr1 = 0x1a0000, addr2 = 0x100000;
> +	int i, n_engines;
> +
> +	n_engines = 0;
> +	/* select an random engine */
> +	i = rand() % xe_number_engines(xe);
> +	xe_for_each_engine(xe, hwe) {
> +		if (i == n_engines++)
> +			break;
> +	}
> +
> +	/* set preempt timeout*/
> +	set_preempt_timeout(engine, timeout);
> +	vm[0] = xe_vm_create(xe, 0, 0);
> +	vm[1] = xe_vm_create(xe, 0, 0);
> +	exec_queues[0] = xe_exec_queue_create(xe, vm[0], hwe, 0);
> +	exec_queues[1] = xe_exec_queue_create(xe, vm[1], hwe, to_user_pointer(&ext));
> +	ahnd = intel_allocator_open(xe, 0, INTEL_ALLOCATOR_RELOC);
> +	bo_size = xe_bb_size(xe, sizeof(*spin));
> +	bo[0] = xe_bo_create(xe, vm[0], bo_size, vram_if_possible(xe, 0), 0);
> +	spin[0] = xe_bo_map(xe, bo[0], bo_size);
> +	xe_vm_bind_async(xe, vm[0], 0, bo[0], 0, addr1, bo_size, &sync, 1);
> +	xe_spin_init_opts(spin[0], .addr = addr1,
> +				.preempt = false);
> +	exec.address = addr1;
> +	exec.exec_queue_id = exec_queues[0];
> +	xe_exec(xe, &exec);
> +	xe_spin_wait_started(spin[0]);
> +
> +	igt_nsec_elapsed(&ts);
> +	bo[1] = xe_bo_create(xe, vm[1], bo_size, vram_if_possible(xe, 0), 0);
> +	spin[1] = xe_bo_map(xe, bo[1], bo_size);
> +	xe_vm_bind_sync(xe, vm[1], bo[1], 0, addr2, bo_size);
> +	xe_spin_init_opts(spin[1], .addr = addr2);
> +	exec.address = addr2;
> +	exec.exec_queue_id = exec_queues[1];
> +	xe_exec(xe, &exec);
> +	xe_spin_wait_started(spin[1]);
> +	elapsed = igt_nsec_elapsed(&ts);
> +	xe_spin_end(spin[1]);
> +
> +	xe_vm_unbind_async(xe, vm[0], 0, 0, addr1, bo_size, &sync, 1);
> +	igt_assert(syncobj_wait(xe, &sync.handle, 1, INT64_MAX, 0, NULL));
> +
> +	xe_spin_end(spin[0]);
> +	xe_vm_unbind_sync(xe, vm[1], 0, addr2, bo_size);
> +	syncobj_destroy(xe, sync.handle);
> +
> +	xe_exec_queue_destroy(xe, exec_queues[0]);
> +	xe_vm_destroy(xe, vm[0]);
> +	xe_exec_queue_destroy(xe, exec_queues[1]);
> +	xe_vm_destroy(xe, vm[1]);
> +
> +	put_ahnd(ahnd);
> +	return elapsed;
> +}
> +
> +static void test_timeout(int xe, int engine, const char **property)
> +{
> +	int delays[] = { 1000, 50000, 100000, 500000 };
> +	unsigned int saved;
> +	uint64_t elapsed;
> +	int epsilon;
> +
> +    /*
> +     * Send down some non-preemptable workloads and then request a
> +     * switch to a higher priority context. The HW will not be able to
> +     * respond, so the kernel will be forced to reset the hog. This
> +     * timeout should match our specification, and so we can measure
> +     * the delay from requesting the preemption to its completion.
> +     */
> +
> +	igt_assert(igt_sysfs_scanf(engine, ATTR, "%u", &saved) == 1);
> +	igt_debug("Initial %s:%u\n", ATTR, saved);
> +
> +	elapsed = __test_timeout(xe, engine, 1000);
> +	epsilon = 2 * elapsed / 1000;
> +	if (epsilon < 50000)
> +		epsilon = 50000;
> +	igt_info("Minimum timeout measured as %.3fus; setting error threshold to %dus\n",
> +		 elapsed * 1e-3, epsilon);
> +	igt_require(epsilon < 10000000);
> +
> +	for (int i = 0; i < ARRAY_SIZE(delays); i++) {
> +		elapsed = __test_timeout(xe, engine, delays[i]);
> +		igt_info("%s:%d, elapsed=%.3fus\n",
> +			ATTR, delays[i], elapsed * 1e-3);
> +
> +		/*
> +		 * We need to give a couple of jiffies slack for the scheduler
> +		 * timeouts and then a little more slack fr the overhead in
> +		 * submitting and measuring.
> +		 */
> +		igt_assert_f(elapsed / 1000 / 1000 < delays[i] + epsilon,
> +				 "Forced preemption timeout exceeded request!\n");
indentation
> +	}
> +
> +	set_preempt_timeout(engine, saved);
> +}
> +
> +igt_main
> +{
> +	static const struct {
> +		const char *name;
> +		void (*fn)(int, int, const char **);
> +	} tests[] = {
> +		{ "timeout", test_timeout },
> +		{ }
> +	};
There is only single test. Do we need the array?
> +
> +	const char *property[][3] = { {"preempt_timeout_us",
> +								   "preempt_timeout_min",
> +								   "preempt_timeout_max"}, };
indentation
> +	int count = sizeof(property) / sizeof(property[0]);
> +	int xe = -1, sys_fd, gt;
> +
> +	igt_fixture {
> +		xe = drm_open_driver(DRIVER_XE);
> +		xe_device_get(xe);
> +
> +		sys_fd = igt_sysfs_open(xe);
> +		igt_require(sys_fd != -1);
> +		close(sys_fd);
Is this required?
> +	}
> +	int engines_fd = -1, gt_fd = -1;
> +
> +	for (int i = 0; i < count; i++) {
> +		for (typeof(*tests) *t = tests; t->name; t++) {
> +			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
> +				xe_for_each_gt(xe, gt) {
remove extra line
> +
> +					gt_fd = xe_sysfs_gt_open(xe, gt);
> +					igt_require(gt_fd != -1);
> +					engines_fd = openat(gt_fd, "engines", O_RDONLY);
> +					igt_require(engines_fd != -1);
> +
> +					igt_sysfs_engines(xe, engines_fd, property[i], t->fn);
> +					close(engines_fd);
> +					close(gt_fd);
> +				}
> +			}
> +		}
> +	}
> +	igt_fixture {
> +		xe_device_put(xe);
> +		close(xe);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index e649466be..335c8b837 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -315,6 +315,7 @@ intel_xe_progs = [
>   	'xe_spin_batch',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_scheduler',
> +	'xe_sysfs_preempt_timeout',
alphabetical

Thanks,
Riana
>   ]
>   
>   chamelium_progs = [
