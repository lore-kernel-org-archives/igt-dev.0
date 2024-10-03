Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E837CF31BA
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 05:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF59C10E7A0;
	Thu,  3 Oct 2024 05:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dt48zC7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE4810E7A0
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 05:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727932150; x=1759468150;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g06hJQGCP8tb5o1fQAr1DpFBMbd0JdHOB4UHS4NF8/M=;
 b=Dt48zC7qYv2qtWGrgQoBnOUBRbpKks5/1FcC8zBxOdt35kJpKb9ebtHA
 4FmEWkwTA8GG8ALu6rQfM5oT5SMuM1o0lATQTa8CMGbO+kWtbv7euxxET
 xooC3hXg3TTd5J49SB22v3t01/U2zue6x/pfdgq+A137SV38s36P8zAkx
 kp7g3FLBOsCiYjyRsciG2g5pGMr5sHH8utQj9y8Z1DO05yTxRagtDD1IO
 0PiEcnUlOvlqtfc/A6HbMVwWu0s4xFB8ZgGC+dqQk4ChMvfoxqLH2YBoD
 rVUaD6g5EjhCaOLzan314s/obKTsoHV1S8ep2sD5ukVe6neAkfT2Zzry+ Q==;
X-CSE-ConnectionGUID: L8jTwj2sTN6j0uXy6PxBCg==
X-CSE-MsgGUID: sVztITn9R4mRi+RBjI3lig==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37710304"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="37710304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 22:09:10 -0700
X-CSE-ConnectionGUID: n5p+wOGaTzmlWWYEOuoIYg==
X-CSE-MsgGUID: YpBO4BS2TBaSsFeoXHRbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="74347896"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 22:09:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 22:09:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 22:09:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 22:09:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 22:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dq3l3l39Z/O1HOm1ndeuL1mdz/c5GIFpUo2oAsziAS9dHAF95Lfas4qG4gyT+NKDgetZ61YMuAxE5J1Bq0JazfTO9uweN3bkk8JCdFD0uevjzQVmpUj3evq7Y5QbJnArDq6vVwihhfTMf/OHERtbs2dK7sFYbCaAj+YW8kyjAht5py+8NFiRqe4IpVHranA2z+xedkeQ3xAm6EKqmydHKKFwoK3HcMEmcSPdvzqPJbSIrQ1Dg01f6p6sW64fv4SSN0tJB4sQ9Gx5prfGid1SnyNUHb0ZcOCb0d29O1+PDEzqrE5Z/LhhbsngY0OKaRyKeYNoSarURqNfbWP/aPyrrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOFTQaiq0MNyccdG/yQJaR+UktHKelCVhnmzF8aBcLU=;
 b=PgTK/n0sLAKbTkHvW9Pzc3RWmPxieqGQb8jxJwJ3d46XqNS1RrLSpBl8kDqGnWKUGIhJq/jCiF6CK0fEoNpPd3sHgpGEJjhCXa/jz/Mts+MWnA8piDOiZU+vTYjyAHdDTnRe53fCClh3vFyY7Ie7mAslNG5tWKZZuzrKfTRVOfFE9wDW5IRzqAcneiX8bLmEEOR17km9kCCBv5Jh55aaqlASOmq1GwRkYBnkHO7NZuV/7bvJLMG5cy/LbnaYDlxfZmesxBUAxrQ/3HG1xJiHpI7SP3NCY3ycuydbLwwxFhl5Y9WlS3RomARVSEDdM33vMajZ4Mfv4KaXf3wl1177yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW3PR11MB4556.namprd11.prod.outlook.com (2603:10b6:303:5b::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.16; Thu, 3 Oct 2024 05:09:07 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 05:09:07 +0000
Message-ID: <55b8c73b-7786-43bc-9420-5b3868b4c2aa@intel.com>
Date: Thu, 3 Oct 2024 10:38:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Check gtidle before rc6 disable test
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20241001191230.113540-1-soham.purkait@intel.com>
 <20241001191230.113540-2-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241001191230.113540-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW3PR11MB4556:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f5f50a-34eb-4c09-f99a-08dce369820e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejg1Um0rZFdiTmFvVVRlZDBrazJrZ3RES250cE4zWFhtdG5rVWltdVpNWXFI?=
 =?utf-8?B?U0o5Zng3R2xFb0NuVHpLa2pQK2VkVktoUmxrdVRJYVl0eFp2VlpvOVVjWGFR?=
 =?utf-8?B?RVptTjUyUmJuSis1SjdEV3ZRMFFkNkQyMmdJb3lVWFYvYUtDR0pNSUcySUZv?=
 =?utf-8?B?YTdCSE95cUxyeTBKajd3U3FnSnY1dm9jbU5ONGJvQlVjZ3BxN2V4NDVCRm9F?=
 =?utf-8?B?QjJuZXlBemVtUUJpWVpld1docGcweGJLTFFaWnpXL01odk1zSXFRd0lydE0r?=
 =?utf-8?B?VFRRMjU1SW10cHA1cHQ5cXdDd1ovZkVTZ04vOHA3QXcyd096ZjA2S2IrWU94?=
 =?utf-8?B?bUl1WCtlNFhTcHZadjE2QytsMHVrK0xPZDVNbHMyYkFZUmNqZFFCSEp3RTFO?=
 =?utf-8?B?bWFnMVBzMGtoWDFjUEJyaXE2Z1NmblFNNiswdkgrVG11NUxjbTZTbGNCNG1h?=
 =?utf-8?B?cVpvS3VVbkVZbUFMUi9ZR0YvWXJRcVNnK0ZuNE1WSnYzaHF3TVJmUFE2MmVI?=
 =?utf-8?B?NU10T1NTeVBVd3pkVE9JMVQ4cE11WU50TDlNSmxCRUFNcWgyNlZKN2hXcENL?=
 =?utf-8?B?L0laVVo1b0oza0gyTXlUNGNPVGd1NSs2SC9KL1BQMkJ2UHV1bVRZdllHZmtp?=
 =?utf-8?B?RW5zSEU5bVRUV0NrVll2Q1NFNVl4MGRXMldlNy8vbXlZZ2tqNmdqcDI0dktC?=
 =?utf-8?B?WEgweGE3SkhyMUFXSVNrbnJmZkVUUlI3Z1Q4aUwxd2ZSM1Mya3JQaGd6WmY0?=
 =?utf-8?B?MjQ5L0twUFc0aEMzNG5tS2I1ZmgzaEg5ZHhteVdqTG5GS3U0L1NJWndwcFhE?=
 =?utf-8?B?amhjVzdkWXp5WERndmNLbGlHZUZZZ0RyQ1diYTRmNXRlNUlVVHRhUVJDSVlq?=
 =?utf-8?B?anQ1VUJNQlcyQWxyM2p2bHpYaDVSdm1BVnJBMnRzV1QrdGF3K3NmZDltak5B?=
 =?utf-8?B?cmdwdDhNb3JNWGtZaThKSWl1aEpVaWFtN2RBMXFWTXJ0dHYxQmd6dGRIYlFi?=
 =?utf-8?B?aXB0VFo0Rjh1eGwzWWJlVGdzL3RTWU9VMXRuYjRaRktTSWk2SWtmQjBWT3FS?=
 =?utf-8?B?cU12SXd6NldwWHp0dFVDbnFjUUJXcUVOMGIxZEFrTUNHUUlBQTh6eVh0aTRY?=
 =?utf-8?B?WWdUQXpGdXRjNFBmbmN0VlVGTlliVXRGVlM2UkhaV1VLTjlocWxUaEJzT1h4?=
 =?utf-8?B?T29Da1JSVldqWHpvUHo1L1JEZ0VyT0tHWlcrcVFVQnJVZGhaMmVZTkI4MDRz?=
 =?utf-8?B?L1Q3SG5aK0VTSXVmU3UzNzQvYnlMTFlGaUFHQmJtZjhVajFGK0lCNGZiQS81?=
 =?utf-8?B?eXpwd2FJYW9UUVh5cnRHMzlCUVQyREE5TUY1V0U1eWJkSTZBaGhLck9kdUN5?=
 =?utf-8?B?VmovQWRWZGNaNllHVlI5TDRrVFNUZmtWOGV4TzRDYytVTGp1KzF6VGEwL0Zy?=
 =?utf-8?B?ai9sRWRzM2VqcG42NmtqZEswTW5hMGoxK0xLQnc1ZHlpM21CdkRnS1pKSkRZ?=
 =?utf-8?B?dndEUFQ0RnNZdG9DcTZzckVVQWtMUjlscnUwVFZ6bUprYnJNQlNIUlVKekJ5?=
 =?utf-8?B?alI1ZEQzalVXUENvazZmNnE4TGN0eG14bUZ0YWdITW1JbXFzb3U4RmppTVdl?=
 =?utf-8?B?VEhpaS9JUGFmSUZOcGsvRkpBSXR6VzFFUndGTWkrMVpQcnNWdVRWZ21odWQ2?=
 =?utf-8?B?WVR3WWVPcWVuWktha3VUeDdKWDR4dTNrazlSUU5OYUZSMXhPOTlZYlNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0xSMHpjZjFlVVJ4U1FhckdUUFRJT1NSTFJ2SkVaekk5TFRoa1BhU3NsSkFP?=
 =?utf-8?B?c1p6WFNDRWdxa2tpbGdGVVdHc3RTRGlBZ0krS0dXeFo4SzNXVHZRMndQUlQy?=
 =?utf-8?B?MWZ4aG9sUEZXNisxV3gxUnJaY0orcXY4S0x6ZGdtQkkvTVpzd3ZnRms2emRD?=
 =?utf-8?B?VG1ybEpnczAxSUtKVTlPUmVjM01OMlR3VTJnRXVqRm9HS2hvanJ2bjNBZHdn?=
 =?utf-8?B?d3NxcG9panZuOC9VQUR4ckUyS3BqK3MwWDFHdFRzeXBRYm1JclUvaDhubmN0?=
 =?utf-8?B?UDFXZkJMWUQwWlRpa2M3WFNHb3dvTWtFcHYzWUZuQ29LTVVWMU44VmNPb3A5?=
 =?utf-8?B?bnVia1BIcDJKU0xhanQrek56QkQ4Mk1pb09xdG9KUTNjOVRMSEhTa1ZsK1Zr?=
 =?utf-8?B?RkUvRkhhZm53WlVpaXk0T3dmMDdkK1U2bEh1QXpaMGlBMVVyWmNPV2FKbW9O?=
 =?utf-8?B?V3dCb3ZUK3lXb0FQNVMwNSt6UnZBMlBuVE1rcm9GdmhiWDArTmxHRE5ZU1N2?=
 =?utf-8?B?bU13RWhLZmd6M2VxY21jL2xsaVNmbzBpdGszVkUvK1RmQlJIUEsxUWlmWE9H?=
 =?utf-8?B?ZGxuMC81SjBCREFielZ1OFNTREZWM3orRzgzZ2lLQXZRTFFHWGdGYitsQUNw?=
 =?utf-8?B?ZXY2TVBZMGlRbHhVeTRobnFtNTBJOW5JK05XanNCbGhrRlNxejFrb3Nybzlu?=
 =?utf-8?B?Z0IwRE1peWp0OGtKdEQxVG1KU3psZHN6U25JYXJmZVdPT04xOGtsa3Y5WnJ1?=
 =?utf-8?B?blQ0NDEvWUVET0hmUUZwZXNFQndzOVM0TndhZW5naDU2aU9CRk51NWFtTUxO?=
 =?utf-8?B?WkNPR2RZZE5TMFZSOVkrOWNzZVpvUkV0L2ZvY0JTVjFsa2F2UG9kOFJRT0ht?=
 =?utf-8?B?NFNpNm95a2NZYmIxVDBCd0xmK1NTV0lzT2paVDRBVklTc28wRTd0K2RmVFBD?=
 =?utf-8?B?Z1J2dXVjTDJBOW53UjA5c3FmdmF2WkNLNzdzQ09oZ0dQS3lWZHhtTE1yZEpD?=
 =?utf-8?B?azJRYmpuWng2ck9SdStvVHpzeWhYYkNtY0RodUFBcE1LdmNaK3lBdGg2aGIv?=
 =?utf-8?B?SGdna3lITDRRY1JMWFNBZzJmUVg1aFh4WnhZTXh6U2lmQUJBOXFMTk1xM2xD?=
 =?utf-8?B?ajU4VGs4VzBpUTZSc0I0cjJ2enFLVGpXWmhNQndzWWI4UFdtejBEOGVjQXlh?=
 =?utf-8?B?WmpqZ2tweFdPNVFMU3V5dGdBTk03SVVpODNvZ2FGektNSUJyMnVSNHYvLzhh?=
 =?utf-8?B?dXZPL0ZlZzZRMVRlMURlRHJ6bk11UGVDRmtaRGFjWTJHbklKTnR1QkphRlJa?=
 =?utf-8?B?clhFdDZVbWU3N1lsYmJpSFg0Z2MxRmhOUkZablFORUpVdnpVMEJpblFlMk13?=
 =?utf-8?B?a2N1eDl3c0pqYzU1STdLaUdmSEhGRG50NmhMVWMzTFhoYzJuMHI1dTVpcTU5?=
 =?utf-8?B?WlkyTldOZkRxNCs0emZSYzZvYW1YOHVZNElwVzJydEkrUklvaEY4b3hDQmNY?=
 =?utf-8?B?Y3NMckJXZG4ralNzV0dQUklpSnNJS1ZSRGJ3RXlJWSt5YWk0Wkl1OGtsbTVw?=
 =?utf-8?B?dVhYOGtyam9Pa2JoREJLYllMT085bDUvN2dQZmMvRXNDa0dFbWpWNXIxQXkv?=
 =?utf-8?B?YUxPVnF4Smx0RWZjelhVamFtR3l0ZXdNN3ZOamdzZ1hFME9XWHpBNXJlcitr?=
 =?utf-8?B?QTduQXR1blFWRXRzSGVHNktRK1FMb2hlaFpOK05TVlh4MFlTUnRYdDhzRnJI?=
 =?utf-8?B?c244S0U5dHdCUmJ6UHRPVjAyT2dpeitnU0NXQ0ZkVVR1Y1gxSFNhWDdsWElv?=
 =?utf-8?B?YTlCSFhRUlBqdFl1TVVCOENMdXc3SEk3S2EyM09TSE5BeUxyZDNheGFPU2NZ?=
 =?utf-8?B?dEtSRlJIWXJyQ0tQbG40d2g5Q0VKZmJnK2lYRDVVQmNkK2FTYTZaYWd5NDVy?=
 =?utf-8?B?VEZjZ3lRWEdTbE4wUXlES3lrMjlNWEJVNU5VU1pUb0NmMEI1aWRmcXhyamxE?=
 =?utf-8?B?NTFHanV4eitFeEhaWllLZytva2tZdVQvcXdOY093T2ZtWTg2Rm5ubXAxNjBh?=
 =?utf-8?B?aEFMcXA0Z2huZk1FOWxvNDNTd3JTZERyb3FUMFVIcmlmMWdRQk5UNmN2TnJN?=
 =?utf-8?Q?9rJsmoMNPpzShZyfHuNvrvk+p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f5f50a-34eb-4c09-f99a-08dce369820e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 05:09:07.6248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlKGNSQ5vzFXsDqMCmC+cDkJ5oJXniF5L6rkLj8816cmXdttpy/hNdMXBanAp31y1uBatrKNoi0HMD4DOrvXfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4556
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

Hi Soham

1) set your git config user.name. format should be first name followed 
by last

From: "Soham Purkait" <soham.purkait@intel.com>

2) you do not need a cover letter for a single patch

3) add a detailed commit message and the subject should follow
the format of other commits. check git log and follow the previous
commits

4) use "PATCH i-g-t" for igt patches
git format-patch --subject-prefix="PATCH i-g-t"

On 10/2/2024 12:42 AM, Soham Purkait wrote:
> From: "Purkait, Soham" <soham.purkait@intel.com>
> 
> ---
>   tests/intel/xe_oa.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 9be4fd633..6538d6323 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -4644,8 +4644,10 @@ igt_main
>   			test_oa_unit_concurrent_oa_buffer_read();
>   	}
>   
> -	igt_subtest("rc6-disable")
> +	igt_subtest("rc6-disable"){
add space before {

Thanks,
Riana Tauro
> +		igt_require(xe_sysfs_gt_has_node(drm_fd, 0, "gtidle"));
>   		test_rc6_disable();
> +	}
>   
>   	igt_subtest_with_dynamic("stress-open-close") {
>   		__for_one_hwe_in_oag(hwe)
