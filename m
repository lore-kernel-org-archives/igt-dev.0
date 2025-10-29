Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473FACCF9E9
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 06:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E841C10E129;
	Wed, 29 Oct 2025 06:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeD5veFR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5823A10E129
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 06:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761720399; x=1793256399;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5IGdc09XbHlxXWL++BRJ00GOgL3pyJLGTfK/AmmqDr0=;
 b=aeD5veFR7NTznmqWndFT2wRFcOoa1E5dEl/Rm6ptvreKElrIL+1DkDOx
 RLDVAnJVoVQL3XRRXFy/d1wwSSQpFANQURDCusrBVI+1BuGtsNji/t4LG
 cZmijzzBd803TpLJqs7CEMAAuHvsU+CMTSUtyGEHXwyw0YTk2SSLF2xvH
 M+upBcc7LZVvCN+HAm5+z9D8Im9/bpASbIGeQy0dUeYxxYa9+pYjKLMBl
 CfIpVtyEjj0mpJR8tDO/UZLgii7YIZMWjNuNXPfUSLG0kg3pmWiFlTCvG
 R9K1CxrpNji9WF11HzU2WsxK7EDyMX7qQgaXDvfBiAiEFFp4TqipBPQAZ g==;
X-CSE-ConnectionGUID: wjClFMa7SymIft21JEYgrw==
X-CSE-MsgGUID: kDsw/FuST3OFCcxOqvLDdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63039490"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="63039490"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 23:46:38 -0700
X-CSE-ConnectionGUID: UbU1QcuST5uyJUbQhJTRNA==
X-CSE-MsgGUID: 87LD87bPTMSWaOpUOHTCJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185269880"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 23:46:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 23:46:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 23:46:35 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 23:46:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoGFD/uK20mf7iMU2maBrPAvD7MQVmd98nVzW8HXsz6BYUuWgBowLCqDva29qWztQ65Bljt9xbvuOgTQVXqJP8t7of8dxZ+N5iimDYWHphnZAPdn0CWCxqWVqF+1POjczdXTYyT3pb2FMorCt862rT9LLFIwB8kWlNpKcQ3aX73asC8BW9Jm4MvYuj0OmJhQEfcZ4o2AayQsNlYRlgXcfp2anul4xoCRZGvDfE/PnBss8mjieScBIs/By1EEAd1JuLjExRqkla4PdiJCWvHZB7Ak3CSUwIPZha8A5eQTi4FoAr/Wd4nzaYA9ioP/+ChcBCKS3dh96dbbri7yQzkt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FA4vDIGFFsfbXp65LPUewXotnA+yTCVCBFJ9Wu1+CTY=;
 b=mtVfRL5sPRwANpjAW8YrMyLDbKXhUDM39g9UrVolKRFVQq/l6NPpiruQsqQ8+0lWfbUuxQyV+TOfXBCRDwTxZ5oyBr1zu4s72TnV0qPvsbrSagOFUdxWEsh9pKj/WmBeB8oCBpzRc0IpRZb7v0EeFabr4gJWyC9LVJZGiD3wA1naS0+pHyC6Wehk7ih5XEqzpDEJSTBckBra2rMBrpu38BaqyyCYEDK0XBEpnPwVWdHvVNosvrleCnx4bpxvsRFkx0aerRlZOElbxOFOEgpApeZglebPffvoWeCadMSbyKjl7VgfpvWVrOCqzTXfliD5KpHDKqrjXXR90CxQuKO0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 06:46:33 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 06:46:32 +0000
Message-ID: <1de54c87-7fb5-41d7-bed3-5cd9861a548e@intel.com>
Date: Wed, 29 Oct 2025 12:16:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] tests/kms_vrr: Recalculate expected refresh rate
 from test
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ramanaidu.naladala@intel.com>
References: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
 <20251028084354.2682743-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251028084354.2682743-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::17) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: aa028740-4e63-465e-bfc2-08de16b6e58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHA2aFByMzFzVzlGQ2xJNkdDakxLaURIUEk4SU9lTVBzQ3RPKzQ1OXQ2czIr?=
 =?utf-8?B?ckpTMzJTWWd4bk5GYkxyQWFLYjdOYWhiR3kxTUJjNGFwdDltTFBvb0JIRVd4?=
 =?utf-8?B?N0xTSFJWVlNTNytRd0ZOQklIWWRtd0NSczZId2N5MFZOa2ZXNFZjV0Q3RDhR?=
 =?utf-8?B?ak16YU5hRGVwa2ppck5YQk5Ma08zeDNHZDhzN042TmVpMXo3dWkwOVNNWXA3?=
 =?utf-8?B?L053aCsxUlNCZGVnRnUwOTVLT1lUMW1CTERxbG1FZHhjSE83K0RMYU81MW0r?=
 =?utf-8?B?ZUN3V1lha0NYVVNNL0dFaUtoSFYzeXRYak5wYmpUVG5MbTgyOXJScnU3QXdn?=
 =?utf-8?B?a1BlYkxFNDdaSHlyV1ovOVQrYW5pOVBpckhLbGkrR0lROHdzU2ptRjlac3dF?=
 =?utf-8?B?c3hldXh0M1RuKytEelFKeW5IVmYyZHNWRk5CMkNwZTBDQXl4aExzay9xMXVu?=
 =?utf-8?B?R3E2OHVEcjZkNzFxVmF6S1ZYd2p0KzduNytQMU9zbTdsUU9Qa3pHUDI0bW9i?=
 =?utf-8?B?L3lFVVRYc3FkbGZ5Z09rM3RFWDFmYnRXam1RMGFIRzQvYjdYekZDeTRrV2Nx?=
 =?utf-8?B?eHN6UXdwYk9jdDVscGtuU3ROWmRKMDZLVTUrYjJjQUFxZVlLaFZTU1RNVmdL?=
 =?utf-8?B?U29MOC9vb1lpVWdzNXNKRDl2OVZwZUF2TUNneDMwcWc2V1FUWFFSUHc4bFBp?=
 =?utf-8?B?WFMxcWRxOGhlNm1CV1FsaTN3S0F5cWZpc2wvL3EyQmd3NEV6aDZHNWpiaUJQ?=
 =?utf-8?B?aUdRQUErQnVtQjZnOFJtWEpJSFdIOWFQNUVGWDRReWpvUU4xM25OaTl5STRY?=
 =?utf-8?B?Rm9OUzZuZzJuYktodnAvYjg4NlhiUzVwL3F0MnF5TU9nQmYvYlBCL2tFUGVt?=
 =?utf-8?B?cVpERHlYQ3ZIakhrVUMvb0syL3ljRFdydHdoL2ZYbHg0UFl0WDVFWHhaRmpG?=
 =?utf-8?B?VzVaa3dkRnFJV2tsL3ZXbnZmeVQ3RWZNRWVZZmhnV01KbXZ2dm5nZzRra1NX?=
 =?utf-8?B?dDQ5ZTVSWG9iZjkvRG80NDRKK0hLc3ppZkd6Q0c5cWduY0ZKMDlWWmt1STJJ?=
 =?utf-8?B?RnlySXJKYmgvYVUxMTR6UlptNW52eU4zYzlpY3RsOUUyejhOd3NsWmw3anky?=
 =?utf-8?B?SmFRb2JnNXErNEtDNVhXb3JCREUrYlJDaHcxY1pOVWl6R2JYOUhWd1o5SlNm?=
 =?utf-8?B?Z1RjOXNaYjdFOFh6amVJNVkvdGovcDNlNFA2QjR0TEpJaDZJZW9tTmc3RlJD?=
 =?utf-8?B?cGdhc3pGR1hyNTQreDJnM1RETHZGeHpjb2dmZjdmMDBYcCtCS0YwSWN0UitF?=
 =?utf-8?B?OTc3R1E1MG9IMG93aTljTXlJRjlTREVTNmw5Q1hvSGMwQXVqOGxaSkFpVFhH?=
 =?utf-8?B?M09EeFB4ajRZWE00OVNEeHk2MDhMOVg3YytUWGNmSjY0ZEtkNC9LRmVaYndH?=
 =?utf-8?B?SlptNWkvK2M3MVRGZTBadjVVNDB5MjlNbzFzR01VQm9CK3dXdWdiSmg0bnNT?=
 =?utf-8?B?S0dxMkZYMGVudGpxYS96LzQybk43akw1akhERnNkVWd0SFppaTZZUzlEMUlN?=
 =?utf-8?B?eTNqREg5bVRYZHFzOHp6TEk2eXpnY3VnUlBVUE9nRC9PdXZUbFZEMWR1NnhB?=
 =?utf-8?B?OE90UFRmdHB4TGl3WEJFNEdZRFNwQTh4L1NLWTRMR2IvRGFVcEtsR0t3T1RR?=
 =?utf-8?B?YUdmSjgrRHJOeThqMDhXODBvU0sySFkyeHVVcXF2bU1NK2xGRFo2VjJHVC8y?=
 =?utf-8?B?TlF5SVlOdDdWaktCZlZuOGNXdEdZVHR2c2xPb0RscW1uVUxFOWZyc1hza0pt?=
 =?utf-8?B?THU3MzNKUDEyZS96TGl0LzJINWJYVC81WHNSdllzQlplelJJTFRhTkkrN3pw?=
 =?utf-8?B?SzE3ZlBmMzhBT2prNFlyY1VMNEkyMXZweHBQV1ZYOG1iNTRBcnYwUzlOMXUz?=
 =?utf-8?Q?kywVWExwJ2llwW0TD6FVxSdH4Ya8bmzU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjI2MnF3WjJGVEZqZXROaStjb01ILzlOSEJpWldwSWJEQ0hpRDE1SEROZXhX?=
 =?utf-8?B?Vk5Pa2lFK3NOTC9UTXNNcUpJZ0oxb0NIZjNOUXBicW1FckxwLzdQd1kycUVn?=
 =?utf-8?B?a1ZzQnM2Wi82YkxDWXhicm1DNnFrWnArMWZJK0RaaFpqcmlHZWJmOFZ6bEVX?=
 =?utf-8?B?TDlMQVRLaVpDSm9EVkV6WDh1Q1VGVFQzTUtiRk9TRUswZUI4VCt0Smc3bmRT?=
 =?utf-8?B?dlVDeThZa3kvbStFOUhGa3B4a2JtZXVNU3ZpZUxRdjFNM0hBRG1GQlNJTW1i?=
 =?utf-8?B?M1M5U2xCUGE5V050cThDMXR1dzgxQW1mWWNoMHFTd1V5K2tmam9UUlMyN0p6?=
 =?utf-8?B?SGJ2MXhmek92bUpKeGVUUElNR3NSd0RuRXZ1anRoU3E4cXlUazM4TjBSQWJZ?=
 =?utf-8?B?K0pYV2hsM0dQUGdncWhPNkZycVJ0dWdWOUI0M2JNS2pYa2FOTkg4Tk5OR1lu?=
 =?utf-8?B?bWFWMElIM1hMazYvYUJaODJwbTJVd0EzYXQrTVVMYkpka29TTkVLZG1sVWgz?=
 =?utf-8?B?UFdaTWpvVTR1bmZXWVhHOFJZVDFOcVM3VnpTZHkraXBFcWl2ODlEKzhUWjBk?=
 =?utf-8?B?UWZSNVo2aWtmZ05FV0N2RW5GUTMydjJxYjdqajZiQS9SWjQ4a3RXN3BxMFh0?=
 =?utf-8?B?am9FelhPOEV6aTlkZFl0VVYxVUNnaHJoNDIySU02NU5nUkJyNWJYTjJSVkhB?=
 =?utf-8?B?STltTENCK3FRWklBNHJyN2liSFRTbXdOK0FDQlBYNWFydG0xaHp3cFJvblMx?=
 =?utf-8?B?MFlsa2xQa1lHZFVoRmN1RUlsdEtILzh6QkIzVUMybkNyc2R1TlBhVEdMdDdK?=
 =?utf-8?B?dWtsc09Sc082SXgwb0svLzJPRk5wSE9qV2NaWlJ0ZW5OdXNtSy9PclNIMFkz?=
 =?utf-8?B?QzMzNnB2OExXV0lDZ3FLeEg4cjhpTnFxNDZPMWxvL3N1WFVXdkRMSjBzSDcz?=
 =?utf-8?B?NGNLMEtkU2FKS2hWNjdGaExpTDhsT3BsQ01nK2lYek9XWkVaeHM0eGZGeDNr?=
 =?utf-8?B?SmVPaDBhL3VINHpWQldvNWU4cEV6bVRZYm91NlRUZ0dUbUdZemJHVnpKQVZw?=
 =?utf-8?B?S1BOanRkTXNMS2twazB6WkNESHFLMXAwYXFnSHRicUkyQ0R0L21MVUdMQ245?=
 =?utf-8?B?T2NNSmlOU1p4R3FhSHlBdjkrb3NvU2E4ZWdYTldpZVJsTXlHSGUxZ2ZsMFNH?=
 =?utf-8?B?WnRtSkRFejlVNDF4VGFOKzQranM3SzlEUk9GR3NIRFdueGw4ZjJNVFRXSG9p?=
 =?utf-8?B?T3FocTRTSy85cW55ZkRXWHRYVTZENGN1Ykkvb2lsSnBzSUM0YVN4Z1hqcEpN?=
 =?utf-8?B?WC9icWExUWxkZ005OTdyTWlBRHgyN1FLSFV0L0VFejA5cGtZVVVlOHNVSlZM?=
 =?utf-8?B?ZlM3V2xoc1RiM1VBOTgyQXdiZnBIcHhrNHdUSmo5OFlGeWpSWXNDb3pSSDFn?=
 =?utf-8?B?NjBhMndKNHp1WnNxN1BvaWRFTkhtVGxJN3NoUndmUlVSMHdvcCtNQklWSTRl?=
 =?utf-8?B?YzVySDhlUzk1OXdUU2ZzbjlLblBCK01rdjZyeG9uSk02NzNSSHM4SXJrTlFu?=
 =?utf-8?B?QSt3bis4Q3pGM2VadEl2UGRRZDNUV3RubUVKUUlJcXlRWnBRTGJONWFSNEhk?=
 =?utf-8?B?RjBNRWQrbHJwTDFNS04xODcxZXdySTNtdVhhL28zcUtOTGlaaXluekVSUTZT?=
 =?utf-8?B?ZUFQWW1CWFFwbHJrVEQyYzRHa3FMWThVUERBa1k5VjNaVnhvR0hNOEZLTDlk?=
 =?utf-8?B?UFVQMEVoUjl4dHVlYjRzUmFsZFQ1NTlMOVZvdWZTdzdsZHRBRENCVTJLMkUr?=
 =?utf-8?B?dDM5T1h4bVFSOURmZWxCa0dhQUNsbkhlbTBhdkE2Qlp3cTg2Rlc1NnJRUG1l?=
 =?utf-8?B?bStLNSt3OU5qMzEyVkVzY1NQbnZUOThwZHRXZ09kc25LN1NaVncybGxnaXhT?=
 =?utf-8?B?RUUzdzdORk5JdEtVMzRIUU5yMTkvUnlCZ2dDdnJDSmdtbXIrM0NFdjlCTVlC?=
 =?utf-8?B?TXgzUEdLVW1ra3lybGFvVkVRTDRxTjMrUXVTRVZLSWFhbHhCOTFiMW84Z2Vh?=
 =?utf-8?B?OUVzRTFldkxIOVR2QVdWb2dIRUlQRkhYcnVOWWh1NVArUUEvY1h2Z0U5Vkxh?=
 =?utf-8?B?TGJaVktyekdnNEdLajNtcjVBb29odm9BMzhGQmxTK3VkSzVaeWltWEFibGFa?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa028740-4e63-465e-bfc2-08de16b6e58a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 06:46:32.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hWkZXbFGj982IoGyhPbRvI6QWuFvjzzJ0yzsUcFOfXkIO6wtyPuS4bsKYdC9QIEFe6+FlbRYY9Zbeh07UevZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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

Hi Mitul,

On 28-10-2025 02:13 pm, Mitul Golani wrote:
> When IGT runs for multidisplay config it is required to
> recalculate expected refresh rate from test when
> TEST_FORCE_RR flag is not set.
Use imperative tone in commit message.
With commit message fixed.

Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   tests/kms_vrr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 73c556a68..bcb756202 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -350,7 +350,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   	data->vtest_ns.max = igt_kms_frame_time_from_vrefresh(data->range.max);
>   
>   	/* If unspecified on the command line, default rate to the midpoint */
> -	if (data->vtest_ns.rate_ns == 0) {
> +	if (!(data->flag & TEST_FORCE_RR)) {
>   		range_t *range = &data->range;
>   		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(
>   						(range->min + range->max) / 2);

