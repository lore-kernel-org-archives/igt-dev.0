Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A627C61DB4
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 10:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AF210E18D;
	Tue, 25 Aug 2026 10:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RH+xnFTx";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB8510E18D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 10:18:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0AwUcqK1AFqVzhVG5byxCSJAm8ebvjSh/P+IYp0X2h9pXFM4HI6ehgNSqKuRebQxOlhqqWcpyuE9zHoA7U+B/F02GFXnx1DIFBzINXsOUmOh3X5e2HKW50c5k05hK6qGvaCguEN564+tGqms0vr0a3M3vuUSUFWsZF7XJ3o4bZuVmhBCL2R1d8H2Jx1dKKS8JS2/v7iCRv4Fqf22fkNLsnKVYoWpOF2JtnS5hm9cTt/Z7nsoXkVEUULEEpqcjx5HxoTEsteT0f8nLHG9xaLNlmMAuUcRRE5t1YzwaJaZ+imLHdPhVc55rekY2xzGkcDUNBvtPzvG2BTlrQfC+9KWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqLOnNBRpEKtcYXEwz56NSGaQcDzWtf8/Gb4bjrhoXQ=;
 b=KPomzsSGrjoi7TeBLEjBC9MbgohgAEWo9rRcG/4Od3QhCE8UNyJ0EUsMioon0yMfTb0HwRF1o7JIlN7COGWdfT0qoYjv3+CQgEO1PG5pXLNiVCnVHhBZSDAcmkNZYSRLSuhKV6h9sShL1YQhnEbS3fCQF+GL0r25cIPElKPuGeGam+pNqubrgNdeqbhZKRlf7VPBmWq64o4q5rTZw3S39FDFcp+8uucd6ZlH2NpTtYvwcI/tRYTyuyFtnEJW/m5sGdYMXSt8/O+EL/x1297x9GE5eAZ8ZxF4q0NGUPnYMVZtP/Z6kDrzdgXtOiUO77vY9s0vxwnqZHPIlpk705NpTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqLOnNBRpEKtcYXEwz56NSGaQcDzWtf8/Gb4bjrhoXQ=;
 b=RH+xnFTxPPSV658CjtU3S2bg7tLvKIYrjyOeP2T242QXwNKNSLBk6oKVXaOK63VlGsf2RmPf9uIsHGVWFhO24ftzKjjXrvoClSUmA0wh7KFRudXPp2BZuV8qmi0dv8Fm/fPSRb1yZMVtzMMBdP8iYxeEdvJOA9JIhecRLiOHfus=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 10:18:33 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 10:18:33 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Shen, Junhua" <Junhua.Shen@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Khatri, Sunil"
 <Sunil.Khatri@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Ma, Yiru" <Yiru.Ma@amd.com>, "Shen, Junhua"
 <Junhua.Shen@amd.com>
Subject: RE: [PATCH i-g-t v1 2/4] lib/amdgpu: drop external BO from cmd_context
Thread-Topic: [PATCH i-g-t v1 2/4] lib/amdgpu: drop external BO from
 cmd_context
Thread-Index: AQHdMWp8alS/k8ROm02Xi/6Qr3Dksraug/1w
Date: Tue, 25 Aug 2026 10:18:32 +0000
Message-ID: <DM4PR12MB51529B1E321951DE0E622461E3AF2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260821124152.19670-1-Junhua.Shen@amd.com>
 <20260821124152.19670-3-Junhua.Shen@amd.com>
In-Reply-To: <20260821124152.19670-3-Junhua.Shen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-25T09:23:37.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|CH8PR12MB9815:EE_
x-ms-office365-filtering-correlation-id: ffea628f-65c1-4acf-d84e-08df0292377b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|6133799003|3023799007|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: VoDkEe3eL4P4ST+kMkLO+RUIhgI4Vb/T9hX5qFGVA+6IVBi5XeC4r2AGzCnRjJSNGXAjCq8mlanPEc4iGF6FFnWFWp/I6WEFzhKrcXnIsrbagiMNJeC9YMMx3jxQlUQEBE/GMJ+l/fWpGNRj+EOBB4XWbeepHhtd9AMGNTz1MtGKhwd0kgU9s2l+z2F5Q5NSOskt/7lR6ass46EEoNc5pvOMh58hTDCv42wg+MFAP+yv9vEpgdtevAg25t2kyQ4GVZLPXpSW4d3Wn2hdVKWzjjHyStrXgZSti32U0nXrRowerSjyFPoCRwdP0esfFcLuoh6qL7bQegVqos8nF3x2dBfi2dCujl/Uqa98lCa1cGzyuedIMa2SEDOXmVHyBsCsNjb6xz95e8rlXsfOIiEGJBHHRgFmN/d4P8JE+JTJfV8UBJc9XvHp1a7VRXev1Q1rygIgQ/6aQzI39e4SSfWsmHBTTwUvxtSjnOq5vi6dbl+euSNOwPlI54aVpFxf2QZL+Ql1wlRPaA+rDjVgxuvQ7vDshxgxWGM66+/A+Vd34MitlDrww+C3N11C54Pu0Tyiq/Po/6qhTXF/UIym7qKR3t9I5r8NO44UBza6Hd11bV5CEVUB9bSiqGSpy1CtKYWoIJagvBcAWP7EKVSVwvzch0dY6ZcNQVvkrLKUCJWP5TzhKU1qLh/mid+MjbXPrGoCAtU8PLovBCEQa5nq8RJucbS209FFiuRtS9P8HCyU8NI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:ja; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?OXNieCtQMUtRS0VES0J0VnpvdFdBaFdTWDYrWGw2VEJ1ZVhmTWEzZ0Vn?=
 =?iso-2022-jp?B?bS9vSExBR1VmQ0Zva2JuTXR2d21QUVBVUmFtRVNrVksxSnU3a3Rpc3Fw?=
 =?iso-2022-jp?B?b3N3TVNCS01FdWNhdThEcExBWnAxYUQxTDQ0dDJuR3RBUU9DR01lbDk1?=
 =?iso-2022-jp?B?ZytMVW51WVNBOExiZmFKa29ZUVJXVXdrU3JReGZZL1cxSWJ4TjhRdUYr?=
 =?iso-2022-jp?B?Qjk1NGs5R1pzM0duaStFclNMWDlLZ2lGdXN0Tkx3Sm1aQnk1QjhCZjZ5?=
 =?iso-2022-jp?B?eVE1c0JIZnJIVHdiY1ZJaUg0VzMwU1dIcDF5RjZrMWE2V2wvYXJXbitn?=
 =?iso-2022-jp?B?K1hwbkJ2MEFSS1dMZGdtN0cxY2NvblpuTDF2aUdLUGREVDZlOWNBYnEv?=
 =?iso-2022-jp?B?SjlCVXJhZ2JwcWtwOVdabnlmeTdrWDlCdEVhZ0pEdjI2MTBad2pyajlZ?=
 =?iso-2022-jp?B?bEVJdmJWRzZESlh2V0ozN1NsVzkxK09kWnM0RXZWRjNuNSsyWk16TEpm?=
 =?iso-2022-jp?B?Tnh2NFpQNG42Y2RJc2ZyeDF4YkRXdThSbmoya1cvM2w2VU5UVGFMWnNn?=
 =?iso-2022-jp?B?djF4VFJjYURrWnJIaW1HZXlaMnFMUXlabitvMlI4alFwclIwYWRxTytO?=
 =?iso-2022-jp?B?bXorK2x3d25ad0lEQy8yd3J0RkFvQkNlUHFxZnZjYmVqUzF0NjcwaFp4?=
 =?iso-2022-jp?B?U3d6d0JQbDV5a2oyMVJla2pFYlNDV3ROS0h5dXA5Y2JQaFJIZWg1MlpC?=
 =?iso-2022-jp?B?cmNRWVdvV3duRUVwSWhLQXRNMWxnU2MvNDV1UkNJWW9mNG10WDVDbGhO?=
 =?iso-2022-jp?B?eVlNcExiVFI1RU5DNkpOMUJKbnZodmFNb0habmIyUzVlajFDZmVxZDNl?=
 =?iso-2022-jp?B?TkVGWVhDTzJNYVBaZnByZ0pQeUR4SSs0Z2k5VmJtUUJIalpteVpLTDJE?=
 =?iso-2022-jp?B?ZWp0amxIek0ybTZJYkpESSthMU1rY255ZHJMcEszM1BwRHVBVGFtcm5B?=
 =?iso-2022-jp?B?WGx2Y2RWbGJjc1U0YkpQU0FqdUpLSlFPY05yUTJBQVp0L0JCdWhuWjQ1?=
 =?iso-2022-jp?B?bVNraUhoelNldVVzOElUSkw1MzBRaXNveFovZzJodHI4WnVoWHNxNk9J?=
 =?iso-2022-jp?B?VTBJNlprWXFNQ2J0ZHh3TlNkK0U5WjZybnEvcElvREdKakhiYnpkWG9z?=
 =?iso-2022-jp?B?TUFJMmhwaFRmK2RqRlRmb29UT0QwZm5KeTNGTkQxaitXaHExU3ZpQWJn?=
 =?iso-2022-jp?B?QmNOejRvQ3NmWk1XUlpYMFFTRGlkV0p3ZGs1cWkzbmd3dFMvaVh6a3Rk?=
 =?iso-2022-jp?B?RURNa05na3ozYXNEbkxncmk0VWR4TDlhc1Y3eVBUUlZlWnN1YnNsQXhH?=
 =?iso-2022-jp?B?OWZ5Qm1OU1NIOFM0WEJtQzF2bThiTVJGMTc0eFk4OWhGTDI0SDNVSDV5?=
 =?iso-2022-jp?B?eW9OZGNnbGRwakN5TWpPbUFETEhhRUp4K2Fkd044RU1ydzlMd1V1ZzA1?=
 =?iso-2022-jp?B?Z1BkUkRxdWNFSms0c0txckNYYmdyaXZkZTBtOUN5Y3RIQW55bUZ5R0Fm?=
 =?iso-2022-jp?B?cmp3Nk5KYmF6R25WQnhNbWoybXFwdHhlL1diU2g3SDhOUFptWW4wTzhR?=
 =?iso-2022-jp?B?NEhacjkvQnVaKzNFR1N3NndFaXl2cERuVndhRGw5UmZVemY5WStaVUs2?=
 =?iso-2022-jp?B?dUhrQjlmek9RL2JhMUMrZlp0MGRNVzNTaEpDbG9CUWY4eVUrVy9FN0xr?=
 =?iso-2022-jp?B?cTFsbDhNZVBmSDh0QThYRG83eUJQM0xxVFo4cUJjYVVXSG9mZGg5bXg1?=
 =?iso-2022-jp?B?Zmd4RmI4UU8xSFlhbDZ0NTJnN2ZqWUlVMFNXa0pZM2NVQVNZbFpES0tt?=
 =?iso-2022-jp?B?VVdPd2tPVFZ1M0Z1VGJnNW5oSDVlbHBhOERna2JPV3pjSzZ2OGVZMlVG?=
 =?iso-2022-jp?B?RnBtYmVaRThudWJnNk9Sa2UrTUtkL3NTb1lOdkNnZ0tHcGltL2tXYURa?=
 =?iso-2022-jp?B?ZkNjZXZ2QjlJMlVPa1ROcTlrOVRjM1pxYzBpNUs5TjJ1Q1ZYQVdlLzRm?=
 =?iso-2022-jp?B?aVJjMHlZQzFTMHhDTjl0R3hhYnplSjNzemhqbkxzZHpBVWcvV2ZvamU3?=
 =?iso-2022-jp?B?Ty9QZG4zK0pUWmdMYkV5d3V2b3lNaFY1djNYY0trRmNFclBiam9ZdmxP?=
 =?iso-2022-jp?B?ZlNpRjBheGdrc2xnVGhOOEN5dG1oREJSYkNlb3k0d0JXeDU3Q1NnMmQ5?=
 =?iso-2022-jp?B?K1NEUUU4N1crT01icGN4aGlJVVVXMU1xdWY0Wm1tTXYvWnE3enhMMVBj?=
 =?iso-2022-jp?B?RnJCM09RYncyUk96REQxWU40S2VuTVVXSkxxekFzSk5KelJlR2xzbUxV?=
 =?iso-2022-jp?B?cjJ6cDl1YVNrSCs1S3ViVkUyWnZpb21WNGQxeUFWQ2Q1QS9hN3VPaVdi?=
 =?iso-2022-jp?B?OVVVSFBIcVE2ZkpvT0o2czJDSjFTMXMrQm4zSkcrWDJWOTd2czBKK3N3?=
 =?iso-2022-jp?B?VG10RGg4?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffea628f-65c1-4acf-d84e-08df0292377b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 10:18:32.8507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTGldyhL91HSCMxfG8c0tzPPeCH93gkLc9fBE20sFIE/McsN85iaDW9X3O8OkYpbZHll+1JlsaNEEGEIm88c4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9815
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

AMD General

> -----Original Message-----
> From: Junhua Shen <Junhua.Shen@amd.com>
> Sent: Friday, August 21, 2026 8:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie)
> <Jesse.Zhang@amd.com>; Khatri, Sunil <Sunil.Khatri@amd.com>; Huang,
> Honglei1 <Honglei1.Huang@amd.com>; Huang, Ray <Ray.Huang@amd.com>;
> Ma, Yiru <Yiru.Ma@amd.com>; Shen, Junhua <Junhua.Shen@amd.com>
> Subject: [PATCH i-g-t v1 2/4] lib/amdgpu: drop external BO from cmd_conte=
xt
>
> Rework cmd_context so it no longer owns or clears a caller-visible data b=
uffer.
> Operand residency is registered explicitly, and the leftover internal-BO =
plumbing is
> removed.
>
> - cmd_context_create()/destroy(): remove the external-BO plumbing; the
>   context no longer allocates or tracks a data BO.
> - Add cmd_context_add_resource(): so callers register BO-backed operand
>   addresses in the per-submit bo_list residency set explicitly.
> - Drop the write_length parameter from cmd_context_create(): the IB/PM4
>   buffer is sized solely from pm4_size.
> - Update all cmd_context_create() call sites to the new signature:
>   tests/amdgpu/amd_dmabuf_unload.c, amd_kfd_dmabuf_unload.c, and
>   amd_mem.c (three sites).
>
> Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c  | 283 ++++++++++-----------------
> lib/amdgpu/amd_command_submission.h  |  99 +++++++++-
>  tests/amdgpu/amd_dmabuf_unload.c     |  15 +-
>  tests/amdgpu/amd_kfd_dmabuf_unload.c |  15 +-
>  tests/amdgpu/amd_mem.c               |  22 ++-
>  5 files changed, 220 insertions(+), 214 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c
> b/lib/amdgpu/amd_command_submission.c
> index 0334c2ded..26f36256a 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -906,31 +906,22 @@
> amdgpu_command_ce_write_fence(amdgpu_device_handle dev,  }
>
>  /**
> - * command context creation with optional external BO
> + * command context creation
>   *
>   * @param device AMDGPU device handle
>   * @param ip_type IP block type (GFX, DMA, etc.)
>   * @param ring_id Ring index to use
>   * @param user_queue Whether to use user queue mode
> - * @param write_length Size of write operations in DWORDs
> - * @param external_bo Optional external buffer object (NULL for internal=
 allocation)
> - * @param external_bo_mc GPU MC address of external BO (required if
> external_bo provided)
> - * @param external_bo_cpu CPU mapping of external BO (required if extern=
al_bo
> provided)
> + * @param write_length Default per-packet transfer size in bytes (overri=
dden per
> + *                     packet by cmd_packet_params_t::size)
>   * @return New command context, or NULL on failure
>   */
>  cmd_context_t* cmd_context_create(amdgpu_device_handle device,
>                                      enum amd_ip_block_type ip_type,
>                                      uint32_t ring_id,
> -                                    bool user_queue,
> -                                    uint32_t write_length,
> -                                    amdgpu_bo_handle external_bo,
> -                                    uint64_t external_bo_mc,
> -                                    volatile uint32_t *external_bo_cpu)
> +                                    bool user_queue)
>  {
>       cmd_context_t *ctx;
> -     void *cpu_ptr =3D NULL;
> -     uint64_t bo_mc =3D 0;
> -     amdgpu_va_handle va_handle =3D NULL;
>       int r;
>
>       if (!device)
> @@ -949,7 +940,6 @@ cmd_context_t*
> cmd_context_create(amdgpu_device_handle device,
>       ctx->ip_type =3D ip_type;
>       ctx->user_queue =3D user_queue;
>       ctx->last_submit_seq =3D 0;
> -     ctx->uses_external_bo =3D (external_bo !=3D NULL);  // Now this mem=
ber exists
>       ctx->initialized =3D false;
>
>       /* Get IP block for the specified IP type */ @@ -967,7 +957,6 @@
> cmd_context_t* cmd_context_create(amdgpu_device_handle device,
>       }
>
>       /* Setup ring context parameters */
> -     ctx->ring_ctx->write_length =3D write_length ? write_length : 128;
>       ctx->ring_ctx->pm4_size =3D 256;
>       ctx->ring_ctx->pm4 =3D calloc(ctx->ring_ctx->pm4_size, sizeof(uint3=
2_t));
>       if (!ctx->ring_ctx->pm4) {
> @@ -976,7 +965,7 @@ cmd_context_t*
> cmd_context_create(amdgpu_device_handle device,
>               return NULL;
>       }
>
> -     ctx->ring_ctx->res_cnt =3D 1;
> +     ctx->ring_ctx->res_cnt =3D 0;
>       ctx->ring_ctx->ring_id =3D ring_id;
>       ctx->ring_ctx->secure =3D false;
>       ctx->ring_ctx->user_queue =3D user_queue; @@ -990,7 +979,7 @@
> cmd_context_t* cmd_context_create(amdgpu_device_handle device,
>                       return NULL;
>               }
>               ctx->ip_block->funcs->userq_create(device, ctx->ring_ctx,
> (unsigned int)ip_type);
> -     }else {
> +     } else {
>               /* Create regular command submission context */
>               r =3D amdgpu_cs_ctx_create(device, &ctx->ring_ctx-
> >context_handle);
>               if (r) {
> @@ -1001,115 +990,60 @@ cmd_context_t*
> cmd_context_create(amdgpu_device_handle device,
>               }
>       }
>
> -     /* BO allocation strategy: use external BO if provided, otherwise a=
llocate
> internally */
> -     if (external_bo) {
> -             /* Validate external BO arguments */
> -             if (!external_bo_cpu || !external_bo_mc) {
> -                     igt_debug("Invalid external BO arguments (mc=3D0x%l=
lx,
> cpu=3D%p)\n",
> -                                       (unsigned long long)external_bo_m=
c,
> external_bo_cpu);
> -                     free(ctx->ring_ctx->pm4);
> -                     free(ctx->ring_ctx);
> -                     free(ctx);
> -                     return NULL;
> -             }
> -
> -             /* Use caller-provided external BO */
> -             ctx->ring_ctx->bo =3D external_bo;
> -             ctx->ring_ctx->bo_mc =3D external_bo_mc;
> -             ctx->ring_ctx->bo_cpu =3D external_bo_cpu;
> -             ctx->ring_ctx->va_handle =3D NULL;  // VA management is cal=
ler's
> responsibility
> -
> -             igt_info("Using external BO: GPU=3D0x%llx, CPU=3D%p\n",
> -                              (unsigned long long)external_bo_mc,
> external_bo_cpu);
> -     } else {
> -             /* Allocate internal BO for command operations */
> -             r =3D amdgpu_bo_alloc_and_map(device,
> -                                ctx->ring_ctx->write_length,
> -                                4096,
> -                                AMDGPU_GEM_DOMAIN_GTT,
> -                                0,
> -                                &ctx->ring_ctx->bo,
> -                                &cpu_ptr,
> -                                &bo_mc,
> -                                &va_handle);
> -             if (r) {
> -                     goto cleanup_error;
> +     /* Allocate a single per-context IB sized to the PM4 buffer capacit=
y. */
> +     r =3D amdgpu_bo_alloc_and_map(device,
> +                                 ctx->ring_ctx->pm4_size * sizeof(uint32=
_t), 4096,
> +                                 AMDGPU_GEM_DOMAIN_GTT, 0,
> +                                 &ctx->ib_bo, &ctx->ib_cpu, &ctx->ib_mc,
> +                                 &ctx->ib_va);
> +     if (r) {
> +             if (user_queue) {
> +                     if (ctx->ip_block->funcs->userq_destroy)
> +                             ctx->ip_block->funcs->userq_destroy(device,=
 ctx-
> >ring_ctx,
> +                                                                 (unsign=
ed
> int)ip_type);
> +             } else {
> +                     amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
>               }
> -
> -             ctx->ring_ctx->bo_mc =3D bo_mc;
> -             ctx->ring_ctx->bo_cpu =3D (volatile uint32_t *)cpu_ptr;
> -             ctx->ring_ctx->va_handle =3D va_handle;
> -
> -             igt_info("Allocated internal BO: GPU=3D0x%llx, CPU=3D%p\n",
> -                      (unsigned long long)bo_mc, cpu_ptr);
> -     }
> -
> -     /* Initialize resources array */
> -     ctx->ring_ctx->resources[0] =3D ctx->ring_ctx->bo;
> -     for (int i =3D 1; i < 4; i++) {
> -             ctx->ring_ctx->resources[i] =3D NULL;
> +             free(ctx->ring_ctx->pm4);
> +             free(ctx->ring_ctx);
> +             free(ctx);
> +             return NULL;
>       }
>
>       ctx->initialized =3D true;
>       return ctx;
> -
> -cleanup_error:
> -     /* Cleanup resources in case of allocation failure */
> -     if (user_queue) {
> -             ctx->ip_block->funcs->userq_destroy(device, ctx->ring_ctx,
> (unsigned int)ip_type);
> -     } else {
> -             if (ctx->ring_ctx->context_handle)
> -                 amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
> -     }
> -
> -     free(ctx->ring_ctx->pm4);
> -     free(ctx->ring_ctx);
> -     free(ctx);
> -     return NULL;
>  }
>
>  /**
> - * context destruction function with external BO control
> + * context destruction function
>   *
>   * @param ctx Command context to destroy
> - * @param destroy_external_bo Whether to destroy external BO (if used)
>   */
> -void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo)
> +void cmd_context_destroy(cmd_context_t *ctx)
>  {
>       if (!ctx || !ctx->initialized)
>               return;
>
> -     if (ctx->ring_ctx) {
> -             /* Handle BO cleanup based on allocation type */
> -             if (ctx->ring_ctx->bo) {
> -                     if (!ctx->uses_external_bo || destroy_external_bo) =
{
> -                             /* Clean up internal BO or external BO if e=
xplicitly
> requested */
> -                             if (ctx->ring_ctx->va_handle) {
> -                                 /* Internal BO with VA handle - full cl=
eanup */
> -                                 amdgpu_bo_unmap_and_free(ctx->ring_ctx-=
>bo,
> ctx->ring_ctx->va_handle,
> -                                                        ctx->ring_ctx->b=
o_mc,
> -                                                        ctx->ring_ctx->w=
rite_length);
> -                             } else if (destroy_external_bo) {
> -                                 /* External BO without VA handle - just=
 free the BO
> */
> -                                 amdgpu_bo_free(ctx->ring_ctx->bo);
> -                             }
> -                     } else {
> -                             /* External BO, preserve it as requested by=
 caller */
> -                             igt_info("Preserving external BO (GPU=3D0x%=
llx)\n",
> -                                              (unsigned long long)ctx->r=
ing_ctx-
> >bo_mc);
> -                     }
> -             }
> +     /* Free the per-context IB. */
> +     if (ctx->ib_bo) {
> +             if (ctx->submit_pending)
> +                     cmd_wait_completion(ctx);
> +             amdgpu_bo_unmap_and_free(ctx->ib_bo, ctx->ib_va, ctx->ib_mc=
,
> +                                      ctx->ring_ctx->pm4_size * sizeof(u=
int32_t));
> +             ctx->ib_bo =3D NULL;
> +     }
>
> +     if (ctx->ring_ctx) {
>               /* Clean up command submission context */
>               if (ctx->user_queue) {
>                       if (ctx->ip_block && ctx->ip_block->funcs->userq_de=
stroy) {
>                               ctx->ip_block->funcs->userq_destroy(ctx->de=
vice,
> ctx->ring_ctx,
>                                                         (unsigned int)ctx=
->ip_type);
> -                 }
> +                     }
>               } else {
>                       if (ctx->ring_ctx->context_handle) {
>                               amdgpu_cs_ctx_free(ctx->ring_ctx->context_h=
andle);
> -                 }
> +                     }
>               }
>
>               /* Free PM4 command buffer */
> @@ -1123,6 +1057,42 @@ void cmd_context_destroy(cmd_context_t *ctx, bool
> destroy_external_bo)
>       free(ctx);
>  }
>
> +int cmd_context_add_resource(cmd_context_t *ctx, amdgpu_bo_handle bo) {
> +     struct amdgpu_ring_context *rc;
> +     int i;
> +
> +     if (!ctx || !ctx->initialized || !ctx->ring_ctx || !bo)
> +             return -EINVAL;
> +
> +     rc =3D ctx->ring_ctx;
> +
> +     /* Deduplicate: an already-registered BO needs no second slot. */
> +     for (i =3D 0; i < rc->res_cnt; i++) {
> +             if (rc->resources[i] =3D=3D bo)
> +                     return 0;
> +     }
> +
> +     if (rc->res_cnt >=3D (int)ARRAY_SIZE(rc->resources))
> +             return -ENOSPC;
> +
> +     rc->resources[rc->res_cnt++] =3D bo;
> +     return 0;
> +}
> +
> +static void cmd_reset_packet_operands(cmd_context_t *ctx) {
> +     struct amdgpu_ring_context *rc =3D ctx->ring_ctx;
> +
> +     rc->bo_mc =3D 0;
> +     rc->bo_mc2 =3D 0;
> +     rc->write_length =3D 0;
> +
> +     /* Drop the per-submit residency set. */
> +     memset(rc->resources, 0, sizeof(rc->resources));
> +     rc->res_cnt =3D 0;
> +}
> +
>  /**
>   * Submit command packet without waiting - Fixed submission logic
>   */
> @@ -1132,10 +1102,6 @@ int cmd_submit_packet(cmd_context_t *ctx)
>       int r;
>       struct amdgpu_cs_request ibs_request;
>       struct amdgpu_cs_ib_info ib_info;
> -     amdgpu_bo_handle ib_bo;
> -     void *ib_cpu;
> -     uint64_t ib_mc_address;
> -     amdgpu_va_handle ib_va_handle;
>       amdgpu_bo_handle all_res[5] =3D {0};
>       uint32_t res_count =3D 0;
>       uint32_t i;
> @@ -1145,12 +1111,27 @@ int cmd_submit_packet(cmd_context_t *ctx)
>               return -EINVAL;
>       }
>
> -     /* Check required parameters */
> -     if (ctx->ring_ctx->pm4_dw =3D=3D 0 || ctx->ring_ctx->pm4_dw > 1024)=
 {
> -             igt_debug("Invalid PM4 size: %u (must be 1-1024)\n", ctx->r=
ing_ctx-
> >pm4_dw);
> +     /* Check required parameters: the PM4 stream must be non-empty and =
fit
> +      * in the per-context IB allocated by cmd_context_create().
> +      */
> +     if (ctx->ring_ctx->pm4_dw =3D=3D 0 || ctx->ring_ctx->pm4_dw > ctx->=
ring_ctx-
> >pm4_size) {
> +             igt_debug("Invalid PM4 size: %u (must be 1-%u)\n",
> +                       ctx->ring_ctx->pm4_dw, ctx->ring_ctx->pm4_size);
>               return -EINVAL;
>       }
>
> +     igt_assert_f(ctx->ib_bo && ctx->ring_ctx->pm4_dw <=3D ctx->ring_ctx=
-
> >pm4_size,
> +                  "PM4 stream (%u dw) exceeds IB capacity (%u dw)\n",
> +                  ctx->ring_ctx->pm4_dw, ctx->ring_ctx->pm4_size);
> +
> +     if (ctx->submit_pending) {
> +             cmd_wait_completion(ctx);
> +             ctx->submit_pending =3D false;
> +     }
cmd_submit_packet() should propagate cmd_wait_completion() errors instead o=
f unconditionally clearing submit_pending and reusing the IB. Also consider=
 clearing submit_pending inside cmd_wait_completion() on success to avoid r=
edundant waits.

> +
> +     memcpy(ctx->ib_cpu, ctx->ring_ctx->pm4,
> +            ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
>       /* For user queues, use userq_submit */
>       if (ctx->user_queue) {
>               if (!ctx->ip_block || !ctx->ip_block->funcs->userq_submit) =
{ @@ -
> 1158,16 +1139,14 @@ int cmd_submit_packet(cmd_context_t *ctx)
>                       return -ENOTSUP;
>               }
>
> -             if (!ctx->ring_ctx->bo_mc) {
> -             igt_debug("Invalid BO MC address for user queue\n");
> -             return -EINVAL;
> -             }
> -
>               ctx->ip_block->funcs->userq_submit(ctx->device, ctx->ring_c=
tx,
>                     (unsigned int)ctx->ip_type,
> -                   ctx->ring_ctx->bo_mc);
> +                   ctx->ib_mc);
>               ctx->last_submit_seq =3D ctx->ring_ctx->point;
> +             ctx->submit_pending =3D true;
>               igt_info("User queue submission successful, point=3D%lu\n",=
 ctx-
> >last_submit_seq);
> +
> +             cmd_reset_packet_operands(ctx);
>               return 0;
>       }
>
> @@ -1175,26 +1154,8 @@ int cmd_submit_packet(cmd_context_t *ctx)
>       memset(&ibs_request, 0, sizeof(ibs_request));
>       memset(&ib_info, 0, sizeof(ib_info));
>
> -     /* Allocate separate IB buffer instead of reusing command buffer */
> -     r =3D amdgpu_bo_alloc_and_map(ctx->device,
> -                            ctx->ring_ctx->pm4_dw * sizeof(uint32_t),
> -                            4096,
> -                            AMDGPU_GEM_DOMAIN_GTT,
> -                            0,
> -                            &ib_bo,
> -                            &ib_cpu,
> -                            &ib_mc_address,
> -                            &ib_va_handle);
> -     if (r) {
> -             igt_debug("Failed to allocate IB: %d\n", r);
> -             return r;
> -     }
> -
> -     /* Copy PM4 commands to IB */
> -     memcpy(ib_cpu, ctx->ring_ctx->pm4, ctx->ring_ctx->pm4_dw *
> sizeof(uint32_t));
> -
> -     /* Setup IB information */
> -     ib_info.ib_mc_address =3D ib_mc_address;
> +     /* Point the IB info at the per-context IB */
> +     ib_info.ib_mc_address =3D ctx->ib_mc;
>       ib_info.size =3D ctx->ring_ctx->pm4_dw;
>       if (ctx->ring_ctx->secure)
>               ib_info.flags |=3D AMDGPU_IB_FLAGS_SECURE; @@ -1215,14
> +1176,12 @@ int cmd_submit_packet(cmd_context_t *ctx)
>       }
>
>       /* Add IB as the last resource */
> -     all_res[res_count++] =3D ib_bo;
> +     all_res[res_count++] =3D ctx->ib_bo;
>
>       /* Create BO list */
>       r =3D amdgpu_bo_list_create(ctx->device, res_count, all_res, NULL, =
&bo_list);
>       if (r) {
>               igt_debug("amdgpu_bo_list_create failed: %d\n", r);
> -             amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address=
,
> -                                    ctx->ring_ctx->pm4_dw * sizeof(uint3=
2_t));
>               return r;
>       }
>
> @@ -1234,8 +1193,6 @@ int cmd_submit_packet(cmd_context_t *ctx)
>       if (r !=3D 0) {
>               igt_debug("amdgpu_cs_submit failed: %d\n", r);
>               amdgpu_bo_list_destroy(bo_list);
> -             amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address=
,
> -                                    ctx->ring_ctx->pm4_dw * sizeof(uint3=
2_t));
>               return r;
>       }
>
> @@ -1243,10 +1200,11 @@ int cmd_submit_packet(cmd_context_t *ctx)
>       ctx->last_submit_seq =3D ibs_request.seq_no;
>       igt_debug("Command submitted successfully, seq_no=3D%lu\n", ctx-
> >last_submit_seq);
>
> -     /* Cleanup resources */
> +     /* The kernel has snapshotted the bo_list; it can be released now. =
*/
>       amdgpu_bo_list_destroy(bo_list);
> -     amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
> -                        ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +     ctx->submit_pending =3D true;
> +     cmd_reset_packet_operands(ctx);
>
>       return 0;
>  }
> @@ -1258,14 +1216,9 @@ int cmd_place_packet(cmd_context_t *ctx, const
> cmd_packet_params_t *params)
>       if (!ctx || !ctx->initialized || !ctx->ip_block || !params)
>               return -EINVAL;
>
> -     if (!ctx->ring_ctx || !ctx->ring_ctx->bo_cpu)
> +     if (!ctx->ring_ctx)
>               return -EINVAL;
>
> -     /* Clear the buffer before operation */
> -     memset((void *)ctx->ring_ctx->bo_cpu, 0,
> -     ctx->ring_ctx->write_length);
> -
> -
>       /* Build the command packet based on type */
>       switch (params->type) {
>       case CMD_PACKET_WRITE_LINEAR:
> @@ -1280,13 +1233,6 @@ int cmd_place_packet(cmd_context_t *ctx, const
> cmd_packet_params_t *params)
>               result =3D ctx->ip_block->funcs->write_linear(ctx->ip_block=
->funcs,
>                                                      ctx->ring_ctx,
>                                                      &ctx->ring_ctx->pm4_=
dw);
> -
> -             /*  Copy PM4 packet to ring buffer */
> -             if (result =3D=3D 0 && ctx->ring_ctx->pm4_dw > 0) {
> -                     memcpy((void *)ctx->ring_ctx->bo_cpu,
> -                            ctx->ring_ctx->pm4,
> -                            ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> -             }
>               return result;
>
>       case CMD_PACKET_WRITE_ATOMIC:
> @@ -1300,13 +1246,6 @@ int cmd_place_packet(cmd_context_t *ctx, const
> cmd_packet_params_t *params)
>               result =3D ctx->ip_block->funcs->write_linear_atomic(ctx->i=
p_block-
> >funcs,
>                                                     ctx->ring_ctx,
>                                                     &ctx->ring_ctx->pm4_d=
w);
> -
> -             /*  Copy PM4 packet to ring buffer */
> -             if (result =3D=3D 0 && ctx->ring_ctx->pm4_dw > 0) {
> -             memcpy((void *)ctx->ring_ctx->bo_cpu,
> -             ctx->ring_ctx->pm4,
> -             ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> -             }
>               return result;
>
>       case CMD_PACKET_COPY_LINEAR:
> @@ -1321,16 +1260,6 @@ int cmd_place_packet(cmd_context_t *ctx, const
> cmd_packet_params_t *params)
>           result =3D ctx->ip_block->funcs->copy_linear(ctx->ip_block->fun=
cs,
>                                                     ctx->ring_ctx,
>                                                     &ctx->ring_ctx->pm4_d=
w);
> -
> -         /* Copy PM4 packet to ring buffer */
> -         if (result =3D=3D 0 && ctx->ring_ctx->pm4_dw > 0) {
> -             memcpy((void *)ctx->ring_ctx->bo_cpu,
> -                    ctx->ring_ctx->pm4,
> -                    ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> -
> -             //igt_info("cmd_place_packet: Copied %u DWORDs to ring buff=
er
> (copy)\n",
> -               //       ctx->ring_ctx->pm4_dw);
> -         }
>           return result;
>
>       case CMD_PACKET_COPY_ATOMIC:
> @@ -1429,8 +1358,8 @@ int cmd_wait_completion(cmd_context_t *ctx)
>                       return -EINVAL;
>
>               return amdgpu_timeline_syncobj_wait(ctx->device,
> -                                                ctx->ring_ctx-
> >timeline_syncobj_handle,
> -                                                ctx->ring_ctx->point);
> +                                                 ctx->ring_ctx-
> >timeline_syncobj_handle,
> +                                                 ctx->ring_ctx->point);
>       }
>
>       /* For regular queues, wait on fence */ @@ -1441,8 +1370,8 @@ int
> cmd_wait_completion(cmd_context_t *ctx)
>       fence_status.fence =3D ctx->last_submit_seq;
>
>       return amdgpu_cs_query_fence_status(&fence_status,
> -                                    AMDGPU_TIMEOUT_INFINITE,
> -                                    0, &expired);
> +                                         AMDGPU_TIMEOUT_INFINITE,
> +                                         0, &expired);
>  }
>
>  /**
> diff --git a/lib/amdgpu/amd_command_submission.h
> b/lib/amdgpu/amd_command_submission.h
> index 331889161..8644f25ed 100644
> --- a/lib/amdgpu/amd_command_submission.h
> +++ b/lib/amdgpu/amd_command_submission.h
> @@ -50,8 +50,16 @@ typedef struct {
>      enum amd_ip_block_type ip_type;
>      bool initialized;
>      bool user_queue;
> -    bool uses_external_bo;
>      uint64_t last_submit_seq; /* Last submission sequence number */
> +
> +    /* IB shared by the user-queue and CS paths; created in cmd_context_=
create,
> +     * freed in cmd_context_destroy, reusable across multiple submits.
> +     */
> +    amdgpu_bo_handle ib_bo;
> +    void *ib_cpu;
> +    uint64_t ib_mc;
> +    amdgpu_va_handle ib_va;
> +    bool submit_pending;   /* a submit is in flight; wait before reuse/f=
ree */
>  } cmd_context_t;
>
>  /**
> @@ -89,15 +97,92 @@ void
> amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle
> device,  void  amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
>                                         amdgpu_context_handle ctx);
>
> +/*
> + * cmd_* command-submission API
> + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> + *
> + * A small wrapper around raw amdgpu command submission that hides the
> + * context / IB / bo_list / fence plumbing and lets a test issue
> +DMA-style
> + * operations (write, copy, const-fill, atomic) on an IP ring (SDMA,
> +GFX or
> + * Compute) by GPU virtual address.
> + *
> + * Lifecycle
> + * ---------
> + *   1. cmd_context_create()  - create a context bound to one IP ring. I=
t
> + *      allocates a reusable IB/PM4 buffer for the emitted packets.
> + *   2. issue one or more operations (see the two API layers below).
> + *   3. cmd_context_destroy()  - waits for any in-flight submission, the=
n frees
> + *      the IB and the context.
> + *
> + * Two API layers
> + * --------------
> + *   High-level convenience helpers build one packet and submit it in a =
single
> + *   call:
> + *       cmd_submit_write_linear(ctx, dst_va, size, data)
> + *       cmd_submit_copy_linear (ctx, src_va, dst_va, size)
> + *       cmd_submit_const_fill  (ctx, dst_va, size, data)
> + *       cmd_submit_atomic      (ctx, dst_va, data)
> + *
> + *   Low-level path, for full control over cmd_packet_params_t (custom_d=
ata,
> + *   fence/timestamp packets, etc.):
> + *       cmd_place_packet(ctx, &params)          - build the PM4 stream
> + *       cmd_submit_packet(ctx)                  - submit it
> + *       cmd_place_and_submit_packet(ctx, &p)    - both of the above
> + *
> + * Semantics
> + * ---------
> + *   - Submission is asynchronous: cmd_submit_* returns after the CS is =
queued.
> + *     The next submit on the same ctx, or cmd_context_destroy(), transp=
arently
> + *     waits for the previous one. Call cmd_wait_completion(ctx) to bloc=
k
> + *     explicitly (e.g. before reading back the destination).
> + *   - Operands are plain GPU virtual addresses, not BOs. For every BO-b=
acked
> + *     address you pass (source, destination, fence/timestamp target, ..=
.) call
> + *     cmd_context_add_resource(ctx, bo) to add the owning BO to the res=
idency
> + *     set. The residency set is per-submit: it is cleared automatically=
 once
> + *     the packet has been captured for submission, so you must (re-)reg=
ister
> + *     every required BO immediately before each submit.
> + *   - One call emits exactly one hardware packet and does NOT chunk. A =
transfer
> + *     larger than the per-packet maximum (see amdgpu_dma_limits_query) =
will be
> + *     rejected; the caller must split it. Return values are 0 on succes=
s or a
> + *     negative errno (e.g. -ENOTSUP if the IP lacks the requested op).
> + *
> + * Example: fill then copy 4 KiB over the SDMA ring
> + * ------------------------------------------------
> + *   cmd_context_t *ctx;
> + *   int r;
> + *
> + *   ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false);
> + *   if (!ctx)
> + *           return -ENODEV;
> + *
> + *   // Residency is per-submit, so register before every submit.
> + *   cmd_context_add_resource(ctx, dst_bo);  // owns dst_va
> + *   r =3D cmd_submit_const_fill(ctx, dst_va, 4096, 0xdeadbeef);
> + *   if (!r) {
> + *           cmd_context_add_resource(ctx, dst_bo);    // owns dst_va
> + *           cmd_context_add_resource(ctx, dst2_bo);   // owns dst2_va
> + *           r =3D cmd_submit_copy_linear(ctx, dst_va, dst2_va, 4096);
> + *   }
> + *
> + *   cmd_wait_completion(ctx);   // ensure the copy has landed
> + *   cmd_context_destroy(ctx);   // (would also wait) release resources
> + *   return r;
> + */
>  cmd_context_t* cmd_context_create(amdgpu_device_handle device,
>                                      enum amd_ip_block_type ip_type,
>                                      uint32_t ring_id,
> -                                    bool user_queue,
> -                                    uint32_t write_length,
> -                                    amdgpu_bo_handle external_bo,
> -                                    uint64_t external_bo_mc,
> -                                    volatile uint32_t *external_bo_cpu);
> -void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo);
> +                                    bool user_queue); void
> +cmd_context_destroy(cmd_context_t *ctx);
> +
> +/*
> + * Register a buffer object in the context's bo_list residency set so
> +it is
> + * resident when the next submission executes. See the cmd_* API
> +overview above
> + * cmd_context_create() for how this fits into the submission flow.
> + *
> + * Returns 0 on success, -EINVAL on bad arguments,
> + * or -ENOSPC when the residency set (resources[]) is full.
> + */
> +int cmd_context_add_resource(cmd_context_t *ctx, amdgpu_bo_handle bo);
>
>  int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *para=
ms);
>
> diff --git a/tests/amdgpu/amd_dmabuf_unload.c
> b/tests/amdgpu/amd_dmabuf_unload.c
> index 05ca3cf2c..0e43de0e6 100644
> --- a/tests/amdgpu/amd_dmabuf_unload.c
> +++ b/tests/amdgpu/amd_dmabuf_unload.c
> @@ -121,9 +121,7 @@ static void test_fence_outlives_module(int vgem, int
> amd_fd,
>       igt_assert_eq(r, 0);
>
>       /* Create SDMA command context */
> -     cmd_ctx =3D cmd_context_create(dev, AMD_IP_DMA, 0, false,
> -                                  copy_size, src_bo, src_mc,
> -                                  (volatile uint32_t *)src_cpu);
> +     cmd_ctx =3D cmd_context_create(dev, AMD_IP_DMA, 0, false);
>       igt_assert(cmd_ctx !=3D NULL);
>
>       /*
> @@ -138,17 +136,14 @@ static void test_fence_outlives_module(int vgem, in=
t
> amd_fd,
>                            AMDGPU_VA_OP_MAP);
>       igt_assert_eq(r, 0);
>
> -     /* Set up bo_list: IB (src), dst, imported VGEM BO */
> -     cmd_ctx->ring_ctx->bo2 =3D dst_bo;
> -     cmd_ctx->ring_ctx->bo_mc2 =3D dst_mc;
> -     cmd_ctx->ring_ctx->resources[1] =3D dst_bo;
> -     cmd_ctx->ring_ctx->resources[2] =3D import.buf_handle;
> -     cmd_ctx->ring_ctx->res_cnt =3D 3;
> -
>       igt_info("Submitting %d x %llu-byte SDMA copies (no wait)...\n",
>                NUM_SDMA_COPIES, (unsigned long long)copy_size);
>
>       for (i =3D 0; i < NUM_SDMA_COPIES; i++) {
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, src_bo), 0)=
;
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, dst_bo), 0)=
;
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx,
> import.buf_handle),
> +0);
> +
>               r =3D cmd_submit_copy_linear(cmd_ctx,
>                                          src_mc, dst_mc,
>                                          (uint32_t)copy_size);
> diff --git a/tests/amdgpu/amd_kfd_dmabuf_unload.c
> b/tests/amdgpu/amd_kfd_dmabuf_unload.c
> index 24260b560..28caf8982 100644
> --- a/tests/amdgpu/amd_kfd_dmabuf_unload.c
> +++ b/tests/amdgpu/amd_kfd_dmabuf_unload.c
> @@ -309,23 +309,18 @@ static void test_kfd_fence_outlives_module(int vgem=
, int
> amd_fd,
>       igt_assert_eq(r, 0);
>
>       /* Create SDMA command context */
> -     cmd_ctx =3D cmd_context_create(dev, AMD_IP_DMA, 0, false,
> -                                  copy_size, src_bo, src_mc,
> -                                  (volatile uint32_t *)src_cpu);
> +     cmd_ctx =3D cmd_context_create(dev, AMD_IP_DMA, 0, false);
>       igt_assert(cmd_ctx !=3D NULL);
>
> -     /* Set up bo_list: IB (src), dst, imported VGEM BO */
> -     cmd_ctx->ring_ctx->bo2 =3D dst_bo;
> -     cmd_ctx->ring_ctx->bo_mc2 =3D dst_mc;
> -     cmd_ctx->ring_ctx->resources[1] =3D dst_bo;
> -     cmd_ctx->ring_ctx->resources[2] =3D import.buf_handle;
> -     cmd_ctx->ring_ctx->res_cnt =3D 3;
> -
>       igt_info("Submitting %d SDMA copies "
>                "(KFD amdgpu fences on dma_resv, no wait)...",
>                NUM_SDMA_COPIES);
>
>       for (i =3D 0; i < NUM_SDMA_COPIES; i++) {
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, src_bo), 0)=
;
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, dst_bo), 0)=
;
> +             igt_assert_eq(cmd_context_add_resource(cmd_ctx,
> import.buf_handle),
> +0);
> +
>               r =3D cmd_submit_copy_linear(cmd_ctx,
>                                          src_mc, dst_mc,
>                                          (uint32_t)copy_size);
> diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c index
> 7c6855d3f..eef869b41 100644
> --- a/tests/amdgpu/amd_mem.c
> +++ b/tests/amdgpu/amd_mem.c
only updates create/destroy signatures in three places,  only updates creat=
e/destroy signatures in three places, but two submit paths still omit resid=
ency registration:

test_cache_invalidate_on_sdma_write_asm (~line 855):

r =3D cmd_submit_write_linear(dma_ctx, vram_mc, sizeof(uint32_t), kPattern)=
;
Needs cmd_context_add_resource(dma_ctx, bo_vram) before submit. Without it,=
 the CS bo_list may not include the destination BO =1B$B"*=1B(B potential f=
ault or undefined behavior.

submit_dma_write_operation (~lines 1961-1963) - broken after refactor:

r =3D cmd_submit_write_linear(ctx->dma_ctx,
            ctx->dma_ctx->ring_ctx->bo_mc,  /* internal data BO - removed *=
/
            64, 0x12345678);


Regards
Jesse

> @@ -850,7 +850,7 @@ static void
> test_cache_invalidate_on_sdma_write_asm(amdgpu_device_handle device,
>
>       /* 5. Issue SDMA write to buffer[0] while shader is polling */
>       if (cmd_ring_available(device, AMD_IP_DMA, 0, false))
> -             dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false=
, 64,
> NULL, 0, NULL);
> +             dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false=
);
>       igt_assert(dma_ctx);
>       r =3D cmd_submit_write_linear(dma_ctx, vram_mc, sizeof(uint32_t), k=
Pattern);
>       igt_assert_eq(r, 0);
> @@ -875,7 +875,7 @@ static void
> test_cache_invalidate_on_sdma_write_asm(amdgpu_device_handle device,
>       igt_info("cache-invalidate-sdma-write: PASSED (dst[100]=3D0x%x)\n",
> buf[dwLocation]);
>
>       /* Cleanup */
> -     cmd_context_destroy(dma_ctx, false);
> +     cmd_context_destroy(dma_ctx);
>       amdgpu_bo_list_destroy(bo_list);
>       amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, 4096);
>       amdgpu_cs_ctx_free(compute_ctx);
> @@ -1919,7 +1919,7 @@ static int init_dma_context(mm_bench_context_t *ctx=
,
> amdgpu_device_handle device
>       }
>
>       /* Create DMA context for ring 0 */
> -     ctx->dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false, 1=
28,
> NULL, 0, NULL);
> +     ctx->dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false);
>       if (!ctx->dma_ctx) {
>               igt_debug("Failed to create DMA context for ring 0\n");
>               return -ENODEV;
> @@ -1935,7 +1935,7 @@ static int init_dma_context(mm_bench_context_t *ctx=
,
> amdgpu_device_handle device  static void
> cleanup_dma_context(mm_bench_context_t *ctx)  {
>       if (ctx->dma_ctx) {
> -             cmd_context_destroy(ctx->dma_ctx, false);
> +             cmd_context_destroy(ctx->dma_ctx);
>               ctx->dma_ctx =3D NULL;
>       }
>  }
> @@ -3164,10 +3164,11 @@ static void
> test_signal_handling(amdgpu_device_handle device)
>               /* Parent process - perform memory operations with signal h=
andling
> */
>               igt_info("Parent process starting memory mapping operations=
...\n");
>
> -             /* FIX: Use cmd_context_create_ex with the same BO for both
> internal buffer and target */
> -             /* This ensures SDMA writes to the correct memory address *=
/
> -             dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false=
,
> 128,
> -                                  sys_bo, sys_mc_address, (volatile uint=
32_t
> *)sys_cpu_ptr);
> +             /*
> +              * Create a DMA context; sys_bo is registered in its reside=
ncy set
> +              * immediately before the submit below (residency is per-su=
bmit).
> +              */
> +             dma_ctx =3D cmd_context_create(device, AMD_IP_DMA, 0, false=
);
>               igt_assert_f(dma_ctx, "Failed to create DMA command submiss=
ion
> context");
>
>               /* Wait for child process to complete with proper signal ha=
ndling */
> @@ -3215,6 +3216,7 @@ static void test_signal_handling(amdgpu_device_hand=
le
> device)
>               igt_info("Writing 0xdeadbeaf to address 0x%" PRIx64 "\n",
> sys_mc_address);
>
>               /* Now SDMA should write to the correct address since we're=
 using
> the same BO */
> +             igt_assert_eq(cmd_context_add_resource(dma_ctx, sys_bo), 0)=
;
>               r =3D cmd_submit_write_linear(dma_ctx, sys_mc_address,
> sizeof(uint32_t), 0xdeadbeaf);
>               igt_info("cmd_submit_write_linear returned: %d\n", r);
>               igt_assert_eq(r, 0);
> @@ -3244,8 +3246,8 @@ static void test_signal_handling(amdgpu_device_hand=
le
> device)
>
>               igt_info("Memory successfully updated to: 0x%08x\n", sys_me=
m[0]);
>
> -             /* Cleanup command context - don't destroy the external BO =
*/
> -             cmd_context_destroy(dma_ctx, false);
> +             /* Cleanup command context; sys_bo is owned by the caller. =
*/
> +             cmd_context_destroy(dma_ctx);
>               dma_ctx =3D NULL;
>       }
>
> --
> 2.34.1

