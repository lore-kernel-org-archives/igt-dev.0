Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88319C2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 05:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B6D10E106;
	Mon,  5 Jan 2026 05:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYdaWMfX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C7110E106
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 05:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767590193; x=1799126193;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=61UkhzVACiMwmz+j2clqiJ77GUH1y5W79g458t2gFOQ=;
 b=mYdaWMfXDCUiyGqPxjVTnOVfEkpXXFNoQZrxpVVqXSEkuU8N0XFMlivw
 BV0fwsqvtR4ocLLGnyrfEf5X/9m+jRs0xbpcPfVvsU8UU/wjSWBQDwTo0
 HKbtCGB8UmXvh3AE1BIGK8N9PWZ2TxvLC2tGt00kg0hgTc0yY7wPlBYDC
 mlr+6bYSWc8Ug3UwQP1dpJV7BQr9cT3hDnYgOuyyZEoqssfVt5R2U/dZ5
 4dkI/6QYB9A3uY+1ZJGqL1qb7/UfEWflW9ldj/LPXWqALFSuYKcXx5vv8
 H9viK9dl4922HFPMK9Q/8DW+MhSj+Bx03NgDMveD49S/V0xxJcJCHDlRK w==;
X-CSE-ConnectionGUID: NjbMO4L5TZSxYuENdg9IOw==
X-CSE-MsgGUID: 6hbLdC0vQb+4xoOOPN2w2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68995480"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68995480"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:16:33 -0800
X-CSE-ConnectionGUID: xCkL004uSGyvk3yZsr3Y3w==
X-CSE-MsgGUID: y01YHxdHRnOP3fUsJWM+qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="225833926"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:16:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:16:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 21:16:33 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:16:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbcKjfnVs4N4YbkqiZe3+5gDzvBp6NYLxHqOB7lyFj+lfQLbevbhqyCjWy1Hj2+uT7a41qBudD+4EtUiMAMp0fUUQVmhXzd4kNFiIPr4vcbMq6wQzXS1JACV1E9gt5kXKH3b04AT8Krn3CImjocmQzTEA0EMPNs9+1aIGaF2H7XBUiAIu01MvEIwDUe+37WMzMLhJdtJz5kFHZ+CQrADCLlSeaadnhlBHMaqxZGPuld6xvfnen8yyHx660o3j+VcguLBfjrdV30G89GpyQJ7lqGAvD535c1HGsnL/oN5wkxBH7TwSDt5PcQOVva10IGdJizdMGw4/TUbDtwodLGWYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjNd84KnM3A73WUiV14BXOyR2gs6E8oa/4N0HzyXJ/0=;
 b=sNNmuGc2jXs3HFm/md51RDz5RFISZsydBK2D4Xy0IsaMi8T0No3vfU+RZuGaKwfZUagI/GfYpxGcEWI9nV9AYkbAm9hyzaW5r1//Qb2vQRLlBMzpEbFOOergpSiOMTl/YZUYQHPGkNIefT766AtsdszAyYBmKjDzj1unq7md6j6yg0U6VQKOTJT865SI1uHwsMpM61JvvWpxH2/ouzklfvGw6MPClXQTtNpNnAAyJTwB6X6lKACllFthUrtqIby/MXC+j/sd6rGjEYesbGNIn2YUlOVlgB17Exi9Rez+BX1dj3QEMJmdNbhgMr1Er1Z5PBg17t7H39ppzzJDGiQVDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 05:16:30 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 05:16:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t v7 4/6] tools/intel_hdcp: Add video playback loop
 with thread
Thread-Topic: [PATCH i-g-t v7 4/6] tools/intel_hdcp: Add video playback loop
 with thread
Thread-Index: AQHce66KJXXjhjtbl0+VRT1sLMGEEbVDDKHA
Date: Mon, 5 Jan 2026 05:16:29 +0000
Message-ID: <DM3PPF208195D8DE46D8C6454DF4773B378E386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
 <20260102060835.89725-5-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260102060835.89725-5-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB8252:EE_
x-ms-office365-filtering-correlation-id: 64b8ee36-77e3-4ef8-549f-08de4c199596
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Dz1OxXKYDke7ya6ZUxxHgi6LW1C2Mr+PG7BQ/Cp8CsgDJUiSsFdEMHN+M4pb?=
 =?us-ascii?Q?RCpf8CXsGZd0quOIxEuX6lHe/UuwpBIqKeXdgeH3Jw/EmhPeIgF2+shXc8wm?=
 =?us-ascii?Q?qQb9EJJbl6auscJF0CTm1FnS9N6QtWzmKhB+//XXBZeHr/bqh/fZYxRMLuH3?=
 =?us-ascii?Q?4cdWplQagSvyhBhlkL5NLTekmaBagfqnOhZTowyXDROrbfYpV6tUVQNq19MB?=
 =?us-ascii?Q?pb/JdAEdN4p0LnkibRm1jGUicC4Jp5ma/u0jqywDBmbyY6Hh5zt/2ZCeLReT?=
 =?us-ascii?Q?CTULAuz04g1LuKegg/a0q+yXC9M1mfTl5gFgVp8B2kbPSR1FXCX/TX12zCPB?=
 =?us-ascii?Q?FZlZ1i7DMkY1Hl57CuwKlsvmtYkMRTwF5h0CLuXNMF6x4++LMVkthJEu48Zy?=
 =?us-ascii?Q?pVif5qvT+Btj7q0qZLgbpmLRYWac0WFX9pSouhIgbaRLOZqN1W298c0I5gfn?=
 =?us-ascii?Q?SX3H5sS5G8ydV4d9ABbVO71DCan2WxmpyVlyb36AFYz6TL9gGEF2sR93DaJC?=
 =?us-ascii?Q?18tR3l7PH00nR+/B66gT9s9g4Sn8jPNVAciFtvsWCladVG+mCoghpp70hNkT?=
 =?us-ascii?Q?sBYcyvLt4zrhUFHKmv9Wl3QXFCFXO48kUzylfSKloKmGk9pJ/rs0G+Y4/Ixk?=
 =?us-ascii?Q?AnzjTK3wOqAMzG0OfZNlIWr2IdNa/5ye9HE6U2xmzKUwoNzFckOyJNPgaIP1?=
 =?us-ascii?Q?6qtfftIA8a9/c9VlU7lqKli/1N3PAiC32w2taIDzd/5bzEaCWjvXtgdnkXJI?=
 =?us-ascii?Q?s857tfH1/WnfNJud5LwT6PAapNBjwVVfPj1ZsTXajxpSsL5Mhh6XcztQSNVp?=
 =?us-ascii?Q?DfwEZSnwrHNQB0RoJUds77Pv2R6e6v/lzK3onPaH3EjEOPTC7FvRy1z/yTFv?=
 =?us-ascii?Q?omBqwVM17BVPNkryHNru+E9w37wSgs8t4CgUMi6Y5G7yRd6QdJ8/9ox6cCkv?=
 =?us-ascii?Q?Fb7F//MWu5HkRvHktULFU+rR3EoZFX+jac/u+avMIjDTpEKhl+LNCrrZadgY?=
 =?us-ascii?Q?VYLxNydpywcXypIQmmJX1qCfN/dmKqNyDPeAFVlF26kcLH00OYSC82Xj8Da4?=
 =?us-ascii?Q?tjywtq3TvsKh4/G3SFNmTpn9AUiOZbFGpirYKstGJ33ru6+kQcrnxiqzlnHi?=
 =?us-ascii?Q?geUsbQuQpK8y2FOPc35pIM9tSF6+auSxHji4GllTYzm5qAcNMLSjnCMEPT8M?=
 =?us-ascii?Q?U9tdysCxmd1zJ34rqKzPe5RDgccdScC8UK5pbqerA/+t9BR8DN4ar6RfYb8Y?=
 =?us-ascii?Q?nr3UGsR7VWtamPsn2AKKcMNs/7exQxqSMPyLxCt7Qaecvfxcanm2EafGFwbq?=
 =?us-ascii?Q?xhs1mGhim//MyTnLA84wa5Fat/JmrNjFqGU3sAen0jsqSsSiDW9YF26ClyP0?=
 =?us-ascii?Q?9rNdqOA+m1zAQlb5BQsgmfsJzv6omQCq8MshEPF/XNYWazmU/04H+YKlRL/d?=
 =?us-ascii?Q?csUTpLNtMa4z2THvL5iyDOn8+g9/iMCJmWNXioad/FYwrKKqxTU0n81Qp/Zz?=
 =?us-ascii?Q?0LtnKQHwikc2C8okXMzlHxaZUyNhnr+XpwqX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NL4rxm8GPIMbfzPuDVjK/GmZcjc25uw59hxURPxJuDjgZtPLA/HND+RzibxZ?=
 =?us-ascii?Q?FPVsdhLdm4oSRs+0WaqPh730O/e0vSMPrXuICrygUFgh9RCB+MEnFRNg/nPH?=
 =?us-ascii?Q?h1Yfugjq+k3Pjfw1wz3nys3ULbxWV+AhA6FLOQW3pxGezuS4eojDhW2Y52Fu?=
 =?us-ascii?Q?RZszcwWvvmEik4RFxoC7QKgn/5sboBvvAiyVzfNxvyFyA7ybcnb11eLEbrdn?=
 =?us-ascii?Q?fA5+vyZ4dNfZtmW94infvsPwPUcHQRY3HxeWThZ0iFtqW5/tJ+kzMnQlXNHU?=
 =?us-ascii?Q?P4Ww2WVi+I3WPnCvk0RiTh5tsfHcHk2f5Dq2wBHc/jh7qxg7Cux8Gc9K72RZ?=
 =?us-ascii?Q?NZLFuHaWdvDNhkIU40frFs1C5pDCOfHZzpr4zv2hhSMu7JQCv/sErKi+JnZg?=
 =?us-ascii?Q?8IuTG516nr0fzGahMZPQiT9uo4/UHFHowkJbmR6YZAaFjWE0dHT687PwR/x4?=
 =?us-ascii?Q?bfIC2xcoP20VhR2VH/UKbCyyMfzq8bH6nS4b9VW+T4YbyK31HuN5qIBMHMd3?=
 =?us-ascii?Q?h1KfxO4Q6sLtoBJ8K8pMcas+pgr7o+fMsc84fdZxLtJoMn/BHk63GNlWew9e?=
 =?us-ascii?Q?qm5OCNia9cq0iEOW1EbfFzaVzm+6++NwblFj2h1wRKR/e1eda7VeyjRMl5m/?=
 =?us-ascii?Q?0lL65Np7z2wKyBEELqOBk5KtigLUaVZRu32VyxfWpAfj1UuzBX2nIP94/CKj?=
 =?us-ascii?Q?dPta0tvs//feb/uLz90nYj+NrFcP4MXYjvCYU8Y4nLr5544LLG2KucZhwNzm?=
 =?us-ascii?Q?EQNhh/6k10rQMnYf/4rtFEuZeZKYUruNusf+mtkACybfEMWjAS3F3JUY8sZu?=
 =?us-ascii?Q?gp2xc5jpq066yKJb11WQgUsqukzbbsHyrTxpFQ1xjD6M1Yq9fyzXvnDOT7yD?=
 =?us-ascii?Q?yCF8FH4Wc3CqVf/cODYkIZWhmCYOu1DVzO90mz1+ltd0swD8JKJNtLorTC7o?=
 =?us-ascii?Q?Mqrlxp8tUYeisIcyympK9aHQcSU5QrjqjZvRllhtFrGEwMJSyV5D2ZcwsiFH?=
 =?us-ascii?Q?tw/Rzfx2aoOLtO3egE8J+yE3jfx/vtfyqr+4tXANYcxRYBCvCCvw93xEfG77?=
 =?us-ascii?Q?jrVE5pGhdF9v2WPCC7z2yHM9WPeYpGAEoMyD/pqKwJl4HAUEitgBRSvd/a0l?=
 =?us-ascii?Q?+SwiW25bDcyd8bJr/WgLYfV2HtGZejI8iNfbK6ATKOre4wznCGQWS1Mr0K/d?=
 =?us-ascii?Q?RsnLhxQAI6R4Z1dkl2NrMMUOqlV5HRgFaMry1Fpoajt4qirppmUQvh9+0+8X?=
 =?us-ascii?Q?IyPUBlyXN4Vlu0L3OR8IG5olUksZaoqfn/HREjufNK+HFBIsrwbayyySu5cH?=
 =?us-ascii?Q?PsBAyKwsIDaVpdXlYVbh5XiUGRVTXDQc5Fr1vhEKSKhUbiEVoqQyJleX1vvf?=
 =?us-ascii?Q?uMTyLIH/sefI4syLls3t/6LEdpbqar1fAkCpHIioyCzZ7GntDkYXc2z8rCEk?=
 =?us-ascii?Q?xSjujnIArnp8LI20VUoS+y1PrfvJl/HBCCbHARYFudA1PGMGHLKWc4tayzKw?=
 =?us-ascii?Q?2es42N0corjtWRzmGkKprfr7AZvZ6iz6B8hnGzUFiKGREELFOj/e8HYFAers?=
 =?us-ascii?Q?MnJW6Azasj1PMCKBcDZc2JgGLQXmK9fRZ99DDtQNhMMI1qv0nNlSLYexJXXp?=
 =?us-ascii?Q?1jaevqjyuT1RAD90+2ZifnctLt4bBWEhaecj4j0eHQMenrZX1WAbBMST+8eg?=
 =?us-ascii?Q?7m9Q3TuZ0FzdHe0xiydN9agrDwUxA4QnrG0hFghBSypDFZfL5AsegpR4RmjM?=
 =?us-ascii?Q?yMu/sIim4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b8ee36-77e3-4ef8-549f-08de4c199596
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 05:16:30.0167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7JZkG+3Old7Yhlzdh5TOW8JbdgHTqXs4yzpzOjuF0fyRexUnGZly+ZdkPy3EilSplTRXtvtg9yLpT4GUwVDiMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8252
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

> Subject: [PATCH i-g-t v7 4/6] tools/intel_hdcp: Add video playback loop w=
ith
> thread
>=20
> The thread dynamically updates the framebuffer with HDCP status visual (e=
.g.,
> HDCP1.4, HDCP2.2 Type 0/1) using color-coded backgrounds and text.
> Use start_video_player() and stop_video_player() functions to manage the
> thread lifecycle.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 96
> ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> 9cfbc0576..3dc128531 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -35,6 +35,7 @@ typedef struct data {
>  	pthread_mutex_t lock;
>  	pthread_t video_tid;
>  	int selected_connector;
> +	bool video_running;
>  } data_t;
>=20
>  static void set_hdcp_prop(data_t *data, int property, int type, int
> connector_id) @@ -342,6 +343,101 @@ static void *keypress_thread(void
> *arg)
>  	return NULL;
>  }
>=20
> +static void *video_player_thread(void *arg) {
> +	double font_size, x, y;
> +	struct igt_fb fb;
> +	cairo_t *cr;
> +	igt_plane_t *primary;
> +	const char *hdcp_str;
> +	double bg_r =3D 0.0, bg_g =3D 0.0, bg_b =3D 0.0;
> +	cairo_text_extents_t ext;
> +

No new line here please

> +	data_t *data =3D (data_t *)arg;
> +	enum hdcp_type cur_type =3D data->hdcp_type;
> +
> +	igt_create_color_fb(data->fd, data->width, data->height,
> DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &fb);
> +
> +	while (data->video_running) {
> +		pthread_mutex_lock(&data->lock);
> +
> +		cur_type =3D data->hdcp_type;
> +
> +		switch (cur_type) {
> +		case HDCP_TYPE_1_4:
> +			bg_r =3D 0.0; bg_g =3D 0.7; bg_b =3D 0.0;
> +			hdcp_str =3D "HDCP1.4";
> +			break;
> +		case HDCP_TYPE_2_2_TYPE_0:
> +			bg_r =3D 0.0; bg_g =3D 0.45; bg_b =3D 0.45;
> +			hdcp_str =3D "HDCP2.2 TYPE 0";
> +			break;
> +		case HDCP_TYPE_2_2_TYPE_1:
> +			bg_r =3D 0.45; bg_g =3D 0.15; bg_b =3D 0.6;
> +			hdcp_str =3D "HDCP2.2 TYPE 1";
> +			break;
> +		default:
> +			bg_r =3D 0.0; bg_g =3D 0.0; bg_b =3D 0.0;
> +			hdcp_str =3D "NO HDCP";
> +			break;
> +		}
> +
> +		cr =3D igt_get_cairo_ctx(data->fd, &fb);
> +
> +		cairo_set_source_rgb(cr, bg_r, bg_g, bg_b);
> +		cairo_paint(cr);
> +
> +		cairo_select_font_face(cr, "Helvetica",
> CAIRO_FONT_SLANT_NORMAL,
> +				       CAIRO_FONT_WEIGHT_BOLD);
> +		font_size =3D data->height / 12.0;
> +		cairo_set_font_size(cr, font_size);
> +
> +		cairo_text_extents(cr, hdcp_str, &ext);
> +		x =3D (data->width - ext.width) / 2.0 - ext.x_bearing;
> +		y =3D (data->height - ext.height) / 2.0 - ext.y_bearing;
> +
> +		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> +		cairo_move_to(cr, x, y + ext.height);
> +		cairo_show_text(cr, hdcp_str);
> +		cairo_destroy(cr);
> +
> +		primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, &fb);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		pthread_mutex_unlock(&data->lock);
> +
> +		usleep(100 * 1000);

What's the point of having this as 100 * 1000 why not have a msleep here fo=
r 100.
Also why 100 msec wait ?

Regards,
Suraj Kandpal

> +	}
> +
> +	igt_remove_fb(data->fd, &fb);
> +
> +	return NULL;
> +}
> +
> +static void start_video_player(data_t *data) {
> +	if (data->video_running)
> +		return;
> +
> +	data->video_running =3D true;
> +	if (pthread_create(&data->video_tid, NULL, video_player_thread,
> data) !=3D 0) {
> +		fprintf(stderr, "Failed to create video player thread\n");
> +		data->video_running =3D false;
> +	}
> +}
> +
> +static void stop_video_player(data_t *data) {
> +	if (!data->video_running)
> +		return;
> +
> +	data->video_running =3D false;
> +	pthread_join(data->video_tid, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC); }
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> --
> 2.34.1

