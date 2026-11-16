Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FD1606A329
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 01:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WZd9+Bps
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7C210E928;
	Mon, 16 Nov 2026 01:58:46 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012030.outbound.protection.outlook.com [52.101.48.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4C810E029
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 01:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/dHgFqTmZk6yozFLG9+T9m4Io83FlPbC1u7qejmqzc+yFkh8BHH5mfuXUqj1viWtS0OgkR6KRNSU1CIsqiuApX3xDSAqaIzSDgEcV1MnXOOdNxccs10CUGsrSZFEkDHKpw6B3UVd6Bg/PXsnJ+mvwVhoNS+8W/wq+luL6LQIqs6uhTtr0QQS6TrPR6Z8yemaL7mAIYNyF63ySUrKpdQUTbScuWCBis3HoJcxLXJIZKoaPzFnnAPIQ8XymKxTqWsfoPdewzJfMKYjpa96mDNSWJchIg38zWns754smduiWh68xB1hgfc6gg1WZ9GxBdMDM6UvXPiK1gC7yO7Jzy38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8K8eSXRtUYTkFXJpwutyEVQOdC+2P4OSiL+KNAGFs8=;
 b=Y3NfRTn4QEmMzftw8KLjkF0fNXkPKhsvMChNebaIw8ZaU3kfwovTf4i60DT49tkapwvdU6JtavXZrW4QgiUBhgX2pmPgDLwZOCrmjyv3nXX8uv7Nbk/460WHtqdEoMBXjsNjJO0PjMDYTcbNuuon2eRtrADbYrdCSk4SBI+eXgTHWmvj2x6swK8TvcwaWoTizLZ7A45GNv5qfC67Kx9x4ZRmE8HKvrccE0ZO7eane6ExmH0JrEdVxc4PtTNRII+slRBLqjRYXJ7StQTETkATTzolms581tQTCyknyA8XYxibeB8SqJYodw3z/6js+vBnMYdXWqhKbv8HC1Eh7F8t3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8K8eSXRtUYTkFXJpwutyEVQOdC+2P4OSiL+KNAGFs8=;
 b=WZd9+BpsWjLkvxugb9nNoIGc4FNGVBdyRzabcKJoe6hHuwra4NBtX5Qi+1+bTQLIC5xE6RtAEUpytQj6vPyUZBjHsHSG9NjTU2wOrNbkFsGwLkaBRJKAMrj23gTv/jv5lc9C2SSUEmLM+R9IApqWxfjMmTAsnP8Crhz4L0Qd/fE=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DS3PR12MB793063.namprd12.prod.outlook.com (2603:10b6:8:43f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 01:57:43 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 01:57:42 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu: skip queue-reset tests on Navi10/Vega20
 with LOCKDEP
Thread-Topic: [PATCH] tests/amdgpu: skip queue-reset tests on Navi10/Vega20
 with LOCKDEP
Thread-Index: AQHddW1gKlfXf8Ql+0+M9VYJN9HghLcv8KiA
Date: Mon, 16 Nov 2026 01:57:42 +0000
Message-ID: <DM4PR12MB515258EAE8EFFA492568DD3CE37C2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20261116015358.135466-1-vitaly.prosyak@amd.com>
In-Reply-To: <20261116015358.135466-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-16T01:56:55.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DS3PR12MB793063:EE_
x-ms-office365-filtering-correlation-id: 990fff5a-d6a1-4768-cd26-08df43850063
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|38070700021|10067099003|11063799006|56012099006|261022105027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: e8x9yitkyNqMDFfuUQP0EsEcRnWHRtqg0awSfHqVy/0qRKtrMoq92TqrruUKYskYROOz7PCmS3AHzGt+movHa5xTF/evHE7sa8/ecjQgswTYvbchCGUWhzVGr40bXdWa2qW4OmCBJ6S4hSQmeelAJ5iAfUJWDYim1rH8/Q603cYXGJg0R0OdHbkn5te5l9Q4StZISfOZfKz4RlJFmSF7nuECW6HdO8Ib8VbRVCEI2QSL8xcLkNlePfPm6GR/sWRLTsQVfRt8rt4ctYBYW1vTyp1Qrg+2CMSHvjS5P91xzVzu/P2YVtfHvq3ihqqUhqoKFz24xWaJgYBG/mH8cJA2C8aP/gmu3QkrcA7HcEKvci5pAmkRp3I1fJVnZ/sPr2ey/FavLoDwiKBOYJXOukdrCMzWRt71k+QnDi1/r7odvr9PPPeTga8AHea2FcML5ngGu/eC7Ek/IuDDSDqbEvAj5v0Z3EC/K7s+g1SgLqPky38+f9zPhhML5lR37y1L9Wf2uU3SLpe7a0XF/ZPQzpfmaoBch1Y8vmpv8HAOHSNGLQFB9Iu5A2MWLwH1Sl3v/kkMbkC0IkwS97096S9dmyvkgMPyk+d/R/QHhPcHV3Xqy9/xtMLjJ/WBfEbVk9KIJPT6ZqwfABAV/SdmPXDWy41mqnEbZyamJOj2Ortxz58UiL/T2LGeGN1XJTd1JeVEwty82cMaxQZPWcaw49n/PMYLIljpLi5V4ihIdHmfheY7IEQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GHbc62sNglI7KYX426Uu9FtrWz+FKE5d6zJK++YhVZdXalnFELUriE2BZIWP?=
 =?us-ascii?Q?CDLXC6C54hJU6dqW8ved1kqZjlCYrF+fv6ZR+bjlz8I7LX7EXLkZAgfZorp6?=
 =?us-ascii?Q?XIQIangHQThrks8AvMSia6pqKxSjbYyxYzPfgdjHBXuFWkhEyOWxDHZ3EqiA?=
 =?us-ascii?Q?vW4EVMg9ajmki3IgCzI04cWJ+FwJvMwkjSCkM4VYjIrV84LdCAcsi3nz6ToK?=
 =?us-ascii?Q?fUem9KLTa+JHFvysN09NzW66CMnbnDf8emm5+5yusQrVyRPxSavgnoH8iw5y?=
 =?us-ascii?Q?dR314SEg+PKLnpi+NPb4bwNd5T5B7s8T9hikW1mEBrEKU7NrIX6FNMaX97F2?=
 =?us-ascii?Q?4VdWIeZu+S4kKShgCYWPWUs9JtH4hobdzlKRK1UL/ZQFgRaEmUSUdXDErq2b?=
 =?us-ascii?Q?wgk0l53+GCg9LmbQRNd8MhWsWlVrDAmAC4ITvpq3w7FCI8w27Fm4OM61vycR?=
 =?us-ascii?Q?7s9Cpvvp+0qOBc5ZGgLnNOqXQhs1N5yvKUDTR2F44FnG9eIweCuPxg2TO5Zd?=
 =?us-ascii?Q?4hWHzXlGsWqq3FXEGdSI28nhKKHfGbGdO6/YBbtXbQaN9N/kk4C/+MrbmWJi?=
 =?us-ascii?Q?aGQbKVBBucIza+k1a7lGixHDN5deYgivSjdyfGvKISZmGAHVcLVxLw+do8MU?=
 =?us-ascii?Q?67jmnrwrKBqgRE9Q5McMA3YKt+Zm9imgCBoBASiTZsegK7sQal0A7gISS8Iq?=
 =?us-ascii?Q?h3CHPsqJOhm1rOrQgs+XJjqoJjeoVBviXCdIww/LfR70uyAKivsys/AbePb1?=
 =?us-ascii?Q?I0x33wBDqwYrV4S4fvkQq02MRXFdDoAIVkljj60Hpp5WDFbK50w9zP8JJDSM?=
 =?us-ascii?Q?OZjqTIVpBDIg7XiqBYg3VPQc19VXPjTqHtFjbaFbTK7fcm9uXIU5OPd0ZhCj?=
 =?us-ascii?Q?Z/JmGfy7mQrDCrjhucyhfsFZGhaEetTNhcd8NY41kOQd1LfeCAyzGx/wk++L?=
 =?us-ascii?Q?y25NE7ZznItZZ3A8gY+JRuCwSlOZhM1H5zVrtDhjNfSsG5mH5ErWETZkBFlb?=
 =?us-ascii?Q?qDDL2EMcUPzOvvlBt0u1kVq4kRM75a2bhfDiMr058Q6DR4pBpl6t7sPofcTf?=
 =?us-ascii?Q?9ksjzwMGzFqbTO4oho8cro/8rlWRa45SQvjK1mpnvHwk5dhRqNJf0/zdSHxV?=
 =?us-ascii?Q?hosuaYJOKDxfMbrnQvd0wjhulYrtOQP/B0E1cKPSMxte41mam+0f2AHdlS/w?=
 =?us-ascii?Q?VeBOB6/09a2Tf4aMp9kNSwCTEibwGFEhn3TzmchNTIslZex30zeG/E0XR8kB?=
 =?us-ascii?Q?gqmaWmDGKDPDQNJ+6up6IrdPZTFUA/oJrRpD0wA7X1XgWtDoJBwUwEZ+8x3y?=
 =?us-ascii?Q?TJIP/wRdflWEGqlpB1YZ00HLQyMEB5ZzwgUBmo7l+jSbdYjKbCx3pf+QHc8z?=
 =?us-ascii?Q?D4g0kg7g5QtIdOawou312ZiiK8jycrXcHob+UsGHGVpSzK7IJuV0bx381yG8?=
 =?us-ascii?Q?Es25KBQfsQq7DBXESnBbFaDSp3t2Xd7ObZEDrXvTfYFq6t+q8E9+rQCIAi6w?=
 =?us-ascii?Q?9mTPUkYni5SCOiCBlkMWvFybadb5t8gDeKSEhc3uGvU+9RfzzONIcbcgTymk?=
 =?us-ascii?Q?19zfmaoxjG2dSYsL0686p0UdLzzQuUIps619ZCO2Ow3L+BfMeAgSGPoHaqiP?=
 =?us-ascii?Q?TlIgAfu3uq9hwBCrz9ulNE/5u+Wtq21Evswn1RK0hvz+JA9oOfKKmtdW0jvu?=
 =?us-ascii?Q?7MfN7PUfwyu38GLa/txj2QuxygDAd+m8x4L7mlJ4gd0yD9ZM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990fff5a-d6a1-4768-cd26-08df43850063
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 01:57:42.5850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRwjtKseaVrP4Bjr+h4PN3C6L9LOTRoYFpPWAaicU8Pcfus7p0UXNDeXgR6YsTa22V6ZcTIIFwEF4t9LEI9Dvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB793063
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

AMD General

This patch is good for me.
Reviewed-by:Jesse.zhang@amd.com

> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Monday, November 16, 2026 9:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Subject: [PATCH] tests/amdgpu: skip queue-reset tests on Navi10/Vega20
> with LOCKDEP
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Temporarily skip the queue-reset tests on Navi10 and Vega20 when LOCKDEP
> is enabled. Keep the existing behavior for other ASICs and when LOCKDEP i=
s
> disabled.
>
> This avoids exercising the affected queue-reset path under LOCKDEP while =
the
> corresponding DRM fixes are pending. Remove the workaround once those
> fixes have landed and the tests pass.
>
> Cc: Christian K?nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_queue_reset.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tests/amdgpu/amd_queue_reset.c
> b/tests/amdgpu/amd_queue_reset.c index 7f445eb8d..0e2347640 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -26,6 +26,7 @@
>  #include "lib/amdgpu/amd_deadlock_helpers.h"
>  #include "lib/amdgpu/compute_utils/amd_dispatch.h"
>  #include "lib/amdgpu/amdgpu_asic_addr.h"
> +#include "lib/amdgpu/amd_platform.h"
>  #include "lib/amdgpu/amd_utils.h"
>
>  #define NUM_CHILD_PROCESSES 4
> @@ -498,10 +499,19 @@ static bool
>  is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info,
> uint32_t version)  {
>       bool enable =3D true;
> +     const char *platform_name;
>
>       if (version < 9)
>               enable =3D false;
>
> +     if (enable && amd_is_lockdep_enabled() &&
> +             amd_platform_get_ops()->get_platform_name) {
> +                                     amd_platform_get_ops()-
> >get_platform_name(gpu_info);
> +                     if (!strcmp(platform_name, "navi10") ||
> +                             !strcmp(platform_name, "vega20"))
> +                             enable =3D false;
> +     }
> +
>       return enable;
>  }
>
> @@ -1252,6 +1262,7 @@ int igt_main()
>               igt_assert_eq(r, 0);
>
>               asic_rings_readness(device, 1, arr_cap);
> +             amd_platform_filter_init(&gpu_info);
>               igt_skip_on(!is_queue_reset_tests_enable(&gpu_info,
> info[1].hw_ip_version_major));
>
>               if (!is_background_parameter_found(argc, argv)) {
> --
> 2.55.0

