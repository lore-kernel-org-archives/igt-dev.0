Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E0FC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 11:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1C910E8CB;
	Fri,  9 Aug 2024 11:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrK2ZXkx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7AA10E8CB
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 11:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723203750; x=1754739750;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KdzA4leZzoBwk8ZX7qIRna3VR2xFtcEcpoOBHH+zWzU=;
 b=KrK2ZXkxBUxcyJk0FKv6HvIGHNV+uavjKRKhYdYbYrvX4TTV6e3pVl29
 FLjlGtDSo23Fr8s5GjVAMSy3JbSfZAZyI6bfm1VnTDi9VmmllAbHW8sPc
 mv08FGWNy0YN7rGuseFqnd8Jw4vlqM4uIeSoIrBqfXArPCew6jwBtwa3z
 Q5t+K8L7opYt9lJMm5Tlo3/7iFvkAD98kdP6CMrHTl6t9Dq41btOtftGz
 Mc++iC5S0aKIV/pOf21/jM6mAPBF+ykqqXasXk8NKCtRAxiBONbyZjDh1
 ql4A+OkWKHiTl+irxGyEBoWKxjChZlFkTZZJc1rkc8C/AuCfhySdanx1n A==;
X-CSE-ConnectionGUID: hXYKTGspQNe5ouj+4xrXYA==
X-CSE-MsgGUID: sCv06UerTM2dCxPOE5CeTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21233097"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21233097"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:42:30 -0700
X-CSE-ConnectionGUID: xAmIM1HsSQqkKb03ijktsQ==
X-CSE-MsgGUID: Pj8iSyrOSIKP9mr8gx7S0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="58261173"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 04:42:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 04:42:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 04:42:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 04:42:29 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 04:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cd5ZbDyKke3Gz5/C41hST7vWVFbWxPUXpLrn7aR63o5KHv17iB9zA1y12v34CHiK1v/DfRmVCDO+Neszrh6h3RgqmWQue+WB8pGHJeyd0SGOYNgrsTHzTeXRgGw6X0ukwNWGVhTmgwV3ZU/PlUdK+YxvAnY0mSDLhp3AwxaIHF1KwaFH9KiEF/upnGmu18rPYupIVm+vpP9D0jtHf0bfeTCCMSO717PD3Vmx4EbhEkMWdIbKOASAi75oMNAS3tV7V1lR0sd1sBls7F4gRro9opu6/v+ddoE5qnb1eBK7TD4a68/tuBN7N4IzCRpN9Yrb9lMXtUdG4MyP1hLP8QLSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVfUmfNq0xlM5Qvr484fYUaRYUy89XtlSjmYZlb7lRg=;
 b=JSwGxLoVp0ZqykqgKR1j8AL58MZ/zGhWXNSSWYAyJVtrfzFWFyZbe4MHLgWT3JyehH1gK1SbfEHqzeSZXEInuAhvaC+7Jo7tYJIGyDLvyzCP3soY5DvSl7VFX5pgXBXJBHeatFBwanxMeOnBzVic3C+xYZ9zD6huPLmuxPNyUfQqgFPI9yLOr1LTWDupPJYjVmny+xYWQQNsebDYiL5MGtaB5ddpepm+rQzNlGU2ZmsNJfHWt8K5ZeYCkF8s34HT/YtncTHPWnUZiIKe/H/v584HbxnhCJ7Le6KYiOVm1YhiR7dv1o/YUKO5j9vCo1eLnKC1XJCthGTCaj3JX7WsFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM4PR11MB5994.namprd11.prod.outlook.com (2603:10b6:8:5d::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Fri, 9 Aug 2024 11:42:26 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 11:42:26 +0000
Message-ID: <61358f2a-1739-499c-bb7f-572c469e7a45@intel.com>
Date: Fri, 9 Aug 2024 17:12:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without
 display
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
 <20240801114553.gmb4lpfb4i2xnico@kamilkon-DESK.igk.intel.com>
 <8fba7a7c-47f0-436c-b839-635a5edec4f9@intel.com>
 <20240806125020.jygbaulfsnpv6rqd@kamilkon-DESK.igk.intel.com>
 <5cc321f5-a3e7-491c-b45b-e821caf424a2@intel.com>
 <20240809101003.stg7tgdqxh36hj4z@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20240809101003.stg7tgdqxh36hj4z@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|DM4PR11MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 8473d2ef-efac-48a5-6b94-08dcb8685767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVNZSmlJWUdRL3k4ck9Wd2dwYXBRZW02cXNBRDRjUDdvMks5anVXTXBxVmp2?=
 =?utf-8?B?Y1oxQjVUQ25HK2xpaVRJaXFrekZLa2xXWUlhUEYwQ2RTQTU1VDV6aXVDWlVH?=
 =?utf-8?B?aTdibXVEQlAzNXowQTZKU0U1VDlENDJTUEtRTkZqSUlpTVoybEpuc3BLYmdr?=
 =?utf-8?B?RExsNXZZb0RUNys0QnhQd0NBMnZLVHpEUFYyTVRqcXM1ZGprdXhjMlhtSkI5?=
 =?utf-8?B?MzVjZlZleFlEeEdubU5ERk92K2hWY0NESUNBaWwrQ1RlMXZkUHRyN1p5eDVl?=
 =?utf-8?B?dEJDNWZMWjZyVU9udWxRdXBIdER3VWFZRkxkM214QjFqNW94cjBTMVNCT3VJ?=
 =?utf-8?B?UWk0QS84KzFlRUZCMXJPc1labThSb2svOFFsR0FYR2poRzArVG84aGNzMC9y?=
 =?utf-8?B?R2VmTVJOMVhVdW9ObWlPRnQySGNBWUIyYlM4bVdHTlBuaEJldzIyRjRNM3RL?=
 =?utf-8?B?ckJSRHdUa0F5K2l5WWV3aklEUEExeG83bVhHUnV2eXVNUXMxbTBIbDhjeXZx?=
 =?utf-8?B?VkIrMlRwZUNkTHRhcWJxOXQzcXhzTDF6eUNJcUNBZzlLWmsyU2F5VHpEWUZS?=
 =?utf-8?B?c2hSWG1jUU1ZSnphcnJHejYwRjhKbmdzZ3NlMGFrNEg4OFBEdDZ0S0kvVFlM?=
 =?utf-8?B?dWxIVW51aWJKOHVwVm9Fb0ltZHh0bjVpR0IyVFE4UWNnTFlyTkVCdER6d1A4?=
 =?utf-8?B?cW9VZ0hTdmNwT1lqNWNpOVNlOTNSam53WlVCMSswc1puOHRYM1FUQURJNjBM?=
 =?utf-8?B?RzNkMlpuYTlFWjVjYU44SkNic1Z5Z2ExMGhDS21SUnlOb01wNWN3dXJCcERv?=
 =?utf-8?B?aXJaZnFGR3JNNGdKRDVwSXVicGxhR3d0eE1SSHJWQTRVdjJMTFdKck54K081?=
 =?utf-8?B?U0ZLL3U2cjFrbVJmbUhDZ1NHMTZBa3p5NWhFWFF2SkpyNlVLZ2l5dUhWcHBr?=
 =?utf-8?B?NDBxd3ZJUmhqVzNUcDA0T1lXUEo1aW90QlBZaVdOUS84U0dIQnl2TFE5VTc4?=
 =?utf-8?B?ZFpJeS92OENkZDF1blJPQ05PY1prOUlyOE95SENpQnJpL3NLME9vMHB2Mlh5?=
 =?utf-8?B?TS9YMXJZNnltdGlEaGx1emlqbThIa2RqQnRlb1ljWTZzUnVGcTNjbjR2NmFF?=
 =?utf-8?B?MmhPRjg5cXBiN2M2TmtDVmovR0pSZ0Y1MzNWZ2hYOVBqVWk3U1pkUXpQUmpj?=
 =?utf-8?B?aXVYaXNBUGE4c2dxbDhOdndlZitkaXRQUmhTb2JuSDVKcTBVOC85bHFBekha?=
 =?utf-8?B?eVJoRThRVDhFUEpyRmxub05zYWxSSjRXa1RrQXY1WkVRNlJLVUVab3NMOGpE?=
 =?utf-8?B?ZEp2eG1YMTkweDk1czhkWDdlK0I3dmo0VXZtamJuaHhxVm9NdlE2YjhiNmRq?=
 =?utf-8?B?ZXFhNlFaK3pURjBtbGpjS1JHRHN6RXpub0xBRTZjTzFHTjIrUHVaNFFkLzZo?=
 =?utf-8?B?dUFqcTdSYkMyMmpoOUtFbzRNZkhiMkU3MlM0bTMrK0ZUQ0tuK1RvQ0dFQVBa?=
 =?utf-8?B?T29QVS8rV0oza3JsQ3lHcUVqQytYbjlxaDlkU00vUTdESHpYVEZ2MDNBMDBj?=
 =?utf-8?B?VlI4c243TE92QVpTYUlucWVLazBqdE9NOEtzWUI1U0VSL2pnMGlkaFNYVGtX?=
 =?utf-8?B?dEM0UU9WNnd0RnZRazI2QnVBZmt3VkRRVlVQOGZrc3FUczNLNTBleFRWVC9j?=
 =?utf-8?B?bDFOemVLNDJDbkFJdUhxQnZMd05IRzdzdWVFNUZNd0pkQ0UzMWpHdFNxNVd0?=
 =?utf-8?B?bmx2U1lXQjl2SnlMR3VzbGhZSHFvbmprOHZjeUFmLzQrb3RkQzhCMXRCdzJh?=
 =?utf-8?B?NDM0dXBkc3BmRSt2eStOQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHVDTXpULy9CUVVSSjBsUWdnRTBQWkVRcGNMR0NtdjdDYzB6Z0xHbGU3Nms5?=
 =?utf-8?B?TjE1TnB0M0UwOWlLUHNSNkEyZ2RjU1BsMlJ2eDBJT3prMTFrTVVrQTJWWnlM?=
 =?utf-8?B?RHI1YlJtaDRHZk1ScnVFSkY0TnVLc2JyalNWcGFOc1FWNjU0NitENjVEU3NU?=
 =?utf-8?B?NHJwQ3AvQkwyV1ZCd0FLcnp2aWZkbmxrMUQrN1pVMkwvZG14NTM4TjVhaXJh?=
 =?utf-8?B?M0swREhyTGJwVllXaDJRQ0hkdEN6NVFpK2V4SGlabHJBUWIyVnNsWjNmRDh5?=
 =?utf-8?B?N0UxUG04TUpYVlZ6RDR0cnFWdnQzZXlDWVlGL2tNUnhXb080Zm1QWXRaQTFo?=
 =?utf-8?B?MUthb0R4SjZHWk5hSHhlcHpPYVE5Tk1FMkNOdWp3WU1JRjUvVUVlV2gyTXhM?=
 =?utf-8?B?YXJaYi9BNVBzRUJrc2c2dU0rUlJWQ2JZaGJUWk52ZFRtY0l6cXVpRFZWVm0z?=
 =?utf-8?B?d2l4VHB4cmRiVExGU0h4bTJCajBBb2hkeE9zRTF1d2pIVlkyc3pnWjF2TE11?=
 =?utf-8?B?c1JUU1MxWEI4N3FncXVha2FiYWw0eXYvMHJ0LzM5eGJxNnNGejhybjNETVJo?=
 =?utf-8?B?aVgzNThxaU80M0FhZWR4b3p4QjhHNG04VXFmT0h6dzBEUGVhN2kyN3ZTVUto?=
 =?utf-8?B?azkyUkZFZ0ZaaSs5NnhEZWRuYmQ5WlIyTVFQUE51N1pyQks1VWRkNnFsNHVp?=
 =?utf-8?B?UWo3QWcrdytEdE5kQUFBL2l5NlNZU3A4R2I4a0F0eVViUFhJZ0JQS1MxRlhE?=
 =?utf-8?B?NVJYNFBkNnR0TnZCQ1ZrY3NZc0xzc0JPK1h1b2RzTnY4MjQvOWFUMndRcFZG?=
 =?utf-8?B?bjdsRExjZ0YyWjNxejZLVy8vWUpXM2x6R21zVjVQcnp4bUNIdjYxenFydmNP?=
 =?utf-8?B?cXUvd3ZLZnhpd1c4VWk2eTVURlZLd0wxdEpiWXd2cFRTWHdGWVJ6Zi9peVNR?=
 =?utf-8?B?WnNHYy9mRDduWVNET2NIdjl3Y245LzdLdGwrR1dOYlg0bDFPcHVhZEVZcU5G?=
 =?utf-8?B?QjJOSG5URHI1Q0pWVldZRURSd1QrSWhRL0k5bUNFTWxkMi9LcENGTzk2cE1U?=
 =?utf-8?B?L3JFbVFEekxNd2VHaFkrK0FSaXM5WkJ4dDF1TWYrSEJkekNrZ2pnRFlLUlFY?=
 =?utf-8?B?QTQ4b1JGZDl2bFZlM0lJQmIyRVAyWXJSRGJuckNWdHRERjB2bXdCQnNsMXBa?=
 =?utf-8?B?R25zbWhDMEZMdEI3S0Fud2Fla2JVQmRxVC8rVXFEYjZmYXAwUnNKQ1B6eCtu?=
 =?utf-8?B?UTZBZ2hpNk9CSmhFNFVDb1lMSlFLU09vcUZvNjdoT0s5TEdMSVdhYmlGK1N0?=
 =?utf-8?B?ZithMWNZUEpORkliWWhVaXNqeW4rY2d6ZjB5TXErZ2o1SDRjejZ4NWNFNHBN?=
 =?utf-8?B?djRtUVJvNGRGeWNpUHpCd0FUNmdNT3lpQnRTbzJvbnpQZUl3dUpTZU9pUkVI?=
 =?utf-8?B?Z2NDQmVBSmtaUTFsTFBYTkhoR1YzbGxsMDVUVm90U0xkY2lrdjNITUN6RGVX?=
 =?utf-8?B?eDdzb016Wk9CUDZaSThnYXh6ZzhaRndmbUI3SDdvSjYyS1MxeUM1bXAvcUVV?=
 =?utf-8?B?dzE3QTk1cnlXR2NXVjdQdGlCViswdnJDTCsrbk4yWjlJN2lPZENSejFxejBS?=
 =?utf-8?B?OXA3VDhPVUFFWFRZSHk3OVJnTzUwRHhyNWRjMFdDRi90VUFIbXZWSVhFRFFk?=
 =?utf-8?B?em5YYUxGTDhEMGNwcHdVd0x4SHkwYzU0cUZHNkpZdGs0VnFOQi9IY012eExt?=
 =?utf-8?B?aXd5ZEVGYnNTZmI5bFNZTVNtV2JGLzZ4TFZKVmFJaFhieW1GUmE2NS9LVmk3?=
 =?utf-8?B?Q0hsenFIRG92cW5YdnRRVmV2dzZUMU1oMHJsd1EvcHJTSytGUkpYWFJCajQ0?=
 =?utf-8?B?MHJGSksyVlZpcGwrbVdDTFlrem1jaFQranBIQy96TnRqbTl6aU5CTHFTS2h4?=
 =?utf-8?B?VllHamluV0tKdmtzdXdsOE9obVdhbDNFc1piT2hNRzlCQWlvYmZNbGhqcEc2?=
 =?utf-8?B?endkSTZFaXROTW02VUNKMytEQ2UzYjlWdkZhRHFqeVVRQkloUXlESldMbnBr?=
 =?utf-8?B?azhzU2l2c2VhN1BZUWZtdVBsOE1VNzY4RFY5WXF0NWI0aFJqWFNIclV0cE9N?=
 =?utf-8?B?dDQ2V0wzZC9jcHltb1FtVWpNdy82L0g4T01qVzAxSXZ4dStHQnJVcW4va2hj?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8473d2ef-efac-48a5-6b94-08dcb8685767
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 11:42:26.5477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kb0bIpfWrNu2BLnDhCxl7Z4ROmfOjiGCLT3BTwH8Q6okQzYCs1+Xd2dXLbCtvj89nZ+pkXxjwaFRXgRQS/KsXEqnkaPkmieP0c04eJftNw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5994
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


On 8/9/2024 3:40 PM, Kamil Konieczny wrote:
> Hi Sundaresan,,
> On 2024-08-09 at 14:34:23 +0530, Sundaresan, Sujaritha wrote:
>> On 8/6/2024 6:20 PM, Kamil Konieczny wrote:
>>> Hi Sundaresan,,
>>> On 2024-08-06 at 11:50:46 +0530, Sundaresan, Sujaritha wrote:
>>>> On 8/1/2024 5:15 PM, Kamil Konieczny wrote:
>>>>> Hi Sujaritha,
>>>>> On 2024-07-30 at 17:05:08 +0530, Sujaritha Sundaresan wrote:
>>>>>
>>>>> small nit about subject, you wrote:
>>>>>
>>>>> [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without display
>>>>>
>>>>> imho this should be:
>>>>>
>>>>> [PATCH i-g-t, v3] tests/intel/xe_pm: Add tests for suspend without display
>>>>>
>>>>> More nits below.
>>>> Hey Kamil,
>>>>
>>>> Sure this change I can make.
>>>>
>>>>>> Add tests to validate basic execution suspend/resume cycle
>>>>>> without display module to rule out display related issues
>>>>>> from the suspend/resume stack.
>>>>>>
>>>>>> v2: Add normal reload cycle after running test (Anshuman)
>>>>>>
>>>>>> v3: Rebase
>>>>>>
>>>>>> Signed-off-by: Sujaritha Sundaresan<sujaritha.sundaresan@intel.com>
>>>>>> Reviewed-by: Anshuman Gupta<anshuman.gupta@intel.com>
>>>>>> ---
>>>>>>     tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 34 insertions(+)
>>>>>>
>>>>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>>>>>> index 8b115e2f6..03f742265 100644
>>>>>> --- a/tests/intel/xe_pm.c
>>>>>> +++ b/tests/intel/xe_pm.c
>>>>>> @@ -17,6 +17,7 @@
>>>>>>     #include "igt.h"
>>>>>>     #include "lib/igt_device.h"
>>>>>> +#include "lib/igt_kmod.h"
>>>>>>     #include "lib/igt_pm.h"
>>>>>>     #include "lib/igt_sysfs.h"
>>>>>>     #include "lib/igt_syncobj.h"
>>>>>> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>>>>>>      * Description: suspend/autoresume on %arg[1] state and exec after RPM
>>>>>>      * Functionality: pm - %arg[1]
>>>>>>      *
>>>>>> + * SUBTEST: %s-without-display
>>>>>> + * Description: suspend/autoresume on %arg[1] state without display
>>>>>> + * Functionality: pm - %arg[1]
>>>>> I see you copy-pasted it but imho both Description and
>>>>> Functionality documentation fields should be static, here and
>>>>> in other places.
>>>>> +cc Katarzyna Piecielska<katarzyna.piecielska@intel.com>
>> Hi Kamil,
>>
>> Sorry I didn't get this change. This is inline with the rest of the file
>> right ?
> Yes but this looks strange, so I added Katarzyna to discussion.
>
>>>>>> + *
>>>>>>      * arg[1]:
>>>>>>      *
>>>>>>      * @s2idle:	s2idle
>>>>>> @@ -681,6 +686,7 @@ igt_main
>>>>>>     	struct drm_xe_engine_class_instance *hwe;
>>>>>>     	device_t device;
>>>>>>     	uint32_t d3cold_allowed;
>>>>>> +	const char *opts;
>>>>>>     	int sysfs_fd;
>>>>>>     	const struct s_state {
>>>>>> @@ -757,6 +763,34 @@ igt_main
>>>>>>     					  NO_RPM, 0);
>>>>>>     		}
>>>>>> +		igt_subtest_f("%s-without-display", s->name) {
>>>>>> +
>>>>>> +			if (!drmModeGetResources(device.fd_xe))
>>>>>> +				return;
>>>>> Why 'return' here?! Imho this should be checked in fixture
>>>>> or be a skip. Or other way around - what about a headless board
>>>>> or one without any connected display?
>>>>>
>>>>> Regards,
>>>>> Kamil
>>>> I think this patch idea sort stemmed from the cases where we have a display
>>>> connected and
>>>>
>>>> want to make sure that the suspend/resume issues are not being caused by the
>>>> display.
>>>>
>>>> But would you suggest expanding the test to have the headless/no display
>>>> situations? If so what changes are you suggesting for that ?
>>>>
>>>> Thanks,
>>>>
>>>> Suja
>>>>
>>> I would suggest turn this into a igt_skip_on_f(), not a return.
>>>
>>> Regards,
>>> Kamil
>> Sure I will switch this to
>>
>> igt_skip_on(!drmModeGetResources(device.fd_xe))
>>
>> Thanks,
>>
>> Suja
>>
> On the second look - can we just ignore this and proceed with test?
> It should do no harm when you have no display connected?
>
> Regards,
> Kamil

  So just go back to the original return right ?

Yeah I guess that wouldn't cause any problems necessarily.

Thanks,

Suja

>
>>>>>> +
>>>>>> +			xe_for_each_engine(device.fd_xe, hwe) {
>>>>>> +
>>>>>> +				igt_debug("Reload w/o display\n");
>>>>>> +
>>>>>> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>>>>> +				igt_assert_eq(igt_xe_driver_unload(), 0);
>>>>>> +
>>>>>> +				igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
>>>>>> +				igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
>>>>>> +
>>>>>> +				test_exec(device, hwe, 1, 2, s->state,
>>>>>> +					  NO_RPM, 0);
>>>>>> +
>>>>>> +				igt_debug("Reload as normal\n");
>>>>>> +
>>>>>> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>>>>> +				igt_assert_eq(igt_xe_driver_unload(), 0);
>>>>>> +
>>>>>> +				igt_kmsg(KMSG_INFO "Re-loading Xe\n");
>>>>>> +				igt_assert_eq(igt_xe_driver_load(opts), 0);
>>>>>> +			}
>>>>>> +		}
>>>>>> +
>>>>>>     		for (const struct vm_op *op = vm_op; op->name; op++) {
>>>>>>     			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
>>>>>>     				xe_for_each_engine(device.fd_xe, hwe)
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
