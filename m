Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A18606A31B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 19:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q76+eg/N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B3710E14D;
	Tue,  3 Nov 2026 19:25:42 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010044.outbound.protection.outlook.com [52.101.201.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A73E10E14D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 19:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z08YkAGYqh+2X4/h8MSKRZUT0F6bJgJP8TnoGTHUVEUXuxkgc6xAC7GGD/dt6GD1th1v3q0K1CBzlb7/V+f4HQsDU0UpD5MV41DN8p7qoI6ZAA84yKXWfkvvgYVA+kv5HhoN3W67JBxbwC33grRRYXxCahnETw13ZiCeN/ypaPyq/kMaoyVxRv9Rr//a29pIoJ/lTM/ieTx5XPt+LcJSeorz/AvLet5A2ufLjv6z26XaYDOgT5TP9yrtoOmjX9nvZhILBBPyGylGmsIYzucvR1sqAxidEwycS9ZBcqfXmsiBVq3xkb/ETQBAOW1IwoItd7Lt7bkstd/q1WJIsdFVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpD2/UxE6kRxNRS8xxC13cy+uc1/LyjuNj5xSlhoZXw=;
 b=zGGYqCyceCxqxX40d5QdToDX+YFkQ1v2CccHa0E3wZkcIg6uNc8/ezwakJ14p5GIbIooHNAZxvzrAXmWMorJ5tX6sCP7oLqydI3DzWIH2kGe7XM0+hCbP47sblAWhQk1IbP+bNznATeU4XodC8kexqndgvVYzN1FQvFCJuAkvM/nF7MvXNoKjclnjDlA0S6CwNOXed8DasOaDEVfO+1ytyZrHKZ1mDt4Y8ZGKK6qWFVuX3U7YTZ3QSWyNVUXOtoqjDCY0vZpp9UJAdEux+dBXkXiilk3zCSpaS7Gqx2hIz4D4aKVeSMYx9UywMA4HwIh5zkllJQJPEsQV8ogW0GUQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpD2/UxE6kRxNRS8xxC13cy+uc1/LyjuNj5xSlhoZXw=;
 b=Q76+eg/Nvwrem3nvrFiVYFZEAKj3mRr93mTDw/qWG8LbCTchkh3qxl1f00S1SbhXb61UIxrvseYd4Ghuv6ORf7FykyVxIe0mZj5Tw4vswlbRd0FPwKiOnKhO4mBlGjhf4NCSjNw+nkHbJddR8+ydFJcMFVT6CUrGDaEr3oaKIfs=
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::7) by PH7PR12MB6858.namprd12.prod.outlook.com
 (2603:10b6:510:1b4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 19:24:39 +0000
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74]) by CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 19:24:38 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Simona Vetter <simona@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v2] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
Thread-Topic: [PATCH v2] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
Thread-Index: AQHdXLUaFgM8IEB8/Ee5BROA8EnbLrcUaw0AgAaOBaeAAVHZAIAAiuQx
Date: Tue, 3 Nov 2026 19:24:38 +0000
Message-ID: <CHAPR12MB9992473D1B2958CCA9485D0B3DEF692@CHAPR12MB999247.namprd12.prod.outlook.com>
References: <20261015145355.3972674-1-David.Francis@amd.com>
 <20261015145355.3972674-2-David.Francis@amd.com>
 <DMH9D1GKZHCU.3TINOPEPE1G04@intel.com>
 <CHAPR12MB999247A855D151A61B5801D113EF6A2@CHAPR12MB999247.namprd12.prod.outlook.com>
 <DMLITAGRZ0FB.174JIVJFEEEFZ@intel.com>
In-Reply-To: <DMLITAGRZ0FB.174JIVJFEEEFZ@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-03T19:24:37.862Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHAPR12MB999247:EE_|PH7PR12MB6858:EE_
x-ms-office365-filtering-correlation-id: fb380317-29fa-418c-2a6d-08df39e01a2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|18002099003|22082099003|261102123227099003|56012099006|10067099003|261009223027099003|261022105027099003|261021121427099003|261021135927099003|261022075727099003|4143699003|11063799006|38070700021|261026121527099003|261028144727099003|261026140227099003;
x-microsoft-antispam-message-info: 6FQP+C2EtWzabqAb+M3GHsK0/+pzf4q/gZfwccStMaYiTLXFxK8bEqz8e6kuTEIxdsY0Bcxu4Utikz1agbZuGSm7cFwxlGzhK8qv/lzzMQy/+vZnGpnnY3xbiD8BGKqTLF2BNBiOdDFwcFI1YVejczjCHMjLGZFR99JVpZsrl120Hnb+posvk7z4wdAEpTdZDfuAbwBG4NobfAlb9udqIqU/yivW1XgZuGq7d98ZnMB82h93aeP0EjA2ym8+GihtMPYSy1T1nHF9AQQ26ttXi3HN+vS7RqG3LUO75OyW5caL1UjqOv3eodF531/xbC+z18ZIyCMD0AU268mG0UpWa47EWLZaAz5IZBNegf36UZhh798ckVRNTe74UWnKdXwdUfKnh2Q9QLqUleVSmQwgryBSY2GKPF/y05GeGwrG7v8JXCBypbz1PlWymX2lwrcZkpqmasCm8rp/JprWEwLY0UTrEe4UdpIzoKjZteU/o1RCkmvPVWTKyXaPSepiLfulaUv/kiMTVNfHruO4P838p+OV6rKID303xwGXFZJDGrQ4gGoKGpoGINwmA+449Odxn5OoZzyN+yd2mn4VliD1+3KCss/aHaV7PMkL4uSt5IunLkD2H+qx9TAMbNGBCejov0MudkWxgkz8/XduSjrIYdN0qgBTrvVULJk9qvSuKz4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHAPR12MB999247.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(261102123227099003)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021135927099003)(261022075727099003)(4143699003)(11063799006)(38070700021)(261026121527099003)(261028144727099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FUf0M343eYXiSkOOJcyO2Xrw5fIF7vfMGUhzQ5fBsp1R3cHpHi1V2euTGz7f?=
 =?us-ascii?Q?ESI/NlqoPm0a+jDYTHgNfvcT678cg0uhpGF8z2hDB5N8MaWodPD2YO4rQGBJ?=
 =?us-ascii?Q?Eb0FDj+h8/mCWQjbd588OMU2ZsdYC2jwbWj3zd9kuoSAqiyHxpBQiGFPUHDi?=
 =?us-ascii?Q?vI6dIqZ6s/PrRBU3Im8HJ145ZG7UmvdyH2IujaXq1HapeizP/XGlJtEzTgpj?=
 =?us-ascii?Q?Um/F3KFqchKhsX5B4q/LHBGaroSIo6U1KcpdMQsDIOgOKQPia2/aY+gs1oxV?=
 =?us-ascii?Q?D647bONbvh+GGhzkg7+YOxaxjQqPYBfn6FrlWK2I2zPCKTI17KWTHMq/d3K4?=
 =?us-ascii?Q?PdW17eL0BVs33MwGRqaR/yuVob+O5+hqjvPI4sMYIkI64qdgRi1+Hj+AywaD?=
 =?us-ascii?Q?yuXokr9xqvWYAhO9CEe+YHWvnD7D5Oc/klv8jo2dXbPgpPHKyz4OR7O+efmf?=
 =?us-ascii?Q?61LfZrDKf6rqE4M5Dx6pFuWY3ZBWphbvLM96SJ9rui4zNWIUV8Es4hLLtUZk?=
 =?us-ascii?Q?wWPR7kcEIG6agNzpEUwtWRkJFFHbN01Hqf9CZ3u7WJTll3be12jySyy6Jp8b?=
 =?us-ascii?Q?X5ZeOsTYx4eoRgrA4tCubgumULQMTGY3MmA2QyP6/ABmkte4lwcEw+cEWNSA?=
 =?us-ascii?Q?Elq0whorWvXpiMH/4HLLg2lEN/hPqpzuwYACXSm/8IrYl57V8RdfncOcBbUf?=
 =?us-ascii?Q?DKql5IwmLi4qLNI8zj0BFssZI1zyyd4blx4rymCMUGv4RLpVfrmUTQrRnbo+?=
 =?us-ascii?Q?CWjxzp+idCFbJqwpmYTnbfs9+3D7sd7VPvSHx+LddRd93SF+EMkauFT7HmBB?=
 =?us-ascii?Q?pj/aT48f9pX/lG6aoNy8DOmtUSTf6yCpueW2sa0LEusj8qHWkbLa27g0eGbZ?=
 =?us-ascii?Q?yGiHHUF2rLf8aXEKey2+Z/q3ovYz7ROOADw+8nnCILRxsPcE9AtiBdb2qMja?=
 =?us-ascii?Q?KsMl9X0hDq3QO+HmPjZbueUkO6V7BZrTk0x+ej1IIV3NuqSokjuv/PcHw7mD?=
 =?us-ascii?Q?g3qIf463N1qVswzzcLS+8QQh+e6oWufjbp5c+k2X94cjFsnkjtPsQPD40SWR?=
 =?us-ascii?Q?zni9QrekIMT7nbh8BJhXJ7J12+37McpaM/NX6ED5NMHX9l7F/eAl1/21aznB?=
 =?us-ascii?Q?XCtiU0emmhBEaHA4XBclTD1CcqqsrufNM385P4qMoNpGGUHUmUI6wdO2SMXZ?=
 =?us-ascii?Q?SQ4tQVO0jYf1EQkywU2XTehdcv5P4Uda2ufxy4ZrWnahZKFafs2/090QrbSD?=
 =?us-ascii?Q?QgKAtrPsI7No6Mu06eTOsXQILbEL+aI62W1O9jLMg+XmcK1uebXkATD1Dvii?=
 =?us-ascii?Q?VXueDXkAc9k585Y2U5R8LfVqwC5M3woN7UiljMLEVhMcwkPecwzHh3WBx0cA?=
 =?us-ascii?Q?+3ysO9p9hIF6gNITN/JTkvJW0TjlaZj1atbE40Z9TJT3pnxUheyOGgon5EhB?=
 =?us-ascii?Q?gdphSuZkliC5Zs8OMALTBjCpbmEboEUyEB07E1Cnudn2fbSC+l+xYzauLeHu?=
 =?us-ascii?Q?u/+zXHce+hZtJtw4WWTsAaF4HA/fWx8HpnNqh8DDytqByuaiJvQuaB8E9VHk?=
 =?us-ascii?Q?RRCsN4V+H2lAeEhf419DN2ffFcuiNCmYuWWqt4zKCCl8i2W6eS2Ikd5lNm66?=
 =?us-ascii?Q?kRCAiyH1191ONgNll7bVYm78z3aSAEGoaybmOxE7gm80bl0qlTIlPuI9A1rV?=
 =?us-ascii?Q?YxoiImAdiNujVcQZTVZUsKAx8T0ZbCTJcoInq0cA/5rJFAAC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999247.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb380317-29fa-418c-2a6d-08df39e01a2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 19:24:38.4003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G9JewfdOx2UJP5VzhiyihJCaBeuR4L8ZojH1GiB8dC8gHkN/mInS2PY/38QEQiuK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6858
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>To me these tests look reasonable, but we need to make sure we don't
>pollute CI with failures. GEM_CHANGE_HANDLE is still drm_invalid_op
>in DRM core, so on current kernels every subtest fails.
>
>The best path would be to merge the kernel side first. But since these
>tests are a prerequisite for the kernel patches, we need to work around
>that somehow. Until the kernel part lands, the tests could skip when the
>ioctl returns -EINVAL or -ENOTTY. Could you add that in the next revision?
>
It would have to be -EINVAL since that's what drm_invalid_op returns.

Which poses a slight issue because -EINVAL is one of the error codes that m=
eans
something specific in this ioctl.

In particular, there are tests that expect -EINVAL in some cases (checking =
error cases)

Is there a way for these tests to be excluded by default and enabled by an =
environment
variable or something?

Otherwise I could add something like
static void skip_on_disabled(struct gpu_ctx *ctx)
{
        uint32_t handle, new_h;
        int ret;

        handle =3D gem_create_bo(ctx, 4096);
        new_h =3D handle + 1000;

        ret =3D gem_change_handle(ctx, handle, new_h);
        igt_skip_on(ret !=3D 0 && errno =3D=3D EINVAL);

        gem_close_bo(ctx, handle);
        gem_close_bo(ctx, new_h);
}
and call it at the top of each test but that seems a bit kludgy

David Francis

________________________________________
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Sent: Tuesday, November 3, 2026 5:57 AM
To: Francis, David; Sebastian Brzezinka; igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly; Kamil Konieczny; Koenig, Christian; Simona Vetter; Deu=
cher, Alexander
Subject: Re: [PATCH v2] tests/intel: Add edge case and race condition tests=
 for GEM_CHANGE_HANDLE

Hi David,

On Mon Nov 2, 2026 at 4:10 PM CET, David Francis wrote:
> Thanks for running the tests. I'm new to the IGT development process.
> Are these tests good to merge or do they require additional review?
> I have this change on a gitlab branch
> (https://gitlab.freedesktop.org/fdavid-amd/igt-gpu-tools/-/tree/gem-chang=
e-handle-tests)
> What is the procedure for getting a change merged?
>
> Thanks,
> David Francis
>
To me these tests look reasonable, but we need to make sure we don't
pollute CI with failures. GEM_CHANGE_HANDLE is still drm_invalid_op
in DRM core, so on current kernels every subtest fails.

The best path would be to merge the kernel side first. But since these
tests are a prerequisite for the kernel patches, we need to work around
that somehow. Until the kernel part lands, the tests could skip when the
ioctl returns -EINVAL or -ENOTTY. Could you add that in the next revision?

For the contribution process, please take a look at the guide:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/CONTRIBUTING=
.md

In short, patches are reviewed on the igt-dev mailing list, not through
GitLab merge requests. It would be nice to get an ack from one of the
maintainers (Kamil is Cc'd) before this is merged.


--
Best regards,
Sebastian

