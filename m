Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D80606A32A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HP9O/J5B
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903F210E646;
	Tue, 17 Nov 2026 18:47:09 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8608510E646
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 18:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okO0JZogML+AvNKSR6S9BHZ7QlZ6il4HJXlLK0e4Fn9RpAYC9T9KniABn/cIziUmZg47GmyjreG6sB1WMku/Nk8dAYbyof6/j6GtqFT0bZviK9GGHyICgOBntCVj0QxZFfUzEJfE+EnfGPDaA+hwc4qI7XMPzaZHVE87r3hY9i6YReMFqj3XX4RVqKbqVnsG/apLWDZkG6KGNSKSE55IRf4Q3dKBmqNHDmtOTWMYIInbrETh+lblaPQNKm7DXS2v6sGZf2gGxfvF/YRDW9h0LiEqs0wlQmBV5qr1Ga80Am/AcrBxKzqmztqpK2IxOFEnvIVunyhqVFYrjyNhJqFbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDAw0cJ/6HTbLQ50EMBzE+XjPJNy7BA4xmCW+cL9CKg=;
 b=N3ciho3vW1v7rzodSaBIEDSbjW5E9Acaq3tGmruTLXRyxU6WcCXLGBBng4kp5g8f/b3D6wBNX6xCxG2hVPPs5J/YadapLpnDJ2C6qSJSafeJrD48tAXtBj7y6J7oOKsjzuOBTr2ggdlhYWZAGAwro5Xl8BDe9HaGXurvgGmUQRU1HGFdNmFMOZtGr/voU/OYn0jcuLEoLta11ZpYDaMmsVaUaowGUEhcf9E7IJ2s1RiyPN40w3sPzZgcb/dGkF7hY5AHf3iyQob+Mzo0GdxjmTlUbAVHgx9BtLTFfdVc3sCNGh7pFVh/+lO8xo2dQYNVRYNY+ey0K2IAKpUAG5aPWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDAw0cJ/6HTbLQ50EMBzE+XjPJNy7BA4xmCW+cL9CKg=;
 b=HP9O/J5Bb10o/Vy0BKC6yFcAa30434FRSqCoxuMuLStr2qUSfCIA36KevK9rt2NotsE7V5hMtwqWbxu+a1roPhy/a+6iqTfJN3u7q82+o/skqVzTjREvR6uN545TEiQrlnq5APgxJgPdjRo6GirhZZpjuyFH3lGcu8aolsXYH5s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18)
 by BL4PR12MB9533.namprd12.prod.outlook.com (2603:10b6:208:58f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 18:43:20 +0000
Received: from MW6PR12MB8705.namprd12.prod.outlook.com
 ([fe80::e75b:745c:ed13:f321]) by MW6PR12MB8705.namprd12.prod.outlook.com
 ([fe80::e75b:745c:ed13:f321%4]) with mapi id 15.21.0615.012; Tue, 17 Nov 2026
 18:43:19 +0000
Message-ID: <e6c97b72-c32b-4707-be76-31dfe36cb0fc@amd.com>
Date: Tue, 17 Nov 2026 12:43:18 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 0/3] tests/amdgpu: add new tests for VPE3
To: Caden Chien <chih-wei.chien@amd.com>, igt-dev@lists.freedesktop.org,
 Solomon.Chiu@amd.com
References: <20261117111336.8130-1-chih-wei.chien@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20261117111336.8130-1-chih-wei.chien@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::30) To MW6PR12MB8705.namprd12.prod.outlook.com
 (2603:10b6:303:24c::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8705:EE_|BL4PR12MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c47fec-381f-4625-0981-08df44daa638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|6133799003|3023799007|11063799006|10067099003|261022075727099003|261021121427099003|261021123027099003|56012099006|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: YiRQ8UGCLkeTDSC2KNk2/u0cRvm5GGQe/R8bvYok+HoZz64EMT0BbAW0DNi94y3CNjwquRIhytcp3Eg6Xk6JLMiX8NImzZ2FDO07s0ZKH1qH7QvS4at3a0Ze1sDLjPV0PbWBVaMWCHnG95OMjT7cjUY0q3MVtrXlTEBaXUBJd4U2pyR1Qwbsw0T6COmibyicQzj4CFkycGJRN6EcJVDMQCmXdK34953iutYl+Yv5FQqLw/az+WG/PkmXryw2WBKMsAJi1cQgkudDI6ZtMlo/noEJsAVQlrD9FOfqdLk+2gIvb4Fo4q25SWNuiLwQc9gr39D60RcphaBMRK7Nx8ix7tKn/bmA8Uc1xSe7mvh7Lw4IZ05TH9kzDBD/OEkszqX4fOBwJuvXMe19iV1FQagwMv0dJw5ufVxoBH16XSAbsnOfoDkp/hwjIyEkvfCctZIoh2zzYUCA7xspmyXqhZrpuTyFcmMtttRZrmlrp3gqC0n79JZNnrxTWKQ68fvrHblssQlQQXRzSf4wUeCd0k4qEQ2lfh3bfcO7JC/2/svbbubkweUYIqCxnx8w3NR3/p4IhaudvJOXycZGYY96XKQ8cHYR7cxEWdMZz8nkIgIgzudASFaLbR9jtc/YRXOaczJ5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(3023799007)(11063799006)(10067099003)(261022075727099003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3ppYzVpSjFlVG5EV0RWVzNhV2RnYm40SXRHTi9zTGJSWUN4VEp6bEg3dzU0?=
 =?utf-8?B?bUhkTGg2OVMwdkkrTnJJNWI4WnBjL2hNVEwzcE0xSkJLVmI2UHZXa2QrK0gv?=
 =?utf-8?B?cWtpSktpOUZNc2JmaW96L1ViQUg3QldnYW0rU0JJUVFYcXNmZjN1VllkbXg0?=
 =?utf-8?B?RGpUZkI1VWpweWt4V1U1R21pTkUrUFl4TU53QTBCOVNRalpEdnBWYkxRVE5F?=
 =?utf-8?B?c280K1R2cUxGU29mK1NRWnVvTHd2OXpnVGQ0S1N6ZlBmd0Y4NTJjZU1nYm1h?=
 =?utf-8?B?bnVaL05GOFlzSTRPUVg0RkdHOUg2WHpTRy9iSWlQV2g0YUFDb3BRUHp0eHVs?=
 =?utf-8?B?T3hkOWVWdXczU0lGSU0rSlpBVEV0TVRaek01aURSOEZsMW9EdnZGdGpmdEpw?=
 =?utf-8?B?em5kM1Y3OUdhcG5JVmFPVGkwZFNZRHhTTm1vckw4N29wMXJOYzI5ZndFNnRz?=
 =?utf-8?B?YmdXdU9MV0ZnSFBDTGtjQk9NZHRwTVVhOEh1T3kwUTFUVnZpaFUwWUkrRS9C?=
 =?utf-8?B?dEJ3RUxKVEgyNHVRa05Nb1lreC9UblZHcFl0RFNGRmZIRUROUmZUQ0NvZHpK?=
 =?utf-8?B?enZBd0U4WlIxL04xWTkyeVNoQk8xTnRlNk81VEtKcFRUOXpDOFdWc1lqazBp?=
 =?utf-8?B?Z2xpNlJzdmd2K1JBVWlJVzAyOEJlWVc5WW1VeTJVdjN3M05Wc1RRSll3MjA3?=
 =?utf-8?B?eXNkb2ZjSUlMNDQxVnRuTW4vL2pwb0EyeG00N0V3L21hTEtudlBNNWM4OGZD?=
 =?utf-8?B?MDRySFpkSGVBY2ZucmF6S3JITnhkQm1FLzFUVmNNTmxTL2Z6ekVMWk5hVlJS?=
 =?utf-8?B?eGs0QytEOUJZYTJGSHVxOEtGOGxhWEwweWM3WEtPQVd5cFV5ZVRhVWxGcDZw?=
 =?utf-8?B?QWdwNHVUSmNoTldMNzBTOUliM0NtdE5GNVlmUHdEaldLb1dwQk5vT3hQbEQw?=
 =?utf-8?B?T1lZOC9lb290aURqK1FiMjdVeDFQUDVwTlpCQVJWYkdjZ1gwL2dzOGE5UUJJ?=
 =?utf-8?B?UVpqSEgzUWgrdzY2Qm80eFE1SXl2VEhlZ2FBVVR3V3laUWtOcGh3YVNmcjUz?=
 =?utf-8?B?UExhVzVpSTF6RDZmNkY3K2c0dVpNVWF0MDFqZDFXeEZyeTFQbWVWcUswWi9G?=
 =?utf-8?B?V2JuUkI2a043VzBRR0E4ajI0RFUvOHAxZHZ4enp4eXdUN3BqK3pTa0llOHcx?=
 =?utf-8?B?d2J6SGpxcklBaGZpQ3M2VDlFL3p4MFAxZFJGQ01RVkFLa1gzWm0zN0tUNzRH?=
 =?utf-8?B?UisrOVFvVy91eE1PUFUrZTBHVkI5OWJSLzF6aERDNnpTaGRyL0hMbUgvbFkx?=
 =?utf-8?B?Y1dyMzkxTWd2dlVmZFczMERsNDRoZHFOOHprUGRnQ0o2b3VLTzNHOUtWUENl?=
 =?utf-8?B?bUJOUyt6Y3ArbjdxSkVpTyt6c2taTHBmcGNmK0xTL0o5dTR4em5iTkpMUVoy?=
 =?utf-8?B?cEpIYzVpSko4Mks5YnltSU0zYzVwRmlQdjk1T29KN3BzTlo1MjVvV1RpL3dV?=
 =?utf-8?B?QWNRK1BEN3oyY1doV2hZdktrUktIZ2tkNWczdk5KNEwrWnpRRVg5VkdTTGIr?=
 =?utf-8?B?Nk1MNmdCVlNvTjRuRDdKOXFOYWFaYkZPelZHU1pCakh2enBFWklhMmpjQTMy?=
 =?utf-8?B?RzV1WXB0OURiWTQ4eDZSQ0ZvOTNmK1o3Nng3KzdqekdxanFsRmNFOGJmelln?=
 =?utf-8?B?OHZkMjlIR25GS3J1RHdsdFAvUTNoVGtTaHFpWWFrYXhYM21QTWRVQjJNQ3Rw?=
 =?utf-8?B?bXp6aDRXVnMzNlJEUU1ub05sQjBhSjdCaWVFTE5hQ0taS3JrYzRoTWhYQjhs?=
 =?utf-8?B?azN4YTVMTkl0Z0xYREdzYlh1dlp1RFdDKzdnUytiLzdFSHJZbmtlY0JYZEtx?=
 =?utf-8?B?ME1NRmRVT3pOeHhrVFdTVjVOYlJQcXc1VXdUc2V6cFhOWUM4L1dBWmhEeWU2?=
 =?utf-8?B?V21mMDRRbW1VT01oYTVQSjV1Rkd5clRoSDB6bFdPaDZCQ1BLV3FVelpmSzBL?=
 =?utf-8?B?RU5IM1hRWXYxWnFDQzJjU0ptQm5DekpMemlYVlZMa0hHRExBa3NMWWJkUm5C?=
 =?utf-8?B?TGdTaHQyVmlkWW1RQXlqck1HaC9PQnU2RGZlS2JkRUovRFptTFpDUXpnMVNj?=
 =?utf-8?B?VExNaGtjZHd3Z25xcndCWU4zQzhYQXZKTXNGSGxna1pQNHdOaWpWNFNlTjdU?=
 =?utf-8?B?TC9kVitSVEVFMWw3bzNuRGV6Y3Fxd2ZMb0FOOVF0TCtZQUVNbTlKOTNXTWpr?=
 =?utf-8?B?ak5Mc002S0pucVQvd0RNU3QrTVU0R3krOE5hSEhTcUlUYkNiVlNhcU5TU1JG?=
 =?utf-8?Q?aVvxlMs0T8eDaOO5+j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c47fec-381f-4625-0981-08df44daa638
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:43:19.4891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgK/ChIlwCrqZWTS8wE+Fud5U7JaGaI2vRqr+dyDVccUMmLDT3tZJAo0a4FRP2ckief/m2q4aFAKGf28CvN5rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9533
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

This series is

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 11/17/26 05:13, Caden Chien wrote:
> The first commit renames some command objects. It's for the second commit
> to add new test commands without conflicts.
> 
> Following previous test case addition convention, command objects are
> added into amd_vpe_cmd.c, then exposed via a getter function. A new
> function is also added to run the new VPE blit test commands.
> 
> As blit test fuctions across VPE1~3 are pretty similar, a large part of
> the code are duplicated. The third commit makes the VPE job setup code
> shared.
> 
> 
> V2:
> - add a new commit to make blit test cases share the same VPE job setup
>    runner function.
> - it is to make new test case addition and review easier in the future.
> 
> V1:
> - rename command objects and add new test case for VPE3 blit test.
> - it's the same as first two commands in V2.
> link: https://patchwork.freedesktop.org/series/178695/
> 
> 
> Caden Chien (3):
>    tests/amdgpu: add VPE version identification to command objects
>    tests/amdgpu: add blit test for VPE3
>    tests/amdgpu: refactor job setup of VPE blit tests
> 
>   tests/amdgpu/amd_vpe.c     | 257 +++++++++++---------
>   tests/amdgpu/amd_vpe.h     |  33 ++-
>   tests/amdgpu/amd_vpe_cmd.c | 483 ++++++++++++++++++++++++++++++++++++-
>   3 files changed, 633 insertions(+), 140 deletions(-)
> 

