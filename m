Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88968D1D486
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 19:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A7310E384;
	Thu,  8 Jan 2026 19:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9RrXiSX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320A510E384
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 19:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767898891; x=1799434891;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yA4o8gW+k5TYixxO90wMCVxVNAkyf4V5YVdrZfuaCjc=;
 b=C9RrXiSXz0cW/rd5QXYVOO3MA7C0D2plUORQLHty9Zi/d1inAoG1UaK8
 m+MZz4voIF23xNLcKm85njD21iLxOtr1lqDTO+/pcJzdowQ7HS0uTu7SC
 gLg05Y9TELRrKruF1EriUxEYG7Wgyy7GuBTSTTfhFa0p9WvFo6/1gjHbS
 9DIqrB3XUZvgmIQdsTuak1bRccvsAmeQHzgYRYi2Vg3JUvi17+1atyboe
 nVScb5bi5QgEYNMZYqN4CuURX/b9u33381oSyb4jvzEsWVGTRlPxOB2m2
 phTKowG7NXPXZ4PhQcWABM7hRpLPYRBwSidRemgvei9Ii/751bUG1JmP4 w==;
X-CSE-ConnectionGUID: uxNrJc7vSkieK1Q4L1YgQA==
X-CSE-MsgGUID: Z9bQh1QDQ7SdKYMJdF5iKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69334954"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69334954"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:01:31 -0800
X-CSE-ConnectionGUID: k3tyGv8mT4KJaB+oElP/ZA==
X-CSE-MsgGUID: 075uMbEnScKhNmYWEdUWGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="233975290"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:01:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 11:01:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 11:01:30 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 11:01:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1SXysJ67H+b9NN0TsMGlb085a9ZMeQcbXOlkFyjip19Qbd4dCX96/cK8KKhDv7tGOl8Q8KBnmjgCWUqJvYRWd0TjmNsjogpkL5vgz33zCUYW1S08Ym54uCu6zztSD66fsJYX5XNKGHGkbtioxyi4alvEUM8+sDumJN0kTug2Gq9o0LWmbbVonMWu9RmQXEmznZWhEPry4/tKD0naLumsTQf2s7qUplRpYhQ5FuSu+fawpnde9E4nhqQ0OTWebhEdFsWcPnc7+i8to76mamM5nzUFHZX+u1ho5kdgm2agwhbVNlaOhhnSs0zFcuUVcKYCo4KszW66v7zr8EWN6u6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXzVtIcGtz2BJWJKX8xX47Pzl4EI2FPQxTE+kzBU8/Q=;
 b=KdtWxI9eo5/Y8nJuGFtHkQDmGoXjk+UvBxwkRWpbfOWWc/EfnmDx7ZAUtF0mSwCn/F3CpqRxY2WDCVNmYMhXOyLLL4Lj0O0c1RjqUO6asjygQ8rjgUIVZbS9miHceUXKV2W1UJhUw0yqvAAcA8TjTmaPMI0vDId/0U2tPYl2z/U/DzxXkd0kj5yJylZiQbS7KgV64Gh+5CpxvmYjuUcAyEVbvSK4G4oAFOf5Sad9ucjDcdxN5QuXojtBMbgSVWPK1C1CzsUBDuwjSjgHrsCr4GKrekH+7xcpGXN2MJg1y/KbWC+nwQY3wowqosXlUEGwcgHGJxxNnZgbVbjMAK459g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by MW4PR11MB8265.namprd11.prod.outlook.com (2603:10b6:303:1e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 19:01:22 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%6]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 19:01:22 +0000
Message-ID: <6f88ea15-c301-4d69-8893-2b7cda081cc4@intel.com>
Date: Thu, 8 Jan 2026 11:01:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/xe_ccs: split block-multicopy into 3
 submissions
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <jonathan.cavitt@intel.com>
References: <e2bd6e36919fb6d43e182f17eac21195d1d31e4e.1767814525.git.jagmeet.randhawa@intel.com>
 <20260107233046.GA193218@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20260107233046.GA193218@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::16) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|MW4PR11MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 6420cd79-fc31-4819-ac57-08de4ee85049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MC9vdkg0ZTVsMDV5ZmcyOGhBWkNtT0RoUHlDR1o3SytmTEJNNzhiK2ZwWVJM?=
 =?utf-8?B?RlNJZ2xzUzcwcElPV2RHSnVjcVN0YVBNN0ROUUk1SHg4aXpqbWJJazFQUGhm?=
 =?utf-8?B?MGJBLzlucG9nN096bTJvZzVCUXFhcE9VMWRaWkhaVUpWL2lyOGlOUnkxNmQz?=
 =?utf-8?B?b1c2ekdETVBVKy9paEZHU1JjdlRtTm1VM0tJSS93eDU1bGZQYnpzbXZzY1c3?=
 =?utf-8?B?bEliQWpyS2VHdm54b29mRGQ0b01YUmVydHBDUWFDWFlqRy83MmczUUUvUzhu?=
 =?utf-8?B?V0RGalhQYll4eUtjUkNXSzRJaEhudjVyQkNQKzdNdjBWcVNMNWNkTUhKT3Zy?=
 =?utf-8?B?ODNkc2VJam4rbG1XZ3k4NUV6dXZXV0ZvQ09PcS95NUZ2a0tRYVphOVdIWDF1?=
 =?utf-8?B?OG05U0JuRWJBUzNnQXZYSGVsRHVVQVJua2JXVEpCeVZrZXRqaXRtUmltdHZm?=
 =?utf-8?B?MHZmKzEzQmQ4cld3UVo3OXpEaUtKaHNhZldTclN5VG5QejZxNWc5OG9WMitv?=
 =?utf-8?B?N2JsSFdYcEF4Szg3YzYrWXZHNU9IOWZDMXVpeVFEVzZvMFJoL1JjMFZ4OXJC?=
 =?utf-8?B?d3N3aUR0NGE4anlmRWxnNzc1SGZRM242TjJMV3Y0My9hRlBZSUVKcmNscVFv?=
 =?utf-8?B?d3lGcEdGWWRQb2s3aTZyWmZaaUFuNVEzb1Z3YlZiajBpWjFRRkpIWTZFMTlR?=
 =?utf-8?B?b2hsMFZkNVdHWVhrNnFQZHZzL3pvRFpLcEZkMFJhWlpMNGZGeW02dFV0SWU3?=
 =?utf-8?B?eEJ3eXhEelRITk1UeVI5TXVrcXVJbU1ETGJaY3F3OC9FQy9LUkg5N2VaTDVJ?=
 =?utf-8?B?R1o0QWpISHVoYWdLVmc5RGVHeVFXcEVscVI1NFFOY1VrYWE1MnJPMEw1Y0xv?=
 =?utf-8?B?eVQ0aG5nQVNZcmV3OHc1VVgvM1k0R2JkQ1BwQndram9kb1hiV1BldEs3SEd4?=
 =?utf-8?B?Um5OMTNOQ0NPbnFQdGtkM0NGRUxtSFJtd3VNbzd0cjBxMWRFdkRINlpDVHR6?=
 =?utf-8?B?eStncHNTOGt2SkRNWURqdHF6RWVDMjY4d2dPa2N1T01FNm9NNVZCWE50Y1VE?=
 =?utf-8?B?TWlpcEtMcFFuOVF2cWgvUHVrUUxhRHNmdVZMcHRrV240NHM5MmtJWlZPS0dr?=
 =?utf-8?B?dFQwN0x0NFBCOTFwUkV3VkYwTzJSUUI0OHZVMzVObFNIS1FTZENWcDlWOXVi?=
 =?utf-8?B?b2hoVkFrZFFHcGkrY3NJNHY1S045Zk9hdGlFbHNuVUZFME9ja2JvRDZzb28v?=
 =?utf-8?B?WGFtOW5LWFFhWkJsellwSy94cEpjSUVYY0lKQTU4TmtiY2pMazJ1Q1dBd250?=
 =?utf-8?B?Y3hZZ0FOMGdxbUNLeHF0Qk1YZlllaVBoQVVQV0ZoUUFVU2ZybTFtVkgxY1Q5?=
 =?utf-8?B?dmttSEV3cmtyeUNNeDZPZTZuUzRKVi9ubWpLZmU1UlpadGd5dVdmRzVlb2c0?=
 =?utf-8?B?UmhZS0x6M2xvdkMrNnc0UUV6VHBzMEJXdlhLT3l3NjVaNmhIckQ1Z1pBYVJ2?=
 =?utf-8?B?WWY3ZlNrOTNqdi9iRTNza0tWV0h6VUFQSHU3aVFoc01jc0RBT25BN2d4ZUZE?=
 =?utf-8?B?Y1RuaTU0NGZBS1BQUFdYYUM1TWFncXhJbU9vQmQzUGhuK2NmOGttYm11d1kw?=
 =?utf-8?B?ODBJSzFuWkxMUVJtL09SQlFoakRwcVlYajc1aERHSURqbGxoeCtVeU51b1Nl?=
 =?utf-8?B?OHU2RTFsbjd5VmMzcmhkL0Yzd2h2TWp4Mm9aZDBGQXZ2WityVWxkQmVvY0ZY?=
 =?utf-8?B?MFQ2ZjRxMC8wNTFLdEhuQ1JhVXh2VlF6Wm4rWjl4cVBqYjFPalk5aCsrYWRZ?=
 =?utf-8?B?YmcvSnFRUGp4M0I5ekVndENqaHdud1BXSG10N1F0K3pFVVFmWnU3RjZOWG5z?=
 =?utf-8?B?NkJ2b3Qyb1dHMU5ESi9hTlBBQ05vODI4Z2FKaXZkSjBuejdiV0RRamFRdGpp?=
 =?utf-8?Q?3UpDtYpEXN7Y6QNIcWQeSCa7n3ICqQYw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2QvZm5JZWNFdUFzeW1aek02V0NTdGJtdGcwM09Zdk1rZWEwYkg4OWU2SFc5?=
 =?utf-8?B?cHB5RUdlZEVSTHZXbDNyNmhXSlNnRDNMMjRrbEc2ZVppMFcxSmNLTm1hSk1I?=
 =?utf-8?B?dEJ0NGxhVWM4YkwrZ1VrR2o5MC9ycHRyeWJUcFdkelZwWEwwVXBrZGQ5bXpW?=
 =?utf-8?B?TGJHU3VBMXRadHZHbnl2N1dZL1dGSFpkb0hweVRyM2xKOEQwYW1xbHpGQjVS?=
 =?utf-8?B?UWo3VS9CS3o2UHdMUlhzUFBHZWZ6V201OFBjbURQd2wyazF2UDZRN3ZtU3N6?=
 =?utf-8?B?TzlSYUNDZEd6WnRjZnhoVVMzelp2VzhPYWlEZTZrTlNGeWZJaTFwcmpQVXhE?=
 =?utf-8?B?TGpKM0FOK1ByY3c5bnR4Y1pZNURkcWlxbDh6b0J6UDQvNTIxVWdqWFJ4eUpR?=
 =?utf-8?B?TThQZ0krcmgvbE9kaFpKSDE4WHdVdnE0eVJQQXFPQTNjR0I4Y0JaLzNjSGly?=
 =?utf-8?B?QmFxbUI3eHpCNU5nUmdVdWtGWjI1TnBQWVZTeEEyRC83b3cycnlNU1IwOFBD?=
 =?utf-8?B?eHNKbWRGa1JrYkNTREZaSjY3MmhSeVkyZE5qdExDc1hsSTFCdmFQNzVCdHJB?=
 =?utf-8?B?c2FzQjN0RmRVYXpxb2NUblBOdVRwRk13N0dSMEI0RStsbGpWRnhUN2tDcWdp?=
 =?utf-8?B?VGh5bG5xRGRVTHlqT3ZhdDZuNncxWEdTSnpPdXZNb0I5WE12NDhvYjNUQUlD?=
 =?utf-8?B?ejRrYURKVnhXdG1hRUJuNzk5NUhUYU1oNkNQMFZiQU8wbmwydFo5OFdNdEYr?=
 =?utf-8?B?eVVCVzlPU3J0K3pOZmt4ZEpwMGd2MmF1WkVCUDFrdCtnSG1VYnQzTS9wcFF2?=
 =?utf-8?B?eGQ3UWNPSFFnaWZSR2FvRjNwL2lSVld6SXduRmgzN1FNWk94Y01SZStpOFNH?=
 =?utf-8?B?VlcyT1BJaXJNN2EzZHRhTy93aXJTaHFrUHdrcjJmM3hRMDNZS1BTZjZUaERE?=
 =?utf-8?B?V2E3QmtJaDlaQWN6RmJzdnJrVmliUWE0NDg3bWk1bkU0ems5eGlGT0xQVnpk?=
 =?utf-8?B?c2Irem4xZThhM2drNC9NdHFkQ0ZkYlRSOXUxRDRQMVpmcnBxYWZKa1lHMjla?=
 =?utf-8?B?WERpbnRHdlBRVmVBZnlPOVJpcnphVU1raVdwalhuTVM5UWZvUGxuRWdCV0JP?=
 =?utf-8?B?aEh0aGhQUkgyRXFWL25jNEV2M0tnQ3g3WDZVd3UrN3p1aUNpcTFyL3Vhc1FS?=
 =?utf-8?B?Tm1CenNQYXhpTzhwZGRLbmRTdThJUE9Pd21DWWFQT1hxTHJRc2RNbmJZYk1O?=
 =?utf-8?B?M1NPKzJDRmE2WTRlNWV6UFViN3JMMENmQkovWDdQZWQ4V2NHOUFRaTA4UGoz?=
 =?utf-8?B?MStKbE44UnRpb2gzWEFvV2xrM2dQb042WmpNZHpxMENGdzNvaEtxN0tMK2Rm?=
 =?utf-8?B?TDFqQkUwYmtRZkRnakYzTWFjckQ2VWJ3T1YxQVNMdjNZWi9WTlZFVXdTeDJP?=
 =?utf-8?B?RHBLbFJ4YVQ1a0c2cTk0NHhTNzBRWXBwemtwZW4rZkhMc3AzMEUxM2FEVkIv?=
 =?utf-8?B?cmdFZFU5cjZlMXVTdW11NHB1SlhmaGg5bXZZRzRGa2pnOFNKZ08vWHhPUFl6?=
 =?utf-8?B?VThJY0w4V0NDVjFsT2hpNThOQ1FxcyszNHNzMlVSM0dLeDFEenBSdDI1UDhG?=
 =?utf-8?B?dUoyT20vM3Y4NEJlRHVpSEZVUUIxSDdnQ0UxcmUxSGU1NGVaRnVpcGYzWVEw?=
 =?utf-8?B?Z1R0TWJPcGVsMzNwSUNyNUt3UFRNdnpQTFdNbHQvT242ZHAvdXhhdmFvS0ts?=
 =?utf-8?B?VmM1V21HV25RQ2tYVjdCY2lBeUUzMzVFUUlxOUZrTnJnZWIwdEVTNHltcjV0?=
 =?utf-8?B?d2FEWnFRZzFEaHRtU1dVWHVzSjVOZGxydkFVb0w5cmlha2NPbXYrQ2xGNUQ0?=
 =?utf-8?B?ZThINGdUZXRhYWRuVEp1eGN2SFp0VXlHM3AxOU8xaVJsOXJJbUhHS2l2cklE?=
 =?utf-8?B?RHVJcVpxTGNkMjZCTU5RUTJQMkhHejgraGd6NkNpcEFBb3llVGl1M1FrSGNr?=
 =?utf-8?B?RDc3RUtyMFhqM0l6N2ZMYkNjaHFORDFLelVseGNSZ3AwZFZCOHN0S096Nmla?=
 =?utf-8?B?Vm95YXBoUXM2V00zSDZjVXRYQjlvRy83OFROd1Fqb1Q4WllXTGpTcHFOcDJp?=
 =?utf-8?B?SUdwSmZadGI0NWJJSDNscFRGRU5UWjZsa21nK0FBZmlhM1JMSDdHbFBMNlZa?=
 =?utf-8?B?MExaSTJzS2dEbnJ6dkZzSklRNHR4dWtvYkY5RWF2bG0rUGNCMEUyeVFua3N0?=
 =?utf-8?B?TzhXWjdtbmVFMjhNZVZkUkZWUTdhZU9MTWo1TFhIR0VmbUdLbXUzcmRLSWp4?=
 =?utf-8?B?TDBQKzFJMyt5SkR6UHJDLzdXZ0dsckRwb0cwS2tzY1hOQUhIWTBsWmxRWkJF?=
 =?utf-8?Q?78z/uUhnxyrf32BU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6420cd79-fc31-4819-ac57-08de4ee85049
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 19:01:22.0393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51qM7wAPrrBEIEhVXLgdfSqjClZyBpRKg1U7r/MsVleHaaLwJ5uD5p12oqbB2Maa3u5DmL7isETPYsATos3AikdKxMp7XS0lM+ewmtUzfJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8265
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


On 1/7/2026 3:30 PM, Matt Roper wrote:
> On Thu, Jan 08, 2026 at 03:43:29AM +0800, Jagmeet Randhawa wrote:
>> Split the block multicopy test into separate batch buffer
>> submissions. Submitting multiple block copies within a
>> single submission can  result in incorrect ordering between
>> stages. Run each copy as it's own submission then wait for
>> completion between stages to ensure proper sequencing
>> to prevent the read-after-write hazards.
> I mentioned this in an offline chat, but wouldn't it be cleaner and more
> accurate to insert MI_FLUSH instructions to trigger the necessary stalls
> between copies to enforce ordering and clear the RAW hazards?  Breaking
> the work into three separate submissions probably winds up working
> because we get implicit stalls due to the preamble and postamble
> instructions that the KMD inserts into the ring between submissions, but
> when there are dependencies and hazards between instructions within a
> single context, I think userspace should be able to clear them on its
> own by requesting the stalls explicitly.
>
>
> Matt


Right, We can disregard this patch in that case. I will work on 
inserting the MI_FLUSH instructions to trigger the stalls instead of 
splitting the submissions. Thank you for the review.

Jagmeet

>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>>   tests/intel/xe_ccs.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
>> index a21922ee5..33dde0c1f 100644
>> --- a/tests/intel/xe_ccs.c
>> +++ b/tests/intel/xe_ccs.c
>> @@ -281,8 +281,6 @@ static int blt_block_copy3(int xe,
>>   	struct blt_copy_data blt0;
>>   	struct blt_block_copy_data_ext ext0;
>>   	uint64_t bb_offset, alignment;
>> -	uint64_t bb_pos = 0;
>> -	int ret;
>>   
>>   	igt_assert_f(ahnd, "block-copy3 supports softpin only\n");
>>   	igt_assert_f(blt3, "block-copy3 requires data to do blit\n");
>> @@ -303,7 +301,9 @@ static int blt_block_copy3(int xe,
>>   	blt0.print_bb = blt3->print_bb;
>>   	ext0.src = ext3->src;
>>   	ext0.dst = ext3->mid;
>> -	bb_pos = emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, false);
>> +	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
>> +	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
>> +	intel_ctx_xe_sync((intel_ctx_t *)ctx, true);
>>   
>>   	/* Second blit mid -> dst */
>>   	blt_copy_init(xe, &blt0);
>> @@ -314,7 +314,9 @@ static int blt_block_copy3(int xe,
>>   	blt0.print_bb = blt3->print_bb;
>>   	ext0.src = ext3->mid;
>>   	ext0.dst = ext3->dst;
>> -	bb_pos = emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, false);
>> +	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
>> +	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
>> +	intel_ctx_xe_sync((intel_ctx_t *)ctx, true);
>>   
>>   	/* Third blit dst -> final */
>>   	blt_copy_init(xe, &blt0);
>> @@ -325,11 +327,11 @@ static int blt_block_copy3(int xe,
>>   	blt0.print_bb = blt3->print_bb;
>>   	ext0.src = ext3->dst;
>>   	ext0.dst = ext3->final;
>> -	bb_pos = emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, true);
>> +	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
>>   
>>   	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
>>   
>> -	return ret;
>> +	return 0;
>>   }
>>   
>>   #define CHECK_MIN_WIDTH 2
>> -- 
>> 2.52.0
>>
