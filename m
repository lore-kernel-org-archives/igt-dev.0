Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B747C71130
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 05:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABABF10E582;
	Tue,  8 Jul 2025 05:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nehi8Fno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F48710E582
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 05:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751950998; x=1783486998;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xezN2z0JqC1uSFOpMd5GYlmw/MFpitg5P226mQzvi+Y=;
 b=Nehi8Fno6TNc0n81a7dOeckYnT018pZETiNSgBcc79Gtj0CrgOIE01U8
 pXEwrDwcTgoK4FcJHwTLjr6b1GRFUz6gJJoK84zp7dLteFhGaMAUH9iYJ
 ZjSSttzJq4djnbXBS6m219Fg6M/0tW6+GHyPD/kJj/vxCBIbiUS1Fa77X
 F2AU2BEflsIP9OWrlesGRPh7kEuz2aIKoaNTq6e6X8wbZjd6HqjaIbqII
 rE8p2ozpVt4eSAYi+rwdgTWzl5OP6lXS0Im2fUUlzvlvAQhekbavxtZqR
 JUSGh9qBZFQJ0WxdFiBkpq+dQuweMYY1Yfa9KJnDzx1pOIZ0Sh2fy8POh w==;
X-CSE-ConnectionGUID: xJ/L7GJ/SO+PE+65/ypLkg==
X-CSE-MsgGUID: 63Zsu7fxTym3ys/U2mC3yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54152077"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="54152077"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 22:02:31 -0700
X-CSE-ConnectionGUID: 3nb7xWaSTNGEybP/ArH4Vw==
X-CSE-MsgGUID: VoJXfdyhRG6FzP2sPZOtuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="159438770"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 22:02:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 22:02:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 22:02:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 22:02:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jX/qzyTivfSNCXiL1j657eNwmrtYt066SKwMPmJXUvpH0e9X4Da2uH+XIuSdUCynJ47wHBzv0Imb7KTA25jn1zo6Ax2dPI+da3i6zRlCBVkv6AZYwOoTUQX5ywJkK6/neybb5fexQ48vK/D9hxSovWKHpGLB0oNElsraVZMc532G4WI9k1dQUvrbIPQgc0l2kSyso18ppNUy+5kK22GiI3yDpnTzRms+WVmlk9aj++udT2BsKdzY1HGWyEVnik84FxQhTLcAsqynnffd/chsMrJDSAuYMCl5VH17PTBp20LiNNhLHPpklhq7Plc/XVYyFjQAUNNntsABeu+6GXOeaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGRnixlJ5g1CKzt7qaeZVdF2siO+G8a5HY8/9m9EmMQ=;
 b=Q8hCErVlgzTfYNazvrFlm9kwE1zliZghO679FmIzle6pNa2hqNorDv3W0g8Gy42ZjSjjai1F27XrGFTJpXpok3xaAj+VjoYb2qqwWW6D9niq53L2J4RknHgiZXQO0tvfdawkFR7kFeB2yzv/AE6Zf6UJ+uO6I7h3mzWfDMNjYz2btblnq9QcCzuS+qFXVOfn1onkXrCsUKUMr8hm/IdLpyrAaGOvd7hVYjvOeEzA1dNYvyc6kb6/fPQMhhfE2LcrLqd3okCNz3S6hEKNpuMQKsV4nY8hvgIeJ1wFOdEStqojATZCA2djJQefaUgiiG/2HFTUPjM5P4uJ0dNuXdxWUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SN7PR11MB8066.namprd11.prod.outlook.com (2603:10b6:806:2df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 05:02:12 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 05:02:12 +0000
Message-ID: <675ad233-7acf-4111-b137-1eed92cbe917@intel.com>
Date: Tue, 8 Jul 2025 10:32:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_cursor_crc: optimise cursor crc on
 simulation
To: "Sharma, Swati2" <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <karthik.b.s@intel.com>, <arun.r.murthy@intel.com>, <jeevan.b@intel.com>,
 <pranay.samala@intel.com>
References: <20250702091643.967483-1-santhosh.reddy.guddati@intel.com>
 <20250702132102.s55zwxhq3j4fmdmg@kamilkon-DESK.igk.intel.com>
 <717d13c0-2b02-4bf9-adb2-d4a268fbec61@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <717d13c0-2b02-4bf9-adb2-d4a268fbec61@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::7) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SN7PR11MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc6894d-2222-49c5-2139-08ddbddc9917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U01TTFo4OFFIdmxxenlJUHpwcGd4WHJtUUtLdmlIVFZKSElPYlhOVFVlSUhr?=
 =?utf-8?B?cDlVdnkySnFUYU5kZGw4TzRFczhCS2VITFF0S3RNV2JwSlFNdkVEdldySmhM?=
 =?utf-8?B?cUhvWGxWeEd0ZGpQR2lDdVNlQ1F5UUFSNjJmWThuaGhRSE4vV3l4MVZHZmJ4?=
 =?utf-8?B?dFV2OVd0M3J0c09PQkE1WlJhbWozQ2lWR0pGMnlWMGhkTncvZ1ZwbXZUaE1p?=
 =?utf-8?B?UGZ3VWUzaDM4Zjkvc0hkSDRWSHlNTDM0eTVVZkozb3lXcmU5ckRWY2hOVnJN?=
 =?utf-8?B?TENxYitNSzR3bXRYR25LS0Vnb1VYSGJnaFFGOVhRN3h0QmtOdkl4bHo1Yk9G?=
 =?utf-8?B?U0pGVXIzWFZxMkM2Z2g1eTZhQTBGYXJpd3RXdWNjZXJPazBRelJRdHZua0pr?=
 =?utf-8?B?WE9UaEJvNDRtU29LM3RZdVhkeFd6dUR4QjBLWnpiUUx1cFRSVXNLYXNrL2Vq?=
 =?utf-8?B?REo0L0tmbjdSTWlkV2FLVTBGOWJNeG1nSWRrOVlRUXo4VTd0NHBwSStTeTIz?=
 =?utf-8?B?eGtEbmxxRnJod2IzajhJZ25MZExscTF0L2R1WExNeXBEY25YSnZMQUFlNnA3?=
 =?utf-8?B?UWNiVUxDRnlVUHNCcmhTbTZsU3BNc1ZYa1pmeitOUlhQUnFhREZ4U0xXY2hY?=
 =?utf-8?B?U2NFRmhKUno0V0JCczhDS2hmbUZRWDM1RWVnT25EQUZUU2RIaXFkZHBRQ0g3?=
 =?utf-8?B?bWE1ZWlETjdwb04zcXRHZGJxdmZXQnE3QUJKSHBVZVVrU0lzRVN1bXpZbDBQ?=
 =?utf-8?B?eG4raVBTNTRrNTBoYVUyZkJ3czM4b29OWGFMdlk2MjFrN0dyUjRpODdheVJ1?=
 =?utf-8?B?cnJmNVdjdUhmT1dCWCtXNjRiYTBhNTA0cUpMVmtoaVBDN3d0TzZYZEJmN3ZE?=
 =?utf-8?B?RUlsQitNQWNMc0RyMm9LNm5SdVFoUkFsMnVVbGhJaXFDMEhXV0V1WThmSVJn?=
 =?utf-8?B?YVVKelB5RUJnVlVQcndpOW9oQ0xBYkFxbDhKY0tYNEpFWlExSU1VKzBscDB6?=
 =?utf-8?B?NE5UQnBQdE8wVmpVQmdJY0VRdFlLa0pCS2tIbkVyS3Qvb3V5UEhERElDY2dN?=
 =?utf-8?B?R2VWTWFteXk5N2NMYWR6NXlQMFp6eDVHQ1ZjRkFhZndlamQyeWpTblZJS3c1?=
 =?utf-8?B?WmtHSlhPRGROeVlBUVJRRWFjbWEyRDBuY2p5VHNya2k5SlBCQmh6OC9KbmhK?=
 =?utf-8?B?RlJXWnRsQUwvUGZCenFxK1ZqU2FXTWF4YmVYVjhQNkhUZ29PdEw0RC80UkQv?=
 =?utf-8?B?SklJUXUrQlpuNU9JTkFrdHJtaW0vSXljWVFLQjh3dnVRNklyZzU4d0dUMldF?=
 =?utf-8?B?MUtXUFVDVlR6S01GMG5qL2w3VE50TEZLWk95djd3ZVUyV05hMWZOZVB4Wk0z?=
 =?utf-8?B?Y1VGSS85VnlkUERHR2diOWFzZGpCZkNvRzVkQ0NsaEVyR2owVmxiMmtEN0Z0?=
 =?utf-8?B?RW5QTHdVaHhhLzVyQ0I1ZC9yUW51WkFFZThYRTJ6ajkzQm5xdldOUlZNR2JK?=
 =?utf-8?B?UTBQQ05teDd1cU4xQTRsM1lESlYwcFhickJLcFVNNmQ1MmdkVTVMUXVCL1ZF?=
 =?utf-8?B?VU1HWVFmOXJkM2RvbVNpbGhLc0l2QmJnaFcraHl5T0hFZ0tEdDlrQVFCS3Bk?=
 =?utf-8?B?cllZbXZRR3RLbDd3ZkU0S0sxZDlMc3VRT3hJWVNyaStvakd4UzJuWHRNRG9D?=
 =?utf-8?B?Uk52VHFFNFpYN05WREt4YVBsRHNZd2RoLzAxcWJseWc4UjB2QUM4bEwzWjJu?=
 =?utf-8?B?Vk1JQUFiL0l5dkxETDVoSHdKdFZsWTZMajFRQmJOUldQeE1USjFwM1BXU211?=
 =?utf-8?B?ZStIcmJSL0tMQmloYXliN25idjYveTJwODF0Zk1mNnRrbEYyUFhkaEZ0SDQw?=
 =?utf-8?B?NUg0S1p2YnU0SDJJYlpwcDk2ZHFOcDJmWGhyQzVUZkRJY09QUm1MRE43RVZs?=
 =?utf-8?Q?quLprYMttaM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXFuQ3NycHk4YWlJcFN4R0EwdVpHWnNvQUdTZDlnRGlvWnNjWUZUd2t1NEVK?=
 =?utf-8?B?UTYyNG5ZaDcrdWwyTlQya2VLRTgxQzh6NHZSUjhBdVFkRFpUWXZOUDBKcnkw?=
 =?utf-8?B?YmpkTTJnenBNelpKRkZWcnQ2dzY3S0I5eERNVlg3b2drcTZRVGFwTmxuS0c4?=
 =?utf-8?B?NmNUMU1ISnF6S2dBcG04SWVMUmQ2NWwxaGxCTEJBUDdXdExnV3k2NjVpRURM?=
 =?utf-8?B?dW94NTBGOEF4S0hRRnFoWUdqd0FDVTBnNURRS0pDSUxtZDc5V0hLSjFyYmFD?=
 =?utf-8?B?QUFPcDcwbE5SOVlxUHVtbWF2K1Y3VXRlUlcydm8rV0x3b1pqUXArMnNKZEUr?=
 =?utf-8?B?TXc5K0VHeGpsZzI1c3crT3Z2Vk9QSXdsSVFVbHZLNzNHQ09vNGZ1ZVpJZHdY?=
 =?utf-8?B?NUJPSFR3eFpWMEhZNjBjMUFUMk5VTDQvS3lsZVlVWEpScUNMS2RMQ3ZoRG9G?=
 =?utf-8?B?VlRIeThWYXFIK1dmR3paTUlXNFNjVXUrYUhQSjRxUmc2TFlmbzdGUm1sMTdY?=
 =?utf-8?B?U0JEcVpMK1oxUWJqVDk3eWthb2pTM05VUWNFM1FRVG5wREVLT0xHTE01RWx0?=
 =?utf-8?B?TENUNzFWRHpnbyt3V3d4bUUzeUphZXlYQjB2UDFWN2J1clJaZmJNTkNYcEVy?=
 =?utf-8?B?SDJKTmFSMzNGUmpGb1k4TG9OUHVZOXpBKzg3NDhBVHNwNC9PK0hPanpvSWZF?=
 =?utf-8?B?Q2kyUWVDb0FoZkdsWEZ6aVZwSkJrbmRWbEs4NlJsWlBXOFNlVkpvU1J4UWs1?=
 =?utf-8?B?TlVzSFpyNytSbnluRzJsN2dVSDdwSGplbVV5NEYvQ01RV20xVmpHRjBpYnBK?=
 =?utf-8?B?cnFHVDU0cWtUOEQyU2UwOHV3TFRGenV2ZGdiWE44cjYvdmVxRlJlMFBaTzd5?=
 =?utf-8?B?cHpkSUF0ZGhURlJpUTJ5cnNZc21xQnFYU2phUlh5UGJwb285ZnpnRnllV2l3?=
 =?utf-8?B?QVJsZHI5MEdMYTFtWDNDaUNBTm1ZRk5HUnFHTjl5WVAybE96VWZqdUVpYUFK?=
 =?utf-8?B?OTRsanYrQnU2Z09yeStNWVlPeHBEOGVCaEVJQzE5SFVIZFJETGs5OFFjNkZt?=
 =?utf-8?B?S0RhM01YdGdRT3lsaFRpUTZqb3p3bFJwYWdBUDBZRzRJUzRVK2ZlckwrQ3B5?=
 =?utf-8?B?RlNnenF6bEVlU0lFRlVycW1TVkQxUkUvclluK2xmbk8rV0g4TXhqaGxrOFBC?=
 =?utf-8?B?cXl6ZWNzM1YvdFlYTDQrMFc1bUVkNS9yOUVDOEhxc1JhZUszVUE1cVh2VHlT?=
 =?utf-8?B?RStEd0RXeFEvVHVhTjk2MUlkSDlSSExobXJLTFUwTGIwNjQ5aEFvZGdjblpV?=
 =?utf-8?B?MFkxd2JmV282NUQ3SjVDZnRGMmdBSXRqZmR5c0F6QnRKTUNNSUJIY0o2QnEz?=
 =?utf-8?B?YnNXRVlzNTNMUUdIaGRqZXJnajdBZUNFZklabXlpdHEveFBzZlpiT25XdzRD?=
 =?utf-8?B?bnJqL2dvdTdaa1dkQnlvOFdNR1YyWWJiRm14MjlUREVaNnBLYmpjc0diNTVa?=
 =?utf-8?B?dzFQOTdtT3gySmp6MmdERFNmNVpvcUJ0QWRDM3NTREc4Y05BUTREaGVhL3l3?=
 =?utf-8?B?U0dDWE00VDExY0wxcCtwQUx3Sk9sejVpcDB0RkJ1ZXRvd1BqQUp0eXhOS3ht?=
 =?utf-8?B?NzZMdEdPZUJQSFNpeDZFTUE0SHhmWGpuZkVjMXB3OUpMejVJazM0aFFsTVh3?=
 =?utf-8?B?bkI4dGFnQjBvTUM2aUg0eEMyZEZmZ2JiM1lheVlUa3FTbm41NlBPL08rZ3JD?=
 =?utf-8?B?c3psWStJeVNid1Aya1ZPdlp4alV3TStBS2JoYjE4a3prTlFWWHQ3cnhYYzF6?=
 =?utf-8?B?Qkx5WDBBN212RHdTOFBubFZDcXZXWGdyNHlOa2x5aXBVRTdTUnpmT0g5dVB4?=
 =?utf-8?B?eGgvc0I1b0xmUGtFejlRZ2h4TVhFaXBrWGJicW12WFg3UWUxYkNHV0JNd0tP?=
 =?utf-8?B?bjRySEJmNndpTXFWYkczYlNJTTRUcmIzdmt4ampWd0xVbk80Z0VRQklzMUR3?=
 =?utf-8?B?NnRPbE04YXVwVmQzcnNkam9UWS9KMlBBN21CYUNENy9rb21WNE1CRkdIT1F6?=
 =?utf-8?B?NmFMclljdXhhcTVldnM3bEkwVVBrMURHakhwUHBvT2ZWUjl4SkhWelZoYUh6?=
 =?utf-8?B?ek5KeG52V0cxa3VDdkVQYkRaOXZrRk1lL3ZUc0NOQXVqeEk1Mm1NVS9XdElp?=
 =?utf-8?Q?OasV3cxCAbjB8HqdISo5rcg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc6894d-2222-49c5-2139-08ddbddc9917
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 05:02:11.9967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWzBnAKD41FdU+DQyvnPyRJTW1ZL3pcK2bjuKULqFkngBIlEdEmDuPmjqXNwcBOphXn8T36etrlGUi2u9Qi3pHZSuNf8lxqBFe23p+/l6jDIYoMzLjGx9sOaottAH/b7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8066
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



On 07-07-2025 18:23, Sharma, Swati2 wrote:
> Hi Santosh,
> 
> On 02-07-2025 06:51 pm, Kamil Konieczny wrote:
>> Hi Santhosh,
>> On 2025-07-02 at 14:46:43 +0530, Santhosh Reddy Guddati wrote:
>>> Reduce the number of test crc iterations on simulation to avoid timeouts
>>> on simulation.
> "on simulation" is repeated and looks awkward. You can rephrase it
> "Reduce CRC test iterations in simulation to avoid timeouts."
> 
> With this fixed. Patch LGTM
> 
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
Hi Swati,

Thanks for pointing out that, I will fix this while merging.

Regards,
Santhosh>
>>>
>>> V2: Avoid usage of extra variable to check run_in_simuation (Pranay)
>>> V3: Initialise max and avoid unnecessary bump (Kamil)
>>>
>>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> LGTM
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>>> ---
>>>   tests/kms_cursor_crc.c | 12 ++++++++++--
>>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>>> index cacd2402c..8a465dc6b 100644
>>> --- a/tests/kms_cursor_crc.c
>>> +++ b/tests/kms_cursor_crc.c
>>> @@ -490,10 +490,15 @@ static void test_crc_offscreen(data_t *data)
>>>   static void test_crc_sliding(data_t *data)
>>>   {
>>>       int i;
>>> +    int max;
>>> +
>>>       struct {
>>>           igt_crc_t crc[3];
>>>       } rounds[16] = {};
>>> +    /* In simulation, we only run a few rounds to keep the test fast */
>>> +    max = igt_run_in_simulation() ? 4 : 16;
>>> +
>>>       /* Make sure cursor moves smoothly and pixel-by-pixel, and that 
>>> there are
>>>        * no alignment issues. Horizontal, vertical and diagonal test.
>>>        */
>>> @@ -502,7 +507,7 @@ static void test_crc_sliding(data_t *data)
>>>       cursor_enable(data);
>>>       igt_plane_set_fb(data->primary, &data- 
>>> >primary_fb[HWCURSORBUFFER]);
>>> -    for (i = 0; i < ARRAY_SIZE(rounds); i++) {
>>> +    for (i = 0; i < max; i++) {
>>>           do_single_test(data, i, 0, true, &rounds[i].crc[0]);
>>>           do_single_test(data, 0, i, true, &rounds[i].crc[1]);
>>>           do_single_test(data, i, i, true, &rounds[i].crc[2]);
>>> @@ -510,7 +515,7 @@ static void test_crc_sliding(data_t *data)
>>>       /* SW test */
>>>       cursor_disable(data);
>>> -    for (i = 0; i < ARRAY_SIZE(rounds); i++) {
>>> +    for (i = 0; i < max; i++) {
>>>           do_single_test(data, i, 0, false, &rounds[i].crc[0]);
>>>           do_single_test(data, 0, i, false, &rounds[i].crc[1]);
>>>           do_single_test(data, i, i, false, &rounds[i].crc[2]);
>>> @@ -526,6 +531,9 @@ static void test_crc_random(data_t *data)
>>>       /* Random cursor placement */
>>> +    if (igt_run_in_simulation() && max > 10)
>>> +        max = 10;
>>> +
>>>       /* HW test */
>>>       cursor_enable(data);
>>>       igt_plane_set_fb(data->primary, &data- 
>>> >primary_fb[HWCURSORBUFFER]);
>>> -- 
>>> 2.34.1
>>>
> 

