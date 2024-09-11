Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6848EE01F3
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 05:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E6410E959;
	Wed, 11 Sep 2024 05:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RiCLNl19";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B3E10E959
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 05:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726033072; x=1757569072;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aUnmbYdrM+xpJOjgbSzKdVlU5f1JB5strTlMFnwi6uw=;
 b=RiCLNl19eBchuh43Bcrzr5mvKf1mjhiPGSeuBQWdxz4h8q50vRiPwHA9
 rw2ZiNXV0KvVcN9oBynhuAe0P+a2NftDtZ6Y+JmmUCjUnCtVKfdTe915T
 p/bzFcamSV/28xOzZlUgMNo5+T9Hh5QM4gsaGeTks8MVxcZlsWbUFFIcc
 vZPwEh5fl7ESbxC7Ge7WzBtNynzDjKBPFB9snwkt9yy0aStTKZHP5cuK4
 O5C9QGkfiCOB5F4J32QnWXx7mh2MbKLSINSR1EYIT+NLGVM7vUCKfuukq
 CMS8m73vGyrXyMKOdhmSv65I8n34Oq5UI6i3I8dpQbZEWbcRXM/CR8oaD w==;
X-CSE-ConnectionGUID: LoCAkG+PRoiHqLSCxYjceg==
X-CSE-MsgGUID: RP5MgzhfTGGHOeYZtG/60w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35404734"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="35404734"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:37:52 -0700
X-CSE-ConnectionGUID: qYFJ1XOrTRWb5JnKwYH3FA==
X-CSE-MsgGUID: yGNaaYoTTMCSkl9k7HH1lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="71868594"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 22:37:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 22:37:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 22:37:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 22:37:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 22:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YChs1PQiKT17eGnMiGxV4O8u8FqiHxpMJmOGcgejeFrITkL1s+U6GOZPMdEq8gfsGpZA6XnRt3dNPJ5dbXL0Gn/5ydJ5gegVmtYKzW1LxqVNIqVprXjM4AUiy3K1hqvEX0EwS5rZew9g1UkesapIOpHSYg8CP7o4YFp7VJz5qZ90/McZrYZkhast3e3HA0mLfi061VhHQmhYLp1AnZ2p6cdtJnurZ3v9JozfBEojXaRS1gVN+ibw2cRN/dVzoKcFiG22xeE78F7yZp/bQpx6GzY+f21IaNrskCxOBsurbIR30z8n3fhMkHnIeR/rM6EQw3fq3H5dVtO5+81AEFs4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cB//ACB+aundVMlRK67HENL9XSfEc57ikERX9fe87Sg=;
 b=d5glXx+B6ABDrB3coULiPF4cc+tsWGsQbGDKYlr9MI6f/teno2Y/riyt7oQlIx9bzx/oWklqj0e45ffXNeXEDuzTt/UdW6QkpquxVztPKFO/8cjPQRj4JeuXeXUPJybMmOEtP/rpOHuUgbtboA8KIlN5WDkuM2xqNOVuQm+xg4uxL+gXNZnqVTl5AJu4EvXvtAkveLFOd5cIPZpJ4XLDOvrHnKw5R3OyaeuqkFFLVoxeOiB2R3rEzb9euX1pG6X8WKf4fEmIYiuu9lidc5SgVXWatw3wRscyVZVfgaa4K2RRdLoNauTLg4DY3y+D/LtreeSSV30GkLJ5ZEGIWMBVcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 05:37:48 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 05:37:48 +0000
Message-ID: <a2ea863d-9457-45c3-b5f0-c8d4691b0044@intel.com>
Date: Wed, 11 Sep 2024 11:07:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_joiner: Add tests for Ultrajoiner
 validation
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <santhosh.reddy.guddati@intel.com>,
 <kunal1.joshi@intel.com>
References: <20240812044739.5630-1-karthik.b.s@intel.com>
 <20240812044739.5630-2-karthik.b.s@intel.com>
 <31fa69e1-fdf0-4bdb-bab2-30dbfa2a69ce@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <31fa69e1-fdf0-4bdb-bab2-30dbfa2a69ce@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::19) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: ef12bdae-d706-487f-ed94-08dcd223deaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTRiQ2RPL2NmbURlOUxndVpYQU1TY1hzaXRUSHRZQVV5dkp0M0lKNUF5U1d5?=
 =?utf-8?B?SHBqTEtXRENpeVFrdXpwU1Z4K3RwTjJPYm1hdWFxL3dNWVZSK0JjMmNZVm1U?=
 =?utf-8?B?NzhFM2dNRWZQOGZJaEVGK1FRRmtnTzlPU3ErOXBGY3dvSXBiU1BRVVM5dTl4?=
 =?utf-8?B?L2JNS0I1ZFB1TVdWU01NeXQzUGtwWU9SOTBXNTI4TGNCNFBwRERteWNnMW5V?=
 =?utf-8?B?MnNLRnFROFgwd2hmWE50RnRITFkyMHF0b1JGMWZhT2NDclczYzVENWI2TXdY?=
 =?utf-8?B?TkNJZEJmbGNNam01bmdjZTdYSEdEMVA1VWhhekpIdEd3TWRKNEJJQS8yOE1m?=
 =?utf-8?B?dC9RSTNYV0RDaWJGbWZNV0h4dC9QelpMOHVkN2U3M3JrNHhSRnVrMWRlOWh0?=
 =?utf-8?B?ZWJjRmRoV1U3eTl5NWpjbE1SV29lS0FubEpVZ0lUUmQzZjIyVm1Fc1owS1gy?=
 =?utf-8?B?d3pCRGswdjJuZERRSmQ0SE1qalFaVmFWeUNoekVOcHRSeWUybXJpR2NCQmk2?=
 =?utf-8?B?NjRVMzdQU1Bydkc1WmlGYmF2NWFQR0RHbDJIaXpwWGMxREMzTm13VWxnRmhF?=
 =?utf-8?B?YmJzd3VscktqSS9aU2hCbHRvSENQdDRQcCt5bXJJRk1VM21mYUZOM3llN0FX?=
 =?utf-8?B?dUZGYk5HQlBaaWwwS1luR2oxS3dmdHdqVWdnT2kveGVUOUwvaVZxNG5PNm4z?=
 =?utf-8?B?Y3FhSzlMMDNLc3RiYU44dlpGV25tQzBsdTN3RmRGQWdTZ25Ld3RpMGVrSElB?=
 =?utf-8?B?YmNXN0IyYlRsUnUwaFdxdjdIbktrMWU0VFloWWF5SlJRVmZXN0J3WkZRZ0Nm?=
 =?utf-8?B?VHlid0s1blJwOUo3UFlHTmFlbXpIblNKK2VUamJQN3U0UUJnd2pPRU5NYml2?=
 =?utf-8?B?aGZUb1hnZVJodEFJWkthaVgvVktYbk90ZlMvc2QwZ25jZWorbTlrTk52MG52?=
 =?utf-8?B?ZWtoRUI4Z213d2l0RmpuNUVCc0JhYU1jK0FLYzR0cnZPQ3FHMzFZeHRQNlZp?=
 =?utf-8?B?eHUrTTZkSk9TeEtwOTVwbEVUYkFnZVorM2NpMlU0eXV3dXZiSFdObG1abDNu?=
 =?utf-8?B?ekRRT3VzdGJjeERVRHM3Z092UVVVcUFzdXVXVG9weERiWlZHYXhUT01JNEdI?=
 =?utf-8?B?Wmd6TWsrTEpQSzI2Um5tSDhNNDV6UWczcldkbG5laU53WlpPb1FkNkk2U3RI?=
 =?utf-8?B?YmNvaWNZMCtzQ1o1TndxczZjcEl4Q2w1Y2VWNnYxaEZtbjd3QlVaSEp2bmpR?=
 =?utf-8?B?UCtjOUNNV21KSWJIV2laWm5jZHlEbml5RC9rYVc0R2pENlIvS3NrT0pYTTlT?=
 =?utf-8?B?TmlIY0sxTGloMlVqNWNKVUp3RVh3anpCVU1kNThWbU5PbVFwTGVMVU5EWDNq?=
 =?utf-8?B?SDRJRjRkU0F6eEhlVk5zcTR6M3N3MDI3aUhzeWRJUll1cDI1MzFqbEJsb1pp?=
 =?utf-8?B?bUo2UUlvdXF4Q1BQOUpaMXZ2OTVOcFd2KzRlc2huRVRlc1BjRzFZS1N2TFNs?=
 =?utf-8?B?R0o2REl4WEpsYWR2WWtaMlNvK1J4K2JHVi9wanhZSVRUcHlFaUxGdUpYZ1hY?=
 =?utf-8?B?eC91OTBTWWFJVTA5K3lEWGpTa0c4cTQ5TGNHSmZncGEwbFA5QWdHNlZicDl1?=
 =?utf-8?B?OEFCeFNnYWQ5T1I5ZWVhbmQrc21CK29XRTBMRzFkZitrUW5HUXp0SDFVWDYw?=
 =?utf-8?B?QVU5WHVkNktnd1dKUHhWanRkdUo4YVBoM3VBS2d0OEc4YzV0MFlSV20ycFBL?=
 =?utf-8?B?Z0N5bmdQSHR1bzJxejJFc2tDMVlpZkZwU01zUHlEV1lrSW56Z2IwbEJES1hx?=
 =?utf-8?B?RnVvVFdZcnlWWDM2Z1A2QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkt3QUZNUlZWeUhyTTU0M2N1ODRSalFZOHlTUXhGNS9CUVBiL21SL1o2RUpJ?=
 =?utf-8?B?eUhRVGVMN3J2TEQ1Yk1OdTkxcnp3ZG43U3FObURXUndDTS9UcG94RW5WcVFH?=
 =?utf-8?B?QTVTMW8zUHl2emxjeUx3QUpGTnAxYnpGWFArMnFaN2FXa3hOS3BzVFJrbjND?=
 =?utf-8?B?Mkc1ODh2Qlhwb3BmZE9lYVFRVm9Fdkxib05HVW5rNWQ1OXc2UUVLTy9NQWty?=
 =?utf-8?B?dmtvWVIxamZuTG5FR2xoMVMvU2I0c2wyZW54TVBEK0RtNCtiOHBETVNZYXhm?=
 =?utf-8?B?c0ZaV0Y4anc2azhCNVJBdUlIcXUzM0RKcUJZMm56WXZNNHNKMnZjZ1VLZG8r?=
 =?utf-8?B?TVEwbXhad1BVRm02akdSdlFKc090REZ5S0ZNaUs1SzNiWFpMRVcxU01qd0JD?=
 =?utf-8?B?aCtQQzRqdTU4VzlyMUlmYytNTnFWc21EdTIxb1dXeFYwY3hodVo0SXJzVDRJ?=
 =?utf-8?B?aHh2eVFwWDRvODlJRlZEc1cxSWIwT294R3I2R0NjZzFMRjIvRkt1bTNwUXM1?=
 =?utf-8?B?U0hnZEpxYUdqQ3F5em1XbU5TVXhLbXlXajNpc1ZZNGZkVXVXM01zK0ZCTWkz?=
 =?utf-8?B?R1l1WHd6MDVRWE4yZDdvSy9CRTFrR2Rzclo2VTRyajU2YWQvZ0lGWTBMWGpx?=
 =?utf-8?B?R29SeENXUnNNUGtwcThHbktVSTFleVBpUXNEQWlUanZod29XYnN0L0p6WjNm?=
 =?utf-8?B?YXFmdzl2aDRibkxzMkZ4NGgvNTlKOHJHekxMQ3ZyNjZhNTYxLzhxZTYyQk5Z?=
 =?utf-8?B?bm14cHRpRm80YTYvL2cvd3lHYldvWlhqakdqRXhoRWdiLzFya21wU3pHSk90?=
 =?utf-8?B?eTExMkJGNlk4R1dod3BTN2xaY2VUZmR0bEhodG05UEVMeUl5UXUyam1LK2JV?=
 =?utf-8?B?N1RkSkZXSVF4YVAyOVhLUlIvcGlYNnF4ZnY5SUdVdzRiR2dCUU5VTEozMUJ0?=
 =?utf-8?B?Q0pmcXk2ZEhzL3NhejNNSHB1RnlZMndUM1NmVjFXa1drSkR6R0xQNkNmbEgz?=
 =?utf-8?B?MVc5ci9XaWdJcExuazQvc1R3bXpMa09HNlQxL2dqeGUxcXd5U1cvVGhPSzlR?=
 =?utf-8?B?NGNTTzgrMDhVN3UySHo4YUd2MVVjQ2dPQytzcVB5ZXZYTThwSXhTK1lSQzls?=
 =?utf-8?B?dldDcEpjZEM1Rnp0TWpmb2NlS0s5bVZobk5qRFhPMXYzM2ZZMStBRlF0OFJF?=
 =?utf-8?B?RjlBeW1Ta3VqdGw5QnhJRVlSKzFzdVZVSGhpUXB1dEN3U21QcXAzbzI3VG5z?=
 =?utf-8?B?WEI1cmkvcFJRZU82T1lHZXFRQnlBelIyUnh0K0JGb1V5a29nU0NQamM5VUo5?=
 =?utf-8?B?enMrSmpqejVTQXUvWFRNTFhCaWFRYmgyS2J0SmZwOE9LZFZTdGxjVXF6QnFi?=
 =?utf-8?B?MXRjZTBBcnpqZE1sZFVOZmdaY2JOd2VCQnYzQ1ZoaEEyVG9YNGNQbWFxR2h2?=
 =?utf-8?B?Rk5ReG9GZ3F0TGtSZXFtU0RFcy80VE5vRWtCRTV0MS9PY0gxOUN6MmZrZTZl?=
 =?utf-8?B?K2ZTc3dDMWFnOWREdjk5d0NudGZ4aW1JcTVVT3E3NUdVSDlrUUE3cHlPODBs?=
 =?utf-8?B?cHdYRjFGVExFaTlkWHZJdWJXVmw4VFcvTGRQMSsxNTlmem1tbzBFaFVDSndr?=
 =?utf-8?B?V3VkMmFIaGkreURxejVkVm0vZlRncTlRNU8zZlFyakNNR1RvNmUvNUJMQ0pR?=
 =?utf-8?B?ZUNaUWRML3gyUGJVNDU5RGNqcE9XczB3YnBTeFF0R0szOHc3bUQ0dTFMNThL?=
 =?utf-8?B?b1NzWEhkcmY4aVJ6d3V5RStEUTNGV3F0YTJ4R25XZVFwcVhTcHRqUzFHc0JI?=
 =?utf-8?B?S09wNVBpSnkvemZyN2dTcGx0RHRzcFpEUyt1Y2JFT1RsMC9Ic2lJRHBhUWlw?=
 =?utf-8?B?QnhHcitIV0VRaHp5MERYcFBVaFNTdlNDWkZzclpIK3h3T3RMR1VBY245NFY1?=
 =?utf-8?B?bVNwV2hUMnlnb0xoK0VXajUwSXVTSzNwVWh3bUlNUmNNTFNYTjM1V2UwcVM0?=
 =?utf-8?B?SjRxYjI1SG56Z1lPak5aa0ZNVmVnU2FZcGp1cDd6UXBTMlZtcTFzNURIKzVz?=
 =?utf-8?B?eEtpMkl4UVd6RzNlZTF6UE5qOWQ5OXd5emNTbjhVNHpkTklSOTNOV21WL3JV?=
 =?utf-8?Q?Ma6BEdXT6OtIv4qWQ6iy5fHot?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef12bdae-d706-487f-ed94-08dcd223deaa
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 05:37:48.2799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jv4RPKac47kZqpMJJi5jm8y2mL0K2QpebQxJ9tT1JgTGKeconjd2+p24QmplPLsu4LJeeFl5Nm0Dg22dvbel6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
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


On 8/12/2024 12:09 PM, Modem, Bhanuprakash wrote:
>
> On 12-08-2024 10:17 am, Karthik B S wrote:
>> Add a subtest to validate basic ultrajoiner modeset and a negative test
>> to validate invalid pipe configs during an ultrajoiner modeset.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   lib/igt_kms.c                                 |  44 +++++
>>   lib/igt_kms.h                                 |   3 +
>>   .../intel/{kms_big_joiner.c => kms_joiner.c}  | 150 ++++++++++++++++--
>>   tests/meson.build                             |   2 +-
>>   4 files changed, 183 insertions(+), 16 deletions(-)
>>   rename tests/intel/{kms_big_joiner.c => kms_joiner.c} (74%)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index e030b35a6..08b628f1a 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6347,6 +6347,50 @@ bool bigjoiner_mode_found(int drm_fd, 
>> drmModeConnector *connector,
>>       return found;
>>   }
>>   +/**
>> + * igt_ultrajoiner_possible:
>> + * @mode: libdrm mode
>> + * @max_dotclock: Max pixel clock frequency
>> + *
>> + * Ultrajoiner will come into the picture, when the requested
>> + * mode resolution > 10K or mode clock > 2 * max_dotclock.
>> + *
>> + * Returns: True if mode requires Ultrajoiner, else False.
>> + */
>> +bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
>> +{
>> +    return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
>> +        mode->clock > 2 * max_dotclock);
>> +}
>> +
>> +/**
>> + * Ultrajoiner_mode_found:
>> + * @drm_fd: drm file descriptor
>> + * @connector: libdrm connector
>> + * @max_dot_clock: max dot clock frequency
>> + * @mode: libdrm mode to be filled
>> + *
>> + * Ultrajoiner will come in to the picture when the
>> + * resolution > 10K or clock > 2 * max-dot-clock.
>> + *
>> + * Returns: True if big joiner found in connector modes
>> + */
>> +bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>> +              int max_dotclock, drmModeModeInfo *mode)
>> +{
>> +    bool found = false;
>> +
>> +    igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
>> +    found = igt_ultrajoiner_possible(&connector->modes[0], 
>> max_dotclock);
>> +    if (!found) {
>> +        igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
>> +        found = igt_ultrajoiner_possible(&connector->modes[0], 
>> max_dotclock);
>> +    }
>> +    if (found)
>> +        *mode = connector->modes[0];
>> +    return found;
>> +}
>> +
>>   /**
>>    * igt_has_force_joiner_debugfs
>>    * @drmfd: A drm file descriptor
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index e8582a45b..c8e89b076 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1216,6 +1216,9 @@ int igt_get_max_dotclock(int fd);
>>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>>                 int max_dotclock, drmModeModeInfo *mode);
>> +bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>> +bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>> +              int max_dotclock, drmModeModeInfo *mode);
>>   bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
>>   bool igt_check_force_joiner_status(int drmfd, char *connector_name);
>>   bool igt_check_bigjoiner_support(igt_display_t *display);
>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_joiner.c
>> similarity index 74%
>> rename from tests/intel/kms_big_joiner.c
>> rename to tests/intel/kms_joiner.c
>> index 7c370bc60..633bf51c7 100644
>> --- a/tests/intel/kms_big_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -37,13 +37,20 @@
>>   #include "igt.h"
>>     /**
>> - * SUBTEST: invalid-modeset
>> + * SUBTEST: invalid-modeset-big-joiner
>>    * Description: Verify if the modeset on the adjoining pipe is 
>> rejected when
>>    *              the pipe is active with a big joiner modeset
>>    *
>> - * SUBTEST: basic
>> + * SUBTEST: invalid-modeset-ultra-joiner
>> + * Description: Verify if the modeset on the other pipes are 
>> rejected when
>> + *              the pipe A is active with ultra joiner modeset
>> + *
>> + * SUBTEST: basic-big-joiner
>>    * Description: Verify the basic modeset on big joiner mode on all 
>> pipes
>>    *
>> + * SUBTEST: basic-ultra-joiner
>> + * Description: Verify the basic modeset on ultra joiner mode on all 
>> pipes
>> + *
>>    * SUBTEST: invalid-modeset-force-joiner
>>    * Description: Verify if modeset on adjacent pipe is declined when 
>> force joiner modeset is active.
>>    *        Force joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs,
>> @@ -54,20 +61,24 @@
>>    *        Force joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs thus,
>>    *        the test exclusively targets non-bigjoiner outputs.
>>    */
>> -IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
>> +IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>>     #define INVALID_TEST_OUTPUT 2
>>     typedef struct {
>>       int drm_fd;
>>       int big_joiner_output_count;
>> +    int ultra_joiner_output_count;
>>       int non_big_joiner_output_count;
>> +    int non_ultra_joiner_output_count;
>>       int mixed_output_count;
>>       int output_count;
>>       int n_pipes;
>>       uint32_t master_pipes;
>>       igt_output_t *big_joiner_output[IGT_MAX_PIPES];
>> +    igt_output_t *ultra_joiner_output[IGT_MAX_PIPES];
>>       igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
>> +    igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
>>       igt_output_t *mixed_output[IGT_MAX_PIPES];
>>       enum pipe pipe_seq[IGT_MAX_PIPES];
>>       igt_display_t display;
>> @@ -286,6 +297,81 @@ static void test_joiner_on_last_pipe(data_t 
>> *data, bool force_joiner)
>>       }
>>   }
>>   +static void test_ultra_joiner(data_t *data, bool invalid_pipe, 
>> bool two_display)
>> +{
>> +    int i, j, k, ret;
>> +    igt_output_t *output, *non_ultra_joiner_output;
>> +    igt_plane_t *primary;
>> +    igt_output_t **outputs;
>> +    igt_fb_t fb;
>> +    drmModeModeInfo mode;
>> +
>> +    outputs = data->ultra_joiner_output;
>> +    igt_display_reset(&data->display);
>> +    igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +
>> +    for (i = 0; i < data->ultra_joiner_output_count; i++) {
>> +        output = outputs[i];
>> +        igt_require(ultrajoiner_mode_found(data->drm_fd, 
>> output->config.connector, max_dotclock, &mode));
>> +        igt_output_override_mode(output, &mode);
>> +        for (j = 0; j < data->n_pipes; j++) {
>> +            /* Ultra joiner is only valid on PIPE_A */
>> +            if (invalid_pipe && j == PIPE_A)
>> +                continue;
>> +            if (!invalid_pipe && j != PIPE_A)
>> +                continue;
>> +            if (two_display && j != PIPE_A)
>> +                continue;
>
> I guess, we need similar checks in intel_pipe_output_combo_valid() or 
> somewhere in the igt lib to prevent other subtests to fail on 
> pipe-(B|C|D) and so on.

Hi Bhanu,

Thanks for the review.

Agreed, we need this handling before enabling full suite validation on 
CI. Will handle this as part of a separate series.

Thanks,
Karthik.B.S
>
> - Bhanu
>
>> +
>> +            igt_output_set_pipe(output, data->pipe_seq[j]);
>> +
>> +            primary = igt_output_get_plane_type(output, 
>> DRM_PLANE_TYPE_PRIMARY);
>> +            igt_create_pattern_fb(data->drm_fd, mode.hdisplay, 
>> mode.vdisplay, DRM_FORMAT_XRGB8888,
>> +                          DRM_FORMAT_MOD_LINEAR, &fb);
>> +            igt_plane_set_fb(primary, &fb);
>> +
>> +            if (invalid_pipe)
>> +                ret = igt_display_try_commit2(&data->display, 
>> COMMIT_ATOMIC);
>> +            else
>> +                igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +
>> +            if (two_display) {
>> + for_each_connected_output(&data->display, non_ultra_joiner_output) {
>> +                    if (output->id != non_ultra_joiner_output->id) {
>> +                        for (k = 1; k < data->n_pipes; k++) {
>> +                            igt_plane_t *plane;
>> +                            drmModeModeInfo *mode1;
>> +
>> +                            mode1 = 
>> igt_output_get_mode(non_ultra_joiner_output);
>> +
>> + igt_output_set_pipe(non_ultra_joiner_output, data->pipe_seq[k]);
>> +                            plane = 
>> igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +                            igt_plane_set_fb(plane, &fb);
>> +                            igt_fb_set_size(&fb, plane, 
>> mode1->hdisplay, mode1->vdisplay);
>> +                            igt_plane_set_size(plane, 
>> mode1->hdisplay, mode1->vdisplay);
>> +
>> +                            ret = 
>> igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> +
>> +                            igt_plane_set_fb(plane, NULL);
>> +                            igt_assert_f(ret != 0, "Commit expected 
>> to fail on second display\n");
>> +                        }
>> +                        /* Validation with one output is sufficient */
>> +                        break;
>> +                    }
>> +                }
>> +            }
>> +
>> +            igt_display_reset(&data->display);
>> +            igt_plane_set_fb(primary, NULL);
>> +            igt_remove_fb(data->drm_fd, &fb);
>> +
>> +            if (invalid_pipe)
>> +                igt_assert_f(ret != 0, "Commit shouldn't have 
>> passed\n");
>> +        }
>> +    }
>> +}
>> +
>>   igt_main
>>   {
>>       bool force_joiner_supported;
>> @@ -297,7 +383,9 @@ igt_main
>>       igt_fixture {
>>           force_joiner_supported = false;
>>           data.big_joiner_output_count = 0;
>> +        data.ultra_joiner_output_count = 0;
>>           data.non_big_joiner_output_count = 0;
>> +        data.non_ultra_joiner_output_count = 0;
>>           data.mixed_output_count = 0;
>>           data.output_count = 0;
>>           j = 0;
>> @@ -310,24 +398,31 @@ igt_main
>>           max_dotclock = igt_get_max_dotclock(data.drm_fd);
>>             for_each_connected_output(&data.display, output) {
>> -            bool found = false;
>> +            bool ultrajoiner_found = false, bigjoiner_found = false;
>>               drmModeConnector *connector = output->config.connector;
>>                 /*
>>                * Bigjoiner will come in to the picture when the
>>                * resolution > 5K or clock > max-dot-clock.
>> +             * Ultrajoiner will come in to the picture when the
>> +             * resolution > 10K or clock > 2 * max-dot-clock.
>>                */
>> -            found = bigjoiner_mode_found(data.drm_fd, connector, 
>> max_dotclock, &mode);
>> +            bigjoiner_found = bigjoiner_mode_found(data.drm_fd, 
>> connector, max_dotclock, &mode);
>> +            ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, 
>> connector, max_dotclock, &mode);
>>   -            if (found) {
>> +            if (igt_has_force_joiner_debugfs(data.drm_fd, 
>> output->name))
>> +                force_joiner_supported = true;
>> +
>> +            if (ultrajoiner_found)
>> + data.ultra_joiner_output[data.ultra_joiner_output_count++] = output;
>> +            else if (force_joiner_supported)
>> + data.non_ultra_joiner_output[data.non_ultra_joiner_output_count++] 
>> = output;
>> +
>> +            if (bigjoiner_found)
>> data.big_joiner_output[data.big_joiner_output_count++] = output;
>> -                igt_output_override_mode(output, &mode);
>> -            } else {
>> -                if (igt_has_force_joiner_debugfs(data.drm_fd, 
>> output->name)) {
>> -                    force_joiner_supported = true;
>> - data.non_big_joiner_output[data.non_big_joiner_output_count++] = 
>> output;
>> -                }
>> -            }
>> +            else if (force_joiner_supported)
>> + data.non_big_joiner_output[data.non_big_joiner_output_count++] = 
>> output;
>> +
>>               data.output_count++;
>>           }
>>           if (data.big_joiner_output_count == 1 && 
>> data.non_big_joiner_output_count >= 1) {
>> @@ -337,6 +432,7 @@ igt_main
>>               data.mixed_output[data.mixed_output_count++] = 
>> data.big_joiner_output[0];
>>               data.mixed_output[data.mixed_output_count++] = 
>> data.non_big_joiner_output[0];
>>           }
>> +
>>           data.n_pipes = 0;
>>           for_each_pipe(&data.display, i) {
>>               data.n_pipes++;
>> @@ -346,7 +442,7 @@ igt_main
>>       }
>>         igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>> -    igt_subtest_with_dynamic("basic") {
>> +    igt_subtest_with_dynamic("basic-big-joiner") {
>>               igt_require_f(data.big_joiner_output_count > 0,
>>                         "No bigjoiner output found\n");
>>               igt_require_f(data.n_pipes > 1,
>> @@ -358,9 +454,19 @@ igt_main
>>                       test_multi_joiner(&data, 
>> data.big_joiner_output_count, false);
>>       }
>>   +    igt_describe("Verify the basic modeset on ultra joiner mode on 
>> all pipes");
>> +    igt_subtest_with_dynamic("basic-ultra-joiner") {
>> +            igt_require_f(data.ultra_joiner_output_count > 0,
>> +                      "No ultrajoiner output found\n");
>> +            igt_require_f(data.n_pipes > 3,
>> +                      "Minimum 4 pipes required\n");
>> +            igt_dynamic_f("single-joiner")
>> +                test_ultra_joiner(&data, false, false);
>> +    }
>> +
>>       igt_describe("Verify if the modeset on the adjoining pipe is 
>> rejected "
>>                "when the pipe is active with a big joiner modeset");
>> -    igt_subtest_with_dynamic("invalid-modeset") {
>> +    igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>>           igt_require_f(data.big_joiner_output_count > 0, "Non big 
>> joiner output not found\n");
>>           igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are 
>> required\n");
>>           if (data.big_joiner_output_count >= 1)
>> @@ -374,6 +480,20 @@ igt_main
>>                   test_invalid_modeset_two_joiner(&data, true, false);
>>       }
>>   +    igt_describe("Verify if the modeset on the other pipes are 
>> rejected "
>> +             "when the pipe A is active with a ultra joiner modeset");
>> +    igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
>> +        igt_require_f(data.ultra_joiner_output_count > 0, "Ultra 
>> joiner output not found\n");
>> +        igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are 
>> required\n");
>> +
>> +        igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>> +            test_ultra_joiner(&data, true, false);
>> +        if (data.non_ultra_joiner_output_count > 0) {
>> +            igt_dynamic_f("2x")
>> +                test_ultra_joiner(&data, false, true);
>> +        }
>> +    }
>> +
>>       igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>>       igt_subtest_with_dynamic("basic-force-joiner") {
>>           igt_require_f(force_joiner_supported,
>> diff --git a/tests/meson.build b/tests/meson.build
>> index e649466be..7cf359962 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -242,7 +242,6 @@ intel_i915_progs = [
>>     intel_kms_progs = [
>>       'kms_big_fb',
>> -    'kms_big_joiner' ,
>>       'kms_busy',
>>       'kms_ccs',
>>       'kms_cdclk',
>> @@ -255,6 +254,7 @@ intel_kms_progs = [
>>       'kms_flip_scaled_crc',
>>       'kms_flip_tiling',
>>       'kms_frontbuffer_tracking',
>> +    'kms_joiner',
>>       'kms_legacy_colorkey',
>>       'kms_mmap_write_crc',
>>       'kms_pipe_b_c_ivb',
