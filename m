Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F2EC624A5
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 08:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ED610E262;
	Mon, 31 Aug 2026 08:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVvHXRGK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3767B10E262
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788163349; x=1819699349;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=7hN/kgchRPBVbSLmOxH0Ad4/aRW6C4LPzTaouRqWoMI=;
 b=YVvHXRGKu75wmC7DYZuELGRGLktC4+uV9/RGY7rRBAyjP3p0wkQL4meU
 gFahlE0b1z3wqhjbq/4gCLCpsl+q5/+nZH0hG3YS5q4AQw0qAqAMhhkg9
 Eu4cDdSTfLqkM3XOPclbj1KdSPYS8HU7Aj3/xucO9+qMBeqZ37I15Uj5m
 myUEb3x6Goweji/n/p+mRgxlYqnvt6V+K/I3UeCDqqQs9s+GVU5Cpx3rb
 6yt66A0Nt/GdDoYGn/Z0V9IUiXEnG97NVw7nXKYhS2z2pd6ZWfN5NLKLD
 yCPOH+Yr2GwCn8C2Wqd9DQhJxo7o4S9QAXrpvKBj1Urm1ebCZucP05Oe5 A==;
X-CSE-ConnectionGUID: 00CA18yrQFuFOpt1NagO9Q==
X-CSE-MsgGUID: E9iAo34tTPqaDbVU/dsjSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="100075393"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
 d="scan'208,217";a="100075393"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:02:26 -0700
X-CSE-ConnectionGUID: kS9o3+soSYWb61Na31EVuw==
X-CSE-MsgGUID: UQvzv3AtQhGzBc8OQpHm8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
 d="scan'208,217";a="274001035"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:02:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 01:02:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 01:02:23 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 01:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+rw25v42qf5U+68qogxrbAjQA3SHDmeERlX1rt7FU0M5pXt3eAhyMnErRlj+PeSqMi47MgZFfAkZDIAMLpCQ3X1aZ358wqLBD+JrVoS3avFhWNS+2LDoBklZ57+fdfPGFM5lJB31FllpMwPhDCmyi9j4n2nWFZNK4jwH8WGwH+7RzDLHRgg54T7GfIiA3dEQfRYRmVko9cyAUT4gU3kmDP360UWjW1PpMf+ES5ZNTioxhd/OiR9m0N0gLQnn6+g6ovMS+s+PfgPaXG36k0nMW61p4SKl3HskBA81Oy7L5MIZUN4r+KkRVkf37NZfZJ6B8L8RNVCNcY9qguKOYEk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivxlsk7TDLP0A/XCRAZ+xLcvk0nGhjCzj3merS9I6lI=;
 b=kuUm4afdMoWM/UlVC3ap/Lyhnoa0pj1up2dZwLmb4RnFmRPEEiUrAi5PYOcozLTlsbFb86riPA98C9hgzwNfPELnpxMzAzQi1izf8ZLRugAxmz9c2cmDv0fdHwoIGpLgSrahXGN4j6wbXBEnP6phUvqcd8di5yNmh9W+cOIXr/606fJIguNmLHx34zH6RkBGjTpcvY7MYRa1DRiC0oQQU67Jkl3gd3x0dKHDQ2AGT+4ML9WHBtbX8/gqeLbqZJvRWOsvOYpBz8RtQ5a4P0lJHqrdBsiWjgLRcNgH3w1dnivi5DyE9l5bybKfOCvnwAFIZId4dZ4ymnecP/SfFJek+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CH2PR11MB8866.namprd11.prod.outlook.com (2603:10b6:610:281::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 08:02:21 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 08:02:20 +0000
Content-Type: multipart/alternative;
 boundary="------------kGILTq0EtLiMlFgBa2sBNjUF"
Message-ID: <adcde2e9-fc1d-4ecd-9cd5-5d10d870d397@intel.com>
Date: Mon, 31 Aug 2026 13:32:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: MA5P287CA0049.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::12) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CH2PR11MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: f5bc8136-065d-4a83-214c-08df07362ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|4143699003|6133799003|11063799006|56012099006|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: 3pSNBXrRdNfND4YF8Y0ZizZ6PfS/gDLYgI20WVpm1ZQJR+nRtXG64idOeGa/BWRWczTouaOf1ayHhl3J4g6qCIqb0xdk0RPkajTyQsQQ1El7mykytSCJGINyZlICHsoco7W91ZGyWiY7ocTfgQnMFooxhpGAYwnanRPIjlxbKd89/CYOZebAvNbceaXyi4YWMHpZ958WUyEtgMhf4FDe13EOmCQ8N2Xtm9Ur8fLI8OhGA5q9SrAIhJHNjprws31jvcWMpZrC0+f9SKrLRTyJogcJcScvuOd85PIwn7vazZ81SMjWlFqdwZzGyaaNorYpqN5d0g4fZr8F88HM4ta+K6R7UH17Gxh7JhpTwnfU5bHzYSPpk73SshKOMoavwWp1RroPKH3W9Mr/2sISrp6Hq+9cECgP9nVjBPFmdRERLB/xcB/2YmvMUNzG9zQV5QK0gY+X298L7bKWRogIGXq3557yMrDlEgEpw14Y265F2Hz9e86qjY2xCFDLcejMNHXcnGHJXXuKUjGJb47tL6a3KvDZaZJ0YAD0DM6JQvwd/duZUaiWaquKVONg8Ndt4atPICsv3nD/YkYsrlebyKDHaYaOp94f0SCgE73421fHeggw43wwvQdOSYstIa6MQunLlETPzC3CGol0Xrs16N9DLiAHIWxObSBNlTFjHYY0NXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(4143699003)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTFjWHNCdzB2S2ZaZ3NpYzk3c1p1Wmw5QUZJVzRZV3J5d1VUalJYYTZOMkM3?=
 =?utf-8?B?VEdQWjduNUxuK3o0b1l5R1ZJVlU4VzA1bWVpQ2ErQmVtdEVpMThSK2xMNys3?=
 =?utf-8?B?WC9id3pBNjN0UFVNaDNkT0NzZG5KaWFJS3ViZW05bXhDSVdOajlvRmFoS05t?=
 =?utf-8?B?RWtXSWdHYUNaQ2hzeXg1MXhRbGRFMGpvQ1A5SmZ6MkFVY2ZWbXRYRlJNVitB?=
 =?utf-8?B?UWxnRWtnNVh5NC9penFvcXFPWkhrd2xsVmVBMnpJTUppaFBmb1Jod2lha2NJ?=
 =?utf-8?B?bmR0ZHJ2RFNUNFZSelp2Q092VFNzS1NWcmM1N2xwbnJvTU14cTYvQTFHaHFY?=
 =?utf-8?B?K1NXN3FyQmw0N2k1SWFuOTFCdE5mdHlTVlFFS0IweVIrSWRsZ1E4YXcwMUJo?=
 =?utf-8?B?d21XNlU0UmhMUXNadTZmNVFpMjlQcGpyRlBiM1pMQXB4QUg1V3V1aG04VjE2?=
 =?utf-8?B?NXR2T0E1bzAwQnpaeTVWWEFCdkhXdHlpMm1JLzQ1MXZ3alQvSUpBZTROcGdM?=
 =?utf-8?B?ck53Vkg2VWFiZnNxUllKcW0zZjFDbm5tSTU4L3FCeURZY2lWMXN4RlU2SXJ1?=
 =?utf-8?B?eVY2U2NQbTZoOU52QW9Ub1gyMGZobEpXbzJzd1hPY1N5dVViSGw4b0pSTCtN?=
 =?utf-8?B?UkxoZEZXQzY4YXRVeWRGNm9tdzNtTHNWUEpYdis1Mk9KR2xaMjZpNmVQMkZr?=
 =?utf-8?B?OFZOL3diYjNYZjlrWFZiWHU4OFdNUEk1aVFTZDJReE4xdlhUb1lrS3Y5djEw?=
 =?utf-8?B?eU02cTFBZ2dQY0xzWFRJMVUxNU00T3hRUlMxWGhLUUdpVFNHZkxHMHJjNjBE?=
 =?utf-8?B?Q0NnSk5pc093SDRSeVpack4vdlFFdHlaeGtYNDRTT0hSOUNoblhubktFbk1p?=
 =?utf-8?B?aUI1UnN4N0Z2OE5xRFNoOGtmVHMvYkd4NkJNSHBhM0lOaWlMRlZaMUZLUThZ?=
 =?utf-8?B?WWpRMis2NlhKSU9IVDZ0WGI4elVDdWVRdWU3L20xbW1FTGc5dkdVUXNyaXVM?=
 =?utf-8?B?TDE4bXJuTDg1YlVmR1B3NmV5U28vTjhBaHpjV0I2SEpxd0lhRU5UdWV2RTM2?=
 =?utf-8?B?Mm4xTXlmSm03RUt4Uk9xMkh2V0JidDAzY3BjdCtkb2xmalFrRVlMQ1BjZHFB?=
 =?utf-8?B?VEpLU2NFUUJLSkpuT3ZIU3c5SVgxOWlXak1oWVRnWjhNS3lSNWJ6UTZwOW1l?=
 =?utf-8?B?QmQzMlFlQ3UwZUdQbERzYnRybXNhWllhWllDUXlzR0dZLzV4MjJEVElNdmtj?=
 =?utf-8?B?a3Bqa0lqL1RGM1htOWU3ems1eFpCU2FWdjJwQUROTVRlSlltc2lVZTR2aGNv?=
 =?utf-8?B?VnBjNUR4MkJybHhTcnJ5RnFydGZ5bUU3WHhFdTY1SHdrSVlwOEVJNmtMSnNT?=
 =?utf-8?B?aW5ka2E0ZVR5VUJ3YUI1RWo2ZW9LRC9pSzJhaDVhdVJzVzdFUTNDWWdVV1A4?=
 =?utf-8?B?QktnM1dDV1JnbXNwVXBWVUF2dU5VMXg2bUlrbFRzdjc2Q2gxMEl3R1YrajJN?=
 =?utf-8?B?VWNYNFY0eVJqSVpLVitvMjRHWGtBZ3RISmhIemxQcXVTZVVBRnNPbS85ZHBJ?=
 =?utf-8?B?Q21rOFQ4OXJ2THpSMGlqTGtIWE5FY1dCUEt2cXhNNWxOd1JoY2Q5SHJDbHQv?=
 =?utf-8?B?amZxZU5NNG9ESUx5OWhoWlQ2czI2bkcxYnRzS2Z0MDB5dVA3VlVvbEVTVVhX?=
 =?utf-8?B?N0VCSmVva1FnbDdzK3Vhb2ErOWN4dzRiUVhVSzdsd3k3Y3lJNUhHeGxpaHFp?=
 =?utf-8?B?akRQSnVSZEhMSSt1MkdtRjhBYjlsZ2dRRWpjVHRBVExLbVlXVGlrd3NqYXZW?=
 =?utf-8?B?Y01MRjEydlZ1R0l6dzQ2RzZSTk5iczdiMjd0ZUZLTHZabGNHc0xrVi9WdlN6?=
 =?utf-8?B?TUZPV25FRDlHN2s5RFBlWTc3cWFoeG1hb1NNTE9mVEhhdFFYSkFPVmV0K012?=
 =?utf-8?B?S09NallINmNWenkyL2xpby93QVB6YllnMHllZEJ0SCtlUmFlQk12Uko0U0c0?=
 =?utf-8?B?U20veFkzT1hVTUY5bHVZN2lZcnMwWDI3aEN5OGx4VDE1UnJjbGpjNElUVDNy?=
 =?utf-8?B?SEdQM0tFalRyRXRCN2pnczZSQ3l2KzUzQjBYTTZleXB4Z0tOSTR6ckVRUlVX?=
 =?utf-8?B?eXpZRzJITTBBOFdvYW55MFRrRVpFbzk5ay9Nd0lVY21rcU1NWTBmeHdnN0pp?=
 =?utf-8?B?RnZLKytiZHhKaXJXUzVPOGdETnlHTVZkeHRsY3JMWFlaMHY4MWxLS1dZS3BM?=
 =?utf-8?B?RU5aaEkxcHZ0Z0pFeUxpa09QaG5FdG9HbEc2VlFBRGN4dTVPTkVWK3Fsb3Nx?=
 =?utf-8?B?R3J1cVN3UmhLQzFSU3JmdGRsSUd1aFgxNjJKY2x1M2ZvZEpldXdpUT09?=
X-Exchange-RoutingPolicyChecked: XAftakwht6T+wrXvObi0MgcG+5tc3oVIQloTuvzL/z6kylHcxR44jkgo6qNv6cDIL9FtKVTHQsGoIQznsi9M3GXbkWipNB5Oqu286stdvbO8unGquEK+o0qqBAVs3ZOFwbGNe4gQS8KwakYwhBoagc/4VhDZYbwCRrgri2jux7cuKsuT9gG3jlabcGKopq1ob6nFo98cIVi9mQgOBZfYCa8qgoH4k9yssOyZeQPBNWGDdtaVbYkw5sC1K/zNJdKKNJddpiKxrYuY2usv4V4E1oO9tVJo29N4DRczsZ1hgBpsK9N4f9WpGglyMIkpWW3N/4+12gmh0JRDCD3RbACidw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bc8136-065d-4a83-214c-08df07362ede
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:02:20.7692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZhM4agKCeix/kDwD5MO8vS9y17HsVjYN3upjt7n7Dkyuk1tQxosfwKRQhJA0ScFFt0F1OM5ZI+r3C6xyTT92g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8866
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

--------------kGILTq0EtLiMlFgBa2sBNjUF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ravi,

On 24-08-2026 22:11, Ravi Kishore Koppuravuri wrote:
> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
> injection to verify the Xe driver error handling and recovery flows with
> the help of DRM Netlink API suite
>
> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
> ---
>   tests/intel/xe_err_injection.c | 321 +++++++++++++++++++++++++++++++++
>   tests/intel/xe_err_injection.h |  18 ++
>   tests/meson.build              |   1 +
>   3 files changed, 340 insertions(+)
>   create mode 100644 tests/intel/xe_err_injection.c
>   create mode 100644 tests/intel/xe_err_injection.h
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..ded5f558f
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: MMIO based Error Injection
> + * Category: RAS
> + * Mega feature: Telemetry
> + * Sub-category: Driver
> + * Test category: Error Injection
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_drm_netlink.h"
> +#include "lib/intel_reg.h"
> +#include "lib/intel_compute.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +#include "xe_err_injection.h"
> +
> +enum {
> +	RECOVERY_SUCCESS = 1,
> +	RECOVERY_FAILED,
> +	RECOVERY_TIMEOUT,
> +};
> +
> +static void run_xe_compute_on_all_engines(int fd, bool state)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	if (state == POST_ARMING_INJECTION_WL)
> +		igt_info("Running compute-square on all engines post injection\n");
> +	else if (state == POST_RECOVERY_WL)
> +		igt_info("Running compute-square on all engines post recovery\n");
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
> +								    EXECENV_PREF_SYSTEM),
> +								    "GPU does not support "
> +								    "compute on engine\n");
> +	}
> +}
> +
> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
> +{
> +	xe_mmio_write32(mmio, reg, value);
> +}
> +
> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
> +			   uint32_t bit_mask, bool set)
> +{
> +	uint32_t regval;
> +
> +	regval = xe_mmio_read32(mmio, reg_addr);
> +	if (set)
> +		regval |= bit_mask;
> +	else
> +		regval &= ~bit_mask;
> +
> +	xe_mmio_write32(mmio, reg_addr, regval);
> +}
> +
> +static int acquire_forcewake(int fd)
> +{
> +	int fw_handle;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +	return fw_handle;
> +}
> +
> +static void release_forcewake(int fw_handle)
> +{
> +	if (fw_handle >= 0)
> +		close(fw_handle);
> +}
> +
> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
> +{
> +	struct app_context ctx;
> +	int ret;
> +	uint32_t error_value = UINT32_MAX;
> +
> +	ret = igt_init_nl_socket(&ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
> +		return error_value;
> +	}
> +
> +	ctx.node_id = node_id;
> +	ctx.error_id = error_id;
> +
> +	ret = igt_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
> +	} else {
> +		error_value = ctx.error_value;
> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
> +			 ctx.node_id, ctx.error_id, ctx.error_value);
> +	}
> +
> +	igt_cleanup_nl_socket(&ctx);
> +
> +	return error_value;
> +}
> +
> +static int check_dmesg_for_recovery(const char *marker, int elapsed_secs)
Could it it be kept only "check_dmesg" instead of 
"check_dmesg_for_recovery" to make it more generic ?
> +{
> +	char *buff = NULL;
> +	size_t buff_size = 0;
> +	ssize_t line_len;
> +	FILE *fp;
> +	const char *success = "AER: device recovery successful";
> +	const char *failed = "AER: device recovery failed";

Instead of defining these strings here keep it in a global const array 
against the enums as the indices to make it scalable.

Thanks,
Soham

> +	bool marker_seen = false;
> +
> +	fp = popen("dmesg", "r");
> +	if (!fp) {
> +		igt_warn("Unable to open dmesg to check recovery status\n");
> +		return -1;
> +	}
> +
> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
> +		(void)line_len;
> +		if (!marker_seen) {
> +			if (strstr(buff, marker))
> +				marker_seen = true;
> +			continue;
> +		}
> +
> +		if (strstr(buff, success)) {
> +			igt_info("Found \"%s\" in dmesg after %d secs\n", success, elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return RECOVERY_SUCCESS;
> +		}
> +		if (strstr(buff, failed)) {
> +			igt_info("Found \"%s\" in dmesg after %d secs\n", failed, elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return RECOVERY_FAILED;
> +		}
> +	}
> +
> +	free(buff);
> +	pclose(fp);
> +	return RECOVERY_TIMEOUT;
> +}
> +
> +static int check_err_recovery(void)
> +{
> +	time_t start_time = time(NULL);
> +	time_t timeout = 5 * 60;
> +	int time_interval = 30;
> +	time_t elapsed_time;
> +	int status;
> +	char marker[128];
> +
> +	snprintf(marker, sizeof(marker),
> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
> +		 getpid(), (long long)start_time);
> +	igt_kmsg(KMSG_INFO "%s\n", marker);
> +
> +	while (1) {
> +		elapsed_time = time(NULL) - start_time;
> +		status = check_dmesg_for_recovery(marker, elapsed_time);
> +		if (status < 0) {
> +			igt_warn("Failed to query dmesg for recovery status\n");
> +			return RECOVERY_FAILED;
> +		}
> +		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
> +			return status;
> +
> +		if (elapsed_time >= timeout) {
> +			igt_warn("Timed out while waiting for error recovery\n");
> +			return RECOVERY_TIMEOUT;
> +		}
> +
> +		sleep(time_interval);
> +	}
> +}
> +
> +static void print_aer_recovery_status(void)
> +{
> +	int recovery_ret;
> +
> +	recovery_ret = check_err_recovery();
> +	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
> +		     "AER error recovery timed out\n");
> +	igt_assert_f(recovery_ret != RECOVERY_FAILED,
> +		     "AER device recovery failed\n");
> +	if (recovery_ret == RECOVERY_SUCCESS)
> +		igt_info("AER device recovery successful\n");
> +}
> +
> +static void log_status(bool val, const char *err_name)
> +{
> +	if (val)
> +		igt_info("Injection: %s Success\n", err_name);
> +	else
> +		igt_info("Injection: %s Failed\n", err_name);
> +}
> +
> +static bool gt_uc_wkr_parity_recovered;
> +
> +/**
> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
> + * Description: GT Uncorrectable Unicast Walker Command parity error injection
> + * Functionality: error injection
> + */
> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	uint32_t error_counter_before_inj;
> +	uint32_t error_counter_after_inj;
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=1 (uncorrectable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	uint32_t node_id = 1;
> +	uint32_t error_id = 1;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	error_counter_before_inj = get_counter(node_id, error_id);
> +
> +	/* Arm the injection sequence. */
> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +	modify_reg_bit(mmio,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
> +		       true);
> +	modify_reg_bit(mmio,
> +		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
> +
> +	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
> +
> +	release_forcewake(fw_handle);
> +	print_aer_recovery_status();
> +	error_counter_after_inj = get_counter(node_id, error_id);
> +
> +	igt_assert_f(error_counter_before_inj != UINT32_MAX &&
> +		     error_counter_after_inj != UINT32_MAX,
> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_assert_f(error_counter_after_inj > error_counter_before_inj,
> +		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
> +		     "failed: before injection=%u after injection=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
> +	gt_uc_wkr_parity_recovered = true;
> +}
> +
> +static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
> +{
> +	igt_info("Starting Error Injection test: %s\n", injection);
> +	if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") == 0)
> +		wkr_cmd_parity_err_injection(mmio, fd);
> +	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
> +	else
> +		igt_info("Invalid Error Injection specified\n");
> +}
> +
> +/**
> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
> + * Description: Run a post-recovery Xe workload after parity error injection.
> + * Functionality: workload validation
> + */
> +
> +int igt_main()
> +{
> +	int fd;
> +	struct xe_mmio mmio;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
> +		xe_mmio_access_init(fd, &mmio);
> +		igt_require(xe_mmio_is_initialized(&mmio));
> +	}
> +
> +	igt_describe("Inject GT uncorrectable unicast worker command parity error.");
> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
> +
> +	igt_describe("Run post-recovery workload after GT parity error injection test.");
> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
> +		igt_require_f(gt_uc_wkr_parity_recovered,
> +			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
> +	}
> +
> +	igt_fixture() {
> +		xe_mmio_access_fini(&mmio);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
> new file mode 100644
> index 000000000..d7efc2fd2
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef XE_ERR_INJECTION_H
> +#define XE_ERR_INJECTION_H
> +
> +/* GT Uncorrectable unicast worker command parity error injection */
> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
> +
> +#define POST_RECOVERY_WL 1
> +#define POST_ARMING_INJECTION_WL 0
> +
> +#endif /* XE_ERR_INJECTION_H */
> diff --git a/tests/meson.build b/tests/meson.build
> index a62f447df..0f090dcee 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -292,6 +292,7 @@ intel_xe_progs = [
>   	'xe_debugfs',
>   	'xe_dma_buf_sync',
>   	'xe_drm_fdinfo',
> +	'xe_err_injection',
>   	'xe_eu_stall',
>   	'xe_evict',
>   	'xe_evict_ccs',
--------------kGILTq0EtLiMlFgBa2sBNjUF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Ravi,</p>
    <div class="moz-cite-prefix">On 24-08-2026 22:11, Ravi Kishore
      Koppuravuri wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">MMIO based GT Uncorrectable Unicast GAM Walker command parity error
injection to verify the Xe driver error handling and recovery flows with
the help of DRM Netlink API suite

Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
---
 tests/intel/xe_err_injection.c | 321 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  18 ++
 tests/meson.build              |   1 +
 3 files changed, 340 insertions(+)
 create mode 100644 tests/intel/xe_err_injection.c
 create mode 100644 tests/intel/xe_err_injection.h

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
new file mode 100644
index 000000000..ded5f558f
--- /dev/null
+++ b/tests/intel/xe_err_injection.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: MMIO based Error Injection
+ * Category: RAS
+ * Mega feature: Telemetry
+ * Sub-category: Driver
+ * Test category: Error Injection
+ */
+
+#include &lt;stdio.h&gt;
+#include &lt;stdlib.h&gt;
+#include &lt;string.h&gt;
+#include &lt;time.h&gt;
+#include &lt;fcntl.h&gt;
+#include &lt;unistd.h&gt;
+
+#include &quot;igt.h&quot;
+#include &quot;lib/igt_drm_netlink.h&quot;
+#include &quot;lib/intel_reg.h&quot;
+#include &quot;lib/intel_compute.h&quot;
+
+#include &quot;xe_drm.h&quot;
+#include &quot;xe/xe_ioctl.h&quot;
+#include &quot;xe/xe_mmio.h&quot;
+#include &quot;xe/xe_query.h&quot;
+#include &quot;xe_err_injection.h&quot;
+
+enum {
+	RECOVERY_SUCCESS = 1,
+	RECOVERY_FAILED,
+	RECOVERY_TIMEOUT,
+};
+
+static void run_xe_compute_on_all_engines(int fd, bool state)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	if (state == POST_ARMING_INJECTION_WL)
+		igt_info(&quot;Running compute-square on all engines post injection\n&quot;);
+	else if (state == POST_RECOVERY_WL)
+		igt_info(&quot;Running compute-square on all engines post recovery\n&quot;);
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe-&gt;engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+			continue;
+
+		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
+								    EXECENV_PREF_SYSTEM),
+								    &quot;GPU does not support &quot;
+								    &quot;compute on engine\n&quot;);
+	}
+}
+
+static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
+{
+	xe_mmio_write32(mmio, reg, value);
+}
+
+static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
+			   uint32_t bit_mask, bool set)
+{
+	uint32_t regval;
+
+	regval = xe_mmio_read32(mmio, reg_addr);
+	if (set)
+		regval |= bit_mask;
+	else
+		regval &amp;= ~bit_mask;
+
+	xe_mmio_write32(mmio, reg_addr, regval);
+}
+
+static int acquire_forcewake(int fd)
+{
+	int fw_handle;
+
+	fw_handle = igt_debugfs_open(fd, &quot;forcewake_all&quot;, O_RDONLY);
+	igt_assert_lte(0, fw_handle);
+	return fw_handle;
+}
+
+static void release_forcewake(int fw_handle)
+{
+	if (fw_handle &gt;= 0)
+		close(fw_handle);
+}
+
+static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
+{
+	struct app_context ctx;
+	int ret;
+	uint32_t error_value = UINT32_MAX;
+
+	ret = igt_init_nl_socket(&amp;ctx);
+	if (ret &lt; 0) {
+		igt_warn(&quot;Failed to initialize netlink socket for error command (ret=%d)\n&quot;, ret);
+		return error_value;
+	}
+
+	ctx.node_id = node_id;
+	ctx.error_id = error_id;
+
+	ret = igt_get_error_counter(&amp;ctx);
+	if (ret &lt; 0) {
+		igt_warn(&quot;get_error_counter failed from error command path (ret=%d)\n&quot;, ret);
+	} else {
+		error_value = ctx.error_value;
+		igt_info(&quot;get_error_counter: node_id=%u error_id=%u value=%u\n&quot;,
+			 ctx.node_id, ctx.error_id, ctx.error_value);
+	}
+
+	igt_cleanup_nl_socket(&amp;ctx);
+
+	return error_value;
+}
+
+static int check_dmesg_for_recovery(const char *marker, int elapsed_secs)</pre>
    </blockquote>
    Could it it be kept only&nbsp;<span style="white-space: pre-wrap">&quot;check_dmesg&quot; </span>instead
    of &quot;<span style="white-space: pre-wrap">check_dmesg_for_recovery&quot; to make it more generic ?</span>
    <blockquote type="cite" cite="mid:20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+{
+	char *buff = NULL;
+	size_t buff_size = 0;
+	ssize_t line_len;
+	FILE *fp;
+	const char *success = &quot;AER: device recovery successful&quot;;
+	const char *failed = &quot;AER: device recovery failed&quot;;</pre>
    </blockquote>
    <p>Instead of defining these strings here keep it in a global const
      array against the enums as the indices to make it scalable.</p>
    <p>Thanks,<br>
      Soham</p>
    <blockquote type="cite" cite="mid:20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	bool marker_seen = false;
+
+	fp = popen(&quot;dmesg&quot;, &quot;r&quot;);
+	if (!fp) {
+		igt_warn(&quot;Unable to open dmesg to check recovery status\n&quot;);
+		return -1;
+	}
+
+	while ((line_len = getline(&amp;buff, &amp;buff_size, fp)) != -1) {
+		(void)line_len;
+		if (!marker_seen) {
+			if (strstr(buff, marker))
+				marker_seen = true;
+			continue;
+		}
+
+		if (strstr(buff, success)) {
+			igt_info(&quot;Found \&quot;%s\&quot; in dmesg after %d secs\n&quot;, success, elapsed_secs);
+			free(buff);
+			pclose(fp);
+			return RECOVERY_SUCCESS;
+		}
+		if (strstr(buff, failed)) {
+			igt_info(&quot;Found \&quot;%s\&quot; in dmesg after %d secs\n&quot;, failed, elapsed_secs);
+			free(buff);
+			pclose(fp);
+			return RECOVERY_FAILED;
+		}
+	}
+
+	free(buff);
+	pclose(fp);
+	return RECOVERY_TIMEOUT;
+}
+
+static int check_err_recovery(void)
+{
+	time_t start_time = time(NULL);
+	time_t timeout = 5 * 60;
+	int time_interval = 30;
+	time_t elapsed_time;
+	int status;
+	char marker[128];
+
+	snprintf(marker, sizeof(marker),
+		 &quot;IGT xe_err_injection recovery marker pid=%d start=%lld&quot;,
+		 getpid(), (long long)start_time);
+	igt_kmsg(KMSG_INFO &quot;%s\n&quot;, marker);
+
+	while (1) {
+		elapsed_time = time(NULL) - start_time;
+		status = check_dmesg_for_recovery(marker, elapsed_time);
+		if (status &lt; 0) {
+			igt_warn(&quot;Failed to query dmesg for recovery status\n&quot;);
+			return RECOVERY_FAILED;
+		}
+		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
+			return status;
+
+		if (elapsed_time &gt;= timeout) {
+			igt_warn(&quot;Timed out while waiting for error recovery\n&quot;);
+			return RECOVERY_TIMEOUT;
+		}
+
+		sleep(time_interval);
+	}
+}
+
+static void print_aer_recovery_status(void)
+{
+	int recovery_ret;
+
+	recovery_ret = check_err_recovery();
+	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
+		     &quot;AER error recovery timed out\n&quot;);
+	igt_assert_f(recovery_ret != RECOVERY_FAILED,
+		     &quot;AER device recovery failed\n&quot;);
+	if (recovery_ret == RECOVERY_SUCCESS)
+		igt_info(&quot;AER device recovery successful\n&quot;);
+}
+
+static void log_status(bool val, const char *err_name)
+{
+	if (val)
+		igt_info(&quot;Injection: %s Success\n&quot;, err_name);
+	else
+		igt_info(&quot;Injection: %s Failed\n&quot;, err_name);
+}
+
+static bool gt_uc_wkr_parity_recovered;
+
+/**
+ * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
+ * Description: GT Uncorrectable Unicast Walker Command parity error injection
+ * Functionality: error injection
+ */
+static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	uint32_t error_counter_before_inj;
+	uint32_t error_counter_after_inj;
+	/** TODO
+	 *  Fetching node_id and error_id dynamically is pending to implement.
+	 *  For now, using
+	 *  node_id=1 (uncorrectable_errors) and
+	 *  error_id=1 (core_compute)
+	 */
+	uint32_t node_id = 1;
+	uint32_t error_id = 1;
+
+	fw_handle = acquire_forcewake(fd);
+
+	error_counter_before_inj = get_counter(node_id, error_id);
+
+	/* Arm the injection sequence. */
+	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
+	modify_reg_bit(mmio,
+		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
+		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
+		       true);
+	modify_reg_bit(mmio,
+		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		       MC_PKT_CTRL_MGSR_3D_VALUE,
+		       true);
+	igt_info(&quot;Injected GT Uncorrectable Unicast Walker Cmd parity error\n&quot;);
+
+	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
+
+	release_forcewake(fw_handle);
+	print_aer_recovery_status();
+	error_counter_after_inj = get_counter(node_id, error_id);
+
+	igt_assert_f(error_counter_before_inj != UINT32_MAX &amp;&amp;
+		     error_counter_after_inj != UINT32_MAX,
+		     &quot;Failed to fetch valid error counters: before=%u after=%u\n&quot;,
+		     error_counter_before_inj, error_counter_after_inj);
+
+	igt_info(&quot;error counter: before injection=%u after injection=%u\n&quot;,
+		 error_counter_before_inj, error_counter_after_inj);
+
+	igt_assert_f(error_counter_after_inj &gt; error_counter_before_inj,
+		     &quot;GT Uncorrectable Unicast Walker Cmd parity error injection &quot;
+		     &quot;failed: before injection=%u after injection=%u\n&quot;,
+		     error_counter_before_inj, error_counter_after_inj);
+	igt_info(&quot;GT Uncorrectable Unicast Walker Cmd parity error injection successful\n&quot;);
+	gt_uc_wkr_parity_recovered = true;
+}
+
+static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
+{
+	igt_info(&quot;Starting Error Injection test: %s\n&quot;, injection);
+	if (strcmp(injection, &quot;test_GT-UC-unicast-wkr-cmd-parity-err&quot;) == 0)
+		wkr_cmd_parity_err_injection(mmio, fd);
+	else if (strcmp(injection, &quot;test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl&quot;) == 0)
+		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
+	else
+		igt_info(&quot;Invalid Error Injection specified\n&quot;);
+}
+
+/**
+ * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
+ * Description: Run a post-recovery Xe workload after parity error injection.
+ * Functionality: workload validation
+ */
+
+int igt_main()
+{
+	int fd;
+	struct xe_mmio mmio;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_debugfs_exists(fd, &quot;forcewake_all&quot;, O_RDONLY));
+		xe_mmio_access_init(fd, &amp;mmio);
+		igt_require(xe_mmio_is_initialized(&amp;mmio));
+	}
+
+	igt_describe(&quot;Inject GT uncorrectable unicast worker command parity error.&quot;);
+	igt_subtest(&quot;test_GT-UC-unicast-wkr-cmd-parity-err&quot;)
+		inject_error(&quot;test_GT-UC-unicast-wkr-cmd-parity-err&quot;, &amp;mmio, fd);
+
+	igt_describe(&quot;Run post-recovery workload after GT parity error injection test.&quot;);
+	igt_subtest(&quot;test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl&quot;) {
+		igt_require_f(gt_uc_wkr_parity_recovered,
+			      &quot;Run GT-UC-unicast-wkr-cmd-parity-err first\n&quot;);
+		inject_error(&quot;test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl&quot;, &amp;mmio, fd);
+	}
+
+	igt_fixture() {
+		xe_mmio_access_fini(&amp;mmio);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
new file mode 100644
index 000000000..d7efc2fd2
--- /dev/null
+++ b/tests/intel/xe_err_injection.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef XE_ERR_INJECTION_H
+#define XE_ERR_INJECTION_H
+
+/* GT Uncorrectable unicast worker command parity error injection */
+#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
+#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
+#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
+#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
+
+#define POST_RECOVERY_WL 1
+#define POST_ARMING_INJECTION_WL 0
+
+#endif /* XE_ERR_INJECTION_H */
diff --git a/tests/meson.build b/tests/meson.build
index a62f447df..0f090dcee 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -292,6 +292,7 @@ intel_xe_progs = [
 	'xe_debugfs',
 	'xe_dma_buf_sync',
 	'xe_drm_fdinfo',
+	'xe_err_injection',
 	'xe_eu_stall',
 	'xe_evict',
 	'xe_evict_ccs',
</pre>
    </blockquote>
  </body>
</html>

--------------kGILTq0EtLiMlFgBa2sBNjUF--
