Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446CFC5B574
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 08:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44D310EAC0;
	Tue, 11 Aug 2026 08:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cnt7M8tD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE0089EAE
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 08:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786435348; x=1817971348;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BMUm4Ve9yFPF01MnruszsUVDeHVBIoW/KUhx9QoK0mY=;
 b=cnt7M8tDVFsLU70nlYNKKjqx0630gaG92+k5mUE1rJDF3y9VMX7hAkvB
 ihlkkoMtXpqif1pnAybiVsyfyvzEqBS/MTXBl1qyGj6psSOB6f9OGC0ZZ
 TQgqY9ukPvu8N8nLQ8jr852SQfXQN2lKXFcf+2Pi+EoHmYXBW6QUGqHhR
 aNVUIhzgQfrDbB818OO4KTkpH+KSK+vArG6gXYxM32Avf/pdga65H8BgN
 BX+/tzq+jMG0EMGZ5NrcOlLI3d3vhTAG6tCKLvZ3oM2aKVgNzgTIXTYe5
 WppaZgZu64wlfMR7tLL9Js2EWNWLioIBTg0xCWSlWbSXpJ9+uk+q33rB2 Q==;
X-CSE-ConnectionGUID: dNXtzEtzQKaaYGWKVlR0eQ==
X-CSE-MsgGUID: oFYyn2rYRMyh26fBy9zCig==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104492998"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="104492998"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 01:02:28 -0700
X-CSE-ConnectionGUID: GWZZinMcR6iLlYx1fzAwrw==
X-CSE-MsgGUID: vbB7THK+QNyWnIE2rD7uWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="259956053"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 01:02:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 01:02:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 01:02:27 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 01:02:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCCIAgdeq+W5Kzc1LLpMgbCypVGJJmMdrchWwU22R+WUU3sauI6aR0FSuecM8u3Ddc95H+uQczntph2w4q9MpGnqfi3Y8aBr9zlkmPHC2+o4I2pwPvk4nx4DaeYm4HABQGKx8uGs2ArEb8s6IwHHbaAp4AK0QHtk4gKYerLt39ot+kJ/LWjN63OuDFjD7nJfc0yg+0CPA3rCliwHyvVQ7CpSoHdoEyE2MgjMgj1m+S/q8VBAwOrQukstm4r92zU5odDlLPJp7spwVR0SgS7kLczu2OGDQRcRzpZ0oHE/mFGCmC4fSU8Q2QC3+VJrkseFZ8x3Ja4phNEejyNr+Y9SdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Y9UkO35K/cd+mlsHnQRH0jE0H2tsTXa6Zpf+vTlxTo=;
 b=ig00bOQbBvdt1J4X6N4+7eRz3uHtu/p9DT3cvIzcWXi/3vvsTFLekAL9Yz+YcDJhYX6f8XHozzdG90r8pHzLDGPUCwkLSksJFAygaebrslbLS3VJ8fCdO596hEBNJlI5vEq7d1CzbOTEBHHYV2yFF9zvnhk9wiOyAIG3sErkQmwopQLnzpjBXX5/VeVe+WhuciAmzha3T+yohnuqF6uztb1m6Y+h9Qjkv8uAOuJYSlRqD2FOxue12siPypdp/T87XA0bEL1/Dr5xd3U2EHLO+8ZcWMhYNd8fI9Yf5kPS1N6VZDWwEmVEG3R9pmzoLVH68MeX64P65eqgwbTag34ukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 CO1PR11MB5204.namprd11.prod.outlook.com (2603:10b6:303:6e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Tue, 11 Aug 2026 08:02:23 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 08:02:23 +0000
Message-ID: <ed148833-38ba-4b4a-afd4-9c5d4437d7bb@intel.com>
Date: Tue, 11 Aug 2026 13:32:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] lib/igt_drm_netlink: Introduce DRM RAS Generic
 Netlink interface
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
 <20260729121959.603890-2-ravi.kishore.koppuravuri@intel.com>
 <anUcs2D7ud7oCSyi@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <anUcs2D7ud7oCSyi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0346.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::7) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|CO1PR11MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7b8d3d-3592-4c29-cd59-08def77edf91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: GxjkgZkA/+8Xs4MT5YUk8WNQMxjgPNBUNe7iLrqz+TZJk/K+BXxtokzBw7ARthnLqEIpcV6ePrDcrJCFBoZLcqjocJl9LCiFPAyKzuVxFZ/TSswEL0jvbOfoAFME7ErMTKM7LqNx/+Bcbn4IBlkxnFCNJBlEIfIVzwhsgTx4QasUFBQjGbyCTKgPBB18bLPmu6FBQvGvRYXDMNJi9nCRcJQmv9Ktf3ITriPkqdZawHmd+HDQqmOml1sA4q1H4GCBBx9N/zo4uqbjluaJeTA4Gl8kP5xuhaAXuru1FVdlXS74UyTbugDfAua5PvW6XxUey1GjCHkc+d6jOGlu7ldVTykAyOAu6+ahNj0p2Umj3NtIPOkDPI5agqzqleM1xlHcyMDh3bqt2fKJmZu5XJeac3q8xRxAxMbFtV33d7i2QtHlAmHX5M4S8Fc0Zcueqo7f14Lr4auf9lUq7aS+gNvNaafF0spkNV43aeTStspAnvNCGXQEVbYku7nZFh/HNjEZxUGdLKSEC86j6twA9lCIRxpEcD6kuc1gz6fQT25a+DmdVXVlTS3G7Trk6lrXhpv9EVCs6D5fGRoIauxxGIuY8sJsUGb/qMxj1iuBmfAG6eq5+MiU0nDsENwPHm5bbFmDqWFDoWKt5Ycq52S8/3P51GV7fyAZM5HKIqwgdL0uPkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2kxZWllaDFlMVlwdE1PTmJqa0JzVnhXS1gxeFQzbllxc1hQU3Q0bFVGVDdi?=
 =?utf-8?B?YStLQkdvS05sSU4rY2htWVo2U1FDWDRCdk5HbTdqWjBLU05oQk5JRjFpbjJi?=
 =?utf-8?B?RzNDeStJOGY0SVF1ZHZLSUs5dU9hdFBmWFI5Rjc0NGJES2paUVJiQksxNUFz?=
 =?utf-8?B?WFlQZFZESXc2UllZL2VEQ01HY3NPTjdsRXoyeitRdWhPRm1YcHVqdTlPdEUz?=
 =?utf-8?B?MVhlN2tQY1pUcVU1QkRLRlhEdUsyY1c4UkRRUTlOMEZJUjhyKzFOeEhvTWcx?=
 =?utf-8?B?WUFvandnNTVGMUFyaVgvL2NQRUhZWW1xdStuZHRIbk1YVTVxSm8wNjEzZHo3?=
 =?utf-8?B?ZmFPVVhzMzhnRk1DYUNvZXY5cnJzOU0xb0FuOW1UNzZXSjk0Z0M0dG9CVlhG?=
 =?utf-8?B?NUJUOStHMjk4UFlQYWtQS1pFMFNVV0c3M2Z3eUpVZS9raFpsbzJQRjZwZUdK?=
 =?utf-8?B?bk5aTHVjNThFZHBRS3ppWE03RDFDYjFrcFFkd2JVanJ2SmNMY2I4cXFnZ2Fp?=
 =?utf-8?B?UjBWc0U0ZEZFQkNqZmRtNjVOVTh0WmNCbGQxcHJWWU1VVXEwQmZIMlIwRmVB?=
 =?utf-8?B?UUpxS0xya3FYNUNaN2V5c0xLSXdDSjV6MVZQVVRWOTYwUHBKQkU5ejRKVWdT?=
 =?utf-8?B?TXoreDZQbG1kWDd5eUJrUjRGNzFNNUJZVW9WYm4rQ1hzOGFhTXplS1V2Um1i?=
 =?utf-8?B?VFpSUzVqRFpUL1laZ3RIVG1hekZ1V00zZ0Z4bmgwWFpPSEFzWENDeDhJMWEv?=
 =?utf-8?B?aks0YVZJdUh6eWhvWDk5S2JoamZ4SjBiUkltL04xbnpyUzdvT3VvWmxjMmhD?=
 =?utf-8?B?YlM3UE9UK2wvOHFjNFBMNUQrT3JiVDVMTlI3cXdtOHhIZlRnREhqTXpKeGh4?=
 =?utf-8?B?TnN3Z0JQKzlmb3VKVFV5QzZROUZUenFYZ0pwaVovMTlxV2hQNUZSNHdxOFdo?=
 =?utf-8?B?T1hnZDRPWEEyZVYwbFFpaXFVN2FOd3B6ZTFDNWRVdjl2QzVRUTZ1TkFBY3d0?=
 =?utf-8?B?U2dmOWFrdVNYOVJFV0RlcWtGZDhGcFlFRE1RVExBRmdoWWY5WFZCSWltVU9h?=
 =?utf-8?B?Z2R2dUh3UWxHdDg2TXNRdjNaT0NHY1NGdzlBYWxVcklCc2JRQWFuZXR4ai93?=
 =?utf-8?B?aUNTQ2g2cEdaVllnYVMza3hRREtaNGxTWkQ1d1pRSnR4Nmp2alloZHZiYXNX?=
 =?utf-8?B?STUwbzJ2WmptVFBrejdDeTgyWkFhcThtbEVDSjVLb0ROWVdFY2QvT1hTVFgz?=
 =?utf-8?B?eXUwTU83R2lRWllHVDk1VzZ4a1FsWWx4dmZRRHVKR0VOdkdXWk4vMjBMZlhY?=
 =?utf-8?B?OTBXb2wxOVN2M21uUGx1eXg4REdCbEs2aWZUeTdOZ1RLWG80aHhEVXFtNW5M?=
 =?utf-8?B?MFdFYW81Z1Z1UDlvclpFL0Fmay9UdGtteTRZWHdMRnhtQnpHeGxRQTdHN0F3?=
 =?utf-8?B?T0YvTk5leEpzUExzTVlINk55ZEVlaGhwN0tiaGY0OGJTVHd4ZVlNTFNONE4y?=
 =?utf-8?B?Y3c0WXhLbVg2NitjOW5QdUZUeVVYR3hoOW9lQW5HR1EyZWVmZFVCZUliR0V6?=
 =?utf-8?B?YVhMMFNaYkxFU3VYM3BWdnQrVFQvUkN4WTZmUTBlY1BzVkp2V1hXaGFLUnRC?=
 =?utf-8?B?Vk0xa1ZSUStYUW9QWks3bjRwRk0yVTk5bFFPcUZ5Y3hqWmpYZzVuNmFldHJT?=
 =?utf-8?B?VWE3blZRUGZLN3Z4NGZ1S2dlaFluZ3gzSUNYcWlKcFNJN3o2VVFXRWVCem1I?=
 =?utf-8?B?WjZMdVJvZ2lCMHBCSXp3cFVqd21tTzdRVXFOTTZCajFReWxRYmt4UTAwTXI0?=
 =?utf-8?B?Q0F0anEzeHFwNzN2enJ2T1FCQkNSa0RiVzdjRngrWmsyU2VPODNPOE5UY1Rk?=
 =?utf-8?B?eGIza1Juc1N3ZGpPQ1BBVGtnaDIzMDRRWkpjQlBDcjgrOUo5TUwvZWpQY1VT?=
 =?utf-8?B?b0hDQ2l1VzRvU1BwdTMwOVlXOVAvbThlQTVNSTlUOGg4Smc4eDVZTGpQV24r?=
 =?utf-8?B?eXNPbVpBU0pybFF3Qk5kMVJIaTVhZTB1ckRoOUFKWlRjZ21lQ0tBM1I3d3RO?=
 =?utf-8?B?K3VRNUQ2ZkxrNktaYmo0Wi8wdWxKN08rREZYWUJDNGlCOUJyYldQQkNuaUN1?=
 =?utf-8?B?OFB1U2hFVC9reE5lcForZGt3dWJ5eFRVNHpDOEdteUZ0UERGOUtRUlh3TUxS?=
 =?utf-8?B?c3l4RDJ0aXVUYmt6R1o5dnpnYTAzTmt5ZFdHUmI3eGlIQnlPWFdjN0E3WXZ3?=
 =?utf-8?B?ZUIvU1F4RCtTQzFkKzhQWmpETmU0aG5FaGFBRmgxSkhvMXpvUlFiZmtLczRG?=
 =?utf-8?B?TWdQVE84eDJSRXNNTlNUOXZpa3h2UjYrcldBNFFmWVFVYUlEWVY1UWdqQVZh?=
 =?utf-8?Q?9tMVS0cOc7DKvcDIK/21sYnBJ72EOyDnZG3A2?=
X-Exchange-RoutingPolicyChecked: D9VFh1Qszu5gOdv8o41mk2xjSg6yOYyDZ7WMN5KbhnBWz4nHYp4jkbAS2+LhoYOEV+/ZXX0HbLfsXboPrlLf74jze0gp7gbFrJLCgEQwyJZApqEXamnNJW+BfRgmzM68i35LlMMVZLdYfnJN++E/M1G7tUgB/3LFQ+1nWdmUoM1UVN0GtcyHFLGnZtFutPqL+aHKu2wFuvo5va7KnWAoLJoYG7NCtEo+zYzQ+Ijy4gSwXZ3fIIg8enTTS8PB912Dyie4Ne4HhOgJ/IzwgvbJEph5zGNCGtGmEs5mC3w23e4cJE1s4zVodMcakQAnzdFY6/CIf+bI1qZIjTE2dMC1cg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7b8d3d-3592-4c29-cd59-08def77edf91
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 08:02:22.9700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gBUcv1o7PIH4MZlffCy/sgeR54Rpr8L+wxNmTexorcxxfQFV0TlF9hjUX/MMpfKbW3YFRO/dAZkh8lE5HItHjHfNUmeC7Sz3S0d543l+d3mx07Vcvhl+O2tvuk4DmD/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5204
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


On 07-08-2026 05:15, Harish Chegondi wrote:
> On Wed, Jul 29, 2026 at 05:49:52PM +0530, Ravi Kishore Koppuravuri wrote:
>> Introduce DRM RAS Generic Netlink interface as a library
>>
>> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
>> ---
>>   include/drm-uapi/drm_ras.h | 50 +++++++++++++++++++++++++++++++
>>   lib/igt_drm_netlink.c      | 60 ++++++++++++++++++++++++++++++++++++++
>>   lib/igt_drm_netlink.h      | 25 ++++++++++++++++
>>   lib/meson.build            |  9 ++++++
>>   4 files changed, 144 insertions(+)
>>   create mode 100644 include/drm-uapi/drm_ras.h
>>   create mode 100644 lib/igt_drm_netlink.c
>>   create mode 100644 lib/igt_drm_netlink.h
>>
>> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
>> new file mode 100644
>> index 000000000..218a3ee86
>> --- /dev/null
>> +++ b/include/drm-uapi/drm_ras.h
>> @@ -0,0 +1,50 @@
>> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
>> +/* Do not edit directly, auto-generated from: */
>> +/*	Documentation/netlink/specs/drm_ras.yaml */
>> +/* YNL-GEN uapi header */
>> +/* To regenerate run: tools/net/ynl/ynl-regen.sh */
>> +
>> +#ifndef _UAPI_LINUX_DRM_RAS_H
>> +#define _UAPI_LINUX_DRM_RAS_H
>> +
>> +#define DRM_RAS_FAMILY_NAME	"drm-ras"
>> +#define DRM_RAS_FAMILY_VERSION	1
>> +
>> +/*
>> + * Type of the node. Currently, only error-counter nodes are supported, which
>> + * expose reliability counters for a hardware/software component.
>> + */
>> +enum drm_ras_node_type {
>> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
>> +};
>> +
>> +enum {
>> +	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
>> +	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
>> +	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
>> +	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
>> +
>> +	__DRM_RAS_A_NODE_ATTRS_MAX,
>> +	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
>> +};
> The above enums doesn't seem to be used anywhere in this patch series?
This file is the UAPI header file directly taken from the Kernel (as it 
is, not modified anything here). In my opinion, better not to alter 
anything in this header
>> +
>> +enum {
>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
>> +
>> +	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
>> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
>> +};
> Is this header file auto generated? I wonder why the above enums have an
> "A" after RAS but not the below enums? I think it would be a good idea
> to have consistency in enum names.
This file is the UAPI header file directly taken from the Kernel (as it 
is, not modified anything here). In my opinion, better not to alter 
anything in this header
>> +
>> +enum {
>> +	DRM_RAS_CMD_LIST_NODES = 1,
>> +	DRM_RAS_CMD_GET_ERROR_COUNTER,
>> +	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
>> +
>> +	__DRM_RAS_CMD_MAX,
>> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
>> +};
>> +
>> +#endif /* _UAPI_LINUX_DRM_RAS_H */
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> new file mode 100644
>> index 000000000..1c07bb2db
>> --- /dev/null
>> +++ b/lib/igt_drm_netlink.c
>> @@ -0,0 +1,60 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +
>> +#include <netlink/errno.h>
>> +#include <netlink/genl/ctrl.h>
>> +#include <netlink/genl/genl.h>
>> +#include <netlink/netlink.h>
>> +
>> +#include "igt_core.h"
>> +#include "igt_drm_netlink.h"
>> +
>> +void cleanup_nl_socket(struct app_context *ctx)
>> +{
>> +	if (!ctx || !ctx->sock)
>> +		return;
>> +
>> +	nl_close(ctx->sock);
>> +	nl_socket_free(ctx->sock);
>> +	ctx->sock = NULL;
>> +	ctx->family_id = -1;
>> +
>> +	igt_debug("Cleaned up netlink socket.\n");
>> +}
>> +
>> +int init_nl_socket(struct app_context *ctx)
>> +{
>> +	ctx->sock = nl_socket_alloc();
>> +	if (!ctx->sock)
>> +		return -1;
>> +
>> +	igt_debug("Socket allocation successful. Connecting to Generic Netlink...\n");
>> +	if (genl_connect(ctx->sock) < 0) {
>> +		cleanup_nl_socket(ctx);
>> +		return -1;
>> +	}
>> +
>> +	igt_debug("Resolving Generic Netlink family '%s'...\n", DRM_RAS_FAMILY_NAME);
>> +	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
>> +	if (ctx->family_id < 0) {
>> +		fprintf(stderr,
>> +			"Failed to resolve Generic Netlink family '%s': %s. "
>> +			"This may mean the running kernel does not expose DRM RAS support.\n",
>> +			DRM_RAS_FAMILY_NAME,
>> +			nl_geterror(ctx->family_id));
>> +		cleanup_nl_socket(ctx);
>> +		return -1;
>> +	}
>> +
>> +	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
>> +		  DRM_RAS_FAMILY_NAME, ctx->family_id);
>> +	return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> new file mode 100644
>> index 000000000..c20d5452b
>> --- /dev/null
>> +++ b/lib/igt_drm_netlink.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_DRM_NETLINK_H
>> +#define IGT_DRM_NETLINK_H
>> +
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +
>> +#include <netlink/netlink.h>
>> +
>> +#include <drm-uapi/drm_ras.h>
>> +
>> +struct app_context {
>> +	struct nl_sock *sock;
>> +	int family_id;
>> +};
>> +
>> +void cleanup_nl_socket(struct app_context *ctx);
>> +int init_nl_socket(struct app_context *ctx);
>> +
>> +#endif /* IGT_DRM_NETLINK_H */
>> +
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 4af346b43..79674e032 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -27,6 +27,7 @@ lib_sources = [
>>   	'igt_device_scan.c',
>>   	'igt_drm_clients.h',
>>   	'igt_drm_fdinfo.c',
>> +	'igt_drm_netlink.c',
>>           'igt_fs.c',
>>   	'igt_aux.c',
>>   	'igt_dp.c',
>> @@ -141,6 +142,13 @@ lib_sources = [
>>   	'vendor/uwildmat/uwildmat.c',
>>   ]
>>   
>> +libnl = declare_dependency(dependencies : [
>> +	dependency('libnl-3.0', required : true),
>> +	dependency('libnl-genl-3.0', required : true),
>> +	dependency('libnl-cli-3.0', required : true),
>> +	dependency('libnl-utils', required : false),
>> +])
>> +
>>   lib_deps = [
>>   	cairo,
>>   	glib,
>> @@ -148,6 +156,7 @@ lib_deps = [
>>   	libdrm,
>>   	libdw,
>>   	libkmod,
>> +	libnl,
>>   	libpci,
>>   	libudev,
>>   	math,
>> -- 
>> 2.34.1
>>
