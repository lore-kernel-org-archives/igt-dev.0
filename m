Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6874DCAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 16:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1722F10E867;
	Wed,  8 Oct 2025 16:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fldlYc7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870A610E86B
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759940738; x=1791476738;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GjnzpVDpOzPvlPidsdbKdBincxOiooBe1CVEDBo9Bmw=;
 b=fldlYc7qbbvBYHeJRINWWUa3Ni/V3bDIsqIy98bB506Zx7iCGdCJBpCH
 p3IH/J+JtANLU8abmmWhDUZhh46gSpy7FJoLmJYsf1i7BZy5MVO/RFDk9
 bkm3NWVkNl4TiIS5/5Enx4qTJzJZh7n7HbocL4fOvASVaEj6uvXiZCm8U
 vqUKwAH3QRelhQmqFuY/6Jw5NCPB58RGzxWJMnnkLsapjaPaHpZdBJDUE
 jiAyKSTv0sVGZY40PJkvvn16GvN2oESqdFef5zKcKWlGUlhaL45bWz3wZ
 QYUaak4L0pabEBRIYjm0vhquhOJrEflIrwY2GmMzXZ/rb1PLtkNk4R333 A==;
X-CSE-ConnectionGUID: 18Cfj5ZBQDOUO+OMejPFIQ==
X-CSE-MsgGUID: Ae0j5BFKQ/aOTDhrnzRe/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62304346"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="62304346"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:25:37 -0700
X-CSE-ConnectionGUID: e4k/jxRvQ7K9RYQhyzy4Fg==
X-CSE-MsgGUID: q7H+WPIfS9uCrnnlfVSV1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="185770466"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:25:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 09:25:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 09:25:36 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 09:25:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lD4UXgyriq15X8BNVJjHdSpTG9cOJyhEHqbz9sOar7XYwglm8UmfSnnHjM7NlyS2AmXywv2qcARB7Pmft3pwr+YVPYl7xTIVaQmYEE9FeQPIZdKCTdwD5W04E6tUPitNTOoaudQqbS0l7wWh7yfYhDrEdc6ZzGahICxCIo+ME5/YyLAJA0t6/dziuMw07xQ1Fz2EZMy2gPa2JcURsUh0oMRHXKLBjA3UOvTNZgkevHZ8u96boeyMUccjTtMv04xf3i8y9fKUulL3mQ8V/OJ8xGrW1tU7zthBRc0I/0JJXiUByYbTDHO4wgxteEK05TOpfDbJAexmPwh9cQTdAo+A9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwBoOGgpJza7cpS8+UyCPewvkkfR3Lp7bawAE29hTPo=;
 b=Pk1U7U/bTkUqYxCwszKLIYlR7tMaTiXFN0MwJMjnKiLXPmr9uMTAC5WKS1KR/zyr/BdTvwE/9/2QApKQM1TKGa3Ne1JMNVpX5Fw3O6HUDrT+HXJYAhsOcRSrfA/TYqQtnM0z36Q37jJPKOTWm46my30OxBBa7z40Gk9Rpd8Kef2nmExtf0h1YcXxJhdC4TxWKWlZRwG40MY6nz3fI3rk8CAh7fk29IPKiv2jGBSHMh0rjyBvX+YFUuzq4Lw2MQl655y9wn/3+1iT2ItE17SzY9nS8yZbieHZ99puRGZCUkxtm+iSr785XnBpYuO2t8ajC98/EeSOQUsBhnY+Fv3XfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA1PR11MB6920.namprd11.prod.outlook.com (2603:10b6:806:2bb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 16:25:33 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 16:25:33 +0000
Message-ID: <243c339e-7e62-46df-968f-62e70429bd74@intel.com>
Date: Wed, 8 Oct 2025 12:25:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/intel/xe_fault_injection: Set guc_wait_ucode pf
 only
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <lukasz.laguna@intel.com>,
 <marcin.bernatowicz@intel.com>
References: <20251001151857.104568-1-zhanjun.dong@intel.com>
 <20251008154250.cpg7bsj4vdy23woi@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20251008154250.cpg7bsj4vdy23woi@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0372.namprd04.prod.outlook.com
 (2603:10b6:303:81::17) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA1PR11MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 103e53e3-8860-4f71-1870-08de06874e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDhUUk5saWJZSzk0VWNra0NQeWdkTCtUQytnTmg3L2Z2Mi9BWktUYkpDVWdy?=
 =?utf-8?B?eWVSMjc0RFpLWlR5V1drQjBUOGRnQ2krSlh0WllDQVhyRG1QREFVNXhaaUxo?=
 =?utf-8?B?Q1JXeXcxRmY3Uk13NU5YS2NwUzJLdXdsUDlveDA0MHFxMjNSUEVxQnltRjZN?=
 =?utf-8?B?R2h2M1BxNkFuRTFleGZ4a292emJyMWVoWGJDNGRFbkhHUk5IUVBuTlRDQTBK?=
 =?utf-8?B?azhZZHJZVFp2Q3RIZHFraDk2bHhBVEFRSkRqc0dYSGgzOG1jTUk0ajdlOWxm?=
 =?utf-8?B?YXdNbGYybWlGQktLdU1rTm85aVd6N0RwNEp4UXN4TTBlSkxuMHBmaXNOZTdz?=
 =?utf-8?B?YTA4cjRTaEtoOU96MHBVeXpCVlJiL3BUQjNuU01NQnJjWFpoTEZjZ3FmcmpO?=
 =?utf-8?B?Y3RjVDM2SFpVN0dSMmpCd1BGVjM3d3JJUXFPYXpka3g0MFZJQVlKbHFKT0lh?=
 =?utf-8?B?WlJQanl6WnoraThTT0kwRENEU083bHNJZFg4YW5TZ3htVjZ4Z2pHbHlxUG9M?=
 =?utf-8?B?UzRpSUdyKzBFZFdLc2lmdXpaWEU3aGwxWGNSSG5GMXJ2VkVpcW9reGo0T0pK?=
 =?utf-8?B?RmI2MERRem9oWUZjWWxvT29hQVhTK3c4cHV2ejZqSGpXZzBGSHZiTGplejVD?=
 =?utf-8?B?UkJ6SFQ4TFBuSlNkcHE3ZTZ3SWhQZm1NV01DTTIxYWFqbGxDVGhEc1FpS2lJ?=
 =?utf-8?B?eTRQakg1NkVXN1BHRUFuVDdwakRXNVRrajdSSnBuUzRnR2RtN2JiN2hQRWxS?=
 =?utf-8?B?RHBkUWhHSUNxalNwS1NPeFIvbTZqMUV3NHplakFCclI4MnV2RTJiamEvZFVW?=
 =?utf-8?B?YTBrcFdEK3JZYnhUb1Q1cTBxY3FIMW8vSUFkN29ON1ByZU1XVVB3UEszTnZK?=
 =?utf-8?B?VjYwbzh5bG9TTy9tWTBsSGFaNFJNV1lwY0h0NnkxZWQrenYyL1pLUUkwUU9q?=
 =?utf-8?B?NVN2OFlOZFNTd2lQbW1yeERQbzJpQUs2ZjdRMkZDZnlCcEVsSmhVcS8rVkxC?=
 =?utf-8?B?bjJ0WkJ1d1ozVHkxYmFpcDJuazZxWEJaWkkzb0JLd0ViemFlemE4Unk4U2NX?=
 =?utf-8?B?aHd3ZXIxNEpjWVJWTlhVRHhXc2piNnNnMXhpL3J3RmtmK2tIVmhyNmx3dGU5?=
 =?utf-8?B?WWt0eW1EYUwwYUpBZW1sRzFJTGVLc1I2dU9aMW9kZWZqbzJmQjV3UnhaVmlY?=
 =?utf-8?B?aHdaYTMxbjNOcGw2S0VnR2tZNVdGVkpJaytsdTk3MER6a3RRS1hnb3lqaFNk?=
 =?utf-8?B?Vm1FT0pPcmQ4aWNvU0VpZk4ybkhHS1NaaUlHWlJjeWF0ay82N3VkcTJ0UWJl?=
 =?utf-8?B?Q2tQMjJzV202Sm9mT3Z0U1J3Y0l6Z0wybUpFY0lObkNSS0lkMHlRK3NOMFZo?=
 =?utf-8?B?Mm5vSUR5VWVJSGVUNzU0N094Z1NCeTdIQXE1OURSQUZ3VFljTXFmS0FSdHZr?=
 =?utf-8?B?ekphQ3RpMkk2WlNneFpsV2swa3c0Q1d6dXlWWDJpeW51cUQ2VElYZlZxQUNh?=
 =?utf-8?B?aktpMnpFUTZRLy9vR1RCaTZDcm0yYjZSWWh3b0d4WkZvQjA5WUlGQnd3Ui9v?=
 =?utf-8?B?Zm9BWGtUTDQ3aEx2a2E1TlYyb3hPMTRBcWdrUTZrU0ZNUTlqbXU1UzlHM2o5?=
 =?utf-8?B?a3l1aWlTYTNGdlJTdGhmMlBsajF2ZUZKRjRscUFtclVsNjUyb3VxMHFvbVVI?=
 =?utf-8?B?OWg2TXhDbFVEdlBkRFE3N3Q0R3VPdG1YNDE3aUdFN1kwcWZsNTBwOGUxdDBT?=
 =?utf-8?B?YlQwS0JVTnNvVkZYYXdlQUMwOVdXRnJBbUhaL0VPYXJOVm9ZdktqNWQxVTdD?=
 =?utf-8?B?M2w0UTBFaDZNODFUbm5vUXpMZXhHMXFORjdCL0JYZnFCRHpVMG5lWVUrZDVK?=
 =?utf-8?B?TTQxT1VPQ2JJWVZwSWxuc2ZhaXBYNjhPWThnYjlJd1JsK2xyUEdNTERUWEJy?=
 =?utf-8?Q?iBOCYmcKVCAAJlAGeVKRE0eNFL5af1FR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SThvalk3TWRHZnh3TnZGckVKb1BIcDZCSHh1VEJOSk5VVUFBU0xiY2syZjdu?=
 =?utf-8?B?Z2ZQbDlwV2FieWtFc3QyOTZLcXhVb0VITTNLRG0wUVA2dGllQmFYU3kyZndP?=
 =?utf-8?B?L1NlQTRxTzNPS3p0OUVub2ZOSWt1TlIwbUxBYStveDdIRU9zekE2SnIwTnR4?=
 =?utf-8?B?YStka2hBay9OTC9JZzJxVGJCekRscCtJdTVCWHZDSlh3VHFMYldVVlkwZ1lp?=
 =?utf-8?B?NHk4OEoyYVJ4VWNFa2ZDbENpYkI1bHIyMUFsRUxEQzg4K1UrUW1nbklweHFi?=
 =?utf-8?B?ZExsMFYrSmpxTFZQcFloYTZ5Z2JMNU56a1Z1OXI5R0RaMmFHQkM4cEFNV2Ny?=
 =?utf-8?B?YXRiRHJqU2lzWkUvek5hNmpBaHZlWTdBSm9EK2o1aGlmY0RqYlRvN1hSOFRS?=
 =?utf-8?B?UFVVTjZpcGZGbWdkcXRVWUNRdFVGZ2JNNHYxMUxCRGRCeThLVlRDc0QyN21m?=
 =?utf-8?B?bVRGbzZBSzF4ei9Fa1ZCeWQ1S3RlNlJoV1BFekNJSUJiYzd3MUNDWkdnZnNn?=
 =?utf-8?B?YzJlNTE5VHNMYW9TdWc0Z1BnUWtrNFo2ODVpcjNieVBsY0w1ZmwxeUgzWSt2?=
 =?utf-8?B?dnJGUTlmeGwzRmhwMEVPWWlKOTN5N0dESlQySnhnc21GaXlhWlNFNmIwUlc5?=
 =?utf-8?B?eXlOSVhOK1krYWJDUDRFZUt6R0QyS00xR0FXRVVkTlpPOThyYzVpaUVFWUNp?=
 =?utf-8?B?eGVBT0ttYTlQZFhaZ1J3TisvbDZJZ3h5WVo4RnB5OTE4RlRwR1hkT3BMTmhh?=
 =?utf-8?B?a0pKN0VKVlJGWWhYdWhyeFdISlJ3dmhWZHpOMnRKQ0RsUXRDTVdyTnNEZXBU?=
 =?utf-8?B?UHMxclV2d1VFNForK083Z214NXVOR3RFVjVkbWlnc3FWdnhHYjkzVUdGU2Fu?=
 =?utf-8?B?VzBrMVNJcXNBVHUxL1RuZXlCS2IrMnQxMjh4VjMrcHJGc2UwTTUxQmQ5amNY?=
 =?utf-8?B?SmowN0EyRFFESWJLK2Vxd04xSmhUQkU5dHNjUHBRd0hpTlB4T3JKUGU1Qjky?=
 =?utf-8?B?LzlJOTRyWVBibXgyMmV4UDZMdWdUbCswYStpL1JoeEl0cyswT1V4bGdvdnMv?=
 =?utf-8?B?Q0k4UGdUVGZ1Uzl5ZHNTV2FncDNDdmo4Y2ZMU2pOOWpHdkZpWWFYcFVVZlZI?=
 =?utf-8?B?RWQwMVVwZ2ErNmQrOXRYU3krVFpSVk5jRUVUcTJRUHdGRXBwN3RrTDBFNGJP?=
 =?utf-8?B?bzVzNFhyRWwrTnFmT1l2MGZTSnRKMFhBbEZuNUZEM2VlZnZOaXNUS1l2Y3pQ?=
 =?utf-8?B?SkFpczlPOHpidEhNL1o4RS9zbXhwYkdSc2dQMmhvNGtLMDlUNWk5VU1nQ1VF?=
 =?utf-8?B?cDVsZDB1dFovTTcvbGdWNzNXNHJQcGVsL1pKdW5BeXpaMEtnbHcwT3o1K0JX?=
 =?utf-8?B?emlBVEFxcXkwL0VIcXJLMXI0RUczc0hhNWRSU2JmS3kwdnV4QjNFUi9HZHVP?=
 =?utf-8?B?MnB4b3hPQVhvM3E0dkovT05pZ1E4TnluS3d5MWVzdythcGlwY0VvU2NiOHZW?=
 =?utf-8?B?R1lFUWhBNXRYWkFWU3N5eC9Hd1NqanNTUDdXbDRQQ2RxSzgzUVkrNXQrQnFW?=
 =?utf-8?B?a1ZDbEdIeVYvM1MySmJodjljZWtIV0diSGhpVG10aFBSMlBDOTNSamJubVdY?=
 =?utf-8?B?T2hDK0Mxcy85MmFjdjBIa0wyRzI1UUorcG5DcktwR3duTUZsd0ZvVUVacWVP?=
 =?utf-8?B?d0wrNTZDTkNwTXdtQVlzbnJ0bmV5eVNlL01PZDVMb2RtcXdjNVhlWHNGdGIr?=
 =?utf-8?B?aTFORG9EWHhwaGhvYXUvZHEwN3hVaVBpdWxiYzYvODhmd0RCRFlHQzlSTlli?=
 =?utf-8?B?YVdrU1YwTzExVWw0bFFETUIrR2dOZFRRL2dZd1RQTlg5c2J4LzBpNGRCaFpi?=
 =?utf-8?B?b0FsajNuUFVXQXJCVUZTL2RWL0Qxc1dmWjJiUnVVVFlMN0YzbnlNaGhWUGpt?=
 =?utf-8?B?OG1rbEhMUlNIZDZmS2J1a25INkR1OGVJQ2M1c25HUTRaUytHcXJRYlNWRlUr?=
 =?utf-8?B?dEx5UUZKTHppWkk4bEttNnM3bkRWTmNoV0p0eGl0ZzUrdGhsazM2d0JDdFVD?=
 =?utf-8?B?ZjZldGpubmtwb1hiS1lrdzM2NUxDZ2JJNklUd1VYU09Wdnc5Nnp2RlFxUVFU?=
 =?utf-8?B?SnJWeFNVQnlwN2RvL09qbkhmZVAwZWV2a1ZOY3FxOUU2VjJKNkZua2N1YnlL?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 103e53e3-8860-4f71-1870-08de06874e22
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 16:25:33.6385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EkxF1kfrbkkiimszbSu4Vjn3+8Lw0C1v36t2xBsGYbryW8Ubu+pW4Od3jHEvoiS3S/lfArnRDwK+UXYdCF5Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6920
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



On 2025-10-08 11:42 a.m., Kamil Konieczny wrote:
> Hi Zhanjun,
> On 2025-10-01 at 11:18:57 -0400, Zhanjun Dong wrote:
>> guc_wait_ucode is pf only function, set the flag to run normally in the VF
> 
> s/normally/it/
> 
> Did you mean 'to not run it in the VF'? Or in other words:
> 'to run it only in PF'?
Yes, I mean to run it only in PF.
Form other hand, if CI can put this test in PF only test, maybe this 
patch is not needed?

Regards,
Zhanjun Dong>
>> environment.
>>
> 
> +cc Lukasz and Marcin
> 
> Regards,
> Kamil
> 
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   tests/intel/xe_fault_injection.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>> index 9e98b3ada..5fca9aefa 100644
>> --- a/tests/intel/xe_fault_injection.c
>> +++ b/tests/intel/xe_fault_injection.c
>> @@ -548,7 +548,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>>   		unsigned int flags;
>>   		bool pf_only;
>>   	} probe_fail_functions[] = {
>> -		{ "guc_wait_ucode" },
>> +		{ "guc_wait_ucode", 0, true },
>>   		{ "wait_for_lmem_ready" },
>>   		{ "xe_add_hw_engine_class_defaults" },
>>   		{ "xe_device_create" },
>> -- 
>> 2.34.1
>>

