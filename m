Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F3DCA0EE3
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 08:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2005110E128;
	Thu, 14 Aug 2025 08:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uxzt9miV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514C010E128
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 08:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755159404; x=1786695404;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p3yWdd7BJ85pgNsx4jDDbvxIcMT3xYoFOSf9Unt8G8I=;
 b=Uxzt9miVZE6BjF55gLakAB33kEpug2dDIxj2hfLXuCInD4dAsrJ3CtrO
 ThmudQxrCEtU8vzNP4HJ8G0Ov2TzumgFG+W6CedJ+h6EmDIupp8X2gu/1
 9Fp20EuooYIXb7VdowsJRT2l7Y6nJF+xpCB0nd5/1xeamx3LTLGx77djY
 7+NK7q8cpvRr4o86shGTFhGRTJ4dEEBJ9ngvQTTElyAHCJi5cY737U/Km
 XXDJTNNXp0PDuWRG4Z0dv1hqRXeUq8Hz+cPA+0SIPZnNR/KqaXSjdZzjx
 RaPoiHGOsvoE9pmtHdbM0K8xVOYIy5hYED5318vG9JTZ8vajOn673nCDw g==;
X-CSE-ConnectionGUID: kmNwiQ/oQWyp2coXNBTRFw==
X-CSE-MsgGUID: h/M6Vnd1RRumrwyLL8CylA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57422384"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57422384"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 01:16:44 -0700
X-CSE-ConnectionGUID: Y7Upk32cQnWnlFMBPGUw1A==
X-CSE-MsgGUID: t3ueQSwxTpGRTQ/6a1Pcgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="165880013"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 01:16:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 01:16:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 01:16:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 01:16:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRDy5Kkro3TUtEv7cLkK5jLY35sg/O5Ts4z6jbIxiDo8P7RSAPfrhAzzmY2SRjqXUZ3Q4MOcu03o1nQxFTCY6Mx6xc3oAqXlGjfzQNV/W2ISr+q5YZAFp5j49qXoLCGgtPN7ES48QyOydIDBdRRmV3n1529svBRC9aphT/ouSS17q9S/67DFuXwoOBgVEy76HBQ7ZcSoG+twxhagfMaSQkcfA6xPz1InycakW2RkEotzmr7sIIkeVDOJjFU5krctEp2WA/qSx06hGsFAghpUSHrbVmsFZf/ElAsZG9cKy8xncclz6gicC7Fjn5pPhrBt14yRtGVwc3b9QeMpTFB29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/jBkBaMftGCP3CkVprItRZI9MmbG1ftuacZHT/EVBU=;
 b=VGdLag9JOyZcK8Uzn+5rliacnAB0BtTLPtTpQqikIjazSpsuBtKgZEq6/zc6Qgx+pQwO59+5Ps+MW/fpRB31XgycVKMdzG2iJm6xF74IaguzPyQvJ7DHeGg9Xa/GOFudKBhIbC+obvKSm63/1Rtam9rG5Z4zfC0wo/GTYHPall13FbdFGT5Jg57np0gbQSvWwITfHFeayJ5XbuLvHeb3I+IOBZVT5Z+orVFePCScm47zd6Nri3/epH5gcFtlUSKpAgINzp/l9lh2J9O0cEMMZQXizGC+07V6Uv0i6J1Ee01X6AAZKfG3uIkDJZ2031ckDy83Q/rV5Dzq1vex6TICQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS7PR11MB6038.namprd11.prod.outlook.com (2603:10b6:8:75::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.15; Thu, 14 Aug 2025 08:16:35 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 08:16:35 +0000
Message-ID: <10fb758a-30a8-49d3-bdaf-30b4fefe207b@intel.com>
Date: Thu, 14 Aug 2025 13:46:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/kms_hdr: Handle HDR panels requiring DSC
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20250811075850.28146-1-chaitanya.kumar.borah@intel.com>
 <20250811075850.28146-3-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250811075850.28146-3-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::20) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS7PR11MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: d2217b34-bfb9-413d-69d4-08dddb0ae2b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHJXWHVsQXFXSlJFempGcjc4TERNOXhjVGc5WnlUOU83bkZJdmIrdEFEeVZ4?=
 =?utf-8?B?NU92U3phV25XdCtFL3NocWkxRnI2YnFOdVh5bkl4dU5weDByY1pEYW03N3g2?=
 =?utf-8?B?UFhLQkxwTFBUdzRaL0E3TSs1UzNnNEhjNVZJdTlyaWtNYXpkY0xmbzBNRmRh?=
 =?utf-8?B?Qk0ybFErTk1XTCs1RHd2ZEVKYnJXRVljT0dyU2gvNm9TbTQzV01QVjNRUm9o?=
 =?utf-8?B?NlkwazV3eUxFV1ZvdHRjNHBRUE04M1plNjdiZTZxa2QzNG5zc1MwT0lDMVRJ?=
 =?utf-8?B?Y1g2ajJzM3pibjh5YjVuWFNsS1VVSlo4anBaMlNOendWbHAwdzdlMDlVQmZm?=
 =?utf-8?B?R1FaejhPVVZuRkhRNTQwdFNKSmxBVjFqZ0M2cFNtSlNFb2ZBQ0pWeVpXZU5Y?=
 =?utf-8?B?VTBmaGRPTXJoUXRIV0gvRnBWbUFpWkhNTWRtZU52NzdoNkV0WVFGdUt5Ykpy?=
 =?utf-8?B?VWRQQWVvaS8zSEE4anh2WEpjcGFOcEtqREFoTE9qblhoYmZ4a05wQVlDNjU3?=
 =?utf-8?B?V3p6ek0xQnBBdURIK1hjbU1nMU15ZUtveTdYTUhKQ3ZLWDYxdUNvUHJoNlBW?=
 =?utf-8?B?TE9EcDJqdENRQTlVQ2IyaTdXVlgrb2JwNmVOY3habDhGNUI2MnJ0cG81TzI0?=
 =?utf-8?B?blpaUG9QUWNrRmhvc2pFSndJV2dETWZQM2tCUXlxekttMVYyd1o5OVZMOTZI?=
 =?utf-8?B?SUk3ZndET0crNVFRRXEyRzNZTk5mQ0ozNzZZSERtdnA2YjBreTBKbHdpWmdq?=
 =?utf-8?B?V0hwZVRLWEpwc3Q4citacXFuemlMcnBOMURMVlMxMDhYanRjVUdrc0cyeDNT?=
 =?utf-8?B?UG15QmpCY0Y5ZmViMWZPeGh5dWhPRXBuQUlRbCtBRkdlZFY2enJzbEZXL0Vn?=
 =?utf-8?B?RVZzNllLODdCcnBmWGxNbVVDNm1URFdoVGgxUVRXcGFONEdkVkdGSUN3emEv?=
 =?utf-8?B?NENjWDBHNENQZ1V0c3k3RDgrNWdxbHFxRjVVM09GcDhUL0wxYjU2dmU4azVR?=
 =?utf-8?B?dVMvYW5ub2duWk45WXV4WDd3bjVKNnd0dC9Kc0NwQzM1VFhYSHhudDZ5VCtW?=
 =?utf-8?B?M015ckQ2T0ZVSGZoQW9GYndKV0U1bjhBUk4zY2RPWUFLRXJjVGNtbDF6L1Ji?=
 =?utf-8?B?QXM2Z1JHZFZHU2FKQWJVVkdudFE1a2tTNzJOa2hHR3QxcjEzVTllVW9Ndzln?=
 =?utf-8?B?TmRuOXplU3pPeVIvZEtEOUdOb3h3NkdybldNRDBzQ25NQUwrOXB1Um5JeXhj?=
 =?utf-8?B?SEZUbkliYnZWditKYnZ3VVRMdGZ2bGxuZCt1SjJ2aHQyZWFiMFN3LzRva0V1?=
 =?utf-8?B?YVo4N3cxd1FIdGY2QkJRMzg5elVmRlgrK3dWYXFhRHE5VGVoMDR3Y01HZUlS?=
 =?utf-8?B?WlRvQzBWU1VRNzhIalgvN08yMFd5YnR1NzhsS2o4bUVKdkNtbXhlRlBNS09v?=
 =?utf-8?B?L0wyenFXekhDdXlJRFBDZzlSUE1rTXVuTDB0ZjZNdkEyQ1NKeE1MV0crcVRk?=
 =?utf-8?B?eWlrOVA1RmFqMnplN0RoU2VLVThldkpaa21rcnhvNWVXdXRIWEdnUDdyY2Vq?=
 =?utf-8?B?bXpDRFEvbVorWDNOT2FrWWdXeTNwMGRIYjFjb2drMjVXN09sS3p1cFpzNjZV?=
 =?utf-8?B?azlQOHRMNjFPMEE2Y3dPbDhUakp0UW92azh6amVBYlduL2lLMkJ2UUprU2Rj?=
 =?utf-8?B?OFB4RmpOalREZjJVVlRsYWV2QmhDWDNBbUl5VUpYa0NKOGpwVmVsT0hBdTl6?=
 =?utf-8?B?WDV2alBPZlF1bUNLVmpOd1MzV0pJZk11SUJ4NDZKVFlFVEVOSm8rYW9rMGpk?=
 =?utf-8?B?dHVET2lJU0R2UjgyTUI1LytwRjNiYUlONEp2Y2l2STIzNlVkNitBckNhQVhp?=
 =?utf-8?B?WWdnM1ZoRm5qVmdkVHJhekM1MFJYV0ZsbllQaHlhdGdiYXZrY0w4NDIrdlcr?=
 =?utf-8?Q?dMT1rIo+Fr0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3JjbkZkR1YvaVMxM3NYblREN3FFRmJaV0RDMW85NjIrNnhqbHQrSWJXR0My?=
 =?utf-8?B?cGZ5Mk8zOGJQSXA4cEl4Z2o1NXdVTFBNeU9VR3pVTnpZU2NCOWd6U2t4ejdq?=
 =?utf-8?B?SkV5anduU2dTL0o0ZmJiMWxvVWhjeUZSVVZmdlg2QWgrUWVIRWRIOW03Ry9M?=
 =?utf-8?B?aGdodjFwNnNPQjk5RVI3ZkhnMDJyd0dBM1N0WlkxTnVHZ0RaNjZQMVZyUUpX?=
 =?utf-8?B?MStXYTRsS0ZSaGRUc3NqZFlseWVOT2RDWC9FZk1tbVFiNU93Zjg5SjZiRVZ0?=
 =?utf-8?B?YmVpR3Y4TlpnZW9QSCtKeTk2elZLNC9BK3o1OS9lbVRkZnVtTGJhL2F5SjFH?=
 =?utf-8?B?UVUyS0dkTnhnM2V1eDBxVndmVCtIeTlKTTFuSFJRRmY2Sk1VNjhPcytwbHpW?=
 =?utf-8?B?Mm0rcWUwRTNBMHNXRFRDa3RMbGZwNmE5bytTOWpOSjlraGtCMndOZ2ROQjNp?=
 =?utf-8?B?OTFFS3lLUHJqRjYzTEo2blNjRm8wZXl2dUdVOUZXVm4zOHhVb1N4MldMTTAx?=
 =?utf-8?B?NzFEdDNhcE4wMkk1NTFYY2hyZkIrVlFkYXhYcThmNTM5K2hwQ1VQa2dCQ3RM?=
 =?utf-8?B?VDE1bzJ3dFowekZxZWo4U0k4ZmNwTGE1aUVoRHUxdmxmSTdRMzFVZGc5UWh0?=
 =?utf-8?B?UGVIWWdrR3ljZWlVbUdnS3ZXbnFES0lRVlErbDVSTUZjVndMNk5BVmgreVlx?=
 =?utf-8?B?OTNqMUVDR1huanRFR3R0S3B6VTYvck5ZUWk5bWw4eGxnU1FGWnF2YjV6aldz?=
 =?utf-8?B?dWRTbFNSQ1FnUko3STg3SU1sVkFqbGJmT0hicEZjQTk0cTJOak9QQ0RMSi9E?=
 =?utf-8?B?RDd3OGJlaVVFdGlTTmtsWmtqNDhFRWQzTnZrdkpmZ0pOWVkyRS8xNW5NaEh2?=
 =?utf-8?B?TnZYd3ZyenBmQWFYdTNRUlVpRlNCaTBqZWdOQ0lpTDZBRzR3KzVURFVBdHFR?=
 =?utf-8?B?a3VFajJ0cS9BRVBuaEowTGgrYUpSMjhhRjg3dDMvN2JvOGM3endaclBKR2VZ?=
 =?utf-8?B?Qmo3TllFRUJhVVJBeWw2Ri9iNmR5YW9uem1BQW1ZR0VXUjJ6VEszKzVCVzBu?=
 =?utf-8?B?NXBGY3NMaG04RGhCaVFGdUIwSkZpdmU1M0VJTndOQW40czhtRUdSRGJ1TGh4?=
 =?utf-8?B?UjJpSlpjZ1RHN1dGNHAyR3ZlOHJWU0FRdnpPcmptcUJ4NFlkQ215d3FibTlP?=
 =?utf-8?B?VndTT1gwQ2w4MnVpNk1lZi9CeGZnQ3BTUXhvTnZBRlBPaW1iYWx2TDJoeDFT?=
 =?utf-8?B?bjdBTWdEb2dqSVErdXVET25kKzljZUNONWQ3TDVnT3I1S3dWVzVZVi8xQzZC?=
 =?utf-8?B?akljTEE2dE5yYVFCTVdQdmhpM3BNTGhNUEJSU093VjQzSnBMV2RMNXFQRzR2?=
 =?utf-8?B?c1pFR1d1SXQ5WGZxUkRpZnd0cnBSV05pSGI1TVJ6ZXlaQ2FYR0hFSmdoTmtH?=
 =?utf-8?B?Um1uWjM0ZjEyYVZidVk2YWJZYi9pVm1rWjZMTUJUWlhoeDIvUTJZK3dpUytt?=
 =?utf-8?B?Uk1kMUM1RjN0UTVaZGkvdHdsNDJUTnJIbURNVDRmamhVSmh5VkNQbGVEeW5M?=
 =?utf-8?B?WHZEZUlwS1dLdTI1aEd0RzgrVVlpWG9jaFQ3RW9HL0pYbEt0R0ttVW43TnpO?=
 =?utf-8?B?NlJCWk9UdFF5ZTVKMitFcjZYNGJaNTVUZG91ZFRIQXNURE5CV3dTT1Rpb1lt?=
 =?utf-8?B?TThiUU5iNXpGSFo2amJkdVh2UUYrWGZia1RWU2lLcjk5MlBDRTdSMXBFK3F4?=
 =?utf-8?B?ZXhxWllDRnRjb1A1NHJxV2t0aEVYb04zWG11YnFHN01tZ1hEeDF3eDRpUTJx?=
 =?utf-8?B?Z3F4Q1Vrd0ZxOFVqOU1LNXNKcTAzTkl5ZDBtRkpYWHl3WE9lamdsaUJCQ0FY?=
 =?utf-8?B?MHN4YWhPVENxRFpsNU5vTjUvd1dXRzJPN3ZXd29PejczMnF3ektrTzJHM2g3?=
 =?utf-8?B?ZWEzWjFpZVF4RC84TFAxTXd3VS8yNVpJRldxdVZkNVMxeWJUb2xyL2NxZnpX?=
 =?utf-8?B?ZEdMV2NLUmtpa3RMWkFPNXczaHBleTBIUzJYWFl1NjkvbHZCdzA5YVN1aWZr?=
 =?utf-8?B?NEx5TmNvRVVLSmNaYjdUMFF3bFdTaGxEemN0TktGZ0xMdUhUNW5uOHloc2pY?=
 =?utf-8?B?Mzd5T2xOczlVVktKV1Uxa2pVMEVRSXVPdkpwR3ZFalFGYmdTQnVBbUhrbDh6?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2217b34-bfb9-413d-69d4-08dddb0ae2b6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 08:16:35.8147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+D/tbXtOzuz+58eo1cKzRv8s1cdsId3g+dIo5ulQ/23xSgopolZpNKIwz5dHlSU2uIBDR1Ghk1vpj42yBH2ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6038
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

On 11-08-2025 01:28 pm, Chaitanya Kumar Borah wrote:
> Some panels needs DSC to support HDR (at least in higher modes).
> In cases like these the output bpc and crc comparison fails if
> the SDR/non-HDR mode does not require DSC. Therefore, force DSC
> when in SDR mode so that output bpc and crc can be compared.
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_hdr.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 50 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 76e103ac4..c1123531a 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -97,6 +97,7 @@ enum {
>   	TEST_INVALID_METADATA_SIZES = 1 << 4,
>   	TEST_INVALID_HDR = 1 << 5,
>   	TEST_BRIGHTNESS = 1 << 6,
> +	TEST_NEEDS_DSC = 1 << 7,
>   };
>   
>   /* BPC connector state. */
> @@ -491,9 +492,20 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
>   	igt_plane_set_size(data->primary, data->w, data->h);
>   	set_hdr_output_metadata(data, NULL);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_enable(data->fd, output->name);
Can you add debug prints in lib func() ?
> +		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
> +	}
> +
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
>   
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_disable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
> +	}
> +
>   	/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
>   	set_hdr_output_metadata(data, &hdr);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> @@ -518,11 +530,22 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
>   	/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
>   	set_hdr_output_metadata(data, NULL);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_enable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
> +	}
> +
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
>   
>   	igt_assert_crc_equal(&ref_crc, &new_crc);
>   
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_disable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
> +	}
> +
>   cleanup:
>   	test_fini(data);
>   	igt_remove_fb(data->fd, &afb);
> @@ -558,7 +581,7 @@ static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
>   	meta->hdmi_metadata_type1.max_cll = 0;
>   }
>   
> -static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
> +static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_crc_t ref_crc, new_crc;
> @@ -577,9 +600,20 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
>   	igt_plane_set_fb(data->primary, &afb);
>   	igt_plane_set_size(data->primary, data->w, data->h);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_enable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
> +	}
> +
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
>   
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_disable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
> +	}
> +
>   	/* Enter HDR, a modeset is allowed here. */
>   	fill_hdr_output_metadata_st2048(&hdr);
>   	set_hdr_output_metadata(data, &hdr);
> @@ -602,6 +636,10 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
>   	else
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_enable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
> +	}
>   	/* Enter SDR via metadata, no modeset allowed for
>   	 * amd driver, whereas a modeset is required for
>   	 * intel driver. */
> @@ -623,6 +661,11 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
>   	/* Verify that the CRC didn't change while cycling metadata. */
>   	igt_assert_crc_equal(&ref_crc, &new_crc);
>   
> +	if (flags & TEST_NEEDS_DSC) {
> +		igt_force_dsc_disable(data->fd, output->name);
> +		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
> +	}
> +
>   	test_fini(data);
>   	igt_remove_fb(data->fd, &afb);
>   }
> @@ -714,6 +757,11 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				break;
>   			}
>   
> +			if (igt_is_dsc_enabled(data->fd, output->name))
> +				flags |= TEST_NEEDS_DSC;
> +			else
> +				flags &= ~TEST_NEEDS_DSC;
> +
>   			set_hdr_output_metadata(data, NULL);
>   			igt_display_commit2(display, display->is_atomic ?
>   					    COMMIT_ATOMIC : COMMIT_LEGACY);
> @@ -728,7 +776,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   					test_static_toggle(data, pipe, output, flags);
>   				if (flags & TEST_SWAP)
> -					test_static_swap(data, pipe, output);
> +					test_static_swap(data, pipe, output, flags);
>   				if (flags & TEST_INVALID_METADATA_SIZES)
>   					test_invalid_metadata_sizes(data, output);
>   			}

