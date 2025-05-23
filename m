Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BE3C54ED0
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 08:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D5610E201;
	Fri, 23 May 2025 08:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdIwystJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B0710E160;
 Fri, 23 May 2025 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747988855; x=1779524855;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=Jy+A/CjiKUbiz5f2gioTFYqrVSDvEKRz2Hd35/L6ZpY=;
 b=RdIwystJest0SqZhlM9yJXUNM7uyVbhrq7BZoWtaLf5ElMc/RD5jHwYL
 AtT3gDeVTo+x0Z3HnbmfI5TrHlVKkEbFksL/ooRYueBuaB48KluOm4s9E
 gy5grGPD3h+AifpfEUN74mrTFQsSsCoKGzcLmOYAZVk2Q1nE4UTxvLYei
 sNQlQgZ5mQt4bT9pmq94TE70dDojLEBnVip+so3FTxE0PMQd/MqEaf//+
 mJrWpQWOgFXjh3HNbd1G/ZJT2UfGnXJ6Pi+b+bXT0Zvn2BqYOUuUXVfqD
 N0wEh0o2qt6Ngjp9iGEksK7cTjsoqpYj4rR82DkaSFhUGhH7utkgNHU2R g==;
X-CSE-ConnectionGUID: mO4VYapYRJG+KuRFeb1y8Q==
X-CSE-MsgGUID: NPk/vs5WTJ22DlT5IMd0Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60675679"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208,217";a="60675679"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:27:35 -0700
X-CSE-ConnectionGUID: iXpLjavvRmCvtG11i+TsLw==
X-CSE-MsgGUID: 6f1z6xT+QvKeegrkYD2m7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
 d="scan'208,217";a="145009169"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:27:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 23 May 2025 01:27:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 23 May 2025 01:27:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.72) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 23 May 2025 01:27:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnE6domB/Zw8vWwbJDq5BwlRh2u0yFURlQpxPSKc5+Q/jykgPOmccTRRMXdDZxQUrBa37o9LEP82IB+ZAEFFG3sBZ121aEMDxFPn1awe0nFKtEv47kWFhIvFsb+u5HEFUN0WSZGjuk04m5TFtrHrgUJrkjQbZJ6iWQ3JJRbQIg40kIPOj33+3EPu3BYv6L1aZI7+KReL9KS8caNtlIOdwArUJEX1urxG38M/mNWbX+IpyAwmsCFgzkaCQYhTzhEkXH0ihh2GQ/ssPdm5fHjKOTUPogFfHkbSjUCiCPNDTbY/nkEsupeqgscqHX+Pu3C12ZapI35OWZRJTWKTRjaKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlAMQErm4WVsiZDxCV0VqMIcplkEcUdDU9bZk7Z/U1c=;
 b=O59vbEQHsmJ/iyM/CArk+0D9G68p2bFqj4l71Vd+Za6kJ9eRGyZt6DIciKFGUq1pu5wfK6A371BkYaYcPcp/JTSOovU1pDeXeqKwSx9mHrIjQCrRWirYLnNhbkloNBWGCjHVzPMNQBbSv3TLz0VUGXZe5FHFKKHbLLDIc7C8PaN3VaHW/aNDt/MLAt3kJ5LHddzR+7devsf1XbDmeeF9GOqZLy6a9iNH7vaJJEXzdVDdaEyl7e0SWZqE12c8VqfR1w9vRzd4xmas3MDZ/lUtT8iIUrLSfJj3UGiQUOXOck/BCV0AELrZJIpBDrlBpsFcIBJZz7Kh9sfDIuqe9u9zQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DS7PR11MB7807.namprd11.prod.outlook.com (2603:10b6:8:e3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.21; Fri, 23 May 2025 08:27:24 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 08:27:24 +0000
Content-Type: multipart/alternative;
 boundary="------------GpcRFMM5z6ELHghpU4VYjvTe"
Message-ID: <331d0519-e39b-4cef-bb93-3a7e0aa01753@intel.com>
Date: Fri, 23 May 2025 13:57:17 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB0ZXN0cy94ZV9w?=
 =?UTF-8?Q?mu=3A_Ensure_consistent_GPU_frequency_comparison?=
To: <igt-dev@lists.freedesktop.org>
References: <20250520171641.2421623-1-sk.anirban@intel.com>
 <174781330443.8350.5164360457655037459@1538d3639d33>
Content-Language: en-US
CC: <I915-ci-infra@lists.freedesktop.org>,
 <ravi.kishore.koppuravuri@intel.com>, <kamil.konieczny@intel.com>
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <174781330443.8350.5164360457655037459@1538d3639d33>
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DS7PR11MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae79fb0-35e9-4654-fd88-08dd99d3a44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0FrWG9UbmRreFEzQWJRNGx5UysySjV2ZlFlRTNqcGdZVzNZM0UzdUwyWldv?=
 =?utf-8?B?cS9wd3F6VnpuSkhOS3BMbzhqS0k1THhZcGFMYnVPWVIvdzR4bC9aSU9KYUcr?=
 =?utf-8?B?MGIwVjRHa3lMeUJPNGlBSnEyM1lXVTNQcG5UL2VCZ3VmcXZhY2NFQTlWcUxU?=
 =?utf-8?B?MGFqU0xzM1pMaXZxS1ZoVDRycFBic0ZhNmYwNkxzYk04L2VMWFVjeUdJY2Zm?=
 =?utf-8?B?clB5cml1ZnVBTUtPcTJVSzNhOS9BYzBUenBmdlpSZTNScytabjVIaXdldkxm?=
 =?utf-8?B?ZWJzVkZiMkRybTdjSFo5RFpOY0l1UG5DSk12VTJMRnhWWXR6RGx4SUsxSU1u?=
 =?utf-8?B?TWlHb1JVclhsekJJOXBNQVFOY2RSTDdHZkp5blU4bFFubkh6K1Y0cFZaazMr?=
 =?utf-8?B?U1RxV0x6d0VvelM1VnVPYWJxbmlsYlJkdXU3SnJra2cxSTdXbkpzbFZJV0lM?=
 =?utf-8?B?UVM0Mk1KZUNKaGNZS2NLa3dOR3lqMUg4dkRzUXJvMG9RMTJSWnk0YXcwVnpj?=
 =?utf-8?B?MTVKb2QxVkNoaXdXNWdmMjdaNmJJUGtqcmc0QWpRVXovTGdOalFnbUJtaFVh?=
 =?utf-8?B?ejJzN1FxU3ZOdGpvdmFaVWJDdWJVbDg0NEx5RXRnWHpaQlFDZTJOVU45K1NO?=
 =?utf-8?B?RmxsZm9MTTlhWlJPbjNvWGNmaFBEeldOa0RPUU9rY3ZKay9hRFBMWUV2OFZ3?=
 =?utf-8?B?U2U1OXRkc2RqU28zTXNnZEhrVHFjMVVIUzdLdlRNUG9xMnNuWWhuQW8xQjVO?=
 =?utf-8?B?YUo3RTBaODhxVkZHelo0QmRWM2JtUmRmeVR6dXhvNDVpc2lqOXc3dmE4c0Ro?=
 =?utf-8?B?bnVrNGJhZDNFUDU5ZG5SNSt5eUFLenJpaEI1aFE3TU1qdkZRRytaK0hWT1l3?=
 =?utf-8?B?T1hkaktPTVBVYmRDWE44WVY2QVY2MG00Y2RFb1k5UHlTRk14OFMwK1JkNWRI?=
 =?utf-8?B?c1c2RUwrdEpSY3NGNTlSa1N3N2RGT3F0LzNNVmhoZU52WHZlM0RjOEMrR2la?=
 =?utf-8?B?ZHkwMnVFY2ViaWNqK2Q1UWFuZHBCSVpLRmVIQ3h0bFNxT3hxU0NaYUh2cGV1?=
 =?utf-8?B?cDN2R2NjSTZINzBSSXhpWGI3NmFVQldpVUo1VDdUQTg3TGlwOUU0VDltNFpr?=
 =?utf-8?B?SXY2dXRLYXRvbEtNNHRpNFZQbHJSV0xtREdhQm5CZXIranRDcThSeTlBL0t3?=
 =?utf-8?B?ZmFwVU83YVhIYTB3QlB3SVA1U3RUelh5RGNDR2JoRzdJVVp6bEVwT2RnVDQv?=
 =?utf-8?B?dlJhdHNtZ1l5MVltN1J0ZG1MeDl0emlrSUZjNTZsT1FDSlROWVBzTnRKL0hx?=
 =?utf-8?B?VXNYb0xhL2JITHg3ZFVTYWpUR21WZ0wrMTNkc2FLem9sVkluZUphVC9GZ1FX?=
 =?utf-8?B?VVNzdU4wdkYySW9iNCtSWC82bTlHT1hlNUNHUitKZDRFR0IxdmlqNzVvd1cx?=
 =?utf-8?B?YkFaUDNxSDZkTWhENHVIV1djcXhYeVNEa0ZGTFltTy9UV1VvQlJNVWtCTW00?=
 =?utf-8?B?eHl5ajY1NTVTeVJQc2orMDkzaGIzNjNlM0t0Ym5RbzJCVW5vaVEwMWd2VFd2?=
 =?utf-8?B?cUF4d0w5N3preXhFOUlqdlFwblo0YVJIc2Z4WlBiK1lDak5aY3QrZXBoZXVk?=
 =?utf-8?B?YWprdkFlOWtiK0hqMzVVaXdBR0tSUFBVQlRMcmhUeHVwbUdJNFNlVy9hK25t?=
 =?utf-8?B?eFV1NzF3bTFZSm5TRjB4dUgxSXR5QmNQaDYvaWFZb3lXTDNwUm5DdUNyTVpE?=
 =?utf-8?B?Qmd4eXBqT25IQUhyMEgvditqcXBmUkxSVFZHc0hKS1RqNHlWaTB2a3BrSFVR?=
 =?utf-8?Q?lnE+nAmqi7uLNJKV9hB730rOME+h3DdQxM5Nk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEcwYWRsV0l1cjZDNU05c3B6WUprYktmZUlRalJaMjRUNHkyTU9XL3Q2Zjd3?=
 =?utf-8?B?ZzJ1bDR4Y3Frbkpya2JOY0Nsdnlsc0ZXa0pNOHl4cFRXSVN4ZEgvWks3bGFk?=
 =?utf-8?B?NnN5RWc1RkthNk4za2ZtVHRjMXZMZXNlUy9MenFCT2Noc25ocFg2dHpMaDhs?=
 =?utf-8?B?WWhJY0dzbHRoaXRabXZvOGVJc2lYQU5pQTM2dWI5K0Z5ZGxWNDdsSW9ESjFS?=
 =?utf-8?B?Ym9zTjg3dmtsTWhSZnAyaXl6K0MxOEdOcFRtRFp0RnBGQzBlb0FLQmZBL0tz?=
 =?utf-8?B?ZVRhZGdwckNXbXhHNUdqNXFNV1cwcE9OazB2RnJGUkJKUXpUMVZsQTlYYzJp?=
 =?utf-8?B?OHRPeUxxc0Q0dTNLTk9DUDk4NDlmUVAwYVpCVWVoRzRndVd0Tk05QVpKeWdz?=
 =?utf-8?B?RmJMRHQ5dXpDTGY3WXhLYlFvOUxvUkpOMFR2MVJLbklnVHJobVVwM1pIWnVY?=
 =?utf-8?B?Z0xPLytJc0tCSzdzdVVvanlrWHZ3SGpsb0pNNUF2N2M0Vm0zNERMRFNqTjhR?=
 =?utf-8?B?S21WUXRVSmtUaWl0cTZLbFE3blpoMlZ0a3hSWlR4bUNTYU5Palkva3Y5SmQ0?=
 =?utf-8?B?ZmZrRlExNFhseDIvcTMxZy9PVG4xTWhyc0pxd2dHMzBSZUFnQUtBZTQ4SVFP?=
 =?utf-8?B?QlNRc1hBVmdvNkxaUzd6c2R3VVFJanJaTFE5Y1I1bkRJL1NVQ1E4UUJ3VjZV?=
 =?utf-8?B?aU53YnRZY0gzUXBOclhqa1hVOWE2YkQ1VEQ5NVRScHliSkp3Tm1Ud3NWejlK?=
 =?utf-8?B?NU1oOExwV0k0VG5oblVqcUFuSWpQOFdXcm5xL0dQMUtTUjRVWXdkQmkvdEFI?=
 =?utf-8?B?dWJNTkxEenlPdzhUK2p0ZE1KblcxRU9Iak5nLzFEODlkK1dIbng2d1ZneGI0?=
 =?utf-8?B?bWZFNFYyOU5oSVNka3lZaWRJejJiMjVvSnJxV0FYS0o0Snh4YjVvSUozdHVq?=
 =?utf-8?B?NmE1aGwrbkZNTWtaNXdDbUpvRXdqMGY5c0toWTM5VWpmWDdqWC9SRWx6S2M4?=
 =?utf-8?B?UjFpSmxzQXBYeWNYTm4xcGwwSUJWOUd2SWt1ZDg0YmJjYUJqeXNPa085TTd1?=
 =?utf-8?B?OHdwVlNNU0hCTVpsTk1sZnJUbVliQTR6allKZVc1a2k3NnRVaFkzZU9QUVZZ?=
 =?utf-8?B?QkNnSkw3b1dScjJXTHl2bUtsZ0FQUElDd3lFTExXcnlPc0trZDc5aHUwQ29t?=
 =?utf-8?B?T3RaakM0bkZCYS9xOVN3KzBGNkcraC9vNkorQS9SbDF3Q1hibkNzYkhvemR1?=
 =?utf-8?B?MWZ3L3k4Z2dFTlNhQUFDMWZvMjFZRjkrQXNDQUtsbmxkRXBpMGtkT2tVKzgw?=
 =?utf-8?B?emdxeWtNeVo1OG11aDA5bTVoZ1NUV0s4N2RVV2I5V0ttRHVJcFVCbjBLeW9E?=
 =?utf-8?B?QnMwdTJtakk3bURlc3ZQS2RZcGc0MFlnQThVUGQ2b1g0NWF3Sk10a010ZnA1?=
 =?utf-8?B?b2pQbk5FbytPR1pKek9VenR1Z2Z6VGRzNG8zTWg2NW0vay90MkdqenRDSTFp?=
 =?utf-8?B?UWhLb0dnSFVCZlczTFdBZmRrNkdVeFlFaHJEUDVnbmw1RGJHd0RJa0JUdEJX?=
 =?utf-8?B?MGVOaVAxTE5udVFsM1ZlTUNnUUhpMHFXZG02ZGJ4anQyckNFcWRBRjQ3YzVq?=
 =?utf-8?B?bmZERkRJdFN4L1l5Zk81UXpUelpnclBHazhyWk5RUnlOWFo0WE1rYTR3dFVK?=
 =?utf-8?B?WWc2Yy9vemFZV1o4a1I0alhudDhCdTFrcnBJNGJveVdzQ2JIdWhGSFV4WjYv?=
 =?utf-8?B?WGZYenlCaVNDcldMYUN6enN0UHk3dmZqTFZYOFVMdzZsV3A5amZGcmMxQStJ?=
 =?utf-8?B?WUpSa2JOOU41WWlSMkZWK3JDeFVUemhCN2tYb2NoSzdPQjFoRnA5dCt2ejZ4?=
 =?utf-8?B?VjVvb0ZxcFRhYVV3ZXAxUmtTcTRtSTc1dVNlMGxQYVIxS3RJOXdnZURvVmRT?=
 =?utf-8?B?WHNzRVd2K1loTmxFTCtqZGxqcXB5TEVEMGwzdVM2SEpUbTlaWlZtczkwWnhR?=
 =?utf-8?B?UnE1WHVpM1RRZEVQNzRnZFpLcTFrVTlibEs1MXY2VUtzbEIyYWFhTWYySHpn?=
 =?utf-8?B?NWhFcG9qOVRMK29aQ2lVU3Z5NXRUTUdmQkNMSDYwTE1WRmxtKzZvK3JLZjFF?=
 =?utf-8?Q?k5mZFAMvGTZ3BktDXVXn/Ff/g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae79fb0-35e9-4654-fd88-08dd99d3a44c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 08:27:24.1118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSFkWk3iH0jHtn9aeezZkj0k4C2EGYNx1namLHwAIka+UXqrFkn+dRRcjjX5+7gz2nHBue5bzeChb8KANNXn6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7807
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

--------------GpcRFMM5z6ELHghpU4VYjvTe
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
these test failures are not related to my changes.

Thanks,
Anirban

On 21-05-2025 13:11, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe_pmu: Ensure consistent GPU frequency comparison
> *URL:* 	https://patchwork.freedesktop.org/series/149273/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/index.html
>
>
>   CI Bug Log - changes from XEIGT_8371_FULL -> XEIGTPW_13153_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_13153_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_13153_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 3)
>
> Missing (1): shard-adlp
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_13153_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_pm_rpm@universal-planes-dpms@plane-83:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms@plane-83.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_pm_rpm@universal-planes-dpms@plane-83.html>
>         +11 other tests dmesg-warn
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_13153_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html>
>         (Intel XE#911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3
>         other tests fail
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html>
>         (Intel XE#3767
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767>)
>         +15 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1
>         other test skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>)
>  *
>
>     igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +8
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>         +258 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +45
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +5
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +7
>         other tests skip
>  *
>
>     igt@kms_chamelium_edid@vga-edid-read:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@kms_chamelium_edid@vga-edid-read.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-frame-dump:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_chamelium_frames@hdmi-frame-dump.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +2
>         other tests skip
>  *
>
>     igt@kms_color@ctm-0-75@pipe-a-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-2/igt@kms_color@ctm-0-75@pipe-a-dp-2.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_color@ctm-0-75@pipe-a-dp-2.html>
>         (Intel XE#4878
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4878> /
>         Intel XE#4889
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4889> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>)
>  *
>
>     igt@kms_color@legacy-gamma@pipe-a-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@kms_color@legacy-gamma@pipe-a-dp-2.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_color@legacy-gamma@pipe-a-dp-2.html>
>         (Intel XE#4889
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4889> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>)
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@kms_content_protection@atomic-dpms.html>
>         (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>  *
>
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@legacy@pipe-a-dp-2:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +3
>         other tests fail
>  *
>
>     igt@kms_content_protection@uevent@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_content_protection@uevent@pipe-a-dp-4.html>
>         (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-128x128:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-256x85:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_edge_walk@128x128-top-bottom:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-top-bottom.html>
>         (Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>)
>  *
>
>     igt@kms_cursor_edge_walk@256x256-top-bottom:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +7
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>)
>  *
>
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +7 other tests skip
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#1475
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>)
>  *
>
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html>
>         (Intel XE#4210
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (Intel XE#1340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>)
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>  *
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) +1
>         other test fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-5/igt@kms_flip@2x-flip-vs-expired-vblank.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +1
>         other test fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +7
>         other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +2
>         other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-wf_vblank@bd-dp2-hdmi-a3:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank@bd-dp2-hdmi-a3.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) +3
>         other tests fail
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +3
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@d-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html>
>         (Intel XE#4683
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683>) +1
>         other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +18
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +22
>         other tests skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#1469
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +19
>         other tests skip
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>  *
>
>     igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html>
>         (Intel XE#4359
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359>)
>  *
>
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +3
>         other tests fail
>  *
>
>     igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +2
>         other tests fail
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +1
>         other test skip
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html>
>         (Intel XE#2393
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393>) +1
>         other test skip
>  *
>
>     igt@kms_plane_multiple@2x-tiling-y:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html>
>         (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +5
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +4
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +7
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>) +1
>         other test skip
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +7
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#1128
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128>)
>  *
>
>     igt@kms_psr@fbc-psr2-no-drrs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@kms_psr@fbc-psr2-no-drrs.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-no-drrs@edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html>
>         (Intel XE#4609
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +12
>         other tests skip
>  *
>
>     igt@kms_psr@pr-sprite-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_psr@pr-sprite-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +6
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#2939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-none:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_scaling_modes@scaling-mode-none.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413> /
>         Intel XE#374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/374>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html>
>         (Intel XE#374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/374>) +2
>         other tests skip
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-1/igt@kms_setmode@basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_setmode@basic.html>
>         (Intel XE#4794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4794> /
>         Intel XE#4807
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4807>)
>  *
>
>     igt@kms_setmode@basic@pipe-a-dp-2-pipe-b-hdmi-a-3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-1/igt@kms_setmode@basic@pipe-a-dp-2-pipe-b-hdmi-a-3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_setmode@basic@pipe-a-dp-2-pipe-b-hdmi-a-3.html>
>         (Intel XE#4807
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4807>)
>  *
>
>     igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-1/igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3.html>
>         (Intel XE#4794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4794>)
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@kms_vblank@query-idle@pipe-d-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-1/igt@kms_vblank@query-idle@pipe-d-dp-2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_vblank@query-idle@pipe-d-dp-2.html>
>         (Intel XE#4892
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4892>) +2
>         other tests fail
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-8/igt@kms_vrr@negative-basic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_vrr@negative-basic.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) +2
>         other tests skip
>  *
>
>     igt@kms_vrr@seamless-rr-switch-vrr:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-8/igt@kms_writeback@writeback-pixel-formats.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-7/igt@kms_writeback@writeback-pixel-formats.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>  *
>
>     igt@xe_create@create-big-vram:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-7/igt@xe_create@create-big-vram.html>
>         (Intel XE#1062
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062>)
>  *
>
>     igt@xe_eu_stall@blocking-re-enable:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_eu_stall@blocking-re-enable.html>
>         (Intel XE#4497
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug@discovery-empty:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +4
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-5/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +3
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +8
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-small-cm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-4/igt@xe_evict@evict-beng-small-cm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@no-exec-bindexecqueue-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>         +23 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-rebind-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_exec_fault_mode@once-rebind-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +23
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +9
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@many-large-malloc:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@xe_exec_system_allocator@many-large-malloc.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@xe_exec_system_allocator@many-large-malloc.html>
>         (Intel XE#3428
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428>) +1
>         other test dmesg-warn
>  *
>
>     igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>         +15 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html>
>         (Intel XE#5018
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018>)
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +208 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@twice-large-new-nomemset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_system_allocator@twice-large-new-nomemset.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +4
>         other tests skip
>  *
>
>     igt@xe_gt_freq@freq_suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-dg2-set2: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe_module_load@load.html>)
>         -> (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_module_load@load.html>)
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>  *
>
>     igt@xe_oa@oa-regs-whitelisted:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_oa@oa-regs-whitelisted.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +2
>         other tests skip
>  *
>
>     igt@xe_oa@syncs-syncobj-wait:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573> /
>         Intel XE#4501
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501>)
>  *
>
>     igt@xe_pm@d3cold-basic-exec:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@d3cold-mmap-vram:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-1/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-lnl-8/igt@xe_pm@s4-basic.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-2/igt@xe_pm@s4-basic.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) +1
>         other test abort
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_pxp@display-pxp-fb:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@xe_pxp@display-pxp-fb.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1
>         other test skip
>  *
>
>     igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_render_copy@render-stress-4-copies:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_render_copy@render-stress-4-copies.html>
>         (Intel XE#4814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814>)
>  *
>
>     igt@xe_sriov_flr@flr-twice:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html>
>         (Intel XE#4273
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273>)
>
>
>         Possible fixes
>
>  *
>
>     igt@core_hotunplug@unbind-rebind:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html>
>         +8 other tests pass
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html>
>         (Intel XE#911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html>
>         +3 other tests pass
>  *
>
>     igt@kms_big_fb@4-tiled-addfb:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_big_fb@4-tiled-addfb.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_big_fb@4-tiled-addfb.html>
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-256x85:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html>
>         +4 other tests pass
>  *
>
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         (Intel XE#4828
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4828>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
>         (Intel XE#3226
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>         +5 other tests pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1475
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html>
>  *
>
>     igt@kms_flip@2x-plain-flip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-4/igt@kms_flip@2x-plain-flip.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_flip@2x-plain-flip.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html>
>         (Intel XE#3549
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3549>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4.html>
>         +4 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882> /
>         Intel XE#3098
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html>
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@b-dp2:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@b-dp2.html>
>         (Intel XE#3098
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check@b-dp2.html>
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html>
>  *
>
>     igt@kms_hdr@bpc-switch-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html>
>         (Intel XE#4883
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4883>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend.html>
>  *
>
>     igt@kms_hdr@static-swap:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-4/igt@kms_hdr@static-swap.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_hdr@static-swap.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (Intel XE#2571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html>
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html>
>         +7 other tests pass
>  *
>
>     igt@xe_exec_system_allocator@many-mmap-remap-ro-dontunmap:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@xe_exec_system_allocator@many-mmap-remap-ro-dontunmap.html>
>         (Intel XE#3428
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@xe_exec_system_allocator@many-mmap-remap-ro-dontunmap.html>
>         +14 other tests pass
>  *
>
>     igt@xe_exec_threads@threads-hang-userptr-rebind-err:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html>
>  *
>
>     igt@xe_pm@s4-vm-bind-userptr:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (Intel XE#3442
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@kms_content_protection@atomic.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_content_protection@atomic.html>
>         (Intel XE#4862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4862>) +1
>         other test timeout
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@kms_content_protection@srm.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_content_protection@srm.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_flip@2x-flip-vs-wf_vblank:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312> /
>         Intel XE#5042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +11 other tests skip
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#4760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_psr@fbc-psr-sprite-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@kms_psr@psr-sprite-blt.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_psr@psr-sprite-blt.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1
>         other test skip
>  *
>
>     igt@kms_vrr@flip-basic-fastset:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@kms_vrr@flip-basic-fastset.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_vrr@flip-basic-fastset.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@xe_eu_stall@non-blocking-re-enable:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_eu_stall@non-blocking-re-enable.html>
>         (Intel XE#4497
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_eu_stall@non-blocking-re-enable.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>  *
>
>     igt@xe_eudebug@basic-vm-access-parameters:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3
>         other tests skip
>  *
>
>     igt@xe_eudebug@discovery-empty:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@many-execqueues-mmap-huge:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_exec_system_allocator@many-execqueues-mmap-huge.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +17 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-many-stride-malloc-race:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-stride-malloc-race.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-stride-malloc-race.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>         +35 other tests skip
>  *
>
>     igt@xe_oa@closed-fd-and-unmapped-access:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>  *
>
>     igt@xe_oa@invalid-oa-exponent:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_oa@invalid-oa-exponent.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_oa@invalid-oa-exponent.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>)
>  *
>
>     igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>  *
>
>     igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>  *
>
>     igt@xe_spin_batch@spin-mem-copy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_spin_batch@spin-mem-copy.html>
>         (Intel XE#4821
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_spin_batch@spin-mem-copy.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>  *
>
>     igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>  *
>
>     igt@xe_sriov_flr@flr-twice:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_sriov_flr@flr-twice.html>
>         (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@xe_sriov_flr@flr-twice.html>
>         (Intel XE#4273
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273>)
>
>
>     Build changes
>
>   * IGT: IGT_8371 -> IGTPW_13153
>   * Linux: xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320 ->
>     xe-3116-45abc70af791052c25beeb400aece4dab51020cd
>
> IGTPW_13153: 13153
> IGT_8371: 8371
> xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320: 
> 45c2c8c74ab88c8fb741ea8349b051f5aec87320
> xe-3116-45abc70af791052c25beeb400aece4dab51020cd: 
> 45abc70af791052c25beeb400aece4dab51020cd
>

--------------GpcRFMM5z6ELHghpU4VYjvTe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    Hi,<br>
    these test failures are not related to my changes.<br>
    <br>
    Thanks,<br>
    Anirban<br>
    <br>
    <div class=3D"moz-cite-prefix">On 21-05-2025 13:11, Patchwork wrote:<br=
>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:174781330443.8350.516436045765503=
7459@1538d3639d33">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/xe_pmu: Ensure consistent GPU frequency comparison</t=
d>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/149273/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/149273/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13153/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8371_FULL -&gt;
        XEIGTPW_13153_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_13153_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_13153_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 3)</h2>
      <p>Missing (1): shard-adlp </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_13153_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_pm_rpm@universal-planes-dpms@plane-83:
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms@plane-83.htm=
l" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_pm_rpm@universal-plane=
s-dpms@plane-83.html" moz-do-not-send=3D"true">DMESG-WARN</a> +11 other tes=
ts
              dmesg-warn</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_13153_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pi=
pe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-eve=
nts-linear@pipe-c-edp-1.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt=
@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html"=
 moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/911" moz-do-not-send=3D"true">Intel XE#911</a>) +3 =
other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-ato=
mic@pipe-a-hdmi-a-6-4-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_async_flips@async-=
flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3767" moz-do-not-send=3D"true">Intel XE#3767</a>) +15=
 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_big_fb@x-tiled-16b=
pp-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">In=
tel XE#316</a>) +1 other test
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rota=
te-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE=
#2327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE#1=
124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_big_fb@y-tiled-add=
fb-size-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send=
=3D"true">Intel XE#607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE#=
1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_big_fb@yf-tiled-64=
bpp-rotate-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">=
Intel XE#1124</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_big_fb@yf-tiled-ad=
dfb-size-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610" moz-do-not-send=3D"true=
">Intel XE#610</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-asy=
nc-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_big_fb@yf-tiled-ma=
x-hw-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
31" moz-do-not-send=3D"true">Intel XE#2231</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel X=
E#4208</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-4/igt@kms_bw@connected-linear-tilin=
g-2-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send=
=3D"true">Intel XE#2191</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send=
=3D"true">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2894" moz-do-not-send=3D"true">Intel XE#2894</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_bw@connected-linea=
r-tiling-3-displays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-no=
t-send=3D"true">Intel XE#2191</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_bw@linear-tiling-2-displa=
ys-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_bw@linear-tiling-3=
-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"t=
rue">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_ccs@bad-aux-stride=
-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-no=
t-send=3D"true">Intel XE#787</a>) +258 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true=
">Intel XE#2887</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-=
2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_ccs@ccs-on-another=
-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz=
-do-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>=
) +45 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_ccs@crc-primary-ba=
sic-4-tiled-bmg-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-send=3D"t=
rue">Intel XE#2907</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true"=
>Intel XE#2887</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"tru=
e">Intel XE#3432</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"tru=
e">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-=
2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs@pipe-b-dp-2.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-no=
t-send=3D"true">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +3 =
other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-25:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_chamelium_color@ct=
m-0-25.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#=
306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_chamelium_edid@dp-=
edid-change-during-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-sen=
d=3D"true">Intel XE#373</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@vga-edid-read:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@kms_chamelium_edid@vga-edid-r=
ead.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373=
</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_chamelium_frames@hdmi-fra=
me-dump.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Intel X=
E#2252</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-0-75@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-2/igt@kms_color@ctm-0-75@pipe-a-dp-2.html" moz-do-n=
ot-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_color@ctm-0-75@pipe-a-dp-2.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4878" moz-do-not-send=3D"true">Intel XE#4878</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4889" moz-do-=
not-send=3D"true">Intel XE#4889</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@legacy-gamma@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@kms_color@legacy-gamma@pipe-a-dp-2.html" moz-=
do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_color@legacy-gamma@pipe-a-dp-=
2.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4889" moz-do-not-send=3D"true">Intel XE#4889=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042"=
 moz-do-not-send=3D"true">Intel XE#5042</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@kms_content_protection@atomic=
-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3278" moz-do-not-send=3D"true">Intel XE#=
3278</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"tru=
e">Intel XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_content_protection=
@legacy@pipe-a-dp-2.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"t=
rue">Intel XE#1178</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_content_protection=
@uevent@pipe-a-dp-4.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1188" moz-do-not-send=3D"t=
rue">Intel XE#1188</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_cursor_crc@cursor-random-=
512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel X=
E#2321</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_cursor_crc@cursor-random-=
512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel X=
E#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-128x128.=
html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_cursor_crc@cursor-r=
apid-movement-128x128.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D=
"true">Intel XE#2320</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-m=
ovement-256x85.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send=3D"true">=
Intel XE#1424</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-m=
ovement-256x85.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">=
Intel XE#2320</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_cursor_crc@cursor-=
rapid-movement-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send=3D=
"true">Intel XE#308</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@128x128-top-bottom:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html"=
 moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_cursor_edge_walk@128x128=
-top-bottom.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5042" moz-do-not-send=3D"true">Int=
el XE#5042</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_cursor_edge_walk@2=
56x256-top-bottom.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"tru=
e">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2575" moz-do-not-send=3D"true">i915#2575</a>) +1 other test =
skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.ht=
ml" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_cursor_legacy@2x-flip=
-vs-cursor-atomic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D"tru=
e">Intel XE#2291</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D"true">I=
ntel XE#2291</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send=3D"true">In=
tel XE#309</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-lega=
cy.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_cursor_legacy@2x=
-long-cursor-vs-flip-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-s=
end=3D"true">Intel XE#2291</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:=
</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modes=
et-vs-cursor-atomic.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt=
@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-se=
nd=3D"true">i915#2575</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"=
 moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13153/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cu=
rsor-atomic.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1475" moz-do-not-send=3D"true">Int=
el XE#1475</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4210" moz-do-not-send=3D"true">Intel XE#4210<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1508" moz-do-not-send=3D"true">Intel XE#1508<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do=
-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1340" moz-do-not-send=3D"true">Intel XE#1340</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:<=
/p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc=
-dirty-rectangle-different-formats.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-d=
o-not-send=3D"true">Intel XE#4422</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-s=
end=3D"true">Intel XE#4422</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-s=
end=3D"true">Intel XE#4422</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_flip@2x-blocking-absolute=
-wf_vblank.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Inte=
l XE#2316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2=
-hdmi-a3.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_flip@2x-fl=
ip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html" moz-do-not-send=3D"true">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" =
moz-do-not-send=3D"true">Intel XE#2882</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-5/igt@kms_flip@2x-flip-vs-expired-v=
blank.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send=3D"true">Intel XE#=
1421</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a=
6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-int=
erruptible@ab-hdmi-a6-dp4.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464=
/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html" =
moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel XE#301</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-no=
t-send=3D"true">Intel XE#3321</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-not-send=3D"=
true">Intel XE#3321</a>) +7 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip@2x-flip-vs-ex=
pired-vblank@cd-hdmi-a6-dp4.html" moz-do-not-send=3D"true">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-se=
nd=3D"true">Intel XE#301</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-wf_vblank@bd-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank=
@bd-dp2-hdmi-a3.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-not-send=3D"true"=
>Intel XE#2882</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible=
.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_flip@2x-plain-flip=
-ts-check-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send=
=3D"true">Intel XE#2316</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip@flip-vs-expir=
ed-vblank@d-dp4.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321" moz-do-not-send=3D"true">Intel XE#3321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-d=
ownscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2293" moz-do-not-send=3D"true">Intel XE#2293</a>) +2 other test=
s
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-dow=
nscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" mo=
z-do-not-send=3D"true">Intel XE#1401</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE#1745=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-dow=
nscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1401" moz-do-not-send=3D"true">Intel XE#1401</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscal=
ing:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-upscaling.html" moz-do-not-send=3D"true">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683" moz-do-=
not-send=3D"true">Intel XE#4683</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upsc=
aling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-d=
o-not-send=3D"true">Intel XE#2293</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2380" moz-do-not-send=3D"true">Intel XE#2380</a=
>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upsc=
aling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_flip_scaled_crc@fl=
ip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +18 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-pri-indfb-multidraw.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=
=3D"true">Intel XE#2311</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@drrs-2p-primscrn-cur-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-d=
o-not-send=3D"true">Intel XE#651</a>) +22 other tests
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-=
send=3D"true">Intel XE#2312</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:=
</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-indfb-msflip-blt.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt=
@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2231" moz-do-not-send=3D"true">Intel XE#2231</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=
=3D"true">Intel XE#4208</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-bl=
t:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not=
-send=3D"true">Intel XE#656</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:<=
/p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-s=
end=3D"true">Intel XE#4141</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-dra=
w-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscren-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do=
-not-send=3D"true">Intel XE#651</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1469" moz-do-not-send=3D"true">In=
tel XE#1469</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2352" moz-do-not-send=3D"true">In=
tel XE#2352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:=
</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-=
send=3D"true">Intel XE#2313</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-d=
o-not-send=3D"true">Intel XE#653</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html" moz-do-n=
ot-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503" moz-do-not-send=3D"true">Intel XE#1503</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_joiner@basic-ultra=
-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send=3D"true">Intel X=
E#2927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_pipe_stress@stress=
-xrgb8888-ytiled.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4359" moz-do-not-send=3D"true=
">Intel XE#4359</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a=
-6-size-64.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_plane_=
cursor@overlay@pipe-a-hdmi-a-6-size-64.html" moz-do-not-send=3D"true">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" mo=
z-do-not-send=3D"true">Intel XE#616</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_plane_cursor@prima=
ry@pipe-a-hdmi-a-2-size-256.html" moz-do-not-send=3D"true">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-se=
nd=3D"true">Intel XE#616</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_plane_lowres@tiling-y.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/599" moz-do-not-send=3D"true">Intel XE#599</a>) +=
1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2393" moz-do-not-send=3D"true">Intel XE#2393</a>=
) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_plane_multiple@2x-=
tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5021" moz-do-not-send=3D"true">Intel =
XE#5021</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-f=
ormat:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_plane_scaling@plan=
e-downscale-factor-0-25-with-pixel-format.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763=
" moz-do-not-send=3D"true">Intel XE#2763</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#4=
55</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-f=
ormat@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_plane_scaling@plan=
e-downscale-factor-0-25-with-pixel-format@pipe-b.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2763" moz-do-not-send=3D"true">Intel XE#2763</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotatio=
n:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-rotation.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-no=
t-send=3D"true">Intel XE#2763</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotatio=
n@pipe-a:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-rotation@pipe-a.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" mo=
z-do-not-send=3D"true">Intel XE#2763</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@brightness-with-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_pm_backlight@brigh=
tness-with-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2938" moz-do-not-send=3D"true"=
>Intel XE#2938</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/908" moz-do-not-send=3D"true">Intel XE#908</a>) +=
1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1439" moz-do-not-send=3D"true">Intel XE#143=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836"=
 moz-do-not-send=3D"true">Intel XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-f=
ully-sf@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4608" moz-do-not-send=3D"true">Intel XE#4608</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</=
p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-se=
nd=3D"true">Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4608" moz-do-not-send=3D"true">Intel XE#4608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</=
p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-se=
nd=3D"true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-full=
y-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_psr2_sf@psr2-overl=
ay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"=
 moz-do-not-send=3D"true">Intel XE#1489</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2387" moz-do-not-send=3D"true">Intel XE#2387</a>=
)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_psr2_su@page_flip-=
p010.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send=3D"true">Intel XE#1=
122</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@kms_psr2_su@page_flip-p010.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1128" moz-do-not-send=3D"true">Intel XE#1128</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-no-drrs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@kms_psr@fbc-psr2-no-drrs.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a>) =
+2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-no-drrs@edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@kms_psr@fbc-psr2-no-drrs@edp-=
1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4609" moz-do-not-send=3D"true">Intel XE#4609=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_psr@fbc-psr2-sprit=
e-plane-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">In=
tel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/929" moz-do-not-send=3D"true">Intel XE#929</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@kms_psr@pr-sprite-render.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2234" moz-do-not-send=3D"true">Intel XE#2234</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-d=
o-not-send=3D"true">Intel XE#2850</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_psr_stress_test@in=
validate-primary-flip-overlay.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939" moz-do-not=
-send=3D"true">Intel XE#2939</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-pixel-format:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_rotation_crc@bad-p=
ixel-format.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Int=
el XE#3414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2330" moz-do-not-send=3D"true"=
>Intel XE#2330</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_rotation_crc@prima=
ry-y-tiled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send=
=3D"true">Intel XE#1127</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-4/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send=3D"true"=
>Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-none:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_scaling_modes@scaling-mod=
e-none.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2413" moz-do-not-send=3D"true">Intel XE=
#2413</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_scaling_modes@scaling-mod=
e-none.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2413" moz-do-not-send=3D"true">Intel XE=
#2413</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
374" moz-do-not-send=3D"true">Intel XE#374</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_scaling_modes@scaling-mod=
e-none@pipe-a-edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/374" moz-do-not-send=3D"tr=
ue">Intel XE#374</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-1/igt@kms_setmode@basic.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13153/shard-bmg-6/igt@kms_setmode@basic.html" moz-do-not-send=3D"true">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/479=
4" moz-do-not-send=3D"true">Intel XE#4794</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4807" moz-do-not-send=3D"true">Intel XE=
#4807</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-a-dp-2-pipe-b-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-1/igt@kms_setmode@basic@pipe-a-dp-2-pipe-b-hdmi-a-3=
.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_setmode@basic@pipe=
-a-dp-2-pipe-b-hdmi-a-3.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4807" moz-do-not-send=
=3D"true">Intel XE#4807</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-1/igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3=
.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_setmode@basic@pipe=
-b-dp-2-pipe-a-hdmi-a-3.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4794" moz-do-not-send=
=3D"true">Intel XE#4794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html" m=
oz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_setmode@invalid-clone-sing=
le-crtc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send=3D"true">Intel X=
E#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@kms_tiled_display@basic-test-=
pattern.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send=3D"true">Intel X=
E#2426</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-1/igt@kms_tiled_display@basic-test-=
pattern.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-send=3D"true">Intel XE=
#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@query-idle@pipe-d-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-1/igt@kms_vblank@query-idle@pipe-d-dp-2.html" moz-d=
o-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_vblank@query-idle@pipe-d-dp-2.=
html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4892" moz-do-not-send=3D"true">Intel XE#4892</=
a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-8/igt@kms_vrr@negative-basic.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13153/shard-bmg-4/igt@kms_vrr@negative-basic.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1499" moz-do-not-send=3D"true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-vi=
rtual.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#=
1499</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vr=
r.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#1499=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-8/igt@kms_writeback@writeback-pixel=
-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel X=
E#756</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_writeback@writebac=
k-pixel-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">=
Intel XE#756</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-7/igt@kms_writeback@writeback-pixel=
-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel X=
E#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_copy_basic@mem-set-=
linear-0xfffe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send=3D"true">I=
ntel XE#1126</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_create@create-big-vram:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-7/igt@xe_create@create-big-vram.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1062" moz-do-not-send=3D"true">Intel XE#1062</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eu_stall@blocking-re-enable:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_eu_stall@blocking-r=
e-enable.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4497" moz-do-not-send=3D"true">Intel =
XE#4497</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-empty:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@xe_eudebug@discovery-empty.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837</a>=
) +4 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-5/igt@xe_eudebug@discovery-empty.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837</a>=
) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_eudebug_online@inte=
rrupt-all-set-breakpoint.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-se=
nd=3D"true">Intel XE#4837</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-small-cm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-4/igt@xe_evict@evict-beng-small-cm.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel XE#688</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-inval=
idate:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_basic@multigpu=
-no-exec-bindexecqueue-userptr-invalidate.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392=
" moz-do-not-send=3D"true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defe=
r-mmap.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_basic@=
multigpu-once-basic-defer-mmap.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-no=
t-send=3D"true">Intel XE#1392</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send=3D"t=
rue">Intel XE#2322</a>) +3 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-5/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"t=
rue">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-433/igt@xe_exec_basic@no-exec-bindexecqueue-re=
bind.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_basic@no=
-exec-bindexecqueue-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-se=
nd=3D"true">Intel XE#4208</a>) +23 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_exec_fault_mode@onc=
e-rebind-prefetch.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true=
">Intel XE#288</a>) +23 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-n=
omemset:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-6/igt@xe_exec_system_allocator@many=
-large-execqueues-mmap-huge-nomemset.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz=
-do-not-send=3D"true">Intel XE#4943</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-large-malloc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@xe_exec_system_allocator@many-large-malloc.ht=
ml" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@xe_exec_system_allocator@=
many-large-malloc.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428" moz-do-not-send=
=3D"true">Intel XE#3428</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@xe_exec_system_allocator@once=
-mmap-new-huge-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send=
=3D"true">Intel XE#4943</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-exec=
queues-new-bo-map-nomemset:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html" moz-do-not-se=
nd=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5018" moz-do-not-send=3D"true">Intel XE#5018</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new=
-race-nomemset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_system_allocat=
or@threads-shared-vm-many-stride-new-race-nomemset.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4915" moz-do-not-send=3D"true">Intel XE#4915</a>) +208 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@twice-large-new-nomemset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_system_allocat=
or@twice-large-new-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-s=
end=3D"true">Intel XE#4208</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/584" moz-do-not-send=3D"true">Intel XE#584</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-dg2-set2: (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGT_8371/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8371/shard-dg2-432/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_837=
1/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-d=
g2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_modu=
le_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-464/igt@xe_module_load@l=
oad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8371/shard-dg2-432/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8371/shard-dg2-435/igt@xe_module_load@load.html" moz-do-n=
ot-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-dg2-432/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8371/shard-dg2-432/igt@xe_module_load@load.html" moz-do-not-send=3D"true"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/sh=
ard-dg2-432/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-4=
33/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe_module_l=
oad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe_module_load@load.=
html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@xe_module_load@load.html" moz=
-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8371/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371=
/shard-dg2-435/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg=
2-432/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt=
@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-435/igt@xe_modul=
e_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8371/shard-dg2-433/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_module_load@load.html" moz-d=
o-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13153/shard-dg2-435/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13153/shard-dg2-432/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13153/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
153/shard-dg2-432/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/sh=
ard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg=
2-433/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/=
igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_modul=
e_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_module_load=
@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@xe_module_load@load.=
html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_module_load@load.html" moz-do=
-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13153/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13153/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13153/shard-dg2-433/igt@xe_module_load@load.html" moz-do-not-send=3D"true"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153=
/shard-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard=
-dg2-464/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-4=
64/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt=
@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_mo=
dule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_module_l=
oad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_module_load@load.htm=
l" moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/378" moz-do-not-send=3D"true">Intel XE#378</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-regs-whitelisted:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_oa@oa-regs-whitelis=
ted.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2541" moz-do-not-send=3D"true">Intel XE#25=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/357=
3" moz-do-not-send=3D"true">Intel XE#3573</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@syncs-syncobj-wait:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@xe_oa@syncs-syncobj-wa=
it.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2541" moz-do-not-send=3D"true">Intel XE#254=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573=
" moz-do-not-send=3D"true">Intel XE#3573</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4501" moz-do-not-send=3D"true">Intel XE#=
4501</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_pm@d3cold-basic-exe=
c.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" =
moz-do-not-send=3D"true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-vram:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-1/igt@xe_pm@d3cold-mmap-vram.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-n=
ot-send=3D"true">Intel XE#366</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@xe_pm@d3cold-mmap-vram.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-lnl-8/igt@xe_pm@s4-basic.html" moz-do-not-send=3D"true"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13153/shard-lnl-2/igt@xe_pm@s4-basic.html" moz-do-not-send=3D"true">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" mo=
z-do-not-send=3D"true">Intel XE#1794</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_pm@vram-d3cold-thre=
shold.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/579" moz-do-not-send=3D"true">Intel XE#5=
79</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@display-pxp-fb:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@xe_pxp@display-pxp-fb.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true">Intel XE#4733</=
a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p=
>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-7/igt@xe_pxp@pxp-termination-key-up=
date-post-termination-irq.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-se=
nd=3D"true">Intel XE#4733</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_query@multigpu-quer=
y-uc-fw-version-guc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"tr=
ue">Intel XE#944</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Int=
el XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_render_copy@render-stress-4-copies:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@xe_render_copy@render-=
stress-4-copies.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4814" moz-do-not-send=3D"true"=
>Intel XE#4814</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-twice:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4273" moz-do-not-send=3D"true">Intel XE#4273</a>)</l=
i>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@unbind-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2=
-432/igt@core_hotunplug@unbind-rebind.html" moz-do-not-send=3D"true">PASS</=
a> +8 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-at=
omic@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-eve=
nts-linear-atomic@pipe-c-edp-1.html" moz-do-not-send=3D"true">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911" moz-do-not=
-send=3D"true">Intel XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13153/shard-lnl-8/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-linear-atomic@pipe-c-edp-1.html" moz-do-not-send=3D"true=
">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-addfb:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_big_fb@4-tiled-addfb.html" moz-do-not-sen=
d=3D"true">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_big_fb@4-tiled-addfb.html" moz-do=
-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-192=
0x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send=3D"true">Intel X=
E#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2894" moz-do-not-send=3D"true">Intel XE#2894</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_bw@conne=
cted-linear-tiling-2-displays-1920x1080p.html" moz-do-not-send=3D"true">PAS=
S</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3113" moz-do-not-send=3D"true">Intel XE#3113</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_=
ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send=3D"true">PA=
SS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-2=
56x85.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#=
4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575" moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_cursor_c=
rc@cursor-rapid-movement-256x85.html" moz-do-not-send=3D"true">PASS</a> +4 =
other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atom=
ic.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4828" moz-do-not-send=3D"true">Intel XE#482=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_131=
53/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html" mo=
z-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-ato=
mic.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3226" moz-do-not-send=3D"true">Intel=
 XE#3226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13153/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html"=
 moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tra=
nsitions-varying-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D=
"true">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-at=
omic-transitions-varying-size.html" moz-do-not-send=3D"true">PASS</a> +5 ot=
her tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varyin=
g-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-trans=
itions-varying-size.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1475" moz-do-not-send=3D"t=
rue">Intel XE#1475</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13153/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic=
-transitions-varying-size.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a=
6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-int=
erruptible@ac-hdmi-a6-dp4.html" moz-do-not-send=3D"true">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-sen=
d=3D"true">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@ac-hdmi-a6-dp4.html" moz-do-not-send=3D"true">PASS</a></li=
>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-4/igt@kms_flip@2x-plain-flip.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_f=
lip@2x-plain-flip.html" moz-do-not-send=3D"true">PASS</a> +3 other tests pa=
ss</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp4:</=
p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank-in=
terruptible@d-dp4.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3549" moz-do-not-send=3D"tru=
e">Intel XE#3549</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip@flip-vs-absolute-wf_vblank-int=
erruptible@d-dp4.html" moz-do-not-send=3D"true">PASS</a> +4 other tests pas=
s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.htm=
l" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3321" moz-do-not-send=3D"true">Intel XE#3321</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/sha=
rd-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html" moz-do-not-sen=
d=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html" moz-do-not-=
send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2882" moz-do-not-send=3D"true">Intel XE#2882</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3098" moz-do-not-send=3D=
"true">Intel XE#3098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html" moz=
-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html" m=
oz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2882" moz-do-not-send=3D"true">Intel XE#2882</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-b=
mg-1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html" moz-do-not-send=3D"tru=
e">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@b-dp2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@b-dp2.html" moz-d=
o-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3098" moz-do-not-send=3D"true">Intel XE#3098</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1=
/igt@kms_flip@wf_vblank-ts-check@b-dp2.html" moz-do-not-send=3D"true">PASS<=
/a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscal=
ing:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-xtile-t=
o-32bpp-xtile-upscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send=
=3D"true">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-4=
64/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html" =
moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-suspend:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4883" moz-do-not-send=3D"true">Intel XE#4883</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-3/igt@k=
ms_hdr@bpc-switch-suspend.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-4/igt@kms_hdr@static-swap.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1503" moz-do-not-send=3D"true">Intel XE#1503</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt@kms_hdr@s=
tatic-swap.html" moz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2571" moz-do-not-send=3D"true">Intel XE#2571</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-=
bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" moz-do-not-send=3D"t=
rue">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send=3D"tr=
ue">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/718" moz-do-not-send=3D"true">Intel XE#718</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-4/igt@kms_pm_dc@dc6=
-psr.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-d=
efer-mmap.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"true">Intel=
 XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13153/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap=
.html" moz-do-not-send=3D"true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-mmap-remap-ro-dontunmap:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@xe_exec_system_allocator@many-mmap-remap-ro-d=
ontunmap.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3428" moz-do-not-send=3D"true">=
Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13153/shard-bmg-2/igt@xe_exec_system_allocator@many-mmap-remap-ro-=
dontunmap.html" moz-do-not-send=3D"true">PASS</a> +14 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@xe_exec_threads@threads-hang-userptr-r=
ebind-err.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3876" moz-do-not-send=3D"true"=
>Intel XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13153/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr-rebi=
nd-err.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-userptr:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html" moz-do-not-sen=
d=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1794" moz-do-not-send=3D"true">Intel XE#1794</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-lnl-3/igt@x=
e_pm@s4-vm-bind-userptr.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2231" moz-do-not-send=3D"true">Intel XE#2231</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-=
do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_big_fb@yf-tiled-3=
2bpp-rotate-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">I=
ntel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-ln=
l-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3442" moz-do-not-send=3D"true">Intel XE#=
3442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13153/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2231" moz-do-not-send=3D"true">Intel XE#2231</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-n=
ot-send=3D"true">Intel XE#4208</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mt=
l-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send=3D"true">Intel =
XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-mtl-mc-ccs.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz=
-do-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen=
12-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Int=
el XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787" moz-do-not-send=3D"true">Intel XE#787</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_ccs@m=
issing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231=
" moz-do-not-send=3D"true">Intel XE#2231</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#=
4208</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-re=
solution-4k.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Inte=
l XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13153/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-=
4k.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575" moz-do-not-send=3D"true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@kms_content_protection@atomic.html" moz-do-no=
t-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt=
@kms_content_protection@atomic.html" moz-do-not-send=3D"true">TIMEOUT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4862" moz-do=
-not-send=3D"true">Intel XE#4862</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@kms_content_protection@srm.html" moz-do-not-s=
end=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-4/igt@k=
ms_content_protection@srm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-se=
nd=3D"true">Intel XE#2341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p=
>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-befo=
re-cursor-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send=3D"true"=
>Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13153/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-c=
ursor-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">In=
tel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575" moz-do-not-send=3D"true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2231" moz-do-not-send=3D"true">Intel XE#2231</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-no=
t-send=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/igt@kms_dirtyfb@psr-dirtyfb-io=
ctl.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" =
moz-do-not-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_flip@2x-flip-vs-e=
xpired-vblank.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">In=
tel XE#301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interrupti=
ble.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3321" moz-do-not-send=3D"true">Intel XE#33=
21</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
153/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt=
@kms_flip@2x-flip-vs-wf_vblank.html" moz-do-not-send=3D"true">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-no=
t-send=3D"true">Intel XE#2882</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-d=
ownscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-=
to-32bpp-yftileccs-downscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not=
-send=3D"true">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32b=
pp-yftile-to-32bpp-yftileccs-downscaling.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"=
 moz-do-not-send=3D"true">Intel XE#2231</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4=
208</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rccc=
s-downscaling:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tiledg2rcccs-downscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380" moz-do-not-se=
nd=3D"true">Intel XE#2380</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg=
-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2380" moz-do-not-send=3D"true">Intel XE#23=
80</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscal=
ing:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp=
-ytile-upscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send=3D"true=
">Intel XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2380" moz-do-not-send=3D"true">Intel XE#2380</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@k=
ms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2293" moz-do-not-send=3D"true">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380" moz-do-not-se=
nd=3D"true">Intel XE#2380</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscal=
ing@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp=
-ytile-upscaling@pipe-a-valid-mode.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-d=
o-not-send=3D"true">Intel XE#2293</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-6/igt@kms_flip_scaled_crc@flip=
-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2293" moz-do-not-send=3D"true">Intel XE#2293</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5042" moz-do-not-send=3D"t=
rue">Intel XE#5042</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-r=
ender:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur=
-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"tr=
ue">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscr=
n-cur-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=
=3D"true">Intel XE#2311</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-r=
ender:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr=
-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"tr=
ue">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13153/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscr=
n-spr-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=
=3D"true">Intel XE#2312</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt=
:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scnds=
crn-shrfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send=3D"=
true">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/i=
gt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651" moz-do-not-send=3D"true">Intel XE#651</a>) +1 other te=
st
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-=
indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=3D"tr=
ue">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn=
-cur-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=
=3D"true">Intel XE#4141</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-bl=
t:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-=
indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">=
Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13153/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur=
-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=3D"true"=
>Intel XE#4141</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrf=
b-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">In=
tel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Int=
el XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-=
indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=3D"tru=
e">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
spr-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D=
"true">Intel XE#2312</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-mov=
e:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pr=
imscrn-cur-indfb-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"=
true">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13153/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-p=
rimscrn-cur-indfb-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send=
=3D"true">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) +3 othe=
r tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-dra=
w-blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-=
pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"tr=
ue">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-prim=
scrn-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=
=3D"true">Intel XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-=
blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
indfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"true=
">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndsc=
rn-indfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"t=
rue">Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>) +1 other tes=
t
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaled=
primary.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"true">Intel X=
E#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5042" moz-do-not-send=3D"true">Intel XE#5042</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-2/igt@kms_frontbuf=
fer_tracking@fbcdrrs-shrfb-scaledprimary.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"=
 moz-do-not-send=3D"true">Intel XE#2311</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tilin=
g-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2231" moz-do-not-send=3D"true">Intel XE#22=
31</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@fbcdrrs-tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658" moz-do-not-se=
nd=3D"true">Intel XE#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onof=
f:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-c=
ur-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">=
Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
cur-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true"=
>Intel XE#2313</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-b=
lt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri=
mscrn-indfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send=3D=
"true">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-p=
rimscrn-indfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-se=
nd=3D"true">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) +3 ot=
her tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw=
-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri=
mscrn-pri-shrfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-s=
end=3D"true">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg=
2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/653" moz-do-not-send=3D"true">Intel XE#653</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw=
-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-p=
ri-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"=
true">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13153/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri=
mscrn-pri-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-s=
end=3D"true">Intel XE#2312</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw=
-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-s=
pr-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"=
true">Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-bmg-1/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">Intel XE#2313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onof=
f:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-s=
pr-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">=
Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-=
spr-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true"=
>Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5042" moz-do-not-send=3D"true">Intel XE#5042</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8371/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indf=
b-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">In=
tel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13153/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb=
-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">Int=
el XE#2313</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-no=
t-send=3D"true">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_plane_lowres@tiling-y.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +1=
 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.h=
tml" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4760" moz-do-not-send=3D"true">Intel XE#4760</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/=
shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">Intel XE#2850</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not=
-send=3D"true">Intel XE#929</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-rende=
r.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2231" moz-do-not-send=3D"true">Intel XE#2231=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
 moz-do-not-send=3D"true">Intel XE#4208</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@kms_psr@psr-sprite-blt.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2231" moz-do-not-send=3D"true">Intel XE#2231</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=
=3D"true">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13153/shard-dg2-435/igt@kms_psr@psr-sprite-blt.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850" moz-do-not-send=3D"true">Intel XE#2850</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-=
send=3D"true">Intel XE#929</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic-fastset:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@kms_vrr@flip-basic-fastset.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432=
/igt@kms_vrr@flip-basic-fastset.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-n=
ot-send=3D"true">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575" moz-do-not-send=3D"true">i915#2575</a>) =
+1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eu_stall@non-blocking-re-enable:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@xe_eu_stall@non-blocking-re-enable.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4497" moz-do-not-send=3D"true">Intel XE#4497</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/sha=
rd-dg2-432/igt@xe_eu_stall@non-blocking-re-enable.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-parameters:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/=
shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-empty:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@xe_eudebug@discovery-empty.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-4=
64/igt@xe_eudebug@discovery-empty.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do=
-not-send=3D"true">Intel XE#4837</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-de=
fer-mmap.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"true">Intel =
XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13153/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue=
-userptr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel X=
E#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13153/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>)=
 +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@xe_exec_system_allocator@many-execqueu=
es-mmap-huge.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13153/shard-dg2-464/igt@xe_exec_system_allocator@many-execqueues-mma=
p-huge.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4915" moz-do-not-send=3D"true">Intel XE=
#4915</a>) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-many-stride-malloc-race:<=
/p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-=
stride-malloc-race.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4915" moz-do-not-send=3D"tr=
ue">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13153/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-=
stride-malloc-race.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"tr=
ue">Intel XE#4208</a>) +35 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541" moz-do-not-send=3D"true">Intel XE#2541</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573" moz=
-do-not-send=3D"true">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_oa@closed-fd-and-=
unmapped-access.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true"=
>Intel XE#4208</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@invalid-oa-exponent:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@xe_oa@invalid-oa-exponent.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-43=
5/igt@xe_oa@invalid-oa-exponent.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-n=
ot-send=3D"true">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573" moz-do-not-send=3D"true">Intel XE#3573</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/=
shard-dg2-464/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733" moz-do-not-send=3D"true">Intel XE#4733</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-terminat=
ion-irq.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true">Intel X=
E#4733</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13153/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_spin_batch@spin-mem-copy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@xe_spin_batch@spin-mem-copy.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4821" moz-do-not-send=3D"true">Intel XE#4821</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-=
432/igt@xe_spin_batch@spin-mem-copy.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-=
do-not-send=3D"true">Intel XE#4208</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disab=
ling:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-r=
eleased-on-vfs-disabling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-do-not-se=
nd=3D"true">Intel XE#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13153/shard-dg2-432/igt@xe_sriov_auto_provisioning@res=
ources-released-on-vfs-disabling.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208" moz-do-=
not-send=3D"true">Intel XE#4208</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-twice:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8371/shard-dg2-432/igt@xe_sriov_flr@flr-twice.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208" moz-do-not-send=3D"true">Intel XE#4208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13153/shard-dg2-433/i=
gt@xe_sriov_flr@flr-twice.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273" moz-do-not-se=
nd=3D"true">Intel XE#4273</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8371 -&gt; IGTPW_13153</li>
        <li>Linux: xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320
          -&gt; xe-3116-45abc70af791052c25beeb400aece4dab51020cd</li>
      </ul>
      <p>IGTPW_13153: 13153<br>
        IGT_8371: 8371<br>
        xe-3115-45c2c8c74ab88c8fb741ea8349b051f5aec87320:
        45c2c8c74ab88c8fb741ea8349b051f5aec87320<br>
        xe-3116-45abc70af791052c25beeb400aece4dab51020cd:
        45abc70af791052c25beeb400aece4dab51020cd</p>
    </blockquote>
    <br>
  </body>
</html>

--------------GpcRFMM5z6ELHghpU4VYjvTe--
