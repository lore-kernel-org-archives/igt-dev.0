Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2116EC5DF81
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 02:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA32110E12A;
	Thu, 20 Aug 2026 02:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2DFEAe/g";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2797110E128
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 02:03:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItDwHuJW1of0BRfEoOcVte8HyIGcY5FWMJtyTOI0FCteUqbYlub2J2qqpIsfp6o1B+r+1UIzDqW3dkrJ9ZmMr0hu014jo7SGCzHfqpX+zGNrnv0c+G69ywV8k0hI+RM9uiEvDsMQRwv3LvjnP02IcftisG9aO7QsUqIxJDfvRQ/sgHZpZqtrrmjE9mEwExU966Cy10+AIzAqWNhBNsmaESL1g4ItWuzfu31NC03Xk7Z+Dl4+92oVjmY9GDSI7iUJUPX+4pi1mZytiW5P13NgUdZzCH8PzhgKiSLOX/Vc+I3qE8FGxv1gkoq9wcpwHAEP7rKJtktTxO/Tnq7cTFHtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQnfPgSa1vno6vpS3veq638pZ8K65J6WKSiidwedhOI=;
 b=ExzvVpmRx7ysCEzBSw+OwEbiqQHmx3iCtQ92yM45IhEfMRvPkhGD/1UIkslUyez9bnYlfMUeYj2a26e1p6NkfJ79xhaeT5PWZWikgG6uL2YSriiGWNxhyeCs2J0B8FoiDWRW2CDofegbZA8LkXP6eOfoODoqGV/l1CSybU5rrcOPe4HUTLQvDChrgh/BdRQeCfOYHMfctDupBOZHLftE2+T54TZMPI7BH5A1FxbH2nnz8mLKImTsRiPJh4IqgEpCt52dkVcSo51zHgdjV7OICYVHzMuVqsz9Pw8M8VmZj7hUKL4vW4+1lghjE077Sgr+5U9hI6txSPeoG+S2ItsyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQnfPgSa1vno6vpS3veq638pZ8K65J6WKSiidwedhOI=;
 b=2DFEAe/g1S9peJDgQJ59nm/0bK7YVC4fu+YEFq7vpUU9bJyDwwEmC89rzLUMVQhZO7rCkCv0GQWRRFLVnFXNZjp17gqFpONSgll6GfqIzrJ4Km0/IeZQVlo7d1C91jAM79eSxFVzmIRi9RZnNF2i/e4vkbHMQ0D5NSYWr0s0XLc=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DS0PR12MB7535.namprd12.prod.outlook.com (2603:10b6:8:13a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 02:03:09 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 02:03:09 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "krzysztof.karas@intel.com" <krzysztof.karas@intel.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
Subject: RE: [PATCH v6 3/4] lib/igt_core: Enable automatic platform filtering
 in subtest execution
Thread-Topic: [PATCH v6 3/4] lib/igt_core: Enable automatic platform filtering
 in subtest execution
Thread-Index: AQHdMEM6eQa0xRHO2ECBXwZEhLotabamL4wA
Date: Thu, 20 Aug 2026 02:03:09 +0000
Message-ID: <DM4PR12MB515289E9B1CF4057D8359E55E3A42@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260820012820.129589-1-vitaly.prosyak@amd.com>
 <20260820012820.129589-4-vitaly.prosyak@amd.com>
In-Reply-To: <20260820012820.129589-4-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-20T02:03:04.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DS0PR12MB7535:EE_
x-ms-office365-filtering-correlation-id: 962664ba-31d8-4b48-f344-08defe5f2e9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|3023799007|22082099003|18002099003|11063799006|5023799004|4143699003|38070700021;
x-microsoft-antispam-message-info: UJ7roBmor/3U5I5Cr9+WKgYqCnC+VdxW2Rhbk5QFjNNcgSTNMuZZNmD2jHIn3VI/f1sRliq5bsRjlULAdS744C/Z6dPZJAHHwsoZ/QjsdOnJYsuxneSvljIqSa2IdjeO3wbSf8J57KIcKGFQAp/w1cMxcSum2SdPuHW2BBO3h4zkaBbciD6IigQ//o3navCWF6p8iKZd63AMsAO/TshSD9EZZwjEuhJRZChIqPPrFHoY7lmSr8tCLgoPA/VZcJY9n8O0XIbbBR3ETUoqgjnA1zjaPWD8C5LMYV8SRxLt51wpzqfUIrZuh2kqbqDs4U0UL4VhV9p8wQG+aeZHpPojiRQNfXKjiBQ/ss4EGiD33F3mxTNpykaOkfQdWDiAsT/xdJdiqbhxzjWqYeyUADU3+f+3CSFoXM07DciXYJXkUFInKiiQYkXXBCMAkJyVBqsVMQntaeQ0nrbtspugMTCk6AzbLaQRc2wNGQ9jAt3bVqjoh5kjN5jwpl/1oxcngyNKym9hjTL7UIZzwC1xLmNEY5uPcTit+J2d1vQEOWjR1amuMfHQV48qPq2iw33jSzxbA6LRpK8rw34LHHE+Blaoe9AAle5aPb3VlBm4+JMGgqirlqnxRiQ/3TMekygNnxnNpX30weRfmKRt6GJrfhw5WxLgx++BhtvTXWx+okr2NePQGIbkCVmJtWRy+lBqXbGRxMZ7KwR/NTsLpyHbRkipbl/xN2TTP3rC7ylDKepRM/o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(5023799004)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mW7+86MmECW3xegLw3Ne0UoBgJhRCB7OsuBvsWWC9w7EXrXlndP0p8I7g+fP?=
 =?us-ascii?Q?PX+gSEr0Ykfm+SXRwL9K7bOehSJCSj1ge18o1tg/DB87eXUuXQ/eqkM4SsVR?=
 =?us-ascii?Q?/bwt4Yd/YqBgJ8iUVFOkyk+o5cS0vW1W23bRmErFRxxflOJVhaE2RbRh3JsU?=
 =?us-ascii?Q?ITIURNp6efoV4DAjTFHqxkRpcmK2ikM4dEc+5d59D/RTay9rZqkJPm95ZHAG?=
 =?us-ascii?Q?7pmiAMFB9huE9EwxCHhmtMSkAio4Ym2RgenKfHDDvAG1qYxWyB7FNyscPcVz?=
 =?us-ascii?Q?xrvkX7y9roTGIKV31/zT17bl5dZcgacvdfUWU51kUYEVNWJpyBxpn0HppH6B?=
 =?us-ascii?Q?ClwTFvy9ZWnjULe/FCisQ38S4nv1Xtzd2B+5u0KkYkgt1T+Ci/rmxVMPj75R?=
 =?us-ascii?Q?9W+9kAGNe2ARy8DMMHafCiMvBJuuypvS2KD7ZsVRsVRwSywcmCaLqluJJrC/?=
 =?us-ascii?Q?R2T4bDuqSNsnwi9RmUsXDKln+Hq1jvFFcOoWBC5fMF4sFIhofvBkJSIf39zZ?=
 =?us-ascii?Q?8AXxykEczYtj5MYhF9oLx4W3N9B7lWRdwerBUUwyCkOUV2Stg4jqA5cBHUCj?=
 =?us-ascii?Q?XBPYxBdrAPQuvLQ+sf3K76rEeFUsLiAKjNnehaixYbZrMInv0Dgp/ucVbhcH?=
 =?us-ascii?Q?oILiA0SO3wdfIU5W/9f+HY6EcA2JC5N6R3aXhPuj0xoeBg55951lbGhbSQKS?=
 =?us-ascii?Q?q7BucaRfAw0P9hv89HHHsCBdl25WWIM87CTSaSV+6GogmAZ0Ft5+fUrWN0zd?=
 =?us-ascii?Q?d8yHJDZFz+au+5vruM4orW9Fl3VsVPPGmnQOusaBi9nwki3zWEBbvfYsvSUO?=
 =?us-ascii?Q?vljM9aKvkE2CtPlQ+9v31fMRZuUqy3FYg8OWsWPfMWpzD19zeb5U4QEyvyg7?=
 =?us-ascii?Q?43QC7wf3AVqZvKiYFzYvUIA68HXGGUWQieSiWh0FxnJrU3ElgIOACaGudCBJ?=
 =?us-ascii?Q?YVHUUEpjuNJBg8E9oZ9xDxEgfC/jGxak1Nqme7qCdwVkbufcTeBNLDB8G7n7?=
 =?us-ascii?Q?kdpat5efNwZumhfGmGbqAaxYi7fGQfUG6lc1Whag0pXcdiJWMvi7zfq10Fpw?=
 =?us-ascii?Q?PGl/ZPykJasOAsKzaL8/7HWB6qLgdyFuSXTQlyR/vIhcA2+bvOZRX4Gx/Lr3?=
 =?us-ascii?Q?J1Fm8i0W21IgwMcAmRgiAB19bV5HTHiFQVCZMrfVxAnDhnzjW+8JL1p+nRR4?=
 =?us-ascii?Q?9oznZX9jF/0D9NJZ1I+DEHdqRwm0WbvztWQ9gUAinFb/JiL+v4Zg4PDj0CrK?=
 =?us-ascii?Q?traa/XbHV1+AVnfEP6cam7UUd4yeMjeiaEMF7p8ZJ+LATTBaVkqryVTymORu?=
 =?us-ascii?Q?XEIZK2YuMMtKayLTKRTv+BKhEC21wa2lZXT76/njZu+gfws4uqQyyUq/V4Ia?=
 =?us-ascii?Q?tNM0fW+Ebb1Wg407D8AZ90uyD1ZLt3O93awF4tDIBWGyNSOBCCwjRIB0KkCL?=
 =?us-ascii?Q?4OtWqiGhSb9Ifdo/N8tuWA4CrdB40iqVzfiy/bIFmecDIpn2TodSwO5avmQN?=
 =?us-ascii?Q?+SoFJxxkOu2GdXWbwEaolD+4yKli2ZMTBiPVQDDJJII4htVbodMRVuQ8ir14?=
 =?us-ascii?Q?lwNcDcu3uiJ1QuWNUtv54RaH0aeg6LmBJdTTw3wmDdmr80CJmJhr3Nf0jSAG?=
 =?us-ascii?Q?Uno8ksyDfuaW14pgHUaPVgGQb2h6wRKUp2Xwf3HcCQM3ETI1n8utHT0q79I1?=
 =?us-ascii?Q?wci2vYmk352F1I1GY0rri4FbYNby7tzC6Z/7+a09IfE04ke8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962664ba-31d8-4b48-f344-08defe5f2e9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 02:03:09.0380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cPwi3CTomTmST1whCu9Gt/rRdAcOtY5LuM+fvl+5VBe0hnZQiIzqwytgyDVHYOzokexa+aBSEEoG0vvKnrg+tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7535
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

Review-by: Jesse Zhang <jesse.zhang@amd.com>

> -----Original Message-----
> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> Sent: Thursday, August 20, 2026 9:27 AM
> To: igt-dev@lists.freedesktop.org
> Cc: kamil.konieczny@linux.intel.com; jani.nikula@linux.intel.com;
> krzysztof.karas@intel.com; krzysztof.kozlowski@canonical.com; Zhang,
> Jesse(Jie) <Jesse.Zhang@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> Subject: [PATCH v6 3/4] lib/igt_core: Enable automatic platform filtering=
 in subtest
> execution
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Hook igt_platform_should_skip() into __igt_run_subtest() so tests initial=
ized with
> igt_platform_filter_init() automatically skip filtered subtests without a=
ny manual calls
> in test code.
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  lib/igt_core.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_core.c b/lib/igt_core.c index 2f737b01a..0ec7b4861 1=
00644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -80,6 +80,7 @@
>  #include "igt_rc.h"
>  #include "igt_list.h"
>  #include "igt_map.h"
> +#include "igt_platform_filter.h"
>  #include "igt_device_scan.h"
>  #include "igt_thread.h"
>  #include "igt_vec.h"
> @@ -1525,7 +1526,6 @@ bool __igt_run_subtest(const char *subtest_name,
> const char *file, const int lin
>               return false;
>       }
>
> -
>       if (skip_subtests_henceforth) {
>               _subtest_result_message(_SUBTEST_TYPE_NORMAL,
> subtest_name,
>                                       skip_subtests_henceforth =3D=3D SKI=
P ? "SKIP" :
> "FAIL", @@ -1533,6 +1533,22 @@ bool __igt_run_subtest(const char
> *subtest_name, const char *file, const int lin
>               return false;
>       }
>
> +     /* Automatic platform filtering - if initialized, check if subtest =
should be
> skipped */
> +     if (igt_platform_filter_is_initialized()) {
> +             enum skip_source source;
> +             const char *reason;
> +
> +             if (igt_platform_should_skip(igt_test_name(), subtest_name,
> +                                           &source, &reason)) {
> +                     _subtest_result_message(_SUBTEST_TYPE_NORMAL,
> subtest_name,
> +                                             "SKIP", 0.0);
> +                     igt_info("Platform filtering (%s): %s\n",
> +                              source =3D=3D SKIP_SOURCE_BUILTIN ? "built=
-in" :
> +                              source =3D=3D SKIP_SOURCE_CONFIG ? "config=
" :
> "env",
> +                              reason);
> +                     return false;
> +             }
> +     }
>       igt_kmsg(KMSG_INFO "%s: starting subtest %s\n",
>                command_str, subtest_name);
>       igt_trace("%s: starting subtest %s\n", command_str, subtest_name);
> --
> 2.54.0

