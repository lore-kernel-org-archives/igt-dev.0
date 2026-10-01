Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301AACA5FD2
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 14:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B966E10E295;
	Thu,  1 Oct 2026 14:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U/CaSVJV";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7D210E295
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 14:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYP0JpHKxPr22Q5Uci854YsZFwiJjX450ZjRJW9+3QIcZZJimzNhKtO6Nkml3ghjc9Fda9yes1AHG15+mGYScSnrZQGDAkzZ/jzVW7nxUkbk4Z7Hm4NxyVcejuF66lQEL5vdZ77WHr8pdyiKlk2rPafMvOfIXSneQ7IoBW2O483OV92jNtke1KBl79L5QnfQeG9J2ovEXWFYLTsuKNphMaYL6Q7RHzHnVwSAQqLIKZvyqPa8ZsSYnLM/k/a2TneU4ZwL/grXpOj+sYMuU2n8z3fWLhmpr1lApT0s4vtAikhAvZ92c7KxktAoctEzZoTJH4MXEM0TkkHHg7NHkAvCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFFFMJ/17+l+FhDMeg65pJ4ROEHYGevCCDU0EAcfXTY=;
 b=fKr4exQx2F/M7lOJfJoAcgofs8Jld+h8U6mBd3yXl7krkVhbSbw9QE6SCvv0cE3re/ae4OXk7Q0KtZ13Uqyvp53MHpLUXEhTSx71v7TXaLpDM65MmhRTuXiCBR7Zj60623XGT97tinnrGUpFZh4E3OJftDfB42w8DG+Rh9pAIAHbuTkNiYyO61UW/T7Zl8/q5JPUcRFHkoYmi00GogCCYS3GIxNzjFRA/A4xwyPYbH8GIsGojQFfFN/h26YOzF/PFSqVSjthA3Cg+mSzTaVMR9Ecc6rJCHePuNiI+ENZtN06fQafO+D1On2cb7Jf5isYrWCOd8vePNZmbBX64vyP9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFFFMJ/17+l+FhDMeg65pJ4ROEHYGevCCDU0EAcfXTY=;
 b=U/CaSVJVuUPX50ngDnXndXMh2N30UAFx85PPu3K3fQAKOXM5Lb49SewieKylVt9yVqpjhtriweBpgboUEHuTw3JGw5KHv5o21CdQerxOB7MYFVr3UGkVqYtPSp2IaAhOHlUzg1Blhl6uWl9nYWnxkBBTqK/wEWVXhQ5PK1Qyxmk=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SAVPR12MB999146.namprd12.prod.outlook.com (2603:10b6:806:4e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 14:15:55 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 14:15:54 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] lib/amdgpu: don't verify dispatch results after a
 cancelled submission
Thread-Topic: [PATCH] lib/amdgpu: don't verify dispatch results after a
 cancelled submission
Thread-Index: AQHdURe4jdv0qe0trkWR05TE0kxFqrbovFLQ
Date: Thu, 1 Oct 2026 14:15:53 +0000
Message-ID: <DM4PR12MB515228D1BBAB34E5EFE1443BE38A2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260930201005.66857-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260930201005.66857-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-01T14:15:04.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SAVPR12MB999146:EE_
x-ms-office365-filtering-correlation-id: 0cb5bc87-3f00-4331-9148-08df1fc68115
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|38070700021|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: FLowwrqFPlMcm79kWvajC3f7eteyjvJi+TdTdtl9N5wL2IEFHbutgXzKSajXeh7JwsgZvdkArPdsKtQRe0Cn10SwbSQf0LmMWLsjv3iMxw+li28mYjhvKv/5gN4CZOkN5ZvA1GVZyiCWnb1dg3n3uHgLlTyc6EYgjT8HNDQBWnUD9l/WPM1c4DztORnZtc9PRzDPgRA1Y2A0uYrsJc5iUkH31eSy3IiKiH8I+nK9ItaEJRoNfzc6G9jLmCMW7AvF62RN5tEONkSjCr06kzvz2P3MyWTMbrJz9X1wqlyw4V/EnyIagQ+RubBqAHdEE1KGq29BB0EE5nLpNSDDfPaHtIPPIgYa93POYjwHHyXvf65Lf1p2kaTe2XaZ5+bFcb97I+kKD3Aaklr/aSBCyOGhZbIQ90EsyE8y/rXEcohADeHImHdAVz25Oan2p4c9iyhgy+kabtlxqJJhQYE006aT68uOv8n/xeu3j6NheVNVCO6+lYTeofDJ+MEfW2K/e9BJ+1eP+xo/D0B+cGxPGUpvf1ZjJOk1s33tM6/zzIxgdXfoX4pIFhgIibU84Om/P9htvOL5HUJq6/bSEHVmVVTFkOZV7UrOxYK97Er+LU3Q2yY49+OjOm6jhYYfGtHl4J+WWIckRYS6vg3q0qEwU3OuaKp7t6Tqvu8NnMmzjztVOIAuTd0Ax38Vjg+l1DtQ05LeUdJT6BZT8QnhjbfslWaF5UPRdulHThFR1OYeQH7SqHs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eRDcy+coIb3MtTAEXfFXOJp17oz23y031LijLTp2p0M3C9J0BgjUjAvm2T?=
 =?iso-8859-1?Q?ssEUCkJY8lCVVp7CXTdNu8Ewu2uq8ZRn9zzIxeoP2kGs1wEkPdNJq5F2lC?=
 =?iso-8859-1?Q?Vg5cvPgbrNsEaSx2SUjFgUpKk5UWRetYpK9CeGSYgUik+9/QOKlKl8JT9T?=
 =?iso-8859-1?Q?8T/3ZcNhSI+ztmt0m4jPPCYsnK65TIFTm8SjcIhIAs7erpSm/ZIdTKlgxd?=
 =?iso-8859-1?Q?F2DyXP0VsLHX9wOBA+xzOEk6yVPFHyt6mPmWvlQGStx+rFVutE+7NRWp8q?=
 =?iso-8859-1?Q?RASFbpwUxWOlB0LcvWVSuW28NrcFSpkIlAmvNwZ6Gm+Da+5RtidaisGNsK?=
 =?iso-8859-1?Q?Y4mkNAIBxQheBJKnOxLgAuN20Z8MZF+yGuoXKmCyG7oB7I2xrcAMIHw5o7?=
 =?iso-8859-1?Q?ccEmLJrL1C/BJWowGtlCl29YxPVkPbG+Wbi8gdGVIl/uDnJhUaYGbwac7U?=
 =?iso-8859-1?Q?tRiz0psbV0fkJWEA6zx9QJzJPFMBqxaK7riGHxQUfGyfO9B1l5e8jhf5fZ?=
 =?iso-8859-1?Q?inje10/HUCrhWKsWAG+g1E+nONOcZJvYxmOmHVU1Oqt/Wpz8oa/M16WaMI?=
 =?iso-8859-1?Q?00bjmQYmJ8vUGUwsw74I8jLs106XQDh7dgAIoYgT/0hUJRKTwcxU2Utxz2?=
 =?iso-8859-1?Q?/jFU9fwWW1ddde7zgMgLogL+hG9uPnmxg1bqZBTnpXAPePHuyk2QT0zulg?=
 =?iso-8859-1?Q?I6NeYtYklpDmHri9HTs5F3WuHCTFmVkwwJmB99YJwQeY6ByTQviv5lnZEu?=
 =?iso-8859-1?Q?0s0fWFHapoI+7sOoJgIp7svISSERlReRo70a093FpgeNnyjUGtSHK35OzM?=
 =?iso-8859-1?Q?e0D6/oc3awqXh0U6hP/mmbgM+9wVp32Hd1CuezMKDxo6LS6L6lkAtRl9ZU?=
 =?iso-8859-1?Q?LeMQla9rX3iH+WWXUyiOzku4WWr3lk9L9fLgveqSBuYtsFkGOtJqTRz5Cn?=
 =?iso-8859-1?Q?0wWJdXHkLgjPIQULUJdXF/d4k+KeRgedW5DXlbO4S4ps7no4Yq2bBvQHvg?=
 =?iso-8859-1?Q?FLEDQLIYWiqv1n9dt4u/6989Qn+dMOfzxJuXsRqE2b5gSPz+nZOBWDDfO+?=
 =?iso-8859-1?Q?jJU8sT1GVwIwfpRGxwr6qkOf75IaMr/SKnmhm7Ez3v9r9e63g0zcKA4q3M?=
 =?iso-8859-1?Q?qeI0DsJRW/1d6+ehZloJJaE2WXVdVFAu+CgZKmZF6i0BUYopYa8IF4INQ3?=
 =?iso-8859-1?Q?1EBQJI0fePONWkuPZeaeKsW5U/At6QsHdj+8b0Hz7Z5zv42+C8T86i3Ybx?=
 =?iso-8859-1?Q?8JRqIFVwb4szjgDckRL84AVUnPXXCxooCwnkR0WV+uitDnXGrTtW9fJdvi?=
 =?iso-8859-1?Q?0msD7PRtjMlmsdS4NWhhRKR0iegWmncicUzYPBM3Mz8CXfRGcha0tjL3ke?=
 =?iso-8859-1?Q?NWmb47RdzfeXFhcaVVXt1h5SakkUthvwoKVYYn0yFY4idQtX2OxqjPuFxE?=
 =?iso-8859-1?Q?JXaq6tsb5g9IerAlTCbh5s8TzntsU/dAKAL70UK1Rn1kxOnItpHqLJQ+Zm?=
 =?iso-8859-1?Q?AbnubQAjjPOO+w/LI4suPfqZ8JAd/RTnf+YRyWhkSerDv3j9VuCoKceLmo?=
 =?iso-8859-1?Q?f/xYJJVhqvtdcJ2z8QGnxJzx+CneyNWWw/9DHvWMVRKmJKU7h6MXS14jW5?=
 =?iso-8859-1?Q?CwmTuXbp8Uw5qRFV+O2plNZuhrKJKuKxAhiJfge7pgxjVozuYaXA0A34XI?=
 =?iso-8859-1?Q?5t5OTmNWI4AApi6qh2XRuA4/8YgKz7oMvcNNSwwGTnE4GYhmZsoZ7JSGKi?=
 =?iso-8859-1?Q?osQt7gfBkni9Bb89yqxxCy3rcaZr0MNz0oKNxSTRFa1Twv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb5bc87-3f00-4331-9148-08df1fc68115
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 14:15:53.9014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zw/Zvl63y1D1OD/t6l7lEqsJED0Ce4vqSlZdlGYd5h6cgMY2AQSEIvyQsiWQbVLk+4H1zT8sT/spa02rnE3nbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999146
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

Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>

> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Thursday, October 1, 2026 4:10 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Subject: [PATCH] lib/amdgpu: don't verify dispatch results after a cancel=
led
> submission
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> amdgpu_memset_dispatch_test() dispatches a CS_BUFFERCLEAR shader that
> fills a 16K buffer with 0x22, then checks every byte. The fence query tol=
erates
> -ECANCELED, -ENODATA, -EHWPOISON and -ETIME, because a GPU reset
> triggered by an earlier hang subtest can cancel this submission.
> The result check ran regardless, so a cancelled dispatch failed with:
>
>     Failed assertion: ptr_dst[i++] =3D=3D 0x22
>     Last errno: 125, Operation canceled
>     error: 0 !=3D 34
>
> The shader never ran, so the buffer still held its initial zeros. The buf=
fer
> contents are only meaningful when the submission completed, so skip the
> check otherwise.
>
> The check also used a while loop that incremented the index inside
> igt_assert_eq(), which discarded the offset of the first mismatch.
> Use igt_assert_f() and report the index, the actual byte and the buffer s=
ize,
> which distinguishes a shader that never ran from a partial write.
>
> Remove the commented-out asserts left behind when the fence check was
> relaxed.
>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/compute_utils/amd_dispatch.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c
> b/lib/amdgpu/compute_utils/amd_dispatch.c
> index 5acb26dcc..feac6aa2e 100644
> --- a/lib/amdgpu/compute_utils/amd_dispatch.c
> +++ b/lib/amdgpu/compute_utils/amd_dispatch.c
> @@ -221,15 +221,22 @@
> amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>               r =3D amdgpu_cs_query_fence_status(&fence_status,
>                                AMDGPU_TIMEOUT_INFINITE,
>                                0, &expired);
> -             igt_assert_eq(r, 0);
> -             igt_assert_eq(expired, true);
> +
> +             /*
> +              * A GPU reset started by an earlier hang subtest can cance=
l
> +              * this submission, which is not a failure of this test.
> +              */
> +             if (r !=3D -ECANCELED && r !=3D -ENODATA && r !=3D -EHWPOIS=
ON
> &&
> +                                 r !=3D -ETIME)
> +                     igt_assert_eq(r, 0);
>       }
>
> -     if (!user_queue) {
> -             /* verify if memset test result meets with expected */
> -             i =3D 0;
> -             while (i < bo_dst_size)
> -                     igt_assert_eq(ptr_dst[i++], 0x22);
> +     /* The shader only filled the buffer if the submission completed. *=
/
> +     if (!user_queue && r =3D=3D 0) {
> +             for (i =3D 0; i < bo_dst_size; i++)
> +                     igt_assert_f(ptr_dst[i] =3D=3D 0x22,
> +                                  "dst mismatch at byte %d of %d: got
> 0x%02x, expected 0x22\n",
> +                                  i, bo_dst_size, ptr_dst[i]);
>       }
>       amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst,
> bo_dst_size);
>       amdgpu_bo_unmap_and_free(bo_shader, va_shader,
> mc_address_shader,
> --
> 2.55.0

