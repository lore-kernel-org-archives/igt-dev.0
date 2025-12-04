Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521B5D2A532
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 20:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E50B10E089;
	Thu,  4 Dec 2025 20:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXvA9Cna";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5682110E089
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764881894; x=1796417894;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2E8jwotXsOek5HBqpRkZdKRXuP7XWJrynV7WcXkQ5iY=;
 b=OXvA9CnaNSutMVGU4XbwHaZ1816T7GxTmxvyA+Yfa5RcHzVTc9z8fgBX
 K/ZlJ+ek032SeLnRNSg0bZEO851tGwnsLTe06zUoGmVYx+9pF7/1wUxx6
 0c37lzFOp3tieKDB5hVoCNOxGRui9l4+drwGh1UsSlEjERjwvfUfqu8q7
 vaGIanWb9ify6+DQ5GUuBTPUpOr5BpocdCFkxeHQmdb9JSLS5ejpul+Vk
 RqjDasWvU8O3c9s/AEJ7qIl7uhGdoEjtAwFdeZvK5CgGrrhlCtxyOZ2Zf
 ebeDdH/Bu/Y20ar8fog3JhaUpJ/g53188Z4MdNK3R7oj3FR7trUf2H+0x A==;
X-CSE-ConnectionGUID: /OaxOgKDRGOCL+v8CUicCA==
X-CSE-MsgGUID: w4sqC/RBSPqNJx9IpB6Fpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="69511556"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="69511556"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:58:14 -0800
X-CSE-ConnectionGUID: 6Rg2PisJSt6ELjJn1zIEfQ==
X-CSE-MsgGUID: TexDEgn1Tc+wLKIr5aYpaA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:58:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:58:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 12:58:13 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:58:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djM9mW9VB9dP6qw7CLeLvbAwKPlAvRJnQrnsCpAx9pzkslhdty6SaRT1ilCEtY8iztkrPtNfqRs2VtBpZFRCpAkjxxliAQ+uMPfqLmY/PpsT88ZS9Dhro+XIRSDYWCsJR9y7Voq1fsFK+YWQppF4bf+HPkmzNBpgLBUyTs91LwzcPJTnQW1/zVJk3PT7ntMX84dO4VCsG9SuNDNqxzhBJVme+C8D+61gKA56o5GXnIRbylZrtcLbYd9P9Zd72Sk6cDBsql7uCw3vBp36q+yrgEp2YSUMKK6OR/3+hWspdxGp39fG5gwz+OM7UfirL3mpGnIKPZ9QIuVbPfAAt7CbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfHD+7urKNWLUzYqwcKk861d2R2ENNBGM7H2qtbf8rw=;
 b=gzhZQ1qOLg1ikA4ve0s+aDLh0R91n5saNNFRfelL63eiZ0vSUzyLC11X1uFzvWNBa27cHnKYPNBK3LZhMocmyWQ2F7+O/C6w0mlHt1dhWnaoN/R3qlYV1m+6yDxWe7EFMxuavF1pYq7TCLTBFL8xXrz3YEsqu5edBfQnes8ygi+CS4mHulB9l8QOSXWBdwn6bn7fj7jyUjouwnuYauofudjm1oM3Qjsolug/s9T5HCyKqsY23saD8xa3aGMoKLMfVRAarhnb78DHa8ppDLScayBLoEMnaXRA8AR9Fs/R1CUyCeFJ6RS2/8zuh/jpLnSIGIVkeqNa+RuNuOa6Uf4Kgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 20:58:09 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 20:58:08 +0000
Date: Thu, 4 Dec 2025 12:58:05 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 01/19] drm-uapi/xe: Sync with Multi-Queue uapi
Message-ID: <aTH13bX0hd9pvGZe@nvishwa1-desk>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-22-niranjana.vishwanathapura@intel.com>
 <a82e101a4dc3c5760195ce3b851c0fb82e24c3bd.camel@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a82e101a4dc3c5760195ce3b851c0fb82e24c3bd.camel@intel.com>
X-ClientProxiedBy: DS7PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::30) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CY8PR11MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 2297bc0e-9f45-43d1-b81a-08de3377d3ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUE1b1VwdmNNaDZUT1ZGcXFmd0pSNS84MFR3OTBZem93czNEZDRpMU5WVnBh?=
 =?utf-8?B?c1pLK1pVL0lJNGJpYjRrakdpS2J4eDlMbEFObkRSVzZ0YzVFSlhYcDV2QVQ3?=
 =?utf-8?B?RlpHRFNaRS9DRVhZQ2hQT3oyOWRJMSswbmV1QTB3S2UzSmNaMU00S1d6ZzFW?=
 =?utf-8?B?ZDQrVWhjajN1NW9KTXNrZU1CYzhLYVFMZzhHTTArNE9QT1NFZUlkaVBobmYr?=
 =?utf-8?B?QlZXUzZWNC9KMDB1NTE2aUorWDFpdlcxVklYQ1B5UUxIeGJxa00rZHNYa2NH?=
 =?utf-8?B?NEpzczMwaDAyT0hLUVpUendMVVB4cndQajZoNFYvaFl4SG80UlJHdGh0Q283?=
 =?utf-8?B?RWdpSEh2ZnFKaStPY1V6TmIyVTdLSEI1UmJGRFVtRFRZVUlYbk94K0YxRDJI?=
 =?utf-8?B?UEZld0x0RHYrekZnSThnNkxoSU9BRmRKUGd2VC96OE9tbHB2YVRkZ0luUzNP?=
 =?utf-8?B?OS9mYkhjK2xwNmlyaTdYVExOaTYydFRZVWFudzQ2OFFyYlBaVkNrNDNEZjBq?=
 =?utf-8?B?RmtzUWROa3BVeU9sN2xxbHlrbHhSZ3NkVENySDRYaENFeERJa0U3R3c5a0Uv?=
 =?utf-8?B?cUxiTGxPMWE4RXpCN2NsdDY4SFNsMVorU1Axb1h1ZlRCanNMaUt2ZUtXd0Jh?=
 =?utf-8?B?MkxZbHU5OE8xN0JVTEFTUUlZRk9OT0kxNll3czRxMHhMUklNdk05R3FUM00v?=
 =?utf-8?B?NjhQcmQrY2tVWE5FeTlUVjlLa0JEelJnMkRUQWJ2OHdyYlRuQ1NOUU5Calc3?=
 =?utf-8?B?SWZRK0dzaEY2N1cyVzdsU0ZPV1YyM1BXSjh1TllEQnhoSXpUTEQxNDMzL1lJ?=
 =?utf-8?B?UE90THp1M2d6bG41L2RPZksxZC9FYWpMaWt0S3lQM0NuaHMvcUhGUGFqdDJv?=
 =?utf-8?B?WTVMS2JyWEY1TUM5cVhwRDY0aWpCU3lZSmJ3bFhiZ2Z6RjltbUtUNUk2Y3Zn?=
 =?utf-8?B?blAreXlMeEJlRHRKbnVmVVhvSFJrRzR4cmZDTWY0dWxuMy9mK0JvNFVEdWdD?=
 =?utf-8?B?eUk2MVVhOUZsdW1STmJaTnNnMlo4K3ZYNFR3OUxwMmVTNnFEc3RoYWxXU001?=
 =?utf-8?B?TW95RG1tT0NjdDRVdThiWUVTLy9PNmgyS01pY0JzUW5BV1hXakdxLzE5WkdL?=
 =?utf-8?B?SWl4eDdXay8xUkVvSmZWY3RkdEw4UW1DclZ3N29BbnplMW5vQWU2eUxqUjYy?=
 =?utf-8?B?SnhQTXBVTmdFWEk4Ty9KaDc0Rlk2cndydS8vYy9LM2dhMjcwKytHeE1EcU1k?=
 =?utf-8?B?cmRjY1hlaXV4VytWbDJGWkEzTGNmcTJkVWJoS1JyUE5KRXdwZkJpUVNQU2Vs?=
 =?utf-8?B?US9UTXc1ZkVqRXVKVjFzQUcydTYxTlhycG85aWcvaTBsZ3dLNDN3WThvb3lM?=
 =?utf-8?B?UkZSMEM2OVFFUjZoeS85bkllTUFwbCsrNG9GMTgxN2FhY1VvQWo2dXloQlpp?=
 =?utf-8?B?TVlaQzgxVmVjY2YwZ0E4MW5NUk94ZHZkUDl2dFNOblh5QjJPdXN0K1dBTjQz?=
 =?utf-8?B?clVJdVJGaXpHeWMyb0QvNGtmQjkwS1dWZmhxS3BnVU51S091N0JpT1JHT0RF?=
 =?utf-8?B?V2ZhQkQ4VkpRTUk5VjlLZ3Y4UjRUbjk2eWRMdXdoMWd1T0RGYmw5Vi82enM3?=
 =?utf-8?B?Nll2SjNkY0Y3TlpLc1hIK09aWENOY3JsVnQzTGZtMGt1SVZ3TUVjMGw3eEMz?=
 =?utf-8?B?TUk4RHVBaUV6eHV6WDRGMGNkMmVJdytBTGhsZzNmdmtzQXRCdlRrSDI1WGt0?=
 =?utf-8?B?a2Q4T21oNzRXUFhkckdmVU56SU4rQ2JRMExFYVRLM1lZdEdIYnYzd09ZSzN3?=
 =?utf-8?B?VElCb3htZDY0UHlEMHdjVHN5aS9RdXdEVjNpN3RSRVExcTVGeHVjbGpKMU4v?=
 =?utf-8?B?TGY0Q210cFQrV3BYVkZUT283NWRFTExQNWtWRHc4N21VRlVjTlBNaUxyUW9T?=
 =?utf-8?Q?YPCvUUD99kOwR9IH21pAGz/unWyyoFRd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REpHeVh0LzFmZVdDYnh3NGxNcU9lRkxlb25xWCtKQkt1ZVRVb0d3QVo5bHhy?=
 =?utf-8?B?a1EzQkMvUVpBMUpRYUMxYk9BWXFoNmRsUktmcEhVdWUwaGlTejkyUnlKeHpv?=
 =?utf-8?B?RysxMkZ5QVBJRGxqdkNaNXlKb0R6K1JpOVFEcWlGZ0o1RmdzcnJGcHJRT3Nx?=
 =?utf-8?B?ZkJkdG1kLzVEeE9KcHh6VDkvY3NQYmJ0Tms5M2p5dE9qeXYwM2R4Zlg5L2Vs?=
 =?utf-8?B?MDJSLzdwV1A5ZnBPNU9sVlc3bHJxbStlRmxPbXVBZ1NMdS9MZm1GMUlGdlo0?=
 =?utf-8?B?cXpqVDM4TXNxYjhTbEdxRDdDSDkzWkV5ZityU29UL3ZyK3FrYmM4UnQ4UFRw?=
 =?utf-8?B?V24wQ0xhQUZoWUJKT2xvTjBpcGRReGpkY0ZHaWNzM08ySnBsd2xydjMxdXBB?=
 =?utf-8?B?ZFU2aXlvTTZNRzlNY0V6SzR3VmlvUld1NDJwdmJCSWxUTGZEbXRmc2ZpMFNP?=
 =?utf-8?B?VldDU3FNSHM3bzI1SzFjbkEvM1BVcnMxajNvVjFLangyWFBhUHphN1czaHNZ?=
 =?utf-8?B?SlV4L1FCa2R1SXN1REcvU08ycDg4NkNIKzF1MW1VMVNkZWxWUmlxalZJem9T?=
 =?utf-8?B?b1NpQkx4QjNSSFZhVlhVNEFDRkd2Z0JHSVhxbWk4VG1ReEpBcmlhdzI4WGdB?=
 =?utf-8?B?MVlGbERRb2FzTHlVc1dnaFJyUGVLZlN6ZVFOYzB3K1cxTk0yNVZkd0RzT0lr?=
 =?utf-8?B?V3UxeXpQMmxBNWF6Tm5iRmJjZ3pSUnY3OWlJSi9sd3FlYStsdFo2a3o5NXlF?=
 =?utf-8?B?NHJJSWFPek94ZlNKSWsxNzI4eG1veFpYdStBRTUrazdTaDRuMVNSY3QySWYv?=
 =?utf-8?B?SFpteWxNZSttUjBTS2xLakI5RlR6MHUvOWVkTlFObXJHT3Z0eEZBZzRac1ow?=
 =?utf-8?B?WktzeGJuaFFvd3pNNktMWFU4RVZiR0F6Ti9Da1dVNW55TGUwd0ROVWRBd2Q3?=
 =?utf-8?B?QTNiOGg2NnVld252eHpIbzA5ano4TC9LempROFFTZ1JpS0RFcm15aGNmOHdV?=
 =?utf-8?B?YVhBSE9ib0lJZ1hDQXhGVUdId3I4c2FFSVZ6SUZuMWFPQTR5WlBuY2hYNE5X?=
 =?utf-8?B?d002ZUZ2LzhZZFJkcU13WkVFMlJXSTZsS2F4Q040WVZ4ZzN6dE1HNGQ2djlU?=
 =?utf-8?B?bnpRUGNMdWFzRXV3UHFBR3JiVGovcVFHQ3lpNklLOXVZNWZaNVV3RENVblQ3?=
 =?utf-8?B?bkN1MEpQQzVrZ2dYbnVkSmlZVDFtM2JMQUovTXlVUXJMZzdhVFppYmRlbVBX?=
 =?utf-8?B?TWlRUDQwUEc3WlJVL0xFM2lHWDFDQUo4c2NMM0FxZkFqbkQzenNqeTVuSndh?=
 =?utf-8?B?R1U2dFRPa0dPTU8yakEzRS9vUU5HN2loSHBxYzRsZDl6b3VoSFdpTG1qZUJu?=
 =?utf-8?B?Ky9JY0YwdlZieVlPTVhyS3VaQWk4bUdQb2pwZTVuNVpDWmxtZUdnRkhHOHBF?=
 =?utf-8?B?MzFsUXpuaGN3cjd0aExsNkd2LzJPVTZsaVZrcGxvam5BR3hvbUpmQmRjWjBl?=
 =?utf-8?B?OGp0Mm1SeGErVGUrUmNRTE1IZVRIWWJ6YjJzQ0p4TUNNR2FzU0FWaTZEdGxa?=
 =?utf-8?B?LzVYYUpXUjFCckppRzQyU0VwVlJGWTI1WEVMcDhxRjl5dkYvaTNVSGNmVkFH?=
 =?utf-8?B?UEhJNUIyUXVoNGJZZHYwYU4xU01yeWZaY0cwVzZEYmprR24yK25zVVlNTGZT?=
 =?utf-8?B?ZCtId3oxbW90c0V3b3dCU1RXOGppZWU2NkdUblFKOUx5WUt0enlRSlBHTXor?=
 =?utf-8?B?QjZNbzVCQlVEdTFnaVcyRnV5K1pyNnk4UkZENkRPb2ZTUGh1N0p0NVNiQ0Fi?=
 =?utf-8?B?aWorWWRjTW5WUmo1cFlZNTBCcmhCcjJncHZpVTVsdkZyUEJJb1VuUzZtZHN1?=
 =?utf-8?B?M1BMWnNpRGZqSEFublJkV0xCQllNUkpuV1U5UTBvWktCMGIycEVQVVNERFRs?=
 =?utf-8?B?UnVpTjFCOVB3Ri9IOHphQ3g2TGJraEZBaG5lN00zeTBwSk0waVk3ZC84SHZS?=
 =?utf-8?B?OWNLcnRBNU4rSDdUQU5NUEJIZHV6VkQ4NThjTkhLb1VvNVR5RWFjWm5Ub2dH?=
 =?utf-8?B?ejd3Nmk1NHFOQ2M4dXVjUGhlMlhyWE95M2JUT1VjN0d3dW45ZWVYdnpaR3ZH?=
 =?utf-8?B?dm1rZXorYUFKS1RGN3Y1enpMWXN1MHFzYXhWcEFzVzgwd0VLdmFtSnVVNGZS?=
 =?utf-8?Q?wYoHvciyAfKos3JGjVSUqK4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2297bc0e-9f45-43d1-b81a-08de3377d3ee
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 20:58:08.4839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lotvg8CRVOUVnXVDoEc5GI8B/tTBbrWxZ0OeIbTqYWWv8dApxiZG8T6tlei1NahG/u5f4ZBhqUjPkuid1+ezGUc/dFgvHMvJdjPjVIYE6uPSLVYWuFBWAttXogLhkcnr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
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

On Thu, Dec 04, 2025 at 11:19:47AM -0800, Summers, Stuart wrote:
>On Thu, 2025-11-20 at 19:57 -0800, Niranjana Vishwanathapura wrote:
>> Sync kernel header to get Multi-Queue uapi definitions.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  include/drm-uapi/xe_drm.h | 40
>> +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>>
>> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>> index 89ab54935..d1cb08dc7 100644
>> --- a/include/drm-uapi/xe_drm.h
>> +++ b/include/drm-uapi/xe_drm.h
>> @@ -106,6 +106,7 @@ extern "C" {
>>  #define DRM_XE_OBSERVATION             0x0b
>>  #define DRM_XE_MADVISE                 0x0c
>>  #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS        0x0d
>> +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY 0x0e
>>  
>>  /* Must be kept compact -- no holes */
>>  
>> @@ -123,6 +124,7 @@ extern "C" {
>>  #define
>> DRM_IOCTL_XE_OBSERVATION               DRM_IOW(DRM_COMMAND_BASE +
>> DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>>  #define
>> DRM_IOCTL_XE_MADVISE                   DRM_IOW(DRM_COMMAND_BASE +
>> DRM_XE_MADVISE, struct drm_xe_madvise)
>>  #define
>> DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS  DRM_IOWR(DRM_COMMAND_BASE +
>> DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct
>> drm_xe_vm_query_mem_range_attr)
>> +#define
>> DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY   DRM_IOW(DRM_COMMAND_BASE +
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct
>> drm_xe_exec_queue_set_property)
>>  
>>  /**
>>   * DOC: Xe IOCTL Extensions
>> @@ -1233,6 +1235,18 @@ struct drm_xe_vm_bind {
>>   *    Given that going into a power-saving state kills PXP HWDRM
>> sessions,
>>   *    runtime PM will be blocked while queues of this type are
>> alive.
>>   *    All PXP queues will be killed if a PXP invalidation event
>> occurs.
>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-
>> queue group
>> + *    or add secondary queues to a multi-queue group.
>> + *    If the extension's 'value' field has
>> %DRM_XE_MULTI_GROUP_CREATE flag set,
>> + *    then a new multi-queue group is created with this queue as the
>> primary queue
>> + *    (Q0). Otherwise, the queue gets added to the multi-queue group
>> whose primary
>> + *    queue id is specified in the 'value' field.
>
>Missing documentation, although compared to the ones below this is much
>less interesting:
>
>+ *    All the other non-relevant bits of extension's 'value' field
>while adding the
>+ *    primary or the secondary queues of the group must be set to 0.
>
>> + *    If the extension's 'value' field has
>> %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
>> + *    set, then the multi-queue group is kept active after the
>> primary queue is
>> + *    destroyed.
>> + *
>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the
>> queue
>> + *    priority within the multi-queue group.
>
>I see a little more detail in the kernel patch here:
>
>+ *    priority within the multi-queue group. Current valid priority
>values are 0–2
>+ *    (default is 1), with higher values indicating higher priority.
>
>Why not include this documentation here?
>

The updates to uapi documentation on kernel side was done as part of
review comment fix, which I forgot to import it here. Will import
them. I applies to below comments also.

Niranjana

>>   *
>>   * The example below shows how to use @drm_xe_exec_queue_create to
>> create
>>   * a simple exec_queue (no parallel submission) of class
>> @@ -1273,6 +1287,10 @@ struct drm_xe_exec_queue_create {
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY              0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE             1
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE              2
>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP           3
>> +#define     DRM_XE_MULTI_GROUP_CREATE                          (1ull
>> << 63)
>> +#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE                     (1ull
>> << 62)
>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY  4
>>         /** @extensions: Pointer to the first extension struct, if
>> any */
>>         __u64 extensions;
>>  
>> @@ -2254,6 +2272,28 @@ struct drm_xe_vm_query_mem_range_attr {
>>  
>>  };
>>  
>> +/**
>> + * struct drm_xe_exec_queue_set_property - exec queue set property
>> + *
>> + * Sets execution queue properties dynamically.
>
>Why not include the bit about the multi queue property being the only
>one here?
>
>+/**
>+ * struct drm_xe_exec_queue_set_property - exec queue set property
>+ *
>+ * Sets execution queue properties dynamically.
>+ * Currently only %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
>+ * property can be dynamically set.
>+ */
>
>Anyway these aren't function. From my perspective it's more nice to
>have to align with the kernel. An IGT developer (and UMD dev) can and
>should look at the documentation in the kernel itself anyway. For
>consistency though it would be nice to keep this the same.
>
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>
>Thanks,
>Stuart
>
>
>> + */
>> +struct drm_xe_exec_queue_set_property {
>> +       /** @extensions: Pointer to the first extension struct, if
>> any */
>> +       __u64 extensions;
>> +
>> +       /** @exec_queue_id: Exec queue ID */
>> +       __u32 exec_queue_id;
>> +
>> +       /** @property: property to set */
>> +       __u32 property;
>> +
>> +       /** @value: property value */
>> +       __u64 value;
>> +
>> +       /** @reserved: Reserved */
>> +       __u64 reserved[2];
>> +};
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>
