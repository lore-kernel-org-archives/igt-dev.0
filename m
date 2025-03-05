Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D174C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 11:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02BF10E758;
	Wed,  5 Mar 2025 11:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WN1Jz1w7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E752910E758
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741175606; x=1772711606;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yBrkaqIsodzR6lsJ1URtkMw1OmX3dOEnRbu8g/IIxZQ=;
 b=WN1Jz1w78tD1Pg9HgKyASaM4M1fKLwaLn2xpv/Uo+CTogLT2FAMjvLr5
 tQMTOeXCRRpcK1piHwoDJUkRe9JB05eWzj+uMKIi434VKYIUhUWJf/Ql8
 0oxTykVNWOErOBDN/GErnh4i1tnZPp89D3LNBwBKc3yEuvrx0yT9Kl3eO
 iaRWMW2jtEr6w0wvn7qk8W1oARnOd3YyRc3xqGyYeYwzIphC+Ii0lhaoL
 BUvF6cZFN2KPxV1zJJVomKU2V3DaRuNP04GG0NUgn3a0KMm2mKl76ws8K
 7KLEwslqaFLXl3qkcC6dnT4YRZXK5yPvaZh2aZQAfSvkvUIWCDQMElhO+ Q==;
X-CSE-ConnectionGUID: HnGVVKgzS+2NvhWWaR5IQA==
X-CSE-MsgGUID: V5aOZSWmQ6KoQFa6antMEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42043339"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="42043339"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 03:53:25 -0800
X-CSE-ConnectionGUID: TkzgJCXFQwS5Bs+5RhypIg==
X-CSE-MsgGUID: 1tw10MC+R/OxFjq32PMcEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149628351"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 03:53:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 03:53:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 03:53:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 03:53:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dg8aHc+Pp3WVSgdL6wzZLCIuAeSAaW2d7gttb9BNFv0HMakAu2V3TMUdGkYWPLkhNQvPxbTr3D3jnjwUes9IpKTcje9r/APByLlcVW79grtr+SKvV13mulHFqlzW99By3rLmivwGbdMySh+TVwEyD0tLNzuuo3F+pV4WbZ5xs6ea3vBCqozt+t78S5dFeNA7zilqx6rUAoinOwwp2NTlFWrH5NgPe1EW3AF9j2XS3kbmre2xnuC3r3iMiNd1jFs3jVfFNBdSi2gVep/01Y41GnYuMImyT1urM7q+8SACf/9/kkJbUnpejOmwvlRujDwaeWxJ5/DRK7cg1GuDuWJcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTRGWfvCbRJrz2mFF7VMpg20PXf/W48uWM3SP892XjI=;
 b=eRycbRXkibPA4d50J1Lus7ptPaW49/c8KAqzMs1nfqwA+X1KfWxL20xDd6uMAwDjssu98Zi0hgKvkawRcW73fKhpFjbdTcM633CkWRAN356qGKt50NIBAfsCLnnKlf/kStJrzqnueWgpg4n+8oB2EWv2vIqUowd/fWsGhC4yNRqiSw6ieZjLrx1l0xqMUzUO1yWgPnI77XE5+BG+fCmyOPHXVu57EFhaPYq/t9T4sbZykK1ffg4tk/83tig8dT1s8SWaSkuR5I5BrbgBdCcEPwFVjE3R4KLU65YdmG4lYRjsWKZy++yDytJ1x1ANjbxIlJrX47k+harH6wf/eZy0iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 11:53:20 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 11:53:20 +0000
Date: Wed, 5 Mar 2025 12:53:15 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t v2 5/5] tests/intel/xe_fault_injection: Do not
 assert if the captured error is not same as injected error.
Message-ID: <Z8g7K-Mvf5yGptuK@fdugast-desk>
References: <20250219073445.31423-1-satyanarayana.k.v.p@intel.com>
 <20250219073445.31423-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219073445.31423-6-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI0P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b0670d-d475-44b9-5c2f-08dd5bdc534c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFBwQW03ZEt0eThWemppQms4eFlSRVROK2ZLR2hvaFRsNGdjb2hYbVUzYmgz?=
 =?utf-8?B?amFWSE9PdnY1aU5DbWppZFFneTZ2M2VINUpDdGRUM21JeXRzN3Z4YkE3K1R3?=
 =?utf-8?B?Z1Z2TVV5d3plUW1ucHhVaWVaNThmMDJ4NnlFSU5XTXRxdmNmd2FKNnN3TEtX?=
 =?utf-8?B?TElWeTNvc0E5a2JMOGwyemtMbW1qVmkzRVVLclJmdnlIa2ZmRnpRdUNmeVpM?=
 =?utf-8?B?eWRkbWpUWENqSStKWktDOHpQQ0VoK0pKMW1mNjJTKzNWSUNvQjFSY1RNT3lm?=
 =?utf-8?B?UjNNQm4wMGlXc053NzNZTTQxdldMT2NaTG1uSW5URmtYNURLZkRDUk9XM0FD?=
 =?utf-8?B?ZFlXQXNwak10Q0g1NDdKZXpaUUF6MTlvdEdFeEhyaUNDb0FPYXRZbGlsNzRv?=
 =?utf-8?B?YTBraE9zTHZqMFgrZGZTRWJnSUFNVjRRR2Q0RkJYMmgrRzFLL3hEMEozeEFM?=
 =?utf-8?B?OEk1Y1Qyd0JjMGZBL3J0NEtSUjR5L0ZLTkRGZXFod2FCY29Vd2lNTC9scnNM?=
 =?utf-8?B?and6RSswaDRLdVBFWTdSMXYyb2tFQ3pkU3NqVkxDZmVWZUw5aHF1RlhwUVZi?=
 =?utf-8?B?YnRnSElacWNJQ2duQ2pKWGNGZ1NuUnJHbkpCRXo3NEs2RG1BZjRyelVxUHVy?=
 =?utf-8?B?bEd6QVhNQldoZmQ2dFRKUGpOdHJ4a3RjUFI3TmhVUzB4MFFuSVh0Z0E0TEpz?=
 =?utf-8?B?VTd0dVZHNjhORklBS01wUnVNUXg0dFVTSFBKclc2ZFI5OEVGZURnNEVMWk0x?=
 =?utf-8?B?WER2anJYQklKM1dNck9hL1h4YThtNFA2bEY3NXpOOFhFSjNkRlB0dWJORGtX?=
 =?utf-8?B?ZEdRbk14MTROYXFJOHJaSWFlaUJITnNsOEJvVW9GM1lTVFFKeEJRR0lJeC9x?=
 =?utf-8?B?RmdSdDdiNVpkc1VHYU5QMkpNdms2NGQyYkU0cUZvYXNINFNDT1lNM0FNdnEw?=
 =?utf-8?B?T21haUdwL1o3Ni8vWkxvdExHS1FSa28zczJ1L2xXVXRBdTdxaDF1TnY2cTcv?=
 =?utf-8?B?SzJiUmdSWXdtT1pQR1M0elpnODl3d2Z5Y2Z5akhCMTVvSDREbnFiODBhWGZU?=
 =?utf-8?B?clFuaGV2K2dEL2Rnand6dW1SMUd3ZUVCYitIdHJDcHVZYU02VTFKdC9zNnhG?=
 =?utf-8?B?eWNuakRYTktsN2N2VXhpV2N1Smg3bFZWa3NLUC9iMDVWTEc5bCtIcXU2Q2tw?=
 =?utf-8?B?NjZGb2lXOWxzdmFYRFpLRzlyUlkzRFlkZHZxMXJ6M0czeHNWSXJHMjdPWjda?=
 =?utf-8?B?Rm9SZWZscEdHb1AxcjZWVDdNNk1pVU9qMGgvWUowUDNScGlIWnB4ZldMeWwz?=
 =?utf-8?B?QjhIMlBJOVJBVFVxbXVsdzQ0SDZudmJlb29PT3d0ZGNjT1MxMHFwd1cwL3hp?=
 =?utf-8?B?RS9jTE5MVE55c1haQXRwUTlCVlE0YnlheUU0bDRaVXh3akpIU1FJb3VxRmI5?=
 =?utf-8?B?ZkJYOHZYbGowSThTU0hiVmRTQ0pMOXNuQ1A2SnNDRnFpNklOeGN6dVo1T0Uw?=
 =?utf-8?B?QmlhcUZLc0hPRFJQR2kxckgvbEkrMUtrWTJTR0ZFVlRwWlo4YXpjVlY3aHg3?=
 =?utf-8?B?TzQwWWxWOTk2WUZ0MlVMZ3NFdEoyeUVvVElCVElDQVZtQ0lQTDVpVEh4UXdX?=
 =?utf-8?B?SFdsVTNVbEZla0tuVkZLZXE2SHlka2d5dEg2dnNLSGlJVGNRUzh4NXdQRFUy?=
 =?utf-8?B?YmdaZVlQNnA3SGd0ekZFTTRTLzVXUE5UQkZFWERCR1dlbGVhc3g4dERQVlVD?=
 =?utf-8?B?d2JYdE1PUXN0Q1RYaEpHZW9XN282cGhXS1VhSFBwdkdINVZ4N3VjdGdEakgy?=
 =?utf-8?B?MUk1T0dvVjNCVzFJb2p3VDRJRVhhYk1pelVFc0JRZ1lycFZydzhMYzZDYjhU?=
 =?utf-8?Q?i6M9zOuljDnyw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWMrZmlRZGZ1Ly9YYzZvbzE0TnlUTDVPNUE1Uno0V24rOWNBRUhxMGpYL1FT?=
 =?utf-8?B?NDBQNCswK1JNeW5KeFFZSDZLT0ZOUXJkbUtCaU1ocXJEeVBBWnlWZ3hIV3ZL?=
 =?utf-8?B?YnNNbU5qNWdzS2duYzVtWEh0QXd0cnVXdDlJNHY5NVZUdWd3N3B2V2pSSEFh?=
 =?utf-8?B?SnNNTkdzK3FjQlBlenJWYk1jakpaQU5mTktheUtyNDJzNk9rS0RsMjBLS1Z3?=
 =?utf-8?B?SzJwQkhUa3ROaEFsVldiNmlScEJUNStvMmdLVDhMYS9YdG9DL3dSK0RuNTNB?=
 =?utf-8?B?WjZUUW9wclZ4Y0RXTTJlcDBaNEZtRU5EWCtaOWczVmdWRUZXUkVOcTliaktk?=
 =?utf-8?B?blYzSHltUXd1TWNHdUhOV1ZiNUFaOENCNzdPU2ljdDNGNTV4QkJOd015S1Za?=
 =?utf-8?B?MGVMd2pHYnp4M3YveG10NUl2bnZ6dlcvZGpKckRIcHdHYTRNMHVheENKZWFY?=
 =?utf-8?B?V2d1TlZxMTVlanFhdnEyZTVLUUtWVXZLMnVJbmVDcW13MU1QWll6aFNhSFdU?=
 =?utf-8?B?Znd3M3ZVckhjdTU1cXJtcnpsQ2xBRHRveFFFMWUyOG9CS3ZpaFNYYkNCVEhp?=
 =?utf-8?B?YzB3cWkvREtaZ0RoZ1I5a1l2NXhEVktPS3I3ZkdVZnU1NzYxSVE3aDVXbjhI?=
 =?utf-8?B?WEdxbHVXWDVzNzNjazcwL3ltdUJCVHFISjlKTTltMHkrRGd6eVQ3bmtDb3Rt?=
 =?utf-8?B?dEpVRjRxT29lREVyR1dUMTJKUnJtZk1rNE5IOU9pbzZtZGxUVnl2Q0FBN0tz?=
 =?utf-8?B?SzNlRkNjbUJNMmYxYUVIU3FaZG53L3AyNTVUTFpYc3dYa1lUMGE3R09OVWQz?=
 =?utf-8?B?ZFdIQW4wVUxiZ1N5NEFrNzBTcDZGNzlwVzVCUzN1aE4rNEovTTZEOU9qNU94?=
 =?utf-8?B?K05PdWFFckRzQVROUkRDTzJUd2d2dE5JVVRQajB5TWpRRWVLam9NUXlJdjVK?=
 =?utf-8?B?ZW5kT1pmQWR3T2pqMGVVODAvblFIbkF2K0dDY29TQ2laKys4czllak5IVTVn?=
 =?utf-8?B?YUJSSDh4emdnbysrREVMUmdBNGV2TTBWUHk4OWxnMkJyRzJXL3RiallpNXBy?=
 =?utf-8?B?TktvR0ZocDNzMUlLWVhmWm9IU1JMVGNCOVdUejhvdUpQV3cvWnBHTDJyQ3oz?=
 =?utf-8?B?Y2pFRjUyTlB4aFRQeEk5WHJjdDF2ZmtFWVhId3pORkVCYkdKb3pKTm9XRDRo?=
 =?utf-8?B?UURKcy9BTitiUlU1c2w5WXQ2Zm5hS3lTTHhvT2M2YkFZTGc4Z283OXYrYTEx?=
 =?utf-8?B?RWtLcmQrbHRpVjZLdHBod1p1VitYYXRpMDdPK0ovVnlmQXMveEF5Q3N6YjQ4?=
 =?utf-8?B?TWt3SFdUTDdqRTJnZkdnc2MxdEpVUlNZVHVvUU5iYkdFV25jaTBDT3hWQVpq?=
 =?utf-8?B?WTR3QXk3Yk9RM2hnRnBWMVRablpEekdneFQreHNOTTdOLzhUV1dCc3JaU0x6?=
 =?utf-8?B?T3ZYWmdyR2U3dVR5M3NqWkd3bWljc3U3MHRHblMyK3RSR1BNSTJVTkx2dU0z?=
 =?utf-8?B?ZHV0N1p4MjNKWEV2bUJEMGxETlBMaUNXbEV4Z1loZHgrc0k5MTVOR0hiV05t?=
 =?utf-8?B?bXNPTktZTFdCZytCWUJUc3VMOFFMT0FPSnRDT1pPU09iZEJLNk9hQi9KNGlE?=
 =?utf-8?B?bE1vSVA0MXV3TWE1U3F6QWxJdyt0R2FnSDZjQW1hYnRybU5OdVpqN1ZlV05h?=
 =?utf-8?B?UTQ3Qzl2NHZ4MjhydWRoalJSNjNaSm1hRkFlWlFJRXpYMWFidlhSZmZOWDhR?=
 =?utf-8?B?RDlRNGQ2b0UzZHROTzdoeVg1aU55cE05STZ0L0hDSjhwc3dOQ0hmV1N4QXFR?=
 =?utf-8?B?QzZZaHlDdzU0T3loSXRMTXhJM3pBejFJUnJWMlJQNnZhbVJVZ3o5YkhPNHVJ?=
 =?utf-8?B?OE9leXAzTldhdlYyMEJzM1Noai9qWXlVelVFc2RIVC9VMDUzanRadndkdHYv?=
 =?utf-8?B?WUxJMGhyUTV1a1dLbmpHNUxBRTdtWDE2MHNLanR6dnYxaGhtRWQ1UW5jdEdL?=
 =?utf-8?B?bCtGRHppTjhxbTAza0ZhalhCOVA1Wldob0xZVEUwS0ZubE1TY0JBZWF5b0dZ?=
 =?utf-8?B?Q0E4bFNhVHZkaUlPVUdpRVc2ZmpVR2JvYitVcGRBSVNyU0JuT0R0WjNONllU?=
 =?utf-8?B?RlJXNVBldFJMUmUrdmpGUWZQcWJ6WHY3TktvWjdZV1orOVRnTGVFSGxyZTJS?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b0670d-d475-44b9-5c2f-08dd5bdc534c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 11:53:20.6337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ys2rhAx98D1u+gSG+Uzt3crXsQBwWOutzCIa0Weki0a99+FL9NX0sxCbQlzhyG5fF6mD0RiJz3RMd95ObeFlq6N2nkSUP9fU1gz3CzPhzCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
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

On Wed, Feb 19, 2025 at 01:04:45PM +0530, Satyanarayana K V P wrote:
> In the current implementation, test asserts if the captured error is not same as
> injected error. It is a possible that the error received is translated to other
> error which can be returned to application.
> 
> Try to unbind the device at the end of inject_fault_probe() as this can be
> executed in a loop if IGT_FAULT_INJECT_ITERATION environment variable is set.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index cf0337733..82e338965 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -227,8 +227,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	injection_list_do(INJECTION_LIST_ADD, function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
> -	igt_assert_eq(-errno, INJECT_ERRNO);
>  	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_UNBIND);

Those should be 2 separate patches.

1. Try driver unbind after fault injection during probe
2. Accept returned error different than injected one

I am fine with 1. as it is, just the one line.

However removing the assert in 2. is not acceptable. This assert *IS*
the real test performed for existing fault injection tests. If we
remove it then we will not be able to detect when probing does not
behave as expected in case of failure.

We need a more flexible solution to your problem, such as adding one
parameter to inject_fault_probe() with the expected returned error
code.

Francois

>  }
>  
>  /**
> -- 
> 2.35.3
> 
