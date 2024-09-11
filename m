Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6DDEE57D0
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 20:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E911E10EA91;
	Wed, 11 Sep 2024 20:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gAz79HVm";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FA310EA89
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 20:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIwOtDqXH1UgSTptz3qEepuNwUJw5xpk96dgRZLSCX6XG+5vYyaOkas/caNyyUq1WBPhkUzT1rcfRGl9UflEDBFk736oIJT2+jngyQ30q84zUi3NXV8/ry4sOp8W2mOhGzQ8eVCpNkUFD11ha19cb1ElllERPvEDtki4EgtYrvGa8n6pLbzzjwYQ1iEPDu+38bET1BQXZklkT05yXmi5sASt0FuC30HEl31NvB7el9yst7Cca2v9zwy4/qBSo8LKUaz1/aIL7C3Y1mK6rn8zP+Uym1fvVxswWrGFZqW0rSrXGAxlvK5YGi6JZTo2e2RR1PqcA+85/3jqD1GHJwOkhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2J84nQ3ijqQG3NLSQzi01Wk+f4nFQFzuVaPpN1fn9sU=;
 b=v6KVv7DHeRIGkNxnNheIemr0WY+O0KLjkrX0QmGvA1btHKyNuxLgGe7g5ToGSBIP6RgT5mT1OyJ1QOXu82wRdWV+mR3j2v6m8GtC8BUXaBJcpLZ4ZiMNV03+rQxXe1h5dMKEoRJJ2raWOKo3vOSe/yL4LNbIscsxrWkLtMOXPuPsnK2HD9grj9JjcWpfwtNAXhTQsDbp4rcJ4g5quuLltRlST2zkWLmWEV/JZP4DLFlMPhotlagXaVUDbB76BxKdCS6BbY2WW3gtiyBGAxxvnjrajCXBmKmtFPZH6D1LWuxsL2jGJwsXb75E123cMgs0cmdMoq4ZNQy35UFaYyROeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2J84nQ3ijqQG3NLSQzi01Wk+f4nFQFzuVaPpN1fn9sU=;
 b=gAz79HVmSNJupcLwipCKjAnpSeEKmFpcNJcI38k7nHX6UOvPn0rdCO6Yt3fBPQUaE8HTTJZpwDq36j6gOGOBye+VSi6jvbHcdcXTWp68uL+hA4LqWp0GUtfBPscIpapIz2+Qw8dx5gB05WKn5xaDfxUw2SV7JAvFnjeGmeP7i/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH8PR12MB6843.namprd12.prod.outlook.com (2603:10b6:510:1ca::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Wed, 11 Sep
 2024 20:09:57 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7939.017; Wed, 11 Sep 2024
 20:09:57 +0000
Message-ID: <9b284c19-86f8-44af-a67c-c7780a5c2f1a@amd.com>
Date: Wed, 11 Sep 2024 16:09:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t ] tests/amdgpu: filter some asic for invalid packet
 length.
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240911062401.1670741-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240911062401.1670741-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::19) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH8PR12MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f6df7e1-2f45-4e9e-f05b-08dcd29db51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjBZbW5RRDRma3dRaUkxWGIrSDRaaDN6ZlVvbCtKbHJuVytveEdkSEF4WVJ6?=
 =?utf-8?B?dmFGMFgvNGZ4Ri9RUXYyQ25FUmNkVy9TeTN4dWV0dUhFTGZ3RkVwWXk3VGJV?=
 =?utf-8?B?OEIybzA3VlZqc3RndnRKV0dZSjFiWWFQbFN2cVJXQldTc2dEOGUvcy9adnMx?=
 =?utf-8?B?UGd4SEhvZmFFaUROeURnZkE5d3dtVzRZSG91a0ZlaFZMQ3NiOHlaNHdXZFdz?=
 =?utf-8?B?VlpUQVViWUNHbFBqd1RtdWpXdjd2NThXOGRFK0NmZmhab0tDWkNwengvTVUw?=
 =?utf-8?B?aklPbUh3bkpKNjloOW5NSEJSdkVDUGk0ZmlZTGdTRGJxUTNPOXJrZGI0cFRn?=
 =?utf-8?B?YzFIcHdsVHdVaHZDOWRlYm94SVAzRWdHK3M3YmNhdVpVU2J6OFJKditHMWM0?=
 =?utf-8?B?KzVNckJnQ2hGWFZKSkUrdnhMeTBNczA3ampVWFk4azVGWGdXNXFyL1V4N2cr?=
 =?utf-8?B?bWRINkdYTDArZ3A0dkJ6djBjdjdFNnEydHlKOE1hOCtMNDFtYzJ3ZXhZK1l3?=
 =?utf-8?B?YXRpbTZLdWcxTGphQUtyY210VXJ2ZEhOd09IM2hVM0d5REpKSG1MSUhJTk91?=
 =?utf-8?B?aGtzQzdqVnJuN0Q4ZWlWaVAwU1pSNmY0eUI3UXQyYldMdzZGTDZHWlpxZUI2?=
 =?utf-8?B?eVI1b2hnMHN6T0ZIdTkyUGN0UzJKcVU2QUFBeTFYSEttdmkzZVhqN0NJZ1dk?=
 =?utf-8?B?cndDcFJMUnJiR3FNRStIUXZTb3luWmhiRnJEL2g4YTJybkVJSFp0SnlmdUNK?=
 =?utf-8?B?b1FCMnBXNlkxVklNU0E3ckEzVTdyS2NlMlZTK2lDRVphZm4rOFVSZ1J1RVlJ?=
 =?utf-8?B?NUd3QU44OHBwVHVNc21abENpY1pKVEZXeTRXbEErV1U2WGZ0QnJzL1JCSVpy?=
 =?utf-8?B?SjNkV1NsNlZKdC9YbFpBQkxwbUxPRDdPVU9aSXplTm5LQldPbTBiZEU0Z1A1?=
 =?utf-8?B?RXVRWG9CZ09BSXc5ZVBycThIa2ZFbmNoRUJZQjJOZm9zaFVLNk05NzVuN0lh?=
 =?utf-8?B?c2hCNlNiVGxlc2RXcnVwdXlXUkZVSTVpK1JFTEl3R3I2TDNybWJLb2wxenVF?=
 =?utf-8?B?UDJnWE44MXpGY1dWU1JnaTN0ZDhna2E5aUtlWnZMUzR3MmttTUdPSWptOVdz?=
 =?utf-8?B?Y2hDWklHQVMrcmU4QVB3TGx3MHNBdHEyaFd2N0I0VDhZWnh5RXFMOUVlaGVB?=
 =?utf-8?B?akRZM0xUR1psZ1Rib24xY1RoVGozc1lnMDgwaDVDSnovSFlzUml0cjlBYUg3?=
 =?utf-8?B?YTNQamErVzdsWmhZZlVCWGxjeU80RWc2Nm9qUnJQSm15WWdFR3ZCSWNrMG1L?=
 =?utf-8?B?czdDc3NKNTNDRmFtT0U3RjU1aVREQkdrODIvc2dacXpwWVlENHlRN2FOdzhy?=
 =?utf-8?B?YjZXZmUrSWt1VU9VMmRNaitNN2NWVFFHN0JYNFZFMHh0bTNXcTV3aWZudG9h?=
 =?utf-8?B?clBGeFFHY25LbExJaU45UitodnhGYzN0RXo4Tll5Zm5ISjdBaERyc3NOcFpE?=
 =?utf-8?B?R29jZTRHS0J6OTVCM1Z6ekR1ZDBIUEVhKzdXYy9lc1lvY0xzSXJlNERmZWN2?=
 =?utf-8?B?UVdSK1RPd1A1VlJwKzVJWncyaHl3bFRYQnNBbE5lTFV4b1crbHJ4akFiKzh2?=
 =?utf-8?B?ZlZueHJiRFUwMDN1YjYzalVwV0hPNHgzbEpsYXQwUFRqbkJ5aUloT0VpMkI0?=
 =?utf-8?B?ejJFRTlWNjRWcCt2YUZKYlFmT1drZWI0Q3pNVHYyUEhZdFp0d2JaUnFqS3Ns?=
 =?utf-8?B?ZFVBYkFUOVQxWXJBT2tUMzc5clA1S2hJbTM0SUZOaUs5QmloS1BiMVA2OE1i?=
 =?utf-8?B?MGZXRDJadXUybzJQd2tSUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3JqOGhFTzFid1lJS3N3MDVPUlMxVEZ1V1dYVEt0VFc4VHgyaEFsc1RaZkdr?=
 =?utf-8?B?L1ZOUUgxMkJFUWN4aUo4U3F3RHBhc1V3RHNyNDZkOFNsQW9aM1M3NjBscG41?=
 =?utf-8?B?MjNKSGpOb1hDY3BJWWlEZjFSVllhMnFpM0dIaHZ6K3k4THVnNTBaNXZBUFlY?=
 =?utf-8?B?VEs4SCs0djYxYjZPTHNieUMzeWhTNVV0MFV4UVREbjlNdUoxUW9rMm5TWHVB?=
 =?utf-8?B?K2YxWHc1TlR1ckpCT3BxZXRRdG95L0hGdDRqM3RLbVNrSWgvaCtNemNrVDNB?=
 =?utf-8?B?RWZWUFQ2WElCYlhSZTVJdjVpZFNhRzAxQTVicmIrMHd0OHp3V0V0a3dxWlZo?=
 =?utf-8?B?RHEwZDVMZnRicTNuVnE0Z0h5Myt6RTNJNFMvNmsyS05pd0J4NUM4WXRIRy9k?=
 =?utf-8?B?cXFPakdXRGx1Mm5SUDMydlVXY1AyMWs5cTI4dVJmekMwZjRtZzdVYm56cHd3?=
 =?utf-8?B?WWdZWHhueWw5dllWTlZOUkQ3L0gxaENhUkM5eVcvQWNDRW5seXVXOWRabkNv?=
 =?utf-8?B?QVg1cERhK1ZuM2FxWTFBc2drYzVSL0czUHJNN2V2UWpnT3hwZWI5NFQ3Nk9o?=
 =?utf-8?B?Q0RZajUxamxOUGQ4a2J0ZWNlZFZ3Ymx2N0tZM2JoRXZnUUVIeldtTkxNbVJY?=
 =?utf-8?B?S0d5Q1hnMWREczJjM1Q5RHBXdGswbkljN284UXFJZHZZbitlUHB3dk5WUW43?=
 =?utf-8?B?a3hJekF2RnMxUW9oc0pRMTViTWpqRVB2ck53QlNXbW1BRVNjNG91UFVBOWp3?=
 =?utf-8?B?WXIyVElZWFRjMDl4ejZMWEpRd05mamM2bE9IajA1YUxZWmIzMnRRV0FxN2xQ?=
 =?utf-8?B?V3d5RnBiRUx6MEYvTkFTWldWNmdhS3RCaWg2RU9aL0xKV1U0U2E5SEtEWGU4?=
 =?utf-8?B?TEpHVVFXM05IUHZ3bDVpWThvMHpaUlQ3eDBEZXpNZVJoU0FFNTJPSW1QUnpR?=
 =?utf-8?B?ckRISTdpelgxMFY2TVRhR21NdzhIWU1CS2U3MXhWUUhYQStiRUhNVUUrSmkz?=
 =?utf-8?B?V0pUeWxiL09jOVVCM0k4NkVKU2szZjkva1NSYUVlOUNjR0RBZU5odFp4SUlD?=
 =?utf-8?B?K0hIZzhzWnUyV3RWVkNWRFNhaHhlZUE1eWFKU0J4TjczRmxpd1BxcVZNNHFo?=
 =?utf-8?B?UUNrMmFRei9Sell2TWJrYThMaDMraERtNHdHSVpBRmlxT1dPajVrOUs3ZGdl?=
 =?utf-8?B?eTFNVXROaW0xT2tIK3V5MzlWTm00QU54VGpMR3p0b2toY05KWTVyS3JhdjNM?=
 =?utf-8?B?SUNaWGRFQmc5a2Y2L09wdUZSY0NXZmpkdUVKU2VvZjhWbjdvSE8ybFBqejg5?=
 =?utf-8?B?M1pOa1h5WW5FWW5sR1NTQ3pmTWZLMWg5VXk4bDlMdHU0ZU0vMnZyNStyMzQx?=
 =?utf-8?B?QTB2VXpXaWJGNzFNcVg1R2tjc285VHhCazhldFhyUXY5cTRoMCtOSURHYzZ3?=
 =?utf-8?B?dkxUajg3aWdKNVJFaXJ5SjcvZU9ocDhTQ1lCVUFXUGtxS1lDR1NOUVVKUDI0?=
 =?utf-8?B?Tmd6OGZ3dXJWK2ZtdVRZQlM2RS9uM2JxOVpxcjd2eE1WbWhXYU9OR213OVVQ?=
 =?utf-8?B?dit4R1VVZENGZkJDMWs5bUFXb0p6U0FWUnlOK09uSU1ySGhOTm1MSzRHUFdK?=
 =?utf-8?B?dk5BdGFobUpZdi81aFE3MjhjV0ZaREdNa3VwZjhLTEdDcUdKSnZUUXY1UnNi?=
 =?utf-8?B?bGFhRXRzM0o2cDYxbVN0d3pLZDQyL1ZXN0pYSzVKd2RSZzNXcmlWZnR5bW45?=
 =?utf-8?B?QzlTQ01halh2cktKUE11SkpGMzZqSGdqQml0UGVUSGN1ejZyZUM0WjhWVGdL?=
 =?utf-8?B?SXA2ZlJEN2ZiNGhFdHVXcDJOU0k2WGdUNWkycCtya0NNYlR2cHZnamhiRk00?=
 =?utf-8?B?UXRhSzVPVWRRbVFlcENQd00ycjJVSkp0ajFvV29WTG9QaWQ2QkF0OUpGTmdF?=
 =?utf-8?B?U3ZHSGtpNE5JSktXaDM1TTNPVytFV0FJaWJsRlh0Zmp2cnRpcG9JZ3dJSzRH?=
 =?utf-8?B?YW53cnM3OUNBczlpMWpQd2dlNEhURXcxeklPN285VXVLV3JGY0NoRW5qeHZm?=
 =?utf-8?B?MFgxSVlRTUFhQmdwS3h4NW80T1YvN1lteWVtWVlSbm9WYWNsOHdsZmZSb0Nu?=
 =?utf-8?Q?vbZ0Fuf3ja3M3YqzrWEUqifx8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6df7e1-2f45-4e9e-f05b-08dcd29db51a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:09:57.2311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkKL4+VoTDCc7X+qcTpPw9/xJIZdloEZZ5VtLY4r7+bGIhhX+A2+MUC2FvkrqXxAPZvp2LLCw/H00hxwjlVMeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6843
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

The change looks good to me

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-09-11 02:24, Jesse.zhang@amd.com wrote:
> From: "jesse(jie) zhang" <jesse.zhang@amd.com>
>
> Filter some devices because the firmware does not support recovery it.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  tests/amdgpu/amd_queue_reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index 8f5c7d4b8..d2d57d3da 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -1082,7 +1082,7 @@ igt_main
>  	struct dynamic_test arr_err[] = {
>  			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
>  				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes",
> -				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
> +				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_GFX1100, 0x1, 0xFF } } },
>  			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
>  				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
>  				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } } },
