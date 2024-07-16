Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFAAC3DA59
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jul 2024 04:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB1E10E2EC;
	Tue, 16 Jul 2024 04:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1bfpWY0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AE010E2EC
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jul 2024 04:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721104352; x=1752640352;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=58tJpoXz6MPfEgMeGt9zwVaXtlZBSmdMFsTZIcMlQdI=;
 b=B1bfpWY0e3mG4PWmnx87+/C98Sx5wfaMUyu4pBP6ljCtPAs7wNpLSx+7
 6AFs3fqfJh3A+l2gK6BKWz+Vqkbz0tjbNTRlPK03Ip5A8xJuedqvYsqcW
 1rPq0NEM10ZQsX1I6UgpxFZ8dFjbOx8bIzjjXRzld90WV+jHWBw4SvvO5
 yjuvDyisq5WP3KOXZKiOGpYN+99QByblmlZq5WkNe1W6k21/GMftcBPgZ
 BSH4wG8NCDEiU80jRI74OqsJ2bGWBVqYqhZMB3r80K8cbRnNwrEhDKI6s
 b/EuERmGMLj9Jrb35vIgzcLfibwangFp+fppB3j/OzPU5kG4/PzXMydly A==;
X-CSE-ConnectionGUID: NuKeHV2vRGishzfmSZzb9w==
X-CSE-MsgGUID: qcEKPskXQnuwf4knOdjlQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18363714"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18363714"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 21:32:31 -0700
X-CSE-ConnectionGUID: /eDdB/eYTf6ns9q9TFSSMw==
X-CSE-MsgGUID: TC6Ehg/0RSi34Ov0yERIKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="50258562"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 21:32:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 21:32:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 21:32:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 21:32:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dP2ykB0etNsq3aeGYPqyvyr7/b4UG4quL9uH8Sl+UnifFxbVg7nneDefQQgwcoWlj8KtJYNstyfT4PmSXOai+CAp0WQc9ZoClwkbh87tjHTiHjQwezbwGux2X1362ebvGpeU6yd9T08JHjlYUnI4chKOrm0fIqyuLHv5jHqmbLkG6Bl9HB7agR0EXuezKKBcaAS0eoFW/ZkDJwIQ6WM9+4vRC1czzVgmELz+R0JP/92cbXnFIJZC3Ljb6Kiih5m0cTXEsDOYZ/Wz4JdPutydBaTbvRb5az2Y5gcPkhNX65kChnmYfxRIxECYGjV3fLC7kIOji/4/BJV618WXBeQHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+qB8drLHEI7HQ9T8DPl4isI436CkObFFpadEtd9TSU=;
 b=jdgeUIIWU135Ji6+BNvwDdB2i223kjy0HHYS5uvBe8H+ZOcKEo/wIiNOzVu0Y3RokoNpyHKKcv+PphnklmWIkTFpiS7JK8bExWXMHtv3pmfY7Jzwa3j0eQv9i4kcEyBxDvit6mPV6i/oC7wbeV+iDdPIPN+C/mL/Nc2M71IypivIWMvj8J5g7oJGtp4ZZQMW3RlsXWXED3/4nYG/OgxbzTKXgG6VF4gdFHTcRHNOeSOUy1/LP4avE2LhSbartsKYKaT/hUB/atL2gC2bakBEJDR6Nvol3MNdNXfXKRRb8beHkOBmag9EmoT8RuYXibm9SDBpybteWtSCcWCakeRfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6979.namprd11.prod.outlook.com (2603:10b6:510:207::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Tue, 16 Jul
 2024 04:32:23 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 04:32:23 +0000
Message-ID: <b2a7614d-2df2-4df3-8034-7a09ee2bee2b@intel.com>
Date: Tue, 16 Jul 2024 10:02:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/5] tests/kms_plane_scaling: Improvise the planes
 scaling BW issues
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
 <20240715154628.583682-4-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240715154628.583682-4-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2492d3-3cdc-4f83-a2fe-08dca5504992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnBtcFhCaUwyRmNHMTJoSUNPWnBoK3F3bFEyZGM5YWNrTm53KzFDMGR5cUNT?=
 =?utf-8?B?TzFWNEVWRTBkbHNMR0dKVnZ2dk16SjJkc25jdUgzU1VoUjk0eXk3eVNIbFZp?=
 =?utf-8?B?ZHNra1BBcjllbWE0UnU3YnpENXI0em9Tb0VQNEdxeDdObUFXd1pTNURBT1Yx?=
 =?utf-8?B?bHR5eWE3TDBFbTR4TkVlZXN6eHpkZmo5Z3JWdDRPTW40NUo4TnpRZVd3dmZh?=
 =?utf-8?B?a21DbjdFOWJlV3hMaFcya1M4U3U2aEd5cDdsUGtVSDRqYklRcjlocXVsT1c5?=
 =?utf-8?B?anlnZXczYXo0eUZqMW9RdWdmWHByWHRpbTR0K1ZWTjFLVjJJZ1RsZHJZWjJt?=
 =?utf-8?B?L2w5cVBBQ3pMQ25ORE9qZkhHVTlKSmo1MXNLWlFXcW12UktoUG9XcGErUlNH?=
 =?utf-8?B?dmRJR2kyT1d3NjBwd2doajhiMmdMaWdmM1VoUFJzMkFieDR4WEQ4S0dIcFI1?=
 =?utf-8?B?ZkRGNzJKMHAxckl3RjJZTlIvRVBoWVMyR0xNM2xpNGZVUlF3enNFb1ZoMnRY?=
 =?utf-8?B?b0J5cHlXV1Qxb0FMYU5FY3dsNkx3Wnc2NjBKWC9jN0JLRDljS3paYXI5N2Ir?=
 =?utf-8?B?eUtaeENDUGl6TGZoYjdRTllNVk1xSjFrYmJDN2M0MU9FSUpiQmNjcVRKMHhz?=
 =?utf-8?B?a1VLZHpuRTFCR282dnlWV01UM2lZeWtldUZqUGZtWWJHR3kzQ01oK2ZMbU1B?=
 =?utf-8?B?VGpyU3ZERWZ4dEJuTGVleDgxL213ZmJ0TVB6RjJ5Q3pFRWtkL1U3V2R6eXc4?=
 =?utf-8?B?NkRhMDRrUEFyTXVLWWE5ci9Rd3JJVFhZV2J3SmZQckxYb1YweHZEMHRjaWJr?=
 =?utf-8?B?RFhyTC9KZWl1S0VpbHMrZUF4bGJMdys0bTUzNElKUG1UOVFoZmhtTWcya09r?=
 =?utf-8?B?Y3NLOVNBYURtb2Y5cFFhM2lvS1ppVXp5VDg3b2M1RzJxb09oOVMyUzNjT3U2?=
 =?utf-8?B?OFNHZ2tlZGVXSWtsRjRNTzhYb2xIT3NLR09FMXJNOVB5OHJjamZnTytSNTVQ?=
 =?utf-8?B?WHVjeHpXQVlnaVBQZW1mcy9UcVQxR1RHWHJqTDVmVWRFTW9SajhycWZhbXpL?=
 =?utf-8?B?N2wzZngvTklCSTA4SE4zaDBLUEVZSWljMnF2bGxuYzNLNDB6SHJFcjhtRjNQ?=
 =?utf-8?B?SGlNRFVUb2VUWVJsL20raWFXVG9qUlRuNEhpZ295Y1cveW1pUUJOSW5ZWHpR?=
 =?utf-8?B?Y2tWa2tUWEZWMUhjQ2dKT3VYcGNWUEh3b0M0QmNUM3hrT0pnaFp4VmYrZ24w?=
 =?utf-8?B?ekk4SVBRWFF1M1dHU3dYT2pWM0hFOXNhWUk2b0E4aXNYajArbTdOV0NBVFpJ?=
 =?utf-8?B?NDAxdGc0RTliZHhGd1JweSt1MTdiVk12cEFiVzY0SUlyUkdaK1dUblhWRDl2?=
 =?utf-8?B?NXN4VlljNEw0c0VwTTFhai9lVW4ybmJLNllaL1B2eVRKeWV5bVFDSFpuKzY0?=
 =?utf-8?B?YzBNVW5MRU11cEVTQmYzODVQYzcxalhSVEJIRGd0RTk2anFBVHBQbTdyS0hQ?=
 =?utf-8?B?Sy9tWVlTZ1Bta0daNHlxcGlTOUw0MGFKVjJhTkVQSGJhTFFRaEhlRGRoUklE?=
 =?utf-8?B?VGJTblBxbHhiOWNWcFNRMEprVXdkWm1NVWxuazkzaFpXRUFhcEtHUEFrQ21P?=
 =?utf-8?B?amhCRHpTSWNRa1lEOTNSd21LVmNHbVZxWkI0Z3Nlc0w2aXJ4K0xMWlB0K25z?=
 =?utf-8?B?T0E4U1BCajBGaVdHVjNMUlBQVVFhQXZYTERPd3A2SVNxM0xtbnVIbnBlelFr?=
 =?utf-8?B?Y3g3dlBYRU5pc0dXbmtpZWJuc0FINHRhRURQb0w5TGYzZzNPOEoxb2pHbkVS?=
 =?utf-8?B?eXNFZU45YnhvcURiQ1o1Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUJxQldCSjUxdjBzYmlwZ05zTEMxWHhZa2kwb0REcXdIdVMxYW14bkNON1VJ?=
 =?utf-8?B?QmlhM3lFeU1TVjUzVm13UWtnSHZHdGlEcnlWdGtNeVdieU51bktnY3pZSHZK?=
 =?utf-8?B?SUNuVE9SVWRxNHdsQzhyWFErMWxsbE5mU2xqVVFnc21kVTZzbFJrODVEMHFn?=
 =?utf-8?B?RnlwamhNMkVuK0RWbElCOFR4UmRtS3Y4NGFwTDRKUXlEUnAzd2VmOEVTL2Z6?=
 =?utf-8?B?c0FTZjBZbStVOE5tZ0ZhUUo1NWV0cXlWUmFjQTNEYmR5ODE1WHFHcXpCcFRw?=
 =?utf-8?B?Sm5HblNiazFIZUVTemxkdEpyYk44Q0ZBeTJqVHlYekxVT3FaTG9JWjc4YnJp?=
 =?utf-8?B?NERHMFdpZmZZVFpUVkVRR0grbUhpWThoVndlaE85Z2ZGc1UzUWhIdTRnbldw?=
 =?utf-8?B?YzdNQ3Z4bXlIN2l2WkRuMUtKd3FqS0J6QmJCcEhvNlduVU40RkZoeHVBSFpR?=
 =?utf-8?B?NjFqOTBFVGpnSVBScWFVc0xoOXNJKzIxeGg0YUlyL2JZVzJUblF0U2xjRlBI?=
 =?utf-8?B?aUxZYlRYaS9USURqOExQNDd3ZDMwRThqK3JMQklpcFh4ekFUZzJ2b2tEV2lT?=
 =?utf-8?B?eGFSb3BBUWhncnRUZUU3Q0ptdVFBQ0svVGRtNkRyMkF1aXZyTE1jVFRuYjJo?=
 =?utf-8?B?UW5hWXlWVlkwOWgzazh1cEQrbzFkSE9sQWVZRDlNTldKbWVtZDZpaWJLMDNH?=
 =?utf-8?B?ZkhHTTFpT0dsMk1ycXpEK1VKV0J2K0oySVhDc2ZPOFZYdVlHc1ZWUFc1UVg3?=
 =?utf-8?B?SURhN0VldklmNktObkJFUlNIeEMzTXRQR3I4dkxucy9GcXNlMGd6M0FWSFFL?=
 =?utf-8?B?RjQ4QlJ0YmR1MVhkWlJDZk11ZlVEbURUTVh4bFFrN3FpYTRjY0tjaU5DRWxW?=
 =?utf-8?B?b3l1dGNmS0t3WTdBU1RGc24xSmYyVlQwWXE0Um1yeHhxUUNLWmZKTXMyTjZm?=
 =?utf-8?B?Y0ZndTA5VDRReG1vMStXQWFNdVBGV2I1eHhRQ0k2dnVQUzRKbmtJK1ErSHNE?=
 =?utf-8?B?YUgwNUxCUVB5YmYwelk1WWhQcW9UQi9aVGhyOURMOXVxcU4yWWxqcTRPSmpS?=
 =?utf-8?B?Um5PWDFRYUpFWXkxTEZMbUZtZkh2Sk1yR0ppU2t2MTBHNlQ1SGlYMVRFalM0?=
 =?utf-8?B?TEwzdVJINEhaa3B6YUFrb0pqTkRQNnJkcWpTalFycFBVd3Z4amZMdFYxZUd4?=
 =?utf-8?B?QXIwRTFsa1BNMjBjbmh3TkZrMS91Y1EzOFBVcFh6bU96OFJsUytRUGFqeVR6?=
 =?utf-8?B?Nmc3cnV1WXNXaFhZSkV6U1k4VDZKQXovZngwMXMyUENpZzZrTnUybytJZ0Fv?=
 =?utf-8?B?S2psVWFsT1JlN2VLYm1Ca2t4Z0dkN3V5OFpnSDdQbnZ6MFZUV2tJclUvOW5B?=
 =?utf-8?B?SFpJV1NPYzgwYXZuT0N0enpqdytKVWcyL3gybjl2QUI1K3ZiLzNsZEl3YjFw?=
 =?utf-8?B?Q3hwdVVLTk1hNFlZTUtMQkdpVmF1am1XSEVCdGpHWEx3R3ZsUkJQeUdtY2RM?=
 =?utf-8?B?VnFEQW1GbldEaGJBNjhwelRkU0Y5cGQwRHhLY2ZiN3VxWjR3SjlRY3ZlRzdL?=
 =?utf-8?B?SlpRaVMyWDJvZEtqUUxZcmExM3lLbXgzdk5NcklPMytOSjE2dWMyckJUdUp3?=
 =?utf-8?B?TnhLMi91ZVZqRkpPZ0xFZzFXaUx6RkF3MjlHeUczZ2tzS0hVY2laL1ZmUEJu?=
 =?utf-8?B?TW44Q3lvOU9JbXVGSmtTNnFnY2ZTSTVUT09PUTNxUHVRenV6cHdTQis5Ui9x?=
 =?utf-8?B?QzNDeHFuU3JZZTZyYlRGakpITGxERUZ0UEUyQnR4WU9OQnN3eG9YMHdQVm40?=
 =?utf-8?B?Lzh1NkJObUYwUjZyaXQ0bGFudVo0dWdPNFhBSzNWbkdwZGdEMmtSK0JydmRQ?=
 =?utf-8?B?M1BwTkI2WVlwQlFJUWRKUExJbWY0YnN6Y3NKNU5FUkNrbFc0eGhQa3J2K25m?=
 =?utf-8?B?aW5yc0lWekZrMmpaWGlzNmdLcXhCMjdJbjJVaXVORGtNNUxybTNJMENTaXhW?=
 =?utf-8?B?UkJhY2d2NkR4dENENzZqd3VPODlNSlA5eVNLUkZWR2pYS29PeVpzZEJWUUgr?=
 =?utf-8?B?TFgzRmF6RFVTMDdKTXdaV1RsaXFCcS9oMFZSUlVvQjhLeWp4RjgrMHVkYkh5?=
 =?utf-8?B?ZStmeGQ2SEk3NFM3Nmh4RUtqY2k3b3dwZnQ0QW52TjZlMlB1ZUlLbDYwNWFC?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2492d3-3cdc-4f83-a2fe-08dca5504992
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 04:32:23.3310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvSHaY+S2Icg+oC9Y/+a/64LG0yFx0/8SC2iTlAeIqU+Yt+3QWwIDcK7x0Wb4hgmCm9UKxR4NwJfgkRyjaNBz3T+cRsK7wSQlyOLiOI4hvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6979
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


On 7/15/2024 9:16 PM, Naladala Ramanaidu wrote:
> Anticipating bandwidth issues, we expect many tests to fail. To
> address these failures, we will switch to the next lowest display
> modes. Some higher display modes will be identified as insufficient
> for downscaling operations on multi-plane scaling. As a solution,
> we will implement a fix: when bandwidth is inadequate for current
> modes, the system will automatically attempt the next lower
> display mode.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 72 +++++++++++++++++++++------------------
>   1 file changed, 39 insertions(+), 33 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 0048e6e51..1702ec8c8 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -865,43 +865,49 @@ __test_planes_scaling_combo(data_t *d, double sf_plane1,
>   	int ret;
>   	int w1, h1, w2, h2;
>   
> -	mode = igt_output_get_mode(output);
> -	w1 = get_width(mode, sf_plane1);
> -	h1 = get_height(mode, sf_plane1);
> -	w2 = get_width(mode, sf_plane2);
> -	h2 = get_height(mode, sf_plane2);
> -
> -	igt_plane_set_fb(p1, fb1);
> -	igt_plane_set_fb(p2, fb2);
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		w1 = get_width(mode, sf_plane1);
> +		h1 = get_height(mode, sf_plane1);
> +		w2 = get_width(mode, sf_plane2);
> +		h2 = get_height(mode, sf_plane2);
> +
> +		igt_plane_set_fb(p1, fb1);
> +		igt_plane_set_fb(p2, fb2);
> +
> +		switch (test_type) {
> +		case TEST_PLANES_UPSCALE:
> +			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
> +			break;
> +		case TEST_PLANES_DOWNSCALE:
> +			igt_plane_set_size(p1, w1, h1);
> +			igt_plane_set_size(p2, w2, h2);
> +			break;
> +		case TEST_PLANES_UPSCALE_DOWNSCALE:
> +			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(p2, w2, h2);
> +			break;
> +		case TEST_PLANES_DOWNSCALE_UPSCALE:
> +			igt_plane_set_size(p1, w1, h1);
> +			igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
>   
> -	switch (test_type) {
> -	case TEST_PLANES_UPSCALE:
> -		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
> -		break;
> -	case TEST_PLANES_DOWNSCALE:
> -		igt_plane_set_size(p1, w1, h1);
> -		igt_plane_set_size(p2, w2, h2);
> -		break;
> -	case TEST_PLANES_UPSCALE_DOWNSCALE:
> -		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(p2, w2, h2);
> -		break;
> -	case TEST_PLANES_DOWNSCALE_UPSCALE:
> -		igt_plane_set_size(p1, w1, h1);
> -		igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
> -		break;
> -	default:
> -		igt_assert(0);
> +		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL);

This can be in the same line or else align with the parenthesis.


> +		if (ret == 0)
> +			break;
>   	}
> -
> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -
>   	igt_plane_set_fb(p1, NULL);
>   	igt_plane_set_fb(p2, NULL);
> -
> -	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
> -		      "Scaling op not supported by driver\n");

I think we can retain the older message, new one is not giving any 
further information.

Otherwise looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> +	igt_plane_set_position(p1, 0, 0);
> +	igt_plane_set_position(p2, 0, 0);
> +	cleanup_fbs(d);
> +	igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +			"Unsupported scaling factor\n");
>   	igt_assert_eq(ret, 0);
>   }
>   
