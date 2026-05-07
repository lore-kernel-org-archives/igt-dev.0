Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49341CD3436
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 02:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E9410E570;
	Thu,  7 May 2026 02:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YQZ7CZM6";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013011.outbound.protection.outlook.com
 [40.93.196.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DE410E570
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 02:58:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ye1xuBmRoR7xO5VHVC79gvXtkrSm0sAiSg3uC48zuqmA2yvmMFnEoRPx0GSmDRf9+e8xQtkRVE21eEtXBcFH+1C+YChlWFkua6C7G4OrVj+nGSC4eQL4kaccEY/+WPkPkXfqyMojM9+FslUaI/T3QqzGUOwR5uE1Nk9XnvgYXFUXgUEoH9SCnPz5EsCaFL6nHelJNlDPusUXMamfGL2NdYP5g8RoYvXvtNgxODjSxCE9cRnYK///WDY++EX2I3n/W5nZ50dmIMG2GB+aZZ8fr17Z7x1LuZgRk41xBX4tdPpyA30FPsOGpQbkHjvuSB8l2ad8neNlvvT47tsJGeXnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnQzRNNhHz5IKnhViwXUScRCz5FdaFQmUkRspjVaYwM=;
 b=KnbQKoWVOfPKYV8bNORAHfx50SWoktbPnXQkvP7zWbCCsHZr9UDTzy0M0ag+Mz749MiDWu+ls7jiuL486aU3sewR2wIIZFTP2H2OXJn20v52t5RF9+8XvzPtePa3U8vjl8YgVAiDRU4Y+x6W26WPI/4IJCiI2XntXwLqvdM+r/SpAEFA51SyaSk823dzU/UKbrKKSDit4g5b1Rj//9YujBoZh7skL63rkR5k5NnlCc3EhdH6/44AjRGr4KF4OlBsufbrFsIe0K5Q7aXRuq5a1Di3OQsRldI0j+ivFZlXG200VFJz2nPXt82Vv6riWmxn64H2LpKDPq+c+BS6uCbQOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnQzRNNhHz5IKnhViwXUScRCz5FdaFQmUkRspjVaYwM=;
 b=YQZ7CZM6YSPd9yGGCFAoqF0bCVmxGU1phVYczADuzgJ6Sj8X+PkMPE/dfz44qe/5edXDQ1TQ4RZhD6y3sGRox22IkdXUR9pgO1w0iIYeMixor0/eMkWKL+yx51baJ11854dHpZAE19D5XXqly5iaPmiqQ2NCVmBbMNkZ+2f9OKc=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by IA0PR12MB8423.namprd12.prod.outlook.com (2603:10b6:208:3dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 02:58:06 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 02:58:05 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
Subject: RE: [PATCH] tests/amdgpu: Fix amd_fuzzing_kfd ARM cross-compilation
 with incomplete KFD structs
Thread-Topic: [PATCH] tests/amdgpu: Fix amd_fuzzing_kfd ARM cross-compilation
 with incomplete KFD structs
Thread-Index: AQHc3cy5pbp0v00uqUSYPMrUoamhZrYB3wLQ
Date: Thu, 7 May 2026 02:58:05 +0000
Message-ID: <DM4PR12MB515272B856347DC5E5EA7D16E33C2@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260507025340.164820-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260507025340.164820-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-05-07T02:57:56.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|IA0PR12MB8423:EE_
x-ms-office365-filtering-correlation-id: ff55afbf-17b8-4d1f-3a7a-08deabe47645
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|38070700021|56012099003|22082099003|3023799003;
x-microsoft-antispam-message-info: IL4Ht4oFeOehNMasa/p7ZRP8l9j7iv6DfTB/IfezmFdklxwz1GcGQVdGZnn/ChKfr/uyAkiB/JZZBLqTpdVBxF9+WQKXQ8WFO36lBoPSwST55VWeXjTLGlCMIxXJ02nRq3aJ/qMKgm8t9NdIOndWiJCZgChR9GZYSItftsIDWLfrLHpMhxsjxTpNsnW55Yj+l1T4BZonGMUelTCRKeCUNcCDBwa9bnv3hwzcn1TtaQTcC7is2f7sEkTlZC3YJZb1v/6xvNPX0H4WivbtExETofaDRaEf4+Ihz0FiYxqHN+jY0ER0BWSthehK6NW+DSPndfg1mJ5RvhixqqabnFb9HM0Cn9bsy8Ym+5ZNyHRBHH+Zdr3uGmgbDTURGoXJ4c5Juyc3j6SDdfOaIJgfkgUH518v2cZEZD/tmCXYhEewlj+v3irpsXysY/vn5ShrM10Gw9MYnlTX8uyNTqAN1FB9sf8YinP5hiwb57aDF3C3O7k21d7kwYmPrq5yZ4dkH5+N02Hi0tXp3f4G7ipSAl8sOTq8FlkQoIaafBtC5uGkrRwzabI1UpoooMiSHfExa9c3IYJNo1UFrhzpAUp6g49uLTQLfSJZD+aL7mxG6AaGpukCMmbdaRqTQ1dUWh0nqsPbIZIh90a647GVkS+NInw8LOM6jT0wgzc9ndS6CI25Nre+vpam2y0h9nq1Xr45JpGaVPqYK6H0z7bwVwrx5PRBJcXG9Zx/Q/ELALej7gF/am4NIMXVO+UHyHOMbvwohoiJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(38070700021)(56012099003)(22082099003)(3023799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ONOGRCfQdGOtvkNlMQtknkAr7ExSgWrjF9MJOWo01wxL7LTLCO6FiLDpar6E?=
 =?us-ascii?Q?pCs+5TX6sJyiwU9l1yFeR+71ldIpBFxb9yaW/SC0BtSoNLbi9KsvhicXOUwI?=
 =?us-ascii?Q?8cAe5xqeYQBK8myHFeCs7pTSs9OMLXpYaKK9JF9Udnwy94CaG8/J297uSsug?=
 =?us-ascii?Q?479LcTvT8Mt+6C2n6hImu6R1jUjxGdz1thhksDW/uqIEJp/M2MIsP5dykir0?=
 =?us-ascii?Q?9OkLIVjBOlxjs0I8AZEcPz33xr2UV4mGzZj2r8i7TWeKqXeJHNK7m4dUEP7d?=
 =?us-ascii?Q?i6AWaK0ON6EHoptzx91Yyc2PZKM1pz08zQzvAKjlqYLMn6OSkTOodloCT5wF?=
 =?us-ascii?Q?Hlkbro8U28nYcx/16N7RWW9q96WqzFxpdp3bfnV1RDH2lbpp4nsF5oYiGyMC?=
 =?us-ascii?Q?Gqd+HXSntOhu9tAEJZc2STdPQQd3Nz3vBA+P4lLgXlEnUFqEnzUjniNtLDkN?=
 =?us-ascii?Q?FNzhetnuxdo9pMpWjZ+WVboYEEhLBKU+yiuDbkIEq9qU5uJLYYDK3p0+QGjJ?=
 =?us-ascii?Q?KK7nVQ2ybHj1cWp5e6cgxZ4orIGR/8SdM3QDpxr0Xn6Z8Q5uSfX8fBWtrYQX?=
 =?us-ascii?Q?H+ZocOgxAJqpclKAZcP21Qn7c87yLGeuKoeghX3OO8iDGL+tvDqMeSIcijRL?=
 =?us-ascii?Q?cD1+ykVJOiuFMTASbJi42al+mzLwpqudvRwKPw5E294L8FjUbnHYEXJyog5s?=
 =?us-ascii?Q?BoGYuudLtkWr7UQdiYxU3eLQBiCaBbrQjtUVm6fhLzhVYUEcRjh4ptqf1/LM?=
 =?us-ascii?Q?24kkQy+D0/zieuuXfQsf2K5LPHKAxB9qe+We9+6P2XM2/MJEV/8wfX3hZ+AR?=
 =?us-ascii?Q?XXEOR8xSRjQjAAop3+/NdEYR1X2GI2Voz2BQGNHuJc8yX/tEENawhvZsl9Vj?=
 =?us-ascii?Q?PKhfAt1og/dS+bv7q2w5VhlNivkm2v+5TbWWFtwBtBNIeVCCF+Bh1jw5jaoB?=
 =?us-ascii?Q?fCCew/tumFFWS3d8R7XsrmPQShoIoY3zZxauB4r34myFfe7v3J0LVavT7CwV?=
 =?us-ascii?Q?HuPyLPAvZuch0xbteGbWDvxHRrrjyWHM9NQeDILxs7fiFQ7K9u29Pa7jVTVu?=
 =?us-ascii?Q?iXWSfOdw/TRTrrcPm0XiR+5MLeey94UAHjm06GD44zI0TxohhuxZp+C3zCjB?=
 =?us-ascii?Q?bz0KRLSn8Uopim1H0/htgkZov07Vk++5Q148xN4ahdFSKy/K8a06Ct3vETId?=
 =?us-ascii?Q?rupblKQFJA5vI9dFclPgN56t1EQQa8FTNb/c3F6/NACVWdkyntRjHXBEvM8w?=
 =?us-ascii?Q?qrlfEJDNLmuqewxfZzRDP6r6CVODWg3DOE5XjBDjPOh/7FoMzGGR9+5Ri/OF?=
 =?us-ascii?Q?RuoOqh8p9oAT5P/smelERrDGhiolJUKTnYvAM30lwo0rGRnoC78NdrYcCTrV?=
 =?us-ascii?Q?Bnls4RVwKvn4QaHQVueIBfBpMLJPcErgDZ9d6/lMqfwpj1DHOSWnEZ4DvwXO?=
 =?us-ascii?Q?ae4Hfu/9igeaeELSErTpYUsrJfEDt3rjH4s7a1BAZKeEl7LeDJ13UhiZLLZQ?=
 =?us-ascii?Q?yAvETpcZoGK1RjTOeOkisl1UveturR1MYl5MA5cYtpomdF6Zb/A6d0rsQ3lA?=
 =?us-ascii?Q?LAFNbPqq1jpEfQKdgLjHFIZJsTDVavUVYXW9arc2Cmgjk2qkOtuRjhigSq+S?=
 =?us-ascii?Q?sj7sEFBm9GC3TkwP0k5vveMLg5OgrHfgQ7zOHB80nS4/paZ/PTDzTGCEhHVI?=
 =?us-ascii?Q?9FWT2ZA7KrvUcMMIw6Dc3KuDpxCdFEokF9JIc7/E9o1KCUI2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff55afbf-17b8-4d1f-3a7a-08deabe47645
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 02:58:05.7740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QEPJLqaTxE2YW96P/QVjl2ga8y0rxFG14UMtoJF6BIhwXHz71k/4wRfrDlA8LrKcLNyd1akbRCOKnAPpNupteA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8423
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

Series is Reviewed-by: Jesse.zhang@amd.com

> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Thursday, May 7, 2026 10:53 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie)
> <Jesse.Zhang@amd.com>
> Subject: [PATCH] tests/amdgpu: Fix amd_fuzzing_kfd ARM cross-compilation =
with
> incomplete KFD structs
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> PROBLEM:
> After the previous fix, ARM cross-compilation still fails:
>
>   ../tests/amdgpu/amd_fuzzing_kfd.c:81:18: error: invalid application of =
'sizeof'
>     to incomplete type 'struct kfd_ioctl_svm_args'
>      81 |  KFD_IOCTL(0x20, struct kfd_ioctl_svm_args, SVM, 0),
>
>   ../tests/amdgpu/amd_fuzzing_kfd.c:82:18: error: invalid application of =
'sizeof'
>     to incomplete type 'struct kfd_ioctl_set_xnack_mode_args'
>
> ROOT CAUSE:
> On ARM cross-compilation systems, linux/kfd_ioctl.h may exist but contain
> incomplete struct definitions (forward declarations only) because:
>
> 1. KFD (Kernel Fusion Driver) is AMD GPU specific (x86_64 only) 2. ARM ke=
rnel
> headers may include minimal KFD definitions for compatibility 3. Some new=
er
> IOCTL structs (SVM, XNACK_MODE, CRIU_OP, etc.) are missing
>
> The previous fix only guarded the #include directive, but the code body s=
till tried to
> use sizeof() on incomplete structs, causing compilation errors.
>
> SOLUTION:
> Wrap the entire KFD-dependent code with #ifdef HAVE_KFD_IOCTL_H following
> the pattern used in amd_kfd_dmabuf_unload.c:
>
> 1. Remove the old #ifndef KFD_IOCTL_MAJOR_VERSION fallback
>    - This was insufficient for incomplete struct definitions
>    - HAVE_KFD_IOCTL_H is a more reliable build-time check
>
> 2. Wrap all KFD IOCTL table and test code with #ifdef HAVE_KFD_IOCTL_H
>    - Prevents compilation when headers incomplete or unavailable
>    - sizeof() is never evaluated for incomplete types
>
> 3. Provide fallback igt_main() for !HAVE_KFD_IOCTL_H case
>    - Gracefully skips test when KFD not available
>    - Same pattern as amd_kfd_dmabuf_unload.c
>
> BUILD VERIFICATION:
> - x86_64 with KFD: Builds and runs successfully
> - ARM cross-compile: Builds successfully, test properly skipped
> - Systems without KFD headers: Skipped by meson.build conditional
>
> This matches the established pattern for KFD-dependent tests in IGT.
>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_fuzzing_kfd.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/tests/amdgpu/amd_fuzzing_kfd.c b/tests/amdgpu/amd_fuzzing_kf=
d.c
> index 585cfad3f..146702be6 100644
> --- a/tests/amdgpu/amd_fuzzing_kfd.c
> +++ b/tests/amdgpu/amd_fuzzing_kfd.c
> @@ -19,17 +19,8 @@
>  #include <linux/kfd_ioctl.h>
>  #endif /* HAVE_KFD_IOCTL_H */
>
> -#ifndef KFD_IOCTL_MAJOR_VERSION
> -#warning "KFD IOCTLs not available (missing KFD_IOCTL_MAJOR_VERSION) -
> skipping KFD fuzzing test"
>
> -int main(void)
> -{
> -     igt_info("SKIP: KFD IOCTLs not available
> (KFD_IOCTL_MAJOR_VERSION undefined) - test skipped\n");
> -     igt_info("SKIP: KFD IOCTLs not available
> (KFD_IOCTL_MAJOR_VERSION undefined) - test skipped\n");
> -     return 77; /* SKIP - KFD not available */
> -}
> -
> -#else
> +#ifdef HAVE_KFD_IOCTL_H
>
>
>  /* KFD IOCTLs to test */
> @@ -301,4 +292,12 @@ int igt_main()
>       }
>  }
>
> -#endif /* KFD_IOCTL_MAJOR_VERSION */
> +
> +#else /* !HAVE_KFD_IOCTL_H */
> +
> +int igt_main()
> +{
> +     igt_skip("KFD headers not available at build time\n"); }
> +
> +#endif /* HAVE_KFD_IOCTL_H */
> --
> 2.54.0

