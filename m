Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508B9606A319
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 01:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jVdMKFu4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56D810E00C;
	Fri, 23 Oct 2026 01:37:33 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013048.outbound.protection.outlook.com
 [40.107.201.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4483510E00C
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 01:36:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQYPs87lfqSyDOgNPOqA5fzMcXfxbIj/t2plHfia5V8R2kTkYc7nLIqfunwVOuFsUzPjPTxwljcgE+UmfCJ9PjnnT9x0giJ1QVMdcdNEb0y2f4MCHuhWdQ7LU1LBZNZxIkR9Yd1sJTXDPwEm6FEt6a1vuhRjLZmCx8n89tXmGQZg/i+9JdqOtehWlP6rfNyw74p+PJMYeIJSq/84oE+0loIHhCnLIgnCHQhyiu0VheVJMLibgwhTvJDS4zntKxr5tpELhNvAGQddMfpptTzYgV+xD1MDCo2JyzXrdJw/GKETWoPU4R6cq9KwqZX9IDwvYLIsFrGoKMx1PDiPeKvCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kzOxm3VsWSqNgsidPqGliUtEEe0Tr5XEpX0A1sq/60=;
 b=ZuWy91LVIoZFgraWESbVa9D3B7mHzDdfNZ2xez2g1w9GEJONvOeAbjKMOhFBRjK5qPCoNL9pxMizFfmosK8qnoUzqb7OaoY9Mq8Vcjq4l8LfJmpmy5D6nGkhxZOsdqQHnEXcJKSrdzojOkRTc1W3nya8pZFcNlYtvXpOuFDPG4XgW6ekUCAb08wu+CZV4wmRgR5Uj+0Bhzr0xA/kwfKPSEHmhF94e8OgFl+5hypQJ8cN96K8BbL9QCvja8oYaUrmN9KGmMiK9eJ0/OLhZCCQkaFyC8LxxA1pG9Pd6xJADEfgdOv9iN3G2PJRCkW02dW/O21Py/obmSTgDWfn6iYSAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kzOxm3VsWSqNgsidPqGliUtEEe0Tr5XEpX0A1sq/60=;
 b=jVdMKFu4vJ1Sz3EuCBXb1AbqcYmq4l5F3gBe1ExrUqwGs9gKQSrgVmB8GdUlMpxptZLaVgCVEMFWnN9k2x8UiVL2xY5ZVUhK1qx+IGmlKoRX48+hWR8S2cAIcmS8q64R95rtwZH/Nmn1o3qlPyHSH6YK7k7CsQ8Ku6dCQ8gDUuc=
Received: from CH0PR12MB5139.namprd12.prod.outlook.com (2603:10b6:610:be::9)
 by LY0PR12MB325698.namprd12.prod.outlook.com (2603:10b6:408:3bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 01:36:33 +0000
Received: from CH0PR12MB5139.namprd12.prod.outlook.com
 ([fe80::8715:80d8:e0b7:7bb1]) by CH0PR12MB5139.namprd12.prod.outlook.com
 ([fe80::8715:80d8:e0b7:7bb1%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 01:36:32 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: RE: [PATCH] tests/amdgpu: remove the x86 pause hint from value polling
Thread-Topic: [PATCH] tests/amdgpu: remove the x86 pause hint from value
 polling
Thread-Index: AQHdYW0gkuJ++U4RskyZBX54JGUh6LcKWtsw
Date: Fri, 23 Oct 2026 01:36:32 +0000
Message-ID: <CH0PR12MB5139D8909F077C827CAD0154E3642@CH0PR12MB5139.namprd12.prod.outlook.com>
References: <20261021150044.52953-1-vitaly.prosyak@amd.com>
In-Reply-To: <20261021150044.52953-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-23T01:35:58.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5139:EE_|LY0PR12MB325698:EE_
x-ms-office365-filtering-correlation-id: cf9dd36a-8eba-415e-1f49-08df30a61195
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|261021123027099003|261009223027099003|261022105027099003|261022075727099003|38070700021|56012099006|11063799006|10067099003|22082099003|18002099003|261021121427099003|3023799007;
x-microsoft-antispam-message-info: 85Wd8Rds5wej6qPpXyZDaeFNf7xm9iA9LNFTL7UGb+ArYjPd81Q4sIUI5AFx5saqma0PHWD87s2Sz6hTbbca3xTXHa2JDLtywClsLuRZmbmA2mCWWeeE/Jjklj3kDAZkZp5TEDOoVl/RPEMjLR+TfqjlHgVedzYMKNHjzz0HjKm+A8vkX8/0ONLyzjbKxlkbN055eVS7fGSzhK33mgdPGzSLTMpOCFb3BUhyDNSnklKR8y0OqebFFyeA5c1GRRGQ3yraf74SXn1Kl38XMEBfo3FB67rKvgkm93nS7u72fpXuydktv1L36coGsUoypEiu8LlFAtnDag4Fba/beJSGCGt6uknOdqVQhKrUXR8zab4sQ66zIODhN6Y2i/tOlPxg74XADVAtz8xm7Dvh5LCCigR4LosPv2F2i/GRPoh2P51OPLh1m5wWV6ouBKxFJPvexYmjQbYhIs0OdiRGfOQSRPRQLicZOtXavd8k3gqxEVL5CBvZtysILQldTD4011pM1efHNYHPkJwt4MuHvXlseYVJKGNjQOIduQA3aw7D90rXRIqgcRZkyr/VL3NqSFrZ2M7wzn+1ub7o05MtGSdwAUwqT2nKQ6VfID882BKR2OnArhMUCaF5RxRlKW98TGI26hV4T+X2UxfuEAVsyNFl0t2hMYCZNYZsRF4sxRBe6zXQ1RqJpnh68vgseQbfRkSqi/MNeWGnVSoI2S9biSTTZw2OG+gWpC2kcGpN9Dr+KTo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5139.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261021123027099003)(261009223027099003)(261022105027099003)(261022075727099003)(38070700021)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261021121427099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x0lGU247RYyERiG3ioezoj1ha6GOeqLSimBMTSsAZhdSEFra6v6kuCEwN6NT?=
 =?us-ascii?Q?GrintsYxh8deUGWilaJcFC6B2Z34ipdLdUbkiAhfimkuNboLiDZzGmRxMj+I?=
 =?us-ascii?Q?t44uJ6WkVxqN7yC+0BlaKL63CUE0tL+cETOhN95ZnWracFG++KfHR4mqxFMW?=
 =?us-ascii?Q?JMnT4Fbs+DORMexKSL/f/oBEzVJ+YTvQ/txvoTCnSGmC8UyJCzQ6Uuae+wDB?=
 =?us-ascii?Q?tlPR18noDX38zNvXVF5C01w7fcrJtaa3QuTImD+c0J9N9yhIXjJF/wPgIRJN?=
 =?us-ascii?Q?RWws4+rdDv10ip0zW/OLdzfW6mw7l5Dhc21RZIhf2BTPmLQD/OR9jtf7yWEU?=
 =?us-ascii?Q?nXjzUEMu/kNf7lCw0QE3OUzHdZxp+trWMj4gSzeCCs09AUw38S7PHOGMc2Ly?=
 =?us-ascii?Q?hFvHdEJ86bds2evK3+DHHy5FvIsOLVKFwq8qB3gS8+G5i1IfIMZKTw6GE1qf?=
 =?us-ascii?Q?vsp+fnJVg/WrLOsLGDVDegfy9DypYHDryQMGQMlUbcbIXPJbHAOKZlXoWdRk?=
 =?us-ascii?Q?tLRBx7e55QITqV2YKixspYrbaThY8LWgx6LzdtogLByeTqSKAoB9gN9A56Mo?=
 =?us-ascii?Q?6JdjiMLJPe7+Nnzl+4SuqhhKoyy3xTqgbaM3DXIluqKoqKcYSRpBVVS9FJwx?=
 =?us-ascii?Q?85enIXLqLGJcK7kw9voIfnQiaNiAhTafHPJN27gdHqsS3Rz0M/cJQt3191E+?=
 =?us-ascii?Q?yx+6C6UNvKcTF3XYxpC6CP6mkCulVHrpzB5QW2IEYAvUC98aAAgJgKchEm+0?=
 =?us-ascii?Q?sEPu5StvBXVfOaoJsCufwcyq8koysXu2ZRVbrvjFQ8Js5mLtxxmW6sZ87X9W?=
 =?us-ascii?Q?uk+me8VBbBZ9MkquQDQvbb0MqHVFTwlKSkS3jKq0k9jPs3/NQO3Hk+Z4Du7h?=
 =?us-ascii?Q?s73Pvglfo7afmVgUvUtRaIJzLj9jSpops7Fzq32uVwCzUDxqPRPticuL0L6b?=
 =?us-ascii?Q?c+MOIBF914+LzsDRF1sDJaygHVaK8H75i12+QaQn1/w2I/heiDoOssAdSHaV?=
 =?us-ascii?Q?OdJ8ErD6wzYSjy+vZRV2VMV/E3ya7AcCNLSTXmIUzLQsGLNB6tiIAn32RpJF?=
 =?us-ascii?Q?XbsRkSJ9HLRUuzDtMCM3Q8IFLQutTzW13fyvy61fRJKjsgl6Mn87qud/HrvG?=
 =?us-ascii?Q?sFIAQ0w+HSaz1tBQGBOJvf2NCnschSBvi9MezDbXfdYAxdosA2kRN53lPLqh?=
 =?us-ascii?Q?LmEeaScITVhxn03ujaHWfBy0Gmea9OZSVgZ31Tvj18io2IwZZ7alfofJAHek?=
 =?us-ascii?Q?dy1oxwi3jAB0eWC3SoWfDOSWPzyLxm56ChKGdd8RV5o19SfpUI8RLV9rOCSb?=
 =?us-ascii?Q?O+DRtryuDxYPiAFjAV9fmY/oMgCEWop6aolb6mIRMgruYvW+cd0uZCnCTOhm?=
 =?us-ascii?Q?bqHZccWt4wTaNulVxjuYtvsPLM8+E9iWe9FsNDUXMsvt0W8gZwbWFwMIz8cI?=
 =?us-ascii?Q?XuOWxArQL7TrNXSJpAunwfd0j29WWqbgqRmHclVibTgMtGuVs53cELTVuhOv?=
 =?us-ascii?Q?90IQQ8pU7mRzlQl1sGmAyTuT2mzcXoexoDlAmfATN6SXeqJFnB8VavF4qA0/?=
 =?us-ascii?Q?LxAGkMGCLqiOztliVdt2tR4mmMGyD9a7NI1OtcHv+Kt57GDtvhg+m4W9m4RX?=
 =?us-ascii?Q?SSOKGHbh9qpzei6whCmyR/hJZ9S84ylAjB9gjsnRFawx0eQ6k4B+B2qOwTbg?=
 =?us-ascii?Q?IBAhE695tmW1vOS88hsW6Hns2iDyXj8M8hBYeGxyt6/ayoJd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5139.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9dd36a-8eba-415e-1f49-08df30a61195
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 01:36:32.7119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wZBQeFFPC/tWDmb2ZxWd2SrB0SuAG0qbLWB1mSw0Tlo9X0irQp/4s8ytV0F/AKEO9IhLcrAaOcDhPpcufI+Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB325698
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

AMD General

Reviewed-by:Jesse.Zhang@amd.com

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> vitaly.prosyak@amd.com
> Sent: Wednesday, October 21, 2026 11:00 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com>
> Subject: [PATCH] tests/amdgpu: remove the x86 pause hint from value polli=
ng
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> wait_for_value64() uses nanosleep() when a polling interval is requested =
and
> otherwise polls until the expected value is observed or the timeout expir=
es.
> The pause instruction is an optional x86 spin-wait hint, not a requiremen=
t for
> detecting completion or enforcing the timeout.
>
> The original unguarded assembly was rejected by ARM/AArch64 assemblers in
> debug builds. Commit 125c0289617f guarded it, but used x86_64 and i386
> instead of the compiler predefined __x86_64__ and __i386__ macros. That
> silently excludes the hint on normal GCC x86 builds as well.
>
> Rather than correct the guard and retain architecture-specific assembly f=
or this
> polling helper, remove the optional hint and its guard entirely.
> Keep the nanosleep path, volatile value reads, and timeout handling
> unchanged. With no interval requested, the helper continues tight polling
> without an architecture-specific instruction.
>
> This deliberately gives up the x86 pause optimization, which can reduce s=
pin-
> loop power consumption and contention with an SMT sibling. It is not a po=
wer
> or performance improvement; it trades that optimization for a simpler pol=
ling
> implementation with no x86 assembly dependency. Relative to the existing
> incorrect GCC guard, the hint was already omitted.
>
> The removed memory clobber is a compiler barrier, not a hardware memory
> fence. This change does not add or claim cross-architecture memory-orderi=
ng
> guarantees; it retains the existing volatile polling accesses.
>
> This is an alternative to correcting the architecture macro names, not an
> additional fix to apply on top of that alternative.
>
> ARM/AArch64 cross-compilation and GPU runtime testing were not
> performed.
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_basic.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c index
> 494934c1c..590163b7b 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -705,10 +705,6 @@ static int wait_for_value64(volatile uint64_t *ptr,
> uint64_t expected,
>               /* Sleep if interval specified, otherwise tight loop */
>               if (check_interval_ns > 0)
>                       nanosleep(&sleep_time, NULL);
> -#if defined(x86_64) || defined(i386)
> -             else
> -                     __asm__ __volatile__("pause" ::: "memory"); /* CPU
> hint for spin-wait */
> -#endif
>       }
>  }
>
> --
> 2.55.0

