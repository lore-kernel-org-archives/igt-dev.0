Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F64C27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 14:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B6A10E1EC;
	Thu, 13 Jun 2024 14:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="At/uv+U7";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9DD10E1EC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 14:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XynS8us4J8w0R+SF/HrrB9XkRdjKbvWHGZ9XnqUSQPSifZVcH4K7trPnGn7kbM/MUrIIx7cdqVyQLbNs2t3P4unzZ91uOCBhnmnHy5IDauxoM5VLeaLFtcSJ+XU9JrraJ0FH2rhKXX6ODodR8sn65vURNJE3tiqve22oeymIkhO3Bl98FcyCD/IOigN4exRlSvBkI6Wkcu1wO5VJ2xGXuanoNxNFlbPvDG9BkNVeg2KeGzp3/KgyhggPbvK6uX0oz+ZBfX3sJte19FLqDnBbDNXuCc/SyqdoMiVzR8plbTTg8fAlQOuXwp0Dt3jl4/lxISvx3oZLMFRBbK7uhiE+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjKQ8xwmACGQmo56UOWTSA5O7NoxeT9Qkdqoja9qQdc=;
 b=Q+RfVB1IWeV+314x4Np5lncjoLZdCp+r1Zc0WNH1wCNzSe9g9h3y9xMsXyY1v7wDKbNrRptqwJaGAfRYYZ6DOcieg4BoO6wpiI/3aw6myey3BxF55prEzPEgaZfuxwhAECZUF8dS5PP44EExWXlvw5BWl6cT70+aWoGNO/osJfN/aX5IZ77OtEGzXXTGHUBV1UiQ8p/Qi6KSnh4pmAgKyeeEbj3SRelMvxVppO0WEJuGn9PW+0649QhuLIyOKZzJM8xdzLYwVi+bkZjHGxBw5PwexJLNOAabfRZanZAnRsv7Viqs0mWUGVAYSFvCSXU6gUWAG5QDbYBP3J8/oE3QUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjKQ8xwmACGQmo56UOWTSA5O7NoxeT9Qkdqoja9qQdc=;
 b=At/uv+U7uqCOcBUbtPrk++WFSAV+kb9xhuhHPpN7xEg9LDj+qM6t3WVykEKJS2I60BUc+U61cvff/poP4XP+AgFRLuPfG2NrqwpXD6s4OyHJ42G6rVj2wlvrtqwYn1mxR5jkE86rH8brXICB7EOnOZwPWbVRD3IXY+MfKZkjFtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by DS7PR12MB8345.namprd12.prod.outlook.com (2603:10b6:8:d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 14:48:06 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%5]) with mapi id 15.20.7677.019; Thu, 13 Jun 2024
 14:48:06 +0000
Message-ID: <b8b463d3-c60e-4ca4-bc6e-e223dbb092f8@amd.com>
Date: Thu, 13 Jun 2024 10:48:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_bw: add subtest for only connected
 outputs
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20240613130715.1008793-1-kunal1.joshi@intel.com>
 <20240613130715.1008793-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20240613130715.1008793-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::15) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|DS7PR12MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: b60c6101-12e1-4abd-ef6d-08dc8bb7d592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkZiellvM3krSk1qY1dMazFJMnpBSnB3MXVlMkRlbTVQN0JVZFNqbkEzOHJ0?=
 =?utf-8?B?UFdHNnFEa2lYazZxcFl6bjA2ejRBYTk5Y3VMRG9CLy9wcUw5UjYyeXdheHFM?=
 =?utf-8?B?WFFtenhvT1U4TkF5eFdCanJUd1Q4a2p3UmFIVHFvUWF1RWpYRnFpSXpnUmE3?=
 =?utf-8?B?UHNCVWs0Z2Zaalp0VjVCWTVrNWVrcDZKUnRxRk9temZMSW1ndjlFTkFqQXJt?=
 =?utf-8?B?OW5HN2RoVzJpMHBJeVpBL2JYVmh3NGZHSlBqQURNbTl2SkRXS2ZSVWNYUDRU?=
 =?utf-8?B?Q3BRYkdSNk1Ob3ZaQWRmZldJU0s3dXNnamJlYzFtWnF4Yk84b1RLcWF6S0kr?=
 =?utf-8?B?cTExZDV2WEFuYWNuZ0VLNStJVERRYTVZamt0YkNPdmRndkdEd0pUektBT3VU?=
 =?utf-8?B?dFBxQ2d2RmF2dnk5OFk1SGtUUTdDT2dFbjcxM0laMFBmUzRiTTVJMDJic25P?=
 =?utf-8?B?Z2p6ZWdHQnNnMkhmRXpiWERNaFNQa0NzNWVoVjRFM1RPbzVjUks4RlJENE9a?=
 =?utf-8?B?aGFZRGE5aU51N3p4MytYdzRhemNRQnk1OFZHVWVPRlBheklKa3VYeXNWUEkz?=
 =?utf-8?B?T0xyMFZwUFZHN25SRDlMOXFzNENKdkVQbkMwZkJNOFFITGlQTDVqVkVZdS8y?=
 =?utf-8?B?WisvT25GMjcwZ2wxZGNUUkUyL2haZGNLTnhLajRJS3FLZUJTakFrTzA4Zndq?=
 =?utf-8?B?U1lRUmprU1VFWTJWUzViV2Q3dm1EVzM5dHZyZExJQ1g4VTVITnNQVkhNZDhs?=
 =?utf-8?B?L1pmSUZqNzFJV0VLS0pubTlqRWlKeWhHczd5dHlzSGZ1UUJoZG5ZS05taTZD?=
 =?utf-8?B?eHlXUzhLOVlWK2ZaNGcyVGNTS05oQUFvbGlmUzhMUm1YQ2FWZlBnbXZLcFI5?=
 =?utf-8?B?NGhpaFNwR0hjTWZEODhkZk9YYlU0d2ozVURsZEhzYW1OVkhDUjZaby9kQzZN?=
 =?utf-8?B?ejI0NWZDaDRxTXBPU2pjeEcvT09SbWZJT0Fpa2RvK215UGFCRGxPcEllSC8y?=
 =?utf-8?B?bU5lQ2Zzayt4NWgwN1ZFQUdKNmx5ZWEyeHE3NSszOEJHaVlDU0xZdXVUK0s2?=
 =?utf-8?B?cWt2UlFjcnJCZVFCSEVtRzVYbS9LbEJqV21tb0tUWkJTNXZqUURIVHh0RHZ2?=
 =?utf-8?B?YW9wcUZUMkhLUFV4dStyWG16VUFLbmx3T3FkYitrYVdJeWYzNTRHaGZTenF5?=
 =?utf-8?B?RWo2MFBiTjd4TzBuaEZ4am5EeFVwcTYwTEdncWswYmpjWSs5Y0RRSS9oNHV2?=
 =?utf-8?B?SUQ5QkREcHNQdmRDVHlIbWV0K0l6dW10T3JDRVhiQmp2cCtwWnJUWVZxOUZl?=
 =?utf-8?B?WDJ0aWpsOXpmWWF0STZ3MXV3ZGFlblRJVVBkaWRCTVd0NlgrRDlzRStxczVJ?=
 =?utf-8?B?NjU5TWcwNmdvVnNONmtCNU52eG42ZVhFRXNiZmgxZzVhZFBHMmtQV2NWTzht?=
 =?utf-8?B?QXdpTjVPdFl0Tmwyd2RVeG1GMmFJQVhLdjc3cGZzVzAzN0VvaVBleHlmWlZI?=
 =?utf-8?B?eElaYVNlc09UZ0FmMWF4Z29PK1NnOXBDc1ZVd2NGbWdNYWI0R29PcVhqWktk?=
 =?utf-8?B?OFRKeGt3SGk5aEIvcERFTnpWMHNjUnl1bVNma0VDVVFSdWxmVC9EZGpLeGlX?=
 =?utf-8?B?a0lKeGdIMGFjVE5OaHFWdkFqTjBwTWxuUjZWK0JxcGJIK0sxRGF6K1hOaHc2?=
 =?utf-8?B?ZHMyTmtkTi8wLzVyM1IzVWMyZFZsS3ZjbElmeW1yQWdONkRobGRBNDVwKzJv?=
 =?utf-8?Q?yFpbh/Jqr8sXlgpbWRIhVmmzKXFeB+mPoYyFmjh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnhSV1BleVY2RjR4UHQ4R0pyMGdHMG1OWTRCVFdlV0g3TVlxRitPcFd6dlU2?=
 =?utf-8?B?WG5OdTlDRWlCZUx4WDZDVGJ3cHhxdHdaTXF2MGVBZHA2NE1ZYXg3R25QcnI5?=
 =?utf-8?B?SEQwQ0RtcFVPamdFZ1lINmc5c0tRZ1lORUUyV1B4R241RmR4Z25iRXJtSDI1?=
 =?utf-8?B?dzBzU2FzKzE0WWsvNDdIL0RTbm92TmJac1BpbWJITlF0OG9Fb0gzdEpIbXdy?=
 =?utf-8?B?a1FzNkZ6QWhLRi9lcGlodTZpOHRlQlE1eHJoNEhjblN1TWN2SGpaeFB6TTh6?=
 =?utf-8?B?WmdyazE5RHhVNmx2K3NoNGF0SXo5alF1VnJaVnZZRDFEdzVqbWJFWm53UUZ5?=
 =?utf-8?B?ZHFHZXF1MnpGaUorblIyeFd5aXhNczU1eVRxdGpIMWFHbTg3MTVJUEZIbUJF?=
 =?utf-8?B?bUdMV2hHaFBtcHpuaUFiK0pMbU9xbjcySkpWR09tR3pTM0ZuRHdxMzBJMGJ0?=
 =?utf-8?B?dnpUUnN5dkZkTDQ1SEZFanBEakJ5TnpCM1R4VC91SUVEb0VmYTNlMmxTVFNN?=
 =?utf-8?B?ZzF6Q0dwZm83QWhPUzdxT0NUdFJ4akpQRUJGbnhKZHRkZ2puSisrVVphR1NU?=
 =?utf-8?B?TklFWEVnYzh0NGZQMS9yQ3JTVkRZakgxVkplL0VqYzJuRW80WE91K0Myd2V1?=
 =?utf-8?B?b1pKVHEwS0JWU0JUQkthVDFhVHJ2a3pZVFY2NmFPeVdaSXlLdFBBdGpJQ0R6?=
 =?utf-8?B?TFYwanZ5MlVmUDlyYkloSHdjZ2t4WXcydnozRWdyZHlyM1BmNG1MeElDMVNH?=
 =?utf-8?B?UUJzbXlVaE13TlFMN2s2V2Z6UE0zSlFXWDlZU29FUmxKc0MrbGRBd1lPaXhW?=
 =?utf-8?B?MHJQdXhQNjZyMEVnSkJFZ285M2RMVlJ1TTlYU2o5U2lQU1lwd2x1c2tMZ3Vo?=
 =?utf-8?B?U1U0MFhNZnJQYStITDd4aEFaSWJrQ2pKbU14TlZZRDNJdFZZRHJNdEtETkw4?=
 =?utf-8?B?clZqUnRMQmZOdkl4cFV1bjJhUEtmTkhRSkpKUXNuVnBHNi9HdGdYTjU5NVZU?=
 =?utf-8?B?Qk0yN1JUWVo3RDJCS0xuTGRQT0NnZU1nZ2k0b1BMZUdMZ2FaZjZ0T28wcVRy?=
 =?utf-8?B?dVkxVlkyV25TQWE0RmsvNmU3a2xRS2NwNVEyZXltR3ZQbW1nMi9MbmNZWVox?=
 =?utf-8?B?TGMxN1dLeFExTDJuR0JsdVZISmtjNlhSM3l3WEROR3JQSTFjNVplazc1ZC9u?=
 =?utf-8?B?L05XN0puMWJydE0rTlQxRVlCclpYT21Zci9hdEJYMUo3NkNUV2NPNTNRN0t1?=
 =?utf-8?B?V0xTSEpOUGpLb2dPVmZKNkI0UVZBTWQ5RVQ2R3BHU2x6NUdPcWRTVWN6UnBi?=
 =?utf-8?B?djNFZldGUGpXQk51ZkM0R2Y2SmFKbnlKUFlYNHhVeGlaMW1FdlNQRERGV3or?=
 =?utf-8?B?bi83QW8vZFRkblZmK3V2N2kvSkpmby9raXE0STN5Sk45cjdaNmxhQmp5UUMr?=
 =?utf-8?B?WmlEQlhHL1hnMXB6SHNaTFhXVWhzWCtjK1VIMkR6NkFFUlBRVFpSRWZiYmNt?=
 =?utf-8?B?Y1FxcEZVUVdCbDNUbjhVMTRrQXp1bGpGWWVVaVRtandLZHFYUWxXTm0xT3c3?=
 =?utf-8?B?UnZYMjFVS1IxYmF3dHNpdDN5aHRMRWJad1M3N1ZxYUg2KzdSTHdLU3d3cDRF?=
 =?utf-8?B?SkNYbysxc09qL2NGSHFVU1ZXUnFpanJLSWU4UUoxTS85K3ljM0VjL3g2blFO?=
 =?utf-8?B?ZFhtTmZmSFNGTzFaVUh6VTVyVkxjWVpVREFnbnAwTHJZdGNQSmlFZ0x1Q2Qv?=
 =?utf-8?B?SGljME5TRlArbStGOG1jb1ozS0xyZWxLQ3YwbWZHTzFVam9id0NjaXc5UnRM?=
 =?utf-8?B?dWJWcSt4dU1pRGpUa1hXMGdLcXBNSHQwSk5WMi9MQjBkM1JqZlRMa1o1UDZk?=
 =?utf-8?B?VTdzM0FZekdzbmdoUHNacWVKN0pwR3F5cEFBenRwYWtlcTZKbC9jcUZYU2Rj?=
 =?utf-8?B?MUpYV081STc2YS9wNlloYWtucHhyOGxuUDd5dmJORk1NVHVoNFRQb0NIejE5?=
 =?utf-8?B?cnFuTlUvRUdhNE91eHJncmh4ZDhiNzBGVnVKTnA2WWI1YWR6bEpuc3ZSb0Yz?=
 =?utf-8?B?OEtPU1N2OG4vRUlEOUZ5S3l0ZEtlK2t0cUJHdUhSQXVvMENMV1BPeG96cXh4?=
 =?utf-8?Q?fVv0138ar42Y4aBaZWYNRN554?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60c6101-12e1-4abd-ef6d-08dc8bb7d592
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 14:48:05.9788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Pa34DholPfykT8JKFkX1dGb12Uz9IxFz8DYOC9eUu+P3STm5pT25XeK5FS8mL2lpMMG5T4ly4Knc3Ju9/eS5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8345
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



On 6/13/24 9:07 AM, Kunal Joshi wrote:
> forcing DP connector doesn't work well and tests are skipping
> with unsupported mode, add new test which runs test on connected
> outputs only.
> 
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/kms_bw.c | 41 +++++++++++++++++++++++++++++++++++------
>   1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 05f7e79ad..bbf374612 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -48,6 +48,19 @@
>    * @2560x1440p:       2560x1440 resolution
>    * @3840x2160p:       3840x2160 resolution
>    * @2160x1440p:       2160x1440 resolution
> + *
> + * SUBTEST: connected-linear-tiling-%d-displays-%s
> + * Description: bw test with %arg[2]
> + *
> + * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> + *
> + * arg[2]:
> + *
> + * @1920x1080p:       1920x1080 resolution
> + * @2560x1440p:       2560x1440 resolution
> + * @3840x2160p:       3840x2160 resolution
> + * @2160x1440p:       2160x1440 resolution
> + *
>    */
>   
>   /* Common test data. */
> @@ -55,6 +68,7 @@ typedef struct data {
>           igt_display_t display;
>           igt_plane_t *primary[IGT_MAX_PIPES];
>           igt_output_t *output[IGT_MAX_PIPES];
> +	igt_output_t *connected_output[IGT_MAX_PIPES];
>           igt_pipe_t *pipe[IGT_MAX_PIPES];
>           igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
>           drmModeModeInfo mode[IGT_MAX_PIPES];
> @@ -62,6 +76,7 @@ typedef struct data {
>           int w[IGT_MAX_PIPES];
>           int h[IGT_MAX_PIPES];
>           int fd;
> +	int connected_outputs;
>   } data_t;
>   
>   static drmModeModeInfo test_mode[] = {
> @@ -108,6 +123,7 @@ static void test_init(data_t *data)
>   	igt_display_t *display = &data->display;
>   	int i, max_pipes = display->n_pipes;
>   	igt_output_t *output;
> +	data->connected_outputs = 0;
>   
>   	for_each_pipe(display, i) {
>   		data->pipe_id[i] = i;
> @@ -124,12 +140,12 @@ static void test_init(data_t *data)
>   			continue;
>   
>   		output = &display->outputs[i];
> -
>   		data->output[i] = output;
>   
>   		/* Only allow physically connected displays for the tests. */
>   		if (!igt_output_is_connected(output))
>   			continue;
> +		data->connected_output[data->connected_outputs++] = output;
>   
>   		igt_assert(kmstest_get_connector_default_mode(
>   			data->fd, output->config.connector, &data->mode[i]));
> @@ -173,7 +189,7 @@ static void force_output_mode(data_t *d, igt_output_t *output,
>   	igt_output_override_mode(output, mode);
>   }
>   
> -static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode) {
> +static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode, bool physical) {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
>   	struct igt_fb buffer[IGT_MAX_PIPES];
> @@ -189,11 +205,15 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	igt_skip_on_f(pipe >= num_pipes,
>                         "ASIC does not have %d pipes\n", pipe);
>   
> +        igt_skip_on_f(physical && pipe > data->connected_outputs ,
> +                      "Only %d connected need %d pipes\n",data->connected_outputs, pipe);
> +
> +
>   	test_init(data);
>   
>   	/* create buffers */
>   	for (i = 0; i <= pipe; i++) {
> -		output = data->output[i];
> +		output = physical ? data->connected_output[i] : data->output[i];
>   		if (!output) {
>   			continue;
>   		}
> @@ -219,7 +239,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
>   	for (i = 0; i <= pipe; i++) {
> -		output = data->output[i];
> +		output = physical ? data->connected_output[i] : data->output[i];
>   		if (!output) {
>   			continue;
>   		}
> @@ -230,7 +250,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	}
>   
>   	for (i = pipe; i >= 0; i--) {
> -		output = data->output[i];
> +		output = physical ? data->connected_output[i] : data->output[i];
>   		if (!output)
>   			continue;
>   
> @@ -265,10 +285,19 @@ igt_main
>   		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
>   			igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
>   			      test_mode[j].name)
> -			run_test_linear_tiling(&data, i, &test_mode[j]);
> +			run_test_linear_tiling(&data, i, &test_mode[j], false);
>   		}
>   	}
>   
> +        for (i = 0; i < IGT_MAX_PIPES; i++) {
> +                for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
> +                        igt_subtest_f("connected-linear-tiling-%d-displays-%s", i+1,
> +                              test_mode[j].name)
> +                        run_test_linear_tiling(&data, i, &test_mode[j], true);
> +                }
> +        }
> +
> +
>   	igt_fixture
>   	{
>   		igt_display_fini(&data.display);


Thanks! The patch is:

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

-- 


Thanks & Regards,
Aurabindo Pillai
