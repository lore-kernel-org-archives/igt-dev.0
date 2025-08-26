Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0851CA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 11:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4067010E0CD;
	Tue, 26 Aug 2025 11:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9c2QDXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE1C10E0CD
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 11:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756209205; x=1787745205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xZSSvGnWJ647Ze6fjkRVpTSvKwUy2SDQC9EaMAjvLYY=;
 b=N9c2QDXL3PwfY+8tPkhsRQBZqOr2ZpUuls4zzl1P24yBZaLXZdMGFNK7
 FRM/FBDBM1My8ghN2NAcPwcu2HmeL/hUbWzX6tp9x5Q1KvPRF8ZZpx5pi
 5N7jkiltpAySOf+WLASKVWaB1RxmYzizlmIgXTdT6N8WBDF3fYWiaG891
 BYbVEYohzwYXpqM7r/PGlMPYRbsnyV4ScEt+M/ss3xzUyUd7nXtUnV2Cb
 hO2TXIz0rJN1++hWnpDSVurIbVzZjjKWLVOQzhzTt27yg/c5cN6uo1tLX
 jUjhgyyU8iEZrHK/w60zT2qi9APNnp88Am/LbuHOv1gQc99RCkNMM+LpL g==;
X-CSE-ConnectionGUID: Q5YP1XvNQaSmhbtnYQPBQg==
X-CSE-MsgGUID: OlU+Nv95QE+CGg4I1SLLng==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69876891"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69876891"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 04:53:24 -0700
X-CSE-ConnectionGUID: S8cBwKBPQQqbnMSKQSf8zQ==
X-CSE-MsgGUID: kv6VHazaQ6SgGrbtjn2lbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174861736"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 04:53:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 04:53:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 04:53:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 04:53:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7F3Q53DzdcQ9v73AmTMxT5S2YjXBsZzKWGwPASo6ZKupA3BfkC6aPeCnPj9kn6Hszt1502pc+sbnmczVf2sPcmxgY6EiL8AODRZDFErw4TI3HcaCpirgOwC5P7IVvATdgHjukb/fj2XRV2aqmkBJCEFS5k3PtUNeWPWXz8dCt8/2RRXzZ+HdZz8zch84gvFPq0CsR3rs+HbNOzLZ8JRCykIpb2ZkIJTVD1PR41bdlV/rD7M9SCe1wCIhHYLLKVTsGtFIsiyUz8vMUV880DWuB9A742AuV8SzBu84H4975hPvu8c4ZG3m9TqleVxxvY+QsbCWL3XlRSDnEUsoJ/ihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ax11DznbeY4GMLpbsd4JEmJj7ypQLgx1uwYtuXSb/YU=;
 b=AlIPP/4Rj3JZ8Fo06EnS0xhGMEGPUJ89dKhJWtalRCYvSCkysRTUGHEghP07d/PUAY8v4eJA89A79e6+Ctsza+gA81a6s1bR7S6CAgD/IcwtrIDrE16Eb5ba1DkIjvgpxJfmyBZnvZ7Bzn+w7srcAxZwFEmReJ7Jdx9JU9cr8CwfiPgzjwWyB6JeWluRmnYV8W5tY2qz+0EuXXcJCLm9Htitxk6bANmpmLj5bCDNIx7c6rx2rhRswxaxSCBgH2fq2PfSpJNtcUJ5SC9s2co9CkMR+c6RZUZt9E1WkNo/r57Y1wLcbHBcm5oUaNfOwc/BVNOxsiqvPDcUXjrDuOTmbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 11:53:19 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 11:53:19 +0000
Message-ID: <16f6dde6-cde1-466a-964f-5d1afdd7d3d5@intel.com>
Date: Tue, 26 Aug 2025 17:23:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 2/3] tests/kms_hdr: Set HDR meta-data while
 testing for panel capability
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250821093511.937552-1-chaitanya.kumar.borah@intel.com>
 <20250821093511.937552-2-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250821093511.937552-2-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MW3PR11MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c25ad7-8072-4c37-02ba-08dde4972685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVVqTFB1ZTVsYnhkRENibDIveDNlSm9pS0pYSEJBVXRlclJNNVlpYVZJMmto?=
 =?utf-8?B?MDc3VldLckxUL2lYRitnRXREVzRDZUJzT2YvMWZYcEY3aFRvMEFJUzBUSTBl?=
 =?utf-8?B?dmJCR1hFODRWM2pCcnI2SHE1Ukc1RDdIVXZwSXkvTWVFdWYrOWY5azU2YUJp?=
 =?utf-8?B?SUcyS1BMVEhoREZRUmJrajhZUUZ6NXdXQ3J5U21VbWVFV2hzWktHb0YvTDlD?=
 =?utf-8?B?RERId01UcGpqWUdhQ1pnYlJMTmZUL29mZExXYXVLdFdYT3hFT2FFdjN4bWdu?=
 =?utf-8?B?SDhBSzBESmhsTG5aR3V5TGFsandGbEc2MDJqdVk0RjYwZWdVSEx4VFpkcHpP?=
 =?utf-8?B?YlVtMDBUUFBROEg5Y1JxbkJxdlNncCt5S0VadHY5QUhORFNwUUdUY2JXSjZP?=
 =?utf-8?B?Q3piclRyak1nQzB0bXNnSTZ2cXh3dWNzUWJ4Qjllc1RDbGpaanRTeFZZZW9u?=
 =?utf-8?B?b3VYWEl0WWdxTW1CT3ZSc3Z4VkxUaEpqK0l6Q3UvVEJST2RmZFZLd0E1ODFV?=
 =?utf-8?B?UHBNemRzcDBHOU9XT3VQUkd4dVVuR2JDU1V0NlhES1hQY3RZUWxlRElVRU5S?=
 =?utf-8?B?S2xmS3IwNHNISmZuYXNnVm1nWE9QZkNVRm5jcGZLN3hiMFB0NUNTd2NNSEpw?=
 =?utf-8?B?M1hMQ0NwSXpxQURTazRuVFN4aGlXanZ5TnpjRE45L3g1ZTAzdzNFc0RNTmdI?=
 =?utf-8?B?VG5UMnhRMElyYUNoYU1hZHg3Z2twM2hubG03d09PQ0RSZ2pyYzBObkFQTmpD?=
 =?utf-8?B?azI5bDRoY0NVejBRd1ZoS3F5R0xtUEJBZHc5cGpzMitEdG1DTlJudTdIby9Z?=
 =?utf-8?B?UkpWbXMzUi9BTmh1VmQrdFhCU2VMZzBRWmw5c2p2cURJS0s3cHpmYzBDenpR?=
 =?utf-8?B?cjg2dFI1T0hFTWF0ZG56eHJ6bStlNFUxSGtEanFOeWVJRDJYc2g4ek9INGta?=
 =?utf-8?B?TGo2WmJOOUswdnhkZC9xSU5xNEtWc2tocnRwQWY5WEo0TUlRenhSZjliWkRI?=
 =?utf-8?B?dmZHbzZWMkgwemxKR1NGM2JUQ0NzTEZSTUp6VTR6ODBFWmpPQjVxQ1J2ZjRD?=
 =?utf-8?B?YU5MWVR1cHRqRUpwOWFiQ1RoQ1NHWFlKV3BZSFNnM3NDWCswN1Vtb3RjQzIw?=
 =?utf-8?B?ajI2SVVOR3gwMXQrbUhlVU8vOTU0ZjN0T2ptSHRCSjlpNDFUVlhpVXk1Zi9O?=
 =?utf-8?B?VnQ0N1R2SGNEWmpTaG9mRlJKck01L283YWt2WmxjelNpTVVCdlZ1N0RMdmNU?=
 =?utf-8?B?VnkxRk1EaWpmM2Y4b2RGQkRtcWV2dmNsTFpoeHdrVW14Q2J2U3pQbDAvU3px?=
 =?utf-8?B?c3Q4NWhHYmpsSnN3ZjJRVHhsQXhmaTN2OWFld1ozWHF3OUV4MWJmdWlrd0Nt?=
 =?utf-8?B?QitFbVBKKzBqL2hxUDhqQnV3NXBITkVENk9SN25QQXg2eVQyV25NUWtQWFJs?=
 =?utf-8?B?bmJtSGU2bVNRelIyYS9vQmpxcW1XTXVoM1podFh6aWF3Z3VQYi9vSUdDOVJq?=
 =?utf-8?B?Tnl2aGx3bC9CaVJ2M1V5UVFmQk1ZTW8zZGxnNEFrZUlZSGNnQ3pUZndyS2NZ?=
 =?utf-8?B?U0JVWTVPcHRDUlRIMjBuUGZCVTc0b2F5RXlPYk5lTFFTS2prRm5vUUxXSEN1?=
 =?utf-8?B?QWtITjhEL0VWVzc0R3ZlWHpjNkJINHlxNjRkbXI2OHhNZ3p6cEhEeDQ1cC9l?=
 =?utf-8?B?UGRnb3IxR0V5RncvemxpVVdhUDV5L3crdG42TVpxQkxDejZPS3YzaUEyYzV6?=
 =?utf-8?B?TFFNMmtWTDFIcW9TYTVqVXJLcGZ0dkxlczk0MStXV0tyZE5vNzZjTmFtQUxM?=
 =?utf-8?B?TWUyWU1iaklFemFaclFpaFNrZU1hQm9JOGNCM1FCd1RhZEZ4c00wMk0wdVB2?=
 =?utf-8?B?OVZvV0ROZjdUNkM0eGtHbjlOTEtRZHIwMUNEbEVhWWFDeTFBWFhQY1VFNmFO?=
 =?utf-8?Q?XVdafXADRCI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUY0WFhhNm9leCsyemNncWx6dGFTWlptYWd6a0VtOXZTN0w4UWVnN013VlhK?=
 =?utf-8?B?SENuY1JtWmJKY1B0L3BlUTFpMTdiVVRwMkRJR3h6S0FaR1lDTldIUzdpZ04z?=
 =?utf-8?B?YVo4b1NTUjZlQnNNQjh0ZHlPcjBTM1ZzSWx4anVvV3JDUytSSmtCVXEyUTBj?=
 =?utf-8?B?QkZkL1BhQkpMNFBvWnhjR1RzNjJDTEZQS0FhMDNGamhJbGlFdjVYb2NONWlE?=
 =?utf-8?B?Q1BZcncxVU9aQXdTd3Y1S1NGeFVGbDg5WC9HWVhhMXI4YzVkTjdER0pWSEdy?=
 =?utf-8?B?dEFKalhKdHhUTW1aY3RhU3ByR3A3dGYvVGxzOHhKTCtvcFJRekthTytFdFVU?=
 =?utf-8?B?YWZHb2h4SFNBUFdUTHQ1Tng2ak5IWG5SaFlDdm5ibmk3SGE1c1FtTDVDU2hn?=
 =?utf-8?B?QTBrYzBVeDN4UWRkYlphZS9JQXJPWUdPb2M3TVcvMkRxM3FzSEhreXFtM0Qz?=
 =?utf-8?B?Y25aR1RONGwrcjVDZFU0T0ZvV3ZPMHFncXNydHVhTkUwUjZ4eXpnVDhoQzA3?=
 =?utf-8?B?djNiNWUrTlZ1OVRROElRbllSQ3JtVHh3V3ZlNmRlSGdTa2pOVWlUamluQW5D?=
 =?utf-8?B?QlByaUd3dThvSzRnY1ArTmxLN1lzZjZtNnY3NDlOaGdGQ1hiTEZZNkptSWdY?=
 =?utf-8?B?MUx0ZDE2VzdMN3dUSmx2R0pGQTBEOWlOSjlsOTdyK1ZnRGxqOE1TZFBiMEdB?=
 =?utf-8?B?Q1haSkRFcGQyOW92UzRkUjB1UUxtOHJMbEhXKzd3ckNKRitldU4wdTFXdmd3?=
 =?utf-8?B?SjBRZ2IwQmxDdHk2dDN5V2VjRjFzUFliNy9rcmo0VFpuK2RHZDd4SGR6TERl?=
 =?utf-8?B?TW1VZ2tndC9OYXZ5b2xFbjBacjdNMnp5UG9FdVl3Nm16M0tuVWhPSUZJN3lN?=
 =?utf-8?B?V0lEeXFZb1ZpMDJGTXFlQTRTZEhlWnMyQWt2OEJFTnRSdWhvTzM2NU4ydzhH?=
 =?utf-8?B?Q0hYU3V6UXkzazNBaVVYNVpwKzZZUE01SnA5TUJMUE8xWlM3c25rb2Z2NTVx?=
 =?utf-8?B?am9LL3A5bkdudTF3TnBkZTZKOEVZNGorTDV2YzFvQmdaUlY1b3VwL1Z5ZnQ1?=
 =?utf-8?B?RkMxOFNvSEJoMzdJRmphejREUFJQWTRnb25JWFRLbnBwM0dFZXJkU2xQNnB3?=
 =?utf-8?B?VWFucWo2ZEMyVU1Ob25ST3djZWJ5TXE5QmkrOHN6aUV2TGk5eGlOUTl2SzN6?=
 =?utf-8?B?dUgrMllIaTBTL0c1TGxSQWNhbWNldU1hQ1h1ckdNS0FndjRYVlVHcGExUUEv?=
 =?utf-8?B?a204ek5aVW9xWnNoRUd5NkZua0FOVVlsSzB0ODVmUzkzRUVsUnpIdE1YZFVs?=
 =?utf-8?B?SGxKZ1llMWsvQzVhY3dhcDBXRDk1bmdhQzB3UE4welp0dGRrbHVRZHRaNTh1?=
 =?utf-8?B?OXJPc2hIQnZvOXVWL0xPRU5ueGwySVdKVmlnYjRhTE04aUEwaGFZY3BrMEdi?=
 =?utf-8?B?Z3A2Ti9OUmZaVzdGakc4UzNqTkRHMGovaUM0eDE0MVNQYkhzb2t5YnpYY0Jn?=
 =?utf-8?B?dGFCdW9wck1Zbnh5TXY4VkozUXVLS1JHd1QycmRubUZXUTlZRURFR0hjQ2Vj?=
 =?utf-8?B?L2hNWVROR2U0WWdHQndMbGszd0plTUZnNUdiUzJseEFVblBWWWZ2S3RYemRI?=
 =?utf-8?B?VnlJMnVSSmQ0Sy9YVncvR2p6Sk9FM3RQU1lCZWFMUnNQdExpTUFlOWZ4UzBD?=
 =?utf-8?B?OGtkK040YVBCREJtMVc3bHVZQkFQYmFCY29yVloyMkNMVFNqNHJLT2dIbHE0?=
 =?utf-8?B?cjlFdmIrVVNidy9CTWYxWTFRZzIxNWlSMVB2RWpzRCtITEl6Q052SWMxQ2py?=
 =?utf-8?B?M2EzdU90ZStlZWZrU0FhWVNZc1JlSFZJcWgyVDdWNlRZdkQ0eDVXbjd0MXJC?=
 =?utf-8?B?Q1BiZ1lDZkdNOHNXQytsdlM5Mm9aNS9obmY0OGZPRXRhTTlYK0lZdGhTMmlS?=
 =?utf-8?B?cDBmV1dFNTNjQjQ1ekF1Vk90MS94aHM3QWpraXM3Zis0cjdqU0MxeFVWZmRR?=
 =?utf-8?B?QUVnaVVzZ3h5UDNMOTI3R2xIVzdtSjNFNkhTMTV6bzExR29rNVVubU9nVHNR?=
 =?utf-8?B?NVBSYWhwMU1UaHhpN3pKSGNJTy8wZGROR0hZNmhtZEpXREgwejB4cXI1MXJ1?=
 =?utf-8?B?UkhidGh2bWc3SHhSR3kxRXpvNjdKU1kvOXFyOFVvUmFtNThCN1lJeVI3NUtT?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c25ad7-8072-4c37-02ba-08dde4972685
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 11:53:19.7765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9dctzlbJZO/sxiWpiyMA5rCi94p+TTtE4Dm5q1rolkIdUzpEQhTvLMC3ILuMOAAmiqBhKWbdnvWx4yhjw0xyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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

Hi Chaitanya,

On 21-08-2025 03:05 pm, Chaitanya Kumar Borah wrote:
> Setting max_bpc simply configures the pipeline to drive
> 10 bits per color channel, but HDR requires more than higher bit
> depth. HDR also depends on metadata such as EOTF, peak luminance,
> and colorimetry.
>
> Update the test to set HDR metadata on the connector to signal that
> we need an HDR pipeline, before running through the modes. Reset
> it afterwards.
>
> If setting HDR metadata fails for all advertised modes on a supported
> panel, it implies the kernel cannot drive HDR — for example, due to
> bandwidth limitations.
>
> v2:
> 	- Update commit message (Swati)
> 	- Add comment on why we set HDR meta data (Swati)
> 	- Commit after setting HDR meta data (Swati)
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_hdr.c | 117 ++++++++++++++++++++++++++----------------------
>   1 file changed, 64 insertions(+), 53 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 33b6c42a6..ee64543a0 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -153,6 +153,59 @@ static void draw_hdr_pattern(igt_fb_t *fb)
>   	igt_put_cairo_ctx(cr);
>   }
>   
> +/* Converts a double to 861-G spec FP format. */
> +static uint16_t calc_hdr_float(double val)
> +{
> +	return (uint16_t)(val * 50000.0);
> +}
> +
> +/* Fills some test values for ST2048 HDR output metadata.
> + *
> + * Note: there isn't really a standard for what the metadata is supposed
> + * to do on the display side of things. The display is free to ignore it
> + * and clip the output, use it to help tonemap to the content range,
> + * or do anything they want, really.
> + */
> +static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
> +{
> +	memset(meta, 0, sizeof(*meta));
> +
> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
> +
> +	/* Rec. 2020 */
> +	meta->hdmi_metadata_type1.display_primaries[0].x =
> +		calc_hdr_float(0.708); /* Red */
> +	meta->hdmi_metadata_type1.display_primaries[0].y =
> +		calc_hdr_float(0.292);
> +	meta->hdmi_metadata_type1.display_primaries[1].x =
> +		calc_hdr_float(0.170); /* Green */
> +	meta->hdmi_metadata_type1.display_primaries[1].y =
> +		calc_hdr_float(0.797);
> +	meta->hdmi_metadata_type1.display_primaries[2].x =
> +		calc_hdr_float(0.131); /* Blue */
> +	meta->hdmi_metadata_type1.display_primaries[2].y =
> +		calc_hdr_float(0.046);
> +	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
> +	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
> +
> +	meta->hdmi_metadata_type1.max_display_mastering_luminance =
> +		1000; /* 1000 nits */
> +	meta->hdmi_metadata_type1.min_display_mastering_luminance =
> +		500;				   /* 0.05 nits */
> +	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
> +	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
> +}
> +
> +/* Sets the HDR output metadata prop. */
> +static void set_hdr_output_metadata(data_t *data,
> +				    struct hdr_output_metadata const *meta)
> +{
> +	igt_output_replace_prop_blob(data->output,
> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
> +				     meta ? sizeof(*meta) : 0);
> +}
> +
>   /* Prepare test data. */
>   static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   {
> @@ -380,15 +433,6 @@ static bool is_panel_hdr(data_t *data, igt_output_t *output)
>   	return ret;
>   }
>   
> -/* Sets the HDR output metadata prop. */
> -static void set_hdr_output_metadata(data_t *data,
> -				    struct hdr_output_metadata const *meta)
> -{
> -	igt_output_replace_prop_blob(data->output,
> -				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
> -				     meta ? sizeof(*meta) : 0);
> -}
> -
>   /* Sets the HDR output metadata prop with invalid size. */
>   static int set_invalid_hdr_output_metadata(data_t *data,
>   					   struct hdr_output_metadata const *meta,
> @@ -401,50 +445,6 @@ static int set_invalid_hdr_output_metadata(data_t *data,
>   	return igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   }
>   
> -/* Converts a double to 861-G spec FP format. */
> -static uint16_t calc_hdr_float(double val)
> -{
> -	return (uint16_t)(val * 50000.0);
> -}
> -
> -/* Fills some test values for ST2048 HDR output metadata.
> - *
> - * Note: there isn't really a standard for what the metadata is supposed
> - * to do on the display side of things. The display is free to ignore it
> - * and clip the output, use it to help tonemap to the content range,
> - * or do anything they want, really.
> - */
> -static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
> -{
> -	memset(meta, 0, sizeof(*meta));
> -
> -	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> -	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
> -
> -	/* Rec. 2020 */
> -	meta->hdmi_metadata_type1.display_primaries[0].x =
> -		calc_hdr_float(0.708); /* Red */
> -	meta->hdmi_metadata_type1.display_primaries[0].y =
> -		calc_hdr_float(0.292);
> -	meta->hdmi_metadata_type1.display_primaries[1].x =
> -		calc_hdr_float(0.170); /* Green */
> -	meta->hdmi_metadata_type1.display_primaries[1].y =
> -		calc_hdr_float(0.797);
> -	meta->hdmi_metadata_type1.display_primaries[2].x =
> -		calc_hdr_float(0.131); /* Blue */
> -	meta->hdmi_metadata_type1.display_primaries[2].y =
> -		calc_hdr_float(0.046);
> -	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
> -	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
> -
> -	meta->hdmi_metadata_type1.max_display_mastering_luminance =
> -		1000; /* 1000 nits */
> -	meta->hdmi_metadata_type1.min_display_mastering_luminance =
> -		500;				   /* 0.05 nits */
> -	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
> -	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
> -}
> -
>   static void adjust_brightness(data_t *data, uint32_t flags)
>   {
>   	igt_backlight_context_t context;
> @@ -652,6 +652,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
> +	struct hdr_output_metadata hdr;
>   
>   	igt_display_reset(display);
>   
> @@ -701,6 +702,12 @@ static void test_hdr(data_t *data, uint32_t flags)
>   
>   			prepare_test(data, output, pipe);
>   
> +			/* Signal HDR requirement via metadata */
> +			fill_hdr_output_metadata_st2048(&hdr);
> +			set_hdr_output_metadata(data, &hdr);
> +			igt_display_commit2(display, display->is_atomic ?
> +					    COMMIT_ATOMIC : COMMIT_LEGACY);
If this commit fails, test will fail. Ideally, we should skip.
Can we add try_commit() instead?
if (igt_display_try_commit_atomic(&data->display,
 >------->------->------->------- DRM_MODE_ATOMIC_ALLOW_MODESET,
 >------->------->------->-------  NULL) != 0) {
 >-------igt_info("Commit failed, couldn't set HDR metadata in 
infoframe\n");
 >-------break;
}
> +
>   			if (is_intel_device(data->fd) &&
>   			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
>   				igt_info("%s: No suitable mode found to use 10 bpc.\n",
> @@ -710,6 +717,10 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				break;
>   			}
>   
> +			set_hdr_output_metadata(data, NULL);
> +			igt_display_commit2(display, display->is_atomic ?
> +					    COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   			data->mode = igt_output_get_mode(output);
>   			data->w = data->mode->hdisplay;
>   			data->h = data->mode->vdisplay;

