Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D8BE63F1E
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 05:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E284E10E090;
	Mon, 16 Feb 2026 05:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MwwzkOET";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010027.outbound.protection.outlook.com
 [52.101.193.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D7F10E090
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 05:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cucs4IFbvnooBBDRNdGws3887uqjPmeNK+UOQiFfOtlK9ixT0eivtMikj35VooSQWHpjbyJWU+eEw73t8UsJ30TJlrwMQp6GdXE6RZbq5ylpOhSxb4Mt/n5aU82cCyay3KHZW6KDsz3eCIDAX/DtBTtN4EJZs9O18Js/ywhRHti8JlvJb/CtznzS/qoEFtu6X3aXUgKyk71BEmR8gT+Ht5CAaXw9Rka9/pFmEP4Rpte1dE6QYV0Sr9JpxMNzEa20YoKchhU3Su8jOnPTdETh3tiod/LKqcfXpt94PdRQwUCbQJ0A2izjYQjt+18hKlmcrn+ILQDpAOmPHGgadoDrig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWh9SlQFuSZ5JLLVwJriQK57ZPwVSEzWGV/qrN1ldOw=;
 b=h0zWSAP43GQOuGMLBtesS0aLgvUcxFttEWJgbOMAAY4gWsW+/F9lqmFLsAoys4Xm3BnIzTOwxb3uPu5vBmY6Lj26zRfDlzc+aa1eoJelHQPbZh/7R2wA/sZ9E9lbCqEmq6cswovYsn/20ngstcxoE5ZgZOaSHXSQUII8visO+iFrciIPyODP7ZcsEZDyih4HyP+cpJsjdZk7VtXvaRGdd/JGJlxM3qLSIw5uA0eHUSldKl4U2xQigDUq8r4y4sfFlbG5Y8V7AilmuqEOrbvreQ3PRq/ZXSX0fAvmAUblCpjzsCB/O4IVRXBCjPd9at8y4Z+NYHSABzsdshIk4uv9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWh9SlQFuSZ5JLLVwJriQK57ZPwVSEzWGV/qrN1ldOw=;
 b=MwwzkOETbdPe6NHlKY0EcLBy6XYags8jMeLMrVGRHVDtiw5ES2GI5/nlZtjiqMo3m1pkJPxzgREXo/7MBOjtPyalUlXrwYiFHlnVYZh1cgeX2hDw8DI2uqfshfw4r/lQmyVC0BJxkEf9fp64Dr+xubM6DlOSXQ2XiTUHUWzBcCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SJ1PR12MB6172.namprd12.prod.outlook.com (2603:10b6:a03:459::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 05:39:45 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 05:39:45 +0000
Message-ID: <942d5fe6-c890-4f97-8f13-254b9fee42ac@amd.com>
Date: Mon, 16 Feb 2026 00:39:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/amdgpu: support FWM packet in user queue
To: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>,
 igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com
References: <20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::26) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SJ1PR12MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: f64fa052-60ce-476f-c6aa-08de6d1dca80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGU5b1ViMkQrVzhXbitzeGJtTWhKL0FtYnFYR1QrTmF0NFgvczhwTU9rem9T?=
 =?utf-8?B?ZytJLzJHR2xQZkdiUWJxVWR6aUN2eDNjZmQ3UnBRM0hZbXQyQTRPdHFKRXZy?=
 =?utf-8?B?VUdDVWtQRTMrc0lIcUtZRnFlYm1wU056SzJzdTllMFVKRE1OTldpbmZKQXdy?=
 =?utf-8?B?T3dHcm9NdDNsK0p6TUgwK1RJdUM3MDdKNUJFdlkxZzZhQWxkWDBFb0xyVkNK?=
 =?utf-8?B?M3dNSWtDYUsrSDFHT3ZuZU1BS1VYQXA4S0cxN1dJNHQ2b0thMUJUMyt6OFZm?=
 =?utf-8?B?RDNLdUJFZFRYWUZZeFNHV0Y3eWY0MU5zZ2RSWFVnTEZKeVdaclQzV2lIN1p6?=
 =?utf-8?B?bWZKUDFXeThNT24xWXhXV29XeDd1YjB6cnRJbElhYm1XVUQ3cGtmNDhtWmly?=
 =?utf-8?B?dXJya3Vsa3NjUGRtamF1N0ovdGFyaENES0NWV1FvK2Q4V09NRVNpekNrL2xK?=
 =?utf-8?B?QTNIU01QaHFDcTAvcjMrcTJYbmpFUmh2SlMwbkVFT3NraGtnQk1TN0lCY0JQ?=
 =?utf-8?B?SWlYN3VWK21xNENra0pIeTBUcDBPRHpPK1BqUC9NUFZvSXBEa2svaXRraDRx?=
 =?utf-8?B?VDI0OVl1Q2tlN28xSTJRanJrVFpmaEUvZzFrdGppNHFNWEg1b1pKK0U5c0xW?=
 =?utf-8?B?WVZSNTY3TVNibDdTbFZUOFdtZTFtcTBmelVyMjBvZjNnOUUyM0M1a3FaaHp0?=
 =?utf-8?B?THlvS3lpdjdsMnVxOEN6ZWYwcHBrb0gwWlA5SUEvM1JxbERTandJNldjc1hU?=
 =?utf-8?B?VERCM3VNd011VXFrTHhUSC9IRU5XeGx6dDYzY1c2b3VBc2wvYXJGVXd3RjNt?=
 =?utf-8?B?Q05wMVJoeUdrYlBsNmFDQTY0ei84QVlhcFJpcDY0VEE0Z0lrMHJ6MTgvWnQz?=
 =?utf-8?B?NktlS1lGaDRUTG1yVWsvWUJNL0NFQmJYb0NGbzZDTDNvRGEzYVZzMk0zYlB4?=
 =?utf-8?B?RGZxNzhjNjRObkpObTVONE11Smx2UDlOTWQ2ZlBUZlVKaGtHRk5meHgzdkE1?=
 =?utf-8?B?dmhKZ3A2aTliRTdBZVFhc0Y5djV1aGt1b3UwRTd3U09ZTENQL0ROeEFaTWpF?=
 =?utf-8?B?Yk1jNnZzTVFaR0p3VWxqdmM3b3B3ejN2RTN4Mlc4VG9pNExscElPZ1RhSTRu?=
 =?utf-8?B?d21WcGNTS3VYMlFvUDlOQ1M3NUJiL0dhSmowMGZNY1Y1eUhxU3VMaVZOZkJv?=
 =?utf-8?B?VUdEU2RGRU1DdzF6Wmc0TE9jbHFZNVFWTS95aThxRmNrQzJnclM4SGhmMk40?=
 =?utf-8?B?dkY4SGhHVjdUTEpuRTlSTVpmcUJBakV4VHdVOEtJZjhNVysrMXIzL1g1VXBE?=
 =?utf-8?B?WTRoaWhUSUUvRTJQRkFaTnNNSHBUSlA1cHNOcC9LUkhibG9MNmtwQ0phalo5?=
 =?utf-8?B?WlVLS0kvcHh3MWxPNWRjdTlrZ28xTk5hZmF2NWlkKzZrc1RWZ3A0djU3T3Jp?=
 =?utf-8?B?QWs3VWdabkNZZ1duSXExdlJFekJZSkgyTFZSdEtRTGZrckNUNzlrYys5NFJU?=
 =?utf-8?B?bmw1VjNISSszSDZsbWNSVnRET2dORGNSY21RZGRZdEVUaVpFaXU4WEFTTzFp?=
 =?utf-8?B?cWhvdGV0Vkoxa2hjQ1o4cTFxemxCZ3A3OVRzMGhPNXNDRmoyUUNSdWdXY3Nt?=
 =?utf-8?B?bTJHR0E4WCtVNDZoQm9MbFR4QWdlTXNHaUo0QzIzMURKaFVtNjlaaHdmTU5i?=
 =?utf-8?B?UFc3RzNhbFo0SVpoSTFWT21VSVZ2NWlmK0pkVzNXL041TDIzbHh4NXk3YTRH?=
 =?utf-8?B?UWU1cDRvaDI3R3FoVUJHNzZrWWdzd2drRCsvS2tHckF4NXM4czlFNkN2Q1dD?=
 =?utf-8?B?SnZGbXhhbGc3ZHRiVGcyZmtMVW55eTZ4SExPSjJiVlFwa2lKekI1RWRoWWJC?=
 =?utf-8?B?VllEa3p3eDVFNTdXNmdYREJpNXk2eHh4K1l6bUR4bEZSQkdOckpoNVRCSS9x?=
 =?utf-8?B?Sm1mZ3loV2Z4blhSeG9WMy91WjQ2OWxuYzlzSmw0c2k4VkJ5SE9BeFhWcGta?=
 =?utf-8?B?cFhQYXhZS1Z6d2RYa2dSWWRYeWV4dk5Ydll5bmxIa2FqK0g2UFhYRW1mUjUy?=
 =?utf-8?B?MmhYT2xpQzVDazRFenJzdVB0T0ZhWU9DNUE0SkpWOExLNi9FVmJGSHVBbU85?=
 =?utf-8?Q?XtZ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjNNYjRxYmNTK0xzdlB4dHZHcE1BdXVjU3U1Qm5yVy8vVFJwaUpmM2Y2QVE4?=
 =?utf-8?B?YlJQQjlBOGdWR0VzTXFGMlB1L1FpbU9FSGlCWm9mT2RqOXpTM20wSUg4MFhR?=
 =?utf-8?B?Y1FJcEd6blNQRjl5TThaUUs4OTNLek1vSm95TFJLbStUUU1POEsrV2tnNGFY?=
 =?utf-8?B?US8vOXRUMFBnRFVUS0dpaXAxeGpZVnplcEtqVVdRM1I3MWtmdm5tdUZSaUhG?=
 =?utf-8?B?clFCMFhoSlUxMGhyOURjY1JCRSs3MUI5RWlGQkNJaDVyQXhTczJtQWpJczRM?=
 =?utf-8?B?V3FUNWlHblZlb016Ui82cVF0anNkZnZSdXZNRTYxNFpjc3QvaENWOVZEQ25I?=
 =?utf-8?B?bjE0SjNNcjJ3UUdhMVM1NUJqbkU0TE1uOG13V2FOUm9MYUJreTRUbnE3aTl4?=
 =?utf-8?B?UldhWUR4ZDJoMEtYelZITHJUVGRxYWNSbEtaQ1dOckZJeWJZWHhJeVg3YnNk?=
 =?utf-8?B?UHBVWks3Zmc2S1BVM3FBSEVhQ3Q2UUk0bHo3QkdrOW0yRkxpdmZ0RHk4Y2pC?=
 =?utf-8?B?WlJGbEx1SitSM2wvdGhXZ1BDcmhOQTkzYi9COHNWWCtrUmZ6WFVMYTdiV1pk?=
 =?utf-8?B?TllxcFFiMCtzVzhtNHFFVGhHOWtaRjYrMmgrakhTZ3VVZm45R01JV3lVODk4?=
 =?utf-8?B?eXhUSUJhZ1k0aVNWZUh4UjFYSjdiTERBMVRScWZDazVwNG11YW92TlpWYlJK?=
 =?utf-8?B?SnhYQXBTa0NNYmo4b2FUdmZ2QVVkSnFxRmFGZEk5MmNiMXdZbDh2anJER21h?=
 =?utf-8?B?UFRUcWZ0RnFnREh4QUdhQkVyYlBuTUpsYlFFTjZwVFpwa09FL3VkRmtBa1hI?=
 =?utf-8?B?ckFLYjBrWk1oRndwM2t6bVN3cEdhdVJnaHFTOGZ4bTh2c0RBTGovWWVhNVpK?=
 =?utf-8?B?TG91QnFuL2puY2FTRytkQTFtajVrUEJGdXp1SS8xQUM5d2N0bHQyUWhGTDdE?=
 =?utf-8?B?T2trUG1URGNHSXBleGZQb0lEUlFXa3ExZ2hJdlhzYitFOUtsNGxielhGeCtC?=
 =?utf-8?B?djVtM05FWEh6UlpoaWdUamlKOURZWjFWZnl1TjNHaWVGb0FxYkl6b0dqMTVw?=
 =?utf-8?B?Qmw1Y3pQZi82R2dDZ3U1NXpQam9lZDVJSWRHeFZ5VXF1SmVEOUNvOE5NNlF3?=
 =?utf-8?B?WEE2elB1c09nZ0tTR2hvL1JPYTJNbjBkZTc2dmxFdHdMZ29Kdk50eHhSY08y?=
 =?utf-8?B?S2toODJHVmNVUERoVHI2VGJIU0JSUEw4T2lBZXVyTDFaajUwNVNjYzl1Riti?=
 =?utf-8?B?QTdhV3h0RndDcVJ1ZVFKUnhKMDN6RHhoWVlZN09iZHNFK1g1QWlyaGJSa0kw?=
 =?utf-8?B?VExFb1o0dDNZdDNpNytpT3RMai8zUFlsaDlxTFh0eDhNZkZOU1pnQXVEUm1r?=
 =?utf-8?B?Y0tQdkFQL1hFQll2WkxSM2hCOU5iTjJsQmUzdlpwdlhTckw1cTZYL0lBM2lB?=
 =?utf-8?B?L0VTYXExUm9ndFRYSGtyY1hQQytZWDJLeHUzWTNUcHVzekVWdHdSNWNDZzRZ?=
 =?utf-8?B?V3ZqZmZoOTVWeEcrdWV4Q3dOaDYxcktxN2ovR1VycVdpT2gxNDFGY1J0ZHIr?=
 =?utf-8?B?ODhLaWErT0NncVBZMlNSM3MvWk9waFB4SUdqRGlJNmp5OTN1NEo4T1FaQnl1?=
 =?utf-8?B?ZitzUmx2UzNsWi8zYXVnRU56aHFuQTFjeVZZd1dtRHZpNzArRnhKRWphZWpN?=
 =?utf-8?B?R3d1anhBUExCUkdtUlM2SGJLQjhsODhuSVN4bUZBczhCUVBLY3Z2MytQL3Uw?=
 =?utf-8?B?dHdkNnd5eFREU3dSYzN3b2FxWEpxOXFZNG1nT0FpOE1jZTZ1dEcwOWg5am1O?=
 =?utf-8?B?aVd2b2MrSWl3LzQ0TjVMNGxlVURVUGJpMWZKWStJRlkxdlBNTjRtYUpJbVRq?=
 =?utf-8?B?YWxkREZRUm5vNkpIVW1PS3M3anhKRzRiclpkRmtVUmRjdzIyeG90M1p5bENv?=
 =?utf-8?B?dTgwWU1aRXNhbG55Y21mSldvbUlucG1BZ0FkRm5yUEhGZ1FLM3J6aTNJb2dG?=
 =?utf-8?B?M29hcldGd1paczhzS3VsMlk1bUtqK001clhaNmtsVWFjOVVDZXhESDVibW9E?=
 =?utf-8?B?MnNTYkJNNGJuRGFnbGw2NFlSbE9xQ0MrTjJudTZ6TlRlZm02eWlWTko3Tmd6?=
 =?utf-8?B?dXpKVkdsZG1BS1pUcjdLZ3BweFR3VmxDR0FPaDBZMVZEZHhiVE1kS2FrNDZ4?=
 =?utf-8?B?OVdrSnh0SDR5UHQ0cDE5TmFrQmQ5ODV4SVI5cFVnSENFNW9WQ2tkdXp3U1RY?=
 =?utf-8?B?Nm03ajkxL29KVXhTb3hhVmx4R2JUOHRZTEhSZTdXZTd0d3hEU0xVYUlkUXZh?=
 =?utf-8?B?ZDV2Q2tNY1NrdTRZcTM2eU1Ld0hZNld6bEZnazhvbXV0SGdhZWR1Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f64fa052-60ce-476f-c6aa-08de6d1dca80
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 05:39:45.3240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LD8ytAKKB2hh0RlPoGA0AxlGWJd0tHKjtuOM0MWNXztkJyJOim9LBwaetKAWZmD+ZyMJ79jWOBGBENIjOH/lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6172
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


On 2026-02-11 06:39, Yogesh Mohan Marimuthu wrote:
> Also add WRITE_DATA job start marker packet optionally. This can be used
> to know job has started and make FWM packet negative testing timeout to be
> shorter.
>
> Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
> ---
>  lib/amdgpu/amd_PM4.h                |  6 ++++++
>  lib/amdgpu/amd_command_submission.c |  5 +++++
>  lib/amdgpu/amd_ip_blocks.c          | 27 +++++++++++++++++++++++++++
>  lib/amdgpu/amd_ip_blocks.h          |  5 +++++
>  4 files changed, 43 insertions(+)
>
> diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
> index 8f59b4223..923826656 100644
> --- a/lib/amdgpu/amd_PM4.h
> +++ b/lib/amdgpu/amd_PM4.h
> @@ -224,4 +224,10 @@
>  #define	PACKET3_INCREMENT_CE_COUNTER		0x84
>  #define	PACKET3_WAIT_ON_CE_COUNTER		0x86
>  
> +#define	PACKET3_FENCE_WAIT_MULTI		0xD1
> +#define		FWM_ENGINE_SEL(x)		((x & 1) << 0)
> +#define		FWM_PREEMPTABLE(x)		((x & 1) << 1)
> +#define		FWM_CACHE_POLICY(x)		((x & 3) << 2)
> +#define		FWM_POLL_INTERVAL(x)		((x & 0xFFFF) << 16)
> +
>  #endif
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 52327c69e..399171b44 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -10,6 +10,7 @@
>  #include "lib/amdgpu/amd_sdma.h"
>  #include "lib/amdgpu/amd_PM4.h"
>  #include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amdgpu_asic_addr.h"
>  #include "ioctl_wrappers.h"
>  
>  
> @@ -185,6 +186,10 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
>  		ring_context[ring_id].pm4_size = pm4_dw;
>  		ring_context[ring_id].res_cnt = 1;
>  		ring_context[ring_id].user_queue = user_queue;
> +		if (ip_block->funcs->family_id == FAMILY_GFX1150)
> +			ring_context[ring_id].max_num_fences_fwm = 4;
> +		else
> +			ring_context[ring_id].max_num_fences_fwm = 32;
>  		igt_assert(ring_context[ring_id].pm4);
>  
>  		/* Copy the previously queried HW IP info instead of querying again */
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 12f92a1d5..e8803c6e2 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -659,6 +659,33 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  		amdgpu_sdma_pkt_end();
>  	} else {
>  		amdgpu_pkt_begin();
> +
> +		if (ring_context->job_start_write_data_va_addr) {
> +			amdgpu_pkt_add_dw(PACKET3(PACKET3_WRITE_DATA, 4));
> +			amdgpu_pkt_add_dw(WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3));
> +			amdgpu_pkt_add_dw(ring_context->job_start_write_data_va_addr);
> +			amdgpu_pkt_add_dw(ring_context->job_start_write_data_va_addr >> 32);
> +			amdgpu_pkt_add_dw(ring_context->job_start_write_data_val);
> +			amdgpu_pkt_add_dw(ring_context->job_start_write_data_val >> 32);
> +		}
> +
> +		if (ring_context->num_fences) {
Please avoid local declarations everywhere , it will generates compiler warnings!
> +			unsigned num_fences_in_iter;
> +
> +			for (unsigned i = 0; i < ring_context->num_fences; i = i + ring_context->max_num_fences_fwm) {
> +				num_fences_in_iter = (i + ring_context->max_num_fences_fwm > ring_context->num_fences) ?
> +					ring_context->num_fences - i : ring_context->max_num_fences_fwm;
> +				amdgpu_pkt_add_dw(PACKET3(PACKET3_FENCE_WAIT_MULTI, num_fences_in_iter * 4));
> +				amdgpu_pkt_add_dw(FWM_ENGINE_SEL(1) | FWM_POLL_INTERVAL(4));
> +				for (unsigned j = 0; j < num_fences_in_iter; j++) {
> +					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].va);
> +					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].va >> 32);
> +					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].value);
> +					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].value >> 32);
> +				}
> +			}
> +		}
> +
>  		/* Prepare the Indirect IB to submit the IB to user queue */
>  		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
>  		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 424b3210a..17f94fd5b 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -279,6 +279,11 @@ struct amdgpu_ring_context {
>  	bool user_queue;
>  	uint64_t time_out;
>  	enum uq_submission_mode submit_mode;
> +	uint32_t max_num_fences_fwm;
> +	uint64_t num_fences;
> +	struct drm_amdgpu_userq_fence_info *fence_info;
> +	uint64_t job_start_write_data_va_addr;
> +	uint64_t job_start_write_data_val;
>  
>  	struct drm_amdgpu_info_uq_fw_areas info;
>  };
