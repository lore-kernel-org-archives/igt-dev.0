Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BB7CD98F2
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 20:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7021010E85B;
	Mon, 22 Jun 2026 20:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BjOJbw6F";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013005.outbound.protection.outlook.com
 [40.93.196.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0894010E85B
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 20:28:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4CpkT4Eww6Hq/42Eg7aFCMs6Ib6Xdgfsk6bZVeEa5Rl+81SfuVn7FfR3WqQ2kgYNTdIDkTI3k/FNPx40/+InPdiKtMB2iMkEBYqLs05Oxsr0lS6t1C3++LZzvWSFm3rkQEfrjkWTLSU7TiuiKMYnrlme0SpZk42EHDWB1UdGR0O7IUUeY53eI6rHp1mHbJRxcfQYMlkifpo8ofiAL6C9ah2ScVwF5lQJSxyBhLGYj5PACJZAoLbgLFf8/Dp0cW4/A2gPokjtAKB9f4aHenFmyjKqYmVpqBkZfGFIdXGqFZontAEO9zb01hW9u24RwvWQTnXwK72NKrFf+qPKrimRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ua3uMOdXzbOnJOhBuEfB3J9VU3D2JcjomMlqDlXFKGc=;
 b=CPAjKFc1Qgm6dfrNBO2lHBYSGcPQOhx93II5+oSuw5WcwWK1kxVz25AbLkcs/jjB+sN7r+hogQM7jAs9OZKigFKIJEfOZlB8ZglXQQt61nQFRYzQbmTzFmqzCrhK4hSd2gm/eZDni7ujW/z4Tmg0u/snVDkHa3le3bjHKSGI6pXmsP4t+ANyF5+OyD0TwEAx0q/kfuEshCxz2+OXjjxj4w2Ocs1WhXEnVyJfojg/sJfKRIOyYkjRs6CKliQwlVY5I+5y79AD4N7DgxwNI91czmKqW23G+ejQ8A/x4P+7SpXJZFclEM1WlbSBGJJUwJFgx2RlU7rad5EPBJJk8MfV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ua3uMOdXzbOnJOhBuEfB3J9VU3D2JcjomMlqDlXFKGc=;
 b=BjOJbw6FENDCWuUDul7CmNBtpcJeQpocsQRNBeN1MEb1besp8asktVfKA8eGJc4/kpT7MPJzRjJM38kyHc7c3aaVsddn+y7y/xljNiEN9l0q1UhqfhGSchX8FdCVn+WPoxlGK90lbkkvBbSWKu+yc3IeKS6IWHe0j4ODigXYbnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by DS2PR12MB9822.namprd12.prod.outlook.com (2603:10b6:8:2ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 20:28:05 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 20:28:04 +0000
Content-Type: multipart/alternative;
 boundary="------------i3w4FABZ701PMXaCFBgiAQKA"
Message-ID: <de1a9517-0e89-4b32-bd18-0ebb62dd7c1f@amd.com>
Date: Mon, 22 Jun 2026 16:28:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu/amd_security: Skip secure bounce test for
 APUs
To: "Ramalingeswara Reddy, Kanala" <Kanala.RamalingeswaraReddy@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "Vishwakarma, Pratik" <Pratik.Vishwakarma@amd.com>
References: <20260622040418.454076-1-Kanala.RamalingeswaraReddy@amd.com>
 <32325265-fda4-42eb-a27f-d8785287c728@amd.com>
 <DM4PR12MB7646C0D5F1FC73E8412CAFAC95EF2@DM4PR12MB7646.namprd12.prod.outlook.com>
Content-Language: en-US
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <DM4PR12MB7646C0D5F1FC73E8412CAFAC95EF2@DM4PR12MB7646.namprd12.prod.outlook.com>
X-ClientProxiedBy: YT4PR01CA0393.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::26) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|DS2PR12MB9822:EE_
X-MS-Office365-Filtering-Correlation-Id: bdbaa3ff-4799-4ad6-5d2d-08ded09cc382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|6133799003|3023799007|4143699003|56012099006|11063799006|8096899003;
X-Microsoft-Antispam-Message-Info: Bl2tLO+qxlJujI6dfWVr4uXEVzM5KBeDuPRKKG3lR8KJoD3lrt5lQBYzQOCXpf+eeFJUy9lH29E74tt3MnfIi1wTXOJblkBUwNWJu1Eb91xWWC2UlPOQavb27R2/BwFHt0EggWlKqjcC6OOiBu6u85hUGDoHTJwg5F3qMYMNJmP/FCM1W5ON7I6urYiFs1HgwwDA7I5dqHRCJZRLr1XheeA10Pcn0V0PZipGw53SRxC5geMzoy8fFAjXWfuiF9SmybYhP1Mkw47ydHKE3RkfxicTJgXp/w1Kb3CTntpQivV5QxSJnNo3ey7HPPNkohgHlrDXfCun/9fTQjlmBWHl6fhljOvp3kgtzyKjawbvit8RitYMcOu+hd3usgy6n5UhB4odOHf5gvRrCRtDjxAGLpFGd64gipYuJWj01ORG2XXqVPMhrEkH6pzSUcfclbPu/vMgNXAuqZT5BjeDV+nzZQKJaw+JI2I59KIo1S8FuUp9EHL7ZFJ3qOrLj0hmxfe6KPjFaZpm1N01CVQnwlY6dlXY58XOZt64Iu3TQZvcNxv6QBsbcecmlICvtxrS2oYhCvEUbcHcRNzeA/Y6ML39tuiepfsSMWW2fU+r1oZ3q3c9Ayo5hgRZ6GcjgReD2hA5hrSqVSXULKc2fjkIjpHjGWiAl7QWD5/faUqjPh984Q8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(3023799007)(4143699003)(56012099006)(11063799006)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTh1WmYxTHIyaTFFMHZZd3BhbStSOGVRR3A5dXE1Nk44azh0Y0V2c05ZdDVL?=
 =?utf-8?B?dEtqQkFuQ1hZam9oYjJISExremdVaFZIRnd3YU5BVFZldzNsZVZZOGMzaVpr?=
 =?utf-8?B?WFBtSkRyV3F1MG1MSFBzbURKcU9XRnFTRWFiRU95UXpWejIzUkhMWnJoeURM?=
 =?utf-8?B?a1M0QjNPZUNnWUFZSkxRUGNTMUo2RGFJTzFnd1F1MXErd2xIbzBNaWR4TENS?=
 =?utf-8?B?VTdaaGVwVkxnMGdSWE1ZeHJSSUJ4Y3FxYVlYM0lZeUhvNUw0VTdYTldwRGpG?=
 =?utf-8?B?aGI5bHNLTlhMenBPQndjb2pYYThDNjZvNDB1K3FpTEdXUTZacnpoZEFxOEZn?=
 =?utf-8?B?NWpnOFU4T1VsY1VBVkorZm4rUk5KbnJrU1hCYVRqM1lvQjAybEQ5eUhKeGNs?=
 =?utf-8?B?TW1jTFloYk9JSGtiRXczdk5idENjdkMzVi9BYzJuOUVhQ29NYWtWTmc3Zm45?=
 =?utf-8?B?R3JLYktETnJSUHJGTTY5elU3ZjEzVFlLdFlDVHQzVVIzRk9hWXhRYnlSWW84?=
 =?utf-8?B?YTBRdUVNLzJzemt1aDdPdzBsZnZuVVhVUFdSUDdOWkxhOTNtMUpFUVRHYnk1?=
 =?utf-8?B?RXRCTmU2Q1phSUhqS0Uzeit5WFNjdEJsTEU1dkNlaGJVc3NaODcvV2o2NG1W?=
 =?utf-8?B?czhmQ3VaTVdDM0FTTDZMamRHV0pUK2dzay9GbHMyRFJHZEt4Y1U0bzlUSmhB?=
 =?utf-8?B?alFCaWJ1UTJqQjZ1bnJoM2tuenY2dUdBNG9QL0tOMitZZmZUMG4xRy9sRDg5?=
 =?utf-8?B?dG1kZzZCOVUrNTd5RjZzd0oyWlhLRWwzbmJvSGEvT2tGdzQzOWhoU2YxV0Qx?=
 =?utf-8?B?ZERhemFVV0RlNFRoWHpIcjJYVG9nWkpKb3VhWUcrQ2NaOWR0MklHSVpzOFA0?=
 =?utf-8?B?ZXpScWU5OUE3cVEwUGhYa25aVVNDaHlLQ0ZXajRZM1Z4TGpMWXg2bmNCbEZY?=
 =?utf-8?B?dWg3K3kwcUVOcnBGSUgxOXpZK2R0c2NzWmdnRUM5Ym12dEI5QzAzVDdoMjNF?=
 =?utf-8?B?bjl5dXE2OVZHcDAxejJuWFoyZ3lhaEp5UDdvUE1CRmNxYjRZYnVBZ1VLcEtD?=
 =?utf-8?B?U3g3emJBRzFsTzZ4a3pEeXlxOWhqREZqbksyemJBd1d6bGpvWkRQK2x1LzVo?=
 =?utf-8?B?cmpoUGRjeWVudVcwL1Z0MjFXWkdNd2UveGQ2c0c2ZHlaS2w3dXlmOER3NG0z?=
 =?utf-8?B?aWk4VU9ZbVUyUFE0T0JES0JUYVZlZ3pmL0FxS3drZ0preEdBTzlsU3pnaitN?=
 =?utf-8?B?Y3VEYTUwcElJR3NtVE5lSXVaMzM5WEdmSWFsQStIQzB3Zm9CdUVTTjROZnBM?=
 =?utf-8?B?NUZCRXcyRVM2d3Q2TXdEVi9TK0VweEdNZ0RZUkZHWC9qN2lBSXlnQlNFWDBQ?=
 =?utf-8?B?c0JOZ0loTjJoM1JkRnZPODQ5aFBnZkpqTmNIRFhVODJaNnVuRzRWZkdkSzA0?=
 =?utf-8?B?S2xzdnFjL0NicWRaYW1VN1ZSMm1NTWI3aENOdHpPS25OWW92bzFiNjJhYXFV?=
 =?utf-8?B?LzN5YkgvY0FjWGc1SzMzKzI0ek5MdGRJSTFuR0RWeGNSeThXWENURUxHa2ps?=
 =?utf-8?B?L2ZTZGlwRHJLVFFIbUVjNy9EUUxwKzhKWnErL2hMRDhQdmUvbEE5RmlxUStQ?=
 =?utf-8?B?YkRKUm5idlhOdmVIZGt3WXdzdGZ2RThOYTBUSGdQZ2FVL1VHZDVKdzFnSFJm?=
 =?utf-8?B?d2kzZ1NlbTJOTW52SWx1clRMMG9jQmh4V1JWZkYrbGZXMWpHRmR1QmVKaDFC?=
 =?utf-8?B?UlhvZjVZcGxiNThzTDlNRDVZeGZTSVZHMmdUaVZGRHI5Uml4c3lQTmlBd2hX?=
 =?utf-8?B?aDRSVmpQS05ha0lKbUd1NXBZOGdrc2lxRmhMQWtBVnhQclVjSXU4enhTcSsv?=
 =?utf-8?B?TVB1dHh4NjFtSWlXNU01TjhveUxHU21aWEU1Mzc0TFpzK0pYYjVlTllZOXdj?=
 =?utf-8?B?dC8wbDRCSDFTZEwrNVpodWpJYytqai84QzZsVm96WS9CY3N2YUoyS1dJYXhY?=
 =?utf-8?B?QUZRUmJDRFczN2ppS0taVnpjdzRIc2dFR2pXMXcySXV1aWZEL1dlNnJJY1Ay?=
 =?utf-8?B?ZXhMOEl2ajVWTTZ3b1d1Mm1BYnY1UVI0UlRCbmVMNm5vSENMVEc2T1A5OUNz?=
 =?utf-8?B?VDRYTDBWWEZpby9GRmIxcEhmMFJQMTR4RXp2ZGc4eXVPRDZ4NkFHck5YNi84?=
 =?utf-8?B?U0RyT3VyUHdmZ1dRQlNmalBXa2cvaWRTSmVDN3RIWTYyNTRHejQ2aTB0dGFG?=
 =?utf-8?B?MGV0am02d1IzL3JTcVZtanp6bjh1aGN3c2xkOUFQWlQ2NEoxSkZHdEozcE1K?=
 =?utf-8?B?NjV6UGRHWTJxSWFhQ0szNllQLy9qR0t3VVdEVWkvRjgxZGhlN0dsZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbaa3ff-4799-4ad6-5d2d-08ded09cc382
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 20:28:04.8532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mz35yIpgG0z53CdnOI41p228wHpSFpAnrr7H1CREckH6Sg9DEp2dfbm0od/Pa+zKU/QlpEic74haM3DLjP6kJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9822
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

--------------i3w4FABZ701PMXaCFBgiAQKA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Christian, Ramalingeswara,

The patch logic is correct - igt_skip_on_f() is the proper IGT mechanism for 
conditional test skipping. I've verified the test does perform VRAM→GTT→VRAM 
bounce validation, and the skip is appropriate since APUs use unified memory 
without VRAM/GTT distinction.

Thanks for the validation output, Ramalingeswara - the skip works correctly 
on GFX1150/Juniper!

1. Fix redundant comparison: change "is_apu(&gpu_info) == 1" to "is_apu(&gpu_info)"

2. Improve skip message for clarity:
   igt_skip_on_f(is_apu(&gpu_info),
                 "Secure bounce requires VRAM/GTT separation (dGPU only)\n");
   

3. Fix Signed-off-by (per Kamil's review):
   - Remove comma from name
   - Reorder to: Kanala Ramalingeswara Reddy <Kanala.RamalingeswaraReddy@amd.com>
   - Update your global git config and email From: address to match

The "Last errno: 2, No such file or directory" in the output is IGT 
framework noise and cannot be suppressed.

With these fixes:
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Thanks,
Vitaly

On 2026-06-22 04:55, Ramalingeswara Reddy, Kanala wrote:
>
> AMD General
>
>
> Hi @Koenig, Christian <mailto:Christian.Koenig@amd.com>/@Prosyak, Vitaly <mailto:Vitaly.Prosyak@amd.com>
>
> Please find below validation of code changes for this skip test.
>
> rtg@rtg-juniper:~/igt-gpu-tools$ *sudo ./build/tests/amdgpu/amd_security --run-subtest amdgpu-secure-bounce*
>
> IGT-Version: 2.4-ge1ee0c043 (x86_64) (Linux: 6.19.0-2352360.24.04.amdgpu.amd64 x86_64) Using IGT_SRANDOM=1781273151 for randomisation Opened device: /dev/dri/card0 Initialized amdgpu, driver version 3.64
>
> amdgpu: GFX1150 (family_id, chip_external_rev): (150, 1)
>
> amdgpu: chip_class GFX11
>
> Starting subtest: amdgpu-secure-bounce
>
> Test requirement not met in function __igt_unique____real_main311, file ../tests/amdgpu/amd_security.c:364:
>
> *Test requirement: !(is_apu(&gpu_info) == 1) Secure bounce test is not supported in APU's.*
>
> *Last errno: 2, No such file or directory Subtest amdgpu-secure-bounce: SKIP (0.000s) *
>
> rtg@rtg-juniper:~/igt-gpu-tools$
>
>
>
> Thanks,
>
> Ram.
>
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Monday, June 22, 2026 2:09 PM
> To: Ramalingeswara Reddy, Kanala <Kanala.RamalingeswaraReddy@amd.com>; igt-dev@lists.freedesktop.org; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Vishwakarma, Pratik <Pratik.Vishwakarma@amd.com>
> Subject: Re: [PATCH] tests/amdgpu/amd_security: Skip secure bounce test for APUs
>
>  
>
> On 6/22/26 06:04, Ramalingeswara Reddy, Kanala wrote:
>
> > Secure bounce test is not supported for APUs.
>
> >
>
> > On dGPUs, TMZ works only on VRAM (local memory) but not on GTT (system
>
> > memory) due to HW limitations, so this test validates bounce operation
>
> > from VRAM to GTT and back to VRAM works on dGPUs.
>
> >
>
> > Since APUs do not support this functionality, skip the test for APUs.
>
> >
>
> > Signed-off-by: Ramalingeswara Reddy, Kanala
>
> > <Kanala.RamalingeswaraReddy@amd.com <mailto:Kanala.RamalingeswaraReddy@amd.com>>
>
>  
>
> @Vitaly I suggested this change but I'm not familiar enough with the IGT code to review this.
>
>  
>
> I'm not 100% sure what igt_skip_on_f() does but it looks a bit fishy to me.
>
>  
>
> Thanks,
>
> Christian.
>
>  
>
> > ---
>
> >  tests/amdgpu/amd_security.c | 8 ++++++--
>
> >  1 file changed, 6 insertions(+), 2 deletions(-)
>
> >
>
> > diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
>
> > index 9ebb3fa83..2a8ae4a23 100644
>
> > --- a/tests/amdgpu/amd_security.c
>
> > +++ b/tests/amdgpu/amd_security.c
>
> > @@ -360,8 +360,12 @@ int igt_main()
>
> >            /* dynamic test based on sdma_info.available rings */
>
> >            igt_describe("amdgpu secure bounce");
>
> >            igt_subtest("amdgpu-secure-bounce")
>
> > -          amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
>
> > -                                       AMDGPU_HW_IP_DMA), is_secure);
>
> > +         {
>
> > +                       igt_skip_on_f(is_apu(&gpu_info) == 1,
>
> > +                                                    "Secure bounce test is not supported in APU's.\n");
>
> > +                       amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
>
> > +                                                    AMDGPU_HW_IP_DMA), is_secure);
>
> > +         }
>
> > 
>
> >  #ifdef AMDGPU_USERQ_ENABLED
>
> >            igt_describe("amdgpu gfx command submission write linear helper with
>
> > user queue");
>
>  
>
--------------i3w4FABZ701PMXaCFBgiAQKA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Christian, Ramalingeswara,<br>
      <br>
      The patch logic is correct - igt_skip_on_f() is the proper IGT
      mechanism for&nbsp;<br>
      conditional test skipping. I've verified the test does perform
      VRAM→GTT→VRAM&nbsp;<br>
      bounce validation, and the skip is appropriate since APUs use
      unified memory&nbsp;<br>
      without VRAM/GTT distinction.<br>
      <br>
      Thanks for the validation output, Ramalingeswara - the skip works
      correctly&nbsp;<br>
      on GFX1150/Juniper!<br>
      <br>
      1. Fix redundant comparison: change &quot;is_apu(&amp;gpu_info) == 1&quot;
      to &quot;is_apu(&amp;gpu_info)&quot;<br>
      <br>
      2. Improve skip message for clarity:<br>
      &nbsp; &nbsp;igt_skip_on_f(is_apu(&amp;gpu_info),<br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;Secure bounce requires VRAM/GTT separation (dGPU
      only)\n&quot;);<br>
      &nbsp; &nbsp;<br>
      <br>
      3. Fix Signed-off-by (per Kamil's review):<br>
      &nbsp; &nbsp;- Remove comma from name<br>
      &nbsp; &nbsp;- Reorder to: Kanala Ramalingeswara Reddy
      <a class="moz-txt-link-rfc2396E" href="mailto:Kanala.RamalingeswaraReddy@amd.com">&lt;Kanala.RamalingeswaraReddy@amd.com&gt;</a><br>
      &nbsp; &nbsp;- Update your global git config and email From: address to
      match<br>
      <br>
      The &quot;Last errno: 2, No such file or directory&quot; in the output is
      IGT&nbsp;<br>
      framework noise and cannot be suppressed.<br>
      <br>
      With these fixes:<br>
      Reviewed-by: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a><br>
      <br>
      Thanks,<br>
      Vitaly</p>
    <div class="moz-cite-prefix">On 2026-06-22 04:55, Ramalingeswara
      Reddy, Kanala wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DM4PR12MB7646C0D5F1FC73E8412CAFAC95EF2@DM4PR12MB7646.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}.MsoChpDefault
	{mso-style-type:export-only;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <p style="font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;" align="Left">
        AMD General<br>
      </p>
      <br>
      <div>
        <div class="WordSection1">
          <p class="MsoPlainText">Hi <a id="OWAAMFAD2F751D8FD4A9F86ABCD91558DF6DF" href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">
              <span style="font-family:&quot;Calibri&quot;,sans-serif;text-decoration:none">@Koenig,
                Christian</span></a>/<a id="OWAAMAEE97B1367F44A28B62AFAC72B77FABE" href="mailto:Vitaly.Prosyak@amd.com" moz-do-not-send="true"><span style="font-family:&quot;Calibri&quot;,sans-serif;text-decoration:none">@Prosyak,
                Vitaly</span></a><br>
            <br>
            Please find below validation of code changes for this skip
            test.<br>
            <br>
            rtg@rtg-juniper:~/igt-gpu-tools$ <b>sudo
              ./build/tests/amdgpu/amd_security --run-subtest
              amdgpu-secure-bounce</b><o:p></o:p></p>
          <p class="MsoPlainText">IGT-Version: 2.4-ge1ee0c043 (x86_64)
            (Linux: 6.19.0-2352360.24.04.amdgpu.amd64 x86_64) Using
            IGT_SRANDOM=1781273151 for randomisation Opened device:
            /dev/dri/card0 Initialized amdgpu, driver version 3.64<o:p></o:p></p>
          <p class="MsoPlainText">amdgpu: GFX1150 (family_id,
            chip_external_rev): (150, 1)<o:p></o:p></p>
          <p class="MsoPlainText">amdgpu: chip_class GFX11<o:p></o:p></p>
          <p class="MsoPlainText">Starting subtest: amdgpu-secure-bounce<o:p></o:p></p>
          <p class="MsoPlainText">Test requirement not met in function
            __igt_unique____real_main311, file
            ../tests/amdgpu/amd_security.c:364:<o:p></o:p></p>
          <p class="MsoPlainText"><b>Test requirement:
              !(is_apu(&amp;gpu_info) == 1) Secure bounce test is not
              supported in APU's.<o:p></o:p></b></p>
          <p class="MsoPlainText"><b>Last errno: 2, No such file or
              directory Subtest amdgpu-secure-bounce: SKIP (0.000s)
              <o:p></o:p></b></p>
          <p class="MsoPlainText">rtg@rtg-juniper:~/igt-gpu-tools$<o:p></o:p></p>
          <p class="MsoPlainText"><br>
            <br>
            Thanks,<o:p></o:p></p>
          <p class="MsoPlainText">Ram.<o:p></o:p></p>
          <p class="MsoPlainText">-----Original Message-----<br>
            From: Koenig, Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a> <br>
            Sent: Monday, June 22, 2026 2:09 PM<br>
            To: Ramalingeswara Reddy, Kanala
            <a class="moz-txt-link-rfc2396E" href="mailto:Kanala.RamalingeswaraReddy@amd.com">&lt;Kanala.RamalingeswaraReddy@amd.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>; Prosyak, Vitaly
            <a class="moz-txt-link-rfc2396E" href="mailto:Vitaly.Prosyak@amd.com">&lt;Vitaly.Prosyak@amd.com&gt;</a>; Vishwakarma, Pratik
            <a class="moz-txt-link-rfc2396E" href="mailto:Pratik.Vishwakarma@amd.com">&lt;Pratik.Vishwakarma@amd.com&gt;</a><br>
            Subject: Re: [PATCH] tests/amdgpu/amd_security: Skip secure
            bounce test for APUs</p>
          <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
          <p class="MsoPlainText">On 6/22/26 06:04, Ramalingeswara
            Reddy, Kanala wrote:<o:p></o:p></p>
          <p class="MsoPlainText">&gt; Secure bounce test is not
            supported for APUs.<o:p></o:p></p>
          <p class="MsoPlainText">&gt; <o:p></o:p></p>
          <p class="MsoPlainText">&gt; On dGPUs, TMZ works only on VRAM
            (local memory) but not on GTT (system
            <o:p></o:p></p>
          <p class="MsoPlainText">&gt; memory) due to HW limitations, so
            this test validates bounce operation
            <o:p></o:p></p>
          <p class="MsoPlainText">&gt; from VRAM to GTT and back to VRAM
            works on dGPUs.<o:p></o:p></p>
          <p class="MsoPlainText">&gt; <o:p></o:p></p>
          <p class="MsoPlainText">&gt; Since APUs do not support this
            functionality, skip the test for APUs.<o:p></o:p></p>
          <p class="MsoPlainText">&gt; <o:p></o:p></p>
          <p class="MsoPlainText">&gt; Signed-off-by: Ramalingeswara
            Reddy, Kanala <o:p></o:p></p>
          <p class="MsoPlainText">&gt; &lt;<a href="mailto:Kanala.RamalingeswaraReddy@amd.com" moz-do-not-send="true"><span style="color:windowtext;text-decoration:none">Kanala.RamalingeswaraReddy@amd.com</span></a>&gt;<o:p></o:p></p>
          <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
          <p class="MsoPlainText">@Vitaly I suggested this change but
            I'm not familiar enough with the IGT code to review this.<o:p></o:p></p>
          <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
          <p class="MsoPlainText">I'm not 100% sure what igt_skip_on_f()
            does but it looks a bit fishy to me.<o:p></o:p></p>
          <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
          <p class="MsoPlainText">Thanks,<o:p></o:p></p>
          <p class="MsoPlainText">Christian.<o:p></o:p></p>
          <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
          <p class="MsoPlainText">&gt; ---<o:p></o:p></p>
          <p class="MsoPlainText">&gt;&nbsp; tests/amdgpu/amd_security.c | 8
            ++++++--<o:p></o:p></p>
          <p class="MsoPlainText">&gt;&nbsp; 1 file changed, 6 insertions(+),
            2 deletions(-)<o:p></o:p></p>
          <p class="MsoPlainText">&gt; <o:p></o:p></p>
          <p class="MsoPlainText">&gt; diff --git
            a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
            <o:p></o:p></p>
          <p class="MsoPlainText">&gt; index 9ebb3fa83..2a8ae4a23 100644<o:p></o:p></p>
          <p class="MsoPlainText">&gt; --- a/tests/amdgpu/amd_security.c<o:p></o:p></p>
          <p class="MsoPlainText">&gt; +++ b/tests/amdgpu/amd_security.c<o:p></o:p></p>
          <p class="MsoPlainText">&gt; @@ -360,8 +360,12 @@ int
            igt_main()<o:p></o:p></p>
          <p class="MsoPlainText">&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* dynamic test based
            on sdma_info.available rings */<o:p></o:p></p>
          <p class="MsoPlainText">&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;amdgpu
            secure bounce&quot;);<o:p></o:p></p>
          <p class="MsoPlainText">&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_subtest(&quot;amdgpu-secure-bounce&quot;)<o:p></o:p></p>
          <p class="MsoPlainText">&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            amdgpu_secure_bounce(device, fd, &amp;sdma_info,
            get_ip_block(device,<o:p></o:p></p>
          <p class="MsoPlainText">&gt;
            -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_HW_IP_DMA),
            is_secure);<o:p></o:p></p>
          <p class="MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></p>
          <p class="MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            igt_skip_on_f(is_apu(&amp;gpu_info) == 1,<o:p></o:p></p>
          <p class="MsoPlainText">&gt;
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Secure
            bounce test is not supported in APU's.\n&quot;);<o:p></o:p></p>
          <p class="MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            amdgpu_secure_bounce(device, fd, &amp;sdma_info,
            get_ip_block(device,<o:p></o:p></p>
          <p class="MsoPlainText">&gt;
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            AMDGPU_HW_IP_DMA), is_secure);<o:p></o:p></p>
          <p class="MsoPlainText">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
          <p class="MsoPlainText">&gt;&nbsp; <o:p></o:p></p>
          <p class="MsoPlainText">&gt;&nbsp; #ifdef AMDGPU_USERQ_ENABLED<o:p></o:p></p>
          <p class="MsoPlainText">&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;amdgpu
            gfx command submission write linear helper with
            <o:p></o:p></p>
          <p class="MsoPlainText">&gt; user queue&quot;);<o:p></o:p></p>
          <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------i3w4FABZ701PMXaCFBgiAQKA--
