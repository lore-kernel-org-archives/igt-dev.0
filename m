Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65B4CD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 08:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EFD1125A5;
	Wed,  3 Apr 2024 08:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bOS92vN4";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2104.outbound.protection.outlook.com [40.107.220.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74ECF1128C7
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 08:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqYVRkzTJ+ZNGKG5pgZycmyWXRjwe9hOd/9r9TzBY+HZn3oCI2AjJkZgNgXG1Ez0t1eSVIOfFjreYYjh1v/e3zjsbUzOtG+t9KclITvUlnB3YCnnq6gA1frYn8q9mvmpSNSYmIlpkFaib7ojXPn9K4XCqBRU0rEchHmjkBhdbOk8qVdpal6KmDhcf7t8n8RMrKmMorn0XJYdh+l5SxP3upbpmsH1i3bgS2eAQPJ7+HrACfVIppC84vd5uAV+FDTzSJ/T7K43b/l+RDUVapEZInCmRGUsDJ7gGCRGwS1nGfpELq5HCkG+3jGJosHkkRMU1DT2U+q27dtKrnD48p3LlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hOcokE8j/q0yHIGRbL6A1hfu6ZdNWvHYDD6S8lXMK0=;
 b=k5dcuDOlGux3DOvRcRLT9uxqkmG+lq3cyD2I3EUCEQhLTgC1b+IO6Ba+G/AsaK4xZZ3bzFdKLFBRzQWNilfF+lM4uFTy3b9i9gi9HxOmaqEIRo/GAftDozIwy7UheNuiagvRvQ2/6szs8u0ssGDb3iy8VCJ3HWGmlylt+LEBWoW4N4D4vZcfRzUEGyJ+we27HQZKXpui2DCWx+eHaSCr5SisHbGTUWpG5FWbA+DMjuVWg3RYHL3YubSmHTgPue1f2OWSULveMYkTZoWfNKmx/icOFiq9Ax+9JCYcLHt60cvdOXMskhWlJ5j/m+EBj7kVOvtducPM2y+MJpGtw8sDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hOcokE8j/q0yHIGRbL6A1hfu6ZdNWvHYDD6S8lXMK0=;
 b=bOS92vN4qOngA8UbucgYvaLkDzZ0KfYHQFkLI+Iil+kuz6QCqR/+R5RIPjYIf7131AHKVtO8vdPFvLTIajbZVelbYWZTisI7BWuvLt5GTX01fe2hjpLt8NctaZRuDBhDgme4TKAf/XYWbAHRmGOWnQ37A3r6CbJxDCQKTSyfV4w=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 08:42:36 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::7a06:2a38:4667:d5a7]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::7a06:2a38:4667:d5a7%4]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 08:42:36 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
CC: "markyacoub@google.com" <markyacoub@google.com>, "Wu, Hersen"
 <hersenxs.wu@amd.com>
Subject: RE: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be
 re-enabled after test
Thread-Topic: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be
 re-enabled after test
Thread-Index: AQHahRFiGx9HOZkpBEGC76oONoeAMrFWOvag
Date: Wed, 3 Apr 2024 08:42:36 +0000
Message-ID: <CO6PR12MB548921A124E54C664EE106C1FC3D2@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240402152040.29149-1-hersenxs.wu@amd.com>
In-Reply-To: <20240402152040.29149-1-hersenxs.wu@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=a710c2bc-12f7-44b1-8a26-6ae4d17bd61a;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-04-03T08:40:24Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|PH8PR12MB6961:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fd6FYSJ7qYcb7z7QP1mKkZBbAwY+nsMV7ubes6hXf2uY8u4JnQ9KjYLi38zr0Ucx6w0UOqliEBs81KzggLggCte9uBJwLV/3WRo+xF4dhhqH3socSrpAz8wL9d/NPXSkhpaQCnGNjdDBG8g3glzHurU+vv4A7PagvAUYhvd8cJgvoNMJTy7P2IM1BTCbuoevI8ZOyiXMlYaLGbX/sPdrUczhMky+hMnRMpeCgMRZcI9Vc1QzPQOv0xj/jSc6RW9/SciYmdupOg4GlthoFIzQb9ymafRNjht95MipRSrnRdUgUS//8R9Ev+v51R5/IEKL+IYkHzcAEI33Jhl83dxvIfTYc5NkwKSp9KuDxhoBJ2OfjvbFtbp0LXSKjteTadU5gN2/ODkHLgl3CuUi1OHrwpZoIcpRTEjRlHfQBvevIHHdKYIW83LUEKTlP16rVmdXhn6hdNdg7MfXdE7cO0d0rqtXXY+jbhbIj9NicEZctkfma5D8qen7JY8NWcj1KmDi84ZaNcPCTZ5JEfFJQXfm3PQv9qePuMS44Bqbn/xloa7QMrcABg2/QKxJwZ7JTbQg8GuqgQ3UYLRwxD5Tlq5NOtCGPoTxGwrOwG/xyjK7dBazI2/eb5bL2R8D6P8Ih+Ilrxu30K3g5npSQ/U7WGaX53o1K/iinzaFzbqbcwdF+iwX9e391/09YbaML03oCiY5YNtdv0XxbsEtL73B4V3wUQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(921011); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dnQmx6ShAuHu6OwOL29GFGCd5aey94r4qAPe3BpinFeFDC5pQrSzPKwY29/V?=
 =?us-ascii?Q?bk1S6e2cL4zJTe1c/7qw1/P2jaz3Il1lYnqscy4CQOTonJ8uLz2MtAm26Tta?=
 =?us-ascii?Q?0D5zLOEmIlK3jytN+k5UCXdCx5c6y0hqgLU7ZITGzBXgpuLInvg9ez7w4hCH?=
 =?us-ascii?Q?Jr/wPKHTCinbqAi+KCXIhXYtBPnxywaA3OUEekriNcEutV6/eWokUm5q305x?=
 =?us-ascii?Q?CDMeDCpzvBugXTKNzT7c4nan3S3HRd/rtLEXGtpk0qtHI+za9Ur3Z9GZ39o0?=
 =?us-ascii?Q?eyIfn0/ZZQi9X6TnSkpfVsIyjbkmDPSdCsKRyeSfq/ef9nt8zyb2PRVUQ2oI?=
 =?us-ascii?Q?b8m3KxndCufWE5dFnI/rpPtfjgOEVULgg8mWtOqbDMRDl0/jFk0ZpneWJcVo?=
 =?us-ascii?Q?lPTbxNRYhO8ur/ndeuD3tQA8jPfMHHet0+3skmQ53uzoIL0QldrmQiVtCwFj?=
 =?us-ascii?Q?alvQ7OjzfqGyG/cjlCqlfY+v+3jt5TqerVdyW6pWJwyNg8G1uba1ZV5Du9e1?=
 =?us-ascii?Q?EwgsADtHZS3RLLh+gA/RgnB2d7iiWoAiWgCeIjpepovK9zgS4U8Qr0fc+JqJ?=
 =?us-ascii?Q?Lprt+WMIizqpcAHjEHkKGRmJHQg68hrES3bqRqu5ZbZac4hOvGGeXpe4Ezuf?=
 =?us-ascii?Q?S5ezyXlGJi+NXWPB0J20K2LAwYroiC5CPp76YI0zg5sVZKBN/cHb8GWFdD8l?=
 =?us-ascii?Q?5y2qtUDSHx+XPCm0lglogyvP6sqDSsCcyYN8GH2xepnO26Awp3BEg4Scosr9?=
 =?us-ascii?Q?Ybwgb770GNXHzCLPd0fWtBTM+7GUCdZXw11BVMctn7Tpvru7oE1+1x78MAxx?=
 =?us-ascii?Q?rKv/lG95HESKrI2QgnACHDWKP3w+S1PLjOdiUhT6atZtPrTQ4SCe84dszYOb?=
 =?us-ascii?Q?jYGo7yVfBxGFiB7DU3ZThd1sgTuCnnFc8FqXAPt88LWc3lxF46FENvYh2SY0?=
 =?us-ascii?Q?t+N79Pfo1xNeaDzCC9q8+m1KgaN+JRLfWnavF8i4Xs5DSid/Hv+0Hpb22UZn?=
 =?us-ascii?Q?NI4pJoYhTHG8c/DwuCh+WrP6pYWkA1/XWIq6NpaGbb1dAHAsmQkw5zITky43?=
 =?us-ascii?Q?xqmozqZIDnD5pK9Tzr4DYKbytNe2sEo2BiDj22lDShjrVi0tXLaf5+SABy3L?=
 =?us-ascii?Q?lyD6VNeo9atYScLChQCfj3dI/6gaS7u/HKWI/+U75jqkF2AoXMdS5ryBbp8b?=
 =?us-ascii?Q?yhdxMjhZAJx6j2XBY2wQq1ozBF/2lnMzsIhOWnL8+GC/Dj71QWsxMe0SffoI?=
 =?us-ascii?Q?1lbwY2zJRFoikBSciYwhUYBGyMwyZGmV9uV8jB1bcSjzYxbLRFqIs02T7mbE?=
 =?us-ascii?Q?aeu0DBy9lsUQZKB4C0h9+Ef5fXTH+7BA/YuYY5cCIUoyER7CYLTtTFN5iNVl?=
 =?us-ascii?Q?GCtZKbL6ZrI2knJnAwSfWGG/IAMW7WUr54kDyc6kZgrlRGvIsxGCjsKOX1cm?=
 =?us-ascii?Q?21SAl66vbwN2dJD4LDQ7jju1mQA10o5e0UYDkqYKe7x4LXqevZCfKyu5hLY/?=
 =?us-ascii?Q?QAblGFMTwp+Qmq5H7oNoYxBB84l8dhtRKRwBmIfFgpaV1wm6uK3Fd4FnPtYr?=
 =?us-ascii?Q?MOJQtD4a4tyLMhGyvoI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3539b967-cdc3-4e4d-42ca-08dc53ba0349
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 08:42:36.3687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2reJSxxwJIS9/a2iitqlMQbP3qfCq2k9SyleqkVEQO3S8BAQiYjsIwLSSw82/viWjLQnhVPNBPbAcSUZJDgZgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961
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

[Public]

Hi Hersen,

It lgtm. Feel free to add
Reviewed-by: Wayne Lin <wayne.lin@amd.com>

Regards,
Wayne

> -----Original Message-----
> From: Hersen Wu <hersenxs.wu@amd.com>
> Sent: Tuesday, April 2, 2024 11:21 PM
> To: igt-dev@lists.freedesktop.org; Siqueira, Rodrigo
> <Rodrigo.Siqueira@amd.com>; Pillai, Aurabindo
> <Aurabindo.Pillai@amd.com>; Hung, Alex <Alex.Hung@amd.com>; Mahfooz,
> Hamza <Hamza.Mahfooz@amd.com>; Li, Sun peng (Leo)
> <Sunpeng.Li@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
> Cc: markyacoub@google.com; Wu, Hersen <hersenxs.wu@amd.com>
> Subject: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enab=
led
> after test
>
> From: Hersen Wu <Hersenxs.Wu@amd.com>
>
> At end of test, with disallow_edp_enter_psr =3D 0, run DPMS off, on for e=
DP. This
> will trigger DRM kernel driver enable eDP PSR.
>
> Signed-off-by: Hersen Wu <Hersenxs.Wu@amd.com>
> ---
>  lib/igt_amd.c          |  5 ---
>  tests/amdgpu/amd_ilr.c | 84 ++++++++++++++++++++++++++++++++++---
> -----
>  2 files changed, 69 insertions(+), 20 deletions(-)
>
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c index c0c4dfc67..149af5151 100=
644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1185,11 +1185,6 @@ void igt_amd_disallow_edp_enter_psr(int
> drm_fd, char *connector_name, bool enabl
>       const char *allow_edp_psr =3D "1";
>       const char *dis_allow_edp_psr =3D "0";
>
> -     /* if current psr is not enabled, skip this debugfs */
> -     if (!igt_amd_psr_support_drv(drm_fd, connector_name,
> PSR_MODE_1) &&
> -             !igt_amd_psr_support_drv(drm_fd, connector_name,
> PSR_MODE_2))
> -             return;
> -
>       fd =3D igt_debugfs_connector_dir(drm_fd, connector_name,
> O_RDONLY);
>       igt_assert(fd >=3D 0);
>       ret =3D openat(fd, DEBUGFS_DISALLOW_EDP_ENTER_PSR, O_WRONLY);
> diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c index
> 46ad6f60a..b09980a15 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -205,21 +205,22 @@ static void test_flow(data_t *data, enum sub_test
> option)
>                       continue;
>               }
>
> -             /* igt_amd_output_has_ilr_setting only checks if debugfs
> -              * exist. ilr settings could be all 0s -- not supported.
> -              * IGT needs to check if ilr settings values are supported.
> +             /* states under /sys/kernel/debug/dri/0/eDP-1:
> +              * psr_capability.driver_support (drv_support_psr): yes
> +              * ilr_setting (intermediate link rates capabilities,
> +              * ilr_cap): yes/no
> +              * kernel driver disallow_edp_enter_psr (dis_psr): no
>                */
> -             igt_amd_read_ilr_setting(data->drm_fd, output->name, data-
> >supported_ilr);
> -             if (data->supported_ilr[0] =3D=3D 0)
> -                     continue;
> -
> -             igt_info("Testing on output: %s\n", output->name);
>
> -             /* Init only if display supports ilr link settings */
> +             /* Init only eDP */
>               test_init(data, output);
>
> -             /* Disable eDP PSR to avoid timeout when reading CRC */
> -             igt_amd_disallow_edp_enter_psr(data->drm_fd, output-
> >name, true);
> +             /* set_all_output_pipe_to_none: no pipe is enabled.
> +              * DPMS on/off will not take effect until
> +              * next igt_display_commit_atomic.
> +              * eDP enter power saving mode within test_init
> +              * drv_support_psr: yes; ilr_cap: no; dis_psr: no
> +              */
>
>               mode =3D igt_output_get_mode(output);
>               igt_assert(mode);
> @@ -229,7 +230,44 @@ static void test_flow(data_t *data, enum sub_test
> option)
>                                     mode->vdisplay,
> DRM_FORMAT_XRGB8888,
>                                     0, &data->fb);
>               igt_plane_set_fb(data->primary, &data->fb);
> +
> +             /* drv_support_psr: yes; ilr_cap: no; dis_psr: no
> +              * commit stream. eDP exit power saving mode.
> +              */
>               igt_display_commit_atomic(&data->display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +             /* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
> +
> +             /* igt_amd_output_has_ilr_setting only checks if debugfs
> +              * exist. ilr settings could be all 0s -- not supported.
> +              * IGT needs to check if ilr settings values are supported.
> +              * Supported_ilr is read from DPCD registers. Make sure
> +              * eDP exiting power saving mode before reading
> supported_ilr.
> +              * This check will let test be skipped for non-ilr eDP.
> +              */
> +             igt_amd_read_ilr_setting(data->drm_fd, output->name, data-
> >supported_ilr);
> +             if (data->supported_ilr[0] =3D=3D 0)
> +                     continue;
> +
> +             igt_info("Testing on output: %s\n", output->name);
> +
> +             /* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
> +             kmstest_set_connector_dpms(data->drm_fd,
> +                     output->config.connector, DRM_MODE_DPMS_OFF);
> +             /* eDP enter power saving mode.
> +              * drv_support_psr: yes; ilr_cap: no; dis_psr: no.
> +              */
> +
> +             /* Disable eDP PSR to avoid timeout when reading CRC */
> +             igt_amd_disallow_edp_enter_psr(data->drm_fd, output-
> >name, true);
> +             /* drv_support_psr: yes; ilr_cap: no: dis_psr: yes */
> +
> +             /* eDP exit power saving mode and setup psr */
> +             kmstest_set_connector_dpms(data->drm_fd,
> +                     output->config.connector, DRM_MODE_DPMS_ON);
> +             /* drv_support_psr: no; ilr_cap: yes: dis_psr: yes
> +              * With dis_psr yes, drm kernel driver
> +              * disable psr, psr_en is set to no.
> +              */
>
>               /* Collect info of Reported Lane Count & ILR */
>               igt_amd_read_link_settings(data->drm_fd, output->name,
> data->lane_count, @@ -247,18 +285,34 @@ static void test_flow(data_t
> *data, enum sub_test option)
>                               break;
>               }
>
> +             /* drv_support_psr: no; ilr_cap: yes; dis_psr: yes */
> +             kmstest_set_connector_dpms(data->drm_fd,
> +                     output->config.connector, DRM_MODE_DPMS_OFF);
> +             /* eDP enter power saving mode.
> +              * drv_support_psr: no; ilr_cap: no; dis_psr: yes.
> +              */
> +
> +             /* Enable PSR after reading eDP Rx CRC */
> +             igt_amd_disallow_edp_enter_psr(data->drm_fd, output-
> >name, false);
> +             /* drv_support_psr: no; ilr_cap: no: dis_psr: no */
> +
> +             /* eDP exit power saving mode and setup psr */
> +             kmstest_set_connector_dpms(data->drm_fd,
> +                     output->config.connector, DRM_MODE_DPMS_ON);
> +             /* drv_support_psr: yes; ilr_cap: yes: dis_psr: no */
> +
>               /* Reset preferred link settings*/
>               memset(data->supported_ilr, 0, sizeof(data->supported_ilr))=
;
>               igt_amd_write_ilr_setting(data->drm_fd, output->name, 0,
> 0);
> +             /* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
>
> +             /* commit 0 stream. eDP enter power saving mode */
>               igt_remove_fb(data->drm_fd, &data->fb);
> +             /* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
>
>               test_fini(data);
> -
> -             /* Enable eDP PSR */
> -             igt_amd_disallow_edp_enter_psr(data->drm_fd, output-
> >name, false);
> +             /* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
>       }
> -
>  }
>
>  igt_main
> --
> 2.25.1

