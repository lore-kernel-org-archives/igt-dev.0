Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58849EEA870
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 23:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7363E10E799;
	Thu, 12 Feb 2026 23:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RtlucQrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C480810E77B
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 23:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770938936; x=1802474936;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2CJeNCLFNaOsjoHdHOoxU5xufLmMkxpdV/dvpUYl08g=;
 b=RtlucQrnwsbk8IDKERcqftFATaOztMuPBt/NyC2OQQylvfoouSGTfvl2
 zuCXAau5ZarTeOwwVvdUSaCratZwutRkzqSoO4f2jpz8Rr9kJoqmxfrvu
 mO9QoDW46XgEqMncmjow2hlBkSO3n7SHi0lez49TtFkXiVlcf262VNXnQ
 rUmwIthqOR1ntpIqifXEFnNbSF3HG8e4SBe5E7QuiJChMrOlga7gA2X0V
 pYY/pI4OrSA0Y7lBTy1Rh6FPT/ESOGI7jFy6/QzFTXicfSn8pTPnQ3GkD
 ybbwnQH2wwE8g0MMEhN9LdnRC1mOEqyrFsKC0XSbjwVSv1wq1rlD3O7gf w==;
X-CSE-ConnectionGUID: uRnVIPcxQHiXyJCMNPHgTA==
X-CSE-MsgGUID: fcJ65d6CQYa7Mg1VT0gA0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89709255"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="89709255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 15:28:55 -0800
X-CSE-ConnectionGUID: C27JxOPKSHuQIYYmWv9W/Q==
X-CSE-MsgGUID: Bd5UDPVqQC6Y/YfcJbVZeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="211512657"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 15:28:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 15:28:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 15:28:54 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 15:28:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdgV3+hPnJhduI57v2l/+dde/W2fDz0OfTJhBZlYx8ASQk038Ah0gSkoCmY8jyIa0sNhZ9VsnUp23XY9kp0WGPBsemdgfOOzDXMKI0Ote/2BLJCVdXzDOnaQF5ghhZNvKKyP3COshD5XNGlM8NKQwoqASv9a1O4RHX/gzkpAK/ovEnTIyXXI+DEpl7whFZVeU/bQkTAd6xK2LeQMkgnJOsuPd3lavPVWqXuYtfEIfJGXrbTWZM5YyXm6JlqRTLbFgaf3FfNG0jKPtPM5c5GPxswDScsG4x5y91ruQk0qMKbraL8Z5Di/c8YerwrqIycK8j7eI1jR3+1xZv8cadHN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wasau3n3T6XQChfJyPYeTv6AJTisRsHCRcCNs4f9wTA=;
 b=EyZlYKvljsXQ0ZMAtSOpf+4VrveTfWMjo8RH01fmldRPwB5TZVuM7Xj9V50laGp9buroJg71VzA6TYBmyjz3Web+h/TGoHpy2m2+IggBgu/74ChsSo9WV+VNtQ6/vwxJGKE5EADf3iDqu/Y/yGR6lJUtUx1V6tNRd0aGEgj4BPIJeTkeSQyTUP/OHwtXU0WXL3+em0vnn2V2SvbfdiWIDfGABGdVkhxJb8Ydgyu5QPTEy0ZPl66LruRBSa8fKnAbiSQx4k382IDtjQJXCGalHRae0mvmf3+vvZxTCJuQAh+b0H1YKtj4st3YbvUj6PLIBB3Tvhv0p3FZsDq8tt/w9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by BL3PR11MB6505.namprd11.prod.outlook.com (2603:10b6:208:38c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 23:28:51 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 23:28:51 +0000
Message-ID: <0bd96bbc-fd89-4b04-a203-8784a5d9701c@intel.com>
Date: Thu, 12 Feb 2026 15:28:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 4/5] tools/gputop.src/gputop: Enable support for
 multiple GPUs and instances
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>, <ashutosh.dixit@intel.com>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20260130095318.644256-1-soham.purkait@intel.com>
 <20260130095318.644256-5-soham.purkait@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260130095318.644256-5-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:a03:180::32) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|BL3PR11MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: 8247d291-82d8-4d6f-d012-08de6a8e7a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmlXZVkxQ0pvdEw1VjFvb3RCUDlhOWxYMnhiVWY3L2pCM3B1UDFTLzRRL3Fo?=
 =?utf-8?B?b1d3a0FLZGtrb05QU0g1TldnRnhDOG5NUzJtUTFzdDMwQmROTVpPL0I0Ly9h?=
 =?utf-8?B?WFZyWWYrblc3Rk9vVkltdmZ6aEswaDhaeUk5VU9tMW1HT05SOGNFRktNdERM?=
 =?utf-8?B?cytEcHBHekxTZ3hKVHlTQm9tdklTcTdWaUZSdVBNVW5HTXRqNG5CbmZ5cEdH?=
 =?utf-8?B?VnhQNlV4b0xUdnZJTSt2N0poWjA1L1BxMTh5a3VIQnp0VVB6Q2psYTRRQU1M?=
 =?utf-8?B?dWM4Q05hUFpIUFRzSFdPWk95WkNwM0pQaUtPUXFNUURjWURNT1BYNjlBRGhi?=
 =?utf-8?B?S2lKMWZXZWY3blRaeG53ZkhDdmNVQVBsclpzN1JDNUxlWGNIRVpRSmhHS3cr?=
 =?utf-8?B?L0NEZ29xTWFjTEV3ZWdkOXhaZGFQWFY1aE9QWXdZNnd0NGNQQlE4WDBjbXdl?=
 =?utf-8?B?Sm45V1FwMStscDM0ZWozRnB1bEQ5ZHY0WHZteWlYMW9YVnhPSEZuaTJ5ZDNu?=
 =?utf-8?B?dDNpdTZ4aGhRalIxdnlzdDlPMCsvNEtZSTB6eklZbjJBcWswMVVhZXlLY0pG?=
 =?utf-8?B?aVRHcWdlVGJHTXJrNVZSeENFdytaam1VbG1FSWRtaU1zMElMTVB4c1ZzRUVU?=
 =?utf-8?B?ejdRYzNYa1VVV3dTKzVPcFV1dEZQbEQxR1NBeS9RMnU2aW1kcVMydWxoMFNX?=
 =?utf-8?B?ZzRlWkU3dWZLTmFFanp5SVRTQUtqZXNWaFVXU1QyZG00eWYyVTIxcEROa3V1?=
 =?utf-8?B?QkFxbnhTTlF2RllvdUwyVzJ0eGdnOXpreVBDaVRURVpES3lTeGFBc0VsWFhD?=
 =?utf-8?B?VVRQQ3BvUmZBUFVFemRuTERUWHNsdytMd0xqV2prOFBkaU1FU21jcFRXQWJq?=
 =?utf-8?B?aGt0ajFIdk9NT1l2amh6SHM5ZmdWQ01JQnp0ZzNXZ3Y2Nkh5MTlaZVZuWHBp?=
 =?utf-8?B?OTQyQkR0dUVxa29KZmpkU0laeXpkZTRabzdwOS9ZS3ppaVBKbXF6dTNKSTRC?=
 =?utf-8?B?N3BuWkM4OGJwMFk0RnBHWm9EQ1BnMi90ejByS2ZRQXBpbmxhejRiemo1NlZ0?=
 =?utf-8?B?TVBRQ29HdElmMlFZejI0SDJhYTU2Unp0WTZGUTROQTFtZnJNZkdnUHNlL0pO?=
 =?utf-8?B?eTYvVjFCOTdCSC9PMll6bGU0R3B2VitIU050dktCb3F0clBhbmVqUzhmUTdB?=
 =?utf-8?B?VkVOd2tQZzdvazlXaWtWWGVscEhybDhrdGpqK2lzYk9TZCt2VHJGRC9VL2lz?=
 =?utf-8?B?U3hJWERGK3RlVzVFT3hiTEk5THErd2dXT2xmZkxpNW53eENVMThaTnRmSzhz?=
 =?utf-8?B?SjNhb0NZcXFBaUg0TVhxYUs5ZGVyd2RKT3kxTnNLYUcxejZZZTdaUWwxN2F6?=
 =?utf-8?B?QnRVaEtxbURvVWRmYWhxYlZ1VnowQWpJMlRaV1JzWEViOHFZZTBpVlJES2dn?=
 =?utf-8?B?bFlObG45NEJHcGp2bStLakUwcXd2aExZcWE1VWYvU0FkU1Z2ckVWMTAybHRn?=
 =?utf-8?B?S0lXVlFTV1NPcUszUUkyUVNFSXY1aUUyK0ZPZXZVWUkxWmpoWDJFM0xXS0I1?=
 =?utf-8?B?eHpvUFFGVGxBRWpEQlBEU2thQk9ENWdCK2RDOGtZdGRXdExQdloweEt4VlJP?=
 =?utf-8?B?b1UxdTJDTTRic2ladUx6R25lblRzOVpORWZJNm9TcG5BVDd4Rk8zQ3dEdUts?=
 =?utf-8?B?bkhoMEMvNHFVbVRZMVhNcU1rWmZzUjArZFhUbFZLQ3BXOE1qTTNVU2VEaTZP?=
 =?utf-8?B?WlRZQlpmVjU4OVplaWJpVTJBVHk4S2YvQWd3U3FiRnVvOWg0dThaQTc4ZGs5?=
 =?utf-8?B?dE5XVVVFL0tCQ0FUK215cUNMc29kTGNETDFXQWZ2Vm8rUUwwa0JvMEszd3Uz?=
 =?utf-8?B?ZEMydy9wd2VEVXNCZm1XT3hoNTRrOXpjcXNSVk5yYStIcXNCN0hFTWFDYkV1?=
 =?utf-8?B?RmNaU2pPNEVyWWJFSE9tZjh2QUhudEw1Y1FJd05oNmNxZ0dWL1lTMjEyRWdR?=
 =?utf-8?B?MEprT1QxK2lDa2ZPYkNHdkZFcEpmWEZ4VWlTMEMxQWVUZE5Gb2g3Uzc4L2FX?=
 =?utf-8?B?Z3pXTnFzVmhpeW50SWMrL0dqTWg3bEIzaGI2UGs5Q0pSYm1BZ3NuZU1lOU4v?=
 =?utf-8?Q?lGvOMNnYUSOa8jXYeqJStPTER?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7142099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDlzSTd4ZlVhMWtFK3BHeWRXR3B3K2VrMmIwcWFDRExKQjdoQ05pREp3aXVQ?=
 =?utf-8?B?RU9NY1ozdVNFdUNuOWVNalUrSjV2djAvUDJNNTBMYTIvQmhZUXVPdy94ZW9j?=
 =?utf-8?B?UGdNZjgrV2R2ckhyL3RCWFR6SHV3dEFBcFozVlZ2Q08rQUV3TFhaZmNOSzE1?=
 =?utf-8?B?Y3Bia1RDWm9lQlREZTRvZzdBTlpvd3NqUE05RnFhUG96ZnJUUzZEc3YvM2lS?=
 =?utf-8?B?amdjZC9MY0JLS1hib1NwNCttR0VvM0R1VlQ1b3JnRU1kZVVvdVJLV25hTjM4?=
 =?utf-8?B?TTgzeWtkS1VjV1R1My9UZldJTDd0SWNVSE82MGFPckQvdmhvOVM3TEZTcEZW?=
 =?utf-8?B?YVIzWHhxM2Y3dEZhZEVHT0JVM2lNVXMvTjRpT3dZRGwxd2FVVVI0aGZsQ2M3?=
 =?utf-8?B?dWNmRW9NWFg1TEhGOE9iZlBqc0N4TCtpdktsRUdTR1FsYzIwcGl4RFNkTWV4?=
 =?utf-8?B?a09MOWg2a05mN3cvTTcrR1YxOVdjUDZYRWxNVTNuQThoSW5SMHdCU21pdVJY?=
 =?utf-8?B?dmJlRHJ6YjV1ZFpoQ1FVRmZvZDJJbk43Z2RGeG14L1lMZXRPcmxQMHA1cndS?=
 =?utf-8?B?Wnk5OGJuazV6UGs0c2VVWTJ1b1pIUERRSERwSHJ2bWhRdnlqTlVTM0ZLS2NF?=
 =?utf-8?B?RXZSVTFpVThqNkN1UXRWRUUzWGFtY2E4SHJXUkh0SXlTa2cwVDAxRTBDMHdI?=
 =?utf-8?B?bTIyK0cwNkFyamM3VGZmSUo2NitiRlhIMnZaSW04T1JXbzI2UHA1TnhpT3Zw?=
 =?utf-8?B?cy9PdHFFVSt5OHJPVmtxL3c1RnFjQVFuc2x3M3dFMXBKSi8xVW1jY2luRXM4?=
 =?utf-8?B?RmxuSnloK3dDcjdJYmw2K3hXVjREVlB0aFhyYnlKS2M1ZjVzRkxDL2ZPWjZW?=
 =?utf-8?B?aWZTYlZ4a1JxOS9OakNmN3JnTXFFZDBkM0x5Q2FzT0ViMTdBeHRZNTFtVTdm?=
 =?utf-8?B?QTZQcWVrVDlwazRzbysyR3BwNlR3aXMyb2xKMWMrLzQ2OXNsckNlTnZDeldE?=
 =?utf-8?B?Y2RsZ3RCRUF0UFd3NUVEZGcxczc3VHBKajBUbVZUR3VmekorbGJLNzhwUVVP?=
 =?utf-8?B?NFp3TGRkVnZ6MUJ1WmxSRld6czRWQ0lnc3JpbzJmQ0t3UHQrbURlZVUyYWhz?=
 =?utf-8?B?S1ZCY2NDZlhCRWVpSkRjRmxkSEYrWWtTZ3JoWXQ3aWQ1aSt6eGhQejR6cVVQ?=
 =?utf-8?B?YUVUcmx5dklwaGxWTE50NnphR2lCQ0Q3UE92OHpNZDZEaHpnbmJiNGxwV3dD?=
 =?utf-8?B?UlVtUy9NR3kyQ2VPUHFIMWhNWkNzNksreWYvb2lhQUJRcXprUEhValJhTXZl?=
 =?utf-8?B?YlZ1SERGY3dWdmtWaFlEZkExMld1TkxhdlRtNnJ4ZjNVeXFRN0ZLdElFdTVF?=
 =?utf-8?B?WFEvUjdvT3dxQ1ZpUHFVTjl6aDNMM3k1b3ZrUXlFUGQvc1U1U0h6U2RUWVFG?=
 =?utf-8?B?aWVHek9yemI1UGRrRDVPRWluZ1FZRWZXbzZjMDFuZ1VNdkVNTGd1WUVsYUxM?=
 =?utf-8?B?aTVheFFyd1hWN0MyMVBEcVAzcElUT0ZvRTMwNFp4eDY1bWY1TlV1RXg3TTN5?=
 =?utf-8?B?YTJxbll5OTQxayszUVpiSkVQcCtYUVBKeERZWi9rSDczMmFRaFJ3Y0l4cy9t?=
 =?utf-8?B?V1IzcVZxZExnUVY3ZTJkNGJVRW0zUGVBaGptVHFQZmVueERGMjRINDlrZEVD?=
 =?utf-8?B?UW9Ib1ZoWHR2dC9ZTWRVbW5iaXArUGo2dVVQQ2dYNkd3WFBWTEFnSTVqaHY0?=
 =?utf-8?B?Sm42S1Q5QUZlcmlkOU5lc09VZ3VFcjhXZFUydXVsMy9XcnZ0RDR3NXg0SC9V?=
 =?utf-8?B?Ym82Q0pjQk9QMithSlI1WUhyV0Q3c1k0Vlc2Vkh4ajZEeUw3dzFNR3R0SmJx?=
 =?utf-8?B?ZzU0RVZ3UzhjWDZ1Nmd2NXMxeWN6TmJsUjFjbWVreFE2cm5aMGM2eWYrdkM1?=
 =?utf-8?B?aFo0dXFLUlY3UkVieVliREtBNVdjMXNrSWY5YWorT2NTOENWUWg0U2dKblZH?=
 =?utf-8?B?WU9nQ3lwaGx1c1d6VlU3NUE2RlZSM3gxSytvclY5RU5KcldXamM4bFJqNGtL?=
 =?utf-8?B?dFBpUzlwNEV2YjBkY2pJN29MQUJENXpUMkdJbWVmTGlKT2kzTlBMNWlSU2JJ?=
 =?utf-8?B?QWs4TUJBZWZoQUxlcHRtVm5sakMzamE2RmdLUmx1aVlKMjFDdUlZUHdaUFVX?=
 =?utf-8?B?WDBxNGRvZVZORlJjeUYydTFHRDVsYjRzZk9OLzNlNGVSbDN1UXc4Q2lLKzlX?=
 =?utf-8?B?TnZlN2RuR2V6OHRDaTNldHRXTUJ6Z3ljc3RtNTRpYndBTktCSFA0V1czL09X?=
 =?utf-8?B?ZW50RDhiTTlUKzEzeWhhZlE0RmxEZG9FQXJxaG52dXAvTlFrZkdKUnp6d1VR?=
 =?utf-8?Q?GSHFFfxAI5jCuRTY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8247d291-82d8-4d6f-d012-08de6a8e7a86
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 23:28:50.9046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jytS89NYT4hf4rBohD5jdG8kiDiJV/AFyTG05mUlDLMiolUoyk2Up0/KxSXj83osm9WS+NSpfuE1/oVsjYXYY6fuAEeIR59CkQTQz6G37bU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6505
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


On 1/30/2026 1:53 AM, Soham Purkait wrote:
> Introduce vendor-agnostic support for handling multiple GPUs and
> instances in gputop. Improve the tool's adaptability to various GPU
> configurations.
>
> v1:
>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
> v2:
>   - Cosmetic changes. (Riana)
>   - Avoid three level indentation. (Riana)
> v3:
>   - Add device filter to populate the array of cards for
>     all supported drivers. (Zbigniew)
> v4:
>   - Add user message for running without root privileges. (Kamil)
> v5:
>   - Add support for GPU client-only busyness on unsupported
>     drivers as a fallback mechanism. (Kamil)
> v6:
>   - Remove unused dependencies and headers. (Kamil)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tools/gputop.src/gputop.c    | 278 +++++++++++++++++++++++++++++------
>   tools/gputop.src/meson.build |   2 +-
>   tools/meson.build            |   3 +-
>   3 files changed, 240 insertions(+), 43 deletions(-)
>
> diff --git a/tools/gputop.src/gputop.c b/tools/gputop.src/gputop.c
> index f577a1750..7d4515f8f 100644
> --- a/tools/gputop.src/gputop.c
> +++ b/tools/gputop.src/gputop.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2023-2025 Intel Corporation
>    */
>   
>   #include <assert.h>
> @@ -14,66 +14,145 @@
>   #include <math.h>
>   #include <poll.h>
>   #include <signal.h>
> +#include <stdbool.h>
>   #include <stdint.h>
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
>   #include <sys/ioctl.h>
>   #include <sys/stat.h>
> +#include <sys/sysmacros.h>
>   #include <sys/types.h>
> -#include <unistd.h>
>   #include <termios.h>
> -#include <sys/sysmacros.h>
> -#include <stdbool.h>
> +#include <unistd.h>
>   
> -#include "igt_core.h"
>   #include "igt_drm_clients.h"
>   #include "igt_drm_fdinfo.h"
>   #include "igt_profiling.h"
> -#include "drmtest.h"
> +#include "xe_gputop.h"
> +
> +/**
> + * Supported Drivers
> + *
> + * Adhere to the following requirements when implementing support for the
> + * new driver:
> + * @drivers: Update drivers[] with driver string.
> + * @sizeof_gputop_obj: Update this function as per new driver support included.
> + * @operations: Update the respective operations of the new driver:
> + * gputop_init,
> + * discover_engines,
> + * pmu_init,
> + * pmu_sample,
> + * print_engines,
> + * clean_up
> + * @per_driver_contexts: Update per_driver_contexts[] array of type "struct gputop_driver" with the
> + * initial values.
> + */
> +static const char * const drivers[] = {
> +	"xe",
> +    /* Keep the last one as NULL */
> +	NULL
> +};
> +
> +static size_t sizeof_gputop_obj(int driver_num)
> +{
> +	switch (driver_num) {
> +	case 0:
Might be worthwhile using an enum like INTEL_XE_DRIVER instead of 
hardcoded values.
> +		return sizeof(struct xe_gputop);
> +	default:
> +		fprintf(stderr,
> +			"Driver number does not exist.\n");
> +		exit(EXIT_FAILURE);
> +	}
> +}
> +
> +/**
> + * Supported operations on driver instances. Update the ops[] array for
> + * each individual driver specific function. Maintain the sequence as per
> + * drivers[] array.
> + */
> +struct device_operations ops[] = {
> +	{
> +		xe_gputop_init,
> +		xe_populate_engines,
> +		xe_pmu_init,
> +		xe_pmu_sample,
> +		xe_print_engines,
> +		xe_clean_up
> +	}
> +};
> +
> +/*
> + * per_driver_contexts[] array of type struct gputop_driver which keeps track of the devices
> + * and related info discovered per driver.
> + */
> +struct gputop_driver per_driver_contexts[] = {
This is already per driver, no need to add that in the name? just 
driver_context or pci_driver_context? Also, where is gputop_driver 
struct defined? (Didn't find it in this patch set)
> +	{false, 0, NULL}
> +};
>   
>   enum utilization_type {
>   	UTILIZATION_TYPE_ENGINE_TIME,
>   	UTILIZATION_TYPE_TOTAL_CYCLES,
>   };
>   
> -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> -
> -#define ANSI_HEADER "\033[7m"
> -#define ANSI_RESET "\033[0m"
> -
> -static void n_spaces(const unsigned int n)
> +static void gputop_clean_up(void)
>   {
> -	unsigned int i;
> -
> -	for (i = 0; i < n; i++)
> -		putchar(' ');
> +	for (int i = 0; drivers[i]; i++) {
> +		ops[i].clean_up(per_driver_contexts[i].instances, per_driver_contexts[i].len);
> +		free(per_driver_contexts[i].instances);
> +		per_driver_contexts[i].device_present = false;
> +		per_driver_contexts[i].len = 0;
> +	}
>   }
>   
> -static void print_percentage_bar(double percent, int max_len)
> +static int find_driver(struct igt_device_card *card)
should be find_pci_driver?
>   {
> -	int bar_len, i, len = max_len - 1;
> -	const int w = 8;
> -
> -	len -= printf("|%5.1f%% ", percent);
> -
> -	/* no space left for bars, do what we can */
> -	if (len < 0)
> -		len = 0;
> -
> -	bar_len = ceil(w * percent * len / 100.0);
> -	if (bar_len > w * len)
> -		bar_len = w * len;
> +	for (int i = 0; drivers[i]; i++) {
> +		if (strcmp(drivers[i], card->driver) == 0)
> +			return i;
> +	}
> +	return -1;
> +}
>   
> -	for (i = bar_len; i >= w; i -= w)
> -		printf("%s", bars[w]);
> -	if (i)
> -		printf("%s", bars[i]);
> +static int populate_device_instances(const char *filter)
> +{
> +	struct igt_device_card *cards = NULL;
> +	struct igt_device_card *card_inplace = NULL;
> +	struct gputop_driver *driver_entry =  NULL;
> +	int driver_no;
should this be driver_num or driver_id?
> +	int count, final_count = 0;
> +
> +	count = igt_device_card_match_all(filter, &cards);
> +	for (int j = 0; j < count; j++) {
> +		if (strcmp(cards[j].subsystem, "pci") != 0)
> +			continue;
>   
> -	len -= (bar_len + (w - 1)) / w;
> -	n_spaces(len);
> +		driver_no = find_driver(&cards[j]);
> +		if (driver_no < 0)
> +			continue;
>   
> -	putchar('|');
> +		driver_entry = &per_driver_contexts[driver_no];
> +		if (!driver_entry->device_present)
> +			driver_entry->device_present = true;
is this check only for reassignment of device_present or should it 
include the below statements as well?
> +		driver_entry->len++;
> +		driver_entry->instances = realloc(driver_entry->instances,
> +						  driver_entry->len * sizeof_gputop_obj(driver_no));
should this be renamed to driver_entry->engine_instances so we are clear 
about which instances this refers to?
> +		if (!driver_entry->instances) {
> +			fprintf(stderr,
> +				"Device instance realloc failed (%s)\n",
> +				strerror(errno));
> +			exit(EXIT_FAILURE);
> +		}

should these be under the conditional if check above as well? Or will we 
end up incrementing len twice and duplicate realloc? Unless this refers 
to driver instances?

Thanks,

Vinay.

> +		card_inplace = (struct igt_device_card *)
> +				calloc(1, sizeof(struct igt_device_card));
> +		memcpy(card_inplace, &cards[j], sizeof(struct igt_device_card));
> +		ops[driver_no].gputop_init(driver_entry->instances, (driver_entry->len - 1),
> +			card_inplace);
> +		final_count++;
> +	}
> +	if (count)
> +		free(cards);
> +	return final_count;
>   }
>   
>   static int
> @@ -335,6 +414,28 @@ struct gputop_args {
>   	unsigned long delay_usec;
>   };
>   
> +static void countdown(const char *msg, const int start_sec)
> +{
> +	struct pollfd pfd;
> +	int i, ret;
> +	char ch;
> +
> +	for (i = start_sec; i > 0; i--) {
> +		printf("\r%s%d... second(s)", msg, i);
> +		fflush(stdout);
> +
> +		pfd.fd = STDIN_FILENO;
> +		pfd.events = POLLIN;
> +
> +		ret = poll(&pfd, 1, 1000);
> +		if (ret > 0 && (pfd.revents & POLLIN)) {
> +			while ((ch = getchar()) != '\n' && ch != EOF)
> +				continue;
> +			return;
> +		}
> +	}
> +}
> +
>   static void help(char *full_path)
>   {
>   	const char *short_program_name = strrchr(full_path, '/');
> @@ -349,7 +450,32 @@ static void help(char *full_path)
>   	       "Options:\n"
>   	       "\t-h, --help                show this help\n"
>   	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
> -	       "\t-n, --iterations =NUMBER  number of executions\n"
> +	       "\t-n, --iterations =NUMBER  number of executions\n\n"
> +	       "Running without root:\n"
> +	       "\tAs a non-root user, CAP_PERFMON or perf_event_paranoid is required to\n"
> +	       "\taccess engine busyness\n"
> +	       "\t" ANSI_HEADER "Steps to run without root (using CAP_PERFMON):"
> +		ANSI_RESET "\n"
> +	       "\tcd /path/to/igt-gpu-tools/\n"
> +	       "\tsudo setcap cap_perfmon=+ep $(pwd)/build/tools/gputop\n"
> +	       "\tsudo sh -c \"echo $(pwd)/build/lib > /etc/ld.so.conf.d/lib-igt.conf\"\n"
> +	       "\tsudo ldconfig\n"
> +	       "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET "\n"
> +	       "\tsudo setcap cap_perfmon=-ep $(pwd)/build/tools/gputop\n"
> +	       "\tsudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
> +	       "\tsudo ldconfig\n"
> +	       "\n"
> +	       "\t" ANSI_HEADER "Steps to run without root (using perf_event_paranoid):"
> +	       ANSI_RESET "\n"
> +	       "\t\033[32m# Save current perf_event_paranoid value\033[0m\n"
> +	       "\torig_val=$(sysctl -n kernel.perf_event_paranoid)\n"
> +	       "\tsudo sysctl -w kernel.perf_event_paranoid=-1\n"
> +	       "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET "\n"
> +	       "\t\033[32m# Restore original value\033[0m\n"
> +	       "\tsudo sysctl -w kernel.perf_event_paranoid=$orig_val\n\n"
> +	       "\tFor details, see 'Perf events and tool security':\n"
> +	       "\thttps://www.kernel.org/doc/html/"
> +	       "latest/admin-guide/perf-security.html\n\n"
>   	       , short_program_name);
>   }
>   
> @@ -417,9 +543,12 @@ int main(int argc, char **argv)
>   	struct igt_profiled_device *profiled_devices = NULL;
>   	struct igt_drm_clients *clients = NULL;
>   	int con_w = -1, con_h = -1;
> +	bool is_root;
>   	int ret;
>   	long n;
>   
> +	is_root = (geteuid() == 0);
> +
>   	ret = parse_args(argc, argv, &args);
>   	if (ret < 0)
>   		return EXIT_FAILURE;
> @@ -428,6 +557,53 @@ int main(int argc, char **argv)
>   
>   	n = args.n_iter;
>   	period_us = args.delay_usec;
> +	populate_device_instances("device:subsystem=pci,card=all");
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		if (!per_driver_contexts[i].device_present)
> +			continue;
> +
> +		for (int j = 0; j < per_driver_contexts[i].len; j++) {
> +			if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
> +				fprintf(stderr,
> +					"Failed to initialize engines! (%s)\n",
> +					strerror(errno));
> +					gputop_clean_up();
> +				return EXIT_FAILURE;
> +			}
> +			ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
> +
> +			if (ret) {
> +				if (errno == EACCES && !is_root) {
> +					fprintf(stderr,
> +						"\n"
> +						"Running without root privileges.\n"
> +						"Engine busyness may not be available "
> +						"without root privileges.\n"
> +						"See \"--help\" to enable engine "
> +						"busyness without root.\n\n");
> +					igt_devices_free();
> +					gputop_clean_up();
> +					countdown("Resuming with only gpu client "
> +						  "busyness in ", 5);
> +				} else {
> +					fprintf(stderr,
> +						"Failed to initialize PMU! (%s)\n",
> +						strerror(errno));
> +					igt_devices_free();
> +					gputop_clean_up();
> +					return EXIT_FAILURE;
> +				}
> +			}
> +		}
> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		for (int j = 0;
> +		     per_driver_contexts[i].device_present && j < per_driver_contexts[i].len;
> +		     j++)
> +			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
> +	}
>   
>   	clients = igt_drm_clients_init(NULL);
>   	if (!clients)
> @@ -449,22 +625,42 @@ int main(int argc, char **argv)
>   
>   	while ((n != 0) && !stop_top) {
>   		struct igt_drm_client *c, *prevc = NULL;
> -		int i, engine_w = 0, lines = 0;
> +		int k, engine_w = 0, lines = 0;
>   
>   		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> +
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0;
> +			     per_driver_contexts[i].device_present &&
> +			     j < per_driver_contexts[i].len;
> +			     j++)
> +				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
> +		}
> +
>   		igt_drm_clients_sort(clients, client_cmp);
>   
>   		update_console_size(&con_w, &con_h);
>   		clrscr();
>   
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0;
> +			     per_driver_contexts[i].device_present &&
> +			     j < per_driver_contexts[i].len;
> +			     j++) {
> +				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
> +							 lines, con_w, con_h);
> +			}
> +		}
> +
>   		if (!clients->num_clients) {
> -			const char *msg = " (No GPU clients yet. Start workload to see stats)";
> +			const char *msg;
>   
> +			msg = " (No GPU clients yet. Start workload to see stats)";
>   			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
>   			       (int)(con_w - strlen(msg) - 1), msg);
>   		}
>   
> -		igt_for_each_drm_client(clients, c, i) {
> +		igt_for_each_drm_client(clients, c, k) {
>   			assert(c->status != IGT_DRM_CLIENT_PROBE);
>   			if (c->status != IGT_DRM_CLIENT_ALIVE)
>   				break; /* Active clients are first in the array. */
> @@ -488,11 +684,11 @@ int main(int argc, char **argv)
>   	}
>   
>   	igt_drm_clients_free(clients);
> +	gputop_clean_up();
>   
>   	if (profiled_devices != NULL) {
>   		igt_devices_configure_profiling(profiled_devices, false);
>   		igt_devices_free_profiling(profiled_devices);
>   	}
> -
>   	return 0;
>   }
> diff --git a/tools/gputop.src/meson.build b/tools/gputop.src/meson.build
> index ec39f4c7a..e95657fca 100644
> --- a/tools/gputop.src/meson.build
> +++ b/tools/gputop.src/meson.build
> @@ -1 +1 @@
> -gputop_src = files('gputop.c')
> +gputop_src = files('gputop.c', 'utils.c', 'xe_gputop.c')
> diff --git a/tools/meson.build b/tools/meson.build
> index 521607a4c..caca57d0e 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -123,4 +123,5 @@ subdir('gputop.src')
>   executable('gputop', sources : gputop_src,
>   	   install : true,
>   	   install_rpath : bindir_rpathdir,
> -	   dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],)
> +	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,
> +	   		   lib_igt_drm_fdinfo,lib_igt_profiling,math],)
