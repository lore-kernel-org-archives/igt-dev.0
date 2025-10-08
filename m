Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF4FCCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 22:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E61A10E8EA;
	Wed,  8 Oct 2025 22:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LplpFtrX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384D310E8EA
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 22:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759963258; x=1791499258;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8AJmsvzVbc/43igbDez+zDGx5lC5Koqw3WT5pKUMNc0=;
 b=LplpFtrXirWzHpCX1SBYzto4NA7+4PqQsSLIazOWcun3bQ6efkzYzguI
 lBLVLBirmrX/0TfA77a4gM65Emd2qnTNmo7ONMXZk5WmI8qLvtcM3YRRK
 UDdFfeZ0o73Erks7xxTQCmOkfoqQx7C94VM5ZtPZXJrgnhRqmAmubOXmQ
 S0kolNi2DoadD5+LiG0mzITnxwEBWGNPaCkjCusKblYd3YBbaZtsUtY0E
 HvvOIOSfradBmdCYpkYA+2pS+c/6BZSeKFRn+iPRdAfF52gOvr1j7/CHD
 4b9wtTv4g1x4n5ULPNd5U8F43Em+wVtXJaQyYadqeFH1GHReteV0AgzcT w==;
X-CSE-ConnectionGUID: JyS44V92RbGWVudQIsg/BQ==
X-CSE-MsgGUID: TUtmLFqkQJq2vL8Np+MpHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73515000"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="73515000"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:40:55 -0700
X-CSE-ConnectionGUID: uwJysUmjQ1SOMWEG/JP+hg==
X-CSE-MsgGUID: BiWKkYusSDGGe4uqEcbn8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="179673932"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:40:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:40:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 15:40:53 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4CNkHnTshIXDEJ5fzzLivx1OkMyZSF88zdiqh1pS8ypJ+WwdmRnOioxTZtuxfWc4b+8aEW7pjEVCTroaZPyriGqEY7GJIfM610f1GtOftUuQLxtAOQsfSh9o+sLPgbQZZBM1DRAwmER1WfAaETwhmEwIyrtyCcASU1GJXWm0NcAZdK8Z7b7qlkROXADoUzHcX3hQzTk35FLZ2GO73pVpuuni49RBGOMf+f9UIFmmzkkP41NyMd9WaQbe2AGwhhrfH2ovQjRY/jAQtmNSGdQg3JrQmLg/T17LWRwJN0r4fn+37Wa7P8ontzE+ipHiraIfRSACCF2YxLnSCTPgWRvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XrnaLen0EYSQjtAypDWNrM+T0gaTmhZ912dIgIYmBA=;
 b=kUtTA0DmvCbvhFENw9BeFIdX5lkeP04ZpeX6XoxZozqg4SwWV8kv7pJIFiPU6xZgcLe5alcn0yum03aQ7dTbHHBEQSyl4nRe13/2m+6ibvHiMEgr7cAf51LO1i0HcWKayiJcagjcCnqZGzDUb8zQ3H3SxufpNycWmWo8Lhhg23Tv1pYD7zXXhl36jYxzawZI7jTqad9DW2+9g3HdfiZ0n83yi7ZnHIIrOkcny5WHs7FhMI/B8pseE1iDJUbToSYdQXPW5B9nyOX7AB/UkAGbl2MDmc7yfTwZOFXBAHFv8jlCzKmNDNgdzzD0SF7C+rStZLUe3Ro++/yC5RbaFO9G7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8396.namprd11.prod.outlook.com (2603:10b6:806:38d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 22:40:44 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 22:40:44 +0000
Date: Wed, 8 Oct 2025 15:40:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 04/18] tests/intel/xe_oa: Change oa_unit_engine to
 take an oa_unit argument
Message-ID: <aOboZs+GJyJ2/HCg@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0330.namprd04.prod.outlook.com
 (2603:10b6:303:82::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8396:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e78bcf-009e-4e18-91ee-08de06bbb7aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFdqN2ZZbWUxbk13S2pBVFVQcjk5ME8xbElIaThOVmM1MnFmb3IwdWtOcUxa?=
 =?utf-8?B?RTdFRXN3cUhtS3JUZHp2MFhvcWxwV3pzMDMvTXBjbVZ1VWliaytWSGs0ckZa?=
 =?utf-8?B?YmZ2d2NMWEZyZXIvY3ZSMEkwNmZLK2Z4a1hwN0xKK2QyUzZNYlBiZnR2NWxy?=
 =?utf-8?B?Q0I0SFJ6cDliTStlbEh0aGl6RlNFaXJ3Ry9YdzR5TlVmaTBYT0ZqVzF5TzBp?=
 =?utf-8?B?WEI2QUNVUW1vaVdrM0F5OXk5VDBpODBmaklEVTRBeHVwcVcvUEYxRjNnZ2JL?=
 =?utf-8?B?dk51Qjgyc2xxQ2VNM21HZnlKU0ZkbS9QeFNDWUVGdDJnV2k4aGk0ZmZhSmNF?=
 =?utf-8?B?N3JlU3o3bENtcHVMZmFLRE9Vak4vcDRHaVBKK2lDMStHT0VRVGFLRjF3ZjY5?=
 =?utf-8?B?UEJ1U3p2UTAwRkxPZzZicmJ3MWRkVFhudTJmVlhyREZuRk84OTRTcHg2TWJu?=
 =?utf-8?B?MWcxd1c4cWhlY3FZYnNEQnRwNjVlYjhybUVjT3lvNlRIZlV1bHhsU0NmODli?=
 =?utf-8?B?cy94aWhESi9aYXA1REV4amEyRndDTnJ5MjBoVTNaL0pUZTBEQ3NWZWtLcEFu?=
 =?utf-8?B?YXYzaFRMNjRCQiszcFB2LzJ4c1B1YzVTZ0JhWExhaFVIL042QitNSGlmemNY?=
 =?utf-8?B?di9kMi95OUlqU2NTQVg4ZzFld3dVd0xyWThLR1lWZHJmZWhXcWt1VXNkQWlo?=
 =?utf-8?B?OVBQN1pTK1ZiNVFseFJ4WU5nOGNXNFVIZzdWaUUveHBzckRhdzNNMU9idUl2?=
 =?utf-8?B?a0tjOHVRbVMxbFBxU0FxeWJERjBPMDhpUUNLUUk3U2JsK1NoeU5NeEhLMkFy?=
 =?utf-8?B?SlorSmZWeGhzU2hIRys5MHhRbkJpdmJpR0FsY29mZW54SEVndVJwZG5mSlp5?=
 =?utf-8?B?Y2hnMXJHYldLU28wNlZxZVZlRlBpdFhCY0Q5TnNPMnMycjhYVmlHbG5lNzV0?=
 =?utf-8?B?YWRZNUdnV0dYMnRpaXNOdUx4SnFxeXdrZ2g3TTVPUTN6OWV3ZVZZV3Fvb0Qv?=
 =?utf-8?B?YWV3K1FiR2NaY00wT2ZQR216ekQvTXRMMS9UYXg5TThDRmx3M0VMekhSQkxj?=
 =?utf-8?B?WjArRWVWN1BueTV1RXNBM2VEbzFKWTV0aWtHOGZRM1YzbEZHY1Z2NFRxd0JI?=
 =?utf-8?B?b05pSGJCRlE2UkxyQUNaMnBPd3NBUVVOSnEvTUdUc1ZxZnhCdHFJaTlqZlA4?=
 =?utf-8?B?UkxraHpQMUFxN1hIZ210QVowNTgwUW5Pb0U2SEhIeG1KaWJYK2t5WmNqWVZ4?=
 =?utf-8?B?d2VWVkJUYUFFbVZLeFJpbXFBK1ZIbU5id2RKWFJFWDBINkE5VGNTaFE2VThy?=
 =?utf-8?B?Zi9JaEVhaFlzU2NEbVZzNEpSME9WZm4ydXRjZWw3WlV4RXNZY3dtZTZyTUlj?=
 =?utf-8?B?Z3QwYlhpUTlzZVVvd0xrT2N4VVdMMkJhNm9lUnRYZzQrTHpGcWxnN3lZbUNI?=
 =?utf-8?B?cEFESnlhU1pTQk5EM1pFM1Z2NXUyTkRDNnAvVWlQcXU0dmx2S2lmcVY4cjdD?=
 =?utf-8?B?Y0d1L3VtNzhkZ0hmZEZKZEpxNXdpRTI4MnFVcDBLUFZjSERibk5jbzhLKzhU?=
 =?utf-8?B?V2JIdUYyTnhWUU5pcVNzdDk4NHBRa2VGQ2lzZGdrQTZBN2haaityN0JhVUR5?=
 =?utf-8?B?elZoZmI5aytXNHRmcGRyYWMvQmx6UnRzWTREdGxwY3IyRURwMzAyWE9oRVhB?=
 =?utf-8?B?Ry8reW5WRU56U21rcnRac2I0c20xRHpRc3ZQTERXd1NKYk1TQXgrZDRVUGoy?=
 =?utf-8?B?TGxBelkvaWhacmRMM1ZlZ1hTZUxRZ2lidzZBYVJla3FBQ1hWOWV5akFYUS8x?=
 =?utf-8?B?VTl1ODBWdWxzMTRka1ZUSkNiNWxDc0l0Ynhhc05OTDc0elowRTAwRGRyMFhH?=
 =?utf-8?B?eW10SGU1VkFCVm5RYTNUb1RCWCtJb1NGcG5SVVo3cEdhaXROZmlGSy9VTkN6?=
 =?utf-8?Q?fBcwxi9gdNKpiW2Fhbn9iCZOwIYsICrO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2JkRkV2VE5JVTVvbW0rbjJkUG93WnBNVThNczlmc1VtelFvMTJGRlVKbnk2?=
 =?utf-8?B?YzJNWlp1d3dJdVZBNjNXZnhkLytNMC9icTZPd0VYVnk0Y3RjQmdWQTUxQ3lx?=
 =?utf-8?B?UVo1cmtXTTAxVjJvZTJRaktUajZPVTZDSS9ieE9wS0lBSUI1OW1LN1NnVWxj?=
 =?utf-8?B?eG9rellMZ2FYbDhLcUxJUXBIbEE3bFBLS0NhdVFtSWFzQjNGRTBUUkFIaGFl?=
 =?utf-8?B?RFRYRW8xVGp1SlhQc3hPUFVhN04rajI2a2R4RTNxV1o0allEYVAwVzMxYXRM?=
 =?utf-8?B?d0pwY0RYbGI5eFVEWXNiYnZ2SVFmb3YrQzF6U2k0QjgxUEo5WTUrZTczWXZq?=
 =?utf-8?B?OW9aT25XSGtYem15ZElDcGRHOERGT1dIbWNDcllEMU5qZXhULy8yUzdCWHdt?=
 =?utf-8?B?S3QyTFNvUXhwYnpxRWlRSDJRUERnY3RZQmdTb1Y4dGJjY1dHRi8vS3JrUkdl?=
 =?utf-8?B?eU5IZ2lNc1krRisxcXlBK3ljc2x4eEN3akJYMEgzUW1vbVd6VVhWVDZpSnZB?=
 =?utf-8?B?cGVzaDd5N3F5Qi9jMDNiaHhTc0RPR2JHNURVczllakd3NEpLMkFvZXhqZGI5?=
 =?utf-8?B?Q2NDd3lXK2tSdnA0a3lsOStXNmRoNmxsKzNpRU9ONGw5U2NFQ25KMGM2b0k5?=
 =?utf-8?B?dmFYejJhNmZHaTNTTW55V3B6MlRzWGt4RVIzbmQzTzJTTWRLVDVCSElLWlpT?=
 =?utf-8?B?VlVrU2pEazBYUjVRRmdYTjM4cWxwdno1ZVUxQTNJUGFZekUrTVlqWWwrdE92?=
 =?utf-8?B?b1RIczduTTBlN3hsMk5WaWZYaUtqMjBzNlp6WUcrUERLMFNlNVlMMEM3Nll6?=
 =?utf-8?B?dmZtdng3Z1BHN2k3aE1qckNYR21FLzMyenhBM3JtVTRNS0FxMVZIL2I0M2gw?=
 =?utf-8?B?WUJHRmJJTWVWVGV4SEd6VWFqN0o4ekE4bnUxeEpWSVI5MFdCYm05UC9CQXly?=
 =?utf-8?B?WGpPWGd0OWE0VDlQRWMrQmVjSkwzUllrL3VpKzFpdksxZWZiL29vVWxxNnhM?=
 =?utf-8?B?anM5SlJPcm8xczdUR2ZQV2xMMndlbG9MQzRJQ0V6WHBJcXpLUmY3VVg5RDNW?=
 =?utf-8?B?SzQyOUFvOVhFTnhlbHpZMTcrY3BFRUpWVHRQWEZnNzR2SG9heURSbzlNSnJv?=
 =?utf-8?B?VTdKK3dSMGw0V2xTa1JzNmlqSkdKZnNHRjltaCtJUkFWQlkxQzF0Nm10QldV?=
 =?utf-8?B?MDJ1ek9RSmRRQmhNdGxyem1iUkhQWG9CbXcyM1JrNlZERUNjQUw0aUdnMVhD?=
 =?utf-8?B?Z0xRNm5aZ29sNmxpOVFvM240SGRJQzdCN3IxenVTZ2NuekZEV3F6NlJkN3Z0?=
 =?utf-8?B?STFzOWZ4V3MzVFVyQVpnUitLbUdXUHRGUkZtWEdhVXJHeTE3Vm5zenNjWVBN?=
 =?utf-8?B?Vzd6ZG5rc3dzOUY4bXVPSUNoTXZRSmJVMkFpNXRaTnA5ajZhZFhzVE9FaHE5?=
 =?utf-8?B?V0FhTy9qeUp0MU9JWW4xMHlkMU16QllQWmN5SEwwVVgrUDcrWGErMFVFWVlZ?=
 =?utf-8?B?OExiNlhma1dHdDhHc0ZORkpmNzRoUkdYNkR3OEpJc2lFWVNtVnA1WEtueHFH?=
 =?utf-8?B?MXBZdnBwZCs3RlBaNldnTWFiMGIveCtiTW9nZXMxZXRXMFB0K2ZzSHZ2TzVB?=
 =?utf-8?B?dmkxb3dUc3Njbyt2UVhZVWxtUWQ5QzdOUDF3RDB1U3VBZk9CaTJJWHVhUmVU?=
 =?utf-8?B?WFd4cmJveGltUDExTDJQNCtSSTVCbWx3RU9nSElsMG0xOWpKS1FrdGF6dVBP?=
 =?utf-8?B?RlVTcE1uV1J3UytXcDc1NFg1V0haNGtabHRTQ3dMV1dOZFFnS2JuUTdaM0s5?=
 =?utf-8?B?a2hMeFZ4d1BFRE56U1ZJTlg3RlpFNjU3UDVVd3V1RnRkK2ovSW5sb2VIRlZi?=
 =?utf-8?B?M2RsQi9MTkdhOGQ2dEkxMXlhQU4zcTZCanVVdGswSFFyR0hGNGZka21KNmxZ?=
 =?utf-8?B?VzRvTDc2RUd5eFJqOEx5S0RBUys2cTlOSmJaMFVMc2NpMTEwNUpvdi9jZ0xM?=
 =?utf-8?B?M2RmN3pKbCtuK2NGVXZrS2xEeC9qcFhOcHhQR1orUFkzSDhsSnRIM2pUSis3?=
 =?utf-8?B?WlhtaWNXQVVYSjNpR0d1VWhwT1lEVUs1ZkVCZXRzMUU1QkdBY2MvYmdicG1t?=
 =?utf-8?B?SEJjUjJLSkR6YmlBQTdLZk53ZTBOOEd5Rmx4VHhQbVE5dUZZSC9Pbko4eTZn?=
 =?utf-8?Q?uFc388y17zKrYo26YzisJE8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e78bcf-009e-4e18-91ee-08de06bbb7aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 22:40:44.5126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohlwm3rnGbPyJk2VbY2GalWiZIoDHOa5lo2S7u8UEThc9tA4RdtwiPm99LnJoUfahDqeRl3+NTE7RCDWEL4yQKyclEkggqRwheH824qNYTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8396
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

On Wed, Oct 08, 2025 at 02:17:51PM -0700, Ashutosh Dixit wrote:
>To prevent code duplication with oa_unit_by_id(), pass 'struct
>drm_xe_oa_unit *' as argument to oa_unit_engine().
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> tests/intel/xe_oa.c | 32 ++++++++------------------------
> 1 file changed, 8 insertions(+), 24 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 65e03b1010..c7de1d081d 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -472,25 +472,9 @@ static u64 oa_format_fields(u64 name)
> }
> #define __ff oa_format_fields
>
>-static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
>+static struct drm_xe_engine_class_instance *oa_unit_engine(struct drm_xe_oa_unit *oau)
> {
>-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>-	struct drm_xe_engine_class_instance *hwe = NULL;
>-	struct drm_xe_oa_unit *oau;
>-	u8 *poau;
>-
>-	poau = (u8 *)&qoa->oa_units[0];
>-	for (int i = 0; i < qoa->num_oa_units; i++) {
>-		oau = (struct drm_xe_oa_unit *)poau;
>-
>-		if (i == n) {
>-			hwe = oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
>-			break;
>-		}
>-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>-	}
>-
>-	return hwe;
>+	return !oau ? NULL : oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;

Since this can now return NULL hwe, test_oa_unit_exclusive_stream() and 
test_oa_unit_concurrent_oa_buffer_read() should check if the hwe is NULL 
and account for that.

Umesh

> }
>
> static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
>@@ -4263,7 +4247,7 @@ test_oa_unit_exclusive_stream(bool exponent)
>
> 	/* for each oa unit, open one random perf stream with sample OA */
> 	for (i = 0; i < qoa->num_oa_units; i++) {
>-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, i);
>+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, i));
>
> 		oau = (struct drm_xe_oa_unit *)poau;
> 		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
>@@ -4295,7 +4279,7 @@ test_oa_unit_exclusive_stream(bool exponent)
> 	/* for each oa unit make sure no other streams can be opened */
> 	poau = (u8 *)&qoa->oa_units[0];
> 	for (i = 0; i < qoa->num_oa_units; i++) {
>-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, i);
>+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, i));
> 		int err;
>
> 		oau = (struct drm_xe_oa_unit *)poau;
>@@ -4345,7 +4329,7 @@ test_oa_unit_concurrent_oa_buffer_read(void)
> 	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>
> 	igt_fork(child, qoa->num_oa_units) {
>-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, child);
>+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, child));
>
> 		/* No OAM support yet */
> 		if (oa_unit_by_id(drm_fd, child)->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
>@@ -4924,18 +4908,18 @@ static const char *xe_engine_class_name(uint32_t engine_class)
>
> #define __for_one_hwe_in_each_oa_unit(hwe) \
> 	for (int m = 0; !m || hwe; m++) \
>-		for_each_if(hwe = oa_unit_engine(drm_fd, m)) \
>+		for_each_if(hwe = oa_unit_engine(oa_unit_by_id(drm_fd, m))) \
> 			igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
> 				      hwe->engine_instance)
>
> /* Only OAG (not OAM) is currently supported */
> #define __for_one_hwe_in_oag(hwe) \
>-	if ((hwe = oa_unit_engine(drm_fd, 0))) \
>+	if ((hwe = oa_unit_engine(oa_unit_by_id(drm_fd, 0)))) \
> 		igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
> 			      hwe->engine_instance)
>
> #define __for_one_hwe_in_oag_w_arg(hwe, str) \
>-	if ((hwe = oa_unit_engine(drm_fd, 0))) \
>+	if ((hwe = oa_unit_engine(oa_unit_by_id(drm_fd, 0)))) \
> 		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
> 			      hwe->engine_instance, str)
>
>-- 
>2.48.1
>
