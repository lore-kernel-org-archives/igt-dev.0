Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4411FD12671
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 21:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F4110E6EB;
	Tue,  2 Dec 2025 21:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9+bhPKR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA86B10E2B6
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 21:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764712783; x=1796248783;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SzpaWCGMX1I5U/859zn5w+/uuEhLO22uD6JpuLwrrA4=;
 b=E9+bhPKRdcr8WW+NDNKwFVgHEdW7XmQp1D7GCf6Iz1Re+7sxA6BWdOZ1
 GLxU7kho4UU3H6uqbuW0pwGmDx/y0UBAaOv0jlV9yyYp7LNwKVDPqcYjf
 mp37CzCVUPyldSI2x3hrkM7KzilXYuQrDgfy690cGF3Npx0N7Gz651fI1
 o6qJlOYYjRhRlo7IJq2q6cFvLaUEWSqgpZflcwA9cYyaiWPGwKAYnJK6s
 tc1TgjEmfiWffRx8U5JLGOBQ4sQ1EhO2DWy2X/L8gPHUf6NPQ9lUPkh+E
 6vFv8PrB6wET6vuGdMtdBoai5fq5Fd2EBFgNJhYH3dAV/rmjINjL4TSZ/ A==;
X-CSE-ConnectionGUID: k7HqFck+Q2q2rWkdBqB+aw==
X-CSE-MsgGUID: romXK2FoRTm5P0HVlZLNwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92175085"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="92175085"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:59:43 -0800
X-CSE-ConnectionGUID: pghFSfiCTuW9KX3SFGUmkg==
X-CSE-MsgGUID: mwG182N8QGSqcaXPbwq08w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194739331"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:59:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:59:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:59:41 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:59:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqVc5S644hmnQfTvrrQqEXjmq2UktP6gT7/M7iXhDGGOkf8WlkrJdWsLDc+Pk2EjB5iz92AI7hqzR5la7s66jJhgXcctj5frmsWTcXYkBxKr2Ewz4sDf2YPBW2dAzwkF+i5hcwWE4vzFFDl+gr46dcKhfCoIqOwWDjcW3+3+RKJFKcc4iqx5dCShhEvZ3Ff4Q50UHrhqKvQNwC28V9X6G2ylKfQv4LTwbAPckCQB3+7GBlTBjIzPoZcdZlDNUyLh5nsotxLq9tb7jmgGyYGfUCOcP6EVCnt9IfmEo2EkWbR8jinfOwkEB6RYfUDSePBeUjAyeSiHDcnlJIRJX1W63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7joCp1QtP2dAgIEULDTHlJZw6ZmReSxyy1Sn4LL7fpc=;
 b=AI/ZkWPIaUx1juJqdCpJ18RxEJ4jyybdBPN0ur3IggWCmfxMZRxWSNCzBBYMnI4wdzeEH+HX9DoI6JzcUuyHv1BX9hz54AOTTXyUZHU7WjvRr/CZPQ8x6Vxk5n1xLIeAo1H2MN0EipvahohidDoO59fp6MTwMyB7/jW3+hrjXkq3Qzl+isrYskgsT1UUcBEjtiIDdC/xFi7qr09zFvtYCgPZoWNjFxI0pVc3c3Wf9pBniiqhqcGpTFa3hOp2wYe0js2U96kGM6W6kAJDIpOPyZmotoxGqsfNlUGCh8bXJqcq4lTWDx5WdyvZ93ij4RebZGY36vL/MSjy7m3Kq25WOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 21:59:39 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 21:59:39 +0000
Date: Tue, 2 Dec 2025 13:59:33 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_oa: Use separate oa unit
 variables for caps and iterator
Message-ID: <aS9hRRBlxX3Gc7JR@soc-5CG1426VCC.clients.intel.com>
References: <20251126035012.12967-1-ashutosh.dixit@intel.com>
 <20251126035012.12967-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251126035012.12967-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:303:8f::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b62ff4-e994-4e24-32ce-08de31ee16e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjJuMERSanBZeHl2d1oySnY4QXRyTXBpY3ZXSXd3OG01U1V1STErZWVlako4?=
 =?utf-8?B?bGdaS0lIQXpwNnlnR0JHUkE1TEtvdUpnQVlqTDZFVHZia1V0Zk5JMFVzMWN5?=
 =?utf-8?B?akdqaUlEd21qa0hsWVZPcjNkVldtQ1dRN05GUk5reHVDejJ2a3ZkNkh4MVp0?=
 =?utf-8?B?ck8ydEJxNlFHK3c1WU4yNDdrbjZMd1FwMVhIRHNzWDB0eXU1WThuYlhINEll?=
 =?utf-8?B?bG5QenpJcXNXb2VlUUw5VCtGSlhxVys3N25wZFJHZmJUOHJERXBKY2cyczlP?=
 =?utf-8?B?THJaVm83ZmphN1ZuZ2IycTdlbXJoN3lGeDA2QVJUbEthc0wwMVVjVHVQUVhp?=
 =?utf-8?B?V0Q5ZTVlaVRWY24zMlA5T3J6S1EyUnFFblJpQ1dQbEtTeXNDd2dRRTQxQVFI?=
 =?utf-8?B?eTc1VUl6VXMwT3pSV2ZCQUNKT0MvaEhJWDFPRGJYMVI2N1Y2Mm9NNHM2K2FM?=
 =?utf-8?B?eWdVdDVtLzFqeFJGVXB0dmVCR09OaXZCMDlwbWNORkVCTzZSNXZXa3NWcUYy?=
 =?utf-8?B?L2dDQTEwWGZrZnpiTEh3aXVtQVQ1YnhXVUprMWNFeHAyTC8xVFVjMXJDenUr?=
 =?utf-8?B?eC9FdThGamlncHhIMytMMG84dExTN05RYXNCalNUSEpTTklUQ0ZXYnRZRVpy?=
 =?utf-8?B?d1BDbWRzUUkxYVB4WFdRWUUzN2lDazZPVHZPaXFJMjdHejlRUGZod3lsWmFu?=
 =?utf-8?B?TUROR1FhWGtKRXdRK1hxUWFVSWtiVU5sbFVxNG1rZEh6cnJnZ2p0TlNwc2JB?=
 =?utf-8?B?WDV3YkxrTUpkWnZQWjZnQVN4M1IwVjZUWDd1c1IwOGRpUW01OUh3aCt4bXJu?=
 =?utf-8?B?YjhzMENrYm9VZEFsQUdsMUdaWERDMUloNldxUEVWRzJmYzdadlJvQ0E5Zm1q?=
 =?utf-8?B?cm1kSkRZUW9GdGVWb3BraTcySVFISTBvQUE1RUVNdFF1bEo5MHZHUVhubzZn?=
 =?utf-8?B?V1hjZ0JVWHEvLzhBMjhDUUxCekhRcTZxNHJmeEg0QTZMaGlxOWljV2lYWXZV?=
 =?utf-8?B?a212RVR1KzhEbURzd2U1cXFOKzZSSzNqald0Z250U1RaaStlUUJMU0tvWml2?=
 =?utf-8?B?UmtmRG5KbzJvc0xQOUQyaTZscSs2Y0tqK1dqQXQzSkZxM0ZYT1BiaVBLSW9y?=
 =?utf-8?B?NnZKdFAzblFsbE5pUGdSMVE4dkR4ZlQ0TzVyNVlXR3BwWVJkdkNFa2dvWVBF?=
 =?utf-8?B?cFd1Zk1Vd1NpTjlFYVpwb3Z0bzJwS1VGdW13ZzF4dWpObWdZNWhjR0RkTTBT?=
 =?utf-8?B?RkNBb2tFaGhzb3Zxc0tyckg4bmpJYkVNcDYrblBETjJmUi8vSC9EM2NNZXdR?=
 =?utf-8?B?VTdBZFFFVUVyZGpRZnA5TktFT0E5aGtwTXB1am1DS0NzclNYaEZFSjJwSHFC?=
 =?utf-8?B?ZEhNeGVZNks5ZFFodXd3ekxpS1ZNcFdYdGZjOXF4TmhrZTZGUVdQQVVNNE9N?=
 =?utf-8?B?TlowSitaNGhhMWFoVnV6RlVoV28xV0lVQlNoazFvMnFKQm50ZDRYU3ZmQnZo?=
 =?utf-8?B?aVBSdkNmdExHL3lqQUs5MnR1Mm9mZStyR1F6UVR4RG1PVjZ0YnorRlljcXJW?=
 =?utf-8?B?VEkzeGZFZ3l2cmkwTkZzMlZtMENqSm9UMzBLZnJabzJjSmRxb3o3NThacnZ2?=
 =?utf-8?B?cFMwd2RXbmdUZm9wcVNVNkl5RjRoRWx3Z3dNN1pWanFiWC9Say82bnIvSFRm?=
 =?utf-8?B?VGU0VzlVcFdIZFdHUVBFVlo4cUZQMW56NjQ5YU1BOXVUcGtYaVhJUXcrYzVu?=
 =?utf-8?B?MUxyVWVwS2FTYkpTK2t1WHNrL1RoTStLd25kcUNsT1lSM045YzhRNTVOMVJ3?=
 =?utf-8?B?cm5jWU1oRVhGbVFja1ZmYmJuVUV5ZmZBTmFhS3lQejE4TDE3OTIrZXFHWGxB?=
 =?utf-8?B?OGZ3OEgvaUJiQldCbEFmSTBueXk3RGxpZXFXTFVZMUdMY20xSGlKalBvSExT?=
 =?utf-8?Q?B1dR8R6R60n1ffxBf4OnX21ydSFnmwLX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtrWittUTdPUi9vZHpHQ0t1RDVYQjhqazl6WitMOE5obFZZU1lORGF2YXVP?=
 =?utf-8?B?TTd2T1orMGVYbW5PdmdpcmdCL1ZWQzVSVnNMVjhOaVQ4cTRweHY1Qnp4dy91?=
 =?utf-8?B?ako3clprTHBMcDhCc0dKcTVTMTVpdWp6WmJkTkgwQjFYV056RDdMVEc5NTRW?=
 =?utf-8?B?UGxXL25MQXdlNFlkVlF6eXVSUjZBTGUzcDdEWFhNL0dZVXcxaTVKcnRYdWg0?=
 =?utf-8?B?TUJ5bWtZSzBnRGpzczlIVEhOQVEvbjZLNDVnOU1ZUXJiKys4WGFTOGh0S09r?=
 =?utf-8?B?bmwwWmhBUjViZStwYXo0em5MdTF1dnFYMHlqRWYwOHQvMmdyYXMxMnl4UFJu?=
 =?utf-8?B?RnJwV1NPK1lXQ01pdXVrbVFCbU5FR2c5YVAxMDgzdnY4Z2JCSGZiVVpGVWdB?=
 =?utf-8?B?MCtjNnRHeUR3S1hydUlzL09hcFNON0pKNDBkSnNYWkZPVmEwenY4Ly9vc1RE?=
 =?utf-8?B?VDIvSUpSdEJXcDNxZVE5R1BGVms4TVByREJNMTdDR1h3UkwyY1VCSXdGMzhX?=
 =?utf-8?B?WTJLdVVyUDQyOEd2TTVYVW5MT3RvQnNnR2ZObHZBdVFoWFRVWURldHAyd3hp?=
 =?utf-8?B?VjV3UkNjRlBpKytxMFRlRlJrd2N6L2psQjZ3T0ZBTXlXb2duVHQvZVpZSVV3?=
 =?utf-8?B?d1IwcDcyQ25wM2dKUmF5dGRHd3dzdUF0amRZcUlsNlNiTlU4K0ZPeTR6NFBS?=
 =?utf-8?B?OEJjOVdpRlQ0VTkvT1dSREpQZHNIbWFNVU1RL2hNdkJ3UWZtaTU4RXJLS2Nx?=
 =?utf-8?B?SWVUNXk3M3N4ckhuVHk0aU1VN0FvbFQxaDA0Y0d2eSt6a2YwYW5iblhVSW10?=
 =?utf-8?B?ZUtFWVFLRVJkczhGeFlmM1dmU3BKR1pPczlIV2RBTUJ4QlpNbTRqUXh6OG9Q?=
 =?utf-8?B?TWR6WWcvb0hlcGdUNUprOWJFSkprM1M2NXRZUHdGV3BNOU1OL2ZYSGZSOUJm?=
 =?utf-8?B?N0hUSmg4aklrQmdIcVI2Rm9sM3laUk5GN0dQeFJ5SVFnOTgyZVVEWmJrbkRO?=
 =?utf-8?B?akUvN2VtbmlENmhTS3pjSStPWkh3N2dlcTJmNmFvV2o5akM3TTUxUHk4cktT?=
 =?utf-8?B?ZjBvWURnM3dkalJLWFEreXU4UEQwdllpUVhUMTh1VUhzTzVPOWcxOG5FWTFP?=
 =?utf-8?B?cXlDTFAwNllTYmZQWUhjNWJ4YnlwMlh0VCsxakl6S2kyQW5CZTdQdGRZMDJk?=
 =?utf-8?B?b0xIQnlQZ09sbWVFZEhsMWZUK3JSVHc5aVNRWjlEZXg1RG9Tc1lPWlhXWHVJ?=
 =?utf-8?B?cU1BNnM1NFVuNmNaRStKWks2YzFwRDMyNlZRTlpnSHRvekZLZXpqY1Nwb0lU?=
 =?utf-8?B?OXZ2b2gwdGhlcndMMmdWS1RaVjR1bTJySjRyaEkvUFpQZlV4WkZabEZQY2x4?=
 =?utf-8?B?MHQ2Q3V5aUJmajUwUjg4K2VFaUZMTUVldHVlNjB3UjRqcWljZmU2cWlhaWtq?=
 =?utf-8?B?R01PQ0IxN3Y1aEZMOVRLK01OY1d4bDVmSHVmRkdxbnVjd1ViSXR4Si8za1I0?=
 =?utf-8?B?MzJ5VHlpS2JWTURrUUlmWnRwcEhtRTdzaFlMZC9qYlBLcDdTUHdVeGd0dy9t?=
 =?utf-8?B?UmhsbXY2VU5CbWVEc1Z6ZmdubjNpc2wxVDdiL05QbENtbDMrV0w2dzM3dUht?=
 =?utf-8?B?ZWlSU2NmeStMcjJsTGVYczZ5cTNtYytsbjcrRVVnTHJ2ZXFCaTVyaExhUk9K?=
 =?utf-8?B?Y1kzVnYvU0gyKzNaQWdacmNjTTMxd3hQelRJSkdsVzg1WnBoU3cvdDBYUmYr?=
 =?utf-8?B?R1ZZbStORUNCU1kxRHg4OFRQMWpVVTZUdXphTmZZdDV0U0Q5Z002SFFGaDNn?=
 =?utf-8?B?M01rMnpIQmFSNGkxankzVDIyWHNwWWZiVm96ZlFBVW91bUp2M3JxMzlZbGRn?=
 =?utf-8?B?TFVqYzJya3RwN1AyNDZPWG1DdDRGSGdMdmxOMTNuRjlCSldBOW05enpWb2Rz?=
 =?utf-8?B?cnU0R1ZMRW5HUzJLZW1Uc2szVEsyVjcxaVRDZ2YvSGdxYUliUk5sVGxoeFRy?=
 =?utf-8?B?anpKQXpIMVoxR3pxTmt4QkdFT05KZyswbVlTc252anpENWEza3p6SUdQNndk?=
 =?utf-8?B?N2hVNEdUUkJ0TEJDSTlPU2NGMzE3cGNhay9jbFk2ZTJHSmswTkhjdHlOSEVr?=
 =?utf-8?B?ZlFNdjArUzFzbm9aQit0R0MwaHRXNGJsbWR3UUQ2QThyTDRvUEhwMXluN1Jw?=
 =?utf-8?Q?uutBtaR1fHu/p9xLPznQMNA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b62ff4-e994-4e24-32ce-08de31ee16e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:59:39.0480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfcVWo7mLRaN5Jek5cYkOhJgRVPtLjMr4zfszDf2fhY/tCP43EPVRZoQrkEFwM0EcO77EtI/YpNNqZGGVUQLUacP8MImhAlfLbRMju17jxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
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

On Tue, Nov 25, 2025 at 07:50:12PM -0800, Ashutosh Dixit wrote:
>The __for_each_oa_unit() iterator places the oau pointer at the end of the
>oa unit array. If the iterator is followed by 'oau->capabilities' check,
>'oau->capabilities' is undefined after the end of the oa unit array. To
>resolve this situation use separate oa unit variables for checking the
>caps and for the iterator.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Looks like this issue will pop up only if you are running all the tests 
at once. Shards might not catch it.

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 20 ++++++++++----------
> 1 file changed, 10 insertions(+), 10 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 2f966e808f..502fa47323 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -5031,7 +5031,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		{ "ufence-wait", OA_SYNC_TYPE_UFENCE, WAIT },
> 		{ NULL },
> 	};
>-	const struct drm_xe_oa_unit *oau;
>+	const struct drm_xe_oa_unit *oau0, *oau;
> 	struct xe_device *xe_dev;
>
> 	igt_fixture {
>@@ -5063,7 +5063,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		/* See xe_query_oa_units_new() */
> 		igt_require(xe_dev->oa_units);
> 		igt_require(xe_dev->oa_units->num_oa_units);
>-		oau = oa_unit_by_id(drm_fd, 0);
>+		oau0 = oa_unit_by_id(drm_fd, 0);
>
> 		devid = intel_get_drm_devid(drm_fd);
> 		sysfs = igt_sysfs_open(drm_fd);
>@@ -5102,7 +5102,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 			test_oa_exponents(oau);
>
> 	igt_subtest_with_dynamic("buffer-fill") {
>-		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>+		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
> 		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
> 			test_buffer_fill(oau);
> 	}
>@@ -5114,14 +5114,14 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 	igt_subtest_with_dynamic("buffer-size") {
> 		long k = random() % num_buf_sizes;
>
>-		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>+		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
> 		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
> 			test_non_zero_reason(oau, buf_sizes[k].size);
> 	}
>
> 	igt_subtest_with_dynamic("non-zero-reason") {
> 		igt_require(!igt_run_in_simulation());
>-		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>+		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
> 		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
> 			test_non_zero_reason(oau, 0);
> 	}
>@@ -5131,7 +5131,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 	 * Description: Non zero reason over all OA units
> 	 */
> 	igt_subtest_with_dynamic("non-zero-reason-all") {
>-		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>+		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
> 		__for_each_oa_unit(oau)
> 			test_non_zero_reason(oau, SZ_128K);
> 	}
>@@ -5249,7 +5249,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 	igt_subtest_with_dynamic("tail-address-wrap") {
> 		long k = random() % num_buf_sizes;
>
>-		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>+		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
> 		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
> 			test_tail_address_wrap(oau, buf_sizes[k].size);
> 	}
>@@ -5265,14 +5265,14 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
>
> 		igt_subtest_with_dynamic("mmio-triggered-reports") {
> 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
>-			igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
>+			igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
> 			__for_each_oa_unit(oau)
> 				test_mmio_triggered_reports(oau, false);
> 		}
>
> 		igt_subtest_with_dynamic("mmio-triggered-reports-read") {
> 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
>-			igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
>+			igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
> 			__for_each_oa_unit(oau)
> 				test_mmio_triggered_reports(oau, true);
> 		}
>@@ -5280,7 +5280,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
>
> 	igt_subtest_group {
> 		igt_fixture {
>-			igt_require(oau->capabilities & DRM_XE_OA_CAPS_SYNCS);
>+			igt_require(oau0->capabilities & DRM_XE_OA_CAPS_SYNCS);
> 		}
>
> 		for (const struct sync_section *s = sync_sections; s->name; s++) {
>-- 
>2.48.1
>
