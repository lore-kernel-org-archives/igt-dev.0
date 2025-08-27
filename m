Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1861BCA0FF0
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 00:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C146A10E6E3;
	Wed, 27 Aug 2025 00:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mHC+nd2Y";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB4A10E6E3
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 00:31:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwIWgwiiy5HwXkaMrWHpPJuhYKu9TCvpw0U63im/Wm5C8DLxw7LH0JwoB7MUfyZ6z5rhOEjlL4BnTbsyWG1Jd2ocuSO9fgoBvCWF0z1jK1D8RLZamf+iBqAdehVoGMsRh2KutxOCo1671ozLoNzpx9XGCvy4VPK0yGH6NYoTodYrdX8gQsBVODo8ZXO8Uu2K1OVf5mNQkz+lxyDkBveFyjh1G7B4Yx4/RH8jeOHa1yjj4sEUj+MOqckKVinCoyBlkJ0FAAaACdo3RVNJdONceMYFfKVyEhLAJ6Fh7KqESD5mS0j2f8tIwA01KAccdBb3kTV9G01jPNHpUFbv+YzHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU7TlUScd/SIdlqoTNCX4S+cK+g8cVwSvf3zD5Fad+k=;
 b=qibhTVAr4+Kk+4g68otVzir2b8+Oe/N1noXKU1/uCt9LAIQMWxTdEehXCP/M8rMtt6js35fMHcrRMP86HnfM5a0Ub8Mar7LkVPOufiFzD1oG+T02kv+QESSl01fJNsgyotv0UFVYBXGXapoccDpECZFrL3vF/kmn/EY9YqjQMcZp1RiFCwoQ38IEZIa8vBSbrYIXnNmcO/RD1S1J7z1efWTJUxkzqs//i7GYiz+69toHn/TyZt6PizDvOvfk6pedDpnQwSA1jiSFNttUWXSqvO4tP4wlkHB+QQCMB8L5zf3Om9lFtZTnT/PXjdsN+PkSSoELoYsYKOpgxuoXo7gaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU7TlUScd/SIdlqoTNCX4S+cK+g8cVwSvf3zD5Fad+k=;
 b=mHC+nd2YSMwxYj4Pld1qscHxoayuno1f3Y7e5rVp3QSs464WUN/omsoI2JpsxbLQaLQR+2xYKdCEr75J2lzYaLvwc+Pn69OldVgfT7haOypAX4RrwT9HyJ76Zfe+KxzF7worRJZGJ7Zs3VLWw/Kli577Zw0QEHUM5vWKI+Kqujs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH8PR12MB7182.namprd12.prod.outlook.com (2603:10b6:510:229::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Wed, 27 Aug
 2025 00:31:27 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 00:31:27 +0000
Message-ID: <1ef2eaa7-5ac6-4c0c-8ebf-595a81487922@amd.com>
Date: Tue, 26 Aug 2025 20:31:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/amdgpu: Add user queue tests for SDMA in
 deadlock tests
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250826064530.1721892-1-Jesse.Zhang@amd.com>
 <20250826064530.1721892-2-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250826064530.1721892-2-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0356.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::21) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH8PR12MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: ebde26e6-c802-4c4d-6c0e-08dde5010f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YitRQldGdEhIVW1UeDQ5NHMvTElwMkRGTmZ3eU5CcVBQb28xZVVEUU9yU2Vz?=
 =?utf-8?B?alR3cjlsa2pUZFlZVXV4ZmVUclpKVEhuTXJtR29oQ2paNnFzbTBBemNtSUtN?=
 =?utf-8?B?K2pvcWlTZWxmQWhUOGIwbVlEVVFkaXZpdGFwZ1BVTCtmWGs5QzdSZEhmUmkx?=
 =?utf-8?B?d1FXRGFWZEl1dlluN3hQWWlFcDl3emdOYlNRMXdNdnJhUVZNekNqMitGdElz?=
 =?utf-8?B?eVZMVngrNFlibVh2OXBJZUNyNjFvdG83RlB3bkNLSzBCUlVqV0F2L2lhcUha?=
 =?utf-8?B?dGJXNjkyQTd2KzQ4akI3c0Y0elp4ckkxVkd3eGdoUDB1VzdzUVR1SGd6ajJB?=
 =?utf-8?B?bkNEdGlSUzJJVGE3dFVSRnJDTExyRWw3cENIdHpIdUJmK2FBMS9YVmVGMmdq?=
 =?utf-8?B?TUIvN2haaE9hWVQ1cDd5RDdhL0lBdmU4L25ITEZ6M2NHK2NGd21Ia2VoUHJY?=
 =?utf-8?B?aGlReVlnSFNweEUzbW1TVStyb3Bya3R2OXlnUktuaWl6UlZjUWJDQ2Rvc2lq?=
 =?utf-8?B?TVFEU1FkRHdrNU1tVDlVeXYzSENBTmttZ1BuTllEZk9kenZmY3JLN0o5eUNT?=
 =?utf-8?B?SGNSUnY4blZ3bi9ycUwzTnhzMFRldHFHQmJYbWlHd0pKWThFR1dEZkJZbjMw?=
 =?utf-8?B?cXk0OFk5L3ZyaWo5Qzl1NlNoRlJtQWxIcHVNTGZPQmxpQWdQUkVybEUyZ1lt?=
 =?utf-8?B?eXhhendhR3VjODI2aU1yL2puRWZiamJvcFh4dTRqcGlRamtNcjgrWEw3bnlQ?=
 =?utf-8?B?U1Z3UTRyT0c1MEpweFhoTytjZlVLNWg2LzRmZmxPL0ZJbldjS0kwNTRFWjJN?=
 =?utf-8?B?c0ZVeFdUTUJVSTVDWVR2alNiQXVJcUhsNmpSZHdabmJ0SVJ3a0ZHNFJOeFFN?=
 =?utf-8?B?NFhaRWlhRkpveTI3UDJmZUdhaDJnTGtmRTRGQlBoQWlFVHZQZ0RTNkt4RUJ2?=
 =?utf-8?B?TkczMDNBeEMwNlAraXJMK3JEcm5RdW1TbTVoQkZ4N3VpSGhwWWJRdllzeUpk?=
 =?utf-8?B?Ny96WmZXV3hVWU1OanhVZG9WbG5PRUpaOXlTNjdkb0dXeDFzQnZQbndNa2JC?=
 =?utf-8?B?ZnZzTURWWlpwUFZyUnRWSEY2WVM4MVVjcFBoczYrVnNCaWEweTRnUFl5TEk4?=
 =?utf-8?B?V00vS1hlTzRiMGdMRVgrUUg0RkhmbHJBeTBBYXFScXJjaFRENGp1Nkg5Nnpw?=
 =?utf-8?B?eTA1NGNCQWk2a2lNNWwzdWljZHlIMWxwam5hRklQLzNxVjQyQnkzMGJ1TVZK?=
 =?utf-8?B?QUwrQzlESGNlbFlyR0U4ampEdTlKR1FDcVlGZU05bitRK0w0S0g1cUtjZmd6?=
 =?utf-8?B?Rk5xOEhPeW5NbG5neDdXOGMvMG5Mbm1RN3Uwc3VJUFh3bHB2a1FVQkloRkYv?=
 =?utf-8?B?ekhPTEdZaVd6bWhjUGx4Z0RWNDBMS0s1UDVUMmZibGQ1cFM3UTVZSTAxQTFL?=
 =?utf-8?B?MUhJQzl3SVpoWXppcmUrTDNqNzNGSjAvN2l6NHhnWi9Sc2hlNWM1bEFkb2FU?=
 =?utf-8?B?WXVLd3J1OEJIbWNDc0lmU0dSUmNYSGNyaS8vNG42aG9EdWU1KzI3cWNTQXBF?=
 =?utf-8?B?RDRONWhQSFlsQnZkaUhJYkc0WFhGb05VandmS3E3cFFOeG0vMWRPRlBvQmNM?=
 =?utf-8?B?Vk1WUm9xT0lzWUc0WUNiUkdoRWZpY3EzZHVkZ1RnU1N5aUVwdTExY3REdVU1?=
 =?utf-8?B?ZHhVNk5uanNnaFlleWJBQ1pYTmxnN1ZpNnBlaGljcTVrYmtKS1hGSDVUZDNS?=
 =?utf-8?B?czB1enJIRnJnOVRNSmNDbmZ4MFpwTDZyVzRLTFR4Sk42ZnFsNU1pNGttMUNn?=
 =?utf-8?B?c1U4ZzhhKy9RYitmWEcyd3B3YzUzV2w1K2p6QWdOTE12TGlWMjRXcGRoREhL?=
 =?utf-8?B?U0tLKzBmVVo0MzBYNG9NU1JlaVRSU3o4aEx5VEQySnFOUVdXaXZMNG1TMmxx?=
 =?utf-8?Q?1IRTa1ySj0A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enZ4aWNlWElDbHJ2TmlWcHZkSmxrVlRnTnFjWFZEZERpRjg4MEpBeU1XTUVi?=
 =?utf-8?B?R3pzYnpKeVgzeGhZeDFGdGhzdU1iNFJ3ZFBhSXFieDJTaWFuNytiY2pIK1Jn?=
 =?utf-8?B?cVVwd2tSNlY0allHRlVWZHhKbFZEdHA4T3BKTTlXTm9MMkhkN1pqY2RWaTUw?=
 =?utf-8?B?bHhITkJ6TmRBaFEya2dOT29KcjloTklEb2o0L09FaHBzWWdzRWJ5Q2hxb2o0?=
 =?utf-8?B?MExyblgrbWJRWVNkQ0s2c01LWjNDSEVNYk54dmZ5Y2RSR29yalBFaTk2bzMy?=
 =?utf-8?B?aVNrZEhveWZqWnpwYXhRc3NBakJ5WG5UU0gvT2xmSnZmVkYwTVJHK281VWNH?=
 =?utf-8?B?dTBkQlh4MHFZM3BGQU84QklRY2QveGlGV0NXZEpEQmNDbzlJaG0xNStxak16?=
 =?utf-8?B?UFFkMXZNZW5MQkNXampFbmw3SGdkaHMwbFJYTm84TlJ6TGFORXJSVHVQcFRG?=
 =?utf-8?B?VS9Jek9tTTc1Y3BQaVc5c0cyWE1wMlM3ejZPR2xLZ2VZaWtqUVA0aEJyQ09V?=
 =?utf-8?B?anlDMzIzWWhxQktNbmVqV0tGRHBIblJsbHRmMS8rMUtWR3JxV2xGYVpoTFdY?=
 =?utf-8?B?cmk3WWhBc2VvZnRiNGw3U0M3d2tiK1Vhd3BNVEhsVDhzN2pBTW92UnFSK25D?=
 =?utf-8?B?WG55M1EvYjIzZGJRK1hEKzB4bHptY09CT2sxa0o4VHl5enpUTjlRM1ByUEhS?=
 =?utf-8?B?dm5qK1U5cVNCaElmcHhubGx1NzVxYk5DUDZKUEhBUm4ydGNEdlZIaGFWSWhS?=
 =?utf-8?B?c3g1WjlmVGRQZkZEVzM1REhyS25mV0JZZDgwM25GTU4ySkNXeXQ1dUNJY0wr?=
 =?utf-8?B?d3hQR0N0Ukc3eEh4K3NZa3pnblhxWWJGNjlGZzE3d0NjTU10VWFVMWxWRjI3?=
 =?utf-8?B?UjBlNHFXWE9UdlhYN2h4dlBnekJ5dm1yMktHeUVpNDVWMnJWbElDekdiUFMx?=
 =?utf-8?B?dnZjcE45cDAyTDB6NDB6a3RFSzJuWXk2N3JEMXFtcitXVDJCNnpXNUdDU0JQ?=
 =?utf-8?B?Y1Y5VEpsU2VneW5qM1RTOW11ekpObHVTME94UDhJTUoybWhCcjA3NlNpc1h3?=
 =?utf-8?B?dWQ1cGlaRW5NcVpJcS81cUNTQnBPUktBWU4vTnFnUDRHT3NiYThqQ1lUUVZE?=
 =?utf-8?B?QjBWdjZqenVJNEVudXAwUFdVZTlhd2NyZk9UUEZXR0FZeEJJNU1JUCtMRmdQ?=
 =?utf-8?B?cjlBSlByOC95czMvQ3c2N3A5M29HSnJNL1lEWnk4ME5iMU10SGJBemtUTWUy?=
 =?utf-8?B?QlVoaTVpaERDSm5GdjUzcVVnZ1pHcytOOXo3TURvQmttRVppcHdYSTBFZUs0?=
 =?utf-8?B?YjF4OThVMWs5M0JyMkNjWmtFcnRNTXRYeWVmdXJJTE56dHMwSXU4WUYzSjNJ?=
 =?utf-8?B?b2tDb2szZzMyVDJTZW1LbjR0QlV0Mmd4QXZKVlpiYm9rMmExT0I1U1NCRXZ3?=
 =?utf-8?B?azZvMWEvanRlekVUSnkvWGZITFlBeTB5VTFPREtlN0pYL2pZQ3FhZU4zYWQz?=
 =?utf-8?B?UGNrSGYxYStyc3BzdklIaXFyNFhYNWJNNjQ2d1lkWnNkVkowb25hQ1prU3Ba?=
 =?utf-8?B?VVRkaHI3dmM1WXZDazN6NlduNHJBZWZ6a1U4bElmU1ZWT2p6NDhBY1EwM1Uv?=
 =?utf-8?B?SlZPK0FKK2tzbFB3cFNEcFV1Q0F5ZzRuNkhGQlpUdVlsaVVSNmIvSzVSSStv?=
 =?utf-8?B?Qzgya3ZITi9hVzFZUG94Y3V3WW1YVjllVXBDd1lQQ01pWm5nR1pNemQ2TTFn?=
 =?utf-8?B?MHNUK2NVQ2docEM2MmZqZjFpa1BaNHVqbXpHV2hjRlhjNjVFVDVNNGhpeWFY?=
 =?utf-8?B?eWIvbDNvb0szaXFUeElGMUxxOW5Kckh4R2RwTnc3R29JbkdHdUZ5RzRES1Jx?=
 =?utf-8?B?S2gzV1FhUnJVU0hIQUkvNWZkSDhxMUVBWHdVTjJCdDJTSXAyRWZFYS9zMis3?=
 =?utf-8?B?NUI0aytCVWR0MDZ2aFBMVU5IM1E4QWxGWDlXWmIvblJ2YnAxQnNuaXlDSFVX?=
 =?utf-8?B?LzJuOWtSZ3pnMWcwVCtrSDNKYjVKR2JEeGZaekZJNjZham02MGNOZG0xK3Y0?=
 =?utf-8?B?YWpkYnBacGF0LzdxYkZzU21MYllCUDZoL29JSEFoeGdiR0NkU2hFNmF2RnV2?=
 =?utf-8?Q?+SoP9BDqAFgXjHmR139Mp5PgP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebde26e6-c802-4c4d-6c0e-08dde5010f55
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 00:31:27.3329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hk1HF047SeD+/yckZK130ih+IN8zZBIHyl93u6FksWXdXoekxKyqTprb4vpYQqi3fXiO7aV2hHWhONXMi93QxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7182
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

Both patches looks good to me. Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-08-26 02:45, Jesse.Zhang wrote:
> - Modify existing tests to pass an additional 'false' parameter to the
>   amdgpu_wait_memory_helper function to disable the reset functionality.
> - Add new tests to cover various GPU reset scenarios triggered by SDMA:
>   - Test GPU reset by SDMA with bad opcode
>   - Test GPU reset by SDMA with bad memory access
>   - Test GPU reset by SDMA with bad register access
>   - Test GPU reset by SDMA with bad packet length
>   - Test GPU reset by flooding the SDMA ring with jobs
> - Update the test descriptions to reflect the new test cases and their purposes.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_deadlock.c | 54 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 51 insertions(+), 3 deletions(-)
>
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 3456f42c8..41b3aa15e 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -78,7 +78,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
>  		if (arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma")
> -			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA, &pci);
> +			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA, &pci, false);
>  		}
>  	}
>  
> @@ -107,7 +107,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-deadlock-gfx") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("amdgpu-deadlock-gfx")
> -			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_GFX, &pci);
> +			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_GFX, &pci, false);
>  		}
>  	}
>  
> @@ -124,7 +124,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-deadlock-compute") {
>  		if (arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("amdgpu-deadlock-compute")
> -			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_COMPUTE, &pci);
> +			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_COMPUTE, &pci, false);
>  		}
>  	}
>  
> @@ -196,6 +196,54 @@ igt_main
>  					       AMDGPU_HW_IP_GFX, &pci, true);
>  		}
>  	}
> +
> +	igt_describe("Test-GPU-reset-by-sdma-badop-with-jobs");
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test-umq") {
> +		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
> +			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test-umq")
> +			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
> +					AMDGPU_HW_IP_DMA, &pci, true);
> +		}
> +	}
> +
> +	igt_describe("Test-GPU-reset-by-sdma-bad-mem-with-jobs");
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test-umq") {
> +		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
> +			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test-umq")
> +			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> +					AMDGPU_HW_IP_DMA, &pci, true);
> +		}
> +	}
> +
> +	igt_describe("Test-GPU-reset-by-sdma-bad-reg-with-jobs");
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test-umq") {
> +		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
> +			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test-umq")
> +			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
> +					AMDGPU_HW_IP_DMA, &pci, true);
> +		}
> +	}
> +
> +	igt_describe("Test-GPU-reset-by-sdma-bad-length-with-jobs");
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test-umq") {
> +		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
> +			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test-umq")
> +			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
> +					AMDGPU_HW_IP_DMA, &pci, true);
> +		}
> +	}
> +
> +	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-umq") {
> +		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma-umq")
> +			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA, &pci, true);
> +		}
> +	}
>  #endif
>  
>  	igt_fixture {
