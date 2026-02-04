Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98974E9537B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 11:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C2510E5FC;
	Wed,  4 Feb 2026 11:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jNnrL2SJ";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77F510E5FC
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 11:45:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHhhFNttR1hwKr4FAy8N0ocIS5/EnKWNGlTrHdVeAKnHpKjNHaRkN13QOQI+AVe6Fa7gUu5QrMWq39BzcBQEm7Y8smluJxBRsmy/LwqQFQiyhoabh4LDUPnhXIg67WsfBbiFEOTFMbbneshM5qfAfLUsc6bowrITy7Pzeo9VGC9bZPxQzZZ2TIYtAeuO2u2q+uL0+0C8OVH+I98phCJ8JtS16pgCayj+TMKVI0FgziShkbLmdSeQOEhLZ2+AzJylO1Qo0AwZ49i1pRTrEBCqO63bXX9cKMvTLdusM1Avi22/8h5hfCkfPzaTQtMaidLeBkQl483mEPF216a4pxGIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tF8UuxkazC3Kr6IcOwoZM1Fdg61iDIHHffsyEfuTGk=;
 b=KvcyBSvX1MQ0+k3uGaDLYxSZ0mIMGBI4F3pIGTIXwHPs3VpoVgbyD3bMLzYzBFlvtL+VhNlbfsqFDCZi5ajNdgKp+xmLvBtbUsMH0g8d2hiNPCbdCm+yOE+33FF5OjGU1tQTKc6HETbR+JpD+o3a0omzfp+TetQj/2bvWUSWiCn1JxA8Em4/yKpAKZW8pqWtsQ1t0jqBBgmwzx19Sf9rsL7Fjenuv2rQbvLk7i6L3XnmipGvR6G3v/YFZ9N/ySlq5YTBAjQGPxkvwyBWe130cyFt6gx3RzqL1yermQA1YwkpWcX4X6IX3Xoze5Jp7d8MlgXlMoe9uiSSux3G9baLpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tF8UuxkazC3Kr6IcOwoZM1Fdg61iDIHHffsyEfuTGk=;
 b=jNnrL2SJieDxISMkf3mce7gui5bcMo/gOYa+opARzjz6ymM3dJQQWexjq2R5Lc3Y8YM3LlHYZS8/JGJ2mNu2onBUrR6dg6HC3VDiLusN9D0DQwZFdUGiHquEBwKxze2eZcb59lSDvwspVGuSsSi6Tdl3L3D6tW/RXhlICuJzf9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by BY5PR12MB4146.namprd12.prod.outlook.com (2603:10b6:a03:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 11:45:52 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 11:45:50 +0000
Message-ID: <98b1eaf8-025f-4b61-b0e2-17392789c12c@amd.com>
Date: Wed, 4 Feb 2026 06:45:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_jpeg_dec: Fix compilation warnings
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tessita Thomas <Tessita.Thomas@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20260204053452.741530-1-karthik.b.s@intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260204053452.741530-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::13) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|BY5PR12MB4146:EE_
X-MS-Office365-Filtering-Correlation-Id: bdfff803-0c0f-4192-22ed-08de63e2f1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SThEMEp6UmJrOGdsblpLYnk4MDEwaG8zb1orcXozUmNUcEdqTi83TEhpSnkx?=
 =?utf-8?B?SDNzTmhnMkJxV0VGRGVTcHo4S3ppY0xYbnVEOFBVelR6eW5GK0wzNzduTUJ5?=
 =?utf-8?B?dkVBSlRvWkFObk9wdUhPZU9wemI2bXNibjA2aHRtWHhlcUJzVHBnSVdJN0hR?=
 =?utf-8?B?UDJUakZieUU5STVmMUFTQ1FQWjBIbm93L1BCa2N6RnBBSlgzWTZaOXV1MkRY?=
 =?utf-8?B?dDJzRXJwTTUwNEtrMlJNVzEyUXlKb2l4VkI0TlRZVzNTckU2MUl2anVHVkZ6?=
 =?utf-8?B?Q3JqaVFucm1UeHNZUnU3MVQ2MjN1dWkrQXBhVTFiMTlLTWZ4emZGbmQ0R0NN?=
 =?utf-8?B?L3FCa2sxdDBaV1FkN0ZoTE52OWM5VmVHVWNPMDBtZERLa0NXa1NYYmc0cmY2?=
 =?utf-8?B?VUg3RVFFUnljVGRrMFNKVzFUOFBFYzlrRFhHTDRXcWFSYkFhdTBjQWdwclZB?=
 =?utf-8?B?QkxGLy9jbXJseXlXdTJxNjE0Q3dlTG44bFJoM1Y3RGYrbFgyakNtUFVsTFA1?=
 =?utf-8?B?ZHc2Qnd3bjhOem1DQVRlK20rMjdIVERLNXRwM3JwUjFpd082LzZkeVBxa0NB?=
 =?utf-8?B?bzhDWEVqNTRJWU5hWWRPRHpVYWVjL0Jta1ZtN1ZNRVNVNlZjVEVNaHh1OGJh?=
 =?utf-8?B?SUk0NjlmRmxhZEFoY2pUTXZxS2RGMGFXTmd3UXllZVhYRUxIN3JNM28zcm9C?=
 =?utf-8?B?L3BjaTlLRmVLb2M3TnpYcEl5T1dEMGRpcjB4WUJZY0prMS8rd0lWbFkrOEVZ?=
 =?utf-8?B?bjNhNVU0aU5VaW54S0lGdFRsUkFteUhrY1NQSWh0Q3l1Mk5GcjY2VCtzRmRD?=
 =?utf-8?B?d0RJQU14WHk2bmZTZG81R2laclIrQWhnc3pKVHdVYUd6bytreUN3Tnd2a2NT?=
 =?utf-8?B?WllZdENPeTBBWFdTOWZPZ2ltUXBOYzk5MW9tZEkwcnhYbkE0SXRXWXB1Q1lm?=
 =?utf-8?B?b2JKK0xYTHVlMnpmc2x0a2R6MjFsQ0NKY244TElsTTNqTmxoQTRZU2g2SHpi?=
 =?utf-8?B?TE4yUFdmNmFQUzVmNVR1aXBteXdHUzdPWWZ2T3dsZi9vellBck9pZEIySVI5?=
 =?utf-8?B?TUUyQndaRjhqaStmRjZSL1hBRDFhbGdhUHQyYXRmd2RUTW13TFFEZnFjTG1t?=
 =?utf-8?B?VjdYS3gwSTJab1pRZXZUbmV0Y3l3bld6WmFWU2RJVTk3cFUrY2pYKzBJb3JU?=
 =?utf-8?B?OXdma05peHdEbnNDVkJseXJJY1BUU3JodlhNU1FHQzNpU3ZqRmZVbkQwcVhl?=
 =?utf-8?B?RkJBbDlsNXlNYTJLdDg3YjN4SktsSncxc0ZZYlhlblhmTDdHYjE2RHFqWGZm?=
 =?utf-8?B?aE5wdnJBUG10aUh0VUQ1YUt0bU4ybFZpK0JjeEF1UUZnaVRCSWFkcG4xUmYr?=
 =?utf-8?B?TmZPRjcrNHIrZm5JUHJVbmhnZ2FRTmtlamhhZ0Y4UXk1N2ppSElZNVVXNlNU?=
 =?utf-8?B?YmJSRTd3MjBreS8zY3doRWhCemc0bi9BM0ZqRDFUR21OUTFaSmh1ZlBaK0tz?=
 =?utf-8?B?dWR1VUk2eGVKcjd1MDQ1Zk9lT3A4bmgrbmhxOEJGYk5jR0xMV3VlVE5QU0RR?=
 =?utf-8?B?cWg3T1poR3V6emZLR3ZFS0ZsWFgyWEtiVjBxWG5ULzBQVVJNVTVuZWVOYmp4?=
 =?utf-8?B?STJrSEhsd1htOUtKZXFkbDhYNzBjbkZzVS9zOWNtVlBHR2FIaitSTENMclBv?=
 =?utf-8?B?L25LSFd4WTk4eFRndzZjTkxFTXAwU1l1MVVaZDBpREJibGlhZktlUlA0cWEw?=
 =?utf-8?B?M2Y5T2tQTDY5MDZBQXRTck1wbXpNTjg4ZlJqZlhVQU9lWmtOMWF3SlhCeEIx?=
 =?utf-8?B?dG9PeFhveHZCeWd0NEpUS2N3WU5yOGxkVlVYcmlMY0dXNTBIT0NuMjhqL3cy?=
 =?utf-8?B?bTVmYjN6dWgyRnkxOTVLNHVMOTlZYXhvMkFlam9UTGUvaE5XNnpCQzN3Q21C?=
 =?utf-8?B?MFFFUWZBMHljdGl5blVDRVdLNVVsak9jQmtqSmJVTDkrOVNSZ0VPN2hGaVFZ?=
 =?utf-8?B?eUZ1Z1I0RHU3bW9VU3h6WTFWenpBOUtzbGtlOTROSHRsVWM3eld2M2JOVGts?=
 =?utf-8?B?RU90bmlWaVByOGhFNmQ2YmZUbmRpODhsNy9RZnBxbnk3U2xzeHpGMklCRTdQ?=
 =?utf-8?Q?JxdQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3poUzc1aDNSNjVldkNhWjl2RDU5YWp3SEprUGF0a3U3QUk2ZGR1dnhsZURz?=
 =?utf-8?B?VjdUem1KR2pLWHpCclVKWmtwOVdTZ1FBbmQrM09CYUZaOFpoSWx0aFZpWm9u?=
 =?utf-8?B?amFxbEtwblJKY2VQcUNUM0Q3K3FjOUNtbHE3WUVUYUwwTldBemlRWHM5QllN?=
 =?utf-8?B?dEtlNkZIV0V0ODFuQVBrVGNYYy9XNEljSy81SlRkN00rYnpjMnlvUGtmbklq?=
 =?utf-8?B?K3RJWDA1RWtVeFZYamZBVnFZT2ZKZGFkQ1hlWDlnY2haLzYyQ1lubmpJcUpW?=
 =?utf-8?B?U2gzT3FPam1PT1ZFSWJIRi81M2VxOHM1blRDQkR5V2pCQlN5M2pkbEUrdlFI?=
 =?utf-8?B?REtRUUpTZ2dzT0JnMGdVNFUxZHBseGk4cXV3Y1o5WUVOREFLZDdsV1lYOVhX?=
 =?utf-8?B?aGxpL0Ntb3BHbXhTY2R0N2VHd2RGYU0ycnF0SzltNXVONGhnVG4rZGJrK3Nx?=
 =?utf-8?B?dklHQnpXUUcrVWVoVThwZXlRU1pxWmRCU0NqRXcrY2d0VEVnNDdUUmtUeStV?=
 =?utf-8?B?UGM1WGcycjdrT0lmWWpzQnMwYkhxVkNZeTBoNVlTbkpIOTRRNmxNa1lZQ3lG?=
 =?utf-8?B?Z2ptaEQzUUlNZGxVZkRMUDVORWFEcHE5VklyODFmNHN1enViaW9mNEFZRHhh?=
 =?utf-8?B?ZmJPUVBQbUVLankrS3hRMTQ4VzlCNWJTWEtQQkttNm1SNXBzNUEwTzdKMVha?=
 =?utf-8?B?Q1lEMllTbjhIQSsvd3BzVm5HeXg1ME1Cem1FM1hFV0VxbHRMUWhNQTFrMnpG?=
 =?utf-8?B?VHBJa0l0cDJwcVh4NXhDNGtyL1RSNktlRWZlbjNLa0RESE41bXA1T2pZZVFG?=
 =?utf-8?B?Rnd6bHNPNzlMMTZXWFdiSmtvVUZJbERCNmZXbXZnT1RaRTNjSXhwTnFENStE?=
 =?utf-8?B?RGh3OC85UWRnSGlLTHBlbkY4YllQT3dCME5EMDE1cnY3YXQxY2phU01MNUwr?=
 =?utf-8?B?OG4wVURTVm9qMExKeHNWMnRzTVNBR3NzczVJV3FYd0RYUW1LWHpYOUgxV3VE?=
 =?utf-8?B?OWhKZGZOeDN4R0tjTDZDbVkxNWRFNFVxNGFXTXF6M0FDNGFnazVWdXoybllL?=
 =?utf-8?B?WUpVOVp4RnBjMC9QRWxVTG5QQkhlam5RRmdhQ3RnMWwvcEF2eE0zZjUva2V1?=
 =?utf-8?B?Sm92cmswODk5QmY2czBxMDh5cWNQTy9oSkdaMUNSdWdQSVJDNW9idmtWRHlr?=
 =?utf-8?B?QUd3ZUJwbHVvMnEyOGJWWFE2QnR2dVJISzRRMzF5Wi9XTjZlK2ZmdmFEOEdT?=
 =?utf-8?B?bjJRbmNqOHErNnlmbm14QTA0MWxiY0tvUmFuNUh3L1drL1JsMTRmanlna0lX?=
 =?utf-8?B?ZmdHZTZZd3pZZThzMDZvTml4SGFLQ2FFd3dMVWcydVI2NEVvTGwvT3pEOTNh?=
 =?utf-8?B?ZThSbWhpalNMVFhDamhOUzgzZ0NONTBpSFBBMkdwY3hXRHdadXdSY1NOQVhE?=
 =?utf-8?B?N3Fxd1lWZEZidVo4WGNLS2tpWDdPQ0U2V2gvTXg0QU5jWGlNR1lxb3hjMWZC?=
 =?utf-8?B?NlJabjl2ZzFqM2pXZFFGRGtoRVcxV3pudFY4eThpSFFiZ3JRa1pRandBN1l1?=
 =?utf-8?B?RkhCQlMxeHRPQ1h1emVWTDhkaU5YaHFZakhHc29qK2VkdWo4Q1p4S1ZQN1NS?=
 =?utf-8?B?K3RXMk1YenoxR2JPeVl4YWUreGhGZXMwbVJLWUdoS2dvNnE4Mk41c1dla0Zt?=
 =?utf-8?B?QUphc1IxMC9iWmR0MG5wSldZZ0VuMVJmY3JFMGFFNzBUb2NNWXVoZHVDSXUz?=
 =?utf-8?B?aHpnaGpKTjZveHpma0NzODgrTXZXSHZXOEZtbzRKU2pSTVBVRnNBMWdzbG9M?=
 =?utf-8?B?ZVJXQllzMUhQUE4vbklnUGFDcjJJb1Y1eUN4NVRwV0Q4Z09LTnR4UUJvMTF6?=
 =?utf-8?B?dE5CVUp5eWR0K1BGNFA1TVBtVURRdzB6WEZGZmpnZmRMajk0UHBXRmlTZW5U?=
 =?utf-8?B?dFZOQjBqZElYRi9OZGtLU2ROYmdyNmEvSFJEL3FweWdCN0xGNTBOQk1yOUIx?=
 =?utf-8?B?Mkx0UGxHY2FoRUExUTRRMm5KZFZwYitGUWpIeVBaT2VlZkh1N1RaeFAvdVYw?=
 =?utf-8?B?dWFJbjBEbVp3LzFSYWdEOUdMcjNZVjlnMklscmZrZFk0U0Q5V251TWdDMlhT?=
 =?utf-8?B?R0N2dEllSUM4NDJVOTR4aUZWcCtNNVU1V3piV2lpK3JZQmNQQVJqYnJ5M0Yy?=
 =?utf-8?B?dWFNYkZyYWJiR0NwYnV1cFVSQXNCL1RJVGwyNDVveFRTYWc1UzhwaXk0Vm1z?=
 =?utf-8?B?ak1RUUFYRzYrekhmNHpwemRVZEdIaVowVWFNQ2FFc0I5MXFYNE1wQjJGMEJM?=
 =?utf-8?B?ODJPVHdGenhPbFlMWCtxUHk2K01maDNxVUZEc0p6RDRZZ2JyckdzZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdfff803-0c0f-4192-22ed-08de63e2f1bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:45:50.7019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SUC8vhDO80niDhIhXHASvG4LZYVQNkKLKNcoy/Vt8ePDK2ZNWz4E9iR5uRDBECTcAnAUqWxiJT3cct4U4plzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146
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

Hi Karthik,

Thank you very much for catching and fixing this compilation warning — I missed it during review. I really appreciate you taking the time to clean this up and keep the code C90-compliant.

Thanks again for the quick and helpful fix.

Best regards,
Vitaly


On 2026-02-04 00:34, Karthik B S wrote:
> Fix compilation warning:
>
> [1611/2036] Compiling C object tests/amdgpu/amd_jpeg_dec.p/amd_jpeg_dec.c.o
> ../tests/amdgpu/amd_jpeg_dec.c: In function ‘amdgpu_cs_jpeg_decode’:
> ../tests/amdgpu/amd_jpeg_dec.c:201:9: warning: ISO C90 forbids mixed declarations and code
> [-Wdeclaration-after-statement]
>   201 |         unsigned int ib_dw_capacity = IB_SIZE / 4;
>       |
>
> Cc: Tessita Thomas <Tessita.Thomas@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Fixes: 020b7f0da24d ("tests/amdgpu/amd_jpeg_dec: Add VCN JPEG IB alignment")
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/amdgpu/amd_jpeg_dec.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
> index f0876bfe1..81638bae0 100644
> --- a/tests/amdgpu/amd_jpeg_dec.c
> +++ b/tests/amdgpu/amd_jpeg_dec.c
> @@ -170,6 +170,12 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
>  	uint32_t idx;
>  	struct mmd_context acontext = {0};
>  	struct mmd_context *context = &acontext;
> +	/*
> +	 * VCN JPEG (VCN 4.0.5+) requires IB size aligned to 16 DW.
> +	 * We pad using a 2-DW NOP packet, so the initial ndw must be even.
> +	 */
> +	/* IB capacity in DW (IB_SIZE is in bytes, divide by 4) */
> +	unsigned int ib_dw_capacity = IB_SIZE / 4;
>  
>  	r = mmd_context_init(device_handle, context);
>  	igt_assert_eq(r, 0);
> @@ -193,12 +199,6 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
>  		send_cmd_target(context, dec_buf.addr + (size / 4), &idx);
>  	}
>  
> -	/*
> -	 * VCN JPEG (VCN 4.0.5+) requires IB size aligned to 16 DW.
> -	 * We pad using a 2-DW NOP packet, so the initial ndw must be even.
> -	 */
> -	/* IB capacity in DW (IB_SIZE is in bytes, divide by 4) */
> -	unsigned int ib_dw_capacity = IB_SIZE / 4;
>  	igt_assert_eq(idx & 1, 0);
>  
>  	while (idx & 0xF) {
> -- 2.43.0
