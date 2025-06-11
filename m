Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A01AC71135
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 23:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA65810E74B;
	Wed, 11 Jun 2025 23:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OBr/FsTi";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6767C10E74B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 23:20:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGB+EQ6qB0qZ8fn+Rc9vS1N6PzrqWiqxOGZ/4L/Lj7luNqoazo8d2HZadOdWfN7FBpWMwmpoJVrb1v+t4Ohh4rrWxI3XnujunRQ8NR/31VfGG0c6iVAXLk+SH/s2DzqndP42gozqMMiUciEc2UYaVsMk9HnmcN3JYlQn/6AbH7p0OozoKQs4LzI0sOrB70b/MF65jOmciTcbV6H8q6tCPYgcrFcJLt4Z8hyKt1U6Tz+iE0zY8cvL32IcSKnyqf9ABabgXj3LGTJVf54HFA0XKgVUH41nq9W0n8q7YjyR7QhSTbWbV5omecIk2tEM4r9S49qXZTbcZWMxPpx/msnllA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orsF1EudXq03uZlAPuQFReagBsZd+6S1NADG+58lptg=;
 b=wsGepZqXIvhcnqTFMceo8JbdQtJubR3c6QKdmGwNSHhHqTlVOo75bxDR5WFX0c1ZQWS6BQaDppR5Z885vR97qS3ctEq2O8598eNfswR2K5UMJWNzQuMvDdBW0uv1lyk9lgAbXWvtEyJyJbdAkRW86K71JZuPrsSwx4Eflf3bxhOfbVbv5Xf/GI/Q0gvdLafRyNAgOrCoxFfBHvic14irGQYXotAQdV/hmrQA2uDSwOCHg/IQg7ggJdcyGEZDnWmgCONVoaN4EP8SD3FjiEbpsnON0iyIefkMCKk8liu6hW1poE7u2SfZsmv1Ad85pKjEJ60GBlSLPAooPOoJ8lur6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orsF1EudXq03uZlAPuQFReagBsZd+6S1NADG+58lptg=;
 b=OBr/FsTiUXI78XNdglQCMVh29OwT02HxNdHW2OB+voEIWfjReO0PKXtIeJwK31I8gO/DIj6DGx2zatXwYHHkZrWp7NzdI/lCybnQnNZq4PyA2L3tEq0d4OWbhHYnnqDUU/oo4VRYoNKjCPQITVydJLjx9cHXhAYvj9ztnh/8dwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 23:19:59 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8792.039; Wed, 11 Jun 2025
 23:19:59 +0000
Message-ID: <78441678-767f-4d3b-9e81-a0b567e392d4@amd.com>
Date: Wed, 11 Jun 2025 19:19:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/amdgpu: disabled tests are skipped with skip
 message
To: Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20250611113711.15544-1-sunil.khatri@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250611113711.15544-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0129.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::32) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 230bcd7b-5800-4198-4c64-08dda93e7c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjR6eGNiZjBXcVBBRTFvOEFjRjZKVzBjeWo2TmhSSzYwZ3YzT3g5TDVZTCs3?=
 =?utf-8?B?N2JKS1RjaFRyOFZNMmpIOFBjbU1NamZ1ZGFBMWMzdmdvYXhuUVU0bXlqSjZZ?=
 =?utf-8?B?ZGxqdTlPaXNLdXhPc2laUWdNdXZENnFyZXJYaHhXRmF1RzM3QXozUXpkRW1o?=
 =?utf-8?B?UjNmTzk0Zm0xKzRFOXVvb3R0U2oxdGZUVzlSMWRqbXNDNGVEMXdXUXFKQWVZ?=
 =?utf-8?B?MUU1dFR3VlBWU3RYeEFNcEJzeUdXWTFUeWI2dE4weFFia0hUUmhxWHBxQzVC?=
 =?utf-8?B?UW5aenNPK3YybFd5bGVib3lkRlp0RjJpRzdoZU9rUUM0L09lcXJHbThuV2to?=
 =?utf-8?B?ME5SdS9rMzJ5bXNZZGRURmlOYmg1VGFIT1owejAvUXluRjF6aXhFdG96eThi?=
 =?utf-8?B?c2xEV0tDUDNuQ1RaVDlSTkVBdmhUa2haaXoyVE1ReEllV3JYZEpSTW1PdUlq?=
 =?utf-8?B?bU5FYk5xRE1kT0lJQ0YvOGF0NXo2RDMrUzdhSXFmcW9ONXRkaWxYQjl3V3U4?=
 =?utf-8?B?eWlQQVRPOExHZ1NwRjdNV2tBcEttdmVrOCs3TVlFcVczZ1l2Ty80ZXUxSkNJ?=
 =?utf-8?B?M29rekZtM2R2UzRCeElMSmNPVGhmb09HOFhzWk9NYml6TE1lbVV0T2dlNldI?=
 =?utf-8?B?bXd1NzNSOWlHQjl3VVcwMTFJRGRaWG9oTklLRkZlMW9qZ0pDd3VkWTA4WEZK?=
 =?utf-8?B?QW4xb1NjYkgveExzMjhTVGJGQ2c3VDBIbDM4MVlEVTlyUUpNdmIxMWZJTU03?=
 =?utf-8?B?dDhrOFA5RHcxdGRua0xoNTdLUUpDMHdnaTBITzQ1ZE11dzdmOSthcExzZGVG?=
 =?utf-8?B?cXlENzhBR0xxdll4MmlSVFNmWGdodU1iVTRWZDErS25NbHJ3WXAvMW9aTktS?=
 =?utf-8?B?REQra1JXVXNCd2plNGZhUitydjgyRW5obDV0U1hqZFdLOGlHM2ZyaFk0cEdu?=
 =?utf-8?B?MURwMXFNQ250K0tLRm1mekpzT2RRV3J1N1l4Yk40TlR6NXRlMHdUQXkwemtB?=
 =?utf-8?B?MURmSWNxY1lTWFQvM2F3MGdGeG1rYlZJakZrWjl3WHQ3WWZKZER6aFVGcWx4?=
 =?utf-8?B?bFAzL3BrVGJXR1Z3NkJGZUM1OEhSNHB3bzY3MnBxekFmejQwdVk2dHorQkFE?=
 =?utf-8?B?QUpHRU95SUVmbXdwanpwTCtpUXpCY0d1N0Eza3g5L2RtR0ZrejVRWElueXVm?=
 =?utf-8?B?Q3dObXN0U2kvOERiMlg0K0VibjN0c01ydkpFeVlGNWFvQUFTRWIxSmpkN2hn?=
 =?utf-8?B?ajBpNUlEeXVkQTRQOEVtL2ZFams1WmU1dW10U1ZCVS9lSHJLUS9udUVqcFFU?=
 =?utf-8?B?Q29BY0NCdmtaemRaL3A0QWlGd1FBVnk4aEM0WkJ4b3lTSXBYQWNNaTFKa0RK?=
 =?utf-8?B?V0lvRG0wY2gxdVdjRlZDYi9kUFpBcjArY2ZHUTZLSC9ib2hPNmhJN2VaNXU3?=
 =?utf-8?B?bU83ZXZtK2NKL2VhaW9od2FReTBEMXpwd1krQ2drdEMyVUdlL3BNVk15N214?=
 =?utf-8?B?dmVubjR3aExadEFSZ2JsclFMZjY5Mk11UDZRWmloYXJiODR5V2ppNzBsNGxK?=
 =?utf-8?B?ZmlIbFJjTlRUSTdmMHVDR2VBUEljMGhzWVpoSThvMmtlZHZHdldjN1RNREtU?=
 =?utf-8?B?d3gxeWZISjV4SXlZRkNuRGdTRzIwamxMekNpZWtobnQxckQyaG1oNEJDNFFz?=
 =?utf-8?B?T01MQVZuNVhoMWlNVWIyb3hPSzM4WkFzdzFxWDdJUG9ybG5tLzNxMVFnL0xo?=
 =?utf-8?B?Ym9zRTBhVU8yWGl1QlJPSU9JMnVlUUIwZDFXcjVXUG1XeFhVN0JIYkxGZlBB?=
 =?utf-8?B?U1RaQ29OWDlxZVV4L044QmFVK1dnd1R0WktkM29ZNDZuNjZ5M0RSaGVKNzRC?=
 =?utf-8?B?dDNXbWhQQmF2WmtabU9XSkdXbkxhVzN0Vzk1VlY5ZUpKZlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFpzNlFGNE1xN3NidXFLVm5CY1JMb0lZR01nb1BUalMwTTBiKzdvanhJK3RP?=
 =?utf-8?B?QkV1TEh2VVkrcDFCWkF4TllCRzVkRGtvTnZvendmdCswUkFSNDFzcTRrKzR2?=
 =?utf-8?B?SVpQOFFTcjZlS3Z5SEhvRXV6WlB0QythdmlUc1kvbkJXNFRTTzdsYjdZYlhB?=
 =?utf-8?B?MmlsYVovdkhwdGFudzBQRFhnWVQwK002ZlhkVUw2aXQweDdITGY4WUwvR3Vi?=
 =?utf-8?B?U2U1Z3JsYXRqT1lSUDdmMEZEZ1ZIOUNQUkRIbElqM0pGb1BzT2ZoVTVDYnZ4?=
 =?utf-8?B?Z2s5dkR3cFllbVhjb0E4bUEybjdPclNmTHdqRGNnZjZ1TWZNSEJmVGxNNzJJ?=
 =?utf-8?B?MDZRWDRXTkYvM3BlZk5xNmd5ZHdBWThxT2w5UUhMcExUcU5yMVRicTNkQWR6?=
 =?utf-8?B?Y1ZsVHF2dHNzbzRwVHBZT2EvSUZMSFB1OEkxZW1ObWFBYVdiSTNNaldqeGFI?=
 =?utf-8?B?bVlRRUJhSVIxc0NramhxM29IQk5TTmtKaEhXRWlxcmNsbUhGam9tZ0srcVpa?=
 =?utf-8?B?SnlCK2tqQ3FaR3h1ZXI4QWcwZG9RaGp5c1JkT0FXclVCMEI2d0puZFlvVjVk?=
 =?utf-8?B?d3VCaFRxM0dka3lkcVV4NTR0eTZaQTByeks5b0NnczVsdWdKOGZHc3NoemZU?=
 =?utf-8?B?NENXUEdMQUtaWFVDQW4vUkhCNXg4bGFTNCt6YVpCTDl3R0xGQzJ5NVNLQWdJ?=
 =?utf-8?B?NE05cUFML3FlN2s0Q0poeWoweHo0UnF3eWRlb3ZCS01zZHd0KytEZlNaZ054?=
 =?utf-8?B?SlA5NDNKVU45azh2Y3h2aVFMSkJ6TTJ6VmRVVGZzQ3RmY1FhMnA1NVJES2hX?=
 =?utf-8?B?VDN5dXNTaDRpNExWUm1Ka0l4N3JaRlFVSm1kYURFOWZMWmhIVE03WldnK0N1?=
 =?utf-8?B?dXlTUmNucWZ1VXNmenF5KzM3S0ZraUorVHErUVEzVjRLWHpHWVhVaHRRYVda?=
 =?utf-8?B?NjJJbFdkUmp3U25MSVVvRjBQK05vUG1iTzRaaUFhOGh2SVdoMktEUXdvRlRx?=
 =?utf-8?B?cVVIdHFuSTFnMjNDZU0yMnZyRlpsdFdOc1AwckYzRnlUWkp5NmhxQ2VHOGhm?=
 =?utf-8?B?UldQUzhWa0FrcHJwcE5yWmYrOW1pc0VBaFVQcUN5Rk50QzMyWkU5Tm8wK0Zw?=
 =?utf-8?B?M3hNNlFPNjBRbERkdkNCREd6S0JSVkI2TWxiczNhS1hyMW1QM1owMm5rWkN5?=
 =?utf-8?B?UDdOQkluN1krZFdBS2lka2FvT2VsdVpJeXRuM2N6WGx4WTc0S29XWGNhT213?=
 =?utf-8?B?YkRXcU1lQkV1aTlXZ3pUTVlhaHVQSUNJR0g5SjVaYU9GejdWUHFUWU5lOXNr?=
 =?utf-8?B?UmNyNG5xOEE0NzMzUGhOTGduN3ZNVldUZ28xNGk4MklwbzJnWW0xWGlMcUhU?=
 =?utf-8?B?Q1ZoaXV4RDBHcVo3QXpyeUNaMVRudS9UdURCMGtVUzVLWVc1SmpCcll5aUdV?=
 =?utf-8?B?TC9VSExteFFwbFExTFNWbk5mb1lQUUFXRlBHOWdOYXUrVjZzaSszL1NXSWRm?=
 =?utf-8?B?bHBrdmxrNVVnbXd6MndBWER4aENwK09RNXRCZ05vNDFsVjQ3dXA5YXltd3k0?=
 =?utf-8?B?MFd3ZnlwR1dqRDJCcHd5czlsT3psSmEyZjMyby9HRnU3R1Azendid3JYbWJO?=
 =?utf-8?B?VnRsZTBlZm0vQ1RBSExjb2R0UlI4cjJqeEJBTitkVXZoS2dTWTY2UXdKcmpi?=
 =?utf-8?B?NnpndGxUaDdJRWVGZjFuM1lBditjMXdzdFVESkNqQXU0L1VJODdqQTBXYVpU?=
 =?utf-8?B?WElFZTRUekJDRGRUSzlCQmUraENTQTMvVmRzOEVBMStxWkRVamtaekdMT3Fi?=
 =?utf-8?B?UVU1Um92Nm1acDFFbWViTXpWZnpFV2xyQ0xFR0ZLKzkzY1NNWFdoQXV4M0wr?=
 =?utf-8?B?aG5ZNWFpTmx1dDFmc1NPK2VCQXNVU0RXdzNWWFBMTU1yWFRaWHl3RjNqUmVY?=
 =?utf-8?B?TmJVek1wNGlHc1lpdEtlS0FKWWVrZU5GVDZQUFFiRjlOeXAzbnRpbkRzRUtm?=
 =?utf-8?B?UHY0RUJDZktZRG04Z2FCWUdtb1hjUHkxSHlFMmJ4MXBzTDk3Y1hTc3RMcGY4?=
 =?utf-8?B?SzNMRzIxc1VTQURYTDIyZ2VBcUd6ODNDRjBDdDllM2dMYzNzRWxwT0pUVVRE?=
 =?utf-8?Q?gdWmoFczMIs0Yt9aNMAJNwyAm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230bcd7b-5800-4198-4c64-08dda93e7c55
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 23:19:59.6783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsuERS/LeG5eylsfanYnLSaoInzD3USRjdn635bcB3VO4y37eTdt97qRnK2/90SZ0W3+2NqG8ocH1OR3b1TKrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822
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

Hi Sunil, Both of your patches look good to me as we discussed .

Once Kamil's patch addressing the warning is merged, let's rebase your patches and apply them with the following Reviewed-by Vitaly Prosyak  <vitaly.prosyak@amd.com>

Thanks, Vitaly

On 2025-06-11 07:37, Sunil Khatri wrote:
> Disabled tests to be shown as skipped and not to be
> skipped silently.
>
> Also the --show-list option now shows all the tests
> even if they are disabled unlike before.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  tests/amdgpu/amd_cs_nop.c   |  8 +++-----
>  tests/amdgpu/amd_deadlock.c | 20 +++++++++-----------
>  tests/amdgpu/amd_security.c | 26 ++++++++++++--------------
>  3 files changed, 24 insertions(+), 30 deletions(-)
>
> diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
> index 644016d5d..6ca489412 100644
> --- a/tests/amdgpu/amd_cs_nop.c
> +++ b/tests/amdgpu/amd_cs_nop.c
> @@ -205,20 +205,18 @@ igt_main
>  	}
>  
>  #ifdef AMDGPU_USERQ_ENABLED
> -if (enable_test) {
>  	for (p = phase; p->name; p++) {
>  		for (e = engines; e->name; e++) {
>  			igt_describe("Stressful-and-multiple-cs-of-nop-operations-using-multiple-processes-with-the-same-GPU-context-UMQ");
>  			igt_subtest_with_dynamic_f("cs-nops-with-%s-%s0-with-UQ-Submission", p->name, e->name) {
> -				if (userq_arr_cap[e->ip_type]) {
> +				if (enable_test && userq_arr_cap[e->ip_type]) {
>  					igt_dynamic_f("cs-nop-with-%s-%s0-with-UQ-Submission", p->name, e->name)
> -					nop_cs(device, context, e->name, e->ip_type, 0, 20,
> -					       p->flags, 1);
> +						nop_cs(device, context, e->name, e->ip_type, 0, 20,
> +						       p->flags, 1);
>  				}
>  			}
>  		}
>  	}
> -}
>  #endif
>  
>  	igt_fixture {
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 45a864feb..cb91a500d 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -43,7 +43,7 @@ igt_main
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
>  	struct pci_addr pci;
> -	bool enable_test = false;
> +	bool enable_test;
>  	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
>  
>  	enable_test = env && atoi(env);
> @@ -183,17 +183,15 @@ igt_main
>  					AMDGPU_HW_IP_DMA, &pci, false);
>  		}
>  	}
> +
>  #ifdef AMDGPU_USERQ_ENABLED
> -	if (enable_test) {
> -		igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
> -		igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
> -			if (userq_arr_cap[AMD_IP_GFX] &&
> -			    is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
> -				igt_dynamic_f("amdgpu-umq-illegal-reg-access")
> -				bad_access_ring_helper(device,
> -					CMD_STREAM_TRANS_BAD_REG_ADDRESS,
> -					AMDGPU_HW_IP_GFX, &pci, true);
> -			}
> +	igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
> +	igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
> +		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
> +		    is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
> +			igt_dynamic_f("amdgpu-umq-illegal-reg-access")
> +			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
> +					       AMDGPU_HW_IP_GFX, &pci, true);
>  		}
>  	}
>  #endif
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index 45bd7e771..e371aec19 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -316,7 +316,7 @@ igt_main
>  	int r, fd = -1;
>  	bool is_secure = true;
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
> -	bool enable_test = false;
> +	bool enable_test;
>  	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
>  
>  	enable_test = env && atoi(env);
> @@ -361,21 +361,19 @@ igt_main
>  			AMDGPU_HW_IP_DMA), is_secure);
>  
>  #ifdef AMDGPU_USERQ_ENABLED
> -	if (enable_test) {
> -		igt_describe("amdgpu gfx command submission write linear helper with user queue");
> -		igt_subtest("gfx-write-linear-helper-secure-umq")
> -		if (userq_arr_cap[AMD_IP_GFX])
> -			amdgpu_command_submission_write_linear_helper(device,
> -							get_ip_block(device, AMDGPU_HW_IP_GFX),
> -							is_secure, true);
> -
> -		igt_describe("amdgpu compute command submission write linear helper with user queue");
> -		igt_subtest("compute-write-linear-helper-secure-umq")
> -		if (userq_arr_cap[AMD_IP_COMPUTE])
> -			amdgpu_command_submission_write_linear_helper(device,
> +	igt_describe("amdgpu gfx command submission write linear helper with user queue");
> +	igt_subtest("gfx-write-linear-helper-secure-umq")
> +	if (enable_test && userq_arr_cap[AMD_IP_GFX])
> +		amdgpu_command_submission_write_linear_helper(device,
> +						get_ip_block(device, AMDGPU_HW_IP_GFX),
> +						is_secure, true);
> +
> +	igt_describe("amdgpu compute command submission write linear helper with user queue");
> +	igt_subtest("compute-write-linear-helper-secure-umq")
> +	if (enable_test && userq_arr_cap[AMD_IP_COMPUTE])
> +		amdgpu_command_submission_write_linear_helper(device,
>  							get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
>  							is_secure, true);
> -	}
>  #endif
>  
>  	igt_fixture {
