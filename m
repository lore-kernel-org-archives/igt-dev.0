Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86718F53D76
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 17:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2984D10E2DE;
	Mon, 16 Mar 2026 17:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cFFfxP3V";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012006.outbound.protection.outlook.com
 [40.107.200.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D547310E2DE
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 17:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mm+/3MNK3NhcS/oY/AmVpReHu2dNSrcsxorLJsNDySBT/M0wNTlV3gcag4nI9sY4O8qhxKKsVyyVwqISkU9L5NPkMpTLEZXFNFPlUI4tsv4FCCUgGCET7qYqB7hUEMt/Dd7tSxoq+NRrW96kiMpFWhXiFVGfOPfWxdhV3NXH0UrmHrVe24pe7a1Vz6tcbonrnfbvsydYD/vdNd1DOrlrgR0Y+7u7DJkwp1zdwR2Okq2rwogocEJY2FFAO8i94aSuG+/nbiYBT1I9k1mys8ztEzKwS81+B8+K2PiWgGdMlCFx4LkIpj9DAEjxsFSVVfm+b2qnzJOPBAYTeGxhOf1nHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3gmAdietes/fsDd+vuzwHnq0ko55Awx4+I5Agkbu+0=;
 b=UzwMJ38uFdkMtrp2Sbey7EtNjF+nC94mDqGkOg1m+VLg4BqHUwftybR3W0CrNi7g+Xg/5EQy+Bjo7CJJPnlxNQTG6YhwFNQdN3NUM/83yDgvZI0ayDt4OiarsJEChEOhP/v0IMvwFzA5NeAhDpfROiGDmXxuiUZJpVaeLE7BA3ltrhc3XXKm01HHiUfrPSmMMlUOkuJhAqDEspS5PbefxyBgpOYwTjoXLvmaAJX+t3yVgU8eqe8ZOq2dTLncCf5qdBAcFWXddL2K5fAaZx3ffM9SQipNKTic8VAxjc99lOjrtnQ27yigryMbe7256v/WUSKajXDoAXyixUc6SN7jig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3gmAdietes/fsDd+vuzwHnq0ko55Awx4+I5Agkbu+0=;
 b=cFFfxP3VAzUPcuqe+j6ZF4CxCDbTc0qjLoOu6tk6ogGp93hMXUtZHgeToNUowkwvOUCFSHaJbWBUIQ8JWWesuJEcNHJcMwnmx2x6DTo44U4+J4ZMbeHuoAotdYRPV6o2x8L4DisMDOgO5YaV92fQ1EoHvTx4/bh4nunBvZLwvmQ=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 17:21:49 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::c1d5:bb14:abc3:7fd1]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::c1d5:bb14:abc3:7fd1%3]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 17:21:49 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jani Nikula
 <jani.nikula@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>, "Prosyak, Vitaly"
 <Vitaly.Prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_mode_switch: switch to
 for_each_crtc()
Thread-Topic: [PATCH i-g-t] tests/amdgpu/amd_mode_switch: switch to
 for_each_crtc()
Thread-Index: AQHcrXAbdyc1lU57pUmi31wey4eOPrWxZ30AgAAQNXM=
Date: Mon, 16 Mar 2026 17:21:48 +0000
Message-ID: <CH0PR12MB52842ECEDAC5FA09028CABB28B40A@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20260306134937.136749-1-jani.nikula@intel.com>
 <20260316162312.pzh7xgyr7zpu6ml4@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260316162312.pzh7xgyr7zpu6ml4@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-03-16T17:21:48.412Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=1;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|LV3PR12MB9265:EE_
x-ms-office365-filtering-correlation-id: 288feb5f-1e99-4804-104a-08de838081c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|8096899003|22082099003|18002099003|56012099003|7053199007;
x-microsoft-antispam-message-info: P/JHdmwX5NecFX+ZymaZkp67z9VjDNwzW/RNwgkJ1Q3umUxe5pyPt+YI1wUJEYuF45z3L6NwLnb+XWpj6XATDz7DrllXRdx4dY9n6oLuk5WCRdNuL3po4w/5HCu4pFjQnlFUBLg3+fS8Rytmw7FS3b7+zsFgqX565xEm3haFR3sLo9R7lNrtRuSB77RtodH8YcvmKMaMuwrDLGucrMiPNoeJIgJa+DgHrMvl7yqVr2xeyxh5UB3NLggkekZMpSbA3H6G8KgDcwDydHS674ucu5kthizmejpqup9p8yURPIfJe3jKHY2gJqRQUGzLMzmPmBxFfGvOtUOFeI4P6eL8OxOCLQPA7GQtW3GBsoJyvW1Wqu5W0f5TpulwKuTDta45dRQxXTULAD2rllLWAkoKKDh50PZufnTp2a4w9kBDfmYIt8VO8CTeJl114CUsg1KmA0fr/sG5cRTQsGEIg6ctjXY9AhBKzeC1Vn3OeK1tTz6RWiG6TL3dWRJJyAf21z8mXneOsR4NGs3tovl6Af/Br/Dzw7x/no+vvqNaF1rybysNYtzv++U4D9G0Ayyiei0cSWS8QRRnjVHlsNCdq+lxEqK7nyPepJtns/+Q6tScAncO+CnlhYZ+P6FPQ+h6UVlN3nEKHdcfZU7SjcOwpbNXdgOA4W1ar8PQiG3ZPLRZjOeaZSg2ZBM1tbq161b3CBuNv9uuxIV/kSttSGLmHvNI08hczXLLShzXA4ecJg6GmM65uoV0X1ZlVYTPE9QdAWpRQYfaZEPyEFMwMfoAzgTuFXBTZWKHuKbLZHw5n0HNIew=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(8096899003)(22082099003)(18002099003)(56012099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7kK4LgRSVXBf9f89bLbeQT/dPckJuquLgQBjppBN9JI0mpxtObf++jaRKuH8?=
 =?us-ascii?Q?Q17QwdNZoAI6r0k7Q5vInjvkurm35poJiYqnvinvqHIP2uhgYZaJw1I9g6Ow?=
 =?us-ascii?Q?wt3wElgcP60EbAk/DFj5hlAmiW3bsPmxQh0lkwWFvRfTYD2lMFghLD7icSmM?=
 =?us-ascii?Q?2S6vjGEyz0KBEFMlttthXIU+L8FnP4D0cdsHdmYd/2lQr56HTOJMkLsDL4y0?=
 =?us-ascii?Q?i5iO8f3a7PlzWlMB/YRqgID/cb6jJO2WAuuu971KewL4GxHcJ6u+HDVZb4Yw?=
 =?us-ascii?Q?+1bCdoga3UZK0gzgEgnrnWShuURCOqhrF4ohmjSHY8tagI7eAUO10Nb9I5BV?=
 =?us-ascii?Q?lsxEN+zu+KcywLDtoiwGmuPWDdvwDa159xBnvh184mP10VGTeImf+iyxB9p7?=
 =?us-ascii?Q?B+XE/f3z6tYXtY+3YSyACCmxmmEwyOEpZN8TTJp4eOej/XcuBfLdOYgOwBUa?=
 =?us-ascii?Q?1s1MTPZgfTDryK5scSVxM+b/ST45u3HjszaQXrJ+aKzJW7ae45QLgfDvln5/?=
 =?us-ascii?Q?GJmoXUUevXBCOytq2yaVHD36SQvztBTW0M8Ai8nyzrEBgexmqVk7TSkNjlZH?=
 =?us-ascii?Q?RjlRWudjCNE4go6BSfdia9+s09LO8Tto2WDtdPtFPQWomNw3LTGEHDKQFgp2?=
 =?us-ascii?Q?HIZjHiNFL7RVxxdiIEjFtRqwcXWwuizgpaAY/1wUGP5JPF9ZHrIP3tB4cjqN?=
 =?us-ascii?Q?zfEO8IRmq9xPJ/alchYJQYyLCoPjCrIoNGNzk8oihubimv7K8tI15HYthcKW?=
 =?us-ascii?Q?xsU70gvhlp4ooTP8wp9PRlDmH+rFZowrzNI4iGXrsfT+I0hmA/P7yj9o5m1b?=
 =?us-ascii?Q?jb/Dpam0buJ+ER8tMxBnT5KT3z6BPkEmcGuK8OTu6bIgI2QEAb989kMTZWHs?=
 =?us-ascii?Q?iHxOKeeWWAK5IcR2b1s+nKdZ/mD0CI09CspxOaErcWXofWp0QYMmJCipYGrI?=
 =?us-ascii?Q?r+GtFhAuSQlML271+L9t6msoQpo6MY/KlTdzBAuZMHkNEYpCgQCCqXJe33o5?=
 =?us-ascii?Q?nABqGNaBYTDJTVo1wTkCzgUFAmcLVM1harsF84bRaiohUi0RNZ9bktc45Zh/?=
 =?us-ascii?Q?ZfPulH5KSFolRgrBhZz7UQEoXyWzjzB8kJqIayMLx9532pVuG70PeCNMpej4?=
 =?us-ascii?Q?Uo9huhQH2zxVCVVSo/YtKPUl9qw0P3/bCN3Euevh0iKx6iJBjEtZMnpvx0Y2?=
 =?us-ascii?Q?ngBtwcf6kEL8AHBYPqY98dlTdUFiCk+RjbUC3Iygp/AoDfBpw2h2X7o0oyjy?=
 =?us-ascii?Q?6rMfjznGu776UGxax6PS+X6Jy8SdyFLFhe9cW9QrT/B4orBjOg5FrZ5i5A7T?=
 =?us-ascii?Q?YS/YoNDAs9CufUYirLgDhhnXoXCNS4rnXi2ArtMrWrb3ZdWJ1kqL6Qedm+Q4?=
 =?us-ascii?Q?nnW90ACGiCX+87JG+ymoBgOstkBoecmc3beSKqQhiu0GFBF7K3gSGVyt033M?=
 =?us-ascii?Q?0a1DpJ7/LR6dUKuuik2tVvRUn8yVqfUCvteVRKQP9tpklfcTZ8ADcovoNYpf?=
 =?us-ascii?Q?FTYiuOrksB8HwEoPhGQV3oJO5e3gQ7YeUSKFvGjeC776pq24JA5ib5j4vNQ7?=
 =?us-ascii?Q?kJZfyl2JChzG4QjCvq2umXjS9WNd+kxqWemGXaDFmkw0OZpsgEohlgeQ2j4N?=
 =?us-ascii?Q?mJhLweNtuCIG033xlWopGi9bHX82Zp4a3sMGJ8fRedTruGvicFtPPJzFjiBE?=
 =?us-ascii?Q?w6UNdjwLQWu0+zoA4EcqigJi7KxZ0jC8c0HrD3A29pf5ZG/j?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB52842ECEDAC5FA09028CABB28B40ACH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288feb5f-1e99-4804-104a-08de838081c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 17:21:48.8537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ToCKdZF9UIvsCDhzRcPAY1HskrIipDB4/IIbGwOCsbjXQenL6xLOgQf8bf4AX9p0uSRo3tIj9Pfv9Lq3oYKxJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265
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

--_000_CH0PR12MB52842ECEDAC5FA09028CABB28B40ACH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--

Regards,
Jay
________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Monday, March 16, 2026 12:23 PM
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; ville.sy=
rjala@linux.intel.com <ville.syrjala@linux.intel.com>; Rodrigo Siqueira <Ro=
drigo.Siqueira@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Pros=
yak, Vitaly <Vitaly.Prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_mode_switch: switch to for_each=
_crtc()

Hi Jani,
On 2026-03-06 at 15:49:37 +0200, Jani Nikula wrote:
> Convert the test to use for_each_crtc() to avoid having to use
> igt_crtc_for_pipe(). Prefer crtc->crtc_index over crtc->pipe.
>
> As a side effect, fix an off-by-one in i <=3D num_pipes loop.
>
> Note: The implementation relies on the fact that on AMD hardware
> for_each_crtc() returns CRTCs in CRTC index order.
>

+cc amd developers
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Regards,
Kamil

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/amdgpu/amd_mode_switch.c | 60 +++++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 26 deletions(-)
>
> diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switc=
h.c
> index 4da07c412996..5815ec34cb12 100644
> --- a/tests/amdgpu/amd_mode_switch.c
> +++ b/tests/amdgpu/amd_mode_switch.c
> @@ -39,12 +39,12 @@ static void test_init(data_t *data)
>        igt_crtc_t *crtc;
>
>        for_each_crtc(display, crtc) {
> -             igt_output_t *output =3D &display->outputs[crtc->pipe];
> +             igt_output_t *output =3D &display->outputs[crtc->crtc_index=
];
>
> -             data->primary[crtc->pipe] =3D igt_crtc_get_plane_type(crtc,
> -                                                                 DRM_PLA=
NE_TYPE_PRIMARY);
> +             data->primary[crtc->crtc_index] =3D igt_crtc_get_plane_type=
(crtc,
> +                                                                       D=
RM_PLANE_TYPE_PRIMARY);
>
> -             data->output[crtc->pipe] =3D output;
> +             data->output[crtc->crtc_index] =3D output;
>        }
>
>        igt_require(data->output[0]);
> @@ -79,13 +79,12 @@ static void run_mode_switch_first_last(data_t *data, =
int num_pipes)
>  {
>        igt_display_t *display =3D &data->display;
>        igt_output_t *output;
> +     igt_crtc_t *crtc;
>        struct igt_fb *buffer1[MAX_PIPES] =3D { NULL };
>        struct igt_fb *buffer2[MAX_PIPES] =3D { NULL };
>        drmModeConnectorPtr conn;
>        drmModeModeInfoPtr kmode;
>        void *user_data =3D NULL;
> -     int i =3D 0;
> -     int j =3D 0;
>
>        test_init(data);
>
> @@ -94,11 +93,11 @@ static void run_mode_switch_first_last(data_t *data, =
int num_pipes)
>                      "ASIC does not have %d outputs/pipes\n", num_pipes);
>
>        /* First supported mode */
> +     for_each_crtc(display, crtc) {
> +             if (crtc->crtc_index >=3D num_pipes)
> +                     break;
>
> -     for (j =3D 0; j < num_pipes; j++) {
> -             igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, j);
> -
> -             output =3D data->output[j];
> +             output =3D data->output[crtc->crtc_index];
>                if (!igt_output_is_connected(output))
>                        continue;
>
> @@ -106,18 +105,18 @@ static void run_mode_switch_first_last(data_t *data=
, int num_pipes)
>                        data->fd, output->config.connector->connector_id);
>
>                kmode =3D &conn->modes[0];
> -             if (buffer1[j] =3D=3D NULL) {
> +             if (buffer1[crtc->crtc_index] =3D=3D NULL) {
>                        igt_fb_t fb;
> -                     buffer1[j] =3D &fb;
> +                     buffer1[crtc->crtc_index] =3D &fb;
>                        igt_create_color_fb(data->fd, kmode->hdisplay,
>                                            kmode->vdisplay,
>                                            DRM_FORMAT_XRGB8888,
>                                            DRM_FORMAT_MOD_NONE, 1.f, 0.f,
> -                                         0.f, buffer1[j]);
> +                                         0.f, buffer1[crtc->crtc_index])=
;
>                }
>                igt_output_set_crtc(output, crtc);
>                force_output_mode(data, output, kmode);
> -             igt_plane_set_fb(data->primary[j], buffer1[j]);
> +             igt_plane_set_fb(data->primary[crtc->crtc_index], buffer1[c=
rtc->crtc_index]);
>                drmModeFreeConnector(conn);
>        }
>
> @@ -126,8 +125,11 @@ static void run_mode_switch_first_last(data_t *data,=
 int num_pipes)
>
>        /* Last supported mode */
>
> -     for (j =3D 0; j < num_pipes; j++) {
> -             output =3D data->output[j];
> +     for_each_crtc(display, crtc) {
> +             if (crtc->crtc_index >=3D num_pipes)
> +                     break;
> +
> +             output =3D data->output[crtc->crtc_index];
>                if (!igt_output_is_connected(output))
>                        continue;
>
> @@ -135,17 +137,17 @@ static void run_mode_switch_first_last(data_t *data=
, int num_pipes)
>                        data->fd, output->config.connector->connector_id);
>
>                kmode =3D &conn->modes[conn->count_modes - 1];
> -             if (buffer2[j] =3D=3D NULL) {
> +             if (buffer2[crtc->crtc_index] =3D=3D NULL) {
>                        igt_fb_t fb;
> -                     buffer2[j] =3D &fb;
> +                     buffer2[crtc->crtc_index] =3D &fb;
>                        igt_create_color_fb(data->fd, kmode->hdisplay,
>                                            kmode->vdisplay,
>                                            DRM_FORMAT_XRGB8888,
>                                            DRM_FORMAT_MOD_NONE, 1.f, 0.f,
> -                                         0.f, buffer2[j]);
> +                                         0.f, buffer2[crtc->crtc_index])=
;
>                }
>                force_output_mode(data, output, kmode);
> -             igt_plane_set_fb(data->primary[j], buffer2[j]);
> +             igt_plane_set_fb(data->primary[crtc->crtc_index], buffer2[c=
rtc->crtc_index]);
>                drmModeFreeConnector(conn);
>        }
>
> @@ -153,8 +155,11 @@ static void run_mode_switch_first_last(data_t *data,=
 int num_pipes)
>                                  user_data);
>
>        /* First supported again */
> -     for (j =3D 0; j < num_pipes; j++) {
> -             output =3D data->output[j];
> +     for_each_crtc(display, crtc) {
> +             if (crtc->crtc_index >=3D num_pipes)
> +                     break;
> +
> +             output =3D data->output[crtc->crtc_index];
>                if (!igt_output_is_connected(output))
>                        continue;
>
> @@ -163,7 +168,7 @@ static void run_mode_switch_first_last(data_t *data, =
int num_pipes)
>
>                kmode =3D &conn->modes[0];
>                force_output_mode(data, output, kmode);
> -             igt_plane_set_fb(data->primary[j], buffer1[j]);
> +             igt_plane_set_fb(data->primary[crtc->crtc_index], buffer1[c=
rtc->crtc_index]);
>                drmModeFreeConnector(conn);
>        }
>
> @@ -172,9 +177,12 @@ static void run_mode_switch_first_last(data_t *data,=
 int num_pipes)
>
>        test_fini(data);
>
> -     for (i =3D 0; i <=3D num_pipes; i++) {
> -             igt_remove_fb(data->fd, buffer1[i]);
> -             igt_remove_fb(data->fd, buffer2[i]);
> +     for_each_crtc(display, crtc) {
> +             if (crtc->crtc_index >=3D num_pipes)
> +                     break;
> +
> +             igt_remove_fb(data->fd, buffer1[crtc->crtc_index]);
> +             igt_remove_fb(data->fd, buffer2[crtc->crtc_index]);
>        }
>  }
>
> --
> 2.47.3
>

--_000_CH0PR12MB52842ECEDAC5FA09028CABB28B40ACH0PR12MB5284namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<div>
<div style=3D"font-family: Calibri; text-align: left; color: rgb(0, 128, 0)=
; margin-left: 5pt; font-size: 10pt;">
[Public]</div>
<br>
</div>
Reviewed-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Jay<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kamil Konieczny &lt;k=
amil.konieczny@linux.intel.com&gt;<br>
<b>Sent:</b> Monday, March 16, 2026 12:23 PM<br>
<b>To:</b> Jani Nikula &lt;jani.nikula@intel.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;; ville.syrjala@linux.intel.com &lt;ville.syrjala@linux.intel.com&gt;; R=
odrigo Siqueira &lt;Rodrigo.Siqueira@amd.com&gt;; Pillai, Aurabindo &lt;Aur=
abindo.Pillai@amd.com&gt;; Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;<b=
r>
<b>Subject:</b> Re: [PATCH i-g-t] tests/amdgpu/amd_mode_switch: switch to f=
or_each_crtc()</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Jani,<br>
On 2026-03-06 at 15:49:37 +0200, Jani Nikula wrote:<br>
&gt; Convert the test to use for_each_crtc() to avoid having to use<br>
&gt; igt_crtc_for_pipe(). Prefer crtc-&gt;crtc_index over crtc-&gt;pipe.<br=
>
&gt; <br>
&gt; As a side effect, fix an off-by-one in i &lt;=3D num_pipes loop.<br>
&gt; <br>
&gt; Note: The implementation relies on the fact that on AMD hardware<br>
&gt; for_each_crtc() returns CRTCs in CRTC index order.<br>
&gt; <br>
<br>
+cc amd developers<br>
Cc: Rodrigo Siqueira &lt;Rodrigo.Siqueira@amd.com&gt;<br>
Cc: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
Cc: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; Signed-off-by: Jani Nikula &lt;jani.nikula@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/amdgpu/amd_mode_switch.c | 60 +++++++++++++++++++---------=
------<br>
&gt;&nbsp; 1 file changed, 34 insertions(+), 26 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_sw=
itch.c<br>
&gt; index 4da07c412996..5815ec34cb12 100644<br>
&gt; --- a/tests/amdgpu/amd_mode_switch.c<br>
&gt; +++ b/tests/amdgpu/amd_mode_switch.c<br>
&gt; @@ -39,12 +39,12 @@ static void test_init(data_t *data)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_t *crtc;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_crtc(display, crtc)=
 {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_output_t *output =3D &amp;display-&gt;outputs[crtc-&gt;pipe];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_output_t *output =3D &amp;display-&gt;outputs[crtc-&gt;crtc_index];=
<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;primary[crtc-&gt;pipe] =3D igt_crtc_get_plane_type(crtc,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; DRM_PLANE_TYPE_PRIMARY);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;primary[crtc-&gt;crtc_index] =3D igt_crtc_get_plane_type(crtc,=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_PLANE_TYPE_PRIMARY)=
;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;output[crtc-&gt;pipe] =3D output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;output[crtc-&gt;crtc_index] =3D output;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(data-&gt;output[=
0]);<br>
&gt; @@ -79,13 +79,12 @@ static void run_mode_switch_first_last(data_t *dat=
a, int num_pipes)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &=
amp;data-&gt;display;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_t *crtc;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb *buffer1[MAX_P=
IPES] =3D { NULL };<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb *buffer2[MAX_P=
IPES] =3D { NULL };<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeConnectorPtr conn;<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfoPtr kmode;<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *user_data =3D NULL;<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; int j =3D 0;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_init(data);<br>
&gt;&nbsp; <br>
&gt; @@ -94,11 +93,11 @@ static void run_mode_switch_first_last(data_t *dat=
a, int num_pipes)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ASIC does not=
 have %d outputs/pipes\n&quot;, num_pipes);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* First supported mode */<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_crtc(display, crtc) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (crtc-&gt;crtc_index &gt;=3D num_pipes)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; num_pipes; j++) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, j);<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; output =3D data-&gt;output[j];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; output =3D data-&gt;output[crtc-&gt;crtc_index];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (!igt_output_is_connected(output))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e;<br>
&gt;&nbsp; <br>
&gt; @@ -106,18 +105,18 @@ static void run_mode_switch_first_last(data_t *d=
ata, int num_pipes)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&g=
t;fd, output-&gt;config.connector-&gt;connector_id);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; kmode =3D &amp;conn-&gt;modes[0];<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (buffer1[j] =3D=3D NULL) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (buffer1[crtc-&gt;crtc_index] =3D=3D NULL) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fb_=
t fb;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buffer1[j] =3D &amp;fb;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buffer1[crtc-&gt;crtc_i=
ndex] =3D &amp;fb;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_cre=
ate_color_fb(data-&gt;fd, kmode-&gt;hdisplay,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmode-&gt;vdisplay,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_XRGB8888,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_MOD_NONE, 1.f, 0.f,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 0.f, buffer1[j]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 0.f, buffer1[crtc-&gt;crtc_index]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_output_set_crtc(output, crtc);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; force_output_mode(data, output, kmode);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fb(data-&gt;primary[j], buffer1[j]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fb(data-&gt;primary[crtc-&gt;crtc_index], buffer1[crtc-&g=
t;crtc_index]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; drmModeFreeConnector(conn);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; @@ -126,8 +125,11 @@ static void run_mode_switch_first_last(data_t *da=
ta, int num_pipes)<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Last supported mode */<br=
>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; num_pipes; j++) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; output =3D data-&gt;output[j];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_crtc(display, crtc) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (crtc-&gt;crtc_index &gt;=3D num_pipes)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; output =3D data-&gt;output[crtc-&gt;crtc_index];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (!igt_output_is_connected(output))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e;<br>
&gt;&nbsp; <br>
&gt; @@ -135,17 +137,17 @@ static void run_mode_switch_first_last(data_t *d=
ata, int num_pipes)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&g=
t;fd, output-&gt;config.connector-&gt;connector_id);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; kmode =3D &amp;conn-&gt;modes[conn-&gt;count_modes - 1]=
;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (buffer2[j] =3D=3D NULL) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (buffer2[crtc-&gt;crtc_index] =3D=3D NULL) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fb_=
t fb;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buffer2[j] =3D &amp;fb;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buffer2[crtc-&gt;crtc_i=
ndex] =3D &amp;fb;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_cre=
ate_color_fb(data-&gt;fd, kmode-&gt;hdisplay,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmode-&gt;vdisplay,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_XRGB8888,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_MOD_NONE, 1.f, 0.f,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 0.f, buffer2[j]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 0.f, buffer2[crtc-&gt;crtc_index]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; force_output_mode(data, output, kmode);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fb(data-&gt;primary[j], buffer2[j]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fb(data-&gt;primary[crtc-&gt;crtc_index], buffer2[crtc-&g=
t;crtc_index]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; drmModeFreeConnector(conn);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; @@ -153,8 +155,11 @@ static void run_mode_switch_first_last(data_t *da=
ta, int num_pipes)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; user_data);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* First supported again */<=
br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; num_pipes; j++) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; output =3D data-&gt;output[j];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_crtc(display, crtc) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (crtc-&gt;crtc_index &gt;=3D num_pipes)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; output =3D data-&gt;output[crtc-&gt;crtc_index];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (!igt_output_is_connected(output))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e;<br>
&gt;&nbsp; <br>
&gt; @@ -163,7 +168,7 @@ static void run_mode_switch_first_last(data_t *dat=
a, int num_pipes)<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; kmode =3D &amp;conn-&gt;modes[0];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; force_output_mode(data, output, kmode);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fb(data-&gt;primary[j], buffer1[j]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fb(data-&gt;primary[crtc-&gt;crtc_index], buffer1[crtc-&g=
t;crtc_index]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; drmModeFreeConnector(conn);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; @@ -172,9 +177,12 @@ static void run_mode_switch_first_last(data_t *da=
ta, int num_pipes)<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_fini(data);<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt;=3D num_pipes; i++) {<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_remove_fb(data-&gt;fd, buffer1[i]);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_remove_fb(data-&gt;fd, buffer2[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_crtc(display, crtc) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (crtc-&gt;crtc_index &gt;=3D num_pipes)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_remove_fb(data-&gt;fd, buffer1[crtc-&gt;crtc_index]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_remove_fb(data-&gt;fd, buffer2[crtc-&gt;crtc_index]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -- <br>
&gt; 2.47.3<br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_CH0PR12MB52842ECEDAC5FA09028CABB28B40ACH0PR12MB5284namp_--
