Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC44CA1002
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 02:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF75E10E0A1;
	Fri,  5 Sep 2025 02:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AWkzKCAU";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2087.outbound.protection.outlook.com [40.107.212.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EA610E0A1
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 02:05:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmnGOqA8vZ8tSA1YVUmlzKIHimrLA86eUqSsZBd0IMLVlTLQGq/IZc02KlH/8FKAi+V9DhrMrWnCco+uapMovBi7XqgqaGzcZNND4ifbN3MAVMXfxsJq0wD1Lf/LPGi16+pge6aWb1ZWQ4cmlg0qwp9rhkQYZ7p3xEnyUQYV/QpurARiQWuwUWyu055KP1LSw8SUX//rVegYw1Xd1TR35kkYX0NbZ4T82IiVv6rTTWfyK2J9eGUBTg/TVzMWCXCkck3Epn1K73SOWsd2vOXnI39kg3Pa3Htiztl8LXIIfRJUG+2hR6vxS6Car7m01ZKAsU2hEC4cX2vFccpGzUWbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjDgUPkdf0BdwdnDrUtsxm1XQM/z0V7lKOPwlP4lbS8=;
 b=c5E6UU6EpJLa0CNnz9Mc9BB9jeaYgqrcKWntjaF4RW/dEJWOr0GnSvJdjhORVq+NIjXFG6M4brnkRUNozKZ/BNQK8whDsoNQX2DCmH71HRSwyeHP4y/hd9LLN3SN6xqJ+9PIc2C/TKVaDbOF+3iArEkR+VrsVzRrfj58Oe+z1QrR/MoldoPENMZSJLJwNcyXZnh8uJv8HThXTQKD79rczRBZMlWALLToF/W3MCb+q9tAYAxyvmOKzbE/sBXTMcRPw4I0OJleA/KwqvcgZBhcJspR9C4mH5dNtR+LWt+mGWtBRkBc6CeGqUAjvdUokcgY+9COO/QF1fqlSph+z2Nj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjDgUPkdf0BdwdnDrUtsxm1XQM/z0V7lKOPwlP4lbS8=;
 b=AWkzKCAUhw6npc1xCMaPxdaRBBWHpWCpdUa1xhqT30TsNe1aEQ5kOhj+X0vP+hMg1/fO0jKOK4221Ez95HbeQastA3DE3Bp0ailMM0m896KnOh0OWoTwd9C68Xba24EaaNw36KxvJ1KERjGt59badSTgVdwjcZCgZCxBKAU2U+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CY5PR12MB6479.namprd12.prod.outlook.com (2603:10b6:930:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 02:05:15 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 02:05:14 +0000
Message-ID: <58ef035b-011d-40f1-afcb-d9e3427387de@amd.com>
Date: Thu, 4 Sep 2025 22:05:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t V2] lib/amdgpu: add support for user queue mode in
 dispatch tests
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250903094308.2607121-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250903094308.2607121-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::15) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CY5PR12MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: b9214821-cd3f-4912-282f-08ddec20a702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0EwN2JkYXQzb0hOM1NQMldRMjlkb1NySjU5NmxvbFMxT0xmUTVVcndXdWx5?=
 =?utf-8?B?RG01WUpDSThVWGdaY2oyNEpLQ2IxaFRMeXE1NGRLUWd1cFIzSWFvcUoxOGt5?=
 =?utf-8?B?S2p3VzJDUnczTTBvenpUbWxFRnlaK1NaVVUxSXRQL09kRlYrR2FiM3hEWE1t?=
 =?utf-8?B?bVVBWERHZHc2ZVJCMGVGcDFOcGZzNWIxY1U4Njc0RHRpMVp4cU1Pb211OUdV?=
 =?utf-8?B?T01Td2srRXhTSnhIVGFKaFpNQm40VFNuaUFSWG5VNDJySFBkbTI4Zm1xaktm?=
 =?utf-8?B?Kys3NVVhSis5bldSbFJwTzd1MDJvSnl4S3hoV21SeHhVUG52dzlkSU1HOHUy?=
 =?utf-8?B?bGJ6OWZ0bWdIS29aZ2xaSDJBdTkvb0IveUNud0VLUzllNzUrdGRSUy9BQ2dZ?=
 =?utf-8?B?Qkw2YmVlbUoxby84Nyt2Tnc3ZE9qM2FWcVYrWE9NalZWL1B3WlhIMU00ZHhC?=
 =?utf-8?B?UWpCRWE1clo2aE1XbWZxODRWQWE1bWgrV2dFTEl5UHUxNUR0YWhCaWVPK1Jl?=
 =?utf-8?B?NUdKeHhESTBrWnROV3VobnUyY3FEN2ErTXA3SzMvQlArbmYyQ0xLMXNLdFFV?=
 =?utf-8?B?Z3VnNU1EcU52TFFkeVJNK283MlpESEdKWXJPOWlhWEdWVE45WitldGhZRm5w?=
 =?utf-8?B?bkNqcG5QUktNc09Tdnp0ZjZYTENia1V4bUJIMDlZOEFnS0wrbm8xUWE1dThB?=
 =?utf-8?B?OFpCZ05oNFNIeEtzVDF5Y1o1Yk5jTU8xWWpiaTBEVXllaEJOUXF3YTlrRUFX?=
 =?utf-8?B?YXhoeXBDNFpzQVp6MnBHRWhScmtDWUNSSGdEWlpkQzJNUXZiSWF5SWxXS0Vx?=
 =?utf-8?B?TFFpMGFxMklNODYyNmFEb2dHc2ZpK0oxTGhFenpKcU1RODhMM1JxVCs1ZDVF?=
 =?utf-8?B?SDBDMFdrT3RKeTBkbXJ6TjJTaCs2RnUxdHBxaEVheVBVMjAxTjZsSjFhanQ1?=
 =?utf-8?B?TG16dVVrT0JPVTlEK0JQTWRsbG5CNnplL08vYWI4N2htbHNFYWhkN1NTYWdR?=
 =?utf-8?B?UkROWjBUdURzSTJpMCtFRFMvOXBwcmJvRmNXTW1oaTNNSkRiMkxlWldDckFw?=
 =?utf-8?B?Z1Y3RVZmdEduK1I3RitlVnFTN3F5eWtKSndVS1k0U0tYeXJwem5lQjI3NUcy?=
 =?utf-8?B?dGlWaXhpSTNuNmN4akJUTFFlS3dBZ09ZQjJwczVSemJQSzRzT1loQkhxMjJO?=
 =?utf-8?B?WkNKRTNQSjk3ZG45YU5aQkJtTnNCcm43dElwRnVLUllURTd3VktqOWpDdHJw?=
 =?utf-8?B?bktaZ0Jkbmk0Ymlaa25TUytWcmQ1THRuTnQvR0JJNHdOMTFBVldjRHo0d0V0?=
 =?utf-8?B?cGNWeHlLaEo2bnhHNmlRei9TNFV5T0lLazEyMUxoMk9WUk53eTFYTmVROCt0?=
 =?utf-8?B?Q1Y3dnNuZEJBRHNVYnFjWkQ5VHppek1JS3R6Smc2eVpFZDFNTnAvaGRjTDNT?=
 =?utf-8?B?WHg0dVRrTlhNSnhDRDdpRWoveFlHYWo3UGlvbEY3UExxTlZIRGxta2pjd1px?=
 =?utf-8?B?cmtlbDdGTnZBdVVnMzJkbnZ6SFgxbndoNzZaenBrMGdyTWFrNFZpblVzL09N?=
 =?utf-8?B?eEN5c3JSYkhwQTVmL3g4MnVIYWw4UlJobEx3Nk5JUENQODZzcCtDWEQvajBC?=
 =?utf-8?B?QVI3TUU4K1JBdDAwaUxFTFRhbU5TTXNrMStpU0ZZSkFKQ2N5Q2FWRXJHdEJl?=
 =?utf-8?B?ZDM3OEhSM1JjZWowNDlnRkRzeWkveU8vZzV0aEtIa0M0Tzh2Nnk0UVdzT3pi?=
 =?utf-8?B?UVdSNFkzYWtuV2x4dnlaWXBTUUUvckRLVWtrVS9EZzdtMnJJMmVTWkpFZ1FP?=
 =?utf-8?B?OWZDeTJlSm1rOTRsTzN0TU1mbUw0NjFpcElFcjArcGErMXVXRmlFWlhhQVg5?=
 =?utf-8?B?QzMzalJuSXdSelJFRnB6SGdMN1FpQWMzS21UcmcvZ1Q4b1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU4yTHlzZXN2dDU1cXJmNGhnTEVITmFueisyTzNwbDVpT2R6V0xrcGNJUmZV?=
 =?utf-8?B?bzdYUVQ2RXFxYXh3VDB6TjZPS3lCNEd3QUo3RlRiL0lNYzBBeC9VY2hqUVB2?=
 =?utf-8?B?N0UxV1lDWTl5dzNld2YzNjVlQmxZV3p5ZmYwVXB3TGNoZTljN040SWdubElO?=
 =?utf-8?B?QWNsRDRuU2lMVGFQS0I1eVBSRzJjK21lSmpqNjRYbU5GOFZPTW0vUEF0a2hE?=
 =?utf-8?B?ejNWbmZIV1duaklBZ3FUczhXaTc0STMzYnNmV1NzYUNTSVpRaGhzMFNJY3J5?=
 =?utf-8?B?b2xzdnVaZlc2MGF4SllPSkxrU3lHMFFPbm5mT2NqWWpONEl4ZS9PSlZXN1NL?=
 =?utf-8?B?d0wrVC9IbHQ3M0NQVU10bHZpRlZTOWlmOG5YYzI0Ty9CbFE5QnFyL1pqaXcv?=
 =?utf-8?B?VTZiUlJtc21KMDY4Q3VDS2NwaDRWaUxpMjdCY05tSTkrSnM1QWFGbHZQZWdW?=
 =?utf-8?B?ZXg3dmpwYWowSmpOc09OR1ExWHpVYmpsMVJJa2FQMjFnS2JzV2hwL1NUbEFL?=
 =?utf-8?B?eldFbGVvSlcraGV5RlI0bGNkbjlFb0V6QVNqNVNmSTlHQUNhaW9RejVNb1RI?=
 =?utf-8?B?R0ZYYVRkeGhSV0pOTDVNUGY0RitjVi82L3lReXcrTjJLdHVWL0tENlJFcks1?=
 =?utf-8?B?VzFYWjNpaDdXVE1kZy92c2VVM05nSVJCNkNqNWcvTEppanp3dUpQdFhhQ0x0?=
 =?utf-8?B?MkdyTSsyUWdVS1BaRVlwT3Buc3U3MlRVSVBvUzBLMTRIZXc4clY2VzBhWG1M?=
 =?utf-8?B?dUdIRVlPMzlzVXZZNlljVjNjK0NKNDF6K1IxWFY1aEs1dVIxZXpoSE9DZHQ3?=
 =?utf-8?B?TlJ3UitRQ0hSajA0QnhXTG5TY01ZQ1V1Qkg0WG9GNTk4RDRjZzBtN0JzazZB?=
 =?utf-8?B?L3h3U3JyRDZXdEJUYU5RRmhaaTJnU0JSbWxuU0IrQVpDUXdYY29IWWJNbndV?=
 =?utf-8?B?ZFVMaTM0T3ZrQmhEc0dEL1phWWRZMFhETnluZHV1T2NpZWFGS2RSb3Y3d1U4?=
 =?utf-8?B?L29pOGRlNTA0KzJCSjZHVzRXd0pCa2xudzVaYlMybWlBY2tOV3BXaUhkTjRl?=
 =?utf-8?B?RC91RGl1Q3pNaHE1by9UODZwK2xGdS9jdlE1TFUyVWt4Y3FkZVlDblpCZnlP?=
 =?utf-8?B?Y1llSzhCNGVMRUFUcGNDbmRITzhUMW1jTlpTNGwvWmlxb2MvWjBWaDhyM0ZD?=
 =?utf-8?B?RTNxWnV3aXl3azFzSDBueFYwU1lLOVdFN3BLeDVmZCtFTkt6MzYrSUttdXd1?=
 =?utf-8?B?KzFRYzdqdUhHSWVKNk0rVkRPbEZLNC8yOTVGRHM3cW9taSttc1cxbTBoZ24w?=
 =?utf-8?B?Wlkvd2JJdW45MGNnWFdiRkVPejJuSUFWZFhuN2FKWTZMTkZXNERGYWxvaFhk?=
 =?utf-8?B?UzhJZ3c0T2c3aEVxYml3QmozQjJOelhIQzM3Y2VHb1FJMnQvVnV0Q1Q5Zngw?=
 =?utf-8?B?NktMZ0RTSGZsdnVGTWhWZWZsY2tjMTcwMVAwdjMyeVB0dktpdTJMM2UwZkRo?=
 =?utf-8?B?OHBOQXN5dVFzSnUveW5pQ0l4b21YOXlVeFV1ck5GcUprY2ltQmNSMElGeWEw?=
 =?utf-8?B?cFRGZkVLakRTN3htbXJlRlhkc2U4WFcvdUk0NzN1NzQyb1BtUDl2bnVSb1Nx?=
 =?utf-8?B?UjJ3ZC9YZDlhd2ZSdXdxOXpUR1RsN1ZPcTc0bUVnZ1ZiUlNxa051OE1SZDZx?=
 =?utf-8?B?N0pNWnVFdlJXR0w3enZ1b00rdElYMFdrVllYWm5xM0xhbm9PSHljYUJVeVVn?=
 =?utf-8?B?cU4xVXFpdks1b3dCTlh0VTdvK21xejdpZEpqZjJWZ0xURlNQZGQ3cGcyMjJi?=
 =?utf-8?B?SmgrRGV6R3RyVWxWN2FjT1lXMkh1ZVQreHdtUXZWeE42MzhCY2hBWTd1Uk44?=
 =?utf-8?B?R0ptVEdZaTZDM0tWQVdjM2QzRjRTR2U0NTJxM3l4MW0rOHdQZjdjbzdWS2lp?=
 =?utf-8?B?S3RhUDcrL0NtN3F6RDdrbTdFOXVPNmZtNG9qeGloU0dwVTQvK3VHQ2FXU05E?=
 =?utf-8?B?Y2VUTHBoOWViZXk0Vm1OYmhZNkpsenJvWUxhQzZ1WUlHTWllWXRFSnlJUGZR?=
 =?utf-8?B?L3NNa0ZDbDdIaHNLVkZqZkM0cDViWmRzWWxoSHg2YWhEL2lMVDZEeEhidzNZ?=
 =?utf-8?Q?gjZOLfeOgaBYXq+j8IAe4w+Vl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9214821-cd3f-4912-282f-08ddec20a702
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 02:05:14.4433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lZ0uv4v0A4/4UI6pqg8sr3HamHYADGDuc9L5RPQ80HOBt/Wi3h82SBUHjKMwBW8RHp/zSaJcnWN2yD2UTgWLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6479
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

Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-09-03 05:43, Jesse.Zhang wrote:
> From: "Jesse.zhang" <Jesse.zhang@amd.com>
>
> This commit introduces user queue mode functionality to the amdgpu dispatch tests,
> allowing tests to run using user queues.
> Key changes include:
>
> Added user_queue parameter to test functions to toggle between traditional
> and user queue modes.
>
> Implemented user queue creation, submission, and destruction paths alongside
> existing code.
>
> Added timeline syncobj handling for user queue synchronization.
>
> Extended IP block capabilities checking to include user queue readiness.
>
> The changes ensure both kernel queue and user queue modes can coexist, with the
> kernel mode remaining as the default. User queue tests are conditionally
> enabled via environment variable and hardware capability checks.
>
> v2: remove unused variable
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_dispatch.c      | 313 ++++++++++++++++++++++-----------
>  lib/amdgpu/amd_dispatch.h      |   7 +-
>  tests/amdgpu/amd_dispatch.c    |  74 ++++++--
>  tests/amdgpu/amd_queue_reset.c |   2 +-
>  4 files changed, 274 insertions(+), 122 deletions(-)
>
> diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
> index 3153d88a0..c71f03026 100644
> --- a/lib/amdgpu/amd_dispatch.c
> +++ b/lib/amdgpu/amd_dispatch.c
> @@ -15,7 +15,7 @@
>  static void
>  amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  			    uint32_t ip_type, uint32_t priority,
> -			    uint32_t version)
> +			    uint32_t version, bool user_queue)
>  {
>  	amdgpu_context_handle context_handle;
>  	amdgpu_bo_handle bo_dst, bo_shader, bo_cmd, resources[3];
> @@ -36,18 +36,36 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  	uint32_t expired;
>  
>  	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
> +	struct amdgpu_ring_context *ring_context = NULL;
> +	const struct amdgpu_ip_block_version *ip_block = NULL;
> +	uint64_t seq_no;
>  
> -	if (priority == AMDGPU_CTX_PRIORITY_HIGH)
> -		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
> -	else
> -		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +	if (user_queue) {
> +		ring_context = calloc(1, sizeof(*ring_context));
> +		igt_assert(ring_context);
>  
> -	igt_assert_eq(r, 0);
> +		ip_block = get_ip_block(device_handle, ip_type);
> +		ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
> +	} else {
> +		if (priority == AMDGPU_CTX_PRIORITY_HIGH)
> +		    r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
> +		else
> +		    r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +		igt_assert_eq(r, 0);
> +	}
>  
> -	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
> -					AMDGPU_GEM_DOMAIN_GTT, 0,
> -					&bo_cmd, (void **)&ptr_cmd,
> -					&mc_address_cmd, &va_cmd);
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_cmd_size, 4096,
> +					AMDGPU_GEM_DOMAIN_GTT, 0, 0,
> +					&bo_cmd, (void **)&ptr_cmd, &mc_address_cmd, &va_cmd,
> +					user_queue ? ring_context->timeline_syncobj_handle : 0,
> +					user_queue ? ++ring_context->point : 0,
> +					user_queue);
> +
> +	if (user_queue) {
> +		r = amdgpu_timeline_syncobj_wait(device_handle,
> +		       ring_context->timeline_syncobj_handle,
> +		       ring_context->point);
> +	}
>  	igt_assert_eq(r, 0);
>  	memset(ptr_cmd, 0, bo_cmd_size);
>  	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
> @@ -119,8 +137,11 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  	resources[0] = bo_dst;
>  	resources[1] = bo_shader;
>  	resources[2] = bo_cmd;
> -	r = amdgpu_bo_list_create(device_handle, 3, resources, NULL, &bo_list);
> -	igt_assert_eq(r, 0);
> +
> +	if (!user_queue) {
> +		r = amdgpu_bo_list_create(device_handle, 3, resources, NULL, &bo_list);
> +		igt_assert_eq(r, 0);
> +	}
>  
>  	ib_info.ib_mc_address = mc_address_cmd;
>  	ib_info.size = base_cmd->cdw;
> @@ -131,25 +152,33 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  	ibs_request.ibs = &ib_info;
>  	ibs_request.fence_info.handle = NULL;
>  
> -	/* submit CS */
> -	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
> -	igt_assert_eq(r, 0);
> +	if (user_queue) {
> +		ring_context->pm4_dw = ib_info.size;
> +		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
> +				       mc_address_cmd);
> +		seq_no = ring_context->point;
> +	} else {
> +		r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
> +		igt_assert_eq(r, 0);
> +		seq_no = ibs_request.seq_no;
> +	}
>  
> -	r = amdgpu_bo_list_destroy(bo_list);
> -	igt_assert_eq(r, 0);
> +	if (!user_queue) {
> +		r = amdgpu_bo_list_destroy(bo_list);
> +		igt_assert_eq(r, 0);
>  
> -	fence_status.ip_type = ip_type;
> -	fence_status.ip_instance = 0;
> -	fence_status.ring = 0;
> -	fence_status.context = context_handle;
> -	fence_status.fence = ibs_request.seq_no;
> +		fence_status.ip_type = ip_type;
> +		fence_status.ip_instance = 0;
> +		fence_status.ring = 0;
> +		fence_status.context = context_handle;
> +		fence_status.fence = seq_no;
>  
> -	/* wait for IB accomplished */
> -	r = amdgpu_cs_query_fence_status(&fence_status,
> -					 AMDGPU_TIMEOUT_INFINITE,
> -					 0, &expired);
> -	igt_assert_eq(r, 0);
> -	igt_assert_eq(expired, true);
> +		r = amdgpu_cs_query_fence_status(&fence_status,
> +				 AMDGPU_TIMEOUT_INFINITE,
> +				 0, &expired);
> +		igt_assert_eq(r, 0);
> +		igt_assert_eq(expired, true);
> +	}
>  
>  	/* verify if memset test result meets with expected */
>  	i = 0;
> @@ -160,7 +189,14 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
>  				 bo_shader_size);
>  	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
> -	amdgpu_cs_ctx_free(context_handle);
> +
> +	if (user_queue) {
> +		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
> +		free(ring_context);
> +	} else {
> +		amdgpu_cs_ctx_free(context_handle);
> +	}
> +	free_cmd_base(base_cmd);
>  }
>  
>  int
> @@ -168,7 +204,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  				amdgpu_context_handle context_handle_param,
>  				uint32_t ip_type, uint32_t ring, uint32_t priority,
>  				uint32_t version, enum cmd_error_type hang,
> -				struct amdgpu_cs_err_codes *err_codes)
> +				struct amdgpu_cs_err_codes *err_codes, bool user_queue)
>  {
>  	amdgpu_context_handle context_handle_free = NULL;
>  	amdgpu_context_handle context_handle_in_use = NULL;
> @@ -190,9 +226,18 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	amdgpu_bo_list_handle bo_list;
>  	struct amdgpu_cs_fence fence_status = {0};
>  	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
> -
> -	if (context_handle_param == NULL) {
> -		if( priority == AMDGPU_CTX_PRIORITY_HIGH) {
> +	struct amdgpu_ring_context *ring_context = NULL;
> +	const struct amdgpu_ip_block_version *ip_block = NULL;
> +	uint64_t seq_no;
> +
> +	if (user_queue) {
> +		ring_context = calloc(1, sizeof(*ring_context));
> +		igt_assert(ring_context);
> +
> +		ip_block = get_ip_block(device_handle, ip_type);
> +		ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
> +	} else if (context_handle_param == NULL) {
> +		if (priority == AMDGPU_CTX_PRIORITY_HIGH) {
>  			r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle_in_use);
>  			context_handle_free = context_handle_in_use;
>  			igt_assert_eq(r, 0);
> @@ -205,10 +250,19 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  		context_handle_in_use = context_handle_param;
>  	}
>  
> -	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
> -				    AMDGPU_GEM_DOMAIN_GTT, 0,
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_cmd_size, 4096,
> +				    AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
>  				    &bo_cmd, (void **)&ptr_cmd,
> -				    &mc_address_cmd, &va_cmd);
> +				    &mc_address_cmd, &va_cmd,
> +				    user_queue ? ring_context->timeline_syncobj_handle : 0,
> +				    user_queue ? ++ring_context->point : 0,
> +				    user_queue);
> +	if (user_queue) {
> +		r = amdgpu_timeline_syncobj_wait(device_handle,
> +		       ring_context->timeline_syncobj_handle,
> +		       ring_context->point);
> +	}
> +
>  	igt_assert_eq(r, 0);
>  	memset(ptr_cmd, 0, bo_cmd_size);
>  	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
> @@ -307,8 +361,10 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	resources[2] = bo_dst;
>  	resources[3] = bo_cmd;
>  
> -	r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
> -	igt_assert_eq(r, 0);
> +	if (!user_queue) {
> +		r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
> +		igt_assert_eq(r, 0);
> +	}
>  
>  	ib_info.ib_mc_address = mc_address_cmd;
>  	ib_info.size = base_cmd->cdw;
> @@ -318,26 +374,38 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	ibs_request.number_of_ibs = 1;
>  	ibs_request.ibs = &ib_info;
>  	ibs_request.fence_info.handle = NULL;
> -	r = amdgpu_cs_submit(context_handle_in_use, 0, &ibs_request, 1);
> +	if (user_queue) {
> +		ring_context->pm4_dw = ib_info.size;
> +		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
> +				       mc_address_cmd);
> +		seq_no = ring_context->point;
> +	} else {
> +		r = amdgpu_cs_submit(context_handle_in_use, 0, &ibs_request, 1);
> +		seq_no = ibs_request.seq_no;
> +	}
> +
>  	if (err_codes)
>  		err_codes->err_code_cs_submit = r;
>  
> -	fence_status.ip_type = ip_type;
> -	fence_status.ip_instance = 0;
> -	fence_status.ring = 0;
> -	fence_status.context = context_handle_in_use;
> -	fence_status.fence = ibs_request.seq_no;
> -
> -	/* wait for IB accomplished */
> -	r = amdgpu_cs_query_fence_status(&fence_status,
> -					 AMDGPU_TIMEOUT_INFINITE,
> -					 0, &expired);
> -	if (err_codes)
> -		err_codes->err_code_wait_for_fence = r;
> +	if (!user_queue) {
> +		fence_status.ip_type = ip_type;
> +		fence_status.ip_instance = 0;
> +		fence_status.ring = 0;
> +		fence_status.context = context_handle_in_use;
> +		fence_status.fence = seq_no;
> +
> +		r = amdgpu_cs_query_fence_status(&fence_status,
> +				 AMDGPU_TIMEOUT_INFINITE,
> +				 0, &expired);
> +		if (err_codes)
> +		    err_codes->err_code_wait_for_fence = r;
> +	}
>  
>  	if (!hang) {
> -		igt_assert_eq(r, 0);
> -		igt_assert_eq(expired, true);
> +		if (!user_queue) {
> +		    igt_assert_eq(r, 0);
> +		    igt_assert_eq(expired, true);
> +		}
>  
>  		/* verify if memcpy test result meets with expected */
>  		i = 0;
> @@ -346,29 +414,37 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  			igt_assert_eq(ptr_dst[i], ptr_src[i]);
>  			i++;
>  		}
> -	} else {
> +	} else if (!user_queue) {
>  		r2 = amdgpu_cs_query_reset_state(context_handle_in_use, &hang_state, &hangs);
>  		igt_assert_eq(r2, 0);
>  	}
>  
> -	amdgpu_bo_list_destroy(bo_list);
> +	if (!user_queue) {
> +		amdgpu_bo_list_destroy(bo_list);
> +	}
> +
>  	amdgpu_bo_unmap_and_free(bo_src, va_src, mc_address_src, bo_dst_size);
>  	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_dst_size);
>  	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
>  	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
>  				 bo_shader_size);
>  
> -	if(context_handle_free)
> +	if (user_queue) {
> +		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
> +		free(ring_context);
> +	} else if (context_handle_free) {
>  		amdgpu_cs_ctx_free(context_handle_free);
> +	}
>  
> -
> +	free_cmd_base(base_cmd);
>  	return r;
>  }
>  
>  static void
>  amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  				      uint32_t ip_type, uint32_t priority,
> -				      int version, uint32_t gpu_reset_status_equel)
> +				      int version, uint32_t gpu_reset_status_equel,
> +				      bool user_queue)
>  {
>  	amdgpu_context_handle context_handle;
>  	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
> @@ -392,21 +468,40 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  	struct amdgpu_cs_fence fence_status = {0};
>  
>  	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
> +	struct amdgpu_ring_context *ring_context = NULL;
> +	const struct amdgpu_ip_block_version *ip_block = NULL;
> +	uint64_t seq_no;
>  
>  	r = amdgpu_query_gpu_info(device_handle, &gpu_info);
>  	igt_assert_eq(r, 0);
>  
> -	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
> -		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
> -	else
> -		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +	if (user_queue) {
> +		ring_context = calloc(1, sizeof(*ring_context));
> +		igt_assert(ring_context);
>  
> -	igt_assert_eq(r, 0);
> +		ip_block = get_ip_block(device_handle, ip_type);
> +		ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
> +	} else {
> +		if (priority == AMDGPU_CTX_PRIORITY_HIGH)
> +			r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
> +		else
> +			r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +		igt_assert_eq(r, 0);
> +	}
>  
> -	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
> -				    AMDGPU_GEM_DOMAIN_GTT, 0,
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_cmd_size, 4096,
> +				    AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
>  				    &bo_cmd, (void **)&ptr_cmd,
> -				    &mc_address_cmd, &va_cmd);
> +				    &mc_address_cmd, &va_cmd,
> +				    user_queue ? ring_context->timeline_syncobj_handle : 0,
> +				    user_queue ? ++ring_context->point : 0,
> +				    user_queue);
> +	if (user_queue) {
> +		r = amdgpu_timeline_syncobj_wait(device_handle,
> +					       ring_context->timeline_syncobj_handle,
> +					       ring_context->point);
> +		igt_assert_eq(r, 0);
> +	}
>  	igt_assert_eq(r, 0);
>  	memset(ptr_cmd, 0, bo_cmd_size);
>  	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
> @@ -495,8 +590,10 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  	resources[1] = bo_src;
>  	resources[2] = bo_dst;
>  	resources[3] = bo_cmd;
> -	r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
> -	igt_assert_eq(r, 0);
> +	if (!user_queue) {
> +		r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
> +		igt_assert_eq(r, 0);
> +	}
>  
>  	ib_info.ib_mc_address = mc_address_cmd;
>  	ib_info.size = base_cmd->cdw;
> @@ -506,50 +603,64 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  	ibs_request.number_of_ibs = 1;
>  	ibs_request.ibs = &ib_info;
>  	ibs_request.fence_info.handle = NULL;
> -	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
> -	igt_assert_eq(r, 0);
> +	if (user_queue) {
> +		ring_context->pm4_dw = ib_info.size;
> +		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
> +					      mc_address_cmd);
> +		seq_no = ring_context->point;
> +	} else {
> +		r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
> +		igt_assert_eq(r, 0);
> +		seq_no = ibs_request.seq_no;
> +	}
>  
> -	fence_status.ip_type = ip_type;
> -	fence_status.ip_instance = 0;
> -	fence_status.ring = 0;
> -	fence_status.context = context_handle;
> -	fence_status.fence = ibs_request.seq_no;
> +	if (!user_queue) {
> +		fence_status.ip_type = ip_type;
> +		fence_status.ip_instance = 0;
> +		fence_status.ring = 0;
> +		fence_status.context = context_handle;
> +		fence_status.fence = seq_no;
>  
> -	/* wait for IB accomplished */
> -	r = amdgpu_cs_query_fence_status(&fence_status,
> -					 AMDGPU_TIMEOUT_INFINITE,
> -					 0, &expired);
> +		/* wait for IB accomplished */
> +		r = amdgpu_cs_query_fence_status(&fence_status,
> +						 AMDGPU_TIMEOUT_INFINITE,
> +						 0, &expired);
>  
> -	r = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
> -	igt_assert_eq(r, 0);
> -	r2 = amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
> -	igt_assert_eq(r2, 0);
> +		r = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
> +		igt_assert_eq(r, 0);
> +		r2 = amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
> +		igt_assert_eq(r2, 0);
>  
> -	if (!(reset_flags == 0 ||
> -		  reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
> +		if (!(reset_flags == 0 ||
> +			  reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
> +			/* If we're in reset and reset hasn't occurred, then check
> +			 * that the hang state is equal to the GPU reset status and
> +			 * assert otherwise.
> +			 */
> +			igt_assert_eq(hang_state, gpu_reset_status_equel);
> +		}
>  
> -		/* If we're in reset and reset hasn't occurred, then check
> -		 * that the hang state is equal to the GPU reset status and
> -		 * assert otherwise.
> -		 */
> -		igt_assert_eq(hang_state, gpu_reset_status_equel);
> +		r = amdgpu_bo_list_destroy(bo_list);
> +		igt_assert_eq(r, 0);
>  	}
>  
> -	r = amdgpu_bo_list_destroy(bo_list);
> -	igt_assert_eq(r, 0);
> -
>  	amdgpu_bo_unmap_and_free(bo_src, va_src, mc_address_src, bo_dst_size);
>  	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_dst_size);
>  	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
>  	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
>  				 bo_shader_size);
> -	amdgpu_cs_ctx_free(context_handle);
> +	if (user_queue) {
> +		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
> +		free(ring_context);
> +	} else {
> +		amdgpu_cs_ctx_free(context_handle);
> +	}
>  	free_cmd_base(base_cmd);
>  }
>  
>  void
>  amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
> -				 uint32_t ip_type, const struct pci_addr *pci)
> +				 uint32_t ip_type, const struct pci_addr *pci, bool userq)
>  {
>  	int r;
>  	FILE *fp;
> @@ -628,12 +739,12 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>  
>  		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type,
>  					    ring_id, prio, version,
> -						BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
> +						BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
>  		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
> -						      prio, version, AMDGPU_CTX_UNKNOWN_RESET);
> +						      prio, version, AMDGPU_CTX_UNKNOWN_RESET, userq);
>  
>  		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
> -					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
> +					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
>  	}
>  
>  	/* recover the sched mask */
> @@ -645,7 +756,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>  }
>  
>  void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type,
> -		enum cmd_error_type hang, const struct pci_addr *pci)
> +		enum cmd_error_type hang, const struct pci_addr *pci,  bool userq)
>  {
>  	int r;
>  	FILE *fp;
> @@ -724,9 +835,9 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
>  			igt_assert_eq(r, 0);
>  		}
>  		amdgpu_memset_dispatch_test(device_handle, ip_type, prio,
> -					    version);
> +					    version, userq);
>  		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
> -					    version, hang, NULL);
> +					    version, hang, NULL, userq);
>  	}
>  
>  	/* recover the sched mask */
> diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
> index 166c6d7a8..45858ba4b 100644
> --- a/lib/amdgpu/amd_dispatch.h
> +++ b/lib/amdgpu/amd_dispatch.h
> @@ -29,7 +29,7 @@
>  
>  void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
>  			      uint32_t ip_type, enum cmd_error_type hang,
> -				  const struct pci_addr *pci);
> +				  const struct pci_addr *pci, bool userq);
>  
>  int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  					amdgpu_context_handle context_handle,
> @@ -38,10 +38,11 @@ int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  					uint32_t priority,
>  					uint32_t version,
>  					enum cmd_error_type hang,
> -					struct amdgpu_cs_err_codes *err_codes);
> +					struct amdgpu_cs_err_codes *err_codes,
> +					bool userq);
>  
>  void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
> -				      uint32_t ip_type, const struct pci_addr *pci);
> +				      uint32_t ip_type, const struct pci_addr *pci, bool userq);
>  
>  
>  #endif
> diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
> index ceedbccd9..06bfebd14 100644
> --- a/tests/amdgpu/amd_dispatch.c
> +++ b/tests/amdgpu/amd_dispatch.c
> @@ -15,30 +15,30 @@
>  
>  static void
>  amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle,
> -		const struct pci_addr *pci)
> +		const struct pci_addr *pci, bool userq)
>  {
> -	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_GFX, pci);
> +	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_GFX, pci, userq);
>  }
>  
>  static void
>  amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle,
> -		const struct pci_addr *pci)
> +		const struct pci_addr *pci, bool userq)
>  {
> -	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE, pci);
> +	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE, pci, userq);
>  }
>  
>  static void
>  amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle,
> -		enum cmd_error_type error, const struct pci_addr *pci)
> +		enum cmd_error_type error, const struct pci_addr *pci, bool userq)
>  {
> -	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, error, pci);
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, error, pci, userq);
>  }
>  
>  static void
>  amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle,
> -		enum cmd_error_type error, const struct pci_addr *pci)
> +		enum cmd_error_type error, const struct pci_addr *pci, bool userq)
>  {
> -	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error, pci);
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error, pci, userq);
>  }
>  
>  static void
> @@ -72,8 +72,8 @@ amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu,
>  	r = amdgpu_cs_ctx_free(context_handle);
>  	igt_assert_eq(r, 0);
>  
> -	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0, pci);
> -	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0, pci);
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0, pci, false);
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0, pci, false);
>  }
>  
>  igt_main
> @@ -84,6 +84,13 @@ igt_main
>  	int r;
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	struct pci_addr pci;
> +	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +	bool enable_test = false;
> +#ifdef AMDGPU_USERQ_ENABLED
> +	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
> +
> +	enable_test = env && atoi(env);
> +#endif
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -104,13 +111,14 @@ igt_main
>  		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
>  		igt_assert_eq(r, 0);
>  		asic_rings_readness(device, 1, arr_cap);
> +		asic_userq_readiness(device, userq_arr_cap);
>  
>  	}
>  	igt_describe("Test GPU reset using a binary shader to slow hang the job on compute ring");
>  	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
>  		if (arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("amdgpu-dispatch-test-compute")
> -			amdgpu_dispatch_hang_slow_compute(device, &pci);
> +			amdgpu_dispatch_hang_slow_compute(device, &pci, false);
>  		}
>  	}
>  
> @@ -118,7 +126,7 @@ igt_main
>  	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("amdgpu-dispatch-test-gfx")
> -			 amdgpu_dispatch_hang_slow_gfx(device, &pci);
> +			 amdgpu_dispatch_hang_slow_gfx(device, &pci, false);
>  		}
>  	}
>  
> @@ -127,7 +135,7 @@ igt_main
>  		if (arr_cap[AMD_IP_GFX] &&
>  			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
>  			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
> -			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci);
> +			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci, false);
>  		}
>  	}
>  
> @@ -136,7 +144,7 @@ igt_main
>  		if (arr_cap[AMD_IP_COMPUTE] &&
>  			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
>  			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
> -			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci);
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci, false);
>  		}
>  	}
>  
> @@ -145,7 +153,7 @@ igt_main
>  		if (arr_cap[AMD_IP_COMPUTE] &&
>  			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
>  			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute")
> -			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, &pci);
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, &pci, false);
>  		}
>  	}
>  
> @@ -154,7 +162,7 @@ igt_main
>  		if (arr_cap[AMD_IP_COMPUTE] &&
>  			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
>  			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute")
> -			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, &pci);
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, &pci, false);
>  		}
>  	}
>  
> @@ -163,7 +171,7 @@ igt_main
>  		if (arr_cap[AMD_IP_COMPUTE] &&
>  			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
>  			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute")
> -			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA, &pci);
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA, &pci, false);
>  		}
>  	}
>  
> @@ -175,6 +183,38 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Test GPU reset using a binary shader to hang the job on compute ring");
> +	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE-UQM") {
> +		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-dispatch-hang-test-compute-umq")
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci, true);
> +		}
> +	}
> +
> +	igt_describe("Test GPU reset using a invalid shader program address to hang the job on compute ring");
> +	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test-compute-with-IP-COMPUTE-UQM") {
> +		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute-uqm")
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, &pci, true);
> +		}
> +	}
> +
> +	igt_describe("Test GPU reset using a invalid shader program setting to hang the job on compute ring");
> +	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-compute-with-IP-COMPUTE-UQM") {
> +		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute-uqm")
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, &pci, true);
> +		}
> +	}
> +
> +	igt_describe("Test GPU reset using a invalid shader user data to hang the job on compute ring");
> +	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-compute-with-IP-COMPUTE-UQM") {
> +		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute-uqm")
> +			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA, &pci, true);
> +		}
> +	}
> +
>  	igt_fixture {
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index 83dabf775..0e33e44a2 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -722,7 +722,7 @@ run_test_child(amdgpu_device_handle device, struct shmbuf *sh_mem,
>  
>  		if (is_dispatch) {
>  			ret = amdgpu_memcpy_dispatch_test(device, local_context, job.ip, job.ring_id, 0,version,
> -					job.error, &err_codes);
> +					job.error, &err_codes, false);
>  		} else {
>  			ret = amdgpu_write_linear(device, local_context,
>  					ip_block_test, &job, &err_codes);
