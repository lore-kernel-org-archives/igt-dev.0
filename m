Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D198BC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 16:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6721C10EAC9;
	Thu, 20 Jun 2024 16:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYSbOhiw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E593410EAC9
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718899520; x=1750435520;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eyWwyn4x4/8z0fXPkXaubY9jmY61kAYfdcIqIfj5j9w=;
 b=XYSbOhiw6A6C8T726OtvmuwjWvF8zAWs5x+TZpN/XgSf1IEVPeQcly5x
 bhmlRoO003mqaIputg8H3ACHzhogCg5IlFtaRyps+tJCm8EMt/tmFgiQ8
 6PxTghq+NbALxGLmPUwr+2TTrsIFSBWxguBR3/KZ2efLr+/Bln03xdwxS
 YQ/l2ntYyRFXE6dzUAmVuwh/+OQsR+5TTB33KIHYfblcpXj1laijjfqXG
 BIi+8ziL7iBB+xC9E8XIoYYmiYUe6rPSeKAcgLJ91ohCcsirhY8lf5acx
 5lwR1SBKmNM78hsFDhGOKqn1Msj5P9qulUgPPU0ia5bfHBhngIS0Mz9XY w==;
X-CSE-ConnectionGUID: K5cUbQJlR4mzNpME8hiEZw==
X-CSE-MsgGUID: RMpchimGTq++EYcCd3UQ2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="26581371"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="26581371"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 09:04:25 -0700
X-CSE-ConnectionGUID: HMpb9EWgTkq0MebkQ4UJ8g==
X-CSE-MsgGUID: 3XrSVQgUTW+jr6yIvsw7xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42383555"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 09:04:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 09:04:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 09:04:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 09:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwyTzmZGGAynD7iU6hbpxzpyI8Lu4m0Hm76nb1zdQdFGQjEI2ZYBDkMZMrMbhKwZkW56i63UEMvRJKalFVx5lriD53N5QUQQj0KwyfVP9PdQGuEXICRxBKtP2Top0S+eVorbfY9X+qDM9MDEMnAbuAT0Otl9SUyLuJ2E13ckUlY6OOA6DWUFYU4eaq5TaM9QYy19wZm5Ewfs0gO+CDNrCatZP6p1v5w86nXloXmm+5j5BupbMT0XsIloWHbJMeK85Ya3OmvKkEC/SvsX5r7zCinn7i+rItbeA1PQxIU4XM71IK0ZO7pNn/ZW4LkiK5HR/grMktILTHjq4z9IWbH2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyOMVLQjswAnnEppOY/+mUbwfr3+vwzF1n6w90uZW7w=;
 b=TSHbYBhc7ugNa+kVbZCeOslcg2mqXoaxBEjT8IXJaBlgzI3ooXZeHCBWWavoKO+9ShhKR+GiC2nrofIuGqANzKUAdX3dxxsVgbbc3bBYEvgr8RZproowJTnd2GPyNxFV8nwYsPrs4+wR8UVlsoEsMwsWfvS0bKaUMcgz6Xo7yB3Ac1g+lMkUalbRrENUQlTQ3vnAJIQwUKRBUkA44a80btQjqIB8c7XQFOipSnCWYS5Ou3k+186mbWEvin1ZksupJ6x+aqAts5jsdPT9sM81ApL5PjRQ2Njd7i5ZykyXNm+ArXsZST0+rVNuMsH+xQHAmSZ6wYebBzIAn47PFRVeAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 16:04:14 +0000
Received: from IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041]) by IA1PR11MB7755.namprd11.prod.outlook.com
 ([fe80::8a57:c694:2dfa:e041%5]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 16:04:14 +0000
Message-ID: <d43930d5-c70b-49fb-962d-9560cb90375a@intel.com>
Date: Thu, 20 Jun 2024 09:04:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] test/intel/xe_gt_freq: Remove act freq check from
 freq_low_max test
To: Badal Nilawar <badal.nilawar@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <riana.tauro@intel.com>
References: <20240620125437.181215-1-badal.nilawar@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240620125437.181215-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::10) To IA1PR11MB7755.namprd11.prod.outlook.com
 (2603:10b6:208:420::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7755:EE_|SJ0PR11MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: fe757010-4cc5-4030-758f-08dc9142a111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjlLSUNTR2JWbGtpWHdKRHhERDBnRHJ3KzhmYjZhWXlhTUhpQzVIUHBZNUhH?=
 =?utf-8?B?NmV0RlhSbDliWE5YelhEWFB3bHVRZXJTcFBvY2F1Ync1WXJiUklGbnpBa0R1?=
 =?utf-8?B?eTR3NERZNCtpUEc4blRFUzFZUUFDUlNLVUJIaFhoMnRLVm1GSThqbXdtcVVm?=
 =?utf-8?B?cFpkNmlNTGc2a3hxS05IK0lKckFlM1owc1pnK3VGdkFmQzRaTnp1S1N0VXdX?=
 =?utf-8?B?cDFkVEVTVFQ3Tk9XZ3hrVXlrSlVLRGxEK1piTTU4NDVlYTBNbzZ5NzEzMndz?=
 =?utf-8?B?OGZuMHY4UFhRQ2g5YjQzcHBKRkRsc0pTbDJlbWhXWjV5UGZaWjBtbXVocmVq?=
 =?utf-8?B?dmZpZENQWTgreWpVYW1odlRseU13djI1bWtXRTJBWHZzOThlczdOZWN4Vkww?=
 =?utf-8?B?MzJmU0F1a3ZYZkNWZkowSzEvLzROVWNXdllwNWVYdXA4V29RVE5tUm9pcXFa?=
 =?utf-8?B?dVo0OGZ6MVVicThKN0dET1FabU11bUdBdzI0N2x6eUEvU1Fsa2hKY2RmZnRY?=
 =?utf-8?B?UW5VaVU2dC91SG5TWk5UUG5ZSHEvWkRBY1FJeWxZemFYa2NyVGQzVWViOS9z?=
 =?utf-8?B?UlArcE1ZZ25PRk54VTVJNzZPWnFLS0pYeUF3aTZSek9GdlV0dGZtdlNUZ3ZF?=
 =?utf-8?B?TmZ4VU8ybEE1UG1vdU1sKzRsa21DQkh0MGV1V3VxWDdobDF5MysxUnZldm5o?=
 =?utf-8?B?VDN0ZDZaaDNMN3BCWkx1dTR6UEhKZTJKRWFsbHR1WHFPY2Rodm9IWkEyM081?=
 =?utf-8?B?R2tyWlVVdmlFTjg3b0c5Y2V6WlBsQWNwbHFiUVNyOU1xUDI1ZDBxQmlQbDNz?=
 =?utf-8?B?Tkt4L1oxZjRaRjcxVjhVYkFoelFaZ2MwYnkyS1ZmTUpIa0xGWEdDTXNLcWFB?=
 =?utf-8?B?ZkdsTDRlRnNuR2krQXhtWURCcG5FeUZSSGU2WXJYY2NIR1FHME9JMldhUW1V?=
 =?utf-8?B?Q09yTzNESXBpTTMvTnRKK2ZJdnlKNEJobXdiaFZTb0hzTDdJYnlTeEFybVkw?=
 =?utf-8?B?cnJWQWhzdm41ODl5VjZOR21zaCt0WkhvakxiT1dNUFIzUXRaTXc5ZVcxWGFr?=
 =?utf-8?B?ZzVQaUd2T3JTTStMa29DbDE4ekE0V0FOL2w2TmFueldFNWJDRCs3MXdXeGt6?=
 =?utf-8?B?NVZLcTNwM3NlTjR4bzAzcDBZbmw4WjQwdUZpOWZqWDg3ZzhkcTUvUlhLU1l4?=
 =?utf-8?B?WW91UXNPenFhb0xYbnR6U09MTjBRcVZ0K1ljQTQwOXYvaCswL2NZdHZkNnFq?=
 =?utf-8?B?enkwQ0NvT1RkbGdXRnpMZjIvclZoY1R6T21Sekh3RUNzNDFxVHkwenZkcnl5?=
 =?utf-8?B?M1ErdUc5dHN0ZGxpN1pHQ3Q1bVlnR1F5Q2FmV3VZWlRYWDZZakwzYlYvOStv?=
 =?utf-8?B?TkZkbjM1NDdkUTNjbXlXU0NPbWd6clFRalVySEVJdGRjOGhGT1Q0TWtqejAv?=
 =?utf-8?B?cVZUSy94N29YSE96eE1Kcm9IUm8yclRoZXozTDZMVFZ3d1Q1TkltcE9nYUIw?=
 =?utf-8?B?eVdaUm1vMWt2WmhZYmtIQ2NYdEpLYjBBYU9TU0ZVUEdtZWUyVUUxUWpncmhn?=
 =?utf-8?B?TU5QMndtUVhKSGIwS0M0eXU2SjYrRTNqSFArK3JTc3JXNzhLMlVKY3BwTGFs?=
 =?utf-8?B?Z2dyYlo1Q21qQ2k3NllVSjFnWGxhRyt4STRzSzVvRHE0TnplVEt6VklpQTVH?=
 =?utf-8?Q?oRM2H981l+QIQ7Kvufkx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7755.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZitCajlDT2xUS3JRTWkwblRIMjZsZTdRUk4xV3BXeElkakkzQWtJNVhuc1F0?=
 =?utf-8?B?YmNFdkN2dHlWSjB2QVdjdE9YTHMyVnFTQ25ldmN6cnpIcGlwc1gzMVo1V3k3?=
 =?utf-8?B?RHdTQlhhRXo4MXI3eWJtN1NQL2pWRFZwbGtESlZwajMyYnhRRCt4dGpIaU1X?=
 =?utf-8?B?VHlyRG5WYTA3SDVDc09VSUFJYmM0c1grMzVKTGRqMnJ2cmswTHBDUm9rOG5K?=
 =?utf-8?B?Ykg4SnVzRlZiN2JRUkJEUGxIenZNLzF5bEFON2N5OUJiblpLdElaZ3Z4VnZx?=
 =?utf-8?B?bGw3eVpyby83MEdJYmE1T2ZlRS9Dc2x1ZU9XeStsMUplZE9pbGxZSWsyWmZy?=
 =?utf-8?B?SldTMk9ZTjlCYjNpdmRoL1c3b285blBoR0YweWJhNCtlRStjbW15eWN3djhL?=
 =?utf-8?B?SEZuS1dNK203UUU1Lys2TlpObmVNRE1HYlA4aXM3Nk1lM1ljaS8veTl1ZXgv?=
 =?utf-8?B?Q1M2VUpTZW9adHAvLzFQYmZCWjc0dTNiT1UyOG9VRU84V1dLejRUcnFpRUJv?=
 =?utf-8?B?ZjJYSGZQYmVmMzZjN2xQUGhuUVhEckh1aXJoTGdVbDRTRHZWWFJ4YS9HUXJx?=
 =?utf-8?B?ckFET2N4NVZPL3V3NkpSVlFnNHpKUWtoaHhsb09obkIwZzZiWmE5UTg2NjJo?=
 =?utf-8?B?RkNFdUl0aDE1L3VEbVZHODZQMC9hZHNjWERyZXNUeWtKOTEvbllVK0ZlUjh3?=
 =?utf-8?B?U21aQThQaEltNkRQbm92ZGFjN2prUjdXREQ1dnNzRStydXpXaFRmZ1UvbERx?=
 =?utf-8?B?ejlySUpkTUFKUkFMZTYwTWl0V0tZTGhoOGxKa1JCT3pLZHNGeTVnN001RXQ1?=
 =?utf-8?B?cENDRTVUT25pb2Fqa0NYMm1ETmo3SVdmQ1czNE8zUWt1cmpkUHVtUWVSZzUr?=
 =?utf-8?B?NFRQNXZ2aFpWckV2V2h2dlFMRHRwaDhWYTlSdnRkNUxTZFVyK0krUEJ1VUpH?=
 =?utf-8?B?b2ZPakZYdENLVkpRUDJ3YXpRY0Ziek9aVjAwV2hCeWRKWnNWYWMrem94RVhS?=
 =?utf-8?B?dHpzWjNFZ01OaTBJK1FLQ1U2QnR5NlRQd2x1YUFqNGZXZEJDa015clg4M1U1?=
 =?utf-8?B?WWtZQXYvUE9TZXQwSmlWcVNvVHEyK241QTFUejZKL0dHb1ZmZ0N6UGZnSnJV?=
 =?utf-8?B?TlZTYkZuYXNRcmE3VXZXd1IrTlp3bUNjYy94ZGVGWUVWOTFsTXZLS3RuekdM?=
 =?utf-8?B?eXVaMlMvc3dlaVl3LytyWTRQM1o3Vjh3aW5GNDNyTEMwZVpLMmlvVFdoRVFu?=
 =?utf-8?B?WnVSaVhXeEtmdGxENlcwTXR6bi9ZZkZvczl4M3JqVjVDMlJnQmNORXlkQnNL?=
 =?utf-8?B?MWs4V0JDU3ZNQ1ZrZG03VDJKSXA4NnY4cDVuWVRDSzhaYUoyQ3JYbFFadXl5?=
 =?utf-8?B?TFB0aDlLcDZFdFRPWmlyV0QraU1vaHpFRG8wQUFqV2RtWnduaUdvK3h4VldQ?=
 =?utf-8?B?K0N1bjdjbUFlSExNWFdsdzl5RzVBT2hFWEEza1NpcEkvK2xkZzZiMytoVisw?=
 =?utf-8?B?YUJXdWZLUnNITHZON2tQaGVwT2pJUUdTMnhDVUI4Vk9EODdqdjBBcm5rcTRL?=
 =?utf-8?B?N3pCM3lMbzlyK3J1SHIrNHYrRG9OUmxvS3g3TjJpRm5TZlh2dHBWbzdmL290?=
 =?utf-8?B?TW1JaTNGQmVQSEh3eFU4VUdMeVV0YWRzRXBRT3dqQmlEVytPbzBMdmdBKzBK?=
 =?utf-8?B?MG8zUjBDcTVwaUVkc3l4L2lManNubnczU2hBd1lOUWVEVURsQnJnZTVWMTUz?=
 =?utf-8?B?SlVFdndIYUhmeWFOQkMxb1RUUHNzZ054MHFsSlk1STcyL0IvQXVLYmpzY2d5?=
 =?utf-8?B?d2x3MW9OdmZhYjNRQUVwTUZIMHhWMTFTb05HNy9BaUtOTnErVmw5eEl0V1RF?=
 =?utf-8?B?ZzFyK1lCVWpsNHVjbmVsaEVrWEZuempGSE9qSDBsaVFZcmxWMDNLdUNpK0Vj?=
 =?utf-8?B?dUxwUVJ2Zi9RMnNhcE1QTzhLZy8wVVZ2U3YxTVdFNmJMRDBvNTZYSTU0amEz?=
 =?utf-8?B?OU5XMHlud1ZRRGxuMmx0aHVoV1RnT3FJK1dyeW1zMlFQQlR0bStHRVZUeXE3?=
 =?utf-8?B?SDBsQ2FiUDgzQTNyOStEWmpZQWQ1amx6YXQ0RG11YzVDdVFTT0JCbFlwSlpi?=
 =?utf-8?B?MGtvdW1SekV1bXp0dFIyUHlJL21iRnRGUWo5NkJNZ0xYbWt4MFNLQVE4RlVv?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe757010-4cc5-4030-758f-08dc9142a111
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7755.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 16:04:14.0405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzpHqd7tPkhIlscose96fq8GF9E4uVVukK0FwyTQecbgc4H4uauPakNgGV2cI+N9Q6VSJnnYS9I7fbMIp3Wn9AM4ceX64Sem201NDh+aZlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
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


On 6/20/2024 5:54 AM, Badal Nilawar wrote:
> First we check gt idle status and then check act freq. However, it’s
> important to note that there may be a race condition where the gt
> transitions to c6 before we complete the act freq check.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1045
> Fixes: 1a1e668e774e ("tests/intel/xe_gt_freq: Fix freq_low_max test")
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index d2e4d1a09..b3562181d 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -277,9 +277,6 @@ static void test_freq_low_max(int fd, int gt_id)
>   	rpe = get_freq(fd, gt_id, "rpe");
>   
>   	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
> -
> -	if (!xe_is_gt_in_c6(fd, gt_id))
> -		igt_assert(get_freq(fd, gt_id, "act") == rpe);

Checking for cur_freq may be sufficient in this case. As mentioned, 
act_freq may not be accurate given the race of going into C6.

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   }
>   
>   /**
