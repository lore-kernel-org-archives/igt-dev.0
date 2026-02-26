Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3DCFC591C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 09:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B5910E8A6;
	Thu, 26 Feb 2026 09:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3ZhcG+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E57510E8A6
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 09:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772099053; x=1803635053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=O8a/Mig4RLNQcoCZwuTHnh/h9M+AiKTnhr0bXJTRGII=;
 b=T3ZhcG+bEw+MYOyuOCRtsR1FYTpXlUYq0AjGG3n5YbgzUJL6ZrWxQUBN
 zca/04fy22dL3KDyoYNOZ462OjcA2MO2dgDzVyLG6BO1iMI5eU8R3s4Qg
 8Q4fHiEQjH2kHFN1x/wiN80Qxcfsd7oNOIAjUN4Adr8jP04XZWcoxFpj9
 ZyrFTo3Jaefko9G+dYowK2eiC6WZYyVdafIqrcnixQ773jI1HC7HdbNQp
 HmbFQEkGJoAHcnIT117C3VimWb+PNH68OCvAWt4+Zj4E1cy+CagHDBGTO
 JDVfbaXfMuhDPA+P0jROuZQWswLwirTPAEXXvAQFkQpaa0VG6FiRa5+4l A==;
X-CSE-ConnectionGUID: /veRsUNjRpmwrv4HktA+lw==
X-CSE-MsgGUID: XEykaJiATEC87veqR2gnyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90736600"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208,217";a="90736600"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 01:44:13 -0800
X-CSE-ConnectionGUID: 9jKsy8YJSvCnymy2Qpv+5Q==
X-CSE-MsgGUID: S4slegKHQrqy2jnrQBPToA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
 d="scan'208,217";a="244122514"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 01:44:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 01:44:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 01:44:11 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 01:44:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRHm2i8WcFirIv8s0dblCYYCByCxEg2D3m39mJPCt7MdItYQIKGXCSXK8ZA1xeCgU6puQ+UU2CUFI0obanO/GX0bcdvgDj3ezVuk7Gln5+/aTFh8FZJuvO02Q0tqAtSWxEJ/Loil9MjPbmNXclFTRvJmXJoyduZunrNSyKR0hdsCZDATYKl+NKxQ4oYQXB+dgqkGuIqeo81lALBb0/d16PAaYL6/JFmik58QqsiGrQj0PCsPwsOdihyGpJXxEBWnSrCKdtrj/zT9MTs2YNpHNWH58WK2sXSaj9/oroHsetQGTrAhpCokjkBYU807+GLLcvwabP9ze9U5ss6kdkW2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMtT6ZHxe8L1AieoGTFsdf/MZ5dCchTLay9XGMCelMQ=;
 b=nTx/F4B665KCu/kIfO1nlLs5K8gOBcCwgHoHeCCzKv3BG9S6U4cD3wvgpUZ308v7Jitdpipk0+2Wn+E7s03SM0wV2Fqq23taMeHEq0eYWAWyZ2ClrOXkDG2XNq/OnIwarkM9te5mMePip4F3oYqjX5HbEHbVI1Zb7RnxQCNRlezixD3VqQetd0/8VUGl7WNZ7rSEBva8NI08ZGxbHdyTpMI+5KPkUJZkszUs0HHjPBUhOOcehoPDPO0tcmgiB9Gqn0/JM0yethiuEUNsuTBN/sB09JUUCm2KfbWzFOoI6XfGMeMkPAjkDaSaHRx00GCzvVRfkq7QInfgjTJnGbbEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Thu, 26 Feb 2026 09:44:04 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%7]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 09:44:04 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "Karas, Krzysztof" <krzysztof.karas@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Santa,
 Carlos" <carlos.santa@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v4] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Topic: [PATCH i-g-t v4] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Index: AQHcn+Ud/KD6jRBLwEWKz3AqV38lkbWUumCAgAANZKQ=
Date: Thu, 26 Feb 2026 09:44:04 +0000
Message-ID: <CH0PR11MB5427D45B35C05AF8FDB0641C9872A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260217075953.3220732-1-s.sebinraj@intel.com>
 <ubagvytbuffhbuuxphwwa2mk2tf3nj4suhv4rpokq6b2qih4fl@u6zdwsiplm6e>
In-Reply-To: <ubagvytbuffhbuuxphwwa2mk2tf3nj4suhv4rpokq6b2qih4fl@u6zdwsiplm6e>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DM4PR11MB6432:EE_
x-ms-office365-filtering-correlation-id: 53609d1f-c796-4a65-cf52-08de751b9403
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|38070700021|8096899003|7053199007;
x-microsoft-antispam-message-info: VEbWLRs9KzNCYbOzdZ+LfB8VJov8JfSMu9DHYhF97r8jV65FK8Z1/r8p2plcHtT/0YQZY9PoYT9N4Cr0xaCTF2NL7ilf1jp4ufkZOpIhffr3zVaY04X1iSQmEcpMOoaT5RZ+7vIYcaxVK5fyKCUeVfnb2Fhwdti/BCLhO/5gxShugEmpS5n4KdHZd7XnUrHRqEZvbI8QwMjcuuQ8GayDanEdiinzFfcXr5jX0GmRuqOEFiIrOZ4N3h87HKZQrPtD7t3+eie6jrpylmA0WiiI+yd27Xb9VoTFsgcbHjkk6pw84l6hh5xGtzkXaMLSS1Q9XzeBhTQKFd0g4YshvOwysmMJ8w/qEJa1P16jMpP2Wv7mOBpBW8HPDMZbDupz4CL7AxwM2vHiCQI1v2p+cvhgI1YWyPitAsH4/LApI2n8+K/awguUSWdNsUdLywwOqYWOD36NlREP9e8ErEvBItIq0gOq1DyoG02c0LtPKz1774rmfp0lxQwoqROZVoR3oVGAIQZ2XKCDSu/O0ISNq1tkpnyw+uQH9C50jyXioV520O700Ao+ze4GemSxUdt0COtHE4uVmfPAiS6n3CKTsGlgaL79b/Tj3A/Q2c0Neh+kkVmo+eRFPBlTPULBpkPt+xSxiqkVuyDx+3qpYK9ejGdz2qyPcvAYSfxPBy0KslSGMwkNNi9UUmi/OxVf37/2os4a2G2OrCwTSYQpA8228znYCGMzGxDduvQWgsx3HbC/vfJ97rAlILXol0K3o9htY0lI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700021)(8096899003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2wxlprPwgZOm06NvCkCp+er/zT0hl7fL1kqfnhsUI6GhOgy4cxwfZY7+v/?=
 =?iso-8859-1?Q?HGUQtCx1A/cRg1JWrBbC9p0J9FbbL/yskf6lRDE2m4dAeCX2TnIFg2YyWu?=
 =?iso-8859-1?Q?758035PC4UJcFW6h1cxuJulfvJeKqAoIRYnNjXBwPN4wNJlz/bxPlhtpLc?=
 =?iso-8859-1?Q?9bcI1/dddy+n0NyRA3PmaevSY+ht2N/AaAl2l+Yk6hl2kQz6Lx4+GXvsXk?=
 =?iso-8859-1?Q?khPTV7iocrZbhCNiP0gppvxZTyh1r+foCR5Z0t8ofyrSZ1c5U+iopA1HZK?=
 =?iso-8859-1?Q?LdTkjqlNtB1rEIX3NlvmlU/5bQ++8yMxpcHgtOh+FZwHcdB42+FotkXofK?=
 =?iso-8859-1?Q?MelKu9NtpvJcOnpjSLRSF3CEpQlVtaB2s2WZKSp/kIT8svXr8SGs+yyBQM?=
 =?iso-8859-1?Q?hkW0iqR5cKIuZ/MV5Cu53Ev0SCV+04peofrUCrkm8A2spUYUjG0KEEDph4?=
 =?iso-8859-1?Q?xSoUj9cnT30wYrJ/i3FbFaMgcFCFJQXQj50wcDr7t87o1ZV7UVN9zSW3y3?=
 =?iso-8859-1?Q?RbPqXofBVGXKf46OB4aQHNoGdrHBCgU0MolRKe7+TwIHi98i4PfpPfwK53?=
 =?iso-8859-1?Q?qpAI0DACiqhgFEeuSz73TllpyhPbcp/sIYPvLSZArjTUsXS5L5cAXSuqk3?=
 =?iso-8859-1?Q?//giYPX2LVC0WlsBkyPNhkOJHbv9whJjyGk2hk4xdWzrnFonfIhPI//0x+?=
 =?iso-8859-1?Q?aTpEaUcWCJMV/OLNgxQrRbY/wTf1oJ9iytOK+bPxXdiJTP6bG3E1w1JFKq?=
 =?iso-8859-1?Q?KPT+bj8nt4IgfDbDwK17ogjBbFvyCDao34a+4joJI6WSwh/+EWeTWYT80c?=
 =?iso-8859-1?Q?Kknt83f3mdBkxXLZ4kGzGL80e17IzOdo6ZLNf8ZkO3p021TfGgJg7tWmCI?=
 =?iso-8859-1?Q?WM2ftVdcY6sqCCOYL3ivAqllstIphBimsglN6Vc5+1mo1b1nCn3E3Hr90P?=
 =?iso-8859-1?Q?zj4hgjJF1LXPMNvYITuBJVEu+CkbrZu7PfeINCx3zNcsHNDPhvgxoWpgzH?=
 =?iso-8859-1?Q?PA7dSGOxTRMnCyqCqig+nsOUA5fjJ7Zp7Oy8wRj0x1GjQ8eg2TZPnl3SnO?=
 =?iso-8859-1?Q?Sj8DTEr/UgUpRdxSrlbrcOSMrQFsfKn9itSmEQ0UlXHdOdi/nTaVLqgnyd?=
 =?iso-8859-1?Q?pOU3JTi7MhIpGM+IhLeMBGmbQ4yiCC8opcQT5/qfHJGTrOAB+tE4XLeBOn?=
 =?iso-8859-1?Q?VI+fYOGmOUEtswF74gENcjXo0AzFAdssngWblHvNnkoiqvBMFIoun90PfJ?=
 =?iso-8859-1?Q?QIwBR0yQPo8UCBr0Bot39hMOywrXahIGV+0GYTBi1AcEiK4o6y+SCwJ0ch?=
 =?iso-8859-1?Q?OjPhAfGMeVvrvylTmGVeUjWXf7GtNY9rXAwU4Ha0NPIogTioIe7DFJmVLS?=
 =?iso-8859-1?Q?9TPkxXAXbduTwXR3jHF3dTstsbtlBiVP/wnr2LVsSuJzfZLVn2jhryGrls?=
 =?iso-8859-1?Q?Oa9PQdcRtaFWCOUlPn6ARRzynLG9VPlcQqsaZ3obEZ/hkaorss7DkRsl7q?=
 =?iso-8859-1?Q?MbVcM5/fVAasR57aQRCRHz7RvRdt3pPgvVkX1Ov/F60wWbimDyL6Sky+VI?=
 =?iso-8859-1?Q?hLMGVWCkyI/DdzErcANBP72vhOxF/rRvvZqWP7UAnvXaYMoJRZF7VWTZkW?=
 =?iso-8859-1?Q?pQfPxmI3Mm56G9ejn5b+ryVxp0I+W1Ubn6dXVOmxyoUk2BM5owEYT0GU0u?=
 =?iso-8859-1?Q?RiwWH6j2UlFhSsOAXwYix6GzzyiYF3cv++Wz2cnIZPyB4uhLjq/ugHyV1A?=
 =?iso-8859-1?Q?J4izQtPDLSqegBd/nME55xCG4z6WrPyb5ibLWc6rxELc+Q?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427D45B35C05AF8FDB0641C9872ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53609d1f-c796-4a65-cf52-08de751b9403
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 09:44:04.0874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Yl9jcUDZkdo5/vXN4Jri3wUXNaZwcFXYkY1YQuWojbzCnwvbiu+wYcdnJ/qPz9FC5i1MgPd+nkAZGQB5FmgLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
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

--_000_CH0PR11MB5427D45B35C05AF8FDB0641C9872ACH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Karas, Krzysztof <krzysztof.karas@intel.com>
Sent: Thursday, February 26, 2026 2:21 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Santa, C=
arlos <carlos.santa@intel.com>; B S, Karthik <karthik.b.s@intel.com>; Konie=
czny, Kamil <kamil.konieczny@intel.com>; Kempczynski, Zbigniew <zbigniew.ke=
mpczynski@intel.com>
Subject: Re: [PATCH i-g-t v4] tests/kms_explict_fence: Add Test for Explici=
t Fencing

Hi S Sebinraj,

[...]

> Background:
> - A bug regressed for Xe driver on PTL (Android) i915/display handling
>This is a bit misleading. If the regression happened in Xe
>driver, why are you referencing i915? Is this part of common
>code between drivers?

Yes, this is part of the common code b/w drivers, "i915/display" points to
the kernel driver path. But you are right, it's a bit misleading.
I will correct it.

>   of explicit fences when provided two or more buffers at once,
>   with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>   https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>   use of explicit fencing in the KMS Atomic Modesetting APIs.
>

[...]

> +
> +             /* We need at least OVERLAY_COUNT overlay planes for this t=
est */
> +             if (data->overlay1 && data->overlay2) {
>This will be a bit cumbersome to maintain, if the number of
>overlays ever changes, because you check for overlays' existence
>directly, not for the number of existing overlays. However,
>I couldn't come up with a better solution without introducing
>complexity to the code.

Yeah you are right, I will make a change that is scalable with the
Overlay count (existence).

Thank you for pointing out these.


>Rest of the code looks good, extensive comments here helped me
>understand what is happening.

Thanks Again,


With Regards
Sebin

[...]

--
Best Regards,
Krzysztof

--_000_CH0PR11MB5427D45B35C05AF8FDB0641C9872ACH0PR11MB5427namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Karas, Krzysztof &lt;krzysztof.karas@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, February 26, 2026 2:21 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Santa, Carlos &lt;carlos.santa@intel.com&gt;; B S, Karthik &lt;ka=
rthik.b.s@intel.com&gt;; Konieczny, Kamil &lt;kamil.konieczny@intel.com&gt;=
; Kempczynski, Zbigniew &lt;zbigniew.kempczynski@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v4] tests/kms_explict_fence: Add Test=
 for Explicit Fencing
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi S Sebinraj,<br>
<br>
[...]<br>
<br>
&gt; Background:<br>
&gt; - A bug regressed for Xe driver on PTL (Android) i915/display handling=
<br>
&gt;This is a bit misleading. If the regression happened in Xe<br>
&gt;driver, why are you referencing i915? Is this part of common<br>
&gt;code between drivers?</div>
<div style=3D"font-size: 11pt;"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><span style=3D"col=
or: rgb(0, 0, 0);"></span>Yes, this is part of the common code b/w drivers,=
 &quot;i915/display&quot; points to</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">the kernel driver =
path. But you are right, it's a bit misleading.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">I will correct it.=
<br>
<br>
&gt;&nbsp;&nbsp; of explicit fences when provided two or more buffers at on=
ce,<br>
&gt;&nbsp;&nbsp; with 1+ already-signaled fences and 1+ not-yet-signaled fe=
nces.<br>
&gt;&nbsp;&nbsp; <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D=
"OWA15f00df4-03bf-5489-6b94-fe0d6fb357cc" href=3D"https://patchwork.freedes=
ktop.org/patch/662982/">
https://patchwork.freedesktop.org/patch/662982/</a><br>
&gt; - Adding this test so that IGT contains sufficient testing for the<br>
&gt;&nbsp;&nbsp; use of explicit fencing in the KMS Atomic Modesetting APIs=
.<br>
&gt;<br>
<br>
[...]<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* We need at least OVERLAY_COUNT overlay planes for this test */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (data-&gt;overlay1 &amp;&amp; data-&gt;overlay2) {<br>
&gt;This will be a bit cumbersome to maintain, if the number of<br>
&gt;overlays ever changes, because you check for overlays' existence<br>
&gt;directly, not for the number of existing overlays. However,<br>
&gt;I couldn't come up with a better solution without introducing<br>
&gt;complexity to the code.<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Yeah you are right, I will make a change that is scalable with the</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Overlay count (existence).&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thank you for pointing out these.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt;Rest of the code looks good, extensive comments here helped me<br>
&gt;understand what is happening.<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks Again,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
With Regards</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Sebin</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
[...]<br>
<br>
--<br>
Best Regards,<br>
Krzysztof<br>
</div>
</body>
</html>

--_000_CH0PR11MB5427D45B35C05AF8FDB0641C9872ACH0PR11MB5427namp_--
