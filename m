Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEC1CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 15:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BEF10E388;
	Mon, 17 Nov 2025 15:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jj7uA0Uv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFC610E388
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 15:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763394217; x=1794930217;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fArnCBfDYUsrfK8xDetY1N+tXM0qA9VHOh0KXxT2paY=;
 b=jj7uA0UvjgKlKBxQDF+fTp5GUxE/iFNanLnkWlLubaSG6339NyurdKce
 jPC7BVg6z17RHh2mcb06SWPLoFRm8PNGgxKvuT3VH8ky3g0f6hr4qPdT7
 FoKiigMpBvNhhtYofssc8OvbIUSMuxan4XaTG8DQmA8mYV8WyJwr+pB55
 jH1vgCFnfYSgiDcUCYfWZ0nNLCzROrA7OuVNFd0n9RgJxGknnRUOaF5RV
 SFE662+3XONur3hYuzx05uGZ9zn0IEQx+wj+Rl56CPvIbKOSmQ9mO9eQW
 yB5IHdkS0Af2gz0xPqiVxBV7Dh72rtaWwE8dZmjEng/qZ8YAcPtbhNVKZ Q==;
X-CSE-ConnectionGUID: DWIAuk3jQXuTFUXac5Eo8w==
X-CSE-MsgGUID: +OxWfL0ETjOKeXCUNty12w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69263726"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="69263726"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 07:43:37 -0800
X-CSE-ConnectionGUID: IUmAAR6nQJiDY6SNw6RVIQ==
X-CSE-MsgGUID: 85p8bRQNTMW2+dTIQdEuRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="190642460"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 07:43:37 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 07:43:36 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 07:43:36 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 07:43:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+oWJt/Js3MzxwDJ6YSR+D4OHAFHptQoDKPN7CuH9V+QZkSL8EnMb6rLJX4NQ+9cXmBqCcVJCnte0pKV9sX23VI3cPTZYZSBjoC1ErnXIDTtV3peqnXgWH3OdaRcICT8gLXoI50ljNegl2C0VOHsuww6AqXBq64dtiWJcjyq2RMfBgBthtCXfoPNLsmvcqqDllYj4zD0pVJ3SsaFcZsDCjWrT/nuL6/TzbzQ4sFtbZp2CvQf8PpBse4/Mh67DU6ftN1MyIVb/RbUbzePeNM80l42fQhBGNdKv5NoCRXvHyyQA2oqMEu2K8E8vxuQBrW1tVHxc0x2pPGMptmGjuRSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exJUtoZ6K476H1ALclD91DnUkxHbO2TQYUJPSkDF7+U=;
 b=ZQ832ZV7w7PGC59IjLGVCslKhHe5PKhgwuVe0GfS+wbHcxrIXwpQvUr/UQsB3yenDSrskiL68HYAVniTVmRDrYBnvMcDNpNJ8ivQWH1XhrSw9PaRC3CAA3eZ+zp9bxUGZQ+4Ul6nyzQL3XpWpVrCUSZUkaukTqXrTE1Rgp97O/I4FaWBMTb0AFuzFVsCradRDEzq0HN4ogOGY96NIBNuOQrikpiUTXBQOA+nDRJcxpQgq3FVxEZgbSHfiVqHRIPSAb+D1xbC+9VNAWYhLgXyJYeQbDeCLYGHax7cDp9k8+OIj+r9lYTuRiGEZpfcLEh60NNDH7bfAdzLV30AIxc6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by PH3PPFD9C09B4A7.namprd11.prod.outlook.com (2603:10b6:518:1::d54)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 15:43:31 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 15:43:31 +0000
Message-ID: <e2379b51-6f05-4342-9628-d0bb15ef9af4@intel.com>
Date: Mon, 17 Nov 2025 21:13:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise and introduce lr_sync helpers
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-2-nishit.sharma@intel.com>
 <2b0a163b988d0d148f04aa3cb8910c18964d2e6a.camel@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <2b0a163b988d0d148f04aa3cb8910c18964d2e6a.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0109.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::14) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|PH3PPFD9C09B4A7:EE_
X-MS-Office365-Filtering-Correlation-Id: a19e8d8b-4465-42a7-180e-08de25f00f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2dPd1ZLZUhnamxuQVJ6enR0YVd4cEZkYjYzejVhTi9lTEpBbDNQN0xBV0xQ?=
 =?utf-8?B?NVlWU2pFekx5cUFHK1FuaDRvelpCdlNlWERJTW1TMkVwb3o2MW9nd1BYcll5?=
 =?utf-8?B?ajgvd2kyOExGcXF3amFQV3puUUlMYTJ6dFUwckcyMzdLcnM4dDZQQUcwV3ZE?=
 =?utf-8?B?UnA5ak5RcGNQdVRHbXBsU0NvVGs2WFZLdFNZbkJpN3F2TjlnRlo5d3QyZTdx?=
 =?utf-8?B?VUNGMVVUbWZMZjV2UFU0MFB2SXlPdi9RR1dtZS80czNFVUw0R0RUSjBISVd1?=
 =?utf-8?B?YjIxVEJPam5YS3YwL0VWdStHUzNBN3dRU2d3ZmNJM090K3B5TWtJU2FndklQ?=
 =?utf-8?B?a0x5RTRVd21icWVqc1plK2VXWjlRMG0rS1dPM3ZmMzNvL2dlcVBrRmZjQTh2?=
 =?utf-8?B?dWt5UTFIcUFCYWdBdjZZMEhlMThQck03Q0ZRdXhxVDlpUlRydHpwUmVJU0ZH?=
 =?utf-8?B?WG5HK0xITHdWNExLNTVVRlZvR1NGRjV1WTRqMU1uZUhWemhiWGZ1aHg3bVZB?=
 =?utf-8?B?a1pWS1ZDb3pvb3gyS1RMdkNHWThkbVlBUHk1NFpHVEY0bnl5Uy8xY2p4bFZM?=
 =?utf-8?B?cDNIR1luWkZDNnJ0MThTZ3g3emo3eE9GVFhrSUZjVzlPSlhNdHk2Z28wSEhv?=
 =?utf-8?B?TnVaYlNKMXZ3TXBBK3BCOHU1YWxnQk90YXhLcUlQVUZlWVJtN0JRWEY5OUho?=
 =?utf-8?B?TjY3NFQ3Z3c2UkVWeXdZeHpHcnBkaDcwQWppdEhiVTNNenROcW9zQnBwd0lw?=
 =?utf-8?B?K3ZyeEJMdEZXdnp5aHQ3VE5NUFI5d3RhRVViWkRFNGZmdHRwVm1WbjZrdEwy?=
 =?utf-8?B?RmpyZ2E2RmFuU0lLVEtDeE5nZjdvWEx4OC9BWVpNaFFScHYva1ZTaENFVjVM?=
 =?utf-8?B?T3FidWE4VkVCY1JSQWlLQktqaHBhN1EvWnE4blBDK05SRFVlU3JvYmtaV2Ev?=
 =?utf-8?B?dzYwVEJHNHBybmRvSlc4OERTcFZ6ZXU3RnByNDZKb3NBejV1d096eTlmTjZF?=
 =?utf-8?B?M0NWOXZlbFY0d25zU1h4MXJuclNCL2RadlRqblRLVC9WeDVMV3ZjTkVCM3Ro?=
 =?utf-8?B?c2k2djZQbjQycXFtTXRObGxrb0tLYm91cHpKVXJndWZiaXowU3FZMXNlVzcy?=
 =?utf-8?B?YWw3Q3M2RW5pbDNvZC9oR3BQN1A2eGF1bDNPcHQrT01xQWhSeGhlVFV5bFpP?=
 =?utf-8?B?VUQ1ZU9ZYlpmYnRSNytaQXFyNjA5ZU1BcWthcVQ2bXlWNmI5blgyT05aU2NL?=
 =?utf-8?B?ZXJoVlFIdlZzQkoySFVYWGNnRDUyYjd2dXU1WDNNbWFYNDBodmY2c2M4N21C?=
 =?utf-8?B?K3d6aHhYbzBNK0JWbVdsOXZZdThZbitqS3ZYTU5qSk0rS09iUkRwazYxYnJJ?=
 =?utf-8?B?MDhxc1R0TGk2OU5ZcUdCbWdyMTR3ekIrVWVudE8wa3gwajQ5ajh1K0Q1bGpj?=
 =?utf-8?B?YXUvWVZzdnhFVURaL1dRNm13cGFqRlczQWNCbXRFdWxTRnZaTmxzeFY1cXNu?=
 =?utf-8?B?OXFNZHByVkJsRE5KUGxyZWNvNGdvcmx1bFQ4UlE3Tnk5VkJuVFcrTTBIaklR?=
 =?utf-8?B?NEJIMUh4b0xzOVUvZWlETlJ0bWhucnFpT0pjMTRYaE50b1lmZFp2QkVneFVG?=
 =?utf-8?B?V2xuY2pZRElaa1d1eUJvejhPVnNIQ25DUG0wdGdYbnRqczZhUjZWdFNNZmVp?=
 =?utf-8?B?czJTWVVsVkowNWZoUXVoajkyUW8yU2VCclBCamVyaGx6dHYzY1A4b3NyRVZ5?=
 =?utf-8?B?SU81THFwMnhKZHhIWE1BOGJIdk14cENIK1Zsak8zUld0cTRVRXYycVdsVkFT?=
 =?utf-8?B?NnEzaWc4RGd1MVNrWncxRmhYWnB2UEZOQ1NUUHltVVZyTHFnUWd4SWxvZHJG?=
 =?utf-8?B?N0Z1UFNHYklTeXcySlZKdlZJUmlMYng5OG4yN3dQdTMxbzdsc3RaemdMWkw3?=
 =?utf-8?Q?S5rH8DswsbLsVtaQ5Rp6ICzt7TeDe6Sp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2dpZy9LWXVNMjJxZFNXTGQ5VURnUzZoUmE1UnAvQmZXVDkxVDdpUlZ0bVdM?=
 =?utf-8?B?ZkVlVkU0OWdXeTlkRU9nZkVjOE9iMWNsZ1JObnNOL0VOVU9GT2x6OUZtM0RZ?=
 =?utf-8?B?TE1PSVMrZmV1alhzejhWLzhVYjdlTFhoUEI5YlNCMlloWE5IeWRUVmJGNk13?=
 =?utf-8?B?ZU1uZm9JYm5scSt6dkpBVkV0RmJmemFhd0ZRRk5zZG1RcGFMWFNQNnE5NERB?=
 =?utf-8?B?c0R2elRZYlJjVHZMRU4rNDNOZGRaUHhjZE1MU0lLQk9qNU8zQW1MNXo5TEdD?=
 =?utf-8?B?NHlrVGtCSUtRRlhYbUNsZjhLUlNQOFZmdC85ZnBDMEYyTEMxVEdJRnlTb1hF?=
 =?utf-8?B?TmJPS3hzMDU2c0M5WU1aeTFhd2VEbEs2Q0lYdnNMZDE3ckxlWE0yWFphUU11?=
 =?utf-8?B?RnIvUlFmWHA2SktxYWpQNE5ENUs1K0FxMXhGOUFnZEZaQ0xJNi9hQy9rRnBs?=
 =?utf-8?B?akRSOXdobStDQkp2c2VnSnJqZlI4WUxHb0FuRU5FUlZIRWJXc3o0Y3VsaTZN?=
 =?utf-8?B?RWYrZ2RYekpTK1hKeTU3eVFib1J6U3A0SzZudHEwU2E2eE5JR3N4TFJ5Qy9W?=
 =?utf-8?B?Nkx3eUhZaG9xMzZZZlVwcC9FQXYwaDBGS1poM2xRdCtaMDJFa2QvTGFOZUdm?=
 =?utf-8?B?Y1dCbU5tS3VKNjliQml6aE9yMkRqQ1B0UlVLZ0FPdDRTSm9VaVBwd3ppQzh1?=
 =?utf-8?B?KzFYMFBTTkY3NjcreUFEZ2dtckFqcm9lQkhxT0FqRHNyU3J2M1BJbmlHWkkx?=
 =?utf-8?B?akZLYmRLRTBDOXpUbGRxaTR2SkFyWFF5RVlGRk4zbEZQdENtYjZvdDBEWFlT?=
 =?utf-8?B?ZmlvVWNmNkxZV0pySWVSNWYvaEgwTGRENlpiTGVsSmR1ZUV1ZkVHMVAzbklH?=
 =?utf-8?B?NGVYR1ljN2pTUDA1S0dHN1NDNTM4WEk5cStaeTFFcFNtdWxIUUxnTWN6eFh5?=
 =?utf-8?B?UENGc2N5VHhud0R6ejdnSGlhbkp4SndPS2gyTG1tN3JQN1A3WHJrdmpaYS84?=
 =?utf-8?B?Ylg3ajlkYnBSSkJITFpRSGIwOG8vWWxPMDBjWVVMQ0tuaFpON0hpUWVTYTJr?=
 =?utf-8?B?a1dQeUp4WER4eGVPdzlPb1NDU0R4SGNCbkVNL0RpcUFtTnhhelV5VURkLzF3?=
 =?utf-8?B?bmJBZ25NMnIwQ3E2bHhCa09yNVdUWG5IbmticWxJZ1lQMnh4OFljaEsvOEJ6?=
 =?utf-8?B?Z0RSN1UrOFNaVFlqOEVWdDdpWlZYekppQnZYME42aUFZeVFhNmphc3lDQ0JM?=
 =?utf-8?B?K0IrVkI5RjFQTTFiVjQwbHNFdkNSRTkyMTdSSnQwNG55UjExK0RqaEZkTDhp?=
 =?utf-8?B?SVpzSDlqcUN6Uk05SXE5V0VlWXVDeHM1NmxlY2x0clo4WGcrWk5uOXBuUGY3?=
 =?utf-8?B?ekV2cTJjekNqcUJEU0RsSEcwUUtBVXFpendhOUwrYnR4MUkzRE1TSDRJdWxL?=
 =?utf-8?B?a0VmWWlhVXFqZG0yKzFIS0g5eHNkc3NYN0t1cjVDdk0rY3RJT1NTcGwxZkln?=
 =?utf-8?B?RWhlSWRIV0hlZzEyaVlRUVAvVWNiVVUxbDdYUDhzeTRSVXd1OTNMT05Iblpv?=
 =?utf-8?B?UWx4YnhyTmFoZXpvcEJMR21Xa3B3TkxHUGx4eWp6NG1QeXpjQnFVZXdBMm82?=
 =?utf-8?B?RU9GWFFNQ0pXOUhVL2ExeFUvNjZzWndCM2VNRStBOERkbGQ5MTk4c1pIRGlp?=
 =?utf-8?B?TE9uN3NpNERLeXZxNEdESWdzOFdWV1pJeEFzZ3QxL3NCaDF2N01mMGNNVlA1?=
 =?utf-8?B?TDhVMWx1UGZ1U1RoYjNaNzZnYTVIRnJKbWZMYW9WOHlKUzRFdlMzb041Vk1V?=
 =?utf-8?B?azlqZExaYlFkN0puWEM5dGV0TEoxUXVYaEVjZGlFOGU5bTZjd1c5cDdXdm1z?=
 =?utf-8?B?ZHB1enJDL2pwTzNLZ3ZkNnpEdEQ0VXhEM0x1VGtqakNTZXo0bjgrV3RqOTJC?=
 =?utf-8?B?Z1ZFeU5raHZqZ3JHQm9lcHRoR2Qvb3d0bkgyTDBDdjVHanJDaEJPTm1wUFB0?=
 =?utf-8?B?Zk05VlJNQ1NQdkczajkyM1U2c040QU0vK2Njak13YzFCT0xrbERNc0VXNW1q?=
 =?utf-8?B?TmF5Uk53WlRYejJaZjF4a0tZQmxsWDVBRlU0T2hyWXNkeWRKUVptZzJWUDk2?=
 =?utf-8?B?eGhSL3NkQmNraTYxM1VRcGhaQkxwWGtWMldFWkR2SnB0NWVrM1NvbE40UkxJ?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a19e8d8b-4465-42a7-180e-08de25f00f66
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:43:31.6989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYDm0NNfzQ5IikLhR2D8zJtwcbZmgluDS6adr44RkejABReZjMhDe+4cv1N+EMLNbBGk+niedLxaRdd842abTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD9C09B4A7
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


On 11/17/2025 6:04 PM, Hellstrom, Thomas wrote:
> On Thu, 2025-11-13 at 16:33 +0000, nishit.sharma@intel.com wrote:
>> From: Nishit Sharma <nishit.sharma@intel.com>
>>
>> Add an 'instance' parameter to xe_vm_madvise and __xe_vm_madvise to
>> support per-instance memory advice operations.Implement
>> xe_vm_bind_lr_sync
>> and xe_vm_unbind_lr_sync helpers for synchronous VM bind/unbind using
>> user
>> fences.
>> These changes improve memory advice and binding operations for multi-
>> GPU
>> and multi-instance scenarios in IGT tests.
> s memory advice/memory advise/ ?
Git it. Will edit the description.
>
> Also the lr_sync part is unrelated and should be split out to a
> separate patch.

Sure will create separate patch for lr_sync part. Also the 
xe_exec_system_allocator() changes available in Patch [2/10] should be 
merged along madvise changes within

Patch [1/10]?


>
> Thanks,
> Thomas
>
>
>
>> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
>> ---
>>   include/drm-uapi/xe_drm.h |  4 +--
>>   lib/xe/xe_ioctl.c         | 53 +++++++++++++++++++++++++++++++++++--
>> --
>>   lib/xe/xe_ioctl.h         | 11 +++++---
>>   3 files changed, 58 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>> index 89ab54935..3472efa58 100644
>> --- a/include/drm-uapi/xe_drm.h
>> +++ b/include/drm-uapi/xe_drm.h
>> @@ -2060,8 +2060,8 @@ struct drm_xe_madvise {
>>   			/** @preferred_mem_loc.migration_policy:
>> Page migration policy */
>>   			__u16 migration_policy;
>>   
>> -			/** @preferred_mem_loc.pad : MBZ */
>> -			__u16 pad;
>> +			/** @preferred_mem_loc.region_instance:
>> Region instance */
>> +			__u16 region_instance;
>>   
>>   			/** @preferred_mem_loc.reserved : Reserved
>> */
>>   			__u64 reserved;
>> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
>> index 39c4667a1..06ce8a339 100644
>> --- a/lib/xe/xe_ioctl.c
>> +++ b/lib/xe/xe_ioctl.c
>> @@ -687,7 +687,8 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr,
>> uint64_t value,
>>   }
>>   
>>   int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t
>> range,
>> -		    uint64_t ext, uint32_t type, uint32_t op_val,
>> uint16_t policy)
>> +		    uint64_t ext, uint32_t type, uint32_t op_val,
>> uint16_t policy,
>> +		    uint16_t instance)
>>   {
>>   	struct drm_xe_madvise madvise = {
>>   		.type = type,
>> @@ -704,6 +705,7 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t
>> addr, uint64_t range,
>>   	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
>>   		madvise.preferred_mem_loc.devmem_fd = op_val;
>>   		madvise.preferred_mem_loc.migration_policy = policy;
>> +		madvise.preferred_mem_loc.region_instance =
>> instance;
>>   		igt_debug("madvise.preferred_mem_loc.devmem_fd =
>> %d\n",
>>   			  madvise.preferred_mem_loc.devmem_fd);
>>   		break;
>> @@ -731,14 +733,55 @@ int __xe_vm_madvise(int fd, uint32_t vm,
>> uint64_t addr, uint64_t range,
>>    * @type: type of attribute
>>    * @op_val: fd/atomic value/pat index, depending upon type of
>> operation
>>    * @policy: Page migration policy
>> + * @instance: vram instance
>>    *
>>    * Function initializes different members of struct drm_xe_madvise
>> and calls
>>    * MADVISE IOCTL .
>>    *
>> - * Asserts in case of error returned by DRM_IOCTL_XE_MADVISE.
>> + * Returns error number in failure and 0 if pass.
>>    */
>> -void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t
>> range,
>> -		   uint64_t ext, uint32_t type, uint32_t op_val,
>> uint16_t policy)
>> +int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t
>> range,
>> +		   uint64_t ext, uint32_t type, uint32_t op_val,
>> uint16_t policy,
>> +		   uint16_t instance)
>>   {
>> -	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext,
>> type, op_val, policy), 0);
>> +	return __xe_vm_madvise(fd, vm, addr, range, ext, type,
>> op_val, policy, instance);
>> +}
>> +
>> +#define        BIND_SYNC_VAL   0x686868
>> +void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t
>> offset,
>> +			uint64_t addr, uint64_t size, uint32_t
>> flags)
>> +{
>> +	volatile uint64_t *sync_addr = malloc(sizeof(*sync_addr));
>> +	struct drm_xe_sync sync = {
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.addr = to_user_pointer((uint64_t *)sync_addr),
>> +		.timeline_value = BIND_SYNC_VAL,
>> +	};
>> +
>> +	igt_assert(!!sync_addr);
>> +	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, size, &sync,
>> 1, flags);
>> +	if (*sync_addr != BIND_SYNC_VAL)
>> +		xe_wait_ufence(fd, (uint64_t *)sync_addr,
>> BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
>> +	/* Only free if the wait succeeds */
>> +	free((void *)sync_addr);
>> +}
>> +
>> +void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
>> +			  uint64_t addr, uint64_t size)
>> +{
>> +	volatile uint64_t *sync_addr = malloc(sizeof(*sync_addr));
>> +	struct drm_xe_sync sync = {
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.addr = to_user_pointer((uint64_t *)sync_addr),
>> +		.timeline_value = BIND_SYNC_VAL,
>> +	};
>> +
>> +	igt_assert(!!sync_addr);
>> +	*sync_addr = 0;
>> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, size, &sync, 1);
>> +	if (*sync_addr != BIND_SYNC_VAL)
>> +		xe_wait_ufence(fd, (uint64_t *)sync_addr,
>> BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
>> +	free((void *)sync_addr);
>>   }
>> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
>> index ae8a23a54..1ae38029d 100644
>> --- a/lib/xe/xe_ioctl.h
>> +++ b/lib/xe/xe_ioctl.h
>> @@ -100,13 +100,18 @@ int __xe_wait_ufence(int fd, uint64_t *addr,
>> uint64_t value,
>>   int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>>   		       uint32_t exec_queue, int64_t timeout);
>>   int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t
>> range, uint64_t ext,
>> -		    uint32_t type, uint32_t op_val, uint16_t
>> policy);
>> -void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t
>> range, uint64_t ext,
>> -		   uint32_t type, uint32_t op_val, uint16_t policy);
>> +		    uint32_t type, uint32_t op_val, uint16_t policy,
>> uint16_t instance);
>> +int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t
>> range, uint64_t ext,
>> +		  uint32_t type, uint32_t op_val, uint16_t policy,
>> uint16_t instance);
>>   int xe_vm_number_vmas_in_range(int fd, struct
>> drm_xe_vm_query_mem_range_attr *vmas_attr);
>>   int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr
>> *vmas_attr,
>>   		    struct drm_xe_mem_range_attr *mem_attr);
>>   struct drm_xe_mem_range_attr
>>   *xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t
>> start,
>>   				    uint64_t range, uint32_t
>> *num_ranges);
>> +void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
>> +			uint64_t offset, uint64_t addr,
>> +			uint64_t size, uint32_t flags);
>> +void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
>> +			  uint64_t addr, uint64_t size);
>>   #endif /* XE_IOCTL_H */
