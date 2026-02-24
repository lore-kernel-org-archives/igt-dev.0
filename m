Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72397E9B24D
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 10:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238D810E23C;
	Tue, 24 Feb 2026 10:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIYwleZa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9174F10E53D
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771929033; x=1803465033;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=r++WHIScuSVeVd4KWb01V2FL/RwNiLYhm5YdpY4FuoM=;
 b=aIYwleZaHZXTwxElBgvRJI71aIa14BTY+qwvM9o5aDilaUwMYqwTpxwO
 toSEr2rNG0HQHbgZBITBM45ch4N/324U9UcieWTuG5Eujcy1r+csfJAgT
 Juz2YA562blNmdg/zdMP28iEm6Pdh9o3YuUHvQHoVdwcyugJwf5Jhjope
 tNVvnuSSaGepooJ9ryh2+TIqM3/1xCJGOX/VdzJs+eitmir/dXbUFh7A2
 mllH6QzKLV+1vDazMk9QIyiYUj8WWVhUB2w3xwkJhFUgTufrZFaBM2rn/
 NBMNwBPRtJLnhmw7iW8WlUoaEICJL1s6AFY3qrs3Ky9nDrq37VH042Gps Q==;
X-CSE-ConnectionGUID: 52yDIMDRT8mrtlYXlMp9ng==
X-CSE-MsgGUID: 13QP5LIuRI6COBHPE8wksQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73046400"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208,217";a="73046400"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:30:33 -0800
X-CSE-ConnectionGUID: Yjga+1n4SheaH+6PPJqP9Q==
X-CSE-MsgGUID: cusENx8sQrKpaKbdlbQeVg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:30:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 02:30:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 02:30:32 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 02:30:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZgK2xSXcltfveGJn1yMU1afxmNFa8f2CRMa3XgWjAvu5AT9kD4Sr5EZ2G/Bq+XdAu/u8sdtUPQAL6EO/CtohV72I1byvSv+lbwfPJfpvqPvcxNaGj2OhYgRgoGq/hHk0fGKvy8FC21zbMZoGEDUPcO+K8CZX0C2qdpuRob7Dwg9mUfJnmni/Ou0OXrTuY+eqRvYIXLuUMg1eaXWufeE8NYbagznUsVpWJETn7NbEArTlLYVhPwz3Vsg8gYlnnB1nqynz1+MZgkkHPTTfXuSnivONTvEIpeUO3ZOlubdXlR8FjruHG0eHddzZZaPwOMfVo9Y2ublvO5ZvtHJDQR8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJrBBSLXu4Nyby+G23CY7PHF1WMmE69kMVTYqmoGhmM=;
 b=EYs+/K0vFkyYc3UWQEWqPKrWjNQ4jEfOxi5MBESq2lIQPRjdAQrF0VjjtKsi9yBrm8HIW6NtE3zrc8fIRBX5aamG8UOVV5Y7X+VgcaLqOuZUYAWgmjLxMmhBlsjx9yIJC/sUpdX00qwrHyDGWGVild2pUzIgKPRBEzFlOKlLYab/d41azNhbxHk0uO8R90DCu23hHqqjzE3TKCqgShx8+DZycQpl33CIL6vjd+1O2G5pBIiGLNmM43XNPGwVoDnXRTP5WMxCY5NxpPvXIkc7bBNOTBq57Y9OyUazjp5WISGH+Zx50PMlTUK+VtxnzLiOBxCQFSSD+opsUo51u260hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by IA1PR11MB6465.namprd11.prod.outlook.com (2603:10b6:208:3a7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 10:30:30 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 10:30:30 +0000
Content-Type: multipart/alternative;
 boundary="------------oCPSa7F2n3TxNmnuvNWrmsSj"
Message-ID: <baf8920f-d3fd-43df-9877-14625006d254@intel.com>
Date: Tue, 24 Feb 2026 16:00:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kms: Fix max_non_joiner_mode_found
Content-Language: en-GB
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260220152239.276034-1-kunal1.joshi@intel.com>
 <20260220152239.276034-3-kunal1.joshi@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260220152239.276034-3-kunal1.joshi@intel.com>
X-ClientProxiedBy: MA5PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::14) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|IA1PR11MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3302b5-ba75-4932-48d7-08de738fbbdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3FOV0RxV1oyeHdxNGVoQXplcGliMk5WQjVzQjNmZTc0VGhyMWh6N0dFWXRt?=
 =?utf-8?B?cExjeWJyQzVpdjR2cUprZmRxdkNEakJ0enZFNmpGODZueVFnK09uMnoxYVMz?=
 =?utf-8?B?aUxQK0ZFU2tVNDhOYm1EUWMzUjRLMmhaRHdIcGdKcVo2MzMxNDhqcDJqYXBE?=
 =?utf-8?B?SndjclhaK1VQNE5xUHdKRC9qVm5YenltS2JsZUducFRESjU5V1dCRFZCM3dI?=
 =?utf-8?B?amtHSmNJU0hEbThHTDh0Zi9ZMzRQNTJHRXp1Ymtlb0Z5Y3J6ZjBUREdacGZ3?=
 =?utf-8?B?dGdDdUQ1U2NiSDJlZnlIbGhVNDNYY1VaZlhBanBGZ29UdW54K0tEbnV5ajBu?=
 =?utf-8?B?TWxibjFza2hWL2g0M2dqNSs5YXBZSkdab1Nnc20yYjlIVGpSRHRNc0J4cVFS?=
 =?utf-8?B?UnR5QXF4Wkx3bmZyVkpMUlUxZXVLaWU1aXQ5U2J5SDRxUGxMYXlEZ1ErVU9Q?=
 =?utf-8?B?TE1ZYmFMNmUreEJhVVFTNE9sRWt0ZFRvSUVaZHhNNm1DQVpabnd6TUJsVkVr?=
 =?utf-8?B?MDQ2U2MyMFlSaWVzOUJod3dDaUpmOWREa0tHeDBVemFmR1YzeDhJcENENGtE?=
 =?utf-8?B?d3lkSVB5OGJNcGpGYWU4WmQ4S3N3Yy9PVFJCZUNzbUdxUWgzeUhxZkR2VU1a?=
 =?utf-8?B?cENtRUFtSTdZUk5CSVlidi8yVG5nbURwdjRDcE0yYm5BNjNXamNzTllVSkVx?=
 =?utf-8?B?TWZIYm5CTTNDdkpadmorYnk1UDkycVhXVlhTNEowOGFVYW10WTB2M3F3WCs4?=
 =?utf-8?B?T3hWTjVKMXEwRHNwNXpOS2NiQ1BUNk1xdEhEckxxRzVyVFRRUDBHNWN6MHAz?=
 =?utf-8?B?dzJuOVdnSUh6bTNDODRQQ2Q4TDl5bU8rWEVWb3FvWjU0dnFQZ1prdTIzVis1?=
 =?utf-8?B?QTNSNEVzeENFQ1FhUUZYZmQ3RWRxUzNmY3ZPRFZ3bVZPRjdvUGhQNkx0NGpY?=
 =?utf-8?B?RUFuNmdaRVpYdzRLNkN4eWRNL0dLNHVmTllOQjlDZWJDWG5OV0dPYk9LOGh5?=
 =?utf-8?B?RVZjVDNxTVlqT3M5SVJQaWFGaDBiNmV6WXN6ZGxJTHZ0RVEySlgxaHNLUHJz?=
 =?utf-8?B?Y3JPaGZ3T0R5NGJtL2NPK1pmeW1GVjdWTU1UT2swYXFxYzhsRHVRdTRHM0JJ?=
 =?utf-8?B?S2NPcVNWMER1cE1FR0trREJ0a2p4cWNkSjhuQXd6aGtDTk5hUlJYODBUUmkr?=
 =?utf-8?B?MmZ0OEl2a1p2UU5RQVpicDNuWmkxY0pPMjVWSlBiUllITFRoNU0yOHlreHZh?=
 =?utf-8?B?cFlrZGlpbm12VjRCY28xQ0xjRG9OWjd3VXJudmQ4ZHUyV3BVSlA0N1Y4TWFP?=
 =?utf-8?B?cVNIYWdkKzk1dEpQNmtQTlA0QzBTZm1JTlpPekhlRWY0b0pxN0pFQTh5MzFQ?=
 =?utf-8?B?YmpNa1YwQUE0VnZzc1NrdHVTSUh1Q0kvdW9RZXAremhkSTV0eE80R3JwalY2?=
 =?utf-8?B?ZTJ1OTRJdlV0dXV5am5OS0MxY0ZqczRWUGxUd0hZbFVDQ2hnK2k3UGMweTR5?=
 =?utf-8?B?VmZ5SUtiSmQrZjFmVFlOcEtWRlVJQTl6MnM2TzFlcWI4alZpdVNhVS82NHIw?=
 =?utf-8?B?dERsS0xTdlZvY1Q1UU9NMm1yUEZWRldMK09YS1BqR0ZEb1pSQXhEWm1jS0h4?=
 =?utf-8?B?S2duNHNmb1hlb2FJMG8yQmQ4Z2huY2Y2a0E0MHIxRXV2MVhMeG5XeFRXZmRn?=
 =?utf-8?B?S1lVYlhHUWNQS0JRV3BndS9Gc04ya2xPaDNhTXJvRjZKOVVTY0wrV3Q1bjFy?=
 =?utf-8?B?THhLQW1oQVd3WWM3d3J6S3ZuTm9NcTNmTWRIRjVqS1p4c29ySFhnbnoxREoy?=
 =?utf-8?B?cFUvU1RBZDJyZFdKZ2s5cUpRNDREM0V5UWlWKyttbm1PMGhMVnRUM1FHMVFL?=
 =?utf-8?B?bld3aW1WUjNJTlhCNGRuTGJoQ0doRHZXZlBNb2REREt3Qk5nSC9lVDdRYnZq?=
 =?utf-8?B?L1F2Ny9ndUl2bW9wQUl0dVdZSlhRLzYrbWViKzNZVmdkTzFGa0QvdDFQR1Z4?=
 =?utf-8?B?LzdLMUIrdmtJNUJJclRZK2ZKNmZSTW5DWXhaWm1Xc1NRL3R6UjkrOVRveTZy?=
 =?utf-8?B?Mll4WHhHdWRaNkRZTFB6NEpkRFdjUyt1SS9wZ1hzR2t6YkpKQlRZYXVMdjND?=
 =?utf-8?Q?8VB0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXc4OUtjWkRSODQ0RVkzaWtLUVJYb0M4cEdTRmRQbTBWOE42U3FXTmt3WUFP?=
 =?utf-8?B?Z1FXbDM2Vk4yeFgyWWw3M09JUXpzUDd0UDRSeC84VC90a1NvcFg1aDhMZ1U4?=
 =?utf-8?B?cHZMRzNQUUh6UUFGVzY5Y0kxdkVrTGIydCt4OG8wTEdIaDFyRzRxNXd6YTBY?=
 =?utf-8?B?bjBVSk9DdGxQK1FjL1VsdGswd3VsMFBOY0p1MFh3YldvdzhqWWM0Z3NpKzMv?=
 =?utf-8?B?UVg3ejBpMUgzRGVnU0FYU0laYi9RbnFsQk4vSnRJY3hBZnJVTlJmc20ramhw?=
 =?utf-8?B?Si83V0Q3cUU1bWMza0RlZkhvTU5DVDB3YVJJc3ZqL2pVQnVsUGVWVU54aXps?=
 =?utf-8?B?NUU0ZHZ4eG01NUJZci9aYkl4citPdWlKL3IvdzZqR1ZNaVJxNXQ4ZmtTVHIx?=
 =?utf-8?B?NjZxRFdTbWQxVWdHbHFubWRXUU5aZVRxRG9GQ1ZYRTlhaXB4UE9pcFJNQ3Nu?=
 =?utf-8?B?cjRiaDJOK2pERlRFTC9xdkFYK242VXF6YzRYdnJyQTZoZFpJMThkTklTM2or?=
 =?utf-8?B?cDNaZHNRcnpMK21sd1hCTEV4VzU0ZzVMYTJHOG0zcVFZYWtnVUEzQzZjWGNE?=
 =?utf-8?B?NGVOYURJMlNad2N4ZW15cWRNenBIL05SeTUvTG9aNWlmY2JXUHIveXh5dlQ1?=
 =?utf-8?B?TDBIeERqdms4bzVaQ3hNblh0RjJxeGpMa3RoOVNPYUNmdUJxNVE5K0pqbXEx?=
 =?utf-8?B?ZTV3cnM3N29zaXNSaTRXa3RTZ0V3WDVkaHpqWEpuU2ZGUHp1N0FaSkN3UWt5?=
 =?utf-8?B?c3luTGxjWm5Ua0N3VWdFWnNhT2xRaktHU21CQnkrTm1WUklvRlpaR0NHQ29C?=
 =?utf-8?B?dTA1U2hxMExoalE1anRLMUpJVEcwT1hpeXlaQTBHdjZzWjM2M0hVYkwyRHJT?=
 =?utf-8?B?dGZtd3B6OG91d2FUVGZHeGlra1AwdjgyNkZLZ2N3MnIrS2VacHVOdW1qRXh4?=
 =?utf-8?B?L1dOUWR0R1hrbTRQeHJmSjR2L2JhUnZhMnUwcnB5UGowT05seURmZWRIWDJD?=
 =?utf-8?B?Zkh0dTZjejBSUm1WaHVjdURvRFplMCtSeUxMOGwwNzNmdzcvVmloUmRYMllI?=
 =?utf-8?B?b0RFWTcxK05hS0xsRFNaMFp5RGpjSXNGc1lOQytHaDE4YXk5MWJ6SDliUzJ2?=
 =?utf-8?B?UVhodDlEcEdNNXdSbDJLTThqNTV6cVZBcmt3V3E4VzVwbmtldXFyWVRDa05t?=
 =?utf-8?B?UlNScXU5bGt5MC9WaCtZclljSkFmcU9QSUZqYTIzaFVkRnRzc25wUXQwdTNL?=
 =?utf-8?B?alR2amIxMWJKOGd2Sm1LREdnVHJmMmdsVzcraWgxTWhXZ2FTTzBVQ2FIa29m?=
 =?utf-8?B?USthUG1kYlVUd3NHd0xoMVBIb2cxYXhZdGh0N2R3SU1DK1BxdDJSYWJnenJ4?=
 =?utf-8?B?RXVoQ1VkZWc1RDRkNWVoYU1HYkhZeGR1bXZvNit5SjcrMHl2WVduR1JQUzNI?=
 =?utf-8?B?QXhsWmJvY1NOczg3TG11VzlGZjk4MVJ6RlZQMlR0dmZZYTBVdlVwckFEaFho?=
 =?utf-8?B?U3pncWFEeGpZSnJlV1FOZGtudzFNZmxTYllJY3Z2WlhkNnVSSzV4Y0pjd3Mw?=
 =?utf-8?B?YURTSkJLYlYzQnNybjZYc2RkV29EcXQ0c3Q1Z3NORDJOeThKZzNvcFdydnow?=
 =?utf-8?B?czZpeVNSOVYzUE9LWWlTeWtZL0N5UnZjWUtDZUV0QWxBdmUvSS9NWFphK1hu?=
 =?utf-8?B?dXhoT2pOa0lNRVBNd1pDRTJVbWhsdEordnV2Qk1aOExnNlNaWlZ0U3BHSnB5?=
 =?utf-8?B?MVcxZXA1bGpHWng1dnc4QkpiRTNVVmN4RTNuVER6SWRTOGtCMkdPTWhoS2ky?=
 =?utf-8?B?SENQLzJpVWhXUUthYkxSeEpuK0ZFdmFzRWQyRVoyeUcxaFR5eUJuRmxKMHRv?=
 =?utf-8?B?d0hpQnBlKzBpNm5aTXJpQ1FVeXhGYTdSUUxycWVidDUxYzFjOFdrQTQxNjgr?=
 =?utf-8?B?S1BlSWJtVDdJd2pLc1Q4a21Ta1VqSlNISGJNam1aQUlJMnFSMmdFTCtiZlpS?=
 =?utf-8?B?QTRRd1BjN2tXVVRSVFlHbGZ2WElHNGk1K2pNWk9UVWxralpPVC8yUGZtM1Rk?=
 =?utf-8?B?QnhrWWxhKy9aNnhENXZ6WDhBQ0VuVTB5MVlYMVIvOC9zUVpXRU9FcUdxTC9T?=
 =?utf-8?B?bjRvNVdRN1VYcE9CWWY2aGxmZDhQd3lvQVhkQkx4VzdmMGs4S2pobjhLTHl6?=
 =?utf-8?B?MmkzYnhaYzVOWjBIT3piM3BMZkZobHJwSVY5cmZDd01kb3JWa3hVOXFSbHIz?=
 =?utf-8?B?UlZGdnBhSkpLRXFIdEdENktVRDkycEtsSCtXU3A4N2FudnV0b1htVUVMWkND?=
 =?utf-8?B?Z0dySGlKQXhZNHNGSWR1aFpMWFNPcW93b3BlWmRCdFI5ZVVLMWZacUovWTFs?=
 =?utf-8?Q?7qLRcrMl/ZJKvKTY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3302b5-ba75-4932-48d7-08de738fbbdd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:30:30.6427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ql3JIXdeAAdvSAW294MvMOxoc94SC9eqU0NzFVM6YLKeCaHo2RbbZbiDAio1+ok6uPxcgDoU/QvYA4h61xwn4bjX/yq4T9VXVo5GYLR8cgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6465
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

--------------oCPSa7F2n3TxNmnuvNWrmsSj
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 20-02-2026 08:52 pm, Kunal Joshi wrote:
> The function previously required hdisplay == max_pipe_hdisplay (5120 on
> pre-Gen30), which means it returned false for any connector whose maximum
> resolution is below the pipe limit (e.g. a 4K MST output on a 5K-capable
> platform).
>
> Fix this by iterating all modes and tracking the best one (highest
> hdisplay, then highest clock as a tiebreaker) that does not require a
> big joiner, as determined by igt_bigjoiner_possible(). This correctly
> handles connectors with any max resolution.
>
> Fixes: 3830ca6a5068 ("lib/igt_kms: Add support to check joiner mode limit")
> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>

  LGTM:

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>


> ---
>   lib/igt_kms.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5c4879604..c6678b02b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6904,19 +6904,24 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			   int max_dotclock, drmModeModeInfo *mode)
>   {
> -	int max_hdisplay = get_max_pipe_hdisplay(drm_fd);
> +	bool found = false;
>   
>   	for (int i = 0; i < connector->count_modes; i++) {
>   		drmModeModeInfo *current_mode = &connector->modes[i];
>   
> -		if (current_mode->hdisplay == max_hdisplay &&
> -		    current_mode->clock < max_dotclock) {
> +		if (igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock))
> +			continue;
> +
> +		if (!found ||
> +		    current_mode->hdisplay > mode->hdisplay ||
> +		    (current_mode->hdisplay == mode->hdisplay &&
> +		     current_mode->clock > mode->clock)) {
>   			*mode = *current_mode;
> -			return true;
> +			found = true;
>   		}
>   	}
>   
> -	return false;
> +	return found;
>   }
>   
>   /* TODO: Move these lib functions to the joiner-specific library file
--------------oCPSa7F2n3TxNmnuvNWrmsSj
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-02-2026 08:52 pm, Kunal Joshi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260220152239.276034-3-kunal1.joshi@intel.com">
      <pre wrap="" class="moz-quote-pre">The function previously required hdisplay == max_pipe_hdisplay (5120 on
pre-Gen30), which means it returned false for any connector whose maximum
resolution is below the pipe limit (e.g. a 4K MST output on a 5K-capable
platform).

Fix this by iterating all modes and tracking the best one (highest
hdisplay, then highest clock as a tiebreaker) that does not require a
big joiner, as determined by igt_bigjoiner_possible(). This correctly
handles connectors with any max resolution.

Fixes: 3830ca6a5068 (&quot;lib/igt_kms: Add support to check joiner mode limit&quot;)
Signed-off-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a></pre>
    </blockquote>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;}
</style>
<![endif]-->
    <p class="MsoNormal"><span style="">&nbsp;LGTM:
      </span></p>
    <p class="MsoPlainText">Reviewed-by: Mohammed Thasleem &lt;<a href="mailto:mohammed.thasleem@intel.com" class="moz-txt-link-freetext">mohammed.thasleem@intel.com</a>&gt;</p>
    <br>
    <blockquote type="cite" cite="mid:20260220152239.276034-3-kunal1.joshi@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 lib/igt_kms.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5c4879604..c6678b02b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6904,19 +6904,24 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
 			   int max_dotclock, drmModeModeInfo *mode)
 {
-	int max_hdisplay = get_max_pipe_hdisplay(drm_fd);
+	bool found = false;
 
 	for (int i = 0; i &lt; connector-&gt;count_modes; i++) {
 		drmModeModeInfo *current_mode = &amp;connector-&gt;modes[i];
 
-		if (current_mode-&gt;hdisplay == max_hdisplay &amp;&amp;
-		    current_mode-&gt;clock &lt; max_dotclock) {
+		if (igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock))
+			continue;
+
+		if (!found ||
+		    current_mode-&gt;hdisplay &gt; mode-&gt;hdisplay ||
+		    (current_mode-&gt;hdisplay == mode-&gt;hdisplay &amp;&amp;
+		     current_mode-&gt;clock &gt; mode-&gt;clock)) {
 			*mode = *current_mode;
-			return true;
+			found = true;
 		}
 	}
 
-	return false;
+	return found;
 }
 
 /* TODO: Move these lib functions to the joiner-specific library file
</pre>
    </blockquote>
  </body>
</html>

--------------oCPSa7F2n3TxNmnuvNWrmsSj--
