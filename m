Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F887C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 06:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B47910EA24;
	Thu, 27 Jun 2024 06:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAqmLDpr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F059A10E0EF
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 06:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719469804; x=1751005804;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=P+tazp1Rht1LMk+W5LbSQjXSfeXQGPiKFZwpT+WRcB4=;
 b=hAqmLDpriC/PZwCJgM9SIobokKlRzOy1s9CQNPV3zKbvyGkZoxL23W4m
 Sg9lzSDX9VNcqVM/tiRRlhaKXnVfTOmYz0ztjbamfLvaiYkMIEaPJ9PAM
 Pnm5EsJO1lt1pcDbCQVEu21JfWKL4bGuVE3ADW53LGNQ9DONGXpbADh4m
 XRmklM1918GtK2UVJV/nRUIC8u4dRPtZcBAfy2gqvM3De+OspAU5CrgvP
 J4Ic9eMlqOeDz/jaSSuGBDOJd7cwZg973j0Z8jbzJCAyJf75Iy+pTBt4v
 ary8r06gRMvpW83mj9mdLc96IPOwKcP17EaOZtcLbGzr/5asi1/EwSGpp g==;
X-CSE-ConnectionGUID: aEa2nfMOSe2WE6nbKIP5zw==
X-CSE-MsgGUID: wkvaa5cdQLqcSeXEUIYSSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16253091"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16253091"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 23:30:03 -0700
X-CSE-ConnectionGUID: fhzTIB02T8+3t8zY2Mtv6Q==
X-CSE-MsgGUID: sU5iXeZHT4O1qtNBTiPxXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="49207440"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 23:30:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:30:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:30:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 23:30:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 23:30:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iv2Y2ljW8t0DEHWfSYe4UudnY/FvH6iKwvcmW+2H8QDa/Z6Out36txvLYWuSyBPomjNrNOzr6QUjAflvNX7OWeOLM7dRwoozoq/RnzWMuPgmAaBsUe732pNIMUxkNiD159DLiBxf8S9Qqaorm2/y0f+XCSlo2M9NtURwJuTIJUW7hbmVIL5Mh8YMaLwcdvFC35pjMhBm5dkb2YUeCykgspMKHVrJJlbR9Rmz5es1CqHHTV+9IjrJMs/8x3fEkUtZ+E1OzdvLcAkbJnWainh0uiqgYD1pCC1E834u/4iAu5rFDZ32c9UCYQ/boD/iXzIfR6Hrr+9fwBCxt96pcGHp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBMJuHNUvvQy/PmZgxUJymYL/GzsJeQlfr0i86z92O4=;
 b=laBNU6kB33TAZlQTNLOvS+8bV/hfgQviCXs18ZEjVaVmvCfUXkm0n+83yWpXG3Siyr+8Y5DUPfRt2znjJl+s7E76WQ4rBU3YhVBxBt4K6omYVUJwXR+QkCoFjj/ahcJd2GlwCvZ3EEP/Gw0QzstXU+ivIPxTtfRfoUGbqx4jUrlT8T7xFMdHGZCsjrefeh5roOmpq+oXXgETTUROuKy2xmEvwygCbGf6ZzCrXdExj+1WdlLdNZB3xybs6uUGH7ZOJYCwiQDOsYDBtrKpm0GKIX0EKU+v0pw0HNtnhRIy53jxDr62CCoYWc2p3SZIEZMEsvdG+QC3otpBdO5omE3Gig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB7867.namprd11.prod.outlook.com (2603:10b6:610:12a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 06:30:00 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:30:00 +0000
Date: Thu, 27 Jun 2024 06:29:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_evict: Reduce allocations to
 maximum working set
Message-ID: <Zn0GvXZ/laQtVesC@DUT025-TGLU.fm.intel.com>
References: <20240626123833.3164-1-thomas.hellstrom@linux.intel.com>
 <20240626123833.3164-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626123833.3164-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 2462668b-b582-47f1-5db8-08dc967291df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHk4ZFhWSzFkWXdOSVhBT0Z5TURCL3FHVnZ4QUpXaTlMYXNjeEFjZHdCNHBF?=
 =?utf-8?B?Q3RlaE1XWHY0SnI4UXFuenUvVnpvQWI0TXdaZ2wvT3B6Zzl2RzFaVFE0RkVi?=
 =?utf-8?B?bXBTMFdwaENwQWJEelJsQVF2eWlFRGVGWjZCdStxangvSEZRYmN5bzY1bGVm?=
 =?utf-8?B?dzVSdzFFU1g4eGlNWTVBNHpEcE1XZUcyMVc2Q09XTUttWXZBNENsc1VDVnRi?=
 =?utf-8?B?SVZRUy9Day9mWDhTc0NRalFhL1dJMjZiUXI5K1ZpZGpmMEp2U1RwVFZBOG5E?=
 =?utf-8?B?UmllSEJHc1VNYUd5MDZzY0dKVlZITzFKUlZqait2V2pQN2V1NU5reWljaTYv?=
 =?utf-8?B?a3JMSStMdnZ6clplMURyb3RWK1d6ZTZka1lwbXpWSTYxd1E4TFlHQmtmTkpO?=
 =?utf-8?B?dGNveVNhdlBqeGxydUYxQXBlT3ljMVRxVkVJWDNUZTNWQUdUcEY4Qkk5RDN1?=
 =?utf-8?B?RTlNV3FlK0Z6NlRzQlFxbkFYQ1hoSy82cXkwVUQ2WjhmRWJwMlkyUU8yL29m?=
 =?utf-8?B?clcxQVhOanRaay8zTlZGKzFsOUpkRFB2MlpkUUVoZ2FmdXBzeUJsajNQcUhw?=
 =?utf-8?B?d0s5cFpJdVJsNWtWRGFYcXhmQjg4WmtxRnlUeUhlN1VMdDJRQVhkdTB1YkJ3?=
 =?utf-8?B?dmlxR0hGZ1hUdnFoYTNUdG10MkNubDBIR0Z5OVY2aFdMMmxUYWdTa3BmdFo2?=
 =?utf-8?B?Wlcxa2VMSzRKemFUYWtwd0laeitDNnVveURMK3dhWlgrOExXaUg2bE4xN1B6?=
 =?utf-8?B?elJ5ZlVnR2U2ZkdoSzhUS0ZqMitsQUZZNEUwN3lCZW9oV3lmQ2VoSmNRNDJO?=
 =?utf-8?B?YVUzeGMwbXN4RTAxTWViVXJrZHRxanJJeUpTN09Dd2gwQlhIbWszRVlSLzM2?=
 =?utf-8?B?Q0FNTjZmT3FQanFyY0x2ZW5jaFNnUVZ0d1NQanFXdVFvWWp1UGtrNlAyaS9y?=
 =?utf-8?B?YWFaYm5aalZJbHVISUJSWHZEWGdlejlxbXd4ZFVtZ0JpS2MrS2NTbUpQTWdo?=
 =?utf-8?B?K1ByUDFSVEVneWtvTUorTzlNQS9idlRYT1BtWDg5R1lPTm5QeTMwNFdBV3hI?=
 =?utf-8?B?VHRZa1l1TXRBVk5lbXRiTHFEa0hOcFpPL2svSmJ3NUltSlVxMVdwNEF4YzUv?=
 =?utf-8?B?UzJ6V3pRdmdIZjJtWk11TjE3elNoaVk0Q2d1c2xKR1doNXdLbHppTU1ydnly?=
 =?utf-8?B?NmxMT1dnUm9seWVzRTFHc0RhUDVzNnBOU3V2R2RTKzhyaTB4bTJ0K2lVTFV0?=
 =?utf-8?B?TEg3VHFnL1pFQ3J6dlRxRDR2U2hFY2MvRXMrcVhsTlBNVURYSkVCRE9IeVhD?=
 =?utf-8?B?dC9lUWVleDhnY0FIZWVyb1hjbytaRVBGcGIvUjR5VzlZYklYSUErODZXVmVK?=
 =?utf-8?B?aVJVUUl6MTJRZjIxTzl2RzV5b09WM2J0cUg0V3dhRzBsN3F4cXFpNVBkY1Nr?=
 =?utf-8?B?dk44VmpuREdlanM5MmFEcnpyRUVPVit1aU5MOGJTMEMwelNqUVJGMnN4K0Zy?=
 =?utf-8?B?NmdZajVsZ1FYcGJKS3F0eEFVem5INS9KZzh2UVFwdzQ1VnlIRzBvRWNsNWFp?=
 =?utf-8?B?YmNOZ0VEek1oZnYrMzU1TVdkMUYydDhMQ21uNXRqN0NIYkY1a0RmS3N0NWVu?=
 =?utf-8?B?TUlsdE0yVVdFVzhoODBVNjZmVS92VkZuem11YjR1UEdHbS96eVhmSEVlOTdZ?=
 =?utf-8?B?dWREZ3kzS3YvNTJDbUtDT2t6b2E2cW5STFFiVHRqd0JWOFdJVWorQW5LYzVR?=
 =?utf-8?B?UU5tWXFlWXpwNVNBa01Hd0VwRmF0bmROWVk5MzdHclprZ21PTkliYnRYdVFO?=
 =?utf-8?B?QVd0QzdSZGhiNE9tK3BqQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3AwTEtFRkdLdmZKamNwV2huRHZLSTQ1dHNlZ0ZqbTEwdUgrazBBR3VVZU4y?=
 =?utf-8?B?c2VVb090cVdSYjRPN0QwdElHTmxCdk10SUNULzlSNEh6ZS9TOHNZcWd1eWhF?=
 =?utf-8?B?dE91QjRKcFRGWGU2UUZTaFBGK0xyQ3JyRWhBMHo2K3RzRWh1cWhQNW50bEVN?=
 =?utf-8?B?cHBwREMwSGlkdzF5Mlc2bW42dnBWVm5UQXdKR3pPU05SbXc2Y1UvdDdjcVJr?=
 =?utf-8?B?QUFKclJZbXV2UGNOWXdqalY4bmhMbWd3WFVpbC9HU3g5R21DMlhNZlc1NTRo?=
 =?utf-8?B?cGFqbmsyV2lwRmN0bDhUT0Rxb2x0L0xGWVFEdjlkS2V6bEY4M2lLYWROTEoy?=
 =?utf-8?B?RGRrQm1VZTdqdElzbmpPelRaTWFhcnl5QWQ5clJ4RmR1TS9KRjlUSXdVeG1q?=
 =?utf-8?B?T20rYVo4UUFqVjZrcnhNUGU4N1hlQ1IyeGRhTlljU3Noa3NLejhLUGpDdmtI?=
 =?utf-8?B?UEZhRk0yOUpiKzhlTVZ5MVp1dTd5UXUzWjRCTW1FYWpPdFJ3bHUwajZNVWRX?=
 =?utf-8?B?d2ZRN1c5SjVQVGdjRGhmU3I0dmlvSFBJS0xEZ1JnZW01eXVvWVVOZ0RDR28y?=
 =?utf-8?B?QzJCQVJGdm9iSWo2MzNTRWFoY1QyVUI2QUlyWnM1Tm9iQTdYRkJMc0UyMUlT?=
 =?utf-8?B?NXJHSE44MW5GMWhHQzAvWVNIQmhObkdVOEptQXk4YmlZK1pXdnQ3alF6SUY2?=
 =?utf-8?B?SEdXYWYwdENsNzlwNmF2S0dhMGdlanpkZVAyR09wTzBHcFkwNFVCdjN1TERV?=
 =?utf-8?B?dDB2NGxwWHNNNGFhbHdvWmdLeWNGR0NubWhwd0d5bTRZS0luSG9ZdS9XSlVY?=
 =?utf-8?B?SEJ4bWNweWQ1TjduNFFyMzVYSzRDLzlFVE0rdjc2ZERXUnlhQ3RKVGxpVHlO?=
 =?utf-8?B?OWxwMnVwbW11bS9WcXEyN3lLM2dmR0I1OWtSTnpoVm1nU05uaXVSQWNKdlUz?=
 =?utf-8?B?SVBqRHdUYkVWaHVaalYxTG1TVHhQcGZKRTlxS1ZwbStWSnkzYlgvNWM3dGRx?=
 =?utf-8?B?ZW40YlJpQzVqcXhPdFlDMHBpeVBvampPL1VpRFYxZS9pTzVyVzhuWUNCM1hZ?=
 =?utf-8?B?UDViaEZ5RTIvMEhSbzJnTjdQV1VXb0NtSndkRzZjZjFiQ1VzZWFxQ3FVY3o3?=
 =?utf-8?B?dEQyTS9CNUJEZkhFM25BKzNmV0hHMFpyMk1FME9oQmZSSTZaSTBRTGVkaG1k?=
 =?utf-8?B?MFZmVytyZ2JKVzB5b3RmbkxwWHVvK2tjQkF3dTJTZjJnSlovT3Z1UkJGVkpS?=
 =?utf-8?B?Y0JVQ21BVk13TVBrdU8yTkpvMkhJNzlSWEYrR054Z0Fvbks4bTZQeGZOcWNB?=
 =?utf-8?B?MTduaUk2dWNtR296ZllEWUVQc0hGenpOZEtEWGdlQnRKWVVJYk1NdFZoRXQ5?=
 =?utf-8?B?WkF3ZW9taHVFNG9vSUdJOXZUVmhUZy9MNDdRQVVyTnZKaWt0T21aSWtJeWtZ?=
 =?utf-8?B?L3Z2dHBTVm1tbGdwYWc1RDlYUDdndzVSSlZMa3VFR2dSOHJCUjU0N2ZxS1I1?=
 =?utf-8?B?cVkrNTB2R2FFZ1doYWpValdscFVHMW9PdjRTNzgzL29XVmpjU2xoTWlhNjhw?=
 =?utf-8?B?c1huVWRvR2dLMkx5ek1JUmtqVXhLdElPSVNXS0gyT0h0K29kS245WVdkVks1?=
 =?utf-8?B?MUdCbUR3czdoaU9QU1JvS2JKZWFnY285U0t5YzM5VE8ydFgrbU90QTgrd281?=
 =?utf-8?B?QVhaSHFHQVFOaG83WloxM3U0NkVYV0hNRzNuWFJCWWNaY09sSW1DNXQzQVN2?=
 =?utf-8?B?WmVjVm9KMnhCcUIydE9iRnowbWV3VzE2a1h3bjVBUEZLVHNLQUZNWFpMT1A2?=
 =?utf-8?B?RlVCT3U5M2daZ2RhTy83RkR1OE5zVStyWXRiRnFnM0V0aGFMakE4L0Rkdkg4?=
 =?utf-8?B?cUJVSkRESmRDSHpaK29LcnUvREIzbVJHRFFGUXRPekI5anJldXdHODI5UXk5?=
 =?utf-8?B?QUt4NlliZGtMUDZIcGF5Sjk1S3JhOEFEMXM1ejVhbVhncytGTWJITUlnRjZB?=
 =?utf-8?B?TXdQN3NNMk4vbnZtK1pGT3N0aE8rZGtjU2dtczhiK2orNDJSMHV2UTJhSTRq?=
 =?utf-8?B?U0hvZG1FeFBrcGtLQVhiNTF1QWVOU09sOFNad0FPdWhxaXR0bUltSHo1ck93?=
 =?utf-8?B?L1EwQ24vdDVOMWtTUjRHMk5qRGFSd0hKOVM4K2RYY3gvTFNlelhBcE5sTkor?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2462668b-b582-47f1-5db8-08dc967291df
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:29:59.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2i7xAG246h8RC6o8FumOVSKimLxSl9jd/zV3XrtQDhxSEMTBKXssrpjsqj/Vcx+4Mq9CW7itCR/sn5IrJx9Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7867
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

On Wed, Jun 26, 2024 at 02:38:32PM +0200, Thomas Hellström wrote:
> Current xe kmd allows for a maximum working set of VRAM plus
> half of system memory, or if the working set is allowed only in
> VRAM, the working set is limited to VRAM.
> 
> Some subtests attempt to exceed that. Detect when that happens
> and limit the working set accordingly.
> 
> v2:
> - The determination for which flags system bos are allowed in the
>   working set was incorrect. Fix. (Zbigniew Kempczyński)
> - Fix a typo.
> - Add an assert that vram_size is indeed > 0.
>   (Zbigniew Kempczyński, Thomas)
> - Add asserts and make sure that the bo is bound to the same
>   vm the exec_queue is using.
> - Increase the allowed set size for the multi-vm test.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  tests/intel/xe_evict.c | 89 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 76 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index eebdbc84b..5691ad021 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -97,6 +97,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>                          uint32_t _vm = (flags & EXTERNAL_OBJ) &&
>                                  i < n_execs / 8 ? 0 : vm;
>  
> +			igt_assert((e & 1) == (i & 1));
>  			if (flags & MULTI_VM) {
>  				__bo = bo[i] = xe_bo_create(fd, 0,
>  							    bo_size,
> @@ -115,6 +116,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>  							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  			}
>  		} else {
> +			igt_assert((e & 1) == ((i % (n_execs / 2)) & 1));
>  			__bo = bo[i % (n_execs / 2)];
>  		}
>  		if (i)
> @@ -273,6 +275,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>                          uint32_t _vm = (flags & EXTERNAL_OBJ) &&
>                                  i < n_execs / 8 ? 0 : vm;
>  
> +			igt_assert((e & 1) == (i & 1));
>  			if (flags & MULTI_VM) {
>  				__bo = bo[i] = xe_bo_create(fd, 0,
>  							    bo_size,
> @@ -291,6 +294,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>  							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  			}
>  		} else {
> +			igt_assert((e & 1) == ((i % (n_execs / 2)) & 1));
>  			__bo = bo[i % (n_execs / 2)];
>  		}
>  		if (i)
> @@ -458,6 +462,46 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
>  		return (ALIGN(vram_size, SZ_256M)  * mul) / div; /* small-bar */
>  }
>  
> +static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
> +				uint64_t bo_size, unsigned int num_threads,
> +				unsigned int flags)
> +{
> +	uint64_t set_size;
> +	uint64_t total_size;
> +
> +	igt_assert(vram_size > 0);
> +
> +	set_size = (vram_size - 1) / bo_size;
> +
> +	/*
> +	 * Working set resides also in system?
> +	 * Currently system graphics memory is limited to 50% of total.
> +	 */
> +	if (!(flags & (THREADED | MULTI_VM)))
> +		set_size += (system_size / 2) / bo_size;
> +
> +	/* Set sizes are per vm. In the multi-vm case we use 2 vms. */
> +	if (flags & MULTI_VM)
> +		set_size *= 2;
> +
> +	/* All bos must fit in memory, assuming no swapping */
> +	total_size = ((vram_size - 1) / bo_size + system_size / bo_size) /

Should this not be '(system_size / 2) / bo_size'?

Matt

> +		num_threads;
> +
> +	if (set_size > total_size)
> +		set_size = total_size;
> +
> +	/* bos are only created on half of the execs. */
> +	set_size *= 2;
> +
> +	/*
> +	 * Align down to ensure the vm the bo is bound to matches the vm
> +	 * used by the exec_queue, fulfilling the asserts in the
> +	 * tests.
> +	 */
> +	return ALIGN_DOWN(set_size, 4);
> +}
> +
>  /**
>   * SUBTEST: evict-%s
>   * Description:  %arg[1] evict test.
> @@ -748,6 +792,7 @@ igt_main
>  		{ NULL },
>  	};
>  	uint64_t vram_size;
> +	uint64_t system_size;
>  	int fd;
>  
>  	igt_fixture {
> @@ -755,14 +800,16 @@ igt_main
>  		igt_require(xe_has_vram(fd));
>  		vram_size = xe_visible_vram_size(fd, 0);
>  		igt_assert(vram_size);
> +		system_size = igt_get_avail_ram_mb() << 20;
>  
>  		/* Test requires SRAM to about as big as VRAM. For example, small-cm creates
>  		 * (448 / 2) BOs with a size (1 / 128) of the total VRAM size. For
>  		 * simplicity ensure the SRAM size >= VRAM before running this test.
>  		 */
> -		igt_skip_on_f(igt_get_avail_ram_mb() < (vram_size >> 20),
> -			      "System memory %lu MiB is less than local memory %lu MiB\n",
> -			      igt_get_avail_ram_mb(), vram_size >> 20);
> +		igt_skip_on_f(system_size < vram_size,
> +			      "System memory %llu MiB is less than local memory %llu MiB\n",
> +			      (unsigned long long)system_size >> 20,
> +			      (unsigned long long)vram_size >> 20);
>  
>  		xe_for_each_engine(fd, hwe)
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
> @@ -770,25 +817,41 @@ igt_main
>  	}
>  
>  	for (const struct section *s = sections; s->name; s++) {
> -		igt_subtest_f("evict-%s", s->name)
> -			test_evict(fd, hwe, s->n_exec_queues, s->n_execs,
> -				   calc_bo_size(vram_size, s->mul, s->div),
> +		igt_subtest_f("evict-%s", s->name) {
> +			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
> +			int ws = working_set(vram_size, system_size, bo_size,
> +					     1, s->flags);
> +
> +			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
> +			test_evict(fd, hwe, s->n_exec_queues,
> +				   min(ws, s->n_execs), bo_size,
>  				   s->flags, NULL);
> +		}
>  	}
>  
>  	for (const struct section_cm *s = sections_cm; s->name; s++) {
> -		igt_subtest_f("evict-%s", s->name)
> -			test_evict_cm(fd, hwe, s->n_exec_queues, s->n_execs,
> -				      calc_bo_size(vram_size, s->mul, s->div),
> +		igt_subtest_f("evict-%s", s->name) {
> +			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
> +			int ws = working_set(vram_size, system_size, bo_size,
> +					     1, s->flags);
> +
> +			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
> +			test_evict_cm(fd, hwe, s->n_exec_queues,
> +				      min(ws, s->n_execs), bo_size,
>  				      s->flags, NULL);
> +		}
>  	}
>  
>  	for (const struct section_threads *s = sections_threads; s->name; s++) {
> -		igt_subtest_f("evict-%s", s->name)
> +		igt_subtest_f("evict-%s", s->name) {
> +			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
> +			int ws = working_set(vram_size, system_size, bo_size,
> +					     s->n_threads, s->flags);
> +
> +			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
>  			threads(fd, hwe, s->n_threads, s->n_exec_queues,
> -				 s->n_execs,
> -				 calc_bo_size(vram_size, s->mul, s->div),
> -				 s->flags);
> +				min(ws, s->n_execs), bo_size, s->flags);
> +		}
>  	}
>  
>  	igt_fixture
> -- 
> 2.44.0
> 
