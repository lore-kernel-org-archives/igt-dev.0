Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B01C369D5
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 20:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2697910E9AE;
	Fri, 25 Apr 2025 20:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K2SKHgH0";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD27810E9AE
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 20:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsT8bxQDcP12HisLDH1AtyXexjizXDu7ENlFk2/NvYpjJUClq/yYsxGM4ZU+aTFFzSN+fketIpoX640tBRoZVB53Yea4lZkdE0d5zdkFu6049DNCTdvvzLB2Z4659O1yX29eNbAB+sSFVF7G3CFByZg9mcJcqJLkd4mpzOlc7NYq7s5tdsoZqiBELewU9CCuh0pRrT5MKsARRj1HNVhSGrQoTqhJ+4tvVViyhoAjMV6SBpkjh8fS6k0YN6phLqsI6YGQKB91lA2xGiGf9YAGZEDE9WvsPIIC6nC2tQiweiKyoO6H3qZwFrXB8OutN//IQ2AZyPsRwRkpwmOkneNOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngU8YQXcTn6pTnqc1nbaeDjqRqXSMlYCis9BZO4rheI=;
 b=AUO4+IQPppn+gf57lzyDL486IQelEOGFiKanVkqvTh4PX/KcflelVoApgX6sNmJ91NfP/PjkSI6uQ2Ep40a+jwWY1VE8Xpbzci2CCFj4pTf8ZDFN1arXqs0mIqSsCntLqTjS7wCIJNRDLBUOGAMsI7RS+qNI3nXQX/4pdfEcUT/Bn007u5uhaShmBctCF8e8VC9HfwYR0RvolLnR/MZc3A27+aRfgRD3nu6zk7xwxW3vQNxKNa6yxHfN3tLTFcRi59VomHeCULnrR+mZ3c6v023zIpNUF/7FuPeWXeTAb7MuHtvf3cTCDQ+LGRuMcTNpULMWhf1GtAYHY3260IE9VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngU8YQXcTn6pTnqc1nbaeDjqRqXSMlYCis9BZO4rheI=;
 b=K2SKHgH0jO4Z180dGP+6trrkslp7MZlbXlwx87V9uXHGY+zKWXjtkpZiHMlq2nVw719aLt7nnhJkBWtcNwB6QZNEMab+jLZAqCZOdHYTFa+tCO6PxbahZd/42baJqI0Jcd4vRv5Ixdir22WhRb5AYUrQoDvdLzAkxznHHZkPrHo=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by PH0PR12MB8176.namprd12.prod.outlook.com (2603:10b6:510:290::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 20:14:09 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 20:14:09 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Khatri, Sunil" <Sunil.Khatri@amd.com>, "Zhang,
 Jesse(Jie)" <Jesse.Zhang@amd.com>
Subject: RE: [PATCH i-g-t 1/3] include/drm-uapi: add AQL compute queue flag to
 DRM header
Thread-Topic: [PATCH i-g-t 1/3] include/drm-uapi: add AQL compute queue flag
 to DRM header
Thread-Index: AQHbtZKLLd4nwnjCMUKIqtXfSRYdcrO00cTA
Date: Fri, 25 Apr 2025 20:14:09 +0000
Message-ID: <BL1PR12MB51440169D37AA4B9DCE6592FF7842@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250425033124.1185655-1-Jesse.Zhang@amd.com>
In-Reply-To: <20250425033124.1185655-1-Jesse.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=f4ac598f-6917-4118-8d40-0ebcad475795;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-25T20:13:12Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|PH0PR12MB8176:EE_
x-ms-office365-filtering-correlation-id: acb2ffca-b8a6-453b-effa-08dd8435bd23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?s3EpjLw1qE6s/Lx0HoYV4H/QcJbZgiQaVTG421Szpi8IC/YuOrzglcfTNI00?=
 =?us-ascii?Q?tUOVMLkNv0OGpkFCY3+u8oF6Ey8XvTO49Bk0kjo8V8Mu9ROfwTMQAuu3dn2F?=
 =?us-ascii?Q?e9NRziytJ57aLtaczX0BLR2wOLsuuotp4rdDtaKql8UkeCSvPosM4mwa9PQe?=
 =?us-ascii?Q?2zbo2olBuHAZ1cBL4xJd52+FDLVhdq5re2t+YLz1Rhlf5PD5IRe0YaQCDwQG?=
 =?us-ascii?Q?gQjTEnribrpOuiJ21yzT6dlQrrkWxnbb1ZviY1xtNHpUOFm+OTwzY6F8OQ0d?=
 =?us-ascii?Q?Z7XRQYpiG7hgb3kUB0/Otb7fEpTZpG7VI/1dfqoHDp7o2cxyzl2fowhsWoZa?=
 =?us-ascii?Q?hdliog/o3+bkWEtpRAHnMQas2dRhTakHR5LDX1Ac5WE1gHFaAMwMY7Xda+Fy?=
 =?us-ascii?Q?Bq0TrxO2npuFkg5jyBC5RBtu6fsIHuiJ7dGarbC7MC+EPCN0351dZIsVxD1q?=
 =?us-ascii?Q?Xr1f5feJpE2HnEa6ZsmxeFb8vVVDm/sKmQajO5ktg0Bq+D0DWVgbivv6nDs3?=
 =?us-ascii?Q?Jg1OLiiEn2wcWKXgLDvMfWpd8x4/pu5fKmSjugPIT+x95jJra/sOeALjrdSh?=
 =?us-ascii?Q?hC+Hr6C2V1lbuZfuLaBsjM5eudUxy1TYVJnMt92ZrIZWcMImCaoK0EGOjKEG?=
 =?us-ascii?Q?abjs4P7Q1J/1bgyuGFqR8wEWHwQ6AwIsanTUg1qkQYsXADg9h+tXyEaXVOFF?=
 =?us-ascii?Q?TL0g92tI5dNHW/C1idpF0DjSTVQADAztDNEXCURZczvMONlXuV2wVM77OD9p?=
 =?us-ascii?Q?JiqjXIy3/cIerS1dTkb6yQoaeMzkIhRSn2i76xF8KwJMpKWm96rRW+vj88RC?=
 =?us-ascii?Q?GYg4GtOQWcpuR1XjDNnZAFxkOS+MGaTjCHBt4EJ8ZJOtYunktR2XftCaZZT4?=
 =?us-ascii?Q?k0FKTQH6I4DksAB5YCRTEBGuBl6sb0VoepwPhubESJbEZSEeYmInEqHKuY0U?=
 =?us-ascii?Q?TgrlwMvkWvsj4AzBDpJErh3LBY9gVdPkNSsR9LjXCCVRO0Xi0gAKreFEkhyl?=
 =?us-ascii?Q?XGcxKE81GfD15J3LbXRz8H8G2Usp2nxk8TDZGiT8CumBoTAddqRCTV7coIIN?=
 =?us-ascii?Q?iaiNAe5qa3hGuNLSZoTLaZg/2690hDSsBfVgk856Dt5AJzBDlE4toMSjiElV?=
 =?us-ascii?Q?kuvbUHtsKD6UF/7Y3K83DIIGhzgXnXArGNTUGT8JYQ5hFUQtkbMl9b/n+zrV?=
 =?us-ascii?Q?qxEKCjTIy8gnQaP/4VukIzGZ8b8R/BoYd64vnryKFq9MWNBPY/E+L31lhZqS?=
 =?us-ascii?Q?CEf45okm/dqJOS9M4+6E50A8HGSBfx6UEUQ/1YOdSm2F0QLRsNL/+DaYUGLT?=
 =?us-ascii?Q?7Zr5AFfLg5kvvh/DxQQiyeJChqFGEb4nr0v35fq9YNHk43d4RMrdHB69Jqje?=
 =?us-ascii?Q?V2HLV3BsT4rin8BP48sERkM9L+JmRHrfowY2ywOwlHi+FfaNlzPKNppxrMJR?=
 =?us-ascii?Q?mUy3vJ5rqXgpQ/pRO5d/dHvUg9QQiA/mo+5uHtlVNKPRUr5UzPyws59woqoZ?=
 =?us-ascii?Q?Iu5GPKnUNH7NWkI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zaVjm+e0xVemHOoBMGRBSMTQD2fybfXKQvnlsoByqwJEdDN1x9b30NUcToCr?=
 =?us-ascii?Q?wg8fz0hwmZfw7YA8wcbnM3J6O+Dix/8+iE6nKtR0/3W3GyWeSPXsd4aV+Skt?=
 =?us-ascii?Q?VbxuoP5QqvZpXWFIzBgrS+kwjHjH1du8DiADEAfAU/scSn8zOFIgkV0VIp17?=
 =?us-ascii?Q?divWbzWMx7qtB2t9SQ437MQCTdAyV27f7hUUHRe0I1r7NRXo+DiuLKZUFOjx?=
 =?us-ascii?Q?s2HDxSMUdUgNT+v5tLjLZnQLKZzYiQaAUiAL7CfSVRgb571rE/l1uaBFE/Bi?=
 =?us-ascii?Q?X/IE37zampBwu9RtmsMTo7enn98ANUvFtje1apeLezLMPM4CB2obX5mK77ar?=
 =?us-ascii?Q?E+PU6Sltdaiit4vcsj9TtVoBA3BxLgak8lCIZFCqk3BCqQTZPsUH/xKgkUNr?=
 =?us-ascii?Q?puQQZjz2T5ppcXhUzjjegJp7QtnJ3/y3Mnke4mqCNHqcRlDYOvcxruyxoGmY?=
 =?us-ascii?Q?f299BrcMG8b45QHZZvfZxSeZ9RgkOLOpbcyvO6m/4CWRO9ffuyHCJgKeMQeP?=
 =?us-ascii?Q?bvNfcs9ScuDgCKVn9RV1lXQcJUPKUL1vD1W2PFpcQ4E0EBP9kWfbJjCpA7ls?=
 =?us-ascii?Q?evadDlxI4uboX+FM22f8dUVS1hwU+ufO917t0y4ooxx+HBbRuw+XK4X8OTFq?=
 =?us-ascii?Q?knd2ng4qPtJkQLTmnuVJNQ7foPCDCek9vHMrMnL68STV62aAKyiqg7Eh3XFM?=
 =?us-ascii?Q?OBSRRxiUhDGWci5dDQeQBQ+rmxEStAzzYq6OhgNG+mK0U2huFGwT+vZeDbSX?=
 =?us-ascii?Q?8+Gew87jFyHaOE8qnMkOtJ3LcxXb0Ehg7TNFIYp33pc8a6D9+cm7QhEjOUll?=
 =?us-ascii?Q?qFBAtGb4jLP9K6nlXNX+ebWkFNlOyN0K9YjwFz0XvfmoiXTSTNgzyKQ7fS/t?=
 =?us-ascii?Q?HouJU31YeIEu4TlV+6cu37hanKukAzGJ6yuOqHo0MyThY+WwsaHXNmY/R5HI?=
 =?us-ascii?Q?H6QI9oux/ZSln8+y3CvAava2wjddXnQwhAb91H3AFHm38ZJkBw63VSaQfnhx?=
 =?us-ascii?Q?WoJlb4hnEgrc7JxqaaQkEaW9PDFh/OQFmEWxoUKmYf7aq4Ob14HcScUK7g3W?=
 =?us-ascii?Q?5lUuJNiuoFUg8MCcy7Gvst4hdn2Nns6kADM0JxSYoigr/PzpDlF1pf17M81a?=
 =?us-ascii?Q?SGwgv6qNOJPsEi23PegZ6xZ12auTi3EOZ6x0KHU4lmvj8rrisx4ewZLEeXuJ?=
 =?us-ascii?Q?iupxPHO/OBA1+kmrYorK925GZ3m1b8L+8avw4S0Yqznw2QCZ+Bl7L8Z7i5vY?=
 =?us-ascii?Q?12dc7ecTMUtq+/okmb9DxvhkM/wnpSX3MYmj+4srPUj4wlbOSjUC42HnQv+u?=
 =?us-ascii?Q?IHqs3oa09Tg3q7oZMqBTNjAdDGJS+LkZ1pBRVjGzGQTPbPl2ecbfkDuua5Cw?=
 =?us-ascii?Q?c61DgP+iGUilOWvSO6GLSC1y7lZAEsbkKJUtAGFjzDozTiCIaiwIDfYfdCPZ?=
 =?us-ascii?Q?YqFkRSiSQpuGunayGh0oWU3ymVTPFJYR/G5JPLtmIB9pKA+CWOi0Vw1HFJDd?=
 =?us-ascii?Q?TGUGrcR1MrKyRbicWNEBRLgYH19lyts78cmg8/oNVmLrzaUXyh1qmbFGYAnr?=
 =?us-ascii?Q?vTXSZNrKVBPkGlliVEM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb2ffca-b8a6-453b-effa-08dd8435bd23
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 20:14:09.7337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76Q3NdO1ieS9EBpbQ9z/m7WHAu9UIdnTMaYblZUh+jUbdYlBi0hKDzve+1zu0/6cCcAO1MpUUzoHOkuQ09EVBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8176
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

> -----Original Message-----
> From: Jesse.Zhang <Jesse.Zhang@amd.com>
> Sent: Thursday, April 24, 2025 11:31 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Khatri, Sunil <Sunil.Khatri@amd.com>; Zhang,
> Jesse(Jie) <Jesse.Zhang@amd.com>
> Subject: [PATCH i-g-t 1/3] include/drm-uapi: add AQL compute queue flag t=
o DRM
> header
>
> Add a new flag
> `AMDGPU_USERQ_CREATE_FLAGS_QUEUE_AQL_COMPUTE` to indicate
> that a compute queue should use the AQL (AMD Queue Language) packet forma=
t
> instead of the traditional PM4 format. This is required for upcoming HSA-=
compatible
> compute queue support.

Let's hold off on the AQL support for now.  There are additional requiremen=
ts for AQL that need to be solved before we commit to this API.

Alex

>
> Signed-off-by: Jesse.Zhang <Jesse.Zhang@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.=
h index
> 3f4813879..75ccbc7fe 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -338,6 +338,8 @@ union drm_amdgpu_ctx {  #define
> AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_HIGH 3 /* admin only
> */
>  /* for queues that need access to protected content */  #define
> AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE  (1 << 2)
> +/* for compute queues that need AQL rather than PM4 packet format */
> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_AQL_COMPUTE  (1 <<
> 3)
>
>  /*
>   * This structure is a container to pass input configuration
> --
> 2.49.0

