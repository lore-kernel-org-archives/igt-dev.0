Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1851CCA476
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 09:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FBF10EB82;
	Fri, 10 Oct 2025 09:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SY7jT6uZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C89810EB82
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760087468; x=1791623468;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T91Z/2fWpWj+vV6kMvWTZiuZrXo0Yfp9dmFjYfViWTY=;
 b=SY7jT6uZWQy1djP2iMXPzpVUqa0X/u8F6Oc80gJO5Ckd1/Zt5B0w4B3V
 f3qDaDfNeGBPDPEysj2EEFUwIu6orCKBx3MQ7+I3u4WduwxT5ADcm68V9
 P9qxmOON0kLVzKB4TgFx7yTbU1LFnqLdFyP6yoH1cHTdyIb1YKSQWLWpw
 CGBnbqThGRbTizkipFLqWLZE4+OLj/DeLMQPI9A1M5D64cVcsrFT7HpGg
 5uTbOf3VcBUcinLfw/z0MbauRlSEmQeOmbO8yw7sabA2oZJDzkomf+Zwh
 38cv1hnqo6weBz29PcBHM9g0kZN10CKbQSKl8ySYpEpXJBw4w3ow+Lwdo Q==;
X-CSE-ConnectionGUID: 0X9FCZ63SI+cjLZlVg+0xg==
X-CSE-MsgGUID: +wE9yCmgS6u0njKK6S4/AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62247472"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62247472"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:11:07 -0700
X-CSE-ConnectionGUID: tivK5wvHRQWd1iAxdFAVJA==
X-CSE-MsgGUID: XUBXnXFjRe+sZTk6BD32XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180183512"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:11:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 02:11:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 02:11:06 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 02:11:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMJepliO3Az1uDYKOqltfP1vZW5lKVy0y4OVOLC+rgy3qiq+GMTrwvwFZzzX8hCsvBJsxMLEReeJvgXkON1VLODJ6bxFGgHyvTBB4pjePBsIK4xIol+x4gbsxdp1yv+Etc6aEPKC6yC29/L67fNgkkjyjh8GX6ejDwKZAKkPWOFzhaiscjvAvGzkAkpZWNpxS75fqya8NKoSGXxDsrEpbBcEpF4OcN4lBtGGkpgb6gOc5FYPOJFWBNTgaLdzTsti/Ir2yaWJb5WB4MnXzncsVgXUpv2QBcibBFsPezaO403nRazNVG7sQtJkhnVZNmpko0545bJ8L3g4rwOqvdZHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8uvvHEb2/cRNi81r3yIGovcCn/NugF1bv4k5k9ckpc=;
 b=vy5uCZGNyYQVPPTDvB3J+wg0AfgEw7HQ8En80LUZrXfit2//dJkCPFcmG2FXL171yuL5juazoLGqDzJQjv/Ryl8MSCDQxJcbfs85rkqnmC73KEuvYx0ohGDu/uzr4VTVGRETfit5zj3c67qCC2BHCoTv852JIkyzGpjWc8nFO8gEQbbFFB77fJH+0HoSuKyTLSTc95+WqH92uZbwLPg2BqaKh7Yz3ckNzMgkr4U/wwYAtowsAJmGEXdaQ9/kTCD+C6icZIA1L+CcxoT6WdAeG0YSjwnTr0ngmwvF5BoDed0zDuQiAKhFvXjixvd8c4Jilg/zUPdhs567UB/hKvT3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.10; Fri, 10 Oct 2025 09:11:04 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 09:11:04 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_vrr: Dynamically verify LOBF across
 vrefresh steps
Thread-Topic: [PATCH i-g-t v1] tests/kms_vrr: Dynamically verify LOBF across
 vrefresh steps
Thread-Index: AQHcOcPoPnxifGcnJUalAI2Ayx9edrS7F28w
Date: Fri, 10 Oct 2025 09:11:04 +0000
Message-ID: <DM4PR11MB63127575796ED6F3FF30455490EFA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251010085708.273552-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20251010085708.273552-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB4976:EE_
x-ms-office365-filtering-correlation-id: 9814a3fa-42d7-449e-b622-08de07dcf0c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6PsU52q/tcCJcExiG+4wX0v6QqW+Bn1G9/uBurLziCRO7UV1p9Al7/aPAc8r?=
 =?us-ascii?Q?Kehxa0C4Tze1IBBsXsvT0F+JlsLSqkgkANnietn+TIr1mPMo/R7dBO+ssPCm?=
 =?us-ascii?Q?Ru/JEp46M3CCG6WEzbvd4U+baHdoagk2sziC7h6+2ju3AjBc4/XojCQ4fq9+?=
 =?us-ascii?Q?9LZND5m7LPt6G6gF0o3Xa3VxkFLnyzpubdAq1LAwGqEmjv684nDlzK6SDP4N?=
 =?us-ascii?Q?3GnmjDMrLyChs3fDVRLZeq2g6Hxu/ZIjEbGwSh3LD2tlqr9U7sbkvNld06MQ?=
 =?us-ascii?Q?xyEi5JIU6VAaGpZ7NZU80tTSm14EVrmgJnyRabE+q/BH3PzkK4aD3c6iqUsq?=
 =?us-ascii?Q?fgQFRXtLQCvMkceJg3k9pgOs1RKHu5z0LSlvLJCr0XLTcs3vhnVU1NzpGgEz?=
 =?us-ascii?Q?rirPUyW4qSUEAD6ETFGNltRVwL1uMl6Hg9R/RjosVxfG+r6cRbfC0ONLQj9a?=
 =?us-ascii?Q?ISnRrF6asc+/BL0r0hYcMhmNW9EG2LtxS6kP91U+YJOIQmfzCNSD7jxLP7Qj?=
 =?us-ascii?Q?ovJ1vPzIcxhe0MNOURYfZe3dTCbQBpKrTXcXS3W+fN1JgdOv6uP9phPj+CGC?=
 =?us-ascii?Q?baOC7B4yTPPF+R51Y3EPbDJqjvGkkADlCKKjlrR8x2CmQpaBVBNfRRQxt0MT?=
 =?us-ascii?Q?4WxnbSJcImC4qPN9ZebEB6LSjhsXvT6doYC2gt9RAG90cnBqjzv5bEQrzM5n?=
 =?us-ascii?Q?hsWYXp4dEmwYijM+qKyvZ2Mxza1OmYnQ78J3ew8RSn12ry36MEjxd3cZujSy?=
 =?us-ascii?Q?OC4jI4eYhL0Zaka7BYzIaIK9nnHwbLHpwgB37CiIG3QaHnG8GXfx2+UHZ3Cc?=
 =?us-ascii?Q?Qy3VGG6msf6Ru/H2eeIbjWj+n+vLibT4r34AxGh+pZdVNs7cDUDh2u3plBLO?=
 =?us-ascii?Q?wQ3pNmqwBuN5RS+gVHeTDbK51MEYFUl2bbY0LWSY2Pb8pKH25U43Z2O+4L8P?=
 =?us-ascii?Q?9uaIkBD6snl7hHVZ6K6/e9bmUngKVWLJsc9zm9jivuaFFl5Rd41vvTl1l0Bd?=
 =?us-ascii?Q?uGpQ58BViU/1K5emaTowCrPRaBwnkDXLc9X/4hQCYQ20w7CEnzrSin6hTAhi?=
 =?us-ascii?Q?EjunWrRiK+ieJt56Zmdmp30rj6jVa5RkB4UY/V2hyXs3HjBawXbQOKPivVqQ?=
 =?us-ascii?Q?PZtZwW1wb2AvIevlO8SjHWfJ07GZzZX+W82SLCDFGRz1/p7x95LGhg5cWsqp?=
 =?us-ascii?Q?8usjglA7OOGKBqvklwUlabjyD1k9rGPJrVJwFqmsBpO1KXMp3nmKqhJYs0nD?=
 =?us-ascii?Q?i8P+aBsiEhsPLIWqotv291isYyvqRIV6l0OhLd+EXLxABpanSwNcM6CKjqg1?=
 =?us-ascii?Q?Ue74afG5dLWxywuwKe/hdSkIjtvxkJsXGFJ5bOsmIu34rshfS+3wolVRyDUL?=
 =?us-ascii?Q?X7mDeUDWbcPrIrOFOgT5sOfH07o76AqKmYsqobit6INcWgtcKz9sL3F9WhTo?=
 =?us-ascii?Q?m6KH7Ig0WUeoza6hKbv2xy4lcQNgEjKBNYi2HQGeCo7DmbkuIJtv2I6A+P8/?=
 =?us-ascii?Q?rbrp/LIFh6Hdd591+0OzRvzIWmVSPYnQsISR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CayTQcKqVEZlYI+qmMjaMNUmQNZBIqEKc8CovA9uK3y+P3z8RNB5mFxZwAqX?=
 =?us-ascii?Q?9iwiHT4Nw/1P1nLbnku8PAhge51vMVWddxdIHFeN1Nq8PQqhf7q8R7PM4Gnm?=
 =?us-ascii?Q?aXBd9Q7PXk6b6SDQGGFJ7nvOZh9OSmBKkJBs0VdpFPhYWV7auo1jWaiPycqZ?=
 =?us-ascii?Q?SZIEkxcUncEIdrFTMQf7GBxa8PVw3e174jux6a9BEHCl148nQS8571Oo8fLj?=
 =?us-ascii?Q?+AHrCTfz2u0PlPzvo41a4uaIpH69odSxNlHkvf+pBSdUv40+zzSFZvD0jT7E?=
 =?us-ascii?Q?/YgMUsH34jrMTuPfGmWILdH0RAS+GAQrgNnKUIPrYOWkO0Ax0EPs+nyOQAta?=
 =?us-ascii?Q?QOXusYAhN45Hi/+vI1DmJ4U1+IMd02REdipuRF+urOL0M08owc15SJ2R32J+?=
 =?us-ascii?Q?+ujkRM5O9uPIdYKh/eTxZ+SHnFR2k6PmOfTSk+nDPZ2+ST4NQF9yanIkpdr9?=
 =?us-ascii?Q?2Gy/GCbXgwAqhr+RRldTzHEW7mWxn22WVYCwDYAEJot2AOsmYIGBNv5sC6su?=
 =?us-ascii?Q?yL6whrTK6fUd9aKfv78CybZYA8TkXuiAfdgYv/ZF6akl6z13m4j4cgPb0OUH?=
 =?us-ascii?Q?tYmDUOHRCBqS3FujcOukj8ynjYqqxPNCSvaULD9kw6O10HnPO5qpdBsVDtnI?=
 =?us-ascii?Q?zPfs85iywVxgabnyC+RFCidWNqD8Z+MHIW4f8kwYnS9zj4iTy+WmsrEB9hkK?=
 =?us-ascii?Q?Z3kaZ3bAls2EwncyRa6H4fsFBYW9w4d9jyoKak09t3sg+OUz5qPmZSrjdWUJ?=
 =?us-ascii?Q?fTH9JdLKo2EoBCEamByBuKG+ZCsbJFSMVo118oqPsqlwHrRL6uLzDLHA4PPl?=
 =?us-ascii?Q?jYjL+DcUQK3FXYrDE2KVHktJgpbEFRjde6BUMJhnxAfpvDVoo0YOJDoK0azR?=
 =?us-ascii?Q?2dTF5Q/kyxO87nLNuV5W4tnZQA4Z/I9DwhB45H01wSvTNfbhdZrReTmfZtUG?=
 =?us-ascii?Q?FJ2i/4YyzBgFC9XA8pMfrAPZH9NFTB0ltnQOh0kMq5L7vYNxSzk/3TOrM4jS?=
 =?us-ascii?Q?1BHqRLvrP5p9lx7N4/SmjJP/Y9dn7ynQgO5VY884eEurkI1R417vtu8pCKfk?=
 =?us-ascii?Q?xiS3T1OHXbVECWPgugMXHq/bA2X+5b2qf7UwuuQtBli1mYm07BGYx1JO9AZ1?=
 =?us-ascii?Q?VqXJ1hjSp526iSFunL/Of+TMJUHV9H+M4+rajceh9WQgcGsdLS9+0mhN95Up?=
 =?us-ascii?Q?nwMEDtyLuwpbZb/PHiwl0Tqh8+38QiF5pFPlyIKmeP6RHXtn1MEA2QyZ0wtZ?=
 =?us-ascii?Q?Q4op4usIgx/zlSGHnMEurf1e/DFGMvHF9+7FCwFbNGoMsa621zZrNHruD3YB?=
 =?us-ascii?Q?hihFffVphFLWc5T5fDx+1Z7zCI1qbm6yjMCbpgCDYsMM47uz+xDWM6AOKUgU?=
 =?us-ascii?Q?s3qwekuNYSe+Eg8hU3iNQ+MAwGVxFPvVKDXm4mbsojvZFk2sapsoGN0aGHv6?=
 =?us-ascii?Q?YLJLz11QQwwsc9kKByn6oWGxyEuq55nFSwkwy3fNfxH2A6G35E6wAZIERhrD?=
 =?us-ascii?Q?4aRXDUvnBkgkv/X2yuI/qvjk5c93LWrdOX2qZwadurKYg361hJcHj9o9SkGx?=
 =?us-ascii?Q?R7nqxahr44kkaSRlI78=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9814a3fa-42d7-449e-b622-08de07dcf0c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 09:11:04.6252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVRKZ3ZwFEaF0I88+wKPs0QgpKTkwistBJRRGKhDHhfJzliKnIW5sVNli10Ak/V5RaiTkmRbcl1ZL0Sq3jetXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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

> -----Original Message-----
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Friday, October 10, 2025 2:27 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; B, Jeevan <jeevan.b@intel.com=
>;
> Manna, Animesh <animesh.manna@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_vrr: Dynamically verify LOBF across v=
refresh
> steps
>=20
> Replace the static LOBF check with iterative vrefresh stepping to detect =
LOBF
> enablement.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index ee0f057d5..5bb3a2835
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -870,6 +870,8 @@ static void
>  test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t f=
lags)  {
>  	uint64_t rate[] =3D {0};
> +	uint32_t step_size, vrefresh;
> +	bool lobf_enabled =3D false;
>=20
>  	rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[HIGH_RR_MODE].vrefresh);
>  	prepare_test(data, output, pipe);
> @@ -879,11 +881,21 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_=
t
> *output, uint32_t flags)
>=20
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
>  	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> -	igt_output_override_mode(output, &data-
> >switch_modes[LOW_RR_MODE]);
> -	rate[0] =3D igt_kms_frame_time_from_vrefresh(data-
> >switch_modes[LOW_RR_MODE].vrefresh);
> -	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
> -	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output-
> >name),
> -		     "LOBF not enabled\n");
> +
> +	step_size =3D (data->range.max - data->range.min) / 5;
> +
> +	for (vrefresh =3D data->range.max - step_size;
> +	     vrefresh >=3D data->range.min; vrefresh -=3D step_size) {
Can we mention at what rate the iteration is being performed ?=20
> +		rate[0] =3D igt_kms_frame_time_from_vrefresh(vrefresh);
> +		flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
> +
> +		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
When it passes can we print info at what rate It passed.=20
> +			lobf_enabled =3D true;
> +			break;
> +		}
> +	}
> +
> +	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>  }
>=20
>  static void
> --
> 2.43.0

