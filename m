Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D50FC25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 21:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4914D10E0BA;
	Thu, 23 May 2024 21:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DOu5rX7Y";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D2D10ED1E
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 21:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jK7LhZSANX/fDGucK6HnPRm8zXKwwlYon1moLeAMQpgtrNmHbPX1NUdTpxfUdSjiwvdHy+lEIf44aCr8qzDUTGFbBn6Xk3yBF+PZikLsRkTIJbQAr+y3cQD3nffUmF8+h/eOrtaH2kR5IX+JTRueHR62ihhnCNTmyiXkggcv5VD+JkdD2t2B7wYR3zJxgmdBauP6QorD+V9ljocz5NJMu/B/bMoGGZ2awkIav2segY6klqYsowgPxXva1PuFaNiIpWFQm+GiSw6f3kVBdPBTeyH6g79mumsi6q+kdCyosUa9ym+AAv9gs87EynKWEIO2qGGUnFZpSvD+sfAobvsG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmXK47NsaOBsiyU0D11HideSzQPKvQ02YyN2vMMk3U8=;
 b=C3tvTx0DD+c6tktym1iV9V4Q97YgXYStf4o6i1UCVswMzr6Tk5DHaG4pgxLSE7PuK+WLwuY6l8/ejW0FSQYqwZn/6gDfpG+Yq+2H4SQBuxjGpHCxPRHhcjRhcexDoiXqAIVtQNb1e8RZYxqnhj+eWmo3KoIhNiTymz0Cvd8fY+hl4k4/gpTkGiG0/qC+rIPh+HOxKITlzkWZqNxGIb687Fy7h4eRsQg3QjJ9H38WDc/NxijslGfJ76ClqiCjIEtjFOY0lEVKVhfNknLYs9q3tFA9agtAthYdm0UcxGKEuPpbBMPeguytY7B3eOwYSFuGoENfReSbG8sN/aBXOYfkIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmXK47NsaOBsiyU0D11HideSzQPKvQ02YyN2vMMk3U8=;
 b=DOu5rX7YtOrLqCfvTpoYPtWlO9tzdBYwooTKVSRky2GfhT/iCiJ3wOGvXPfFP+yZF+2TOWJwDWZRddHQrdl/sUXWL+0SZ33aoTIkDfmz7+jVSnJW5mAf3pBiJMjlqb6nTiDOiLV0fQakyp/5jOBUDU9Be2MNFYO1UL/1uBvbZ4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Thu, 23 May
 2024 21:39:41 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%6]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 21:39:40 +0000
Message-ID: <3920ea3b-c027-4ca4-9967-6680616c85d3@amd.com>
Date: Thu, 23 May 2024 17:39:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2] tests/amdgpu/amd_replay: Add amd_replay IGT test
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo.Siqueira@amd.com, alex.hung@amd.com
References: <20240510030142.47958-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240510030142.47958-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::14) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: b23be87e-f1dc-404d-0fda-08dc7b70da3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0I1U2h3UlM3dVV6dnl0eGgyZDBJMmIvSFlMUkE0SGw0U21sL09ENitiT1I2?=
 =?utf-8?B?M3BkMmVNTzBYTlhWMGdTZkNNM3k2dzVuaURwdTg3aHpXdlZkR3BQMjdoNWdB?=
 =?utf-8?B?d2dIdHl1Z1hkU3AxdDVwMFpjYms2QkFydi9MSTRoa2UyZC9jSFc1TWZTT096?=
 =?utf-8?B?OWlYQzQxZThja0Z1bkl4aFBKRlhRcDNkdFh6dUM2aXUrWWpRNFJVc25WKy9R?=
 =?utf-8?B?U2Y0RHNmaGFqLyt0ZXFRend1MmRDeHlFYytZaHZJRTQwRGxUUnVDb1dDUVMv?=
 =?utf-8?B?TXRsbGxGNmRQYmVhZlBBeE82SmhvOTJXRWdsNndJNTNWbDN5TXRCMjg4TVNx?=
 =?utf-8?B?STdMbExwcmpLM1NqWVJKSWVhZ09aUnlxNThYbVgzdCs1eDNiV3R1ZXViTDdK?=
 =?utf-8?B?VTRPRTZsZVVNQzRFc2JENisyd09SVmF6REtWZkVEZWd2d2hGVDVVWG56UkJx?=
 =?utf-8?B?YkxacGpjVlJEZ1F0VTdGaW95K0tqMjNXUDhGKzdqT1E0ZjBpNmZjVzhhZDFK?=
 =?utf-8?B?dlFBL05zcStvQXVxUlBUNTltR2JvNFJiMWlFcThhWjUxYzlKZ2R3TWluYmNL?=
 =?utf-8?B?WUhFbDZ5U3V3WWNMa3QvSm9YenRZK2pzNTNaUkRVSWdqZ2FqMXFzWmJlSDJC?=
 =?utf-8?B?UW8rRWowTkV4SlJLQ1FIam5VSEVQY0JYM2xZcFM0UnNCWWl4dXRDZm1RUm5Y?=
 =?utf-8?B?SHpQR0VmYThDTEJpaGxLWFFyNzkxNU82Z0paOUd0ai92YzlYdUhXZFdEb2Vw?=
 =?utf-8?B?VU5wcG04Qlc3OXZHWEFTb2FUVlA4UWJDUExFQUFWL0JmYklNM25lc2RDS1Nk?=
 =?utf-8?B?N1JTZ3J1amY2elRHQ0w2dVZtWW1qOGFKd25nNU5QcWJ6ZW80Z2lXQ3pnSXdw?=
 =?utf-8?B?SU1kUmp6L2hlcWQ0bXJMRzIxbUh0eFZSRFNVaWFOZ285RkhFamdNRENYbjlM?=
 =?utf-8?B?aGJJOVhTWFlTSlhSYVU1SHI3MFNJMTFCcDQ4LzNRYnZiMWNEdU5KN2kwRVRk?=
 =?utf-8?B?c0YzYW9rMUR5VVF5cnArMEwxdkQyd05oZUdXY3pkalU2eFlBUmJYSkxEZ3Zv?=
 =?utf-8?B?VkVHcGk2RkJ4ZG9LK3BYODBBMzNBVmV5emhwL2hFNkU1cjk5dFdCZkxnRlRO?=
 =?utf-8?B?aWVISkV6RktaZEx6RkRlVk40MGxVVnRhZitXTkxaaHNJR3NKZFBTMElQRGZh?=
 =?utf-8?B?dURkb1hyUXpQNDlBdkRFRGFEeU1JbFRNWWZnRlp1V05yNisxa1IzNDZVM3Rn?=
 =?utf-8?B?RWxsNVdtYVZsUW5OMjh5MmZEaGxqNEltUzIxRC9BS1JNT2lUYVYyQUE0S2pa?=
 =?utf-8?B?YnlWcUdzT0UxZW83UUdFZkxWb1RXYTArL2lCNXZEWXB4R3o4L2xkbG9EZG1D?=
 =?utf-8?B?b0k4ZlNBMVRjRW1PeDlLMnlML2tiYTI0UnN2WVowbnpOOXJiV2NtdVBoNkYx?=
 =?utf-8?B?MkRObXVTT3RLOTc3akJsRXhhYXo0cnlGb1lyR3VvU0hyQXVFQmlMS3NJQWpy?=
 =?utf-8?B?Z3h0cCtic0hSUTB6NHJZNG4rcXlXc2FOWU1jRUJmOEh6KzVWZTVrNnlnMkZE?=
 =?utf-8?B?alNnOG8xU09YKzVFU0tOUnVsaVFRS1kxWDA1dXAvbHdTdVppVnYwblM2dlox?=
 =?utf-8?B?T0VwV1dXUjRUcnp5c0FuZitGVGNhaVpncFl4aTc3V1J6VWVsNW5FemhmbWF3?=
 =?utf-8?B?em9rcWUvTTMvcDlxbDRTUnNWZDg0VXcxbk1DRE9IUWlPRjNrUDZmQmNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUZxTTJYUkdoaGIyclV3eDBGQ3dJUXVGTGllM05lb0VxUk1oR2NwdDd2MW1a?=
 =?utf-8?B?c0UxR2NuNTRWSzhVakZpcDZvWWFyeGo1bDNoUE9RWXFlUU5jMlpudzF4d3lS?=
 =?utf-8?B?emlqVHdCdnFRRHlZVWN6SUJKbW5oTEgzbHBlWGJlR1VjZ21FNi9NV2t2czJI?=
 =?utf-8?B?VlloazErRHNSQ1hES29pTXZ0bkd0NkRBdTY0d2k5OWFiNkN2dk1DbVJ4MWN3?=
 =?utf-8?B?R2NvZU1HY1p1T2NHczlsUFpQZFZxZTIrTm94TXJIbzdrV1JJb1hmaTNoOTV4?=
 =?utf-8?B?RWJCQ0JPWlZrMTBrV2JyUGtuZVZmNFJBTytPSHdjTWIwK2lsUHNmT3h6azhs?=
 =?utf-8?B?V1F4dFFuSnQyb3V2SksxSmZ0eTl4T3BBZ00wUS9JejR3OGNGcWs3ZXJLWVFi?=
 =?utf-8?B?My93aE5mWUx1ZVpHeUloQjJvUnBVaU9uRzNvbDM3YXpPSjZ3VVZHYnhlYzly?=
 =?utf-8?B?SEc2cW8zdndGQlBrSTNrS2tSdFpDMUl2UmdsQy96bUo4SDBrRldET3dWWkt3?=
 =?utf-8?B?YzBkcENzMm5lY3hyU0dyQXl6dHpab0w3SXlRU3l5UzVLa1ZaeFhZSGNsVWxI?=
 =?utf-8?B?K3Z1elZhSHpCeVpBSHRpMTRtNEpRbFRIZngxRG1xN1UwQ1plbk9LL1VTdlZE?=
 =?utf-8?B?b3FpOCtuRCtRUDlhQktXRGhCQTQ2RWo4bncySlkwMUNZUGtMbXJmQWw0UmJ1?=
 =?utf-8?B?eGZTcW1HMkNidUJxc1JkV2FEOUYxTFhmTFUwZ3U3TTgvcFlBSVk2bEZzSVBk?=
 =?utf-8?B?OXh2S2R3U1FXejhiNi9nNXA3UGFFRDRxd000aGRNY1lUWG5sZkg1T1NaUWRY?=
 =?utf-8?B?T1drclVxSkRha1JjNlJqUExTTHdmY2FzdFM2dnZhZmlJWDc5ai9nMEFpVjR4?=
 =?utf-8?B?OHVsMmdrNDd5WkNMbnRZR0k2MHBpdXVISWxuZGYxMVdHdHVHV1c0UzZJa3l5?=
 =?utf-8?B?R09welZVZnJQbGxPY0U1K3dSV2pRNmVYY2h1VDF0cnZycW5ORFphVDlBY1dU?=
 =?utf-8?B?QUFwZ2ozMXlWYmYrb2F4cnd0eVdvMHh2NWpaNG1VbDVNZUxEVXpKZ00vNzky?=
 =?utf-8?B?ZnY2aElDMVNOeXhRd0ZnMUZXc0prNUJLNm9HVVJrWlhNOVowb09TWTNSKzMv?=
 =?utf-8?B?dER4NzVhcEl3YlR2eFlSdnNCUnFFMlRtMHFITGI4Mllmd1pTMXcxcGNhVlZo?=
 =?utf-8?B?aGxyUjU4c1MrZ292Qm9LdExVbFRQajI0UTRacmplQzZnSCt0MjJEQjV2aWFv?=
 =?utf-8?B?cTBReHhnWGliQ1hPbUpVNi9oS0RxaHM3UkFDeHF1VTh5SjNvUWJhMDBPQW9T?=
 =?utf-8?B?OUMvM2JkUnFyZjFBakFhd1J0OEJzb3ViYUhXVzJsaU5WbDlhc2xmWGVJaFJV?=
 =?utf-8?B?UHB1QVhobXk1ZVAza21IL2diQ01jY3dNVER6Qk5mYXlGYm9rZGdLZVMyczMr?=
 =?utf-8?B?ZmJ5aUNKVmxaTTNjdVF3azVOWE12VWtiNmVPUFVIRFFSaXNZMnJvdy9QbmhN?=
 =?utf-8?B?Uzl5bk9Gc1ZMRVJUT1BRbTQrdVlEbkJLUWx3V0pmRDN3Yk1vSDVWVDdhYzJq?=
 =?utf-8?B?UDNXL1lBK2FSNWd4ZFpzVTdHOHhGcEtlTG5qQ3psMWdxWG9XUnlYcm16N1Nh?=
 =?utf-8?B?ZTdXeUtZU0hyUU1TSDJQSm1FOFRLQWVpVmVhaUxMdkFFY2Z2NmhGd2EwTDAz?=
 =?utf-8?B?VEVtYmJEZGp6M1kyZkpEQTNzUngxNTBvVEtORXdRYmV2VmxTZVY2bngwRlEx?=
 =?utf-8?B?dGR0SkJhaTB1OHhsVmw0VWN3ZWx5OVFQM2lQZmkwT1ZqaVY1VTRwN2xEOHlO?=
 =?utf-8?B?bUovd0ZTN3ZtVlVxQkpoU3dTTjlWaHNhK3BTT2NqN3pVdTVSM2IzU0dmcnRy?=
 =?utf-8?B?QUluOGFEbDF5dGxObU94M0paSG03ZUE3NEJEZVU0VzNscnN2TnNmSVdyMzMv?=
 =?utf-8?B?SDdCNWFrRm9MU2loNmpGQjhVSFY3WVoyMXVhSUQ0anFPZ0VoY3E2a01YWEV5?=
 =?utf-8?B?VCtuL3hTRnpQQUtHZHBiMjhsekFWRWFodkdHOWMyUTlDK295REtURnZnalJl?=
 =?utf-8?B?eE0yK09pUy9iS1h3dG5aWlFrc2oxY2MwUkdaZ3FUa2s0cDRZTERZTzA3Rll5?=
 =?utf-8?Q?RAu/W7D0VeLZFFDjeHqSFS2ip?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23be87e-f1dc-404d-0fda-08dc7b70da3b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 21:39:40.8755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uox+s1Dq/BRxj75QrAu/ALkoCIlIN6+vkO0/J3M/ZEfbPXhZh49hfFTvGaw4bApq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572
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



On 2024-05-09 23:01, Tom Chung wrote:
> [why]
> Add a basic IGT test for panel replay feature.
> 
> [how]
> Subtest case
> 
> a. static screen
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Stop video flip and wait for a while.
>     4. Check if replay state is in Replay mode.
> 
> b. Live mode (intermittent)
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Check if replay state is in Live mode.
>     4. Stop video flip and wait for a while.
>     5. Check if replay state is in Replay mode.
>     6. Repaet 2 to 5.
> 
> c. Live mode (constant)
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Check if replay state is in Live mode.
> 
> Cc: Leo Li <sunpeng.li@amd.com>
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>

Reviewed-by: Leo Li <sunpeng.li@amd.com>
Thanks!

> ---
>   v2: Modify the include header files in tests/amdgpu/amd_replay.c
> 
>   lib/igt_amd.c             | 102 ++++++++++++
>   lib/igt_amd.h             |  39 ++++-
>   tests/amdgpu/amd_replay.c | 318 ++++++++++++++++++++++++++++++++++++++
>   tests/amdgpu/meson.build  |   1 +
>   4 files changed, 459 insertions(+), 1 deletion(-)
>   create mode 100755 tests/amdgpu/amd_replay.c
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 149af5151..8bc6fdc6a 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1014,6 +1014,108 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
>   	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_ILR_SETTING);
>   }
>   
> +/**
> + * igt_amd_output_has_replay_cap: check if eDP connector has replay_capability debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_CAP);
> +}
> +
> +/**
> + * igt_amd_replay_support_sink: check if sink device support Panel Replay
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name)
> +{
> +	char buf[128];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		DEBUGFS_EDP_REPLAY_CAP, connector_name);
> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	return strstr(buf, "Sink support: yes");
> +}
> +
> +/**
> + * igt_amd_replay_support_drv: check if driver support Panel Replay
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name)
> +{
> +	char buf[128];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		DEBUGFS_EDP_REPLAY_CAP, connector_name);
> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	return strstr(buf, "Driver support: yes");
> +}
> +
> +/**
> + * igt_amd_output_has_replay_state: check if eDP connector has replay_state debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_STATE);
> +}
> +
> +/**
> + * @brief Read Panel Replay State from debugfs interface
> + * @param drm_fd DRM file descriptor
> + * @param connector_name The connector's name, on which we're reading the status
> + * @return Panel Replay state as integer
> + */
> +int igt_amd_read_replay_state(int drm_fd, char *connector_name)
> +{
> +	char buf[4];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n", connector_name);
> +		return -1;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_STATE, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		DEBUGFS_EDP_REPLAY_STATE, connector_name);
> +
> +	return strtol(buf, NULL, 10);
> +}
> +
>   /**
>    * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
>    * @drm_fd: DRM file descriptor
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index 6780b99de..a41b423b7 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -47,6 +47,8 @@
>   #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
>   #define MAX_SUPPORTED_ILR 8
>   #define MULTIPLIER_TO_LR 270000
> +#define DEBUGFS_EDP_REPLAY_CAP "replay_capability"
> +#define DEBUGFS_EDP_REPLAY_STATE "replay_state"
>   #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
>   #define DEBUGFS_EDP_PSR_STATE	"psr_state"
>   #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
> @@ -100,6 +102,35 @@ enum dc_link_training_type {
>   	LINK_TRAINING_NO_PATTERN
>   };
>   
> +/*
> + * enumeration of REPLAY STATE below should be aligned to the upstreamed
> + * amdgpu kernel driver 'enum replay_state' in dmub_cmd.h
> + */
> +enum replay_state {
> +	REPLAY_STATE_0 = 0x0,
> +	REPLAY_STATE_1 = 0x10,
> +	REPLAY_STATE_1A = 0x11,
> +	REPLAY_STATE_2 = 0x20,
> +	REPLAY_STATE_3 = 0x30,
> +	REPLAY_STATE_3INIT = 0x31,
> +	REPLAY_STATE_4 = 0x40,
> +	REPLAY_STATE_4A = 0x41,
> +	REPLAY_STATE_4B = 0x42,
> +	REPLAY_STATE_4C = 0x43,
> +	REPLAY_STATE_4D = 0x44,
> +	REPLAY_STATE_4B_LOCKED = 0x4A,
> +	REPLAY_STATE_4C_UNLOCKED = 0x4B,
> +	REPLAY_STATE_5 = 0x50,
> +	REPLAY_STATE_5A = 0x51,
> +	REPLAY_STATE_5B = 0x52,
> +	REPLAY_STATE_5A_LOCKED = 0x5A,
> +	REPLAY_STATE_5B_UNLOCKED = 0x5B,
> +	REPLAY_STATE_6 = 0x60,
> +	REPLAY_STATE_6A = 0x61,
> +	REPLAY_STATE_6B = 0x62,
> +	REPLAY_STATE_INVALID = 0xFF
> +};
> +
>   /*
>    * enumeration of PSR STATE below should be aligned to the upstreamed
>    * amdgpu kernel driver 'enum dc_psr_state' in dc_type.h
> @@ -135,7 +166,8 @@ enum amdgpu_debug_visual_confirm {
>   	VISUAL_CONFIRM_HDR	= 2,
>   	VISUAL_CONFIRM_MPCTREE	= 4,
>   	VISUAL_CONFIRM_PSR	= 5,
> -	VISUAL_CONFIRM_SWIZZLE	= 9
> +	VISUAL_CONFIRM_SWIZZLE  = 9,
> +	VISUAL_CONFIRM_REPLAY = 12
>   };
>   
>   uint32_t igt_amd_create_bo(int fd, uint64_t size);
> @@ -189,6 +221,11 @@ void igt_amd_write_ilr_setting(
>   	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
>   	uint8_t link_rate_set);
>   bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name);
> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name);
> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name);
> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name);
> +int  igt_amd_read_replay_state(int drm_fd, char *connector_name);
>   bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
>   bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
>   bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> new file mode 100755
> index 000000000..f96d856f8
> --- /dev/null
> +++ b/tests/amdgpu/amd_replay.c
> @@ -0,0 +1,318 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + */
> +
> +#include "igt_amd.h"
> +
> +/* hardware requirements:
> + * eDP panel that supports Panel Replay
> + */
> +IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
> +
> +#define REPLAY_SETTLE_DELAY 10
> +
> +/* Common test data. */
> +struct test_data {
> +	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	igt_pipe_t *pipe;
> +	drmModeModeInfo *mode;
> +	enum pipe pipe_id;
> +	int fd;
> +	int debugfs_fd;
> +	int w, h;
> +};
> +
> +struct {
> +	bool visual_confirm;
> +} opt = {
> +	.visual_confirm = false,	/* visual confirm debug option */
> +};
> +
> +const char *help_str =
> +"  --visual-confirm           Panel Replay visual confirm debug option enable\n";
> +
> +struct option long_options[] = {
> +	{"visual-confirm",	required_argument, NULL, 'v'},
> +	{ 0, 0, 0, 0 }
> +};
> +
> +enum test_mode {
> +	TEST_MODE_STATIC_SCREEN = 0,
> +	TEST_MODE_INTERMITTENT_LIVE,
> +	TEST_MODE_CONSTANT_LIVE,
> +	TEST_MODE_COUNT
> +};
> +
> +/* Common test setup. */
> +static void test_init(struct test_data *data)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	/* It doesn't matter which pipe we choose on amdpgu. */
> +	data->pipe_id = PIPE_A;
> +	data->pipe = &data->display.pipes[data->pipe_id];
> +
> +	igt_display_reset(display);
> +
> +	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
> +	igt_require(data->output);
> +	igt_info("output %s\n", data->output->name);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_assert(data->mode);
> +	kmstest_dump_mode(data->mode);
> +
> +	data->primary =
> +		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +
> +	data->w = data->mode->hdisplay;
> +	data->h = data->mode->vdisplay;
> +
> +	if (opt.visual_confirm) {
> +		/**
> +		 * if visual confirm option is enabled, we'd trigger a full modeset before test run
> +		 * to have Panel Replay visual confirm enable take effect. DPMS off -> ON transition
> +		 * is one of many approaches.
> +		 */
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
> +				DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
> +				DRM_MODE_DPMS_ON);
> +	}
> +}
> +
> +/* Common test cleanup. */
> +static void test_fini(struct test_data *data)
> +{
> +		igt_display_t *display = &data->display;
> +
> +		igt_display_reset(display);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +}
> +
> +static int check_conn_type(struct test_data *data, uint32_t type)
> +{
> +	int i;
> +
> +	for (i = 0; i < data->display.n_outputs; i++) {
> +		uint32_t conn_type = data->display.outputs[i].config.connector->connector_type;
> +
> +		if (conn_type == type)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static bool replay_mode_supported(struct test_data *data)
> +{
> +	/* run Panel Replay test if eDP panel support Panel Replay */
> +	if (!igt_amd_output_has_replay_cap(data->fd, data->output->name)) {
> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_CAP);
> +		return false;
> +	}
> +
> +	if (!igt_amd_output_has_replay_state(data->fd, data->output->name)) {
> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_STATE);
> +		return false;
> +	}
> +
> +	if (!igt_amd_replay_support_sink(data->fd, data->output->name)) {
> +		igt_warn(" output %s not support Panel Replay mode\n", data->output->name);
> +		return false;
> +	}
> +
> +	if (!igt_amd_replay_support_drv(data->fd, data->output->name)) {
> +		igt_warn(" kernel driver not support Panel Replay mode\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void run_check_replay(struct test_data *data, enum test_mode test_mode)
> +{
> +	int edp_idx, ret, frame_count, replay_state;
> +	igt_fb_t ref_fb, ref_fb2;
> +	igt_fb_t *flip_fb;
> +	igt_output_t *output;
> +
> +	test_init(data);
> +
> +	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> +
> +	/* check if eDP support Panel Replay. */
> +	igt_skip_on(!replay_mode_supported(data));
> +
> +	for_each_connected_output(&data->display, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6,
> +				    0.6, 0.6, &ref_fb);
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0,
> +				    0.4, 0.14, &ref_fb2);
> +
> +		igt_plane_set_fb(data->primary, &ref_fb);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +		flip_fb = &ref_fb;
> +		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +					flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		kmstest_wait_for_pageflip(data->fd);
> +
> +		/* Panel Replay state takes some time to settle its value on static screen */
> +		sleep(REPLAY_SETTLE_DELAY);
> +
> +		/* Check Panel Replay state */
> +		replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
> +		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
> +		igt_fail_on_f(replay_state < REPLAY_STATE_2,
> +			"Panel Replay was not enabled for connector %s\n", output->name);
> +
> +		/* Do some page flip and let the replay go into live mode */
> +		for (frame_count = 0; frame_count <= 20; frame_count++) {
> +			ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +					flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +			igt_require(ret == 0);
> +			kmstest_wait_for_pageflip(data->fd);
> +
> +			if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
> +						&& frame_count > 5) {
> +				/* Panel Replay state needs few frame to enter the live mode */
> +				replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +				igt_debug("replay_state live mode = 0x%X\n", replay_state);
> +				igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
> +						"State should be REPLAY_STATE_4 (Active with single frame update)\n");
> +			}
> +
> +			if (frame_count % 2 == 0)
> +				flip_fb = &ref_fb2;
> +			else
> +				flip_fb = &ref_fb;
> +		}
> +
> +		/* Check Panel Replay state in static screen */
> +		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
> +			/* Panel Replay state takes some time to settle its value on static screen */
> +			sleep(1);
> +
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			igt_debug("replay_state static mode = 0x%X\n", replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +					"State should be REPLAY_STATE_3 (Active)\n");
> +		}
> +
> +		/* Do another page flip if we do the replay_intermittent_live test */
> +		if (test_mode == TEST_MODE_INTERMITTENT_LIVE) {
> +			for (frame_count = 0; frame_count <= 30; frame_count++) {
> +				ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +						flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +				igt_require(ret == 0);
> +				kmstest_wait_for_pageflip(data->fd);
> +
> +				if (frame_count > 5) {
> +					/* Needs few frames to let state enter the live mode */
> +					replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +					igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE during flip = 0x%X\n",
> +							replay_state);
> +					igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
> +							"State should be REPLAY_STATE_4 (Active with single frame update)\n");
> +				}
> +
> +				if (frame_count % 2 == 0)
> +					flip_fb = &ref_fb2;
> +				else
> +					flip_fb = &ref_fb;
> +			}
> +
> +			/* Panel Replay state takes some time to settle its value on static screen */
> +			sleep(1);
> +
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
> +					replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +					"State should be REPLAY_STATE_3 (Active)\n");
> +		}
> +
> +		igt_remove_fb(data->fd, &ref_fb);
> +		igt_remove_fb(data->fd, &ref_fb2);
> +	}
> +
> +	test_fini(data);
> +}
> +
> +static int opt_handler(int option, int option_index, void *data)
> +{
> +	switch (option) {
> +	case 'v':
> +		opt.visual_confirm = strtol(optarg, NULL, 0);
> +		igt_info("Panel Replay Visual Confirm %s\n", opt.visual_confirm ? "enabled" : "disabled");
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +igt_main_args("", long_options, help_str, opt_handler, NULL)
> +{
> +	struct test_data data;
> +
> +	igt_skip_on_simulation();
> +	memset(&data, 0, sizeof(data));
> +
> +	igt_fixture
> +	{
> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
> +
> +		if (data.fd == -1)
> +			igt_skip("Not an amdgpu driver.\n");
> +
> +		data.debugfs_fd = igt_debugfs_dir(data.fd);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(&data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +
> +		/* check if visual confirm option available */
> +		if (opt.visual_confirm) {
> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
> +			igt_skip_on_f(!igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_REPLAY),
> +				      "set Panel Replay visual confirm failed\n");
> +		}
> +	}
> +
> +	igt_describe("Test whether Panel Replay can be enabled with static screen");
> +	igt_subtest("replay_static_screen") run_check_replay(&data, TEST_MODE_STATIC_SCREEN);
> +
> +	igt_describe("Test whether Panel Replay can be enabled with intermittent live mdoe");
> +	igt_subtest("replay_intermittent_live") run_check_replay(&data, TEST_MODE_INTERMITTENT_LIVE);
> +
> +	igt_describe("Test whether Panel Replay can be enabled with constant live mdoe");
> +	igt_subtest("replay_constant_live") run_check_replay(&data, TEST_MODE_CONSTANT_LIVE);
> +
> +	igt_fixture
> +	{
> +		if (opt.visual_confirm) {
> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
> +			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
> +				      "reset Panel Replay visual confirm failed\n");
> +		}
> +		close(data.debugfs_fd);
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 3982a665f..69706fa70 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -30,6 +30,7 @@ if libdrm_amdgpu.found()
>   			  'amd_prime',
>   			  'amd_psr',
>   			  'amd_ras',
> +			  'amd_replay',
>   			  'amd_security',
>   			  'amd_uvd_dec',
>   			  'amd_uvd_enc',
