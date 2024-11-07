Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DB1D5AE4C
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 03:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041FB10E305;
	Thu,  7 Nov 2024 03:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1FMaUP6o";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF9310E300
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 03:15:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pf5lbNignf16EhHGchWqqUoOkGrykV46vAg0IszkRUBkxy7le746QbIs6eWKQzwsQG7kVbC9vvdOwPYotjthmo42Y2B3os9hOFDP54Q37QuK2VEA7z3NbJOVxBp8w2EH0V3iBwHhVay046fIWrsOh/S9ttaRWeHDRiM/SNMghB3YGVxelgde3L3rAJ8SjW7atZJxDbM2c0/LRzXnysK/QriZ7EkqPGEjci0tDtrmyzIwWE8ZvA+WCi/5wmpfl0osZ6HjUTeD97xazOMBfi/ALMdGWDg6VYlaQzrFkuEAiAyC5Eb8P2lwzRPNATWvT/geOeBhhHXcg2sZ/qhmV3g42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAm/r/IGJj7Oc+CaerLowrh4arZXFvVU1/69L+fHw5c=;
 b=OYlZqv2puDmd2DO8Zg22Fs7SL6noogqDPiQ3UZP7eAYlrB6POB5BO0tgNHaDwiysLPyBSC59p8rpeAAY73qfOpZh6c5B545F5VNrjbGu+vg1jdYsqHUenDPPI98U8qhZzs8iO+LV4eWUjGDX/7xhPAuHQzQNOxBdgmy7h8E/0avOw0P01zSKsxziPQPziCAUzYxQDEMK4YgAi1khJXQdpar7rkqBXb1q4o+Ea76A59DRRCAeomnBrPoyoZ6dZU3dWQ5MJdY+QsUvFg2DYG5GM9eeLRVwS2gAIXhsnHV1iQJB4UpTUCjQcyLsL9/VbNL2bL3k+Tszc7Jw2eYOYJWLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAm/r/IGJj7Oc+CaerLowrh4arZXFvVU1/69L+fHw5c=;
 b=1FMaUP6otLeFrOzlKJmi0iP+K/NLUyioJjj3rqaps+kmUvbxyoARiLtqu4GNQbxadCHxb4vhXPULfOf5R9Q8IKpLg8gd86uqDO6ARy1W1Bu+K+ZK/Hv+YpvhH2KtJPdLzwKPnkiHuiJO453nVK3ki3K+o6o+0c+qeVZFbHQxYLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Thu, 7 Nov
 2024 03:15:49 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d%5]) with mapi id 15.20.8114.028; Thu, 7 Nov 2024
 03:15:49 +0000
Message-ID: <db9af8bf-4d79-4a8c-9b93-2f3b9b4f79ab@amd.com>
Date: Thu, 7 Nov 2024 11:15:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2] tests/amdgpu/amd_abm: Fixed tests to only run on one
 output per pipe
Content-Language: en-US
To: george.zhang@amd.com, igt-dev@lists.freedesktop.org
Cc: sunpeng.li@amd.com, alex.hung@amd.com
References: <20241106165058.35171-1-george.zhang@amd.com>
From: "Chung, ChiaHsuan (Tom)" <chiahsuan.chung@amd.com>
In-Reply-To: <20241106165058.35171-1-george.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0010.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::19) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de0a763-a5cf-405e-09b6-08dcfeda7a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2VObG9IdGxzTEhqcnh2YXB1QllkQ213TFBiK3lXY0F3bU1nV25ZNE4vQXJu?=
 =?utf-8?B?V0gxNXJYV0gybWlOeU94OE5wNVZCdDVUdzJTUFZDd3d0ZTM3V0NPL0FFZmVt?=
 =?utf-8?B?V2ZtNWJQOVdhZG1ZbXg5R1dGR2w2WFpwVUdNRW83TFRzWHRwaXVUNTd3Vmwr?=
 =?utf-8?B?MkZIc2ZBdjJ2TFhSa1pmdWpta2RIUmYwdEJIT20zWVJEa0ZsVXBXdGFGZ01t?=
 =?utf-8?B?TjZwNStmZSs5d3VJdVlSVElIaTg4Ly9UTm1rRGJBK3p2bkdtVUxKUlR3Ym9m?=
 =?utf-8?B?ODhlWUQyS0tBTmgyaXVVQUI1QmRWOXUwWXVZUUJBTmFxVVdxUzZ1MUFTNkJU?=
 =?utf-8?B?Y1Z1L2FTMXM5U3RNaVZBWmJVcHV4K3NCSG12bk1RbUZHcFR0S2pCWG00eExP?=
 =?utf-8?B?bmFxYktIWldUOFlRcDhWYWpkVUIrR0ZQNzFCWkFVa2lLb2QwVjIwWG9SVjZ4?=
 =?utf-8?B?anNRTWNxRnlQeHZqNmJWbkpQc29MYXhKemZzQ2VJZjdGbFBMaTFKZ1V2OTgz?=
 =?utf-8?B?VlRwSkNBYXlMUjlsOWtXWDlUNDhTTjBKK2RPV050bGUyWlFKazNyczZRWkxR?=
 =?utf-8?B?NFp2dFYrejVoSkpqYnkwS21DVXFOZzlsUDNUajd0TkxBSC9RZlZ3QlQ0d2pv?=
 =?utf-8?B?UllmT1BydUpLdEdWTThrQVAybzVPT1dQYTIwazhjeVZGbHA1SXJ0R0NsTTRr?=
 =?utf-8?B?WWl6WDd3c2pEVDl1Zld3SWNWQ04rUDhqSXNSM1I1TFpib3pIS0FPdDhQMHBF?=
 =?utf-8?B?WnoyeTFLSWUxSzF5NWk1a1hjdDhVYzhCR2c0ZHJ6ZUUrMG8wWElsSHF1aUdX?=
 =?utf-8?B?NmcxY09xbFozS3NpdVQvNk12VTYzbDB4S1dteXc4UEM5SjgxeksvaTJnQ0o2?=
 =?utf-8?B?K044VU9UQ0w2dnFKSTdLS0RiR0hyRnBJZUtxYUcrcHN3OFJFUzgwcWYzQ2pn?=
 =?utf-8?B?bUtnR01GNFlhU2RJbmtIdENrT1JRMW1FVTE5VU41TW55K1FqQWNEdWoxdXJl?=
 =?utf-8?B?K1hwRjVpMUJaOVJqQ3Z2Ry8vTzRZVDR3cnFQSGtIb0Q5MkVGMC9NQkRJaXFI?=
 =?utf-8?B?bWp6ZzNwNUwxZHBLaWpMVDRwR0lvUlJjdjE0Yy9PTzlqWmVnQXlZalpMLzQv?=
 =?utf-8?B?d0pKci9MWlN3Wjl2TzdOc0lnNHV4Sk5LZUdIYUZJVlc0M0lxVE55SnVlRTFa?=
 =?utf-8?B?SGVPYmpDRmxoWjI2YlFPYTNpby8vczBLc0pTeWt2RVh4VFZmZVg3S1V3WlpC?=
 =?utf-8?B?cS82Y2UrS0lybExISC9UZHJYNmJ3MW9JRThFdHk4a3JzS0x1TkJ3M0tHOEg3?=
 =?utf-8?B?QSsxMlVjV2tBclUxVkcvNFREQUVoUGw3UTlVVCtRaENPNktvY1piUTI2TXpT?=
 =?utf-8?B?OU80YjVselhYUUtHeWtRazRMYVNwZEd6eGt4Y0QvSG9xcUhtempxamF4ZWVl?=
 =?utf-8?B?TVZBWmxCL0JKa3JoaCtRb0pveUxLV1JaT2NYY0pKZnMwK3VvRFgzWXFNaVAx?=
 =?utf-8?B?LzhNOERPOGtrSldYZVlRcGVXby8zR3ZQc1dJRngrQ3BqdUsyV0hmcmJnMmhn?=
 =?utf-8?B?b3g1cWNQQjJiWlMycW5xWEpBMmZlbVp1SmJvM1NXeWc0Rk5sWkNIMnRwdDdU?=
 =?utf-8?B?cTFtak5wK2JMK01lRTNEeDJzNHdwWWlYY2k4N25Yd3F4RStOUldLZDZCVkcr?=
 =?utf-8?B?ckF0TGJMT0dSRTJTOHFma3dveHZ1SjVHTGRzVlVOWUtIakRKMlNXTXJFNzRh?=
 =?utf-8?Q?aEMiwCpEE7aHRcJWBr/6/YQxcPv71WN0AcgF56q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6604.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3djam5vSkZGSFV5OUdHSDdRQU1MSDZnbzh2SGVBcThjVCs2VzY2d2kyVG1D?=
 =?utf-8?B?VHJIVUpmMnBTTzVGYWhTb1QzVUJmYnBLOVA4RjdMYkFNWlpRWG9tSk52aW13?=
 =?utf-8?B?RDlMMkVtN0VqV2syanV1ejhpaTczU0tsZVk4cTlrYkE3NGMxQjMwbEdveDJG?=
 =?utf-8?B?em02TXVRQm05RHE3dXYvSG5hVHA3Z3lSRDV5U2tMMnlzSTNjU0JMUHVrZ2E5?=
 =?utf-8?B?bU5jbW5mN0VYSUxQb0FwR2pLNVZhNHpQclB2czl0clBmM3lDZUU4RjMzdEhT?=
 =?utf-8?B?bFEwbVBUVXVCU2ZjcUREaWZMU0ZmMFVrZVllZlVkY01TOGVCZ3BTQkQwZTYr?=
 =?utf-8?B?YlJMNmhmZTRzTTFRNy9qd1d4ZnZJaEVjMFE4ZUlEaVl5SCtQeTBlUEZZUjlj?=
 =?utf-8?B?QTVtVzFKUitjWXhBaW5TRCtwaStOWm1QcTFzdVRZUk5zSktZa1V0bHNZdGgw?=
 =?utf-8?B?ME90K1AyQzN5eUdDWEp5YzY3V3ZvVVdTTGpoeDdHaEtvemRwYU91NjlkUzU3?=
 =?utf-8?B?N2pkOUtRN2ljL0NlamtnSDJuZWd2S0F1RVNFRWNRbXFsZkljT1pBTFYzNGNx?=
 =?utf-8?B?Qis2V0NRLzdtcW1lU1B1MW1va3lEY05OTG5QTHY0N3ROSExUMmE1elluazlL?=
 =?utf-8?B?VnFPUDc0VkdwTHcwcUN4aSswd05UcDBRR0VCSFQxRDVlS1ByNVl6TVBrVEhJ?=
 =?utf-8?B?Y2VzUDFXc2RweHJFdjJxQnVSa3ZpTWFMNlppc1FRZWw4M1JNM0FXNTdSa3dO?=
 =?utf-8?B?RkdXMnh6ZGtoR1FaUGVxOTFnVE9kZmhwTEZOaHlnVDV5SjlLbmVlZVRKZUIy?=
 =?utf-8?B?akxGS0pSVFlEOHF0N2xYM0o0VlIrSHI0NjFsVWZoeURJWkRZb3diTk1FZ0Nh?=
 =?utf-8?B?VTJxQWJQT3pyMFcreFNrSjRvSDRNYncrdGQydks3Vm01WVRjeUY4SmlRYjFB?=
 =?utf-8?B?aG5WYWoxMFhLdzQyVDVYUWljU3pFUlJqRndCQVhnKzEyZWlIWXF4ZFRKMllT?=
 =?utf-8?B?b1FXV25TSjlVNXllaUw2ZDRsN2ZVSVJRTmNGQ0hmU1hyZjVna3dsSUJxeTcr?=
 =?utf-8?B?b2gyYy9sZzBoMVlZbzR4ekdTSStPaStxaDJUSDVTNnpTVHh5dm1XYjRHS3Rw?=
 =?utf-8?B?SndiQW05NEVXUUxJMjF0YW0vWFNzdHBVSjRTLzh3ZGxvUHE5dnNHaTQ0TEIx?=
 =?utf-8?B?WTJ4WndiOWFMMzVsQU1OSy9JalllTm9jbHBLZ25EU1JlUlhBWVRyenIzNkVR?=
 =?utf-8?B?UWo1L3RxbnhLWlQyalBMdm5aM2krZmNvcE1zWXQ2SDl4cldDQnk0T1ljOXFp?=
 =?utf-8?B?ZHplOXZGcm1qWC9KSUsyWDQ3TGJQWnlTaUl0UjBla2lPVzNrWUtYY2VmSGNp?=
 =?utf-8?B?SDdiamc4TjdNWUxrcVdvNFZXenJidVFRVW1WVHVRaDFqVEQwajA4bHVJV3B3?=
 =?utf-8?B?Zm9DWDJFMWE2ZkM1WXp2Z1JvOERudWJSSDR4VmhCaHZPbVhERVFPL3RwMEpG?=
 =?utf-8?B?V3p2Q2UyVHNrQldpL0FTb21mbHZBb1UwTnNVUnlVOFZEQVVEQU9ENEMrV1ps?=
 =?utf-8?B?c2EydFFLZEU1QVFSdnk3L0RRMkM3TkFuM1lkKzdZbXRLNHNUK1V1aHo3SVRs?=
 =?utf-8?B?RGEydlUzMUlmL01jZ1JYWmZCOU5WV0JMWjhXT1c3NklsbElkVGtaRWF5TXF5?=
 =?utf-8?B?cGhJVGRrMmpOa2tGcjNqZGlET2hSYnkzWjVwbi9SeTc5dDBjOTVLT3B3RFFZ?=
 =?utf-8?B?Z0E5a2dPazRrTTA5Y0pKUHRRMDRTK2pRdTQ0N3UxVXI3RVRZUzlBMVhncXF5?=
 =?utf-8?B?YVhFdzhUM20zWkRsYUFweVRMNk5MdkMrYnlQRTRtTWN2bldJY05VS3NLTng4?=
 =?utf-8?B?MWs5Z3RpWmpjR1lza2w4OERpb1BiUnNZU2J5U1RPemxka3BPangyTjN1MTNn?=
 =?utf-8?B?RVlMSVkyVFRvWHBXVHdkYkRkeUZUWlQzMitGWDdqVmFJYnROTlM3amZTVVRL?=
 =?utf-8?B?RmNjN1ZVankrL2RabVFXdncvUTdrZ0l1R0ZSU2J5VXlUbEE3Y2x3b21kamNV?=
 =?utf-8?B?bkpETjlBcm1VbHd0VU5tV2cwcUY2bFdmYTNTTXc0WHJMSGI3NnkxSEVPT3Mx?=
 =?utf-8?Q?610oSnp12xoET+qH1AeMTg7Me?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de0a763-a5cf-405e-09b6-08dcfeda7a6d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 03:15:49.3095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGWiwNYDXC9qDHp8I537gE1ksklSBGzrvOOgnVN+xLaxDn5W8kuoGXSW1zr2JZQD2mV9vz3+2Brhbxe0Ni7bIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731
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


On 11/7/2024 12:50 AM, george.zhang@amd.com wrote:
> From: George Zhang <george.zhang@amd.com>
>
> The abm tests only need to run on one output per pipe, instead of all
> pipes. Additionally, fixed the monotonic_abm not changing the abm level.
>
> v2: Made change for more tests
>
> Signed-off-by: George Zhang <george.zhang@amd.com>
Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
>   tests/amdgpu/amd_abm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index a85f444c4..e196b6ebc 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -225,7 +225,7 @@ static void backlight_dpms_cycle(data_t *data)
>   	igt_output_t *output;
>   	enum pipe pipe;
>   
> -	for_each_pipe_with_valid_output(&data->display, pipe, output) {
> +	for_each_valid_output_on_pipe(&data->display, pipe, output) {
>   		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
>   			continue;
>   
> @@ -257,7 +257,7 @@ static void backlight_monotonic_basic(data_t *data)
>   	enum pipe pipe;
>   	igt_output_t *output;
>   
> -	for_each_pipe_with_valid_output(&data->display, pipe, output) {
> +	for_each_valid_output_on_pipe(&data->display, pipe, output) {
>   		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
>   			continue;
>   		ret = backlight_read_max_brightness(&max_brightness);
> @@ -291,7 +291,7 @@ static void backlight_monotonic_abm(data_t *data)
>   	enum pipe pipe;
>   	igt_output_t *output;
>   
> -	for_each_pipe_with_valid_output(&data->display, pipe, output) {
> +	for_each_valid_output_on_pipe(&data->display, pipe, output) {
>   		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
>   			continue;
>   		ret = backlight_read_max_brightness(&max_brightness);
> @@ -299,7 +299,7 @@ static void backlight_monotonic_abm(data_t *data)
>   
>   		brightness_step = max_brightness / 10;
>   		for (i = 1; i < 5; i++) {
> -			set_abm_level(data, output, 0);
> +			set_abm_level(data, output, i);
>   			backlight_write_brightness(max_brightness);
>   			usleep(100000);
>   			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
> @@ -324,7 +324,7 @@ static void abm_enabled(data_t *data)
>   	enum pipe pipe;
>   	igt_output_t *output;
>   
> -	for_each_pipe_with_valid_output(&data->display, pipe, output) {
> +	for_each_valid_output_on_pipe(&data->display, pipe, output) {
>   		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
>   			continue;
>   
> @@ -357,7 +357,7 @@ static void abm_gradual(data_t *data)
>   	enum pipe pipe;
>   	igt_output_t *output;
>   
> -	for_each_pipe_with_valid_output(&data->display, pipe, output) {
> +	for_each_valid_output_on_pipe(&data->display, pipe, output) {
>   		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
>   			continue;
>   
