Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A9EC3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CB010E063;
	Wed,  7 May 2025 16:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2Tyxlx1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EB810E063
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746635391; x=1778171391;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bXylfi3tsnpDyc1LR1h/HofW20Cw4rjmZEkTjDCsq8M=;
 b=b2Tyxlx1RFNVDD8VQkqSabjkYfmfjFkzipL1O0I9iFa6ESuH/ISZWEWg
 aq8TLl9xDGYrcrX8AinNeSt2mEzP94L7RU/cDK4GD8J5nJS4dyRHIF3+h
 UitnuGimbIZtG0pyo891VOx2v6Gkj/n6EJK5o7wyluDIEqlfa79g8md3a
 RaLoKoTMrxj9Bl5IfW0QM0qHAvkF5ggAQkNjVCl+zV59BAGwBroHYoTgB
 p/7x1SaCgFlsHrn4dOv4chYYpYdbo/zY6nXSl+rH6buzI72j8mcAMWc4m
 wGFxri0OsepE1u40m4Bly6DQp9a/YstO1jIfSkZJdMPGNNWK1GmcLyczL A==;
X-CSE-ConnectionGUID: MpKvlrcQRYu/VzdsF9HVrQ==
X-CSE-MsgGUID: ISguJ6CFRy6busehErBi0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59774370"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="59774370"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:29:47 -0700
X-CSE-ConnectionGUID: XZ/3PfuQT3GfVZdk2EaY8w==
X-CSE-MsgGUID: lcY/1wl9TuuSgg5W4KZpBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="136932629"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:29:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 09:29:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 09:29:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 09:29:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMgGEEfpZeHdP1+BqXQ8qm54p065Fl5zcUo1AIZlUIrPDjRrKgDuLSKAmwfOv61/Di/j1BLX83eXBbtnu6+ztRQLaKZpgRx4hmbGrkQDKHOPyc3DzuvkSZr6vW5OyBvvsseXqjByYccodMVy4abR69dILqjaeeSSLo/4d+jVgd4PqKUqutdMafTRmX4EXqQ4cnCIz9FSuhdp+HTdRRKc/u2JSLhZRwXykSVS6q0r2+dvuaNu92wSAUC482cO8lHpZokvc/7W9Sno0XkjX5E6nFNKh01C0nKyNBea/afnNdQtOze398tmndU2e6NJWxQI36VtzMIxhMigm4+Tuigu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zgzujVp6JMlLrHypUhSyNE/ECtkUDCAhmFaJsdUqQc=;
 b=g2LsnkAh2hp+x0sTHgoVd1uy116RnCwYV3jYAIoPA2COKXU3WS5hgP+UNT+mmwhVb03m9GX2tdcZP9ZT21p+yk8/CX5yrE2ARKG/gFx6mDuFI/cSmw9PWMO9dcUL64UnTl3gZ1+HtXXd1SeS1jDuUFgOclWmm1jwiGT56uuDR1ol3/D6dmPomYcvU+X+gswnp1N2olqljCGdpp/eOWWK6roROvB9sXb630cEVbbhG0W+YG8eQsMxlAtN64XxhHYmWNjhfvpz1GHZP+I7RPvBif37B6JVXAhpZSyQihh108qMJt25aWvlUD0pMS2hkFZPS3gRVz8aoaknveEee1PTFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB7361.namprd11.prod.outlook.com (2603:10b6:930:84::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 16:29:39 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 16:29:39 +0000
Message-ID: <4d6d966e-6b21-4e96-93a8-638fbc4fe462@intel.com>
Date: Wed, 7 May 2025 21:59:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_svm_prefetch: Test to validate SVM
 prefetch ranges
To: <sai.gowtham.ch@intel.com>, <igt-dev@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>
References: <20250507154725.36055-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250507154725.36055-1-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 9baabd0e-e37b-4341-485a-08dd8d845d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmkzNVpyY3FJek1ldGlGWVJtd05QeFl1QWFnV0NDUk9xNnRUVHBtU1ovRG5X?=
 =?utf-8?B?TnpYNUZFUmZwT1FuYXIySmVZV28xckNwSzJkYmw3RnZiZkUyek95ZDNJWTVn?=
 =?utf-8?B?THdoNSsycmZVc1diZUJIV3JjSHBNMTI4Q1hTL2pXSHRYRElhUXdKZUpnQXZQ?=
 =?utf-8?B?RkhQbkdjcEJ4QzE0S0hGNDUxK1F3TTM0V0NVQjBFT0RLZE4zdFZ1cEVFU3Jo?=
 =?utf-8?B?WjVMdzhqejZ5cUlBSVE5RUtMZnhaOTBVUXR2MWtxYnFxL2kxa053N09uRHpt?=
 =?utf-8?B?YUhpWTgrMFRVU0tsMnRHSmNFcmd0TzBncEtwSkZDNzd6WkNHZDBURHY3WjhY?=
 =?utf-8?B?bXViVmJQTjRDUTBldVdYMFptWlNMbXM3V1NNQlZzZTJkbFpUbEhMNEhUMzll?=
 =?utf-8?B?SnQ3VjhuRHdWb1lxVm9GWE5qLzRGQ1BaOTUvUEdJbDZOQ0FhQ1hCZUNlRVpR?=
 =?utf-8?B?MDRnRmNyMzZ3TXFJYnFMMVh5V3EvbUlRamJ5bXNlU043R1QyYUc3cnVRLzcz?=
 =?utf-8?B?b0svZzdkSkFZbFBzbmxoVG1qZ2ZZSTgxNysvY09aVHJXeVlTVGtwWC93aVRL?=
 =?utf-8?B?UnJnWmxtYy80RmlyM0VULzRuZzNtTmZuR1ZOTVdWaE1EUFhvT0FBRlFKdFpF?=
 =?utf-8?B?dkpzUmVJMFhUSVhSaXNhRG8wMDUyM3M2a25tSUZ4cVBORGZSL1Rrb0phbjU4?=
 =?utf-8?B?dkdXK1lnbjNJNlRJUlFrcGtQa3J5U09OWDBNUW0xdkQvVzR0K2Z3WnFJd1M4?=
 =?utf-8?B?VWtaaWkva1RKZlRYV1k2Si9Sd3B0bklBUk0wdWZuamF2bWl2TC9OTFNMNG45?=
 =?utf-8?B?SVQxb08wUWlLUDcrbjVSL0xaeUFlamxweWRsem1iRU5HTjFJSG9QdVNsUTVM?=
 =?utf-8?B?K2xBM2JXdDZkNmZaRmJGcVZwSjZkK2FjZHpJSTVGQXE3S2VKKzhXdTcvclhD?=
 =?utf-8?B?OVRjUnFrbzBTcDFheTVybUJVd1Q5a1VCTjFRc3Nlb09iRng5dktYQTMva2pY?=
 =?utf-8?B?a3VacjVjUTVxaTRDOE1EUnBBdjEwa3VYdTd3MjJPeHBlcU1idWVlTlI0RDl3?=
 =?utf-8?B?T1YvOE5YcXNac29aenF3cGhadnNLcndWNmhxRmVrRDhERDZheXlFM05oS0p2?=
 =?utf-8?B?SE5yYXhEMFdIZ2lLTFJKZUVKaTZHaVdSdUlaWDdBSXNTbU5mc1llMkFoUUVm?=
 =?utf-8?B?dGlSajNZelkxTWp4dXBjQkMwOUF0V3QwWUFxNVN0eXFtUGJUMzU3bWQ1eWhi?=
 =?utf-8?B?YU5rQ2hnZ2NRR2c5NlFTZnlzOGt4eXhsUUNtZjM5MXVXeEpPTU1BYlVDaktq?=
 =?utf-8?B?UVlHY242SHhQblhCRUxxNmlTbEkzWkszbVFhUTRXTkxBOCtxMjJPejUwODBk?=
 =?utf-8?B?aVhoMmVHRWdVT0dOeTdZRE8xR25WMEJjUmdaeUE1U1B0V3Fid2VZODg2RE9L?=
 =?utf-8?B?c0YvOEVkWE5BZ0tPNlpuMkU1ckZKUmpRMENRVWxLSS9sa1pDYk54dVhhMEV2?=
 =?utf-8?B?bkNFaWhUb2xQWEdXVzl6Tk93STBuaXpOdWxKSGx4WEd4SVI4SEYrRkRjNmd1?=
 =?utf-8?B?a29PUlg5WlBkcTFYd0JHWVlDa3QyOVFGLzc5YWVsdGdDTitEbkJKRHRtUG1D?=
 =?utf-8?B?OTM4cTV0eUZkeTlYbEEwSzVvckRQVUNuUEwrZWtRTWtKT3FuN3hqWEhZRFNR?=
 =?utf-8?B?WHRaSmpWODZzQldSUkdXemNrU0MxeDNEOUVveER3a3pieVhMMzFPUHhrZXN3?=
 =?utf-8?B?VTdqTmVKQkZtM0ZnajNRSUZUTjJIdW9BelgvNkJUR1c1VWVDRGxtcGRmK3B6?=
 =?utf-8?Q?nujbJsXVn7EHdpl9fENHPoG0PlhjMBgcG5zTQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3pGZStTNzErYUR3aDhOWkJXUkh4WllqY25FNktSa1BtMHpsNDBEcS9UeW5s?=
 =?utf-8?B?MVk1cnRDcGJrZW9UWWZvbkJKMGFZZEhvc3pPbDB2TThsYVVJZk5GWUwydDNu?=
 =?utf-8?B?ME4yUzNCdXppejlIalQzQmRIcm91MWhlVmJmcCt1SWY4M0FKbHFsRmdYVnM5?=
 =?utf-8?B?UW9icmUvVzZ0VUJ0TVdxdjVyVGROSHgzclZoRkczZjBhYmduYkE3ZytFUWtt?=
 =?utf-8?B?WnBWZEN2VUt6M2hWOEZXcVdlTnJSNE4wUUZQRU9Gdk9xV0JQSXpPM252bzBm?=
 =?utf-8?B?Y3hOdG1EaWJ6b3lBaHRLOHp4SmRvNUE4elBoUHUwQVV4Qys2VnBNeURGUy96?=
 =?utf-8?B?cWFCV0FWYlhOaWUvSitIa2h5TFlQWGhhNUhSRkFhTGdHUUZreVJ2WUFSTVc2?=
 =?utf-8?B?TVc2K1h5UHR4bERuQlFISTB3NlRhOXAxOFcvZUFZcWMyOTI3aUdRNDFETUFw?=
 =?utf-8?B?bytWRHM3SDZCS21PSHYrcmFqMXZxNUZIbjM1d1RvMXF3TW0xQzBvZGV3ZGsr?=
 =?utf-8?B?VHJOMVlpSklSWUN3RWV5b2FqamdaWUs0c1Mxb0hnZjgyZ0tkemdyUHRDdHdS?=
 =?utf-8?B?T1daZ2s0T21GVEp3VjlQeUZmWTNxVGNNWmpyNVorTnJCNzIwc25ZdjBaaWNq?=
 =?utf-8?B?RmcxSmhnaWJJQkRMbGU5S1JYWmkvcTBMOTdKUFowWWtvU1FiMnVsMHQrR1ly?=
 =?utf-8?B?RWU3V3V4UDFMVC9JdWd5STNzcEtseWZPU2NWU2liaHRGaU5td0tnMHdyRzZj?=
 =?utf-8?B?aitQSDVoYVIzR1lhY29zZ0w4bm5xSCtabTEvSG9EaWhqeHBZaXlMbktFNHZF?=
 =?utf-8?B?aEgyZTIvMVg0dGZUTWFtU2c3cUtGVEpPVGVralpNcGhHOCsrclFRRTE2aXRo?=
 =?utf-8?B?Y3VPeWFYdmlGTDVZdmYwTEhJVmNtK2tnSm1NcVZkTW1kdmZqL29wVUhBV3Zu?=
 =?utf-8?B?MzhrTWNiMWRZclpHWk55dEp3VVNIV3E4RmFlZjR4YVpmUnFtTTNEbmJIWitJ?=
 =?utf-8?B?ZWxTUVpmSk1ETzZhRUY1eXRzSGJGU1NBYjBMSHRoaTIyMHVNR29kMzlqQlRN?=
 =?utf-8?B?WUhaRXZkTXgrUkRFY3JHSUc0enQyK3J1ckd6UFBzYkZWVHN2RFJzUmthS0pw?=
 =?utf-8?B?R01kNkRtN29pZ0oreWRXZkUxcmN0bHRXdXkxWS9EeVR3Ylk0UXFRV3N5VlFS?=
 =?utf-8?B?U0lRbnpWWGpTVHR5dkdudFJWRWlpYWFONmt6UDFGemhkR3V0dytqekJDbHB2?=
 =?utf-8?B?L2hQYkFsRlhvWVJTUEo5VVljR05QUFlkMHJpaHpCUVk0bHBwRGpBRlJZMi9R?=
 =?utf-8?B?bkxQNFJXYzRyb0pWcHM1b1ZaZmJjYVJKU3ZEZGNEQktzalB0eCtUU2tiVEJs?=
 =?utf-8?B?dkVlL0h0dlNXaG1kODdHWE1XZEZWRVF3alRvY3o1UzJ3Q200QVVDMktaajVG?=
 =?utf-8?B?RnVEQUVJakxMSER6aTQrdzJudUxuZHZmZTlSRnZ0d2UrQkhONUlROW9URnNw?=
 =?utf-8?B?VGRhaUxlQmVoY3RuUWk0bGFYdDViOWJLbDRCVmM4Mm12S3UzbHduUVVEalhj?=
 =?utf-8?B?aHo5SG1TbXVaV3BzbWlJSTVSdDYrM0dlT0dzRTl6TGIvNm9LK1ZDbTVHVmQ2?=
 =?utf-8?B?N1ZJNDAwM1djNWp2cUZWL3NodWN4MVo3SFlzOUlxZ3owWXFvaUMzZnc1cHE2?=
 =?utf-8?B?eklEL1F5S25UTUpEOVAvL2cwRGJxc3JoNmQ0SHV3eHJQY0NHdVg2WGpHYU9s?=
 =?utf-8?B?anVhRWhXTXA4ekE0eW5mTVpjTi9pNUZ4WDR2Z2Y0OCt2SWVyaDFodGdSYVBu?=
 =?utf-8?B?Z3B1dzJCclYrWkpOeWlDQ0FiZTA1SDBlNmwxME0vZkdpeFNmMEkrR1RDMEJR?=
 =?utf-8?B?UGo5NzY4TTVrMkJPYVNRUkxhcUdHdG5GZFZ0aVZTS1BNRFJSalBvaEo4aW9T?=
 =?utf-8?B?YjNvbm5xWmViYXo4ZGVGWEMrbUZOaEhLQit4SnoyWmh2SDJaOGtTMDB6b0cz?=
 =?utf-8?B?S3F5aTErT0djdEJHcUR1K3YwOURpV1grRmxnNW5zOUFNZ0ZueW5Hc29yeUFL?=
 =?utf-8?B?b0FyOXlFd3djZjYzUWVTWWwzU0dKYm5XT1RCZHI4UFd2bDduc3JDaEVBKzdi?=
 =?utf-8?B?bTVsR21aRE95ZUdUOHpncUVnclJWWHc0VnUwbXpWaEw2R0FNQ1p2WXZBYyt0?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9baabd0e-e37b-4341-485a-08dd8d845d1e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 16:29:39.7404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjh7xLTFxQBGKepzn01jCYE9aozElZZaIe+x+B6gT+uPUDqtwcAZCBI0qLi7TRQ5rnL9w0pFo/4LgrbPSRPC9E2CJ8x1DFbCFKfQoBzJsQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7361
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



On 07-05-2025 21:17, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates prefetch with single range and multi ranges,
> and stree testing of prefetch by binding address ranges with different memory
> regions to check the expected bahaviour.
> 
> Verified with KMD SVM prefetch changes
> https://gitlab.freedesktop.org/hghimira/kernel/-/tree/latest_v6_to_be_sent?ref_type=heads
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>   tests/intel/xe_svm_prefetch.c | 300 ++++++++++++++++++++++++++++++++++
>   tests/meson.build             |   1 +
>   2 files changed, 301 insertions(+)
>   create mode 100644 tests/intel/xe_svm_prefetch.c
> 
> diff --git a/tests/intel/xe_svm_prefetch.c b/tests/intel/xe_svm_prefetch.c
> new file mode 100644
> index 000000000..3e3853455
> --- /dev/null
> +++ b/tests/intel/xe_svm_prefetch.c
> @@ -0,0 +1,300 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + * Authors:
> + *      Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> + */
> +
> +#include <fcntl.h>
> +#include <linux/mman.h>
> +#include <pthread.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> +#define VRAM            (0x1 << 0)
> +
> +#define bind_system_allocator(__sync, __num_sync)                   \
> +	__xe_vm_bind_assert(fd, vm, 0,                              \
> +			0, 0, 0, 0x1ull << 47,  

Should be platform dependent xe->va_bits, any thoughts on making this as 
subtests within xe_exec_system_allocator ?                    \
> +			DRM_XE_VM_BIND_OP_MAP,                      \
> +			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,        \
> +			(__sync), (__num_sync), 0, 0)
> +
> +#define unbind_system_allocator()                       \
> +	__xe_vm_bind(fd, vm, 0, 0, 0, 0, 0x1ull << 47,  \
> +			DRM_XE_VM_BIND_OP_UNMAP, 0,     \
> +			NULL, 0, 0, 0, 0)
> +#define WRITE_VALUE(data__, i__)        ({              	\
> +		(data__)->expected_data = rand() << 12 | (i__); \
> +		(data__)->expected_data;                        \
> +})
> +#define READ_VALUE(data__, i__) ((data__)->expected_data)
> +
> +/**
> + * TEST: Test to validate prefetch of svm
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: prefetch
> + * Functionality: svm
> + */
> +struct data {
> +	uint32_t batch[16];
> +	uint64_t pad;
> +	uint32_t data;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t expected_data;
> +	uint64_t addr;
> +};
> +
> +static void write_dword_m(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
> +			  int *idx)
> +{
> +	batch[(*idx)++] = MI_STORE_DWORD_IMM_GEN4;
> +	batch[(*idx)++] = sdi_addr;
> +	batch[(*idx)++] = sdi_addr >> 32;
> +	batch[(*idx)++] = wdata;
> +	batch[(*idx)++] = MI_BATCH_BUFFER_END;
> +}
> +
> +/**
> + * SUBTEST: basic-svm
> + * Description: Test validates basic svm.
> + * Test category: functionality test
> + */
> +static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
> +		       size_t bo_size, int num_dwords)
> +{
> +	uint64_t addr;
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	struct data *data;
> +	uint32_t exec_queues, vm;
> +	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	data = aligned_alloc(aligned_size, bo_size);
> +	igt_assert(data != NULL);
> +	memset(data, 0, bo_size);
> +
> +	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	bind_system_allocator(sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	data[0].vm_sync = 0;
> +
> +	addr = to_user_pointer(data);
> +	for (int i = 0; i <= num_dwords; i++) {
> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr = addr + batch_offset;
> +		uint64_t sdi_offset = (char *)&(data[i].data) - (char *)data;
> +		uint64_t sdi_addr = addr + sdi_offset;
> +		int b = 0;
> +
> +		write_dword_m(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
> +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +
> +		exec.exec_queue_id = exec_queues;
> +		exec.address = batch_addr;
> +		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> +		xe_exec(fd, &exec);
> +		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, exec_queues, NSEC_PER_SEC);
> +		data[i].exec_sync = 0;
> +		igt_assert_eq(data[i].data, READ_VALUE(&data[i], i));
> +	}
> +	unbind_system_allocator();
> +	free(data);
> +	xe_exec_queue_destroy(fd, exec_queues);
> +	xe_vm_destroy(fd, vm);
> +}
> +/**
> + * SUBTEST: prefetch-smem-%s
> + * Description: Test to validate functionality of Prefetch using SVM of size arg[1] at smem region
> + * Test category: functionality test
> + *
> + * SUBTEST: prefetch-vram-%s
> + * Description: Test to validate functionality of Prefetch using SVM of size arg[1] at vram region
> + * Test category: functionality test
> + *
> + * SUBTEST: bind-vram-%s
> + * Description: Validate prefetch-smem of size arg[1] by rebinding them with prefetch-vram to
> + *		check the behaviour, ideal behaviour is to migrate ranges
> + * Test category: functionality test
> + *
> + * SUBTEST: bind-smem-%s
> + * Description: Validate prefetch-smem of size arg[1] by rebinding them with prefetch-vram
> + *		check the behaviour, ideal behaviour is to migrate ranges
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-smem-%s
> + * Description: Prefetch of mutliple ranges within arg[1] size to validate multiple ranges are created
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-vram-%s
> + * Description: Prefetch of mutliple ranges within arg[1] size and check if multiple ranges are created
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-bind-vram-%s
> + * Description: Validate multiple ranges of size arg[1] by binding them with multiple ranges at vram
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-bind-smem-%s
> + * Description: Validate multiple ranges of size arg[1] by binding them with multiple ranges at smem
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @SZ_4K: SZ_4K
> + * @SZ_64K: SZ_64K
> + * @SZ_2M: SZ_2M
> + */
> +
> +#define MAX_BATCH_DWORDS 16
> +static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
> +		     size_t bo_size, unsigned int flags, int num_dwords, bool bind)
> +{
> +	struct data *data;
> +	uint64_t target_addr;
> +	uint64_t addr;
> +	u64 *exec_ufence = NULL;
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	size_t slice_size = bo_size;
> +	uint64_t batch_addr;
> +	uint32_t exec_queues, expected, vm, *result_ptr, *batch;
> +	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> +	int b;
> +
> +	bo_size = bo_size * num_dwords;
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	data = aligned_alloc(aligned_size, bo_size);
> +	memset(data, 0, bo_size);
> +	addr = to_user_pointer(data);
> +
> +	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	bind_system_allocator(sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	data[0].vm_sync = 0;
> +	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
> +				 PROT_WRITE, MAP_SHARED |
> +				 MAP_ANONYMOUS, -1, 0);
> +	igt_assert(exec_ufence != MAP_FAILED);
> +	memset(exec_ufence, 0, SZ_4K);
> +
> +	for (int i = 0; i < num_dwords; i++) {
> +		batch = (uint32_t *)((uint8_t *)data + i * slice_size);
> +		target_addr = addr + i * slice_size + 0x100;
> +
> +		b = 0;
> +		igt_assert(b + 5 <= MAX_BATCH_DWORDS);
> +		write_dword_m(batch, target_addr, 0xDEADBEEF + i, &b);
> +	}
> +
> +	sync[0].addr = to_user_pointer(exec_ufence);
> +	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 1 : 0);
> +	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	if (bind) {
> +		exec_ufence[0] = 0;
> +		sync[0].addr = to_user_pointer(exec_ufence);
> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 0 : 1);
> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +		exec_ufence[0] = 0;
> +	}
> +
> +	exec.exec_queue_id = exec_queues;
> +	for (int i = 0; i < num_dwords; i++) {
> +		result_ptr = (uint32_t *)((uint8_t *)data + i * slice_size + 0x100);
> +		expected = 0xDEADBEEF + i;
> +
> +		batch_addr = addr + i * slice_size;
> +		exec.address = batch_addr;
> +		exec_ufence[0] = 0;
> +		sync[0].addr = to_user_pointer(exec_ufence);
> +		xe_exec(fd, &exec);
> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queues, NSEC_PER_SEC);
> +		exec_ufence[0] = 0;
> +
> +		igt_assert_eq(*result_ptr, expected);
> +	}
> +	xe_exec_queue_destroy(fd, exec_queues);
> +	unbind_system_allocator();
> +	munmap(data, bo_size);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +igt_main
> +{
> +	int fd;
> +	struct drm_xe_engine *engine;
> +	const struct mode {
> +		const char *name;
> +		size_t size;
> +	} mode[] = {
> +		{ "SZ_4K", SZ_4K},
> +		{ "SZ_64K", SZ_64K},
> +		{ "SZ_2M", SZ_2M},
> +		{},
> +	}, *m;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		engine = xe_engine(fd, 1);
> +	}
> +
> +	igt_subtest("basic-svm")
> +		test_basic(fd, &engine->instance, SZ_64K, 1);
> +
> +	for ( m = mode; m->name; m++) {
> +		igt_subtest_f("prefetch-smem-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, 0, 1, 0);
> +
> +		igt_subtest_f("prefetch-vram-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, VRAM, 1, 0);
> +
> +		igt_subtest_f("bind-vram-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, 0, 1, 1);
> +
> +		igt_subtest_f("bind-smem-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, 0, 1, 1);
> +
> +		igt_subtest_f("multi-range-smem-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, 0, 10, 0);
> +
> +		igt_subtest_f("multi-range-vram-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, VRAM, 10, 0);
> +
> +		igt_subtest_f("multi-range-bind-vram-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, 0, 10, 1);
> +
> +		igt_subtest_f("multi-range-bind-smem-%s", m->name)
> +			prefetch(fd, &engine->instance, m->size, VRAM, 10, 1);
> +	}
> +
> +	igt_fixture {
> +		close(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 20ddddb89..84e109803 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -324,6 +324,7 @@ intel_xe_progs = [
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sriov_scheduling',
> +        'xe_svm_prefetch',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',
>   	'xe_sysfs_scheduler',

