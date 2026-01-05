Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DD4C2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 07:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C128510E37A;
	Mon,  5 Jan 2026 07:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PExsk0SM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D29910E37A
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 07:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767599277; x=1799135277;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DIi6XQGmforjhRpdCCwf3SfkYoLk7A9ufkVekQOjGdI=;
 b=PExsk0SMf9TXXukpGbBuT5imyL11HdgabXTa/wtfgwEKnAKFmNrKK3wR
 j6+LJzx5F679eHcWQQwpJhR+4Wo4FQvDHoqYqiJ4PW2mpReGB/FeJhV6+
 C1qI0JP+SudfRqivqvjEuEvBkueCFg8LUwg9VOBrbsb4KrdCV/StPywBw
 C96y246LyFbOD0DWTFGkMoPyxkevD6SPP3yEaTpsl4kijA3qQ/EkFuP7e
 1lBQ8ZJNuyR+ZYUZ5P26STKimjilEtxp3PpVBn5pu1hemjJiT1hgcE202
 /ZvqaC47wc5GWvmBlMBB8uKTPs6WilTaa7JzPgVKxLWgQm3RtRtSbnHXI w==;
X-CSE-ConnectionGUID: O+6h6BAhSE+xD2sPuqwfkg==
X-CSE-MsgGUID: ht4ST3HOQBiPvNzuYGY1pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69005417"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="69005417"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 23:47:56 -0800
X-CSE-ConnectionGUID: x4qfgEvsTsCiOZ/B65IoNQ==
X-CSE-MsgGUID: IQY54b9gTLimqBSvayms2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="207360106"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 23:47:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 23:47:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 23:47:55 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 23:47:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+FXqtZrKi/7TBzOZSkwhtVp0XozmSvpyozTcIABuGRQJdoH6JCADqZJ9wF8c+tqrlJi+ct4zBQQmnQ2IBa/8T6MR8n/JAyUj6OZB3ycvlXmOA2LrCRpeieX8yseq2CjdlHXwFrVkY/bZZ1zsOULT5+iRvqJfJRw/mNFBstztabnmMqZUj33/NfmUQRv6s2PAUUWk17kbbadYJ2RNMVaOms3OK6HFuxVRYQ0xJHsGNMzyYiZf96nOJYPnJLJR3FZgY9axGW1Hi+wlQVzhso9OywOXZy6D9MxkOcqOA+J9Em0Qu40c7DLz6ffNGTgG8tcZMoq/LkQEmpF/8Xzjw2WOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QF3ku5hM9jPuTsaxD4pmQmN72k+9XAVOObYL7wzObak=;
 b=bvVNdI57k05V7wv16OTA68bIaCo7FqAWYtPMKtAO53KTgjQSHk0kBtws7oZ/Hg+DLS/kaPHnU4iQrklivf3yldjUrOGUTWG5yvlJhEYVFYKyQjX+W+X9Q4vR+tqdmMgJZUtq3WFfbVTx1OzJ0ZCXLNN076b7QcWRlTLZ3NGFxboFQsBZ0Ux5cQ9PFxZKyvbYP6JwNQcJsdRc9b8acfJrz4qOFPIutC1ypBTw0TsN+nMeik9Urj7xGrkfJUeOyEag9f/rFkkEylB1sZ3Ji+nhiBX49yYwYrdlj3ct83UeCWFW3K0k5ex/G9XpT+sBicpL82QLLiILWe72VrzPTuMDrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 07:47:48 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 07:47:48 +0000
Message-ID: <cc7af82e-4875-4455-a081-09f7c7ecd0bf@intel.com>
Date: Mon, 5 Jan 2026 13:17:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v8 4/5] tests/kms_color_pipeline: Add Intel plane
 pipeline tests with LUT1D and CTM
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251230064552.22909-1-swati2.sharma@intel.com>
 <20251230064552.22909-5-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251230064552.22909-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0120.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::6) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN6PR11MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 73bee017-1b2f-468d-9dbe-08de4c2eb886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVIvK2F6RHRrbXQ3cVRSb3U2Tit4eFd6WTk5TG9NR2NmbHBNSVZPNnE1RTZh?=
 =?utf-8?B?MDlWS0dyenhyODhNMlFEZXd6QjBCcVkwdldZdWdOalVadTBnMXZ6TTVuaFdF?=
 =?utf-8?B?Mm9paTBlek43ZTJVR2pFK0dVbHExMHZKaGNzci92OTBFYWlheG1uUm5kSTM5?=
 =?utf-8?B?Sk9hTUhkUkU2QlZ4UU41a0hTSXl3S2pGM3NzdURqTlpjdU9oVlNyOWIvWU1K?=
 =?utf-8?B?Q2szSE5QNk5Fd1BFSW45bjF0MzZlMjdiZ0J1ekYzQVg2SXMvQnhOVlIrUTRx?=
 =?utf-8?B?cmw3bVZEWllWd2xMbzFBM29RdXVDckVhN3U3elc4T005bDJRaHM2WWdsL3lh?=
 =?utf-8?B?Y2ZlOEQyek1DcHBXNHBzOHVlSEl0TUlUY2pyemhRcUJiTTRjNnJDdGpTNlV1?=
 =?utf-8?B?clF5K3FUNzMyYWpQN2lEUks3eWNmNFlzdVVzNGJha2o3enNSV0U2ZW14M2lC?=
 =?utf-8?B?czJ1QWJmS3BmZUJSb3hmMW8vNytUMFRFcWxYVW5Cam1yVXBVT255cXFneW94?=
 =?utf-8?B?dGY0aXczdS8rODBRdXpNZDVmVk9pcnRmZnZ5a0NBVUJzTXNlOWRhUmptUFB0?=
 =?utf-8?B?bkhqdFRuaDRRcVFrcHpjRzBFUGRjZWFxNkVLdmRodDVRZW9LbVNUNUNxdFFT?=
 =?utf-8?B?c2p6eThhR0VyVjFEaDVaaEtXVXFUVml3dE9hMXNBN2dNTWpXWWNjVkFVczFU?=
 =?utf-8?B?OUZ0K25CUHE3Ni9MZTRhMEpqTjZsNWVoeEhYL0pUUlFrWnVJTTA1Zm1xTDJG?=
 =?utf-8?B?YjNhdEtDS3BTVEw0ZlpvUHR6TkhlaThWVDRicGdkWm90NlVCenFnOXljbUZX?=
 =?utf-8?B?OWQwek1EUVRyVmdaT2M1cnVaeUh6aU5FbEg1N2FEaWszREJPTVowR3F4cTNN?=
 =?utf-8?B?allPVkRNaU51SEk4U1VhRm0wc2UyNVJtUDgxMG5hOEZUdDBNV2k2Q2ZnOWVU?=
 =?utf-8?B?RkJlbW53VGp0bU5GRTdMMVFUSmU4WWROYnAxRzczWjN1dncxak51dHdYTEhk?=
 =?utf-8?B?NnpaNTdjL3JaVUozMVVqZk5YY1E0R3l2SlRaNDBSSEl4OEZYWkM3NXEwMVlv?=
 =?utf-8?B?cVVkT0Q1bkRjQ1ZvVXhEa2pDcHRJNi9zL3ZmNkx6azNZUExETi9kZlhWc0pD?=
 =?utf-8?B?cjlJK25FZVdMSE1tSG9YY3R5M3dMSC9abjNDRWtlZHdqa0orNmdraHdzckhX?=
 =?utf-8?B?UTU5Nzd1bTVrazlMdmtnaGwrci9oS0o4UVpPdG9McDdZR21HczhtZENUS1JB?=
 =?utf-8?B?M041R3NDdS9RVzh1MHRQWEI4WXI1YjhKVzdVby9YSHRiRWZGZjRzYmZaR3dV?=
 =?utf-8?B?MDdvVUtvU0RVT2tubWpQSjlhL0ZmdnE3T2cxajhoRnlqbmNwd1YxQ0NzWDlW?=
 =?utf-8?B?Szd2OXE3NnNkSVhZZnpyaGQ5WG9SemExSHpvSWQrdGphMXdnN0ltUGpFS21l?=
 =?utf-8?B?Vm9Nb1oxUUpqR29nVlA1RWFNcXFqRWJJV29mc3pmejhLaWtZMitNWlhzdUZH?=
 =?utf-8?B?QXJJOXQxTkUvSEw3ZVkyRlNrNldPNzhhbno1WVYrUEZETFVuZzZzQXBUVmVD?=
 =?utf-8?B?Y2M2aVRoaWE0VFZRSWloTjZoZnBKcmU4MXBXckNPOUxncWpoL3A1YmRUT3lP?=
 =?utf-8?B?Y1JxbDBLRjdGaHJMV3lDaDdUYnVGdDhBN2ZDM0RRWHQ4cnJqMndZVHZhYUFS?=
 =?utf-8?B?emc3RElLV1VlSjVDUVd5aXdVOVMvQ0hPOVlYczkwVEVoYW9DUkRLLys3NjVN?=
 =?utf-8?B?NjdaWVFIOGw5SkloUEJ1MEMwTTJZU1g2aTdUam8yRVNSTTdTVTdjZGlPZ2tq?=
 =?utf-8?B?b3VzbHQ2djk0alhMaDJJeW91YmVnN0pPWFM0bmxIbFphbDBrZTdXTW8zR2hY?=
 =?utf-8?B?cUNBdExJaE1YUnZEWFhteWRDMHFwYXRBVmw1QVRhRHhZNWttZHVsZS9lWEdz?=
 =?utf-8?Q?tFn+IcRdpG0IEvgzyPPqrzdKmJaSuWi9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c20wUEdNWENON2w2R1I4MVh0OStPQ0hqd1I5NHhmdjdNbk1Kc2g2Zmo2Ylpt?=
 =?utf-8?B?WElRM2JvOG1NTU5OdjB0b1ZpckptT2hHQndBUXhVUlVKVks5M2FjaGxsR3NB?=
 =?utf-8?B?bHlDck1BMzRBSVNVTDJVQXBwcmJYb0podno2U1FHdXpJSGh0ZjN4L2Yya0Rw?=
 =?utf-8?B?MEFoUUNkQjZKNEpVUmdoMHFWS0pBVGRaUkVGempzNC9wR0s0Vm9seEo2azY5?=
 =?utf-8?B?cFgzamR1c0tHNm52N1c5ZmVwcDVSVnZPejl2dGd1ZWxIWTM3MUtkOWRqNE1K?=
 =?utf-8?B?dnQrbGx2d0wxc2FSZUY2cjBsRFZsU2N0UzlTam1ESDFHemVuLytVU1lkVXB2?=
 =?utf-8?B?L2JjaUI1UTc2R1cwUG91WUVueGMweGo3LzY2RDYwZWlZUnVDV1JVVHd6Z2V3?=
 =?utf-8?B?a3RqSkNpeklrcUx3elFRU2dDa2JlZWhUdFIyb1YwWjBnZjdFanU1d2VWdXZy?=
 =?utf-8?B?am5sdEpoV2tYa3Z0U2xMaGRIdFhCNkp4M3N6OFJVV3Bkc0hiU210aTVQTjBh?=
 =?utf-8?B?ZzQ3bDhSZ0haQWRkbzJUVHpPQW1HM29oWDdnMWlpdHNlMWd4cEc1V2dPTXNY?=
 =?utf-8?B?Z1Z3TjlTc3Z6MHByYXhZbnRZcU9KRFhJYU00YldjN0hHcFVYeWVJZTdiRVZE?=
 =?utf-8?B?Z1Z3Umk1QXlTN2xWaEdpOWQxT2t0L0t6Nmd2MUdYbWNRQkYyU1RyZUtmVW9l?=
 =?utf-8?B?eGUzMlVmZjJ3RzF0TnpzRWF2NDkrUU5rZ1lPTEpVNHlFd2kzU04yWjNhMTc2?=
 =?utf-8?B?YVhZU2J5UFpSaEk0M3M4RGFZZ1ZEOUkwVkRvOHgyTXRNMXVaMldPbkxJWDFq?=
 =?utf-8?B?RXBYV3NxWVNkdzNQRFVVeUJaZHlSMGs5LzJkN1hHbUVTT2dmZ1BsOEVwSTVj?=
 =?utf-8?B?SS9BaHJVdmtzckxYM3o1NDBmd25FNHViZDd1dEczRytlVTloYitYblp6TGI1?=
 =?utf-8?B?SjRxMW9oREp3b0RBK3B1VXJtaDNmZjFpK0d2NXdDYWUrdi8zWmNOWEgzNmVp?=
 =?utf-8?B?b3l4SS9SblR0aHhEeUJud2cveS9IUm00bXZtcGNDU0JSQmZGOXdKbFY0ZlQ5?=
 =?utf-8?B?Z3dWcDZHZWkzZ0tCOWFmSFQxTzhncjJ5VUZWbFFVMkg0NUJKcGNFMkM4VEpt?=
 =?utf-8?B?L2tXWEdGbUFvcXpHVE9VbVZzQVRGcVMrQTgvYTBEblduM2dvNVBxYmZPVnA0?=
 =?utf-8?B?eFdlVVMraGY4STNqakMyNXJWU0xjZlRkTW5JOFZ1SlVheldhN1ZkTjJzYkha?=
 =?utf-8?B?ZFR5RkJqdFBWRlgvSkMxU0ZOcWRBMkc0SWdxMkVFYkJCd0NHSzMwVUZ3d2lD?=
 =?utf-8?B?Z2FjaEEvd3V0NXJjTmt4RTFvVkRSbFlnOEpjMTQ1bHptdTQrZ3pQWUVxWFVw?=
 =?utf-8?B?aXgwc1dTckh3L21EMkQ1UVBTSm5DNEhoM2RJeFFvSUcvdVVNWHBmZURBQmIy?=
 =?utf-8?B?MEZjSjVzTjZTQnE3VHNTcEtWc2hIdmQzZVllUnMxSERyRHlScHdSb05HbC9w?=
 =?utf-8?B?OUJVaDgwWFhLb2JyWk1rNFhYZ2lSZ0RxRm5RZEk4aDdiZ1ZXMDBic2NwWHdB?=
 =?utf-8?B?SnFSM3RwSDFlYUJzTEJZc0diWXNsT3NPOWozSkdGbDZmd043VTFBU1Zlck5X?=
 =?utf-8?B?TUh6MTZPTEdqak9pUG1hcW4yOGRpbWMydFYwczZVUEdYQWcyUksxelNhTGw3?=
 =?utf-8?B?alRxRlhhL1BPMmYrTnVHbEVmRTZlcXhFczlZU0N4QnEvYUN3WnIwTG1xMEN5?=
 =?utf-8?B?K0ZNbFRLdFhCMzExM0pwdnh3d1g5T3owK2I1bEtXSkg1TFJJYUJTQkRRWjR3?=
 =?utf-8?B?b0tVUjdQdXNMMEJwUWRiV25JNVNZRFpERXZKZm5ZNm5jbU1ZY210V1A1QVFx?=
 =?utf-8?B?UllqeGZHZDBnQ3FScFNsYXRNUUJ2UXhFd0hqdWNHNllwTEtIbkpQWEdOdjNQ?=
 =?utf-8?B?aURyUlp1U2graUk0aHZkMlVubWlsNEs2RXZzdWVnMldlc1BjRHV2aDNTcHg0?=
 =?utf-8?B?cjVub2ZWaFVUWDFUc3pUZWVoeG5aNlJQNFNOanJFRktOTDc1WFJMSXZScFBh?=
 =?utf-8?B?dWJqV2pzZTZEam9oaXVKTGo1WklhTm9WTEpESVdhSGZ1SlA4RjhnckNiWVl4?=
 =?utf-8?B?K0pUUGtMSytVelBaL0F6ay9FL2RINEZEZTVQdm9JYmg3a2VjRmtqYWhHTmdJ?=
 =?utf-8?B?aHpEa3J6MzdGSGpuSEFUZk9OeDJBdEZwMkRBbVJBSHZnak1xYXkyR3ErK2Ux?=
 =?utf-8?B?eUxjMXhOd0s5Vm80SWdzQ0RUSEVLQ0dnaUlVcWxjWG4wUDVBTzFMK294WU1M?=
 =?utf-8?B?LzNCVGJvOEhhYnFPbWlTaW43NFRHWWpvVUJyWE5JOHROY1hTcUUxQlVqajYw?=
 =?utf-8?Q?DoAGhaomWFsz5pc0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bee017-1b2f-468d-9dbe-08de4c2eb886
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 07:47:48.4691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +R4i2zpsXXd9KzD8+B5mq7WwYXVNydecIsv1lI5nirOvEfJu6yZlxCJy+/ARsZMCbkloTBarwJh+A6PTsQTrYHDLaDzkdXyFDoACTjwdJAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8148
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



On 12/30/2025 12:15 PM, Swati Sharma wrote:
> For now, Intel plane color pipeline contains 3 colorops:
> Pre-csc gamma (1D LUT) --> CTM 3x4 --> Post-csc gamma (1D LUT)
> 
> These tests follow a common flow:
> -Configure the primary plane with a deterministic test pattern.
> -Enable one or more colorops on the plane color pipeline in a defined
> order.
> -Program the corresponding color properties with known transformation
> values.
> -Validate the output by comparing the resulting frame against the
> expected transformed output using CRC-based verification.
> 
> Separate subtests exercise different valid combinations of the
> available colorops to ensure correct programming, ordering, and
> interaction of plane color pipeline elements:
>    igt@kms_color@plane-lut1d
>    igt@kms_color@plane-lut1d-pre-ctm3x4
>    igt@kms_color@plane-lut1d-post-ctm3x4
>    igt@kms_color@plane-lut1d-ctm3x4
>    igt@kms_color@plane-ctm3x4-lut1d
>    igt@kms_color@plane-lut1d-lut1d
>    igt@kms_color@plane-lut1d-ctm3x4-lut1d
> 
> v2: -add new tests pre/post ctm (Chaitanya)
>      -remove redundant code (Chaitanya)
>      -create plane tests subtest_group (Chaitanya)
>      -add/use transfer linear/max func (Chaitanya)
>      -improve commit message (Chaitanya)
> v3: -create new IGT test (Chaitanya)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_color.c            |  19 +++
>   lib/igt_color.h            |   6 +
>   tests/kms_color_helper.h   |   1 +
>   tests/kms_color_pipeline.c | 310 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   2 +
>   5 files changed, 338 insertions(+)
>   create mode 100644 tests/kms_color_pipeline.c
> 
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index a34872763..4d94421ba 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -19,6 +19,9 @@
>   const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
>   const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
>   
> +const struct igt_color_tf linear_tf = {1.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f};
> +const struct igt_color_tf max_tf = {1.0f, 0.0f, 1.0f, 0.0f, 1.0e-6f, 0.0f, 0.0f};
> +
>   const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
>   
>   igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
> @@ -27,6 +30,12 @@ igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
>   igt_1dlut_t igt_1dlut_srgb_eotf = { {
>   } };
>   
> +igt_1dlut_t igt_1dlut_linear = { {
> +} };
> +
> +igt_1dlut_t igt_1dlut_max = { {
> +} };
> +
>   static float clamp(float val, float min, float max)
>   {
>   	return ((val < min) ? min : ((val > max) ? max : val));
> @@ -130,6 +139,16 @@ void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
>   	igt_color_inv_tf(pixel, &srgb_eotf);
>   }
>   
> +void igt_color_linear(igt_pixel_t *pixel)
> +{
> +	igt_color_tf(pixel, &linear_tf);
> +}
> +
> +void igt_color_max(igt_pixel_t *pixel)
> +{
> +	igt_color_tf(pixel, &max_tf);
> +}
> +
>   void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel)
>   {
>   	igt_color_tf(pixel, &bt2020_inv_oetf);
> diff --git a/lib/igt_color.h b/lib/igt_color.h
> index 45cf8f3c7..919330c8b 100644
> --- a/lib/igt_color.h
> +++ b/lib/igt_color.h
> @@ -45,6 +45,9 @@ typedef struct igt_1dlut {
>   extern igt_1dlut_t igt_1dlut_srgb_inv_eotf;
>   extern igt_1dlut_t igt_1dlut_srgb_eotf;
>   
> +extern igt_1dlut_t igt_1dlut_linear;
> +extern igt_1dlut_t igt_1dlut_max;
> +
>   typedef struct igt_matrix_3x4 {
>   	/*
>   	 * out   matrix          in
> @@ -93,6 +96,9 @@ void igt_colorop_set_3dlut(igt_display_t *display,
>   void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
>   void igt_color_srgb_eotf(igt_pixel_t *pixel);
>   
> +void igt_color_max(igt_pixel_t *pixel);
> +void igt_color_linear(igt_pixel_t *pixel);
> +
>   void igt_color_pq_inv_eotf(igt_pixel_t *pixel);
>   void igt_color_pq_eotf(igt_pixel_t *pixel);
>   
> diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
> index fb9c3b3aa..0be312342 100644
> --- a/tests/kms_color_helper.h
> +++ b/tests/kms_color_helper.h
> @@ -38,6 +38,7 @@
>   #include "igt.h"
>   #include "igt_edid.h"
>   
> +#include "kms_colorop_helper.h"

IIUC, there are no dependency of kms_colorop_helper.h in kms_color_helper.h
We should only include it kms_color_pipeline.c i.e.

>   
>   /* Internal */
>   typedef struct {
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> new file mode 100644
> index 000000000..a085ff823
> --- /dev/null
> +++ b/tests/kms_color_pipeline.c
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms color pipeline
> + * Category: Display
> + * Description: Test to validate DRM colorops at plane level
> + * Driver requirement: i915, xe
> + * Mega feature: Color Management
> + */
> +
> +#include "kms_color_helper.h"
> +

+#include "kms_colorop_helper.h

> +#define MAX_COLOROPS	5
> +
> +/**
> + * SUBTEST: plane-%s
> + * Description: Test plane color pipeline with colorops: %arg[1].
> + *
> + * arg[1]:
> + *
> + * @lut1d:			1D LUT
> + * @lut1d-pre-ctm3x4:		1D LUT PRE CTM 3x4
> + * @lut1d-post-ctm3x4:		1D LUT POST CTM 3x4
> + * @ctm3x4:			3X4 CTM
> + * @lut1d-ctm3x4:		1D LUT --> 3X4 CTM
> + * @ctm3x4-lut1d:		3X4 CTM --> 1D LUT
> + * @lut1d-lut1d:		1D LUT --> 1D LUT
> + * @lut1d-ctm3x4-lut1d:		1D LUT --> 3X4 CTM --> 1D LUT
> + */
> +
> +IGT_TEST_DESCRIPTION("Test DRM colorops at plane level");
> +
> +static void test_cleanup(data_t *data)
> +{
> +	if (data->pipe_crc) {
> +		igt_pipe_crc_free(data->pipe_crc);
> +		data->pipe_crc = NULL;
> +	}
> +
> +	igt_output_set_crtc(data->output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static void test_setup(data_t *data, enum pipe p)
> +{
> +	igt_crtc_t *pipe;
> +
> +	igt_require_pipe_crc(data->drm_fd);
> +
> +	pipe = igt_crtc_for_pipe(&data->display, p);
> +	igt_require(pipe);
> +	igt_require(pipe->n_planes > 0);
> +
> +	igt_output_set_crtc(data->output, pipe);
> +
> +	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_require(data->mode);
> +
> +	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
> +					  data->primary->pipe->pipe,
> +					  IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static bool ctm_colorop_only(kms_colorop_t *colorops[])
> +{
> +	int i;
> +
> +	if (!colorops[0])
> +		return false;
> +
> +	for (i = 0; colorops[i]; i++) {
> +		if (colorops[i]->type != KMS_COLOROP_CTM_3X4)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static bool test_plane_colorops(data_t *data,
> +				const color_t *fb_colors,
> +				const color_t *exp_colors,
> +				kms_colorop_t *colorops[])
> +{
> +	igt_plane_t *plane = data->primary;
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode = data->mode;
> +	igt_colorop_t *color_pipeline;
> +	igt_crc_t crc_ref, crc_pipe;
> +	struct igt_fb fb;
> +	bool ret;
> +
> +	color_pipeline = get_color_pipeline(display, plane, colorops);
> +	igt_skip_on(!color_pipeline);
> +
> +	/* Create a framebuffer at the size of the output. */
> +	igt_assert(igt_create_fb(data->drm_fd,
> +				 mode->hdisplay,
> +				 mode->vdisplay,
> +				 DRM_FORMAT_XRGB8888,
> +				 DRM_FORMAT_MOD_LINEAR,
> +				 &fb));
> +	igt_plane_set_fb(plane, &fb);
> +
> +	/* Disable Pipe color props. */
> +	disable_ctm(plane->pipe);
> +	disable_degamma(plane->pipe);
> +	disable_gamma(plane->pipe);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	/* Reference (software-equivalent) CRC */
> +	set_color_pipeline_bypass(plane);
> +	paint_rectangles(data, mode, exp_colors, &fb);
> +
> +	igt_plane_set_fb(plane, &fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_wait_for_vblank(plane->pipe);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
> +
> +	/* Hardware pipeline CRC */
> +	set_color_pipeline(display, plane, colorops, color_pipeline);
> +	/*
> +	 * Use flat colors only when the pipeline
> +	 * contains CTM colorops exclusively.
> +	 */
> +	if (ctm_colorop_only(colorops))
> +		paint_rectangles(data, mode, fb_colors, &fb);
> +	else
> +		paint_gradient_rectangles(data, mode, fb_colors, &fb);
> +
> +	igt_plane_set_fb(plane, &fb);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	igt_wait_for_vblank(plane->pipe);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
> +
> +	ret = igt_check_crc_equal(&crc_ref, &crc_pipe);
> +
> +	/* Cleanup per-test state */
> +	reset_colorops(colorops);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +
> +	return ret;
> +}
> +
> +static void
> +run_tests_for_plane(data_t *data)
> +{
> +	enum pipe pipe;
> +	igt_output_t *output = NULL;
> +	static const color_t colors_rgb[] = {
> +	        { 1.0, 0.0, 0.0 },
> +	        { 0.0, 1.0, 0.0 },
> +	        { 0.0, 0.0, 1.0 },
> +	};
> +	static const color_t colors_red_to_blue[] = {
> +		{ 0.0, 0.0, 1.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 },
> +	};
> +	const igt_matrix_3x4_t ctm_red_to_blue = { {
> +		0.0, 0.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0, 0.0,
> +		1.0, 0.0, 1.0, 0.0,
> +	} };
> +	const igt_matrix_3x4_t ctm_linear = { {
> +		1.0, 0.0, 0.0, 0.0,
> +		0.0, 1.0, 0.0, 0.0,
> +		0.0, 0.0, 1.0, 0.0,
> +	} };
> +	kms_colorop_t lut1d_linear = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.name = "Pre/Post CSC GAMMA (linear LUT)",
> +		.lut1d = &igt_1dlut_linear,
> +		.transform = &igt_color_linear,
> +	};
> +	kms_colorop_t lut1d_max = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.lut1d = &igt_1dlut_max,
> +		.name = "Pre/Post CSC GAMMA (max LUT)",
> +		.transform = &igt_color_max,
> +	};
> +	kms_colorop_t ctm_3x4 = {
> +		.type = KMS_COLOROP_CTM_3X4,
> +		.name = "CTM 3X4 (red to blue)",
> +		.matrix_3x4 = &ctm_red_to_blue,
> +	};
> +	kms_colorop_t ctm_3x4_linear = {
> +		.type = KMS_COLOROP_CTM_3X4,
> +		.name = "CTM 3X4 (linear)",
> +		.matrix_3x4 = &ctm_linear,
> +	};
> +
> +	struct {
> +		const char *name;
> +		const color_t *fb_colors;
> +		const color_t *exp_colors;
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +	} plane_colorops_tests[] = {
> +		{ .name = "lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-pre-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_max, &ctm_3x4_linear, NULL },
> +		},
> +		{ .name = "lut1d-post-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &ctm_3x4_linear, &lut1d_max, NULL },
> +		},
> +		{ .name = "ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &ctm_3x4, NULL },
> +		},
> +		{ .name = "lut1d-ctm3x4",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &lut1d_max, &ctm_3x4, NULL },
> +		},
> +		{ .name = "ctm3x4-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &ctm_3x4, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_rgb,
> +		  .colorops = { &lut1d_linear, &lut1d_max, NULL },
> +		},
> +		{ .name = "lut1d-ctm3x4-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .exp_colors = colors_red_to_blue,
> +		  .colorops = { &lut1d_linear, &ctm_3x4, &lut1d_max, NULL },
> +		},
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
> +		igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
> +		igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name) {
> +			for_each_pipe_with_single_output(&data->display, pipe, output) {
> +				data->output = output;
> +
> +				if (!pipe_output_combo_valid(data, pipe))
> +					continue;
> +
> +				test_setup(data, pipe);
> +
> +				if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE)) {
> +					test_cleanup(data);
> +					continue;
> +				}
> +
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +					       igt_output_name(data->output)) {
> +					data->color_depth = 8;
> +					data->drm_format = DRM_FORMAT_XRGB8888;
> +
> +					igt_assert(test_plane_colorops(data,
> +								       plane_colorops_tests[i].fb_colors,
> +								       plane_colorops_tests[i].exp_colors,
> +								       plane_colorops_tests[i].colorops));
> +				}
> +
> +				test_cleanup(data);
> +			}
> +		}
> +	}
> +}
> +
> +int igt_main()
> +{
> +	int has_plane_color_pipeline = 0;
> +	data_t data = {};
> +
> +	igt_fixture() {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
> +			data.display.is_atomic = 1;

We don't really have to preserve this value as igt_display_require() 
will anyway memset it to 0.

We can add a comment saying that atomic capability is a pre-requisite 
for plane color pipeline capability and that's why we are doing this here.

With these,

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> +
> +		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +			has_plane_color_pipeline = 1;
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
> +		igt_require(data.display.is_atomic);
> +	}
> +
> +	igt_subtest_group()
> +		run_tests_for_plane(&data);
> +
> +	igt_fixture() {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index ae48dfe04..912d8cd38 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -25,6 +25,7 @@ test_progs = [
>   	'kms_atomic_transition',
>   	'kms_bw',
>   	'kms_color',
> +	'kms_color_pipeline',
>   	'kms_concurrent',
>   	'kms_colorop',
>   	'kms_content_protection',
> @@ -379,6 +380,7 @@ extra_sources = {
>   	'dumb_buffer': ['dumb_buffer.c' ],
>   	'testdisplay': [ 'testdisplay_hotplug.c' ],
>   	'kms_color':  [ 'kms_color_helper.c' ],
> +	'kms_color_pipeline':  [ 'kms_color_helper.c', 'kms_colorop_helper.c' ],
>   	'kms_colorop':  [ 'kms_colorop_helper.c' ],
>   	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],

