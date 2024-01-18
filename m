Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5856C47DAF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 10:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C13F10E095;
	Thu, 18 Jan 2024 10:16:40 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11E910E724
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 10:16:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3bgNfa4x8Y39RpdtFDq42wpLnK9aU4fXdsfIFntMTpBO5LBy5cPY4En9bO117c8Z2f1IX2dtk25u4YnulSoUpiYd9rI13sgyMBLaoGXDxmwdiCo9s40xUNj27mXxIPFYh1925z9/d0t7b3nif1qXCC/fF05OWtwSaou/MnaYfHgcepos+/UehX83O06IShYrCaja1h9idNLZYHmZ9xvb2CylKLy0hOrlqINmDp4yLAExMufPfUZ4Jx1gcC4Xec40wrEsuf2iWl5Zwrjq3WE7Hd8CQ4ZoyzqrmZzzMr3n+PiqApPetNApDjcHzIYcH6Vhg5g2Qn8nH+YpbCXM6Aoew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDa2B9OgCUs92DykXnGZ22Iq2SWXMgBYpmGxIgOUh2A=;
 b=LY+RPwMxKKurQ4G8neSIvsrvmVzdnBL2PcQwlMTMp+u2enbTVp6Zmyy34V3on91A4uskR5DBcFe4Cw/Vb1rAGJMdkGxFex1JR3mau8zZX+N1mQbHUS/exGlmBOXtGrfd3fBCe8CkyJfjycEG2DBSe/jpxDQ5Rd0jLUXUhgO8oJ5+nsCKJ1yicUzXxI81WwnAOF2LrTAYuXYXY4LT0NNPK/EiYMcyg6vBbfdLzzYlh89Thjm+Jhvpu3nSg4lO7OKQbFUfDO/1bOQ7aQt9y/EHvm08DAJJTPL12GKV4vNoRO26/5OfDuyTQRwu3FeMqIe/go5fGTQCMSRAUaYpfge6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDa2B9OgCUs92DykXnGZ22Iq2SWXMgBYpmGxIgOUh2A=;
 b=g7/UiJQta4j6YKbdZRgRXt1/DIjk/56vx8kbn7aCbgbTMg4+MFC4Brt/OTU0mZ/qjEk3Ul9AtJwIiv4qGn81oteoko9aK9CIRcVmUY9qV+LCxiZShHw/RgbVw3JpMz8nlnWzE4rYrrdrbOEHW6klBXg/1flRlPGkgGZeqcc7aME=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by DM4PR12MB6640.namprd12.prod.outlook.com (2603:10b6:8:8f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 10:16:18 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::757e:5fd4:6336:43f9]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::757e:5fd4:6336:43f9%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 10:16:18 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
Subject: RE: [PATCH 3/3] [i-g-t] tests/amdgpu/amd_ilr: Fix psr edp rx crc read
 timeout
Thread-Topic: [PATCH 3/3] [i-g-t] tests/amdgpu/amd_ilr: Fix psr edp rx crc
 read timeout
Thread-Index: AQHaSbcf6F42HKt1J0WPQX4uAnB/kLDfWM6Q
Date: Thu, 18 Jan 2024 10:16:18 +0000
Message-ID: <CO6PR12MB548902BF0BC1ADB06BF1AE33FC712@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240118023608.55865-1-hersenxs.wu@amd.com>
 <20240118023608.55865-3-hersenxs.wu@amd.com>
In-Reply-To: <20240118023608.55865-3-hersenxs.wu@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=a41ad1da-6a55-4807-a07e-2aa678b72365;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-01-18T10:07:30Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|DM4PR12MB6640:EE_
x-ms-office365-filtering-correlation-id: 2963b3d1-c22c-4924-fbfa-08dc180e8303
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y+JsPTHnvvkvtWRYGv7zWwqjAYyvWsU5OTBFJet2YMjVHmv/HHMAnEbyGYSC2f6c46O8h14qpeFI8pdLWBrH0efmGS9sE4+YjO55Cda3AHHssAckuqPl+2iYxIg07rSAkQueIdG16N5Yca+UgD+fshG8OCsoLz1cxc3F0oAJ7Z89//IyDd5E7OfzctjwUQlh14BuTdvAhVpCT0lKy/JjIPwN8v9xsXC5qvu0rO+w0DMNxrx541DlSRY8XirmHmQxnt016t/E63uxUpadNAdHE4j4J+mS8FoxSFl4IbjdasXXWYMrr+lj426nE9Sgb9TyTBSlqcJfMN0K+3fWMadv2K1d0vQtHHXrSs0CovJ7K3UEM5pi7jZ7MxFv9H1OlNGDeEHH6POroXXxU+W7db+k/AFKukNTFiYEM37XPBA41hh/mMw9pDrMPIsrFdTFVvoiFpFkdcpNXdK0LXRMZ7S6Jj/k/jdhlqvIAMwKcqbNLOhlKgWceVs4eDt2/JHA/DIDBC9TSvf30IzjnhDyg4DP7vQblxiDWQNXDDRigkHQH62SY2aXIpOvdKW8Z37L9//CSp4hFBH7nGMJbSLae250BPlFeUE4O7IMISHmUW+9jSFCaeWNnN68OfCqxgysATv5T2zRzZuEflh4wdmXGVZ+Vg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(86362001)(478600001)(9686003)(55016003)(53546011)(316002)(41300700001)(71200400001)(2906002)(55236004)(6506007)(33656002)(7696005)(38070700009)(66446008)(66946007)(66476007)(5660300002)(6636002)(76116006)(54906003)(66556008)(64756008)(83380400001)(110136005)(921011)(38100700002)(4326008)(8676002)(8936002)(52536014)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VwuBWExvuzQP0GggS3TC64PAhmHMxwLO1ceXRJtNA9/ZZeZ0Jf7hV+XCMlCe?=
 =?us-ascii?Q?LDAEgHoS5ApKd8+2tAIc8Eyve88ymTdjZ8L2Ng38wvuk8uFDBLEXybUEB/zw?=
 =?us-ascii?Q?smnzAmy3qcuM5XjlLkquNHmKFBIUoDjkhEo64xt/ztfX1YYx1WmjikL14pzH?=
 =?us-ascii?Q?8spG7s7KVd7Pfru5DAi2NWjyNOkRSoUCxLOjnsxypkn/ZfSttrHBthFPxjeo?=
 =?us-ascii?Q?nVkPGyUEkhos0zRFp/AJLkB1+2uuW5poXqOYF5vfkG2ZOvP8HIEwb4VLAT2U?=
 =?us-ascii?Q?ycBo74994WhC55ReBQIGL4757skHFnrWrc5ui4+TIliianoASEmI0BnXyHYq?=
 =?us-ascii?Q?6Xz7mBu/pmGnS0UWFtItT1u/zfHiHUgK4CRiALpxzOMHoZjvz4d4gVPZMuZH?=
 =?us-ascii?Q?xplUhaf/moQy6zy2WWopt3KTg1Vu1OxdlX+6vSj7eO9hQ1AYN+Q7+GXQRMUP?=
 =?us-ascii?Q?FjmhYQCli4eBanK1qs1al9PH/cTsg2g14WuJqyBCIUx18zrVwo5NJCvOJgOh?=
 =?us-ascii?Q?t994OsuVZnffpboUR1BaOo0bAjYKRVYO4J1EJZfGNt/W7/mSYzbMBKbx6hCd?=
 =?us-ascii?Q?8pQ3uYcs7co/SfsrwovxCfkD2jSacBoCo+SCSivvvCXCgKbNokhW3l7d70oB?=
 =?us-ascii?Q?g5DkPRMtEMDE4nPFfSC+ZJiaTtkTuDUA6GnJPXRakTDGNtnQEWlgVLtQqLlj?=
 =?us-ascii?Q?3I0zUHOOSyrqz3QJVm8icNJ9S121+REMsuft1Nbi0m5K+pLaGRFbMq3v+g+N?=
 =?us-ascii?Q?x/IcnhymuCXpA36RCYHQmVSGUQdw/LE2jab/UbHMkXPBZnqNSPQ56tWqcET2?=
 =?us-ascii?Q?xIQjI2Ty0udcDGoJkySTAcRV8TicUxTRc+rIMT0KqtHER12xAKGL6aQRPYJQ?=
 =?us-ascii?Q?nhsBnOnvb19FBRKLbTPNJM6CwIjcIucbozvNZqktZ1DRHVy0nu/FtpSYfzPe?=
 =?us-ascii?Q?h9Ai24clvurk3OHAd8mL9afi7qKHfqV4ZwNEz8gzX8va3akSGIZdQ2cX/GsE?=
 =?us-ascii?Q?CXws7AKOvtSTZw2JHNOilJFIbyNCwHhqQNDupK73zoegv20Az6GNHf9ftxDx?=
 =?us-ascii?Q?loyesiw4tZQb2gVIiDjGrE8DRO5B5+BDySjFs1CdfWyOxLLJmkWMP1VqPsaj?=
 =?us-ascii?Q?GH1bSoiAxrim92PpVdNn9gfhDCQGxVvJ57T61mFbkdL6gMEanNW0+pDuB8hN?=
 =?us-ascii?Q?6AL3+TPWgeewynPGMXKZ1405+A3x9iVKuFaL9XMRicq3xF8Bz37vqyioYzUC?=
 =?us-ascii?Q?wkmn4VePc1Se07kvzFJPmCdH8KoOhHsoQLGigVLOhs3sqYJhqjgAUv0QEfyr?=
 =?us-ascii?Q?uEz7PWMwmObO8cnXUMsA4FGRUWd1jpa3EImOWjQ9IZpbROdNRSJZCKSztXEs?=
 =?us-ascii?Q?chmq0jEB9vbrfePk+nRII5mOzK93+6HVMmA1EPnK1aFtII2AFSdeFipCyfDh?=
 =?us-ascii?Q?lM8b8z6bUX0E+WHY6U3MIGf5E4vB+2q4d6e3DGrV29j7kj+oRJjfIXz5Ec7E?=
 =?us-ascii?Q?Ui859fNXKFvec0LAbbOFuZOtcM9UGuGo4q1PJXJKPro2vpEhCpTO/Nw02EMc?=
 =?us-ascii?Q?Bm6wLjAKXhZotn0MkSI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2963b3d1-c22c-4924-fbfa-08dc180e8303
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 10:16:18.5977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vic/RFZuXAvRJqAVlNwWqbY2vMRyoYbByU83YclPFQKrms6+AVQIj5jR6cpICWQDO4cbvdQqSkyRisbUIupYfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6640
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

> -----Original Message-----
> From: Hersen Wu <hersenxs.wu@amd.com>
> Sent: Thursday, January 18, 2024 10:36 AM
> To: igt-dev@lists.freedesktop.org; Siqueira, Rodrigo
> <Rodrigo.Siqueira@amd.com>; Pillai, Aurabindo
> <Aurabindo.Pillai@amd.com>; Hung, Alex <Alex.Hung@amd.com>; Mahfooz,
> Hamza <Hamza.Mahfooz@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
> Cc: markyacoub@google.com; Wu, Hersen <hersenxs.wu@amd.com>
> Subject: [PATCH 3/3] [i-g-t] tests/amdgpu/amd_ilr: Fix psr edp rx crc rea=
d
> timeout
>
> With debugfs disallow_edp_enter_psr, disable edp psr before tx read rx cr=
c.
>
> With set_all_output_pipe_to_none of test_init, tx write dpcd 0x600=3D2. t=
his
> will let dpcd 0x170=3D0.
> rx psr and crc check for rx internal logic are disabled.
> with disallow_edp_enter_psr, when set test patterns are committed by
> igt_display_commit_atomic, kernel driver will turn on edp with dpcd 0x170=
=3D0.
> then tx read rx crc successfully.
>
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>  tests/amdgpu/amd_ilr.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c index
> b2c0f294d..1f048d665 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -205,11 +205,32 @@ static void test_flow(data_t *data, enum sub_test
> option)
>                       continue;
>               }
>
> +             /* igt_amd_output_has_ilr_setting check if debugfs exist,
> +              * but ilr settings could be all 0s -- not supported.
> +              * need check if ilr settings values are supported.
> +              */
> +             igt_amd_read_ilr_setting(data->drm_fd, output->name, data-
> >supported_ilr);
> +             if (data->supported_ilr[0] =3D=3D 0)
> +                     continue;
> +
>               igt_info("Testing on output: %s\n", output->name);
>
>               /* Init only if display supports ilr link settings */
>               test_init(data, output);
>
> +             /* with set_all_output_pipe_to_none within test_init,
> +              * kernel driver tx write dpcd 0x600=3D2 to rx. edp rx
> +              * exit psr state and stop verify crc from main link.
> +              * with disabllow edp enter psr within kernel, when run

Typo: disabllow

> +              * set test pattern, display is turned on. kernel driver
> +              * tx will not notify rx psr enable and crc checking by
> +              * rx. by this, when tx want to read crc from rx, rx will
> +              * check crc and response right away. timeout will not
> +              * happens.
> +              */
> +             if (option =3D=3D ILR_POLICY)
> +                     igt_amd_disallow_edp_enter_psr(data->drm_fd,
> output->name, true);

I think can just disable psr. Don't have to specify the option.
Other than that, lgtm. Thanks!

> +
>               mode =3D igt_output_get_mode(output);
>               igt_assert(mode);
>
> @@ -243,6 +264,10 @@ static void test_flow(data_t *data, enum sub_test
> option)
>               igt_remove_fb(data->drm_fd, &data->fb);
>
>               test_fini(data);
> +
> +             /* restore allow kernel driver eDP PSR */
> +             if (option =3D=3D ILR_POLICY)
> +                     igt_amd_disallow_edp_enter_psr(data->drm_fd,
> output->name, false);
>       }
>
>  }
> --
> 2.25.1
--
Regards,
Wayne Lin

