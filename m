Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117CE6091547
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Cwxvelpf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B2C10EFA8;
	Mon,  2 Nov 2026 15:11:26 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012064.outbound.protection.outlook.com [52.101.48.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2994F10EFA5
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 15:10:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ys4P/KKi+7P2XQs5xSfeXNeo/LFXotxGGFTqvOGY5TjbVll0Yd7qIpqZxD3E73QLSJtEbv+QMrkDgSpmsbWPxr9DNP8hysUkJaOSjYkeF54sRmIEZ8qAWSTBLsthkXibQPKBd9Xd3AJPw+9+pTF3+4OnvZJgXmCUpL6ejboUoxs8JRHeUwcz79vT/CwuOH/q30Xnc5+85yF2cmQJWNSimBY8NN6mwoTamqL/DF/RveG50chhkr7WGwFKfYE80uh+qbauP+TNzNsMGUQ75J0yHCC6tkDAgp8fPrp7ig6Vu5Uz5dhtEOWfd8KV9ir0FR0Gs1ntXfXaVRGmOS7FIRlfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U757AosKw1lFGpAHIatf+W4+m4PA7IhoBxKAUurA6m8=;
 b=gdJu4Ru9oisQQS+7zD3Gsv5jNWcch015FNpc3gWIHUAS0BLS04QkjBBkrjmEOT4sE92ts5THcku+ry3mZU36cEudOJbNCmDNgm4LHl3fXM0dry35x9FUQ/JdzcX+7yQPlpCLCeP4gWHZeIPdcRhVMXxh27N41aApRvzeNoqCY+1wk3vM4MUmfzZ4NlaDFsZrG86+tB2GlJHmUsTP8OnBzlrVtzU3MBwaWiqilTD2zIgbYRLvHSzOwRHI/tTbv1GUM4HYUY+ymCRMfRgugBjupqZSlNHmU/PMDskj/1efMKNGJVG/r+uqNcfKT0CGp47zdE2zP3h5MV9gasxYoPhoYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U757AosKw1lFGpAHIatf+W4+m4PA7IhoBxKAUurA6m8=;
 b=CwxvelpfjUS5HnWhLLC3SmDDA9KXZLKo0FfiKM3ZzTDJQWcU0P8hKrIWI2XxC8dbF4lwaO95n9BbeIhMZCFTb+XKn5WOKxdO9/UbnCrWv3ohZKeYtga0LJFa6rJWDw4JkodSij+RksHuZGrzqHgUSQcIYdW+UFq3boCJvOZ2CCM=
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::7) by BL3PR12MB6451.namprd12.prod.outlook.com
 (2603:10b6:208:3ba::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 15:10:24 +0000
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74]) by CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 15:10:24 +0000
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
Thread-Index: AQHdXLUaFgM8IEB8/Ee5BROA8EnbLrcUaw0AgAaOBac=
Date: Mon, 2 Nov 2026 15:10:24 +0000
Message-ID: <CHAPR12MB999247A855D151A61B5801D113EF6A2@CHAPR12MB999247.namprd12.prod.outlook.com>
References: <20261015145355.3972674-1-David.Francis@amd.com>
 <20261015145355.3972674-2-David.Francis@amd.com>
 <DMH9D1GKZHCU.3TINOPEPE1G04@intel.com>
In-Reply-To: <DMH9D1GKZHCU.3TINOPEPE1G04@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-02T15:10:23.755Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHAPR12MB999247:EE_|BL3PR12MB6451:EE_
x-ms-office365-filtering-correlation-id: 0e39e2be-90bf-4c7c-5c0c-08df38f36bdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|261102123227099003|56012099006|11063799006|4143699003|261022075727099003|261021121427099003|261026140227099003|261022105027099003|261026121527099003|261009221227099003|261009223027099003|261028144727099003|261102130727099002|38070700021;
x-microsoft-antispam-message-info: vB5iImqwL6MYY0mNtz/gwI5BJWAW9zjUzsStFJ9y6VbC9FmVNfO4OTuV4cm15Bxiw8twC85YNk3isREPvnGKiCatvd3BO8KpDXJYJYs5Xcl9tEowwSRCFMM5IB/YIIF9+JIUNd9rODkHiw/9AZkeayiE9iymEBJ+/7UjY4R2G3MSpAQ9KTU6e/OG12xZ8fkHujul8S0e07DppHBYdVIv/5ca/rppX+EeAJU6Oytz7DHtduXydhRHv/t879G8t/qTIMq1q8U5MyEZAyNTmeWFSQ8vbAm4uFWxuJT3pPHHSBh+NvE/lr7dbmNGjF6o9045UYuC5Rb1fYWxwvYRMaTC+taeM7ESG6a0u6S2pcA2NO+i8W6sQDklICwP+paOtzSVhoTl2cYKm/tCLDDkEru7L2rrZ39VS8ejEN0EcJfRrtpSkgzsdj08w/v3galEp4aL+JX1ey/zzowt9sxUaaanah/UY+Pgt3ke/6o7Ufrj2OdzFaGqbOtfdMnLz4cM4LXyOLcNzdMlhg1AFJgjNNS0OBEE3LuSG6eFJWWLC79fOQ1GxGMc/crjMgd6Y9CZP+XjXCW5hT1RTt3gRaufov+73DFCLQnyjX8r42w+NhKxFh5wOLCSkn1RNFn1Lp0LMwJf/kjI2eCmqo4EaLXoDY2k7r7fr7dW/dB+Cc7YcTZFf1I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHAPR12MB999247.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(261102123227099003)(56012099006)(11063799006)(4143699003)(261022075727099003)(261021121427099003)(261026140227099003)(261022105027099003)(261026121527099003)(261009221227099003)(261009223027099003)(261028144727099003)(261102130727099002)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KmYs2ZsvhUBzkkhW0j70uYRqCxdJD7IIsnFrjZf3Cd2DSgPk6aW7Q+LdorBg?=
 =?us-ascii?Q?TeclJ6N5vhXezQFdVFOdKcS2p+awQXJOvxBVCYfc+Ttlyqkn5mN5RvRcQV1K?=
 =?us-ascii?Q?qR1Utyh9BryRpXYbjD8w/KnnH7k1R987DddI5aXG+I1VhNSX6j3pTewSMvSB?=
 =?us-ascii?Q?nVWLcHuai2yPXriGtDc3HxGy37hFs8iLbhp8riXOr4jjrMidx8ETvbE6u2Zb?=
 =?us-ascii?Q?tQvPFYkY6aC1jeLWzeCstIlpSAvr+dOoPF9nEReVrf03NDSlKbUT3t6rqZGg?=
 =?us-ascii?Q?pF+VH9y/vBMeFxC/eXOnYwlatJoTel7Z7D3hSWVcYpoL3qLeuzimKRNY3Zqw?=
 =?us-ascii?Q?X3pc8dJKyFTbXtcAvVPMmnqDR/99z1YM2LK2QXa2YeVwYhLVVieF4A2BBA+V?=
 =?us-ascii?Q?GkmaRmec0H1SA6BewlIucK1e21x4rvpV6kPEGD10k674FaPb1SWYxwXmXCey?=
 =?us-ascii?Q?WjklV4YpJXXb2vZbewyGh5ogPAIruvnU0EmyOLsOHx113Rcuf3rKi5vXaS6Z?=
 =?us-ascii?Q?EwSS4GH0uzTl+d/PwPpWl87odZwTgs8eBa51AznPYXeBL8AXWl2vrme1jNFd?=
 =?us-ascii?Q?BaEFMN4e+lg9u/ltQQW/pL4IwejlxC/irtxFo9fS1yeagH743yrq4G/CZgff?=
 =?us-ascii?Q?W4r2f6LJixiimxZdm8TKtCHAgnxQBPsyVs0mBWSTZoqkZHCw7Af3I996nfqW?=
 =?us-ascii?Q?b74Iu/Ud9K34UBzKOclIUFqGtzKOY2vaYEBpfh+ch6DmEAWvgUOp9pyZfqm0?=
 =?us-ascii?Q?n/zaQVSNODvkwXl5VtR565JBn5hN3AXpeyZfCimlTJe7BPZx961PWId9Q777?=
 =?us-ascii?Q?nfFHUCu5Wni2ltW1OCZ5xUjsak62rtEQHFbw0ucpuhe+IyNcTX/AR7agllDD?=
 =?us-ascii?Q?irf3HzMAx6dLZPyLcW4VoDd0+1zUiq3ICTNboENJWXBPfav2ha+k3XMXS88Q?=
 =?us-ascii?Q?KT+bw+aeSVD68W9iMVcmq5aBfqrL+Aro12fJssaoQ6q+S/6dZiY3Cq5BE+nF?=
 =?us-ascii?Q?t/6ZOugX53j4nrfSmXo/+lihHk+xVd2tTkgbyhknsmnw4t8KcgQWRqsz495A?=
 =?us-ascii?Q?BlR2I397CZHh6d1W7K+lID65jE8ZCp+qMJAeRRD66JjosJ21Tp9FmphrzIet?=
 =?us-ascii?Q?CuCJGMtm4G3iLLRICUFChxJnSiHcbtbGauq4h7powyv09IzWA1olbk9U9NO4?=
 =?us-ascii?Q?gJ1oki1oFlaYFd6ntsIRfyJfXYChxHgVDdAPKGjXjtYY6B7ltnM4q57PbxmG?=
 =?us-ascii?Q?pPujDuZs7mfYBcP3btnZy0DuylR7mNN8xDXGP/BhdIkEELZrz3VE45E3BdQM?=
 =?us-ascii?Q?CC8ezxq3j5uVKCE8zM2iu5ebTX1pkavrRFGT0T7ZiN/2pi5g40L4LIlsfb6V?=
 =?us-ascii?Q?wjt54lyUXMC6s7xbD51NdAhorA6+x8vR+hN9+85O/OSpgRmgAIaM7q/n9L0M?=
 =?us-ascii?Q?xS7LUwdgz8AxRwd7eQRFaNDh+xENwOi/+JKz38Cwju/0dgYDTH0mnRB23xlk?=
 =?us-ascii?Q?l1NMBYzYEUxNiDmDmbRUaKMr/OGf2pULHYAs3iJb+Zpcz2RryFrJIIgpyjGF?=
 =?us-ascii?Q?BZ4o3gD+s2U6rtQXHDD4BHJ4XC2Z4fEN3AiGa+7XRVW20FcyWFzEdOgIxRFq?=
 =?us-ascii?Q?CeaC0gdqa3GeSomDSI+iNhiVtQ76CRqYbrQIWe04GRH6y1x1rkQZzSou/pVZ?=
 =?us-ascii?Q?GgIN36JYG73t7UNE7jspbwrbAq7HuMd4LJqBykbHG/msLKwi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999247.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e39e2be-90bf-4c7c-5c0c-08df38f36bdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 15:10:24.7451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OnVIZS0HWpHrmOQCYWWNVsd/ygGUXLVpVqICVIx3++OIQnVN7U0NGKDO8npR/AHn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6451
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks for running the tests. I'm new to the IGT development process.
Are these tests good to merge or do they require additional review?
I have this change on a gitlab branch
(https://gitlab.freedesktop.org/fdavid-amd/igt-gpu-tools/-/tree/gem-change-=
handle-tests)
What is the procedure for getting a change merged?

Thanks,
David Francis

________________________________________
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Sent: Thursday, October 29, 2026 6:42 AM
To: Francis, David; igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly; Kamil Konieczny; Sebastian Brzezinka; Koenig, Christia=
n; Simona Vetter; Deucher, Alexander
Subject: Re: [PATCH v2] tests/intel: Add edge case and race condition tests=
 for GEM_CHANGE_HANDLE

Hi David,

On Thu Oct 15, 2026 at 4:53 PM CEST, David Francis wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
> functionality, edge cases, and race conditions of this ioctl against
> itself, gem close, gem create, and prime import and export.
>
> GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This =
IGT
> coverage is a prerequisite for validating the eventual kernel-side ioctl
> implementation and makes fixing its security bugs safer.
>
> v2: Small cleanups, including cutting some includes and no assert in thre=
ads
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Cc: Christian Konig <christian.koenig@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
All of these tests passed on trybot.
https://patchwork.freedesktop.org/series/177021/#rev1

New tests have been introduced between CI_DRM_19403_full and Trybot_177021v=
1_full:
New IGT tests (11)

    igt@gem_change_handle@change_prime:
        Statuses : 6 pass(s)
        Exec time: [0.01, 0.04] s

    igt@gem_change_handle@invalid_handle:
        Statuses : 6 pass(s)
        Exec time: [0.01, 0.05] s

    igt@gem_change_handle@new_handle_equals_old_handle:
        Statuses : 4 pass(s)
        Exec time: [0.01, 0.03] s

    igt@gem_change_handle@new_handle_exceeds_int_max:
        Statuses : 7 pass(s)
        Exec time: [0.01, 0.04] s

    igt@gem_change_handle@new_handle_taken:
        Statuses : 6 pass(s)
        Exec time: [0.01, 0.03] s

    igt@gem_change_handle@new_handle_zero:
        Statuses : 6 pass(s)
        Exec time: [0.01, 0.04] s

    igt@gem_change_handle@race_change_change:
        Statuses : 6 pass(s)
        Exec time: [1.01, 1.04] s

    igt@gem_change_handle@race_change_create_close:
        Statuses : 7 pass(s)
        Exec time: [1.01, 1.04] s

    igt@gem_change_handle@race_change_export_import:
        Statuses : 6 pass(s)
        Exec time: [1.01, 1.03] s

    igt@gem_change_handle@sanity:
        Statuses : 6 pass(s)
        Exec time: [0.01, 0.03] s

    igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-c-hdmi-a-2:
        Statuses : 1 pass(s)
        Exec time: [2.23] s


Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--
Best regards,
Sebastian

