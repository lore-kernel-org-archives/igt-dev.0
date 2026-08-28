Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB55BC61DBD
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 14:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D8A10E032;
	Fri, 28 Aug 2026 14:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="diEjkXOp";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013068.outbound.protection.outlook.com
 [40.93.196.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90F610E032
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 14:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWPfaR3e3ua4/atg+N9p/mhqox7gqkBSIAu9Sv0RZ0Ab47uCyjbyxI2CXwI2cp+OHc4genFs4BwjC3U7J0gKP7vpEUKt/PAqbNxTt2VvtbYatMi8NQoaTHT0qdTZY9Zr8lwjEWr/v5HjULtu+o5913HzTLjpGKbeIUa5676TB9WByoczRRAjpAoE9RFqMzC5EnvqaP2ji4JHCPt1uV6+2fUzRSeik46l5lCcqRdy1BBzt5/3txwOt50t7Eaog/0p2zNc9nHpmspfrprfy1sVCXdi7PAz5dA2Tpxe4OB6BhmyWGLDdwM93MthdKVedDz7Pac2xBgkvXnbyC5yV/t7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mT7ycQTzgjG+pqMy/X0Bwb1pS6Bmd3dk0N7JJEFDJac=;
 b=t1fDy1v4Jp/2mjIxofw5+sVZGgnmIUy5ckGu/LRWpZ8g4xbIssIC2QelqeE1G1FTssyLS07Ovi87pXyY0J+cQ3pt+S3x6Dt8eNMUVK3E6Kfkkbn/b9AELmJaXDStKd9BWvsA9JuU6qTA9WhTqTTY/UWuEjawTSm6WoA7pOfxW/ixdweTxDijQ3oHc6eERBGxA6GFSiVtLwVrpXRG2ITu7wgCVe9rguAn1ozWlV8omnIA9V+dYxQBd3Ria+6FQx2vHVYKARvhjHCRnGqquVbuFRn1xa6QNdO3tFgJI/9lik6q2+8Og563csoocwNoTfPAFfzffc/6blFpZGvZ7kQ4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mT7ycQTzgjG+pqMy/X0Bwb1pS6Bmd3dk0N7JJEFDJac=;
 b=diEjkXOpnfWhJ+mYsySR+dzcRKJtd6XxF6anVuNBfbckAelfB5ZiRzG6exgn0heXBd/rv8FKZ9/dzNu8M589eRf2w1ygiP6KNPVowBfjNzoqI+M++2mOYNRmx6e7VWDhePovz4N1mEhAoWxBt2Ic3j8x8JOHCy4OulRiezQs5rk=
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 (2603:10b6:610:2fd::7) by MW4PR12MB7431.namprd12.prod.outlook.com
 (2603:10b6:303:225::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 14:53:09 +0000
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61]) by CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61%6]) with mapi id 15.21.0360.006; Fri, 28 Aug 2026
 14:53:08 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, "Prosyak, Vitaly"
 <Vitaly.Prosyak@amd.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "chaitanya.kumar.borah@intel.com"
 <chaitanya.kumar.borah@intel.com>, "Broadworth, Mark"
 <Mark.Broadworth@amd.com>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Hung, 
 Alex" <Alex.Hung@amd.com>
Subject: RE: [PATCH i-g-t] tools: rename HDMI compliance utility
Thread-Topic: [PATCH i-g-t] tools: rename HDMI compliance utility
Thread-Index: AQHdNtPlteXsRYnBNEqDQBKO2DKTqbazTDeAgAAqOACAABSCUA==
Date: Fri, 28 Aug 2026 14:53:08 +0000
Message-ID: <CHXPR12MB9992204E4BC30CC3411A15975FE5AC2@CHXPR12MB999220.namprd12.prod.outlook.com>
References: <20260827185355.378279-1-swati2.sharma@intel.com>
 <20260828095854.7apqo5c7hy3n7oet@kamilkon-DESK.igk.intel.com>
 <7f78ff21-e4bf-417c-bf9d-c605b13a4beb@amd.com>
 <7fa2630a-424d-4156-b18d-0b4b3e50df23@amd.com>
In-Reply-To: <7fa2630a-424d-4156-b18d-0b4b3e50df23@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-28T14:48:33.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHXPR12MB999220:EE_|MW4PR12MB7431:EE_
x-ms-office365-filtering-correlation-id: 2829499c-7642-4357-48a2-08df05141322
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|3023799007|4143699003|38070700021|6133799003|11063799006|10067099003|921020;
x-microsoft-antispam-message-info: N/fl9SHHqoxzBGTut6cukp02THeWgIkGvyrMWMhJAP/3kgpHRXG+wifmOIesFlPk7rRWVwhSwmxBSWWSR8YxqHWFCKkeBrVLbux9eiCm1SVHz5JpFOrprkGDn0ud7Q+EEOuPiFWH7n+nJLGH6W2UI3m+IBt47Gtonxj6d6MI9WhdAtQPkhQAfkWjYh4aJF9vRV5QfcpjoebLq/Ed61od/8yEea/dWoQxAqER87fRwWjqL9M3hHxe1Dct24jFf3+o/z0eQU11Y8tFkboFBJpp4eoEiOT4oTxPdNSDx4UVeMZahZ2SxRY9/BD3ukoL+uUyyRfYQJ3ZhgdXPiO/3T2mYHPSN4LG4DjYUP1/W/JC9J4JWJ5akWp4XD+oQdj9kMDvgaTl0fDazDU8NALurHrEQsZDtd9gLIz2S0wEZvf3sBoiBl0k7MhyZkMp4aqbJVb2XU7eC4zM2K/l3VlK4NL66AYrc9TUGuftIHMETPtZHDXxjvOInRj1wrmwSEFIPswgSklMpp5RsMzWaiNi8k+BqyIwA1D1bu1ZvbT76qHAwh+UKhFNpijcISJXsMrjlweBFZTp8CQY58RifXHvfmLcumTT2bBQroqay3eAHH5K/2/5gp+AfEDm8g8uJ3EsaHrP2RFKPUVrScKcBU9YEAU0QV1U98Z29HA1UFN9JpJk1T2xyu9L8pZPP1j7Q9c4ig8v
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHXPR12MB999220.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(4143699003)(38070700021)(6133799003)(11063799006)(10067099003)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EE81cAGSHX3s/sky2fZf42aHHDaUA9fDNykePAfbtRx5k4ilOM4Stm0rr+/Q?=
 =?us-ascii?Q?T7t9PSfCLEMmsB1zfIb7KTEZha8hHevCA4/Y2GK7xTRvgfuuPcw5U6PfC3GP?=
 =?us-ascii?Q?wJyEJzxyfILoeUAzWGNMxKOIeREL19YCRHnFBz2YKwfMJHyWPf7+w0s3Vms3?=
 =?us-ascii?Q?AHWFUuZZghI0MKnRDbkOQMkqn2GBNJlZPki2/8X/NISF9vtyo3IaosC1zeMR?=
 =?us-ascii?Q?yztUFTMzcx6ISkiuPRXvaoGiuJ0zxI7VV72NLvezgnZoiQ3yv9TGyV+Ovi0d?=
 =?us-ascii?Q?Hojp6X476J1SmlFVi5xFUdcXmZ6XsYOoPIQYYvH233tzVnQCH/3iQQUt5xpO?=
 =?us-ascii?Q?utMwN7Au4qxaD7x3i5fWJZi++Tsf2zE62ETfpd0D6vBGwIjk78QviFnVCzdF?=
 =?us-ascii?Q?0QZsUiCe/lOmsNlJCOK+KkrYrqYWTvWKYvbxqwKx7FLyY8T4tWcxwofbFeGu?=
 =?us-ascii?Q?f5FX7hi7PS6RgNaTjmaPqIzLbSquC8AMqySnFb8AWOijJel202nXEHD+cxNR?=
 =?us-ascii?Q?Pho3WVjNZWgEVep+WWVLE1TYj3acgkrTzqQPAR1a+neiJa+MoEtFGSHTzLp4?=
 =?us-ascii?Q?f6SzvO/LyaPNQUA7BYMRapZkFwTV920+y4Ou/+SpduCqiDgi4RbRxkei9Zxm?=
 =?us-ascii?Q?DzihETn8xgoo6HXh1PWh5IAMTR+Jf44ed8MYqmg7jP7xBe5lYTT6Pbc0Baq6?=
 =?us-ascii?Q?6iSgg+uw8t1HdrYAfV6ISmMhuyJupjSHmXzsV+GJ6CnO5jE0B1IuWUCawGgS?=
 =?us-ascii?Q?utkTOshCvJmFJ8vLItny6gBRCk3Kk2CXT2M0c4bK/HP+vPIPGpCAyK4qzhqw?=
 =?us-ascii?Q?isdzZSjwTZMs7BDwqKVXJxvkZo+4a7E0W7+qDI5ZFMjX0VhRtb482YLuJ0XX?=
 =?us-ascii?Q?kP5+XMtuVd3QKxM9LFODOkEe9Vb8heo8ggcuhO5V4quXwAROVE7rnxHToHLH?=
 =?us-ascii?Q?LMwqI6A3/3yW/IBPXDvmQBQtcwjEEB+ds3b9elfU3enNCpF7irW4exF85fJa?=
 =?us-ascii?Q?zFYIErIqD9+depRliDRBmq7j0ZmDUPs0wz+XR2IatK9ddwgjijdA4KWkhydD?=
 =?us-ascii?Q?z9rrsSLxHmVKZVsueBoJyWDrWaQE3mHS406l7RAfKomh/uxYp9QxwV/gWcvP?=
 =?us-ascii?Q?I7mcAnv77lXVlB1+wtOM+QfbI7fW4aOJvzR8++Dp+Ql93pdeZddqp2uCE5m5?=
 =?us-ascii?Q?HXS8QbXffTdSoONND6Q+6VVdkugo2UFvcqWwfHrwf9Q7hANYBXuwP9xO/cHC?=
 =?us-ascii?Q?KiljyDqXNrlGdETld1LVou/xFjeeSIG65vX3eE1vz5H72UhD3CqraPIklmP2?=
 =?us-ascii?Q?tz4cesSDjRfPDxMSJ4QwYYAQjHijWv8cb44Iam8lprJFDf2/p/qBssuy0NSN?=
 =?us-ascii?Q?o3hV0MRpOP5HlhdkwWdGVyJVHludX8MvifgFRGSzEwk+xfNfILkZhXQfbQ2J?=
 =?us-ascii?Q?J2OZ3WhlIbDIZWwxefXSlujxTV0YI81gXyUOT4lMNSmBA7rQzRfqLwudpDSt?=
 =?us-ascii?Q?qhCS6KKq9BmkP3B7ZnwYOZjOs98lbdfRXR2MKNLLaxizYTjKCUP0tpbRtVlX?=
 =?us-ascii?Q?cua0WkN4BXByvI32Px2PL8WVLmh3aKEyXA9vtdJEyH/pYnt1rnA9E0+KMg+J?=
 =?us-ascii?Q?EsEPEwFr4CU6nuC4ol5J0skLw5ZsBrKRWVQfRpRzRJMID7+tp++R72u7dPtS?=
 =?us-ascii?Q?zYsk1UwtYRRHmY71Js4iHNdx2yihdKvVyi+hO7v7jtd9SLjU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999220.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2829499c-7642-4357-48a2-08df05141322
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 14:53:08.8283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c6fc9JnOiCHDuGd5L3mx+mhhETY61iO6o5uHkDP3A0zpqOHY38GYpw4Eusn/D7mi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7431
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
> From: Wentland, Harry <Harry.Wentland@amd.com>
> Sent: Friday, August 28, 2026 09:35
> To: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Swati Sharma
> <swati2.sharma@intel.com>; igt-dev@lists.freedesktop.org;
> chaitanya.kumar.borah@intel.com; Zuo, Jerry <Jerry.Zuo@amd.com>;
> Broadworth, Mark <Mark.Broadworth@amd.com>; Prosyak, Vitaly
> <Vitaly.Prosyak@amd.com>; Hung, Alex <Alex.Hung@amd.com>
> Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
>
>
>
> On 2026-08-28 07:04, vitaly prosyak wrote:
> > Added Alex
> >
> > Hi Kamil
> >
> > On 2026-08-28 05:58, Kamil Konieczny wrote:
> >> Hi Swati,
> >> On 2026-08-28 at 00:23:55 +0530, Swati Sharma wrote:
> >>> Rename the AMD-specific HDMI compliance utility to a generic
> >>> igt_hdmi_compliance binary and update the build rule.
> >>>
> >>> Keep the existing AMD debugfs flow for pixel-format forcing. Skip
> >>> that operation on Intel devices until a driver-supported interface
> >>> for selecting the pixel encoding is available.
> >>>
> >>> Assisted-by: GitHub Copilot:Claude Opus 4.6
> >>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> >> I will forward this to few AMD GPU dev to make sure it will work for
> >> them, +cc Fangzhi Zuo <Jerry.Zuo@amd.com> Harry Wentland
> >> <harry.wentland@amd.com> Mark Broadworth
> <Mark.Broadworth@amd.com>
> >> Vitaly Prosyak <vitaly.prosyak@amd.com>
> >>
> >> Vitaly, can you forward this to your devs and/or CI team and help us
> >> here, please.
> >>
> > Added push for testing to our internal CI :
> >
> > https://gerrit.core.linux.amd.com/c/upstream/gitlab.freedesktop.org/dr
> > m/igt-gpu-tools/+/1951
> >
> > Hi Harry and Alex,
> > I hope you are both having a good week.
> > I am not entirely sure if the DAL CI is executing the new remote gerrit
> correctly. When you have a moment, could you please help me look into thi=
s?
> > Thank you so much for your time
>
> Not sure, but I think things in `tools` would require a manual run anyway=
s.
>
> Jerry, can you have a look and review this change?
>
> Harry

We ran amd_hdmi_compliance from CLI. The only change is to replace with new=
 name igt_hdmi_compliance with the same parameters (-e -y -b -t).

Should be good.

Regards,
Jerry
>
> > Vitaly
> >> Regards,
> >> Kamil
> >>
> >>> ---
> >>>  tools/{amd_hdmi_compliance.c =3D> igt_hdmi_compliance.c} | 9 ++++++-=
--
> >>>  tools/meson.build                                      | 2 +-
> >>>  2 files changed, 7 insertions(+), 4 deletions(-)  rename
> >>> tools/{amd_hdmi_compliance.c =3D> igt_hdmi_compliance.c} (99%)
> >>>
> >>> diff --git a/tools/amd_hdmi_compliance.c
> >>> b/tools/igt_hdmi_compliance.c similarity index 99% rename from
> >>> tools/amd_hdmi_compliance.c rename to tools/igt_hdmi_compliance.c
> >>> index 2af4c0bab..ece0abd1d 100644
> >>> --- a/tools/amd_hdmi_compliance.c
> >>> +++ b/tools/igt_hdmi_compliance.c
> >>> @@ -833,12 +833,15 @@ static void force_pixel_format(data_t *data,
> >>> int pixel_format, int conn_id)
> >>>
> >>>   test_init(data, conn_id);
> >>>
> >>> - fd =3D igt_debugfs_connector_dir(data->fd, data->output->name,
> O_RDONLY);
> >>> - igt_assert(fd >=3D 0);
> >>> -
> >>>   igt_info("Setting %d on connector id %d\n",
> >>>                   pixel_format, data->output->config.connector-
> >connector_id);
> >>>
> >>> + igt_skip_on_f(is_intel_device(data->fd),
> >>> +                       "pixel-format forcing is not supported on Int=
el
> >>> +devices\n");
> >>> +
> >>> + fd =3D igt_debugfs_connector_dir(data->fd, data->output->name,
> O_RDONLY);
> >>> + igt_assert(fd >=3D 0);
> >>> +
> >>>   switch (pixel_format) {
> >>>   case 1:
> >>>           entry_name =3D "force_rgb_output";
> >>> diff --git a/tools/meson.build b/tools/meson.build index
> >>> fbc6c0a00..68c31da92 100644
> >>> --- a/tools/meson.build
> >>> +++ b/tools/meson.build
> >>> @@ -183,7 +183,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
> >>>      dependencies :
> [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
> >>>                      lib_igt_drm_stub, lib_igt_tools_stub, math])
> >>>
> >>> -executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
> >>> +executable('igt_hdmi_compliance', 'igt_hdmi_compliance.c',
> >>>      dependencies : [tool_deps],
> >>>      install_rpath : bindir_rpathdir,
> >>>      install : true)
> >>> --
> >>> 2.25.1
> >>>

