Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0344C282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 20:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC7C10E4D7;
	Mon, 10 Mar 2025 20:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u+WzCbcA";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0289510E4D7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 20:05:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bP2HTxv2KAof+dqrHc29GHkvRG9sI0TUELLggSBK1rnHk4/gZUFkwFXjUu7mqpziXTMjHFHVWCYPtTDiNL4P0r+iPWEqzD/i9nhLqpFWjmIK5tam29kq1vv2QAxCaoTA1s0voArgwNnVQvHtiHWN3ltWl+YcBhOTic+2tSXRu0vYPuqIVaOevUmfaxq0WIKdeEMKkAYiZHM1pPQpavxKU1kxaFifufFP3elZwgS0mDl9CtMiGhTuN7nQoPGNqZ6y/8kD7TZrzcpdyPnh+I6M6lIPT2HIosSewYOu21LDIal1oSRAYlFmWb0x7r9PORK2ehQ7A//wPPE1A0F3xK9b9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtmXE8xXrG90sSVgFLMC+fT3if0J0GpCGmg46BHHegw=;
 b=CdZUMHEwK0cxcoOUtOBp8LaXDgLkaYfsYNFh2f7AE0VjnWVgTXIuso264IgUr+k4XFAlAHBXVJO05cqhzQ+ooa00uKDMRNaH5AOTmkkCNnzH/fDh4aHQvdP6UgFSq3Kei9P4Ry+f0vRJIJyAQuPB6egO5Y82ChqcU4CYt+HJqZFF3K2uZ6i2HVfv7W8N9goKI8wyGCW41wndnGj8Hzem0U4n9tdfsmRPBWJbe05KPiCguek/ZdRCwJ3DXw2QjcOre0m7lEm0+7zkSTVjeBlrFw6hZgMPEC7DWs+k3H2B9MM4tYMi0pyqHBTyofIeYYtcjHPj470HV3cUhB4tVw9sbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtmXE8xXrG90sSVgFLMC+fT3if0J0GpCGmg46BHHegw=;
 b=u+WzCbcAv6gWpCL8Be8K5eI+3ArL6uERal/inB7sZ8sanN8u1/rEAks3LP2Z9F1Gfcdxh72Gpsc6AICsuAgfsWIDeguHu1Dlr5K0pPTkJCYHlxOiWzudn1ngGmyikY2knCinraKZEFC+Qwxz/NkgiUO3b1DBIoYdlP9KQq247BA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MW5PR12MB5623.namprd12.prod.outlook.com (2603:10b6:303:199::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 20:05:55 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 20:05:55 +0000
Message-ID: <7992ba86-f665-469b-907b-89f1057a7238@amd.com>
Date: Mon, 10 Mar 2025 16:05:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 i-g-t 3/3] scripts/run-tests.sh: Add support to
 kmemleak and igt_facts
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
 <20250307093426.90479-4-peter.senna@linux.intel.com>
 <0ed20d8c-532f-43f2-ac16-82866b641670@amd.com>
 <58d922a6-d24e-4b2c-a3da-1de97e2b065c@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <58d922a6-d24e-4b2c-a3da-1de97e2b065c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::9) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MW5PR12MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: f08df7e1-4c95-4430-858b-08dd600ef6f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFlKZXJadXFtelpBdFNqZzNnaXhlYzRkWXpNd293UlJBemViRlY0NC9nYi9p?=
 =?utf-8?B?OFpLOC85bzYzV1Y2cjM1U2VQY0pxcC9YUzdpMnBUS2VGTVpLRFNFSWc1dWwv?=
 =?utf-8?B?UFd0eFVPNGRidWJOenpmQnhwY3pjczRLc25RRlpmVHUxL3crT01uNHhhSTdZ?=
 =?utf-8?B?dHFwQSswQVQ2cC9YSENRRm4zaWZNbVBYLzd3bzF2R0l6N3huMlBYby9hdVZU?=
 =?utf-8?B?VlI4VnowNlpuQzlzVUZ4ditYM2tsaEtwd1dLSVRRbTFZWHZtMVlDcUFaRklL?=
 =?utf-8?B?RkxrZ0E0OXpRUDU5UHRBWEN5ZDNKS1FrakMwQWJUSEUyQ0daYnYreDhTcHo1?=
 =?utf-8?B?MzNVQVlrU1NIYkF6RFBBM2lEMXZoZXNqeXBwc2NTQjVxblVyQWQ3b2Fhd21P?=
 =?utf-8?B?TnVwdk9sSFJMdlVnK1lnbWQ1WXZlekViTHRPUjZ1aElkNmZadlFwaGNHQmdV?=
 =?utf-8?B?Zzk2OVd1TDFIZDIrZVVOZ2lpZElIZkwweGlJOXkzcW5iMjZQVFRCV2lRMmFu?=
 =?utf-8?B?d1k0UTVPM2Q4S0RoTVZpcm45U250TTJxQkVZWmkrblloem1wQ2tJUElQRWhL?=
 =?utf-8?B?L1RKdEplY2F6S29zWStRQ0t5K2xEcmx1dXVYUmxlMXBSRGtsYXpvSzZWYndw?=
 =?utf-8?B?TGJMNUZab0lUQTR5L3VEbFpodTEzQzBXQ3ZlRTYyRmJJRmdYaklWRE1SZWh5?=
 =?utf-8?B?U0o4MWN0SmVpblA2VnF2cTRxRk4wZndOU3d6WnptTGw0QjB5Tis2bGxTZjZp?=
 =?utf-8?B?T3gwVVZvY2tzR05rZ2dSQ203V1BtSnFiSklQeG9ycktGSCsxRm5XTE5YVnVk?=
 =?utf-8?B?Nk1hckNQM1h5QUdZZGFTQTU0ZVp1a2MySXJPLzMwOWVXcGcvRnh1MGVQZnJJ?=
 =?utf-8?B?Sm0wdytWQkR0c2d1VlZ6MUd0RzZrSW9qN05WcExNMmRFdjU0ZGV6T3JyeDBm?=
 =?utf-8?B?RHlwSSt1d1Q4RVFRV2ZMYnRRZUtiQ0ZsSnd2MlVzT1ZHbDhsbXdhQS8ybzdK?=
 =?utf-8?B?akYyKy9HZ1dqaitOcFZFalo5eUhQOS9QdTRpMVdIOHlGTHFMUm1WaTdteGJr?=
 =?utf-8?B?UDJ6K1BwNHZwZ0RiYjFSdHJmdFZEQysrKzdsVlZuMUhFdE02RFdENVB4QjY3?=
 =?utf-8?B?citQUVc3UHhBU2pobTFndWRORForS1h4SlVaUGxtOU9hTHpzamFJTmczWXZq?=
 =?utf-8?B?dVRVTkJQN1NZRFliNXRMdms5TG5PM0dwZWlRVUNCZUdSZHFpaWxPcUx2dHc4?=
 =?utf-8?B?eHAySUpGWUdHWGJQV21OOVA3NENHL2VXOUN1Wkxoc2xPSUVycWxvZlhRZ1pr?=
 =?utf-8?B?eEVxbC9PVW1KbldsZTU3TEFHRFBIV3RlTG9uWkxQdUkyK21TSWZoR1BPcWtv?=
 =?utf-8?B?V0lLbkhYNldRMVVXeGlJd0NGM1VnSjJiSVV1K2hKZW5HUitVczRxRGJJb0lE?=
 =?utf-8?B?NDY5TTlMVUYzdXcyOUpFUWZlTUx1MzhGYi9PYlFwYnpsK3hScEExY0I2azFz?=
 =?utf-8?B?YVFqVWplOGdFMG5ldHNvR1QyS00wVTJ2bDh1S3kwQy93VEttbi8rTFp6Mmhs?=
 =?utf-8?B?UUtOem5lUWNrV2QvTGxyWGduWUI3NXBIZm5JL3Q0OEM3YlY5SjE5VFFGeTVD?=
 =?utf-8?B?bVpoRHBZUHRrRmZBbW1CYVdRSzVqT2o4K1JYMkFsZTdFellYa0xVUVJZQ2Ur?=
 =?utf-8?B?dnNaUXNqUmVEM0ptd3R0VnZTOEpmY0VWbFdLd0I4amFQUTRFR2NwR20yRnFH?=
 =?utf-8?B?ZXoydFlhS0pwdDU1UStyWjB2RW9TS2Roamlpa2k0TkpreHVnRmlHOHJXWHVQ?=
 =?utf-8?B?Sk9pMmtZeVFSNXZoRlVrUjVnNW1lUys2SGxOME1vN1NkczE0bXNESThKd2x1?=
 =?utf-8?Q?zt+S1oIrx5Wpw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVlhUFhaNnV3Q0VsSmE1WWRaNUh3NU9nK3JyMzhOTHNidStFWUhKNHkrNi9B?=
 =?utf-8?B?SkVoUDRDV3orZWE5WVhoUmRZTGQ2VjJPMDA3M3UvaVFQMEdsYVowSVdSN2hJ?=
 =?utf-8?B?YXNQMlZrQjUyUXk3dW5NREpjUDJOaEROV2daR0NxTHArUy82WmhWOWxhTFhk?=
 =?utf-8?B?K0NWSTlKcDNhQTQ2QXJVVFdzRXQrbmNGVS90Q09DR0Nrb3I3RGlCZzVWbWhk?=
 =?utf-8?B?OGhGM2NPY05GV0ZJbHJkNGs1U3JWYUx0cGlwdGpubE43L1p3elBWblJaaVhv?=
 =?utf-8?B?bkxTd0VNZHF5T2ZRTUhhRyt2dUdDMDV3MlJUQ2JwamZqOXVPMWV3MGRWRWZi?=
 =?utf-8?B?SXZuMi9zK2h6QWFjUXhPdGlKcHd0VjE3MUxwUkJsa2VsbHdYcG1Jd3NNdDho?=
 =?utf-8?B?VE43SDBmUmRtR3dzTkhPRExxaVZYN1lQV2RZV0VJd3krZGlrOGxJOUxpV2dh?=
 =?utf-8?B?aVZDS1hsNzJWYXF0b28yWHB0SDl1Y2RpQytDdnBwUEdjZ1hTZE1ETloyR09Z?=
 =?utf-8?B?SEdoTkdEd0VjZkN2ZEI3c1Mza3M1Q2t1aUIyVEZ4clJjdFFsVG9UMVYxWWNY?=
 =?utf-8?B?QTk3REMwY3A5M1lDdzVmQ0l5Nm1laUNyYmMxbExBZENkaEJCQU5id1JCaHBB?=
 =?utf-8?B?bnhSV3hMS29DeVg0YjlPbjRYSTNYUk1xNEVVQnEwVzV1WHR1Z25jWDRZUFlj?=
 =?utf-8?B?eWhnRE5veG04a1lEUWpvbG1DUjFUTmVib3VzMjVFL0lIMUEwNXU0TXFBQnlQ?=
 =?utf-8?B?L2UxSlpkOXRWM0tQNk8ydENveUE2bU9Gd3dOV1NIUTVINVU3ZFBiaEthcEQ3?=
 =?utf-8?B?eGM1MHhWdm8wd0hRMzlxSTZGempEWWRjVXppYlVBUFJVcm5Kc0RNLzRwbmVC?=
 =?utf-8?B?blJCVkxIMXphWFI0ZTVTQ1JScEJOZHJVeFZMa3hiUk9paEJEbDZtOXB1dHB1?=
 =?utf-8?B?Y0pZSHRHcWIzQWNrakRNUGJTRDFmckV5bGM5QUxBQVBlRlY4TjZ0YTB4MmIw?=
 =?utf-8?B?bGg5Q2hUVnlzMHBSaWxwMFJWUHlEclpZSEdEbFRSRXFDSTdOWjNESmcxRzY3?=
 =?utf-8?B?N1p3SUtpZ1NPVEc0QUs0eXNSVmZXYnVDZ2IvTzMwRW16dzI5Ym9kazRIQVNr?=
 =?utf-8?B?dDZXU2JnWHhYdWhkSkRGdmdXOVM1RnNmbGQ5RXN1SWlRUlFwZ1BpVWJ0djBD?=
 =?utf-8?B?RFZacmNmZW9od2VjZHM5aE4xY3lHc1dDUk9NS0Q3MC9xZFJYTGI2Z0hJa0FB?=
 =?utf-8?B?Q1c5alkzbW5lcEkwSUczRHlMZkdMR1dOYlNpQ1E5MWkwSm45OXNEb0o1emNH?=
 =?utf-8?B?eDBGa3IyWXRmR01wenE2NXhyUE5FdWhBRC9Ia0hFWTE3UmR2M0RLcTBwQmNY?=
 =?utf-8?B?aTZFYVJIeCs0SmE5c1dpbjN3YzM4WktLNTJIOVFjRTdWc3BZZ3k1clNIUTF2?=
 =?utf-8?B?dnE5SERrS1ZSMDFIMVhxRG1BS0lRVkxxd09xMWIxd0UzUVZYOXpMVzRQQzQv?=
 =?utf-8?B?NWR3eVJMc3hURkJTNVhhV2VOaWRHSDB5R3JGYm9Ra3kra2x5RHJCWEx3NW52?=
 =?utf-8?B?ZU9ScllkdUpsVVV5c0pTNVZnSnZsMEErYUdhM0JVTG9ESkIyN1g3czk5bUxj?=
 =?utf-8?B?Y1RVcW9aQ3V1Z1hnZCtiN3dZUEMzcnkwbzFiRy8rMFEyZ3VSVVJVY1hUUkVy?=
 =?utf-8?B?azR4UjRnVGgyS3NrTFpoQnQwWFBJSmUxdTJKWm1zayswbnVVSGpPMTBxV3pt?=
 =?utf-8?B?SHJocmZvVXZtaHdwamVnU1VocnJyZy84aGVqNWpBbHNlRURadlNzVjJjbUQ1?=
 =?utf-8?B?bUo5WnNzSnF2dFpEMmVPdDUwQzdTalg0Qm1BNWxPbGVQZzJqbFpYenU1Ym8v?=
 =?utf-8?B?YUZNRys0cEdENkw4WWhMUzBHaUQvWEdGKzArdjZoMlN4b1Z2UnNXSEdiSVNI?=
 =?utf-8?B?M25tNHZNWHAvaXdQQlZHeTA0aVNZbmxRRmhRaHRLWHFIaGdBL0N4Ui9GYlJE?=
 =?utf-8?B?WnAvUTJMNEZIVnNVRXJ2bWZaYTQvVW1KbFdJc2o3MWNSQll6YlREbTRqY096?=
 =?utf-8?B?N3kzOUJXRXo2K1BjWGFSckIwZ09ZTUk2cTNrSkIzNEkzaHd0ME5yeW4rcFZX?=
 =?utf-8?Q?Y5UWJwBYprf/ulU6HQYzkFNIa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08df7e1-4c95-4430-858b-08dd600ef6f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 20:05:54.9526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKSy9LhFcuc412sIhg0bf55we+GTCB/0YDom+sDB/Cstbc9eagFJxF/tm7zFvphcVTy2uD4pVPaTZP9YGxgDgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5623
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

Hi Peter and Kamil,

We'll run the tests and I'll follow up on this thread.

Really appreciate you merging this—thank you!

Best,
Vitaly

On 2025-03-10 03:07, Peter Senna Tschudin wrote:
> Hi Vitaly,
>
> On 10.03.2025 04:07, vitaly prosyak wrote:
>> Hi Peter,
>>
>> Version 8 of your three patches looks good to me. However, I haven't tested them locally.
>> Let me know if you’d like us to run them locally ( not CI)
> I ran local tests before sending the patches, so I’m confident there are no major issues.
> That said, if you’re able to test them locally as well, it would help confirm that
> everything is working as expected. I’d appreciate it if you could run the tests.
>
>> Thanks for the improvements!
> Thank you for reviewing the patches!
>
> Peter
>
> [...]
