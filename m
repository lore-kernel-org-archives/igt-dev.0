Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B37C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 08:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A615A10F495;
	Mon, 18 Mar 2024 08:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ao1PO0M/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C6210F495
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710750434; x=1742286434;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iMH2ynXoWLuu6EHdwZ/DE5qA0WLtaD1TKtGFH3FM+2o=;
 b=ao1PO0M/GA12OmggWQo1PgRzF84Ok6SwyYRsIGkA5VEm6YmXaCaeDUlJ
 yldmfwsQqiLg+webPOCpLtBNhBWe+1DXRLUACmV5MfEGNYOR7Wg/uu6K7
 h7+ElDs2AFqn8SEmyEJg2r29tOItppDNwyV88mc4xV9D8zK9FZCJAz4p+
 kygNkUueAmg5mfbLLGn4nuFDVadT5plnU+tEXnipEHclE3j0c7aFDJQG/
 bN4Dm31wsCEsCSo1cM8J2CaMYVJrr3Cph6i22TswuJ7Z162QTalS7kYwH
 XUPWZJeY5zW2oojKUFbLuW0DRUx11HS+VJpuqSYSTcLYEpdMQpFDgc5iK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="6155887"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="6155887"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 01:27:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18107064"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 01:27:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 01:27:12 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 01:27:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 01:27:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 01:27:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXlqqhVowz36WSzCealbNQ/0HJ0DRho/4wWbGudMMBgN5Z0x7KTN9//MqdGF5OlR/5IB9fOyHEyJ3WYOopjOfUftHatpNGd0AhRt71enqAqeA9KgcPPOk+zjyWdm/qdiKNkvREGJF1pP3sBCq4tBIQLh/8ZNeZZj4Jb6rerbfoSnDHedtJvDU+wap8owPWIdXo/EvL4yC+wCZ+lVeu4+jg1E2aXp0Xn5j5l5SuS4OwQ603bDz6NxrDK2IDtBVUAL3NxUCFWIc2kN+T0Zpo6suFWLMKOOZ5nNRRpi+zdStYIfGKoMIGem0KxerEKGUnfXgMJj311hk1nWdcOmjCKfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qf8/NHDH7qvcnmyY+SNfM2TBq04XUH0Sc/tG+ivjz5E=;
 b=Bb6wBQYThDkLzPE6/Y/UG90ADefXSxtm1WAOz8I/1RHk+gRoB6ojyuicTgwEB3LUGYrWWPFeReL/2gr7JFLHi8fQbrYbLU8AgX2SHlnDxdAnJxJuVpkEs1w7im5T+BESAiwqhVUCmalJbHbdbdu0JDqfuLEW1vWYaKzpqBIGCyjpzz9eYRzGDnx6I/PoNFVIbNJLszq/+9+Qyz5AvwD8SbhAnzTHMgrRl2vEbtE8cl4HPVC78WUQiilHDEMSPYFBkxc2avZsbboY2AuHSVZOtMAuOAuBZEQQdh9psLEqWpNJaNpNmYhxKuMYl/cb13Cpn53JPELQYZdPVRiHrX0CjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH7PR11MB7549.namprd11.prod.outlook.com (2603:10b6:510:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 08:27:04 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 08:27:04 +0000
Message-ID: <ec684fc4-4448-4280-bfc7-d268aaf1de7c@intel.com>
Date: Mon, 18 Mar 2024 13:56:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 0/4] New rotation test
To: Louis Chauvet <louis.chauvet@bootlin.com>, <igt-dev@lists.freedesktop.org>
CC: <miquel.raynal@bootlin.com>, <jeremie.dautheribes@bootlin.com>,
 <thomas.petazzoni@bootlin.com>, <arthurgrillo@riseup.net>, "Juha-Pekka
 Heikkila" <juhapekka.heikkila@gmail.com>
References: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH7PR11MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: a15d1c20-67c6-4bd2-7ab0-08dc47253109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LWNsEM1OClZBnhoM5iXUZ2mVIxfKMUFZ2y3iZW3KUVuVduhzOkKmuK46HvGYMF7+unJ1PTs3Kp8KQy0yoMPNdPqEKUceyOC0RWlUXs6PBnN/4cxcFHXXfkmh9Zr3WCdYF0F3wPQcr9GsQwLhyY3hcYOgRS9T2v/3XR3/8lBYfR/8qPGic2To1PGQ2P+hC69fSiZeyuchEu8xK34bTX3o4PsWoIkFTf8AlbievzTV3rKBr/YdYySklo9exdOkZfInvkPw/aPD4yf8N83bXonUovMCqC0od8PhxMdSNAs7jJWeHKj9XOTnh6ekYHtGQ//MeG6+6qKFc45n/8P1dO+UdqiNmCH7j7j88v93uFo1AxmXFA9+t9nIJ1ZOUvOM+JX9FOTwFK28A/Ee1j3JmZncw2OMomxhoaP9VGytea7GSWEv4iE6Hu9wzxeFK2iF0INb5XQswj3Xu3Ly9Tr4Un1+1xa/3w1DyCDYP+Z15J8qKyyllTvMWaUgTK7keoJONa8D3qrwyHKmD8LNYjWP5oVaCW3WZB5kX7s1YZkWeIsZo6WVoVz3PVM5JjudgcnWGs+Ow8AhgQNj7Fvis+CIHgukPukgW35lFbU3ZMAYihpc+Hl/S+VRDyMkOQdUnMSJ4OSj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGl5VGE5NDViSTlvZTRIUlAxQ0FEVGttMm5yRS9vdGk2c0g3VThNWlArUUFE?=
 =?utf-8?B?SWJTdmk1K1JaZzF5VW91WHZEekNOMXBlbHZCWW8rYXRJQ0o2T0JGc0JmNVR5?=
 =?utf-8?B?M2wxRzl2RjVaV2djQUdIV21xRGlIU1FmUXRhVTUyY2o2ZE1jQ2JKYjdKWXMy?=
 =?utf-8?B?UWZ2NlNZYytJcVJwQytZd3FuZDBybDI1NkRWSUNSTkY4ZXgvRFoycWk2aFlP?=
 =?utf-8?B?dlUxU2d4Ny9vbmI5N0x1cVQ4MHJLeWtUWC9pYTRlVFlOSUxCS2Q1dktxT1Bi?=
 =?utf-8?B?dWJweEVEMmRMTE55UUVLelZxRkZjZkhyUGFBalRqektxN2p1dHZvc1MrMm1y?=
 =?utf-8?B?Y3NTRkRXYXRXQmtkMlhhbzBlUGY0NjlKaHBWeTU2RndqRkFTOWszSXF2ZEF0?=
 =?utf-8?B?aU41cGJUeUtvWlNJQVp5MzB5M0tROXlqWktaNmtkTWxSK3RHNmxEQ0dvaTZN?=
 =?utf-8?B?K2hLNHJQM1lJZks5cTR0OUQ2cHM4dm9pU1QwL0ViakNyZGZTY3JCcmxFd1Fn?=
 =?utf-8?B?VUFSWHBKdkpocFMvd0dONzA1WEZmVlRoY3VYam1LWjhjdVA4Skp2U2FTa0hi?=
 =?utf-8?B?aXEzbDQySmRxb1IxY25SaERlMVduTVlYR1YvcFlrcUYvNHM0UjNqbGFHOWpG?=
 =?utf-8?B?NkQ4Wk8ydks5K0c4eUxhV0VESXpWaTBrakowYWJpRWdkamx0eHF1Q3Bqdkta?=
 =?utf-8?B?RDVZZ09DS1FYK2RjUGJFUVF1SFo1dk51YTNtUFA3RGwwOVh4VmtiMFlyVDE5?=
 =?utf-8?B?bXo4R2w1KzIxbGVEZ1FZQXBVa0hjV05wTzdycjh2VGN3eEFXZmhWZXdpL0Jk?=
 =?utf-8?B?WUR4QXJtZ29PNUcreExxSlF6ZGdJZUlUVUoyTWhVSnFLOThkcTJocVB0eEI2?=
 =?utf-8?B?SUhCTEYrREJPdXpIak05aGFkTE4xd3VESk93L09TVDFRQmtFSS9mZVZsRm11?=
 =?utf-8?B?UkpGTmwzajBPMHRUNHUrR0dWQlgyVlpZMC9wcGY0YWdSYlp3SlRlWThIbmRG?=
 =?utf-8?B?dTNzb3IwdFFnTjZablhkbys5dzB4ejZvTW12czUxM2J6TTBqUmswRGlyVUZo?=
 =?utf-8?B?MFY1aVZYU3k1Q2tOcVF0MVd6OVQvTlhGM0V0UXBsQ3hCeSt3eHVWOUFPN2Ft?=
 =?utf-8?B?UXIzbzZ4d1JRQnMxV1BtYnNibTZqdWtLVDNZY1I5REx3Q3BCR3ZBVitvc1cw?=
 =?utf-8?B?VS9UV3p4VDFnVEM1ZVVyd0Qva3R5ZHZ5QnFROWZFRHB3ZGlITms0dlQ2NG9W?=
 =?utf-8?B?ZTFoeHBOckU2Um1zd3B0Z3crU1JMUVdBcWx0NzB6cWZJV3FKK0Q4MHBTanhu?=
 =?utf-8?B?T0FGekRSZDBSVitFeWFpbjU2bnByR0F3MjEwa0JvV01GRXVaYzNyRTJmdUUz?=
 =?utf-8?B?eVpubCtXZm5GMGZaSllrVVlRWHFSYzNJT2dwcGlHTTVLZWY4U3hrVkt2T1Fq?=
 =?utf-8?B?Y3BXeVBFRVpWR202YWdmazBvM0RXMFIwcFY1bTN0QWh0dTJWd0VucURnQ29S?=
 =?utf-8?B?REN1NjhmNWl1eWZGV0hxUVgvWlVQcUFhWW5Id3RrT3k0dVVvY2ViZDBjb0dJ?=
 =?utf-8?B?dHk2TGtPRFpLcDdUZjVNc1NyNzRySWtuREpzQ2JmOE1oVjBPZjdXVlVzam5J?=
 =?utf-8?B?UVpFMlNwL0lTZ2R3cDdyWFh6OFVaZ2ZJM2F0RytOK3pRSWhTQksrT0d5WEV3?=
 =?utf-8?B?Smk2WHlMR1BvcG1XbGQ3RTU0bzkxLzFHc01tOVpJdE9Zd0VINnV1SW1TL3c5?=
 =?utf-8?B?eTBOWHdPRncrSnRKemxQdGJ5Z0ZXV216ZWxkdDR0aW5wNWhmQVNmVUpUU2Fi?=
 =?utf-8?B?cTFkL1V0QzI5eUp4OXNKTTlKUFZuRC9SUjgvenNYZlJBRWtXRzdhYkxvVmVj?=
 =?utf-8?B?eHAyeitnU2EzdlVWcFRCY1kwUkJsNHI5TXhjTHJZeUpnNUYzSC84cmI4Vk1n?=
 =?utf-8?B?alFBakxpZ2w1Nk9LWG1xRkM1ODcvVXdCY0NZcHkvZUsyTCtEMGFocHc0Mzlv?=
 =?utf-8?B?Q05CRWxLT3czQmMyTytrTFZLemtRTmJVTkZDV0NzL28rckJpeEFMTktOS2Zn?=
 =?utf-8?B?Y2tGT1Z5QTFicXJqQ0Vndllqait2TlFHYUdMWGNDTjJIclBzSzNiR2hxTjVC?=
 =?utf-8?B?eWxTaU5pT0JaaHNIS0xDamxpVExVYU14ZFgwRk5FTUhBMElsOE5OamZ6emta?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a15d1c20-67c6-4bd2-7ab0-08dc47253109
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 08:27:04.3062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XiEessMI4HJNLlXFKt6ekfw7ey35vguaKxe6veJVrXUI3j1UcrCJEbRb9DLeGW/B+yp3Hlk091E8FcQagu+BkAQ7QPr2eZCZPWUmFI9L3GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7549
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


On 13-03-2024 10:39 pm, Louis Chauvet wrote:
> The actual kms_rotation_crc test does not test all the rotation with all
> the formats. Create the test kms_rotation, which only test "full plane
> rotation", but for all the formats, plane and rotations configuration.

Why do we need a new test binary 'kms_rotation'?

IMHO, you could extend kms_rotation_crc to support other combinations.

- Bhanu

> 
> This new test allows to detect issues in [1], where the YUV rotation is
> faulty for reflect_x and reflect_y cases.
> 
> [1]: https://lore.kernel.org/dri-devel/20240304-yuv-v4-11-76beac8e9793@bootlin.com/
> 
> To: igt-dev@lists.freedesktop.org
> Cc: miquel.raynal@bootlin.com
> Cc: jeremie.dautheribes@bootlin.com
> Cc: thomas.petazzoni@bootlin.com
> Cc: arthurgrillo@riseup.net
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Changes in v2:
> - Fix a typo in documentation
> - Fix a bug when using subsampling with non compatible sizes
> - Fix a bug I found when using different color count.
> - Add cli options to set specific plane size
> - Link to v1: https://lore.kernel.org/r/20240312-new_rotation-v1-0-ed9fe82589df@bootlin.com
> 
> ---
> Louis Chauvet (4):
>        lib/igt_kms: Add reflection name and mask
>        lib/igt_fb: Expose lookup_drm_format to access format properties in tests
>        tests/kms_rotation: Add extensive rotation test
>        tests/kms_rotation: Add command line option to reduce the number of tests
> 
>   lib/igt_fb.c         |  15 +-
>   lib/igt_fb.h         |  29 +++
>   lib/igt_kms.c        |  23 +++
>   lib/igt_kms.h        |   3 +
>   tests/kms_rotation.c | 550 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build    |   1 +
>   6 files changed, 608 insertions(+), 13 deletions(-)
> ---
> base-commit: a44ebfe43edc96acab22a19b6a8850eef9202eea
> change-id: 20240312-new_rotation-c034a68b3b9d
> 
> Best regards,
