Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2845D49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 11:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC8510E99D;
	Fri, 30 Jan 2026 11:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAzPRF1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3914210E99D
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770842; x=1801306842;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rWyNzqBiidkeMhkH7VZ73mgS02eNuZa9oD/SrH7BNGg=;
 b=JAzPRF1S+cBFsg3c+eZVqaGnLAEpNC1pkqGNyfs87tR0hXeP2P4KtyPO
 6rb0lGp+KlgxoOD0xj2DOh7pYlQM2OWJF+MX/4qcOqxIwgwcvPQwKX6UY
 5thoNYG18ZpfoGqUb26zt9mYXonRXRqVodY9Z3BIXsJgDNvN3TZRKAiN6
 SqOQdRMRGsHSSWpV2l7orK66LZhIAIEl3m5qFXlyrIc0rxrB8emH5JwAG
 1y6IEUf6FpkiCc55yvHBVcum8cBYnKru880MCbvqNRlePobW4ki+UOmv8
 SCGcfJXWr8Y3DSqjCDqQB4U9Mt9npv9pOt+/V0RnaUcJh4OuProK/b2fP g==;
X-CSE-ConnectionGUID: hXxH+OqtSbe2xYdbZv+siQ==
X-CSE-MsgGUID: RO7HYDd7SxqorIJC2iXEVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58599657"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="58599657"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 03:00:42 -0800
X-CSE-ConnectionGUID: sXtVJRwbQRyWMFL/glWdSQ==
X-CSE-MsgGUID: 629iy+BvQsO1ZULV2F6kdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="209250267"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 03:00:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 03:00:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 03:00:32 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 03:00:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dL1MJ7OkzA3Pv8wyuVJgAaNuMLN/i7OTwZ3HuE241BXnpN+noZabHfreD2OByfv4evr3DdiFAb49jph6csp9bQj9jmyT34oTWmIR6jUvBSUMp4wHQuVxl7F33n/ILMGO5KxnrEKoxlV/7OyL+SCXxYzZdtjjdxxikqTyUtQko0W4QC+Mu4aXp8JswgO88Y7RpAr/k6OphhMbG7R17nu+kqvQVU/ERjq4MwR/02MF6oGeO/B/V9IHxEyT+HwJqHzEbV0shZxZYa/PfGeHMmE3hlJYwdSGRAaxjNXQazJ4azePNgkSuhUKoPBmkP2+A5mrqOoVYXxcvc4d6C3VeGE/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhqcT4p31XH1Bbf7DkPCUsQzoH/Hpr7PoNUgM1Djnb0=;
 b=XnoEo/QJbuMd7cUBSa+WYgytiHrwVGhV+epWmNuvgca+a5BGOrrYia9pkADSVBLX7EKZuQ9UH3V+zzPzfqTDYDT1ygNOsRaL8k4JsZV61iR4GXGOA4juqIyjMfq18EcHTaBeiRb+bIAZJ8U2tKym1dHDr9JPfmF37GdmLzk0eAINhy+8j3mZ6Q5zgmngc57odGtYnlS1zdTNp9j2bDWb8W3uW+v3UfxV7uAPV2JpGaKCLnT3ho2q0nhmhmcNURwPxRnNiNTv8Pum1fOGBkkAGknZP1id+x5RdMp6zK1hSZJI1yKk7f0L2UN7DEPnlKpeVfNW51adbhswVTH5jKYJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 11:00:29 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 11:00:29 +0000
Message-ID: <975072ab-a1fa-4e81-af8a-882e999c416f@intel.com>
Date: Fri, 30 Jan 2026 16:30:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/hwmon: Check temperature limit in
 hwmon-read
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <raag.jadav@intel.com>
References: <20260130103553.1935825-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260130103553.1935825-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CY8PR11MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 820b9f6f-1fa3-451a-27a9-08de5feec7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnFqMkxtbDhFdGhtZGNBWlJJVjJBNUlIZ1phQVRYejZoMjJJSDBRNTdDajNS?=
 =?utf-8?B?UHM0cWNvZ2FKNFREUDJOMk1NZGhXK0NTYmVtWW9PWmY1TkNxMGpxc1pQZHZF?=
 =?utf-8?B?ZFJTbGk2R3l5NzB4dUhqWnZEWG5RWlpOSzRRYktqSllrZm9pcU15TWRLa2tw?=
 =?utf-8?B?aDVZVE9yQWR5VkMxVVlJYnBISGRxSHBmbVcxT3h0TThnUmdOV1VsWURtQ2Z0?=
 =?utf-8?B?TmIzTnlud3pmcFprREVIMXZoZXlLWlVFOFBIQ1F1MEJWVVpjUkVZU3ZYekdr?=
 =?utf-8?B?VVYxQy9SZXlzRTBXbTFlM1dzcVVKc1A1bEZaem9EblQ1eDE2ei80ZkZNV3BT?=
 =?utf-8?B?cVFId2VCWGFUNExma25pM0hPaUR2K0pBaUtuZGx5b0RWcWpnTTQ1VTAwbzVX?=
 =?utf-8?B?VWI4MG90bkx0R3FGTFdlazgwVEN1VkhVc0JhakNvRVFwcFNPeFFQZkZONVFG?=
 =?utf-8?B?RG5XcjNIdWJlam5LbmlCUnhRa0ZaZ2hUak96WnlFd3NRc2ZZaTBHSWpVclhz?=
 =?utf-8?B?Y1hLVlNXUHJ2V1E1emMwKzJsT1lLakU3ODdZR1lwZHBOZk5RNWxZcGdyNUkz?=
 =?utf-8?B?RVZuNUUycXU4QmRMUkh5ckpYcUFmREQyRDZJTDFJKzRYWVNjVVlVWGkrN0Ro?=
 =?utf-8?B?bjkwcm16VjE1ektqbmdvdjZIWlR2TkNKNDgyVllnZjdpbnNReFZTYU1HdGQz?=
 =?utf-8?B?YnFEMDlqQ2RJN3pOUllNT21RWGFiUHVPb0hYc1NEQlNjdktFTjk4Y0ZIOHNO?=
 =?utf-8?B?b1p1cHJMOUJFdCswc3JabUlMNUVvNm5SaVpwMXlyMUtyTTEwVitxZFQ3VnhU?=
 =?utf-8?B?RnRiS0hVbU8zK1piQUdDN0lmZFkyTGx0U0lHVVFrTERpUUxRYkVpb1YveldF?=
 =?utf-8?B?elNaODdZMFZXV05lVjRIZXdMRHdvSnQ4UHBRY1Q3K25BcXFDZlU5cmgreDN2?=
 =?utf-8?B?K1c5WWxQandKejBnN2tQQjNVK2JxbGlmYjhWdC9jdHFjSkwxYlZNRWpjUngx?=
 =?utf-8?B?dW9VaE9SUlNSRk5TeTJRRGhvSWl6dTNKQzZjeE5oTkhLNDUrWDlXb0dEMmY3?=
 =?utf-8?B?VjE4bjg4MHFXb2NuejBocEI4VVI5QURUTlo1TTlmTGtEK0xNRVlvbDI0T1lC?=
 =?utf-8?B?WDhpaTdKTHFnU2lGb1JwOWRXNHBNczNXcUcrNCtxSmY0UWtMdU1SaEdHZ3lP?=
 =?utf-8?B?bWhtb0hQU3Bzc3VFMDlIeTVIbnorVjU5NFB5eGZxWDVZWkp3OUg1WEQwWGdM?=
 =?utf-8?B?eEQ3d1ZSV3Z2TFFXL0pCbTAzWDVCS2I1czZmY0JjallVQkprcU9hR1ViN3Fj?=
 =?utf-8?B?SWkvdDMyRzJEL0Q3SXZDaGw0czJNeGFMdjhvSmRoMHhEem9lbTBFK1hxZmFq?=
 =?utf-8?B?YkMwSGtEdUtZcVFicnFZb2dtYThaR1o0YjI0MzFNaS9TeGxFTWQwTDVtRVEr?=
 =?utf-8?B?RTd0dXhqTHJtWXNkN0VHc3FyQ1RqU1VHczhkdVRSZURwWVEwOGdLdStXTGJL?=
 =?utf-8?B?eFpobWhOWkJMOTU1bUNhVDJUWnc2MGZoZ2QxVFljOUhmem51MjE5bkoza2Z5?=
 =?utf-8?B?b1VNcFQ0bVljWmczRFBzVWZ5bUlGLzcycENGM0ZoSUxuYS9VNm9nOG13N29F?=
 =?utf-8?B?bStXWVpscjM1NXBHLzBSMy9EdzFjelk1MkJPblFyVkN6MytxYlpqbkNib1Fu?=
 =?utf-8?B?VER5OU9wRWFXR0g4alV2SzBvVytwVWRlRUtpdm5oQnUvV3FwRDhBd3BYQm5D?=
 =?utf-8?B?ekZienZsSVpBaTg1WndSK0NNb3plZUNVSkxlM3pLREtVbDk4VTB3TU5Obkh0?=
 =?utf-8?B?WG9NVlY3RFA2MVp3OEc3cmcxcWZjWEg5TzUzUjZuNS9aUE5BQ0RFc05acVlN?=
 =?utf-8?B?OUZuZ2t6V1lnelVCanlFK1MxMlFyNUl3TDBObTRmWXdLdjFGejNYNThxcmd4?=
 =?utf-8?B?eTJTMk1XTVlBRHFlYWxNcEtOZzdVeHNGWlhmT1Y0diswTTR5dzZoaTcvZXhZ?=
 =?utf-8?B?N0c4VjZjL0RzTm1hTlFOVVRLNCtGMTBSd3o0cG1ZSlhlOHBEditOb01kSTRu?=
 =?utf-8?B?YmVMdDdvWVZ4SFZBL0laaTdvU3F0ejlkdlFpQVpwWDVPeVVnMlptaFdHUWsx?=
 =?utf-8?Q?49Jk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T09xZTRKeWh6WEtnNUpnL3hKRzBKUkdmdWhWTUdJZUpvWVRySUw3b2tOK2ds?=
 =?utf-8?B?aHlxb05McldXZGZNNFRVSEErOWhCLy8veWg0RSs0WkJ6a3VOM1pPaEFQUkR4?=
 =?utf-8?B?MnVLeU5TdTgxZ3pESjNxR0RlRy92VXhXL3YvR0hSZWtiemJjUFk0ZjN3Mjk3?=
 =?utf-8?B?ejdNQVhXMG4xOGhvbmhmNHhkbTdaWFhkclp6OEdkeXRkVWovbXBLaEdqRXdU?=
 =?utf-8?B?NWo1Qlo4S0pjSi9UdGVua0kwWFlFZHRWV3lYUE9jbFRPVTlFUHZqWHRsejJO?=
 =?utf-8?B?RWFMVlFqYVVOR05FUjU5eW1VQStCblp3K2ExMGpVN00welk0dS9qamJNZERB?=
 =?utf-8?B?VnNhZlY1U2FIcE0zZWVRRDNkeWsxREVWVXN4N3cxVG5wbk1kaWhqcFI2eVJJ?=
 =?utf-8?B?L3c3dWE3QXhuc1NEdHR4a2kzYTF2d2oyRzBiS09GcmlaVUJINXc0VHBKSWFh?=
 =?utf-8?B?K0N1Y0NOL09tcG1lWFgydXBWWldZelBRcUl1Um9UNkpJSGFJbXdrY1VNQklh?=
 =?utf-8?B?TDZpSGdVVGV4VHdMMnlESDYrSGgrVTUwU2NFM3dVVDNydHJjOEFtNHBldlVR?=
 =?utf-8?B?YU1vOVk5NDBUVUdkeTU2QVFyZ1BqcVNWcExQdFJCSkNvU1VNM05GOWt0RUdx?=
 =?utf-8?B?NitNY3NsY1JYZFo2OTlGeE80c1psZFVqWnpjSFJUb3pDRzRSTWtIRmZCWDBO?=
 =?utf-8?B?dUdUTGYxZmdvK3lPWjJHQmt4MitGdUhUb25JSU9EK3A5QkhkOGZsK2JCQTRQ?=
 =?utf-8?B?MnA2NFduR0dMc1hCYVQyQmExVlpQK2F6WXI0T3A1STFNV1RDcWdyZzdBUmcz?=
 =?utf-8?B?cjRBY29jWU8xR2VWWHhMVjRwQjAzaU02dEVac2VIbjIxQVpCcVJSTE9PUUIr?=
 =?utf-8?B?WWlEMkNTdGZEcW15aTZBUk5EM1BJM2RNVlNqcjc2Y2JleXVnK0lPYmxzV0Vh?=
 =?utf-8?B?cTRoYWthbmdSUFljeHk0a3JRZ1RJNUVsdnBNc1R1ZFZ0cnNGMlZHWW5yYXd6?=
 =?utf-8?B?MlRQeVd1U2hzT0tEWlZtZmpXamhqV2I5b1FSTmQ2aTJ6dmhMSG0ybVIyWjg4?=
 =?utf-8?B?V1ZXWDkreDJSeEcyMURFRXdzSDl6ZVpSNlJRWmRkUklJSDVWelFLN0cwb2Q2?=
 =?utf-8?B?YVBFVWNud0JlK1RBWjUwWmdZNm9iR2JudkJPa2Z0c1c2c3NKQlJzYVlvNDZM?=
 =?utf-8?B?eVlMREFmUSsrVlYyaGZiM1NUOEN5UEJnVVp4OTI5V0RkVHBvYmp5N1RJSkpi?=
 =?utf-8?B?OXpBL25HZHUwUUk4MStXK3VMdmhVTW9rY2RPTmtOcEN3OGtFeUdEWnA5TmQ0?=
 =?utf-8?B?c3lnSDMzRm04VkFUNVBqNHp6NWtqa0pqcEFoTnVaaGVYd1VMMkdUcGFUbCtH?=
 =?utf-8?B?M0d5YVdla01jN1h2VjVMcWRxdHBBN0hrc1Evcm5DV3ZNaFpteS8xeVNDOER5?=
 =?utf-8?B?d2dESEpKZ2tQR1RNY0FSNHMxVFgzdE56ZjVBN2MvRU5TcWdUV0loMktFOEp1?=
 =?utf-8?B?QUVmcFBKc21kUG55eHN2WHNBYnlWUVR5UFdBNG04czBBWEFjcEtRUTBadjQv?=
 =?utf-8?B?SkQ4a3dJRk9iSlMrS2pzcElhNkc1WVZMZUNXOW9sM1ZJaTBLVTlZYjlTZytC?=
 =?utf-8?B?YUdHYXFNd281UEpyUlJ4WVg2VFJuUGx4ZnRKR3RoaC9YSlc2UU5BZjdpNmxU?=
 =?utf-8?B?Q2lhVmZ4UXgrVmc5R1NUVzdFSzA3ejhvSElYTDFQQTRlRmR4UGh5NzMrTTBJ?=
 =?utf-8?B?dG14QjN6QzBuc2VKSWZOVW9PNDhERm1NZU5QNkcyMFJPNVBoc1UvM3N3R3pO?=
 =?utf-8?B?bFUvTmtueFAxV1JHMnBlS09id0dVb0cvQkw5VUIwQ1ZtS1V2ZmVtS0J2Q3B5?=
 =?utf-8?B?OWNueVYrUFF3S3RuRVcrQlhrVThOaWJGMDJFMnp4TWJEcnY2NVJmaUNUckRq?=
 =?utf-8?B?UTBOeVFLaFQ0UVhhVGptM1kyZjQwdGNUcDQxOVJFcHR3VmxFeDFINUpCOEdi?=
 =?utf-8?B?Qm5XV2RvQWNZSEgwc3NUUU1ZUjJ3OEFFMzVUcUE5aGxkNkhVMGhLMFdlL25j?=
 =?utf-8?B?VnhwV3A5VUkwMElReU9yUUxsK3ZTS05tbUxUSDJ3UkZHVzIxdXdCMmFCVDNO?=
 =?utf-8?B?MFAzNUxzWEtuOWlyWDFJeEttV21xeXRwMUFkNitrSjZaMWdhemVMcWpSajVN?=
 =?utf-8?B?SjZETDVmSVFLTUJFUGQvT0t4Z2dUSk42WVJkeCtBaFlqL3RGQjB4VnUzWGRN?=
 =?utf-8?B?cW9xLzFqS0FzZU9GM20wWFFvNDlIN1JkT1d5ZWt3VWlVN2Q1cU43dFZ2K0Iy?=
 =?utf-8?B?TzlHUDlNUy9DTVVZc21SZ2dQNVBwbUhXY3Jqc054ZmJGOEtNL1NuTTZGdDZi?=
 =?utf-8?Q?GiRQ57wgf7HrcJ+Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 820b9f6f-1fa3-451a-27a9-08de5feec7bc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:00:29.5400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ulw9J2qpacSiOMEKWgzJ5BvtKCPkMnvWONI8vBvai3UJmC/4vwwMhWpvnAIay4wGVMh2v/lX2Z5PEgUgpUdMN3WJ+rcDwZjUBfWs635ofA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7828
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


On 30-01-2026 04:05 pm, Karthik Poosa wrote:
> Improve hwmon-read test to check if current temperature
> is above critical temperature limit in hwmon-read test.
> This will help identify any thermal issues with the
> setups during test runs.
>
> v2:
>   - Address review comments. (Mallesh)
>   - Call check_if_temp_valid() only for temperature hwmon entries.
>
> v3:
>   - Correct the API name check_if_temp_valid() referenced
>     in the v2 commit message. (Mallesh)
>   - Use int32_t for temperature values in check_if_temp_valid().
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

LGTM
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Thanks,

-/Mallesh

> ---
>   tests/intel/intel_hwmon.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
> index 103ae69cd..f185c1ca3 100644
> --- a/tests/intel/intel_hwmon.c
> +++ b/tests/intel/intel_hwmon.c
> @@ -26,6 +26,27 @@
>   
>   IGT_TEST_DESCRIPTION("Tests for intel hwmon");
>   
> +static void check_if_temp_valid(int hwm, char *sysfs_name)
> +{
> +	int32_t cur_temp = 0, limit = 0;
> +	char str[32] = {0};
> +	uint8_t ch = 0;
> +
> +	/* Get the channel number and sysfs entry suffix. */
> +	igt_assert(sscanf(sysfs_name, "temp%hhu_%s", &ch, str) == 2);
> +
> +	/* If entry is tempX_input, check if it exceeds tempX_crit. */
> +	if (!strncmp("input", str, 5)) {
> +		sprintf(str, "temp%hhu_crit", ch);
> +		if (!faccessat(hwm, str, R_OK, 0)) {
> +			igt_assert_lt(0, igt_sysfs_scanf(hwm, sysfs_name, "%d", &cur_temp));
> +			igt_assert_lt(0, igt_sysfs_scanf(hwm, str, "%d", &limit));
> +			igt_debug("current temp = %d limit = %d\n", cur_temp, limit);
> +			igt_assert_f(cur_temp <= limit, "current temperature exceeds limit!\n");
> +		}
> +	}
> +}
> +
>   static void hwmon_read(int hwm)
>   {
>   	struct dirent *de;
> @@ -43,6 +64,9 @@ static void hwmon_read(int hwm)
>   		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
>   		igt_debug("'%s': %s\n", de->d_name, val);
>   
> +		if (!strncmp(de->d_name, "temp", 4))
> +			check_if_temp_valid(hwm, de->d_name);
> +
>   	}
>   	closedir(dir);
>   }
