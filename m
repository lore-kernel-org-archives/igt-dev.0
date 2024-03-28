Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CD6C54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 03:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEE710FC3F;
	Thu, 28 Mar 2024 03:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="riV2gfrD";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4258A10FC3F
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 03:59:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8bvPlg1BgxSaS7p7XdteI4h1Pf0+NxzWc0L6DvQk0QMZReqU/8NagFONIZ49cPBI3v2BMEJIXYep0FOITxUPoSzX+B3GRGSua4Rnv5YSJlkGHOazIh0Te3RUpdfk8I3gWndEw96Y1lv6URvZrx+WNSYbR/kcfTc5aJfFgRCYDCb0wpuzIc085ifK3u52IBjWpg1aF2ODNFP4jjnic+tfP9d2770v/Am8+lFd9IuoXCePkk+CZ2BM92WcbiLHyjM5WIgAo1FidxR06xEpAgzR77ncHmZZrNW5RqGAxZ8wY33CAPrk8NxqMCTS2sSKuLLkgX4USejdMumN+JRd0ec1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OF266QMqGGVKFfTnq/HtnTLhafY3e+XuUqRBmhukYac=;
 b=KCYkqF+tEMpNO1+SeIjGM53MNq+m/nKw7008nnl0kulwPsyBo4Sidvv22PWE5H3n+PQY8bVqMO2skA1TBEzGWIjE0vpqBHW64PAo3qTeCkTXWqK1IHe2znQvwnNniCCwZcg3jKzzLj6U7Z0Fy3ufwaPha+OBZsEB4QQkSmdidXTr5rTvY3GgSNuHLYM/uSw9umpf9QDJq+3ela2jSIyqUZoy3Ig93FsovEqxiZhn1TwchRA58UVmCu9AZL2b8Q+pbwAdMvobpr2rr2a9V1sAWw0psC1eBHnZAoUP4pquOrHiMfrEYb6wsc+l2z+usAiinccqjSlocicMY51Iqj8+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OF266QMqGGVKFfTnq/HtnTLhafY3e+XuUqRBmhukYac=;
 b=riV2gfrDUsq5sx7MFjmL4oHYBTJpPlmJCJ+F2ShXBqJ3GZShSuF1gJgV95eVuS3ZJHHZlRSQ/3aF14OKcfChsQKNpbGYT6/nt6vwXgqqNys2IgladDqAXWn83laUTZahdC6jFvWpxGld1HfyCOzvJsAs9KP7rqoUgXmiTM78yeY=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by DS7PR12MB6022.namprd12.prod.outlook.com (2603:10b6:8:86::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.31; Thu, 28 Mar 2024 03:59:00 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::7a06:2a38:4667:d5a7]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::7a06:2a38:4667:d5a7%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 03:58:59 +0000
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
Thread-Index: AQHafrcSqipbrVBrvUOWYXM9ue2P8bFMh34g
Date: Thu, 28 Mar 2024 03:58:59 +0000
Message-ID: <CO6PR12MB5489A8C08138B1D8CACECFB4FC3B2@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240325131926.42203-1-hersenxs.wu@amd.com>
In-Reply-To: <20240325131926.42203-1-hersenxs.wu@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=798f7663-00c3-4afe-9e3a-01bfb82b43f3;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-03-28T03:46:23Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|DS7PR12MB6022:EE_
x-ms-office365-filtering-correlation-id: 64b931ec-3b34-4441-4080-08dc4edb6634
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: da1utut3obnAROhah79HFSfP0AJt+HAB24zlHP2YvxQFcYJRhnw9Bg8BG6rki9YwvMPpvaFjKb67UmlLFIxd6CxF1QPcn+RwbeprIFROYLAtm572+Hg+ulm5Cwmxa531NiEU8Qo9fHItFtIgRx4bt5fqTKMN/IqWyCFIMcBPjuiqzlBm2TL0I2sT05tUiG9L1/Tiaux+oQ9NQOLa+pLzGT1qZ8jSDn3KTNuXdIzT4VZhAPpJZVVwY2BqTXx7/H/nM66h8tiY88DAKUA1lby+eeszq9ctWsOjShgSzfQdi5mED5rGsNoDIWjNYBxPjsQZ5KV6OBpzEmH3NIGlxua2kPKb9X3CnC6AFAgvHNdBTB6nomYkIVF2ZGYw5sskQJ39AwqC3QUlLyGxYFJdoW1akAyQOqnlG8rypGHIG7TtRzAua0iaAKK5iFXdixElOZ2uYDretNYq5LjYRACf6lTWGMeITf1xHTeYno01ij3tpxPX+Bz47AkHOzHGCcdv5lLrVKI3846QCeKx4FswqNBytjQ3nq1ltm9Thq3VPcjyzCcAvwcNGpZwQ7RmS6dNo1tAkNlE8JEd14JmNyWRUjs29Jvr4XGa/yzpXpTFxZyO2iQ6qCDE/CcamLxXvBOUK346Fe7bZp3od+oRrYg9x/PP1c+Nc6GXAT3P1jpxd38xupAnV0PmnV/emROzZ7joJPyFcx3bmj30c31zfhqL0IwDm28MmkWDymUUHvP1P3A+I9w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009)(921011); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ks2fnFYTGHrBvBqAscTQcmwDZjMfsoMDf/fixKq1Pc8RBa+eEMDDsDpdqPuk?=
 =?us-ascii?Q?FB9jzBcOwv1tnSJ+F1MBEhqWfzg5emNFxZvdpt9HLdGqKP2TDNt+Y2Y3Zxe0?=
 =?us-ascii?Q?uc5LeRxEYzn3GM4NEiujiFcQvuvyWYJhdsfBfGFyTNog3vzh+6Bp+hRwMCPz?=
 =?us-ascii?Q?6maGjlBvOaW4lkGX80+lamCB5EiK9qAkMWNimLbzmIXWNCcj6/jiLDnFS2zI?=
 =?us-ascii?Q?nFimiquNrN0/DxjDnSkjymPrGTeskZu/G4iFzWpB+ASSNz0xbhHGjrvEsT0g?=
 =?us-ascii?Q?IFhYFwmisR0CXnGhXsNbMznpKvpDZWB6IxLDKuxuFfvf41CvH29Zl3txsGfM?=
 =?us-ascii?Q?1u0sCwvhDm+2G8a9PWyRJP/fqWZZb0xu85mI+k8S3rtphMwbFiHYAeD9DRJM?=
 =?us-ascii?Q?YLVHG3AVEGOtCQxtUHRC8PvLrKMvHzOXXw2nBJstfU7018RBmlBi1W+Xo0Gd?=
 =?us-ascii?Q?mso5pqGzgAef8o8otIdHc+c/fvlOku12sJ/YmpCU2oFeSlgUC1hVzNKdBEf4?=
 =?us-ascii?Q?LsapkkzF5DpuidF08VByG7CnTanreyKdS58eP1Vgf668cIdwCe8eDf3Y9Xkq?=
 =?us-ascii?Q?k1aqoHYmb7lCm5dhKsDw17MC7to3u+/7a4fHm9Ssbupr9XW+epcehPQLfjAD?=
 =?us-ascii?Q?15rNTout6RLqtLHBmE94CwPAGPp5wWnptRt25KsBS3Na2/CXUeIbJH6Gygck?=
 =?us-ascii?Q?dX6noSVu+/8vl+HP5S3Y3qHlN6pBNDPhTIxhlkx3tYmn/Tv44d2eP08dNc3a?=
 =?us-ascii?Q?cY53Wa8UlMV7vosj3k8IrISCtNil+wbuUyZX4gjyQNaqQXlLUChos1sZRxb2?=
 =?us-ascii?Q?ZOdzCYCiNtRqri0PZCfUlrU1oHjIwNVJjmpXVRPU6DPUBHhP2AvVvy5FROQo?=
 =?us-ascii?Q?Ccgv3cmbt5popo2/uzqlgTy4Vgz4pErCVun0xKsBpk5ljwxiDS+j2RdpOSeS?=
 =?us-ascii?Q?lxjbQiJ90spGl9ktmqyr19Ou57BpEQBnxTgNwm+nH2imIoIKgtdj0bn65n1b?=
 =?us-ascii?Q?ehVSF8gatZ+ydPSpYW1FCPQZxEmmN/R6yZSqx4y98m+FKV7b7ro79Lw4P8Cb?=
 =?us-ascii?Q?fdZIgitU9tvG5h4p3jQKSIuVxsoB+szpPlgOXTcxnMu++ADhjxebMGZ/wLrX?=
 =?us-ascii?Q?WkU1LSyZjXavs8isR2B+F1THtyUVVXklWoBiL6CKNjKNbgsk1pHXJ6PfvVBz?=
 =?us-ascii?Q?Qsh2lfwn+frynKgAQpI2+VsLbYZHOD7wE0JZbOGAUpdX1EMycy6UEmJEAD1l?=
 =?us-ascii?Q?B7cwfJP+Za0r5INEXiwrAe1kL+ZQ008XcUdeRkUsPQBqKXwwA41iCrWz3GGa?=
 =?us-ascii?Q?6c+kjZ9n+uYIoIfEt5Zq9Oyo3+sChRhEU37sR5Ho+i4AF3J4Fd/QZbk3nVz9?=
 =?us-ascii?Q?KrZzmKshEiPg04NNrXQ8zMR3ZtQQMG2dUaXfzSWa/nuDTeqQlhYtTxi2V6LE?=
 =?us-ascii?Q?iQT845Krw/cikWKGs7IK7K/+RgUQR6fnqUWerR87uHiApYECX9F4E8ASNKnn?=
 =?us-ascii?Q?uKdX4aiFG6iq6BaTEyPg1QsJbJLAlTqK4uL+6ySJGY3lvsNONCRzt9Gjn4WB?=
 =?us-ascii?Q?7buZD9BkPXJ41udO82E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b931ec-3b34-4441-4080-08dc4edb6634
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 03:58:59.8773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9/QCmOoNwCG2yggpycPukrZJMk2+SG3KFKH5Zt1H74w15I6GN0VURXUN8sJG8vBJ54QBKHrPDvnxFXqXfmxR3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6022
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

Add few comments inline. On the other hand, would be good to add the versio=
n in the subject and also to record changes made by each version.
Thanks.

Regards,
Wayne Lin
> -----Original Message-----
> From: Hersen Wu <hersenxs.wu@amd.com>
> Sent: Monday, March 25, 2024 9:19 PM
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
>  tests/amdgpu/amd_ilr.c | 73 ++++++++++++++++++++++++++++++++++---
> -----
>  2 files changed, 60 insertions(+), 18 deletions(-)
>
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c index 623883dbc..d10c3c1f2
> 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1183,11 +1183,6 @@ void igt_amd_disallow_edp_enter_psr(int
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
> 46ad6f60a..f63a4f782 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -199,28 +199,33 @@ static void test_flow(data_t *data, enum sub_test
> option)
>       igt_enable_connectors(data->drm_fd);
>
>       for_each_connected_output(&data->display, output) {
> -             if (!igt_amd_output_has_ilr_setting(data->drm_fd, output-
> >name) ||
> +             if ((output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP) ||

I think adding this line should be redundant since ilr_setting debugfs entr=
y is
limited to be created for edp connector already in amdgpu_dm_debugfs.c

> +                     !igt_amd_output_has_ilr_setting(data->drm_fd,
> output->name) ||
>                       !igt_amd_output_has_link_settings(data->drm_fd,
> output->name)) {
>                       igt_info("Skipping output: %s\n", output->name);
>                       continue;
>               }
>
> -             /* igt_amd_output_has_ilr_setting only checks if debugfs
> -              * exist. ilr settings could be all 0s -- not supported.
> -              * IGT needs to check if ilr settings values are supported.
> -              */
> -             igt_amd_read_ilr_setting(data->drm_fd, output->name, data-
> >supported_ilr);
> -             if (data->supported_ilr[0] =3D=3D 0)
> -                     continue;
> -
>               igt_info("Testing on output: %s\n", output->name);
>
> +             /* states under /sys/kernel/debug/dri/0/eDP-1:
> +              * psr_capability.driver_support (drv_support_psr): yes
> +              * ilr_setting (intermediate link rates capabilities,
> +              * ilr_cap): yes/no
> +              * kernel driver disallow_edp_enter_psr (dis_psr): no
> +              */
> +
>               /* Init only if display supports ilr link settings */
>               test_init(data, output);
>
> +             /* eDP enter power saving mode within test_init
> +              * drv_support_psr: yes; ilr_cap: no; dis_psr: no
> +              */
> +
>               /* Disable eDP PSR to avoid timeout when reading CRC */
>               igt_amd_disallow_edp_enter_psr(data->drm_fd, output-
> >name, true);
>
> +             /* drv_support_psr: yes; ilr_cap: no; dis_psr: yes */
>               mode =3D igt_output_get_mode(output);
>               igt_assert(mode);
>
> @@ -229,8 +234,30 @@ static void test_flow(data_t *data, enum sub_test
> option)
>                                     mode->vdisplay,
> DRM_FORMAT_XRGB8888,
>                                     0, &data->fb);
>               igt_plane_set_fb(data->primary, &data->fb);
> +
> +             /* drv_support_psr: yes; ilr_cap: no; dis_psr: yes
> +              * commit stream. eDP exit power saving mode.
> +              */
>               igt_display_commit_atomic(&data->display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>
> +             /* drv_support_psr: no; ilr_cap: yes; dis_psr: yes.
> +              * With dis_psr yes, drm kernel driver
> +              * disable psr, psr_en is set to no.
> +              */
> +
> +             /* igt_amd_output_has_ilr_setting only checks if debugfs
> +              * exist. ilr settings could be all 0s -- not supported.
> +              * IGT needs to check if ilr settings values are supported.
> +              * Supported_ilr is read from DPCD registers. Make sure
> +              * eDP exiting power saving mode before reading
> supported_ilr.
> +              */
> +             igt_amd_read_ilr_setting(data->drm_fd, output->name, data-
> >supported_ilr);
> +             if (data->supported_ilr[0] =3D=3D 0) {
> +                     /* Enable PSR after reading eDP Rx CRC */
> +                     igt_amd_disallow_edp_enter_psr(data->drm_fd,
> output->name, false);

Should we also switch dpms off->on to have drv_support_psr become 'yes'?
What about we move this checking just right after test_init() and force DPM=
S on
Before reading ilr capabilities? Then we can return quickly and don't have =
to
touch dis_psr.

> +                     continue;
> +             }
> +
>               /* Collect info of Reported Lane Count & ILR */
>               igt_amd_read_link_settings(data->drm_fd, output->name,
> data->lane_count,
>                                          data->link_rate, data-
> >link_spread_spectrum); @@ -247,18 +274,38 @@ static void
> test_flow(data_t *data, enum sub_test option)
>                               break;
>               }
>
> +             /* drv_support_psr: no; ilr_cap: yes; dis_psr: yes */
> +             kmstest_set_connector_dpms(data->drm_fd,
> +                     output->config.connector, DRM_MODE_DPMS_OFF);
> +
> +             /* eDP enter power saving mode.
> +              * drv_support_psr: no; ilr_cap: no; dis_psr: yes.
> +              */
> +
> +             /* Enable PSR after reading eDP Rx CRC */
> +             igt_amd_disallow_edp_enter_psr(data->drm_fd, output-
> >name, false);
> +
> +             /* drv_support_psr: no; ilr_cap: yes: dis_psr: no */
> +
> +             /* eDP exit power saving mode and setup psr */
> +             kmstest_set_connector_dpms(data->drm_fd,
> +                     output->config.connector, DRM_MODE_DPMS_ON);
> +
> +             /* drv_support_psr: yes; ilr_cap: yes: dis_psr: no */
> +
>               /* Reset preferred link settings*/
>               memset(data->supported_ilr, 0, sizeof(data->supported_ilr))=
;
>               igt_amd_write_ilr_setting(data->drm_fd, output->name, 0,
> 0);
>
> +             /* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
> +
> +             /* commit 0 stream. eDP enter power saving mode */
>               igt_remove_fb(data->drm_fd, &data->fb);
>
> -             test_fini(data);
> +             /* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
>
> -             /* Enable eDP PSR */
> -             igt_amd_disallow_edp_enter_psr(data->drm_fd, output-
> >name, false);
> +             test_fini(data);
>       }
> -
>  }
>
>  igt_main
> --
> 2.25.1

