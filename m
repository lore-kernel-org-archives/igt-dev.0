Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFD5C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 10:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BAE10EE3B;
	Tue, 26 Mar 2024 10:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0CuBwmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AAC10EE47
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711447778; x=1742983778;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=PkqZbPNLM7wT6pD2E04wjR1W6+JensTqoXNwGtXbiRU=;
 b=C0CuBwmH+cEk87AXu6BEiChM5X5g1McYxgtj9JOXxSgJcV1592L+Tk5q
 Oag3JLT/of7bPTC4BUB5iIZ0nbGfdtnp3vA+oxIw66d+zpx8V7oSGQhu7
 ezeGaS3n2JzvVHTVxKiw84cGMIVhMI22/ORPYfdBeJKBMvqBITg1pl3t+
 AhgiSZc2XDPFirrpFMm6aNZzdg9AA+8L+LhXihZ+gVBK9F2AZFVTvjxA0
 06xEVNHCQ9FENFThi1bisIVnX8IrU7nArRlL3zTZbV2yezJVKOH+0ZVcP
 9XfFFil3h6rv7osCa7jvA3FFGx/jFfyKpu8x7VSqbYHIB/5jOeLFKhBCl g==;
X-CSE-ConnectionGUID: HZGs+WHLTV6QWCCqnOCDng==
X-CSE-MsgGUID: LHMKotXYRAWT6/kamYfwGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10267945"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="10267945"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 03:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20572136"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 03:09:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 03:09:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 03:09:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 03:09:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmRikFVKJrptPiqg+Kk3ZKUbB5vbpJ2dNHOeAVIiCSX2gNRvv1VXlB+uh/elbbtt6LqdA3qTSBAt6AN3EeyA3FIlzPYIT27KkhV5hfcXD0O4uW50xcxbRDTeQDeUUqpCVpyf+bts4zcoydDyLNxBGZepjsSXO7FvIyrWNsdr0Rsc8viftErfD2k+uRGIkxEUMd8a0WCMJ1auCSJce4gML/FPmXFWkZycYsOnXZa5PPhyDbI2//e852CGk0bVL7i/vJUNdULopbpYzJjy7bMnEQRHHvLSciPKaF5ZrxttE/PWGatfiw6gLYt9b8Xest4Vcpsczy7sbS6iCnBeA/bCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH/UmwppOK2jn6TaCzlPPJH3ga/f2TCnf+Zfr5VspBg=;
 b=XK1Ouspcn7P1bZBBH5H79iwcaN8ZYCYag/t7GFudSXAiKVXn6lBp82A7oajMSO7rCo0l0uj41hTnActCydNeNNi0ZIvJXutrW3lS1CBXQumn6Gz/V5P66sdzS1ZQw1UIhu4cLQHy3U1iyCji9xiD/pYpFC8dStwPxnVUnqdWZlaU31hK20yeeLgpF5rbrHz6B0jUzJA5YT66Yg+Ew4mZWYP8JjAyWBkvRRKroJdCMfXOV5/0vi3rM6AjeNnMZqDy7YChcMbaZIuPDWXpa6DICtECljjvonwkL5hO+XLA8zStdbpYyUBzL1ETcXjDjBNPX7B6CKAspORSSmdQ+G7utQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB8013.namprd11.prod.outlook.com (2603:10b6:510:239::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 10:09:34 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 10:09:34 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH i-g-t,v2 0/2] lib/xe_mmio: Introduce Xe MMIO lib
Date: Tue, 26 Mar 2024 11:09:19 +0100
Message-ID: <20240326100921.3539141-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB8013:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sxqE0apaNn5XMgge46CA0yqXnK365mF7dgns9t3L5LOqHwE1UakERmweCIhVXpDA66mel9sWXiHimQfid0S0tuhLCBrxkr9cskmBOpFlZf8ax1KfQAK+7CAmROCGPKBFA/eoVCfnBvCTVgbkapUDc3LGbLYwncSX/36zVDKQRVkhstKlHUkVUtdfqwOWh6oSHErD1qowuIB85bWTEMWEEzYF3pGjdD40K8l54+U9o2byZqT5j5MmQq7dx4bgtWUfjkiL449km6B4naWamMBvdnkJWL4KoMYFr01q1r7+3y0Ez+2eCM9IKsnRoU9mGIYpri+pn/ExbYGVM4HIKB/PgWMjYAosGKg7cEEXUo7WXu9ao/AxTLWNlYV9D4Lfg7PNDWx3v4mpIxthWkySdS43FeZVY54RQ/M8lDMzjSUsFecY7aWZUV+bvtL71Oplssipb3/E23Iz5FWQQO1jziojIDdvCAlr6Uo37XM2D8XQ4+IezI21L8x/Y0PTaXpofEOnaD9Qaw11x4hg54+2HYE8C7rDRL9e6a9XKXO1uhYVYLtCcMb4VJPDPC1ITeU06lqc+SqQ0oFtWxOOpf+doY258WC47mBAbNR3E3zYe3N5vGJHABSNlMJv5v+gW+/je9ITy0xi58wo4if1obuG2r8xBqNKBzvWQBoR+Pe+700eBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1l2ckdJQlIxeEowVnhBRkJXZWQ4NlprQlBLSk5JNzZsc3VNeDhNR0hKVDFP?=
 =?utf-8?B?K0FkYjJnQ3Rjd1BpcVdvc3hzVy9uRjJlM2ZVQUgxM0x6RWpEQkxyVCt2OUEy?=
 =?utf-8?B?TjRNUlM5QXJsQy85bVozN3VVQW5qakdTWkxLTVUvQzQ1QmY3MjlOd01Hak9a?=
 =?utf-8?B?a0NDS3JFWUJnaXBMSU9hTjhCVzdOeXlrVFJQaTlDVE9NS282N2hzdlNUQ0Jz?=
 =?utf-8?B?Q3ZpSmxOcXFaK2ZSVTRZZXBLellwUkdndEwvUUUzV2dsYzQvWlBEcEtsMEta?=
 =?utf-8?B?d0wrRTdGZlhTV1N1VlFsZTFodjYzTG1SVGdtOUkwWS93UEg1aFJDSE5HeWs2?=
 =?utf-8?B?dStQWS9OZGVwRTJ1aFp3cVdVK2d0YmpQNmRmSis0VjBCOC82eitHRlphL1N1?=
 =?utf-8?B?WHI4QkNTMEZKMFZnT2w0UWxxcmxaRFg0bUZsYlBPaGFNUGNNZ2VWb0xjMmZ6?=
 =?utf-8?B?d1hUTWJSVDJGcXl5aWU4U2p4Wm5BVW1jZS9rQ0hpU3VCenRyQ1Q4d2UyRnl3?=
 =?utf-8?B?NkhYTTFpSHE5SlUybGFwUzFQQWFidDdtS3RvM1NYOUxnYVFjNFZXZkRZQTJC?=
 =?utf-8?B?K1BzTGJNaHU5YzdZODRaeGJ5VHdkU2JYdThKL2tXOWRzUUZNb3NSc2VkYWJs?=
 =?utf-8?B?cEFMb05UY1J0bDAxT3NVanRWZHFOSU9ycHVPY0ljN0ZaUGJ2UlJNRi9ydU8w?=
 =?utf-8?B?ajdOWEdaMVVYbStUblVod0hXMy92N2E3a01sMGd2M0lvOEkxQ1kwR01xOU1H?=
 =?utf-8?B?a3M1cTM5NTArdEdrcGxxbzIwdHNoaDQrbjF1eG1aTmZuRy8wZ3ZyQVlqeTRE?=
 =?utf-8?B?U2Z6V0dhVkxpZUpEZ0cwVStJUktxYTMvNkRpRXlJbjlpdzhBWnlVTXk0cWdB?=
 =?utf-8?B?U2FvdFgveWU2bUFIUHRvSWc3bjhmWVY0ZXBJV3gyUFNsN0YySXJxNVZwSVpB?=
 =?utf-8?B?b0VrSXNwOFFaM002bHdrTXZmN1VVYmRCTHRhVUdwWlNRRXBEeWZoTTEvRGpp?=
 =?utf-8?B?cHhWNkhFSmExNjNMbXU3WlVwNE5pcklzWVJMcVkyNFdYWUtDYkwvNE1tNVMv?=
 =?utf-8?B?SkZtWFk3QUJxcHpJbTJtTE5KK2R0NDRWbGNZbHpCL0NYNUd0Ri9Ia1RrenFP?=
 =?utf-8?B?K204SXNtRmYrRHN6bE9nTDlWcTgwUUJsdmpRTkQ3Umc0ME1ITURJc2labXNO?=
 =?utf-8?B?Tk5LRUQxYm1TQ2pwUmZCaDNIQzFOMmc3bS8vZkZhdW9kN1JyTy9GWW03QWRh?=
 =?utf-8?B?WktUYjRSRDdDQ3NIWkpHc05PaTVpNDhIaTZVdHBkZlNkbjFobHJCTytjMUI3?=
 =?utf-8?B?aHlzbmV2QVpkcXpmUittN2k1aEFUMkZQaWVSeGVGMGJqN3dZM1JOZ3A4bWtM?=
 =?utf-8?B?ejhqblJ3eHFuMGc3Z1FDNTlaeGVaY0UvbGtYN2RXRGozZFBzRmE3WDRQOFY0?=
 =?utf-8?B?eURiUnhySDJTaUM2Z256bngrSXlVUm5iaThQNDdBajZYUFhWSHpFNEl1L1Ay?=
 =?utf-8?B?WU1FZi9yKy94bE00TjREbzR6OFFFRTlRMk1mS3BzU0cxRTFBRnF4bFRzRUxq?=
 =?utf-8?B?SWRXY0hKV2RUaFZRYStiTmRWYUMySm0vN0xRU1Z6bndaaWtYWHJkWCttNzBI?=
 =?utf-8?B?Z3E0Q3pYandkelI5NURMZnJoQjRYdkV5QjNtR004d2sycW1Uem40ZithSGY1?=
 =?utf-8?B?WE1uMHZHV1d0b1BNYkl5MndhYWdzWFl5WFhzQmZORlNlbndlMTA2dDM1MlZ4?=
 =?utf-8?B?WVMvQWpZWHNaeldtWTh1cjhwOE15ZHY5UTY2dCtScFBmRUZOU0J0QjJVdDZn?=
 =?utf-8?B?Um9xVHc2WW9NdjM2M2F5QmtkdGR0amtVN3lvNUdRQkdYVkVFOUxGdzNCRm9O?=
 =?utf-8?B?MnFOY3JOa2xIekNWclJTc0lFdWJJQzU2c1g5ME0rRFZvSXVKVU1tUGRrNTcr?=
 =?utf-8?B?M2ozZXBid0ZDZGNCaE5tQzdtWUwxVFNlS056ZGRRZmV6NGc0R3VIMDJYZlJH?=
 =?utf-8?B?ZjBwak9BeFJ1Tzl4U255dzdWNkhGQm0wN0YrbW9xY0FtcnErd1FsRDNrQnFm?=
 =?utf-8?B?VGtsVGREUG1TcE03bDNzS1JaUGtQL05xMHpWeUwyR2tYUnA2WWl2dzllOSs2?=
 =?utf-8?B?SXZVUU9FRWVNVk5haTRTV1UrdmRySzBjNm5YZGFObDZXa1V5Z1JwWkc4WmI2?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2888c18-59d9-4b89-330c-08dc4d7cd641
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 10:09:34.6526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yq4mcMwZMCr9Q+sF9LnrXd7Vjf+IKYf8D2YpH61KaIFmsmi3lyhoX7aXe+0t4sNpq2fOcXu8F4RwI+8TfYg238jns9s/1j63zJGf2iwho9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8013
X-OriginatorOrg: intel.com
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The series includes a simple set of helpers, dedicated to Xe, allowing
access to registers and GGTT, on various tile, using MMIO BAR access.

v2:
 - add missing header std ifndef/define in lib/xe_mmio.h (Kamil)

Piotr Piórkowski (2):
  lib/intel_mmio: Map the whole BAR0 for gen12+
  lib/xe_mmio: Introduce Xe MMIO lib

 lib/intel_mmio.c  |   2 +-
 lib/meson.build   |   1 +
 lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_mmio.h  |  42 ++++++++++
 lib/xe/xe_query.c |  19 +++++
 lib/xe/xe_query.h |   1 +
 6 files changed, 271 insertions(+), 1 deletion(-)
 create mode 100644 lib/xe/xe_mmio.c
 create mode 100644 lib/xe/xe_mmio.h

-- 
2.34.1

