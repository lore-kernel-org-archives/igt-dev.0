Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6DCD172BE
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 03:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C575410E1E9;
	Mon,  2 Feb 2026 03:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p7HIO+60";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFD810E1E9
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 03:18:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhBJcJapKBSnvHqqIiFxfokiXDDhwCXZ/lCxoJpAzMnohayanqrVoZpOLyzYcS6g+VsiSrgTtyEZ3aaG+GvtxSQDuqaYaFdZAdH1BSFskijwocalEWuh5+jKQbXd1k3IH1lpLv9gmaBnbbP7oXc1GETEdmZgjszgN+J6AFNAYPy7JPAV6dNQ0rBeeua1bzlHgtqHBo+DyQur9xWlpak+BLIN/hGTuqhUKqrwN/mCtEKT+yns/8uMGYhl4X+CJkDJ9KONCANMQhyus8ndeWSUm7XZFnkNEPzqKRXWB0CG2ept1TxzZpNiY45kpbee6s2fPA34qPTuwbvLQ+H5CJWrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARGhpA8U/2KPcBwgHd817DR2K6WAB3fvkBaNpDP1MMg=;
 b=bReCYnXxzkR0qTWoBNt/IHGMAP++F07cBAF79syxgAiU81kX1BLCpRbrDGyLV7berbxwCrViTvPpOcKPztRePIe4VGO+J+9IhEbmKhlFueQ17w6Qc/03TfqHd9sjJB/2tgtjghenJVmmBmlqqYavWLy4g029pU/uDe/yBAcJz2wdz6kwCSJCuVGziFACIuQkUhYa8uoXMOHhF3UEtPanPgczXb0QzdUcu//eLvao3UcvyePKw7Ygu+OXberMSk5+LX/wggIkAW7NidDkguk6tyu3SV/oNzlQwSf05AxYPXvFsJqZdJtwV9U9JcHm/cnBgnYze1eXEMZFFeWaWZWUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARGhpA8U/2KPcBwgHd817DR2K6WAB3fvkBaNpDP1MMg=;
 b=p7HIO+600PKT3HyOKg/28+KkrHWI/OUpugj6VS7Hp9uK4vkz9mY1uXnU5J0tm3MlRWfjBv0Lx151DOhPmqyJ8Z59oeS6SZF4YewOsGlPc/Z7LGeRE4chOCmjnE0Zw5rRR4uEv/7opklGZ54BanjvYpeCwR/9HXCtEAlxdAHNrgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SJ2PR12MB7847.namprd12.prod.outlook.com (2603:10b6:a03:4d2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 03:18:44 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 03:18:44 +0000
Content-Type: multipart/alternative;
 boundary="------------2006QGCoaJFQFZeAv2M1bp2O"
Message-ID: <2360018d-e1f5-45bc-8432-48737aa7a755@amd.com>
Date: Sun, 1 Feb 2026 22:18:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amdgpu/amd_mmd_shared: Fix VCN JPEG submission
To: Tessita Thomas <Tessita.Thomas@amd.com>, igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com
References: <20260202030100.453795-1-Tessita.Thomas@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260202030100.453795-1-Tessita.Thomas@amd.com>
X-ClientProxiedBy: YQ1P288CA0006.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::16) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SJ2PR12MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 3188004b-e81f-4271-ee11-08de6209c55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2IrdUtSL29yc2dUaWNUVDFVblBxYUNPa1l3V3NLcjJzdlFuWWVUV3h5Ky85?=
 =?utf-8?B?Y0VpeUpRWUZVNXlpV2pyZjkydjA1dWlJbVFGSTNjVCs3Vmhmcy9ndmlwTDVU?=
 =?utf-8?B?eEJKM0pjeS9sT2FUcSs5dmVFRDRZNU9OMWU5Tll6MUE4Nms1Q3JBUk9BbFlL?=
 =?utf-8?B?cXhhRUd2aUd4cDN3eGprRXlGSmN0aUNLT2wwRk03T2N2MjdzWjlmSlhyc2Fu?=
 =?utf-8?B?cE1nWTB3Wk5Lb2VURlRTMjBpNXpGQjczVUxPMzdhYlMyU2ZmR0tEbU1NVFhq?=
 =?utf-8?B?WWNoOVBzUDVtaXh5Y0RiNTNELy9RdlZjUW1zUHRzNXBmNEZDOHZGdFVyZmth?=
 =?utf-8?B?Uk01OW9ia0ZyVmNGS0VQVy9CY1ZzRkZjenZBMmdyWFVPN3FkblgvL3N5Z0hs?=
 =?utf-8?B?MHlpTmFuWS9wWWg0QkEyNEswbm5DZUVQbjN3MmJOcDBKdmtBUjJ0ekVqdjBM?=
 =?utf-8?B?SVFFUVd5amdKZ2oxU2JRY1lpNUphSUZVVUhJT1kvT3hidU5nbDRYOFM2bzhL?=
 =?utf-8?B?WjdOOWZPZkRaRmt0WWs4ZStFS01BUlVJbUJITGo0amRCbWhvREtqSnNvckVq?=
 =?utf-8?B?NEprdVF2TXM1bWxCNFJUWUNTUEJiMWJzTStGUUtMczdoM3B3YVBnVFlyb25a?=
 =?utf-8?B?SGpjK0hxVm5sS0M2OWtqcWVHYVRBTkd0THR3YUErdVRrd3VFc1hnZ09kd1hS?=
 =?utf-8?B?QmFTSThCOURlbUxqNWR6Y2szNkdOL1dYMmpBZ2tMUnVNVWNWMXBJdWJzVTFN?=
 =?utf-8?B?UUdaNTMxaW5wWCtzK0F4c2wzUE1XVTRhNmRYaEVKTWpLV0VqMFdrUFM1cU1X?=
 =?utf-8?B?NXV1a0phZ1ljQWQ2NVlEdmZrd21RbEpyQ3JCYjZpY2tBOUE3S0pEVk8yZVdi?=
 =?utf-8?B?UjV4TFRVUTJMZkVvZDB4U1RWSDBLSkhvRTNQVmxDUXlNRVNWZXNVODVjT1lK?=
 =?utf-8?B?TmFzNG4xNk9jM28xUVVkY0hxc1B1RGhaSENaS0h2VHVKclM1TXpuVkpCQ3ZG?=
 =?utf-8?B?ZU40WGNSVjZNdXRYYnZZc09FckxGSUZNcjNGZDFQd3djaE5oMUlEMSthZ01y?=
 =?utf-8?B?M0F0NERtN3FuZWF6NDRlcnJTWDQveWJOU08wbnNKZnhhUjdQdmJGcWl4Nit2?=
 =?utf-8?B?TnVIS2x5ejJNaktDWlBtK2xxOGRHK0hvcW1xYmorOHFRQ0dVT0MvQjFwZ1B2?=
 =?utf-8?B?UEMvL0R3SmhNOCtEZW4wT243UG03a2drajNlODNKM2tjOG5ma1dCYWR0T0Mr?=
 =?utf-8?B?Rnd1U20vZFdCaEI5ZnBBa09lQ0t6SDVEVHdoTFlxRGxBUmYrQWZXcXBvVUM2?=
 =?utf-8?B?ajNreHBEd2VvSEFlOUFiTFowRlc2RXVuempEeDgvZVNJaE0xT1lMb2x2SzVr?=
 =?utf-8?B?K0hOSnUwaGRyWGVUZGtIcGIwZ2lYVjFYMFo1anVpUzJEbE1Ed0pWNHV1dS9J?=
 =?utf-8?B?cmJma0JOLzNQelNWai9SeDBjOG5FZnNQRlpwNlJBQXNab2lGRjRKWkd1b2pp?=
 =?utf-8?B?cnZCT2xPT1g5V1ZDWVR5TzlWVGVXQk5XYVVOS054QjZ5UDBZTktneDRHZm9B?=
 =?utf-8?B?RXdyZXBRdDk4LzZmbGtXM3liREVudDZieWFHSGJuWW5ERW1Vb05ZMUJBQlVS?=
 =?utf-8?B?RkxNL0Uzc3Y0S0JKRE1PcjYrWDNpb2JuVmZ5MEJCelRqcERpUGU0SmFIMUFh?=
 =?utf-8?B?U2J3OFZuOXp0M01aeksxVk1jTmcxbko1MS9xS2ZFY2tKZ0Y4MDk0OFp6dWJX?=
 =?utf-8?B?dytUNHAvT1ErZ050QW1hSEVwQ2dqQWdZaEVZNUFCN053elJGVDA0Qjl5UGlM?=
 =?utf-8?B?Nk0vNVZvejlBREtYMDE3UXpiTEVhTTErNTRSNDNuTVpQVlltbEpweGZ1Sllh?=
 =?utf-8?B?bm43OGxlRjNldFNvWEZPdDlERWR1dUpid2ZQTDZaT1FraU1CQWtvcXVNWUZR?=
 =?utf-8?B?Y3JaS1FXc29lUFBFRjlXeG9Gak9PUWhXSVRER242ODFHTTBxcVdjZHI5UTVP?=
 =?utf-8?B?U1pheVFIcHhyeW5ZSEY3ZExoWTBJeFU0aVBjZEQ1bG5EVytMWVI4eFFiZ085?=
 =?utf-8?B?YXU5cHhraFZtQWtFMldRdjZxdjMrVjRSS1libGdXSzFSU1V3OVFqOEt6cHA5?=
 =?utf-8?Q?sYn0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFJ6eTdBOGFjdUt5R3BMVDlSUGM2R09KR3JxOEQwR2Jwc21PWDd4TnRBNHZP?=
 =?utf-8?B?Y21tUytQVjhQUXllNnVQOXdvZXJCTFNUek44S1oxWUVSaUU4cXNPaHp3eSt1?=
 =?utf-8?B?MVhCSUJTYkJQRUE2WHFhRUlXUUx6V2FFalRYVjA0ajNjT1cwRmwybXVxUmQv?=
 =?utf-8?B?TmpnMk1laWRGbjMzM0tFNmJISEh5N04reUFjSkdJdGkwaE16RVhUbTl0dkgv?=
 =?utf-8?B?WjlUdHdaamlUc2lScW0vUm9vaUwxNEsydXo2TXFtaHFJcUJaMXFhLzVvM2RO?=
 =?utf-8?B?NDBHcW5ydmVkcG5WbE4wYTFQRGRrcUMvcmdpVCtneGpJRjNOZ1NmNlBJRnpv?=
 =?utf-8?B?SWZHZ2xRWTV0OENmYmN4ZUdQMFg5SDhyaTZjbVdCNHhsbCtjbEs5Z1RNMVVr?=
 =?utf-8?B?RHh0R0kwb2ZJaWJUMGp6ejF4RCtBVXQ0RnBDeG53OUVyaXBPa0lOdTFvQ2tX?=
 =?utf-8?B?VExOaCtVdmRTVCtZa3Z6cXloYnNlN1ZpOGhHRVdmdUlSOFphcStlQTdTUjUy?=
 =?utf-8?B?bXkxOTljSlB1aVZCb3IyTWQxS2pQWDFzckJmTE5MM1BsLzN6dVplU3FDNVVH?=
 =?utf-8?B?ck5oUTJFOVYwQy9WUTJEVEFZNkphMTdFYWVob0x4dlRTaGVBcVFxOXYzaHZY?=
 =?utf-8?B?QTRtOUU5WUZKTWtjT1RmNUViRXpVQkFuRjZXSDNaTHRxd1FhS3pRQ3pqZ0ls?=
 =?utf-8?B?Q00xMjNyU3g4MnRTV2pPamNYY0dqOXNvM01EMkNmbzBBNk1mbllQSTh6RTJm?=
 =?utf-8?B?aW9MSG8rVVlMc2t1NzB1Ny9ZVENlSGlSZVhJK3UxVGlVNFhQT1Bzd0VETVJJ?=
 =?utf-8?B?UUhYUEJPdVFqTnIxY21OTTdtT2RoM25MNGNqOWp4SGoxMWgxUVN3YWMrdzcz?=
 =?utf-8?B?NllhNnB0UlBYd01lZXNhcnNFQWZCUnNIMWY1TmZUa0lRSGN6TDVPRzl0QUQ0?=
 =?utf-8?B?Sm1zTVlObmNDT3NZazhZWjgyZ1c4NkRNWitsSWtDbmlnbWRqWFNFK0g1enhV?=
 =?utf-8?B?VDEzV0FxUGUyK3hFekh2QTI1aDlGejJoeVhib3ZiSEh1WTUvcHhLODY4NXJG?=
 =?utf-8?B?OVNXK2hBUFM0NXNGcnRHdmFGWHNEMUd3R2wzNi9YbVZFb2t6aUNSNGluVGRE?=
 =?utf-8?B?L04xUTlFdWRsc1VSckZrYVV5Nmh6TFp3bVk4ZjQydGZxYzNnVDczVi9Xekxq?=
 =?utf-8?B?YnFKUmxEVFhsbGRmOVJWL0IvRE81NG9DWU84dzEvZi8vaG9YbDVPMHdIYmdm?=
 =?utf-8?B?ajZzWjE5R2hsTGVLa254YXBXN1d4WHpRd1hsNDVFcGtkbENYRERYUU4wWGcv?=
 =?utf-8?B?dUdXMEpZbW1oWmpBcHVmNmhXZnN6MFF5aUxFbGJWenJTYWNSK3ZqcGxMNlhF?=
 =?utf-8?B?UEFrb0wwOUFrN3hsNUYzeWtQSXpjTGhsdU1UVVBzRGtXTExxYm9sODgyMUM2?=
 =?utf-8?B?YW84VExaQUtUY3Vjc015UWlsT3BFUmZnY2g4dVhrYmN1SW80cHpxaFpwTWdy?=
 =?utf-8?B?VkV4WWlVSEYya0F3cHZQbjJKN041SUpyS2RNN0poS0xGMFMzT0ZtNkZQNEw1?=
 =?utf-8?B?TjhVLzR0Q3ZZeUhQdUtxYm1HeXR3RjE1OU4wYXpJS2tUbGp5bWdQekRpa3FC?=
 =?utf-8?B?aWRtQUhRV1lhZ3hmN2UySXZsL3R6M3pnVW1TT2Z3ZVVReE9DejI0WjJjbm92?=
 =?utf-8?B?ZW5jVHRGM0JsZjVsbVpYcE42L2NQZDhKb2pMeUV5RkNhZ203SGh4c3BJWU14?=
 =?utf-8?B?RWVVQzFXT1hic2N5TVkwWkpSZDFGM0Ura2RkZ1JYdit1VnVKbzVySlFMRkYv?=
 =?utf-8?B?b242ZXlIbk9WbjVUald1Q0xUQisrYnVTNXk1Y2JPOEtKL2hMc2h0S1hRaXdW?=
 =?utf-8?B?b3ZxU21HZlVHQ1dFWEw5WEp0UUxJTmo2cVNCemNWelluMUVVSGJSbXBVc0Z0?=
 =?utf-8?B?STJMbWJzeXpXMWtYQXAxZnMwSWYzZGJQUi9sYnljNGFkZE04ZjM3blRvQkg1?=
 =?utf-8?B?MldUdDMxZ2VpclBqdFBIajBDY2c3bjZnWDZzR0NjREthYXBuQmJoSlBEbStX?=
 =?utf-8?B?Sy9YcFA1akgzUk1FY1EvSzU0QUd4VEFGd1R0ci9pNFNmdWY1QklhWEtPT0hI?=
 =?utf-8?B?aFk4bGxKM09EUHQ3ZGRwMVh0ZUc2a3cvK2xaanQwV2dNNFRNci8yNHF0Z2J4?=
 =?utf-8?B?eEp6Q2ZjR0doMWIvYUFuSzJNeWp5Q2lmc3JYT0VRKzZZZ0FNTzllVytVclZE?=
 =?utf-8?B?UE9Sc1c5aFJOeXBrMEJVNGUwN2c0cGxqdjR3eGUva3ZOeGQrOGpiWlNOcEEw?=
 =?utf-8?B?TEI3THR6SHFGMXJqL2RoKzkzUXl0aUlOSjVIKzlwSFg3d1VFUGoxUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3188004b-e81f-4271-ee11-08de6209c55a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 03:18:44.1476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykE3/5QRO/c3jCDXOh07ZRJ45OjAaJqhV4Yrua2TawohfjANa3XYPj4tDuC440upPLX4mt17sYWFdCSGw//C9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7847
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

--------------2006QGCoaJFQFZeAv2M1bp2O
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tessita,


Thanks for working on this — adding IB padding for VCN JPEG makes sense given the VCN 4.0.5 alignment requirement.

I ran this through an AI-assisted review and got the following suggested refinement to make the padding logic a bit more robust and defensive. In particular, it adds explicit error codes and a bounds check to avoid potential out-of-bounds writes when appending NOPs:

#include <errno.h> /* for -EINVAL, -ENOSPC */

unsigned int padded_ndw = ndw;

/*
 * VCN JPEG (VCN 4.0.5+) requires IB size aligned to 16 DW.
 * We pad using a 2-DW NOP packet, so the initial ndw must be even.
 */
if (ip == AMDGPU_HW_IP_VCN_JPEG) {
        /* IB capacity in DW — adjust field name as appropriate */
        unsigned int ib_dw_capacity = context->ib_size_dw;

        if (padded_ndw & 1)
                return -EINVAL;

        while (padded_ndw & 0xF) {
                if (padded_ndw + 2 > ib_dw_capacity)
                        return -ENOSPC;

                /* 2-DW NOP packet — please confirm this encoding is valid for VCN JPEG */
                context->ib_cpu[padded_ndw++] = 0x60000000;
                context->ib_cpu[padded_ndw++] = 0x00000000;
        }
}

ib_info.ib_mc_address = context->ib_mc_address;
ib_info.size = padded_ndw;


This keeps the original approach but makes the failure modes clearer and avoids silent memory corruption if the IB is close to its size limit.

Also, to better understand the context and validate the scope of the fix:
could you *please share which IGT test exposed the failure, and on which ASIC(s) it was reproduced?*
That information would be very helpful to confirm that the alignment requirement applies broadly.
You can reply in teams to me ,

Thanks, Vitaly


On 2026-02-01 22:01, Tessita Thomas wrote:
> VCN 4.0.5 requires the IB buffer to be aligned according to the
> hardware specification. The current IGT implementation does not add
> padding for AMDGPU_HW_IP_VCN_JPEG, which causes submission failures.
>
> Add padding logic to ensure the IB buffer is properly aligned for
> VCN JPEG workloads.
>
> Signed-off-by: Tessita Thomas <Tessita.Thomas@amd.com>
> ---
>  lib/amdgpu/amd_mmd_shared.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
> index f504db596..b9eff16f9 100644
> --- a/lib/amdgpu/amd_mmd_shared.c
> +++ b/lib/amdgpu/amd_mmd_shared.c
> @@ -161,9 +161,22 @@ submit(amdgpu_device_handle device_handle, struct mmd_context *context,
>  	struct amdgpu_cs_fence fence_status = {0};
>  	uint32_t expired;
>  	int r;
> +	
> +	unsigned int padded_ndw = ndw;
> +
> +	/* Pad IB to 16 DW alignment for VCN JPEG (ib_pad_dw_mask = 0xF)*/
> +	if (ip == AMDGPU_HW_IP_VCN_JPEG) {
> +		if (padded_ndw & 1)
> +			return -1;
> +
> +		while (padded_ndw & 0xF) {
> +			context->ib_cpu[padded_ndw++] = 0x60000000; /* NOP packet */
> +			context->ib_cpu[padded_ndw++] = 0x00000000;
> +		}
> +	}
>  
>  	ib_info.ib_mc_address = context->ib_mc_address;
> -	ib_info.size = ndw;
> +	ib_info.size = padded_ndw;
>  
>  	ibs_request.ip_type = ip;
>  
--------------2006QGCoaJFQFZeAv2M1bp2O
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Tessita,<br>
    </p>
    <p><br>
    </p>
    <p>Thanks for working on this — adding IB padding for VCN JPEG makes
      sense given the VCN 4.0.5 alignment requirement.<br>
      <br>
      I ran this through an AI-assisted review and got the following
      suggested refinement to make the padding logic a bit more robust
      and defensive. In particular, it adds explicit error codes and a
      bounds check to avoid potential out-of-bounds writes when
      appending NOPs:<br>
      <br>
      #include &lt;errno.h&gt; /* for -EINVAL, -ENOSPC */<br>
      <br>
      unsigned int padded_ndw = ndw;<br>
      <br>
      /*<br>
      &nbsp;* VCN JPEG (VCN 4.0.5+) requires IB size aligned to 16 DW.<br>
      &nbsp;* We pad using a 2-DW NOP packet, so the initial ndw must be
      even.<br>
      &nbsp;*/<br>
      if (ip == AMDGPU_HW_IP_VCN_JPEG) {<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* IB capacity in DW — adjust field name as appropriate */<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int ib_dw_capacity = context-&gt;ib_size_dw;<br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (padded_ndw &amp; 1)<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (padded_ndw &amp; 0xF) {<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (padded_ndw + 2 &gt; ib_dw_capacity)<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOSPC;<br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 2-DW NOP packet — please confirm this encoding
      is valid for VCN JPEG */<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;ib_cpu[padded_ndw++] = 0x60000000;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context-&gt;ib_cpu[padded_ndw++] = 0x00000000;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
      }<br>
      <br>
      ib_info.ib_mc_address = context-&gt;ib_mc_address;<br>
      ib_info.size = padded_ndw;<br>
      <br>
      <br>
      This keeps the original approach but makes the failure modes
      clearer and avoids silent memory corruption if the IB is close to
      its size limit.<br>
      <br>
      Also, to better understand the context and validate the scope of
      the fix:<br>
      could you <b>please share which IGT test exposed the failure, and
        on which ASIC(s) it was reproduced?</b><br>
      That information would be very helpful to confirm that the
      alignment requirement applies broadly.<br>
      You can reply in teams to me ,<br>
    </p>
    <p>Thanks, Vitaly<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-02-01 22:01, Tessita Thomas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260202030100.453795-1-Tessita.Thomas@amd.com">
      <pre wrap="" class="moz-quote-pre">VCN 4.0.5 requires the IB buffer to be aligned according to the
hardware specification. The current IGT implementation does not add
padding for AMDGPU_HW_IP_VCN_JPEG, which causes submission failures.

Add padding logic to ensure the IB buffer is properly aligned for
VCN JPEG workloads.

Signed-off-by: Tessita Thomas <a class="moz-txt-link-rfc2396E" href="mailto:Tessita.Thomas@amd.com">&lt;Tessita.Thomas@amd.com&gt;</a>
---
 lib/amdgpu/amd_mmd_shared.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
index f504db596..b9eff16f9 100644
--- a/lib/amdgpu/amd_mmd_shared.c
+++ b/lib/amdgpu/amd_mmd_shared.c
@@ -161,9 +161,22 @@ submit(amdgpu_device_handle device_handle, struct mmd_context *context,
 	struct amdgpu_cs_fence fence_status = {0};
 	uint32_t expired;
 	int r;
+	
+	unsigned int padded_ndw = ndw;
+
+	/* Pad IB to 16 DW alignment for VCN JPEG (ib_pad_dw_mask = 0xF)*/
+	if (ip == AMDGPU_HW_IP_VCN_JPEG) {
+		if (padded_ndw &amp; 1)
+			return -1;
+
+		while (padded_ndw &amp; 0xF) {
+			context-&gt;ib_cpu[padded_ndw++] = 0x60000000; /* NOP packet */
+			context-&gt;ib_cpu[padded_ndw++] = 0x00000000;
+		}
+	}
 
 	ib_info.ib_mc_address = context-&gt;ib_mc_address;
-	ib_info.size = ndw;
+	ib_info.size = padded_ndw;
 
 	ibs_request.ip_type = ip;
 
</pre>
    </blockquote>
  </body>
</html>

--------------2006QGCoaJFQFZeAv2M1bp2O--
