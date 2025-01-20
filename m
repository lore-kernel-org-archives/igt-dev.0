Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF2FC02185
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 17:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA3610E461;
	Mon, 20 Jan 2025 17:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EG6/qPD4";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6493410E462
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 17:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoTFFgkZC6JupnQwlsALCe5OXySX2Dr6H1jcby1tWbJB38tCAZtiXfZNqOP0otCsAAb55YiIojNOSNGBADRXpq19hepBdERx1DOesHCrjR41bLTWi8wkfT/IKxPlkhG8NUvq+Rgwh8sf5VsV4k9cmHXZ2oPeiyrJ0lvfy3Ga8xL8qWLzd6qgehQHOQ/jO8WVWlYUFa9yktXmW0N5buOqp03OnKP/ecHPBqaOnA39DJabu9qqKksqfngA91ErO/SSfG5fzOx0mD/31nneZ05SHbNeA57SWjE+rLodXcsRUG0Ty7lVZFoCqZ7i7Fw5n/mEr/laZou0YZX8jSpBj595SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uNoeWcKY7xHPGwZR2n1T/7fdq3MdaJwX1zs8CBv7B0=;
 b=yJZPzZElTG8htxiS9VhaNFzUM9YLSipmuqAOVbavFUFHaR6Lw2ekj99R7XXsD++2h79H8BMbaGYv3I3SId+hE7f9CveDTv25D7dQ3YuLFh1tomZl5xSZln5ltE1qVQ0a1KPuvNjoPi6iB+ZSp7DCq3baAkXuHtlu6ObTJw4O9i7EuIgi9afdSXquD6wTV7QlhFPPYinu7/EZY55/vjEAH1NdEdV3QlCTt1QImUu6VjKZ3jjrrIdJLn/lJDZ+w0TZDAoRqtUXKQ3pq7rMezsf2CZKufFW1aboNMcqO2lzuzZ3bQuMlaIX0BDScJcXeQdfBhOY31mcprzQNvtCuyLcKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uNoeWcKY7xHPGwZR2n1T/7fdq3MdaJwX1zs8CBv7B0=;
 b=EG6/qPD4JkKrTVulQCMqwDRtAZs/eZFjqBOEDJW9VCp6T4fDqtW36qbsmKPYnttZu3viqM7RDykQYMBzSVcN6xKVZ1CyywkVzgo9vUDggs0TTmQNhFrimwUVtp6K6rfTromRNOar4YmIXrgORgTgVHQybBKNOwrZFxs8anWFEfo=
Received: from DM6PR12MB4481.namprd12.prod.outlook.com (2603:10b6:5:2af::11)
 by SJ2PR12MB7989.namprd12.prod.outlook.com (2603:10b6:a03:4c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 17:22:10 +0000
Received: from DM6PR12MB4481.namprd12.prod.outlook.com
 ([fe80::2f5a:1dde:a3d6:942f]) by DM6PR12MB4481.namprd12.prod.outlook.com
 ([fe80::2f5a:1dde:a3d6:942f%6]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 17:22:10 +0000
From: "Zhang, George" <George.Zhang@amd.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "juha-pekka.heikkila@intel.com" <juha-pekka.heikkila@intel.com>,
 "Clinton.A.Taylor@intel.com" <Clinton.A.Taylor@intel.com>
Subject: RE: [PATCH] tests/kms_addfb_basic: Fix addfb25_tests to not require
 intel
Thread-Topic: [PATCH] tests/kms_addfb_basic: Fix addfb25_tests to not require
 intel
Thread-Index: AQHba144LrtMRaWmDUavUWCurMpPGbMf6FBA
Date: Mon, 20 Jan 2025 17:22:10 +0000
Message-ID: <DM6PR12MB448190DC389AF7AF09C8C3FF94E72@DM6PR12MB4481.namprd12.prod.outlook.com>
References: <20250120171021.1029868-1-george.zhang@amd.com>
In-Reply-To: <20250120171021.1029868-1-george.zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=37865974-0cf3-4443-b120-61dbb03c5f7d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-20T17:19:55Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4481:EE_|SJ2PR12MB7989:EE_
x-ms-office365-filtering-correlation-id: 88d63903-9466-4da8-09d2-08dd3976f92c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?fWBj1aRQB6ZST69wRhpjY7COHazyNrFIAHyPf5uZrvHunDEvXjZr34XCSxAU?=
 =?us-ascii?Q?7+Lw9L41Q4vQh/4ssQ/1AOkoaxSPuQpmD4qn0RvCuV7705blY689XPSrbmBj?=
 =?us-ascii?Q?TmKu5gBy4cz0LtdlqNdqqDDYlfN5ySW74Mo9p7epiUcXkzXSZRb0hCyOW273?=
 =?us-ascii?Q?VI5DQHv7uYb8ngG1sHTf030UFUMImHTVCysbMO8xew6N6J9zQtfE20ESHRvU?=
 =?us-ascii?Q?riFAh+p1AoApw35rEF3Aq0j2O7r615svQX83wfTdWnKHaI9EVN/Hjc1Chae/?=
 =?us-ascii?Q?qS2p/MjtsUiUzmaVWzEen7tc1tvXzV6WMUmPwubLPJmfrvTxvtwdy3cySqBY?=
 =?us-ascii?Q?chjyqYOp+S112thomGaKXI+UoGQrS/4klXhdgHePf/US5K7eZMr095F9+q7s?=
 =?us-ascii?Q?fJrJBqsIIxz1G4anaYt+Pm70FbmZTPD372mBdagqkkH3annuRaOE4YbMJcmi?=
 =?us-ascii?Q?ilgbDVG/t+ZIFI8jJ3P3Xs0lwHVWjJtxFU0IwGO+aUyb7G0titpq0dAQGewD?=
 =?us-ascii?Q?Gc6PYL1AP+d3rfdx/uwuXu2eNfd2b/5wT8pvTn1RagIVZPG8zavd8RKUEB2A?=
 =?us-ascii?Q?kagIHjWF+fzuIFzzrmEeyPHRxKJ0twZECMqVBJi+Lyqa128ymthu23aPxhuq?=
 =?us-ascii?Q?+/gN51OrD3HeXr2AbJFRmTWq1n2JTgEBxzCHpSr7b+QpmgJonMEpbpcWmzVv?=
 =?us-ascii?Q?B/u+vtTgQgizt07+aG5wHDnY8iTDfVCEou+sP4297kAnJ3OyA226qGCfZzKC?=
 =?us-ascii?Q?dX28B0sRvnFnmU37tzQuTQc5AWBHAKHoeW0Ga2quZh9bpN1TqP59JK/TKNYk?=
 =?us-ascii?Q?5NTgs4hU2uut4bT6hQnuqtXVEpxV6+G8qcj+BkHHms3GT3dwINIiJS5tp887?=
 =?us-ascii?Q?L/OEdAYxaEKPiM6JoF7bFkjQYa31dCeXWlvqupbl4TwUEjAG72XTrj0uHs7v?=
 =?us-ascii?Q?1tjwxgZnDNLKv2/rhPH2CmuNrymar1kLwVFGC7BRiM1+ADlwhegDgrLl8zSJ?=
 =?us-ascii?Q?Op0PXnHlvGBTPP0S5UJZxp3wu4axNpm3YvVNNAwCnOAIkBnhz7XEfxZ17om+?=
 =?us-ascii?Q?js2Qo8MnyUkf5CQCqeHQfh7uWrgKumNhIXJVdQmXfK49iAnUOkKBeNSOjz7d?=
 =?us-ascii?Q?Q6g5i8haET4PlITxvCYnNcYJIH6l7qRNYKjngOANhRO9A4aNmFVqIVAiId35?=
 =?us-ascii?Q?P2ESpH8Ol+1hKjB2SnJSHA/U8zvN/fOjRuhAK3dhPLYdFyfvEGM4xDM8DUEd?=
 =?us-ascii?Q?jErka1hfZXbjDszWnDRN7x67msed5KXXCXoaRmrbOfgEO8O8lwMZrFUGKYJX?=
 =?us-ascii?Q?Lq2EB+nMSGUg0rZkURkvefJZtNVJ77IWsxP8Uw4i8bzcI/zwg3JpPBqZBywb?=
 =?us-ascii?Q?xEAtgV27q7jbvkAA+NNXSp3CizH2Qsq2ixfrKMNX5cj7RyfKzlgf/6/rodAQ?=
 =?us-ascii?Q?/LqclUZFotW/EcvZ3JvfxBgiCxfynKwo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YG6OTidtHKPdaFbLdVhF6NRO85AU1aP+VyCaz5JvbLTpGK10uHcwqIKuKQgx?=
 =?us-ascii?Q?g31yqIyNOZaKfaSqPfCuHYg4tmbaXG3so4HHe7qNrm34jN9igxZk68C1Z/0k?=
 =?us-ascii?Q?XJIlmZ3q6j+UTjIbKh4G0VznTHi2PEEvRNuKKsSnD9aDNA+jEOFN0w5QlS5w?=
 =?us-ascii?Q?eX9Z85B8d8SFvYpYJTfSfmfYou0ZnPEPJV5C9C05pTn8cowBy/D7MW/XiVZp?=
 =?us-ascii?Q?tuT5YgBbsldRz2vin5fb/bVKTyXaaAjPVr5PAEaEkgj6l18wpLWBOeUcQcQz?=
 =?us-ascii?Q?dwoUApmt5i2+J0ApIluPmwoAyXKQQNqYSFE3wj2o1tOebWhxmv7Mg8XPVajx?=
 =?us-ascii?Q?o1kl5WE6Dl6zrsXUP9zBWwVHhxKhdxCh72Few2rhfzwGh6/8AvCKJPBAD3Y3?=
 =?us-ascii?Q?hbWs8y919PriB6O0DyKIWXzJsFe1wKQ1omEzKcsbLdtYnSAwEs9W0YOSdc2F?=
 =?us-ascii?Q?e6SuggXXSqHIxydnKkgQEefnP1Rwti19c/x0xd7sVQcBlAX9GfaP1yXyH1Nc?=
 =?us-ascii?Q?60RLNZKeznqnnJ8Q7SQAwJlx7nXbbHzUyfZVT9RjvSEUZDVjyuw/wGytJWwC?=
 =?us-ascii?Q?3xJqJGpOdGUZ/9GbkhuobBbq2gZ3dBOlQ0pepJsDlDrJyEOWEzwE+WaeSREx?=
 =?us-ascii?Q?lBEq4CBmpzP72ltbkh/pfGcIjW3h0Bz7vK5De3qME2XT1oHYAtZbgkGBMsBJ?=
 =?us-ascii?Q?bADvomzr4vpgoNID2L5iuraaQciUvyrJGq+Lxnw2GyIBZl8Cz6MavVYIAvL4?=
 =?us-ascii?Q?WQ0oGNID1Qv6oyj34Qav4Ob38B68WbLCbnSV3rQQY6rLStPsrcDzwo0nsRyH?=
 =?us-ascii?Q?ZstBYjEBgqbiK92eg/Ty5kxQrU+yPFeX4uRYhuORgjEtKJOss/7ENKPhwtpT?=
 =?us-ascii?Q?kSdsI+hC/6WOD9JHRXvFSgiU6tlsyoQQgealfzZGnFmsjFL0KZK0y5TD04mM?=
 =?us-ascii?Q?G2Mt92en9RobZGlnuB3NaASPKJ9CYeniriY9Fxqv993gFNAp7gYzBUuNAbYY?=
 =?us-ascii?Q?yEoStSavhHQBlQeNoAwSwrim8D/QjH5RsXZY9jVgmV+YkngTIphJaYs9N9zw?=
 =?us-ascii?Q?wAXDneWLzURpUsdUOX/k5gB3O0lYeR2wRx2q1Ok9kla0drrcjAG2T5OfZW0J?=
 =?us-ascii?Q?DJBM8s8UzbFgcjBKDZjmybI74FUZtV6Tuz72i6jKUItp1t6Aqmzn97+mhc9y?=
 =?us-ascii?Q?urSPcGDf9K7F6Bhqu30Rcy6HrUtT1xk7wC1c/ZmvV5B84BYmHtYjdrpkAol5?=
 =?us-ascii?Q?55WRxM4iJUp5MoE57VVICiffJQHtXn7Lec8fndsrOisSBUd303/PX8uyvncC?=
 =?us-ascii?Q?YBAbIJafm+vNHMY5lO2+Z7ggHg6lqVPCM2S41LRKtbhp3Iop+3ySnBAx/Bgf?=
 =?us-ascii?Q?lWJyjIRlCEsou8c1wNFnd9Se0z6rjHG1IN4vWM8ZRo/Z22en7NK2XI6/Ly4K?=
 =?us-ascii?Q?Ak5EUsaGJzFBowPuc5a6ciXB8Batut1DKTD6O4yYM6lIp6yADYEXoauUYIuO?=
 =?us-ascii?Q?g9Xa+MtpbVZBUuaIJ5KwJeZUGoOy+INpUG4KPJFIdnfso8WHKyli6cEtdn8F?=
 =?us-ascii?Q?VQdXUPldqJOrOsupW48=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d63903-9466-4da8-09d2-08dd3976f92c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 17:22:10.5440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Byd5KWMzy1nCRdA2XcxSrzUIObWlK0NU1uTbTIMbLxkBKGthXaALOsqgDmNz2JClALaTwa4dayUzZNTsmm/gWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7989
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

[AMD Official Use Only - AMD Internal Distribution Only]

> From: Zhang, George <George.Zhang@amd.com>
> Sent: Monday, January 20, 2025 12:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: juha-pekka.heikkila@intel.com; Clinton.A.Taylor@intel.com; Zhang, Geo=
rge
> <George.Zhang@amd.com>
> Subject: [PATCH] tests/kms_addfb_basic: Fix addfb25_tests to not require =
intel
>
> From: George Zhang <george.zhang@amd.com>
>
> This test does not require running on intel devices, so move it under the
> display_require.
>
> It was accidentally moved under the igt_require_intel fixture when it was=
 meant to
> be moved under the igt_display_require.
>
> Fixes: 109d23b91a30 ("tests/kms_addfb_basic: fix x-tiled tests for case w=
hen there
> is no x-tile)
>
> Signed-off-by: George Zhang <george.zhang@amd.com>

Cc: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Clint Taylor <Clinton.A.Taylor@intel.com>

Add Cc since I forgot
> ---
>  tests/kms_addfb_basic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c index
> 3ba87117b..30ca8b016 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -1022,11 +1022,11 @@ igt_main
>
>               size_tests(fd);
>
> +             addfb25_tests(fd);
> +
>               igt_fixture
>                       igt_require_intel(fd);
>
> -             addfb25_tests(fd);
> -
>               addfb25_ytile(fd);
>
>               addfb25_4tile(fd);
> --
> 2.43.0

