Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929F6CD1288
	for <igt-dev@archiver.kernel.org>; Mon,  1 Apr 2024 23:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A7D10F69A;
	Mon,  1 Apr 2024 23:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R9lrJ2hZ";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2136.outbound.protection.outlook.com [40.107.93.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F8F10F699
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2024 23:31:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIJyE+FDBKikO3cgS6RyUEMAD6r0QMCEQvaZwsriGGdwObe0jUGuyuLwYNCRxFyEbHllQiRivgJOVVXHIU5MzSvlxBH0Y2OtuhY/S4sOJwc7VMsYTQhi1bAvByIQz5dsnDhH4ZumyJYMV9uMes/k+atpNWjlMHG+UwzOBmYdlkJq1Xa79WpzZekckHu1AQuZsrM8b+V+Sjm5rllFsoxQKBW/X9eapu38bwemm03ZMmeiFtAg/jKSQ621oQv3QQ6YN1F+QseDYqrZDJp9JQTtrBrAvM1jodPvjbFERESWN9OgAA59l/kfUT4ZJ5SwpxjeRWKrC/G7iDr31vhSfI3tLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Db3OVMEBjXS4jtooiwp3GyhPFsznEnbUJro6n2NiE8I=;
 b=XEVX4TGok5kUCykybrsVyDX0Q+T/P7e9u7hP/UQb+MCsl5IGbnrraePbFJLmdZ/SImxJAb9FUcALAY7P3ByNlA/zKr8dNIOQ15mgOHdnJ4Lxm0Yb3r+aq0mB4cGv/x10wgNOfOv0+Hr1Pt+T4qF2cGHe4mu+DKLHkDZk2K7gnFX/ZMaEnmZymSMoaBvfgjYh0axEEOXPH69bts6FOGzydWGhNXfUdp814cmfvZF9x61S6cK8hOPDNs5iUYEZbiSrdDXm5wk/RqmO3nBMPnen/VyoOG96Cqx6fjCj1tKFtxlBcJ9diC2rUV63hGjULHXYF4CVh+y73/eIlOmN/S2ByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Db3OVMEBjXS4jtooiwp3GyhPFsznEnbUJro6n2NiE8I=;
 b=R9lrJ2hZcyXjTZns7QX9wrrlZ+06DB5wnGHUjHV9REkGK9NDK492apaevrBsQB5KSqEx8DX3nXqw/iFe6ehqkUFfyd2cbi6N73tI29I1n6DmaU17Aq2MYiaEm5dMlFk9k792FTVzd+tJS3KzJ0CHL5Ljn4Q/e/lWoXztMqwApI0=
Received: from PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 by BL1PR12MB5971.namprd12.prod.outlook.com (2603:10b6:208:39a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 23:31:01 +0000
Received: from PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::dd5a:9555:315f:55e0]) by PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::dd5a:9555:315f:55e0%4]) with mapi id 15.20.7409.042; Mon, 1 Apr 2024
 23:31:01 +0000
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
CC: "markyacoub@google.com" <markyacoub@google.com>
Subject: RE: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be
 re-enabled after test
Thread-Topic: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be
 re-enabled after test
Thread-Index: AQHafrcSQyxOXbHHrUyRNWkZyVn86bFMixiAgAdR2iA=
Date: Mon, 1 Apr 2024 23:31:01 +0000
Message-ID: <PH8PR12MB69627397F866A2863689A258FD3F2@PH8PR12MB6962.namprd12.prod.outlook.com>
References: <20240325131926.42203-1-hersenxs.wu@amd.com>
 <CO6PR12MB5489A8C08138B1D8CACECFB4FC3B2@CO6PR12MB5489.namprd12.prod.outlook.com>
In-Reply-To: <CO6PR12MB5489A8C08138B1D8CACECFB4FC3B2@CO6PR12MB5489.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
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
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB6962:EE_|BL1PR12MB5971:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LDoA1K4f3tpwMEa0QkbPA/w+jhZ8chKYGK1oJGelmt9eUuxYdPGNbEL6Dr0Io0CcepFXC+12fjbFcmeZQrxyxHrEjrWz2ccVmT2ecJy7MTo1FPFtwy8kZcA+agsOPX2iAPFfbIa2C5Oc8mPgmcgI7Dw06DAUgwMl0GNm99aS3TBraPJf9BVNmZOKh3Of9jK0GQIk0sri2vDv9HAnlE2zZY146BIKoWGV3/k7R6pxpTfCzMusdkz+4b6+0rYfhZaenk6j52QB2w6NlLGrlfiIRf1KFXCpV6mCc0hy0FaYBxzrF6NpoGO5P1bih5MaB6+QtlpNQdaIeDk7/upsdv8r74PifXoEash0MMbPM9YCMzwNTE72KoGf1sENPjpEaS7tYSubaf8SSd3QsXcUamEidL7S+DkVVj0ZsACyN1MfxBAp3/iYTteFij+LGekdEIVivuZ/M7RJO91oZDVmjP7P5pbbyab3rWwBZuPWDYbeqo1JLMKnY/imeNaHE9yjJpOMUaPgHI331fuF9vEc6na1IfkkhENZ950g1E6UBqlxUKY2nHHMHpdzmcV09Q4sSrzQ821UOQsDlXMytIOLwsr2U6UNpg/4egm3o/L/rOP3HlbPp8ag8HCk3HBHotBinf+a1vwiwj41Bv8fJcH7PQ5/13SM1Dw4L23O4x/xtYfCR+hGi2Xoqmu5xIlpKNywP130vA/+FFRFpe6MBWj1lcG9Pg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB6962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(921011); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BBis2qZMqr0ALMdFLFVBaWv+bjWS/EGxHt0Xf5VM5ztvVa5SlYy2CQHk62Bh?=
 =?us-ascii?Q?nrodYsSpiGY1I9LMrWA63J7N6pdRT9R85klTmHfC2wOW8/iEe/M2Yr48ee+7?=
 =?us-ascii?Q?qwWP8Fm9iDPFF2LtKjCw3NAEVro3cciY1JPOHzn70rt/u/cDKjbuScvtKwOe?=
 =?us-ascii?Q?ZejA9iZN+sUJmloV8sBfzDjTMVufS7s5R4f/xIH+KOKIrMsmjcPGUUBPyE3T?=
 =?us-ascii?Q?orxJ8DJnkoSu4bov3LI6FZlOdOl28W+KyYmgcdQVtZsaXYz7k/gLMtOx5kXk?=
 =?us-ascii?Q?arAvUJrw39E6HqOMYKO9qSP3KUXvV0HrQMqIgs7WR3F0oQGFmkbuP52j3Ei7?=
 =?us-ascii?Q?VK0hPn5T2qhnchDSaDPFeMRrVzWIyex9I+f3c4H0ltiUnk3awY3eYv/Vo3Ah?=
 =?us-ascii?Q?DVUYefyMy5+STOkH6I4DxmUHZh8iFYd4zUdXfwDuB6jDo7fqe5n1rb1Ynupi?=
 =?us-ascii?Q?jMwFTeSXgigIUWIAWVGXO7qu4RX9x84sn23PF4eoAMY4AmxTrFGiyrU4Gd0a?=
 =?us-ascii?Q?uEqj4hyJrgqUfmJo9sgnGl+FOCviWGPo/hruD6JNtaXIWNXmvsZg3DVL84qj?=
 =?us-ascii?Q?5gStgPmZ8bIHQNObWe2xtgci6/ZebyLX23kzR318XdcEx4WqZiFlOnATJAn1?=
 =?us-ascii?Q?bZV3gDIxOKjyYIxPYkYgGgJd9ugzwszXLzOsJuPaI4NaWuPckNU7Orv3EGsg?=
 =?us-ascii?Q?1/4mtgkTsIMZfOXFqYIHOS1Q1CrNTQ3IwwU+m0aVeMeJuC3UTNznZO6NZmZT?=
 =?us-ascii?Q?ZnOZvCea6AEdCo75lmOzMMsoKJVfgtkuVDwKvfm2NCpMCAhef2mZ7rWoGBNZ?=
 =?us-ascii?Q?7uIqm4xncoxy4+k+rZcPD7o5g0NABNgT0JcYAKVLP33Jwfq0TiwVbSTnzh81?=
 =?us-ascii?Q?GNaf6T77M3DK5k+yd9Kdc+yCgCcc0GshR84vMoz9mUTdsQPnWdFYydAXtyl+?=
 =?us-ascii?Q?gMKsv4z7U2yI8Fhhkr1nd7PoQHuDINM625JAQNjAcCU2k3/+E41NfIYOk431?=
 =?us-ascii?Q?E8RZv8FiLNageMmGYcPfCk1ScH11km085ymBGfaymrb57uynoRAkOVg1dmTS?=
 =?us-ascii?Q?Oecep5AhRETKs+LANUrhVOWGyg7mhR+apIkb+U2+fkplYJjmeZUiDFTUNiEw?=
 =?us-ascii?Q?YJmLrGAQXPhu1n7UKJICwKKFbpKY9mnjjpt2GBUNh5RGgWgtmZ2sRw6OShfD?=
 =?us-ascii?Q?1WxwjO7C9Zi+XyE32gqNUtQTAzx2tQ5ROn62XHHtepASVUiniEAAcsVOYWdH?=
 =?us-ascii?Q?fINWXDr7Ue6pCCHmecJQhhjVtrNzq5oBQX1w2C5+vIuNx2ITqElsdsNjC3oA?=
 =?us-ascii?Q?+UJf4itwQwixWiI5EGK8UlzwQSRYakktp1B3Bv4eRge4cpWOLveHHnG3/FHK?=
 =?us-ascii?Q?pUR2GNljwhKCm8zROEV1y7mOjHMFu+mbToazxoO+2OW9wYXiKU+bEHHVuU52?=
 =?us-ascii?Q?Ww5V4naumvmPO3m7ctDzCm4OotwLgpdYlVvRdM00zTxoip1C/sV8SMijYH6d?=
 =?us-ascii?Q?7RlEa003x9e7ivgALP4NxKMRrMYPuoTTwV4T34OQhuPumIsctggGWljSVl5e?=
 =?us-ascii?Q?N5+cr9me+tySLVycxzM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d25ebf-1d28-48e0-3b8a-08dc52a3ca89
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2024 23:31:01.0837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QDNMZIFyncpEdyhKGd4dISmpRVJdu6PYQjyEtMdz417edogVGsfXHbTbWfaX6UVBM/ACthXk2nl5nuoIFb3TGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5971
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

Hi Wayne,

Thank for your review. See my reply inline.
I am going to post new change for review.

Hesen




-----Original Message-----
From: Lin, Wayne <Wayne.Lin@amd.com>
Sent: Wednesday, March 27, 2024 11:59 PM
To: Wu, Hersen <hersenxs.wu@amd.com>; igt-dev@lists.freedesktop.org; Siquei=
ra, Rodrigo <Rodrigo.Siqueira@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai=
@amd.com>; Hung, Alex <Alex.Hung@amd.com>; Mahfooz, Hamza <Hamza.Mahfooz@am=
d.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>
Cc: markyacoub@google.com; Wu, Hersen <hersenxs.wu@amd.com>
Subject: RE: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be re-en=
abled after test

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
> Subject: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be
> re-enabled after test
>
> From: Hersen Wu <Hersenxs.Wu@amd.com>
>
> At end of test, with disallow_edp_enter_psr =3D 0, run DPMS off, on for
> eDP. This will trigger DRM kernel driver enable eDP PSR.
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
>       ret =3D openat(fd, DEBUGFS_DISALLOW_EDP_ENTER_PSR, O_WRONLY); diff
> --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c index
> 46ad6f60a..f63a4f782 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -199,28 +199,33 @@ static void test_flow(data_t *data, enum
> sub_test
> option)
>       igt_enable_connectors(data->drm_fd);
>
>       for_each_connected_output(&data->display, output) {
> -             if (!igt_amd_output_has_ilr_setting(data->drm_fd, output-
> >name) ||
> +             if ((output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP) ||

I think adding this line should be redundant since ilr_setting debugfs entr=
y is limited to be created for edp connector already in amdgpu_dm_debugfs.c

[Hersen] By latest IGT source, writeback connector is set with is_atomic =
=3D true before output is built.  Within amd_ilr, for_each_connected_output=
 will loop to writeback connector,
The following message will show in IGT log.

output Writeback-1: ilr_setting debugfs not supported
Skipping output: Writeback-1

Amd_ilr test is for eDP. It is better now showing writeback within IGT log.




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
> +             igt_amd_read_ilr_setting(data->drm_fd, output->name,
> + data-
> >supported_ilr);
> +             if (data->supported_ilr[0] =3D=3D 0) {
> +                     /* Enable PSR after reading eDP Rx CRC */
> +                     igt_amd_disallow_edp_enter_psr(data->drm_fd,
> output->name, false);

Should we also switch dpms off->on to have drv_support_psr become 'yes'?
What about we move this checking just right after test_init() and force DPM=
S on Before reading ilr capabilities? Then we can return quickly and don't =
have to touch dis_psr.

[Hersen] Move if (data->supported_ilr[0] =3D=3D 0) { continue before test_i=
nit.

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


