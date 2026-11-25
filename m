Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E35606A321
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HFYfFVHY;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OoGmPnDh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C2010E169;
	Wed, 25 Nov 2026 08:23:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4B310E2A9
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 08:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795594944; x=1827130944;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=svQj3va5lww7WE/IKSDn+8BiDUsBDifP5jh2kZ5vZ6E=;
 b=HFYfFVHYRtMLT+CtIE//1neIMqTKn/8AJxuPaQM9NAXoXfNQOybzOOFV
 Unel0HIGSZf9OWGTfjKq1afEtrFsxXvKh6rWOp0TQuKN8UxmM9qm8MMpc
 2y8ghLQG5YbgdWQ2sbxUnqtJgK59oSqXhqlhCbh8Evm6KOYGQdhuwkkyK
 RcQlBdu6rwXyBZO7K0GY71iNlAGBkpJymuW6pcdlyP7/TS/gBEFrSYnFk
 fb3z8fXniS+7Q+yL87qCuABx/MwEf2JfDzrfof55VU7NrIq/Lx1uG6H/z
 5mY71xTFSonCkC0Luljt80vCU413k+fquAKZRhX9mMFNxiYIm0b83S4ru A==;
X-CSE-ConnectionGUID: lU7L5IP6Sl6tlNaGUb4img==
X-CSE-MsgGUID: NRXIuwfRRkqXe8vENUiGOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4338252"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4338252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:22:17 -0800
X-CSE-ConnectionGUID: ObFJ8+vFRKGORm/powOGFA==
X-CSE-MsgGUID: Vdlf4zG/T1K0MeBXOofi7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12117899"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:22:16 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 00:22:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 00:22:15 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 00:22:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HH3hj9rKTkx0JWOlb/zBV1BUrRx1CKkOaT9UdUuEKWQ8GeC9mEY0cCbT+XsldwRykX+/atbI3+bmCKi/y4Oe2dZ87flaWGNrPJofZOzswVLwIiCKuDSMobUZTjtsSd7+DMMiVQgdudWanApUHQNxUKFPfzeZwXzLgJhkmw7tGt1A1BYKQgMoT4jtnOuMD4Oqufvl2xphD3fd5yFFh20JHhXpve0ovDVEJ88yZEZg1BYBIa97PsK4Zij2unQEYW+YL6bypPMPgeID7DxPksqc5EdqsrUSv+bznJYBRwZo7ns56Pgk6OXaN7I+9z8hBLRW/+rBesrdnizO1h/xB2sJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7Rv+khbd1y7DUk1vIL2H2sBOHPZQjHtQ5Gx9GqAqvE=;
 b=QPNkpkEIfAgP1IX47mQEvJQBQCeM5CtxQa0VF44TbRSYhczvBHpgGZUil/pF3CZa2HsY1vdmSqd5TaAfjDUu/NAejR3fJgqzzWXK0gj68vaS+8OBREd4cDRyMRm4moYTvZ/a5+FvRJRG60Y6UcTvjx7796FYPMAsFFz1lLI5PjFS2y7cvpex3dHyyBqKT1PifeEkTtdBhy7g/X/kyXdVmkZWCDKkDhU0ev8e1TQA1QVUIugSZAZjjplaKVAJx10BVXXJXRiuWiHshKKoAb89SlOL3j4S6W8l1tF+ldoO2lL4sqIGkE8TnDzNFfWxzHBcHNwuCXiYuBskzkpt6XkH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7Rv+khbd1y7DUk1vIL2H2sBOHPZQjHtQ5Gx9GqAqvE=;
 b=OoGmPnDhbF1Zon88pq6gvXE3UTGBu7q9hS/sB9lqfAv6b92u2lcDlTyLCfgXEwv0RvQ0IpKTsifyU03hgszVrQQIfLeIK6WOc/+v6IbtOFMZ9suhVENtCRH4XiwHaKxCSiieBh819hR1SLYCXW9ijDYWLk1DEgd1XYjfScOTqwc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by PH3PPFF8C186950.namprd11.prod.outlook.com
 (2603:10b6:518:1::d62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 08:22:13 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 08:22:12 +0000
Message-ID: <30c5d931-4e9e-42cd-95d9-8019f4ce56ba@intel.com>
Date: Wed, 25 Nov 2026 13:52:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kms: Add max uncompressed dotclock
 limit for non-joiner mode selection
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <chaitanya.kumar.borah@intel.com>
References: <20261116091832.1312335-1-karthik.b.s@intel.com>
 <20261116091832.1312335-2-karthik.b.s@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261116091832.1312335-2-karthik.b.s@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0091.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::13) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|PH3PPFF8C186950:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0957f8-bbf8-4ffa-801a-08df4acd34a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|6133799003|261009223027099003|3023799007|261021121427099003|261021123027099003|261022105027099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: U0f3KAtHe+5r9/dyi9LRxGfR9zJ82tApFPU1zQrYOyQzgYsvrf4OF+VMoiidrskU1SZOKogHG+yMh9i2+J7uRwDk1FTb8kTjeU+qvlwQ6SeKXqSCncrFC+GsRC/gzL4J53t05pyh29454G1WnjlPS2DiDz/AHTOuVWgRd0Kk4KaH41RKF534o9ts4WEpzlUVcZWUOjJEbGUVilsrIeHEre9pAljuTg78wAP8o7OYf6Iy7uhIEM7r00mlEA9z0mEJWutUbFjgqeASy0M+Xk4dGDrZqoVi2j9jE0knF1amun6A4et/WZhZUx6o6BLXI/JPgvew5uG6WXnoAGQjjYCT8drMEbDAPQ+q9bR5toCHw62MWowI6hprtNEqAWpDwYiirKENXQV7tLSGWi3XrDd093iJ+eDbs+CTa0iSrJskt0o3FJKBNHviKQ+1NZReoSq//TzSodD1B0EMknEblT9NJfNxCfw7oZO9bm6Z/vz+qJ2uXmyxOfHZI0Jjtii78lqgb3f2DpsRtIqdxvxemCouzersq3Yky3U9WWiegpqlLGePrFsuZIxNfiK/J87VOajAD7EDEYjagcjf7PRifW5TBgqH25lWSrk4tg01brQeV/BSqsQTdGO7wL+BzJStikBomX3I0IrSBtuQKqBVRcvAa4R75TbdtL6rKqvORssH/5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTU0dkdTdnRWNEYzNmF4RUluUnlmV0tMRTVkdmtJcDA5RmRJeDRVemlKd3B2?=
 =?utf-8?B?c3hWb2hxMXU5K1grNHgxTHViWXB6WCs1UjlwL1hQbFkzRmF3Y1plbGJxK1k5?=
 =?utf-8?B?V3hUVlFoU1U3V2FoclQzWXQvdGxwRDZiQTdjdjNvTThIU29UKzZVa2YrcTc4?=
 =?utf-8?B?UTBPRXo0bmlZSVlBSzUwOGdjNEVqeGY2OHhBVVBsOG9aZ2tuV0tCSVUzQWNv?=
 =?utf-8?B?U05rMCszY3FxUEFYZTNFVTAyYUpyTVUvK2paQXowd2RwZW5DdHl2U0hPV3FS?=
 =?utf-8?B?VmxQWUcxdFR5em5tQ1NpbDZKQUU0MldVVk1XQXZKV05KL3JMc2x3YUM0S0Zj?=
 =?utf-8?B?UytRdHg2aXpMbW95d2YvTm1tN1dLeVJSV01NQ01KT1pENWRIZUhGSi94Qi9C?=
 =?utf-8?B?ZVBRSy9vZ0JXREFmb05PQVVSdlhwQnI2U1RNK3Z5cUxjUXRnOEUwZlVlVjZm?=
 =?utf-8?B?d0tVSXRoSlNJUy8rWWo3MjNxaW9NUTFpaGJHNzQyNkdwVkFUYUFrMllJbHRC?=
 =?utf-8?B?Ny8vUjZmbjJtZDlxUzJJYWlYNXZBeVlCTlhhaFZKdlc1bUMwc3NyVUJrWW5F?=
 =?utf-8?B?QkpyNzZXelRUNnNmVE93MUh0OTVGY0RnWWhyTUhKMXRSR2QzR3BDUW4yY1Zz?=
 =?utf-8?B?em9pbloySUg4RC9zUjJEMkZvSHg0TGM4UUk4ZDR6bmIxOVVzYzkzdjZ4dlJC?=
 =?utf-8?B?YnQxR1NzM0dTY0lkdTMzNklxTVhzS0MzaFU5VXF4cU9uTHpOZStPdlZER01q?=
 =?utf-8?B?TUlDNDVDTzE4Um5UVUlXRHVpMVJCTGtidncwZEgwS0FIbXhBMHZhR0pNa0hq?=
 =?utf-8?B?YlI5MmVEaHBUZlp6Skk1YWNtOGhiWHBhNmI2WG96VVBOMWJyQWxSTVZsWHpi?=
 =?utf-8?B?eUU0NmNZSEtKRDFSOGd4MkJuZHd3M3FlN2JXNFNJL3ZLVDcwaTZpK0FQdHV0?=
 =?utf-8?B?ZTFIN1BTMERnbHIrZURkNmFRakdWdkRsK2pwRmpKN1EzUng4UjZHcEVyRmx2?=
 =?utf-8?B?TEovdzE1c3RHczdSMVBkZTVGNXh4dkQyOFVSZER3dFprTDNHWnkyd1d2UnhR?=
 =?utf-8?B?K1RyVDBNK2lYaFl1TkJrWXlKOHhWbkNTVXcrTlJsZUhIU3Azc0hRaS9UeWFm?=
 =?utf-8?B?UStBL1JJcjBpSFVOZHNnclVNZzR6RXZUcUhtZ2lMMEh5RW1wTWFKQUJKVXkr?=
 =?utf-8?B?aGt4b1FjMWpPUnc4UmJvUW9OckRpVVlKdGJiaSt3bjFvU3dKV1ZKZmpHZVY3?=
 =?utf-8?B?OXBUOGFpcHlyT1lIVTZsQjBVWDl1M3ZkNHE3d04vMDlaMERXajRHa0JLdGlP?=
 =?utf-8?B?cjVqaU9xa25waVlqSjFNWjllMWI1ZTY0aGhYNS9oQk5rOW9mMDdvWWVsZWgw?=
 =?utf-8?B?aDVEMU1ka1F3V0F0WnJzaDI4QzcxVkQxd0VaNjNYdGV0V0E4bnpjSTBkcEZU?=
 =?utf-8?B?Zm1ELzcwVlZ2SitKSTVPVXBzT2NPcVZsOWRpclEwOFByYmFubXVmRzc5TDdW?=
 =?utf-8?B?UDQ2bHNEWi8zSG1rbnprNURpamczOHEyL25nc1BXckEyZkdUeDZHM0xxNTJR?=
 =?utf-8?B?NldGWVVlc3NmVjF6YXZKVnU5b3YrVnpSWkM1clVYVzFZUkFYWENiamtYQUpU?=
 =?utf-8?B?VUZCeEZMRkxWUjRNNGJtVk0wN1FJZk1yQ0ZBK2N1YmJabDdaWDdnaWd6bFlm?=
 =?utf-8?B?eXd1Y3kzNnN5WUJxTWFpTk1DZWg3aDdrVithQXJaeFJkaFBpQkIvK0JtQWlM?=
 =?utf-8?B?WU81MmV2ZXZmdTIrSFQrNW4rMXduU29OaUFvbmRHaERLMjAwaEVNM2QvVVNW?=
 =?utf-8?B?dWV2VERqaEw3SXBjVE5YWDdhNXJ1THFDV2RGQUpDUFd2ZWg2MS9mT1pZN2NQ?=
 =?utf-8?B?RVdFTnNTT05QVGFPVnYybjQ5blFXTjljVEVHcXY3NEx6MVdTQmRKYm1nYXNn?=
 =?utf-8?B?S01rWXhHTVhJdytuV3JRQVRpTGtYeFErVk1vbjg2blo2RkJSV2l1a0JlQkZP?=
 =?utf-8?B?M2xCQmtKYktsWU1acy9jTnUxU3JPL0xtNy82eFU2Ni9EL1RkR1JIRTVwb3RH?=
 =?utf-8?B?TDVqNFNyekFDU1VUMytvcy9Zd1B4TWxiQkJFSmlqRC9TeXYrUkIwL1VkQVhK?=
 =?utf-8?B?V0lyR2xBVENVZU5aVms4aXZhTlFLVkVCcWhuQlEzRjN1YnpveHZGaDRyV1d0?=
 =?utf-8?B?Y3R2c0NkZURZRGNTUzlkQk5JVFViQWhoQUVsV1U4UG13dHlNaWhyZS8va09H?=
 =?utf-8?B?cVh0Y2JDTUcrTmxIVGR2UDM1ejdyY29oWjBrVXY4cS9jbU0yWFhOSWtFMU42?=
 =?utf-8?B?QlR2ZUpuOEhGa29nbEJubDlONkZXbkxzL2lSNE1NN1dzby9qS2xrejh0cGhO?=
 =?utf-8?Q?iNKY9VTVFsqZ1V7I=3D?=
X-Exchange-RoutingPolicyChecked: EjoWl1ipiDOA+7s/WK7HPBHkQ9QCNddpLrc8yye5KVtifFwJq5cAXRT2Jg+AxKAhykJCZ/5gapFbZgV9KJxMuTUnbK/Z47uH/mMD9bsrscD0KvGezplHO/ju1rgCyRZWq6gB5NAQBaAUvtuB73EzI/brSU/HmEz2+DeN2joRFj9mw8eg/KwwREXsFJdaPVsddWcQJVjFeByaIAFwZ6Gv/lERPYGtcRfk1FFv2TSLjgH8l1zWzLOc3Hhhx/6ITRjPeQGv5/Mm3ldS3P2zpQ7Z/jjm+V6gwrzGDzCStVeCo/LQNiRHbLggBhsW5WVKNkXIBb6FztKG2P65tciwmbiYrg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0957f8-bbf8-4ffa-801a-08df4acd34a9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 08:22:12.5095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbweKnzncBEmfL7ocoxoLuETBrjNio8diax7DceEXWkjxyMzw6bsNlZtUCMuwwKrT6u4JVaH65Spd6+R2HKK8tcjxhm/veSIKXXD9vp+Ev8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8C186950
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/16/2026 2:48 PM, Karthik B S wrote:
>  From display 30 the kernel limits the single pipe pixel rate without
> DSC to the maximum validated frequency, which is below the max dotclock
> derived from CDCLK and reported in debugfs (see
> intel_max_uncompressed_dotclock()). Above this limit an uncompressed
> mode can't be driven by a single pipe.
>
> intel_boundary_non_joiner_mode_found() only checks against the max
> dotclock, so on a sink without DSC support it can select a boundary
> mode which the kernel drives with joiner.
>
> Add intel_get_max_uncompressed_dotclock() mirroring the kernel limits
> and use it in intel_boundary_non_joiner_mode_found(), so that the
> selected boundary mode stays on a single pipe irrespective of DSC
> support in the sink.
>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++--
>   lib/igt_kms.h |  1 +
>   2 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 915c6a8a2..b28647696 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7207,6 +7207,32 @@ int igt_get_current_cdclk(int fd)
>   	return read_and_parse_cdclk_debugfs(fd, "Current CD clock frequency:");
>   }
>   
> +/**
> + * intel_get_max_uncompressed_dotclock:
> + * @drm_fd: drm file descriptor
> + * @max_dotclock: Max pixel clock frequency
> + *
> + * Get the maximum pixel clock a single pipe supports without DSC. This
> + * mirrors the kernel's intel_max_uncompressed_dotclock(): above this
> + * limit an uncompressed mode can't be driven by a single pipe, so only
> + * modes below it are guaranteed to use a single pipe irrespective of
> + * DSC support in the sink.
> + *
> + * Returns: The maximum uncompressed pixel clock for a single pipe.
> + */
> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock)
> +{
> +	int dev_id = intel_get_drm_devid(drm_fd);
> +	int limit = max_dotclock;
> +
> +	if (IS_WILDCATLAKE(dev_id))
> +		limit = 937500;
> +	else if (intel_display_ver(dev_id) >= 30)
> +		limit = 1350000;
> +
> +	return min(max_dotclock, limit);


LGTM.

Not expecting with this series, but we should move intel specific 
helpers in a separate lib sooner or later, IMO.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit


> +}
> +
>   /**
>    * intel_get_max_pipe_hdisplay:
>    * @drm_fd: drm file descriptor
> @@ -7340,7 +7366,9 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>    * @mode: libdrm mode to be filled
>    *
>    * Check if connector supports a mode at the platform's maximum single-pipe
> - * hdisplay boundary.
> + * hdisplay boundary. The mode clock must be below the uncompressed single
> + * pipe limit, so that the kernel doesn't fall back to joiner when the sink
> + * doesn't support DSC.
>    *
>    * Returns: True if a valid non-joiner mode at the boundary is found,
>    * false otherwise.
> @@ -7349,12 +7377,13 @@ bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connecto
>   					  int max_dotclock, drmModeModeInfo *mode)
>   {
>   	int max_hdisplay = intel_get_max_pipe_hdisplay(drm_fd);
> +	int max_clock = intel_get_max_uncompressed_dotclock(drm_fd, max_dotclock);
>   
>   	for (int i = 0; i < connector->count_modes; i++) {
>   		drmModeModeInfo *current_mode = &connector->modes[i];
>   
>   		if (current_mode->hdisplay == max_hdisplay &&
> -		    current_mode->clock < max_dotclock &&
> +		    current_mode->clock < max_clock &&
>   		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
>   			*mode = *current_mode;
>   			return true;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index dfcb91e02..c0565479f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1381,6 +1381,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>   bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
>   			    igt_output_t *output, int bpc);
>   int igt_get_max_dotclock(int fd);
> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock);
>   int intel_get_max_pipe_hdisplay(int drm_fd);
>   int igt_get_max_cdclk(int fd);
>   int igt_get_current_cdclk(int fd);
