Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E57C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 15:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3A310E855;
	Thu, 18 Jan 2024 15:04:00 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2082.outbound.protection.outlook.com [40.107.95.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB36A10E87E
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 15:03:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNlk3JpXiYjRdPlqX5yoz0kHP2Le8iVnCmmik2gFTTo6jB+DS3/yY+P5xcvIHlaw2q35k7ng3XIqgtF5qTOCzG6qNHHEdUj0f7B7eEW0FEqKI2GqRdQJeB0TE1OlAGE0oHsRY3ONiW8aZjZK3L4MtiuIuPHiT1TEXCyVGA6RzXxYs6MvcDqlG7euvLSVEEmVdta4hAOxCi3tFCbH/qEqLfxOuB/ggDmd8TamQqg203P9LEolGmW+Xm9MN5UTcZrCMhoGa3XFYOlzhYxIAIxVEArpo1/WaRKETuhAyTVGn8omTe+kxBEArRF3lYD2wEcGYGRs7opZiUlt3Twj7avykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3DNx12sCx/YRZfKN+3rG3GcIlYW3vdRiwdukmoTkVg=;
 b=JBqVydYlDfTNwBncXSOXLJcIr6jv3HMQLEJ5CJXGDKnhORD3GF8XoxvMTHOCdXbZS8hxz6k+9tixXaIeh/EqHlhCJb7CrQkVFVyonuniWxsCvvQilkzyL4UeukbRrKR3l7Z4T0wQcF0De1cejSww7kZesU/88abJC1jGsEKh/5BqNThNExAjzcHH4gFeZiLZNysLAC6SoOMDP/AlV3GIE7dXe2fI6aiZe948cvzBflscIr3JICxLQVgTK5B6cUTnU8P1tuvh7bKjXwIaAIMzahS20aVDzX0RfC496JimnwwF3Fk9JqeeEPf1KgwdB1KCayQJ2EZ02uhY07kFLsNM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3DNx12sCx/YRZfKN+3rG3GcIlYW3vdRiwdukmoTkVg=;
 b=gfA6TDplGPvBQGUEBtRKsbkTCufGulm5Ro3mmBLPPOdwUdvPrCVihFzSL+nBJxHvbvgoIJCE4RXegg9VXzw9ZxLHCSkLTJK+gr5iOZSMVjQ25evOEFNaf+PIuoYaUc/Vba/eGCpj94n6queWeta3hBS8Y4NjkkjhVeUY1DJYEFk=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CH2PR12MB5018.namprd12.prod.outlook.com (2603:10b6:610:6e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 15:03:36 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::757e:5fd4:6336:43f9]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::757e:5fd4:6336:43f9%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 15:03:36 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
Subject: RE: [PATCH 1/3] [i-g-t] lib/igt_amd: add debugfs disallow edp enter
 psr
Thread-Topic: [PATCH 1/3] [i-g-t] lib/igt_amd: add debugfs disallow edp enter
 psr
Thread-Index: AQHaShBYaxL33ONqpkmER0ZVoarkhrDfqc2A
Date: Thu, 18 Jan 2024 15:03:36 +0000
Message-ID: <CO6PR12MB548963D0DB220D184CF6EF66FC712@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240118131454.19652-1-hersenxs.wu@amd.com>
In-Reply-To: <20240118131454.19652-1-hersenxs.wu@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=09fc7e74-5e36-4f2d-8eed-6f00ba827e13;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-01-18T14:59:56Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|CH2PR12MB5018:EE_
x-ms-office365-filtering-correlation-id: 2f840764-4695-491f-924e-08dc1836a5be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B3OO4gbvnpFJPjuUeQzMTKfLOy4YWwUjAzEr8p3vfc3oLxGAPQYiwbeUdmYo2w/h1ioBk4dtShYyAFmWPos9Bx34NcPgTanNXLCGZ4pjHpa5ydSzO28Aai3lJymlXw42FHvwViLqsYLV8PStWhsmTh4OhL0iLmW+W0Hp4fiFPQLgYxhEOPgiHb9OkDgqeZU6kEBJ93irsYZJoZz5xrtRjdq/j1I1GsviBuIjWkml7/DI7e03Wylp3ziHKHQiJ5ysgVQsISw8YNXrME0RZPA+Clrq0+5kOCuMLabFiJNcaTNbRu89AHVXwYN7J3IeYwbd9TgeD9Q6XOGbPImUZYRQDM5/vV1wM3E7Fz0L5m5omlM3srLkNzMcPX4pPRmKqb4uOQptMEVVPmMt0eR8jvAqBVj1JzqR6HGkuurEyvK0ES+VbwnjIRxBkbTkSFdTIpKpP77/XP7qqEsEu8YzTrhdOsyX/GyrpmPJv8pYYcg/tMmnZVF7wcJo9brEZ3VT5UMA2qmKm/sluql6I86kotrisOP7CC3qUCO+K8kvY/YCxfngEOZoMZDDvutAFwdZ/DM+w+XeA/dGS93HyPHYuGP2RqNNTLoEqB5rf1/2uyasdIkld8S1fsyE0TEaoWvrqvmEwI7O3Tf56u7bf433opLXiA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(83380400001)(9686003)(6506007)(7696005)(53546011)(55236004)(38100700002)(122000001)(5660300002)(4326008)(8936002)(8676002)(52536014)(110136005)(54906003)(2906002)(478600001)(71200400001)(316002)(6636002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(921011)(86362001)(33656002)(38070700009)(55016003)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EPTEK85S5kf6zmLtyREp75ZbS6/wBmM845FMtrP7jPXe4yPTsa8ZAMVpwr8M?=
 =?us-ascii?Q?6Tb5nULV9iDJqboQclTyOLl+vWzFemDbVFRYGVOA3id8Mi6V5E9I0QvXwqN9?=
 =?us-ascii?Q?k7cbmPSmdMJmxp44DzGRO4d6XS9/NbCj7qHxYaBoUvpmvZX2j8VidlrZuss6?=
 =?us-ascii?Q?g1QJE2hMXqmeazOls2uDZIWjxNrCTMIIoGEx8omSNxcjGoHDwU9aH9Md8JM+?=
 =?us-ascii?Q?CYyyoUrdSHRehxq+K3htXsjPdyiBGyuOoaE1NVnQbTib7fh4sXBSgYRFEbJY?=
 =?us-ascii?Q?PXSfini80vaOOGoZF0gSymfiad8LeLDrRcyWCCt5hrEnQfnjuldy0P5C52Nb?=
 =?us-ascii?Q?okTgA5TbRV/ktTFQmWL6YAM/64n7fuaW74fel5XoeJhWJweLXjR9Pgieos9c?=
 =?us-ascii?Q?EizDmYl35MKX+h851JosCgbzVlvCV/gQVl9+YBhTCqf8NifsBb21vguuiNCm?=
 =?us-ascii?Q?Qqid9cvOx6kDUY3xm7IZMd0Nho7sGW1hYI4gG7vCJH+5dcalKD6uCnChdG5u?=
 =?us-ascii?Q?K7SDpF0uDwbvsVxEOYcKGfkSJd70tGNCGi5HBDarIbFXvNhd9n1pSNHpezYh?=
 =?us-ascii?Q?nrDcyojr27PeYTdFcEJ067e9t5hk0ajZ98/GzeNG2m0mw4N2JAxYRK5/8xYh?=
 =?us-ascii?Q?hJwXJkSTjNRTDeGidA4blHK0I92dLBJRSVrlgvIHNWInacCFBYET2D/Dli2s?=
 =?us-ascii?Q?NiNtz3XojqL3x9URfLC2JWCNYAlaM4ZAhz/Bi0Uvvdz5lrYlamv5ek8pe5yA?=
 =?us-ascii?Q?RqZFGCEM6iMXZ05dmUGIiQulR/rO5Mjr0Fc+Yg3HXwFFB8jA43hE+fib0aEy?=
 =?us-ascii?Q?Kknf0UjvF+8hGx/ecHXrK76fr/S4iFnQFXCCrrqasHVcI/nSF4STUUhCz3Z9?=
 =?us-ascii?Q?fLhAyNbQ3f+ydEoM2Z7A48dPt//1JbBN0E1+Sdw8TJCYn2h0RViIMKTG8QcF?=
 =?us-ascii?Q?4MU2TTr/o8MQULvssJT7WPWmvT4aiPO99el1ilzCzdUQ0jgQX+YmOvyAmTN8?=
 =?us-ascii?Q?lUTVCTvl4paxRZGvcYkdhp4xrb/T9K34eu7Kz/bR1Na40XbBXr68yKWWDsrK?=
 =?us-ascii?Q?vZgnels+A4uHRinS4w2n5Qd7GdwjdUdctAw2voRGWoKvH/NkeMlfLjGIxNxN?=
 =?us-ascii?Q?CQgpFwZaA/Egoog4soNOLLuKOJdoJUlnr2V2gxb6cS0u1X12+8Hwbqlqt6LI?=
 =?us-ascii?Q?PdKuXSNPeNYMMFJJo8jLhZeBPV3Gz3lfgLytWaaviVDWoNF0Jusq3jKEMqjj?=
 =?us-ascii?Q?DvkiEldfJDdQ2gUvJGYqOl/jGjaoa4Li9p5cCnrThDAcSK94vR/ceSANvMDh?=
 =?us-ascii?Q?+iCf9lT+SoEIzuvHlLQOyJ2uwACWUA6Mgh87BPli4Fvh9augXLlev0O+iQyO?=
 =?us-ascii?Q?9SodHvjmAZfaVkcaQ3+VtfpTvJ06G2IEQGbTwmpUgZrXytHBd2pKQjSN0bcq?=
 =?us-ascii?Q?gtrCZQx/FU+kQ/Bor4QsamL0EebC+P7ApxdARadKSR2/6d8zkflcfchGsFdt?=
 =?us-ascii?Q?tj6Xy/XUDISimgHu6+ZnPIzW/CqgWA35Qen/lhrupUYu34/geqnDMTBEmtgu?=
 =?us-ascii?Q?DmSSxNHgzQ1kX61bqVM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f840764-4695-491f-924e-08dc1836a5be
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 15:03:36.7547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N49OXeNf7+zi9kzKbG3+B4yu95BGIOC6TASX5nQDH1GgSwTE276Vu3L1qZFu4cByLJ2J6Sxr2hDdCNAh/UpQ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5018
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
Cc: "Wu, Hersen" <hersenxs.wu@amd.com>,
 "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

[Public]

Series lgtm.

Reviewed-by: Wayne Lin <wayne.lin@amd.com>

> -----Original Message-----
> From: Hersen Wu <hersenxs.wu@amd.com>
> Sent: Thursday, January 18, 2024 9:15 PM
> To: igt-dev@lists.freedesktop.org; Siqueira, Rodrigo
> <Rodrigo.Siqueira@amd.com>; Pillai, Aurabindo
> <Aurabindo.Pillai@amd.com>; Hung, Alex <Alex.Hung@amd.com>; Mahfooz,
> Hamza <Hamza.Mahfooz@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
> Cc: markyacoub@google.com; Wu, Hersen <hersenxs.wu@amd.com>
> Subject: [PATCH 1/3] [i-g-t] lib/igt_amd: add debugfs disallow edp enter =
psr
>
> When igt app call this debugfs, it will pass disable flag to kernel. The =
flag  will
> block psr setup and enable.
>
> When igt read psr edp rx crc, read may be timeout.
> After bootup, AMD kernel driver setup psr with dpcd 0x170 =3D 5.
> this notify rx psr enable and let rx fw start checking crc for rx fw inte=
rnal logic.
> rx fw may not update crc read count within dpcd 0x246. read count is alwa=
ys
> 0. this  will lead tx crc reading timeout.
>
> With IGT app sequence below, rx fw crc checking for rx internal logic is =
disabled.
> upon tx read rx crc, rx fw will check crc and update crc count within dpc=
d
> 0x246. so IGT app can read rx crc successfully.
>
> expected app sequence is as below:
> 1. disable eDP PHY and notify eDP rx with dpcd 0x600 =3D 2.
> 2. echo 0x1 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr
> 3. enable eDP PHY and notify eDP rx with dpcd 0x600 =3D 1 but
>    without dpcd 0x170 =3D 5.
> 4. read crc from rx dpcd 0x270, 0x246, etc.
> 5. echo 0x0 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr.
>    this will let eDP back to normal with psr setup dpcd 0x170 =3D 5.
>
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>  lib/igt_amd.c | 49
> +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_amd.h |  2 ++
>  2 files changed, 51 insertions(+)
>
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c index 247a42f37..d0b53c08a
> 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1153,6 +1153,55 @@ void igt_amd_allow_edp_hotplug_detect(int
> drm_fd, char *connector_name, bool ena
>       close(hpd_fd);
>  }
>
> +/**
> + * igt_amd_disallow_edp_enter_psr: notify kernel skip edp psr setup and
> +enable
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name
> + * @enable: skip kernel eDP psr setup and enable -- disallow edp enter
> +psr
> + * example usage: disallow psr
> + * echo 0x1 >
> + * /sys/kernel/debug/dri/0/eDP-1/disallow_edp_enter_psr
> + *
> + * expected IGT sequence is as below:
> + * 1. disable eDP PHY and notify eDP rx with dpcd 0x600 =3D 2.
> + *    for example, kmstest_set_connector_dpms off will do this.
> + * 2. echo 0x1 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr
> + * 3. enable eDP PHY and notify eDP rx with dpcd 0x600 =3D 1 but
> + *    without dpcd 0x170 =3D 5.
> + *    for example, kmstest_set_connector_dpms on will do this.
> + * 4. read crc from rx dpcd 0x270, 0x246, etc.
> + *    igt_pipe_crc_collect_crc will do this.
> + * 5. echo 0x0 /sys/kernel/debug/dri/0/eDP-X/disallow_edp_enter_psr.
> + *    this will let eDP back to normal with psr setup dpcd 0x170 =3D 5.
> + */
> +void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name,
> +bool enable) {
> +     int fd, ret, wr_len;
> +     const char *allow_edp_psr =3D "1";
> +     const char *dis_allow_edp_psr =3D "0";
> +
> +     /* if current psr is not enabled, skip this debugfs */
> +     if (!igt_amd_psr_support_drv(drm_fd, connector_name,
> PSR_MODE_1) &&
> +             !igt_amd_psr_support_drv(drm_fd, connector_name,
> PSR_MODE_2))
> +             return;
> +
> +     fd =3D igt_debugfs_connector_dir(drm_fd, connector_name,
> O_RDONLY);
> +     igt_assert(fd >=3D 0);
> +     ret =3D openat(fd, DEBUGFS_DISALLOW_EDP_ENTER_PSR, O_WRONLY);
> +     close(fd);
> +     igt_assert(ret >=3D 0);
> +
> +     if (enable) {
> +             wr_len =3D write(ret, allow_edp_psr, strlen(allow_edp_psr))=
;
> +             igt_assert_eq(wr_len, strlen(allow_edp_psr));
> +     } else {
> +             wr_len =3D write(ret, dis_allow_edp_psr,
> strlen(dis_allow_edp_psr));
> +             igt_assert_eq(wr_len, strlen(dis_allow_edp_psr));
> +     }
> +
> +     close(ret);
> +}
> +
>  static bool get_dm_capabilities(int drm_fd, char *buf, size_t size)  {
>       int ret, fd;
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h index 254b5d37b..6780b99de
> 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -50,6 +50,7 @@
>  #define DEBUGFS_EDP_PSR_CAP  "psr_capability"
>  #define DEBUGFS_EDP_PSR_STATE        "psr_state"
>  #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT
> "allow_edp_hotplug_detection"
> +#define DEBUGFS_DISALLOW_EDP_ENTER_PSR "disallow_edp_enter_psr"
>
>  /* amdgpu DM interface entries */
>  #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
> @@ -194,6 +195,7 @@ bool igt_amd_psr_support_drv(int drm_fd, char
> *connector_name, enum psr_mode mod  bool
> igt_amd_output_has_psr_state(int drm_fd, char *connector_name);  int
> igt_amd_read_psr_state(int drm_fd, char *connector_name);  void
> igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool
> enable);
> +void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name,
> +bool enable);
>
>  /* DM interface helpers */
>  bool igt_amd_has_visual_confirm(int drm_fd);
> --
> 2.25.1
--
Regards,
Wayne Lin

