Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55522C54E66
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 06:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B8610FA66;
	Fri, 15 Mar 2024 06:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bcp0T9fC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7987710FA66
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 06:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710483711; x=1742019711;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S/iWRI995YJBVsydsVxjBAQaWxRDBBUkxssT0OCuCKY=;
 b=Bcp0T9fCrJbPzD0WUxQtrlcbgplAzYX4S3lcnlxYlWrsW1ROt70JXSEo
 G1VspFd+djSjFFLj83kTafMS+2LIsfvwW5L9HotlYvaVpxJ/QcTOvI64P
 pxFmxUX6vTbKc3RX17mQgr/7ZIDgwFc0PH6KNvnPj7TKa2dRolmt2A+8i
 ajDq3yL967tc3ZLbfzXh4gt9tIpP7i+ZFgT8oECdoOPr2vI7HRmft7UdO
 h3OE1dRjkmVnfq2AXw9+gd3smlQRKUr5vdNa4FyLxL6K7f96mYvfG6I+U
 pnW8vPiv7F/vZfWTzlMe5TA7Hr7hC/5bYmFbrmmEbTFsgWmKZ4y/tsaw+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5940802"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5940802"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="17254728"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 23:21:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 23:21:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 23:21:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 23:21:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 23:21:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2Mso6OLD/6BnES5f0lYryAarJcuoz0T8MMOF+tIq6jORa2EAtwGNu8zRH7rCCz0th85i3arQf6ld9tVsl3UmOqZnTx2sD2P2k+IKBTMVNPqdj2NvV8JxkJK17TR1QujrCQQcXFAgGgW0I3rAWdpM4ISzGY0Dd9AcgdmFf1O5PKhRq0HX6l6AQe8TI+Qa0iCcbcDZ9le56fsBdX+UCQr6hG9DQNiI+xyWTFi1wh2te/MkT53PMu9G95sP5/X/EwUQQlbVLgAWulhRQxcQI2Da/FfI7VfUVqJx+ZJfpztd5aOVICNbybPkErZGafdg61dJDeoGPfJ0uq9zIP526YSdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6FJIlhzqQF4jKZv/A9fre850UH+cQ0MZ3/jJJqQe4M=;
 b=NPTARw57zkeFYyODN6BpvQZUmY0iH+pkzK7efI5wHrP6znurVj3n9ZEs70G5NPPNrmDBC/J9sbVqigoHKvl7ZmMv/E5tyod0Xt1uL1fIO0YwqbbsqXvdevqjFxjvPgVC6x+5aLyPYiw5OCQwJXHgPEW8Z0kZeI1eGyIU/+cs/hfERH7ogNBSIqD43Bk17Nr1df4SIH3RRHPeDkrr6W8g2jxws10jUIx+Kzthh/gCotjiZTmfrWkGNyU57hqeFfgscc3LSKrY/Zv31VX2suGMkGkqT4kzyOKOfObKOhgYAtMSEbSHXtKoL1pN8IKPtnMih0owq0xbMlMqdMUHEOboHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 by CY5PR11MB6308.namprd11.prod.outlook.com (2603:10b6:930:20::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 06:21:41 +0000
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::2e00:6a0:1e21:b016]) by SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::2e00:6a0:1e21:b016%6]) with mapi id 15.20.7386.015; Fri, 15 Mar 2024
 06:21:40 +0000
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B S,
 Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_async_flip: Reduce the clobbering area
 used for CRC test
Thread-Topic: [PATCH i-g-t] tests/kms_async_flip: Reduce the clobbering area
 used for CRC test
Thread-Index: AQHaWofbHCcHJt83d0emAjLKGTzGaLEAe6SAgAAYCkCAABtXgIA33J3Q
Date: Fri, 15 Mar 2024 06:21:40 +0000
Message-ID: <SJ0PR11MB67893C4AE494FA485ECEADFF8D282@SJ0PR11MB6789.namprd11.prod.outlook.com>
References: <20240208121039.13701-1-vandita.kulkarni@intel.com>
 <84ddef1c-d502-470d-8b05-2432416b8f9a@gmail.com>
 <SJ0PR11MB67899FCB90CF101777DDA1C98D442@SJ0PR11MB6789.namprd11.prod.outlook.com>
 <ZcULkcsD6d4LgRn8@intel.com>
In-Reply-To: <ZcULkcsD6d4LgRn8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6789:EE_|CY5PR11MB6308:EE_
x-ms-office365-filtering-correlation-id: 74f8169c-f1cc-48c3-8fbc-08dc44b82d63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o+iQGu9/5BBLQOsaWHkqp9bEnZLvjQK5l2GwyfO5BwmuR7UBdC2U6OJJxh2oQrqQBOR21EQJT7T8py7NMyqovMpbuRHmhTZIarafYzK8KTQZ+TR6Uv11RAhCeXVvlrR+/WyYSoQ1WgED0vktQkPA2XsTwF2/y6mly7jjV9qno9hVP5RRGwAP4XtPZN/lPUOxjivGox1psPRtTj04CRp82BIGYvygFc/tU5D5YzE3uX0G0/Ooh5vB7z089NqlbkkIc04VqWt0/f8S0YjvIKac6Pfc487TBk1OTH3mh3BCM8icdITQZce0juUbtM91whIdDQ22/1GiIxIeNd3ftifd6kSl64s84cvk3mHIgM0AHoymGn4Xu8syb2/BXT8NRgxQ+MqoCHIZE+J+hK/ZiYiwkMpd8jnLOI+JICY1k1fKAGrcZAUmaN/9QSRTZdqsfNe580K9e+mRWrbhrSd/6yY7JoGjPS037Gj6XETWxCL1caqbwbwyEzeunt17YhbjLoO2oYp2/f5BruK2099YFM+cIoYBkIxj8r6ZftxyZPx+xuP2RXhERBm0+2YIvFj7KIs6bxcyllQF8d8RjfzclZhNKz7tOXVZuMirBZZnee6u46tmkOzCm0F9aaW6A+ppItv3+Dlb6BscCZHutITwZOBSXed54wnEawqsETz+GrJ/4tXhofscsLxg+CAq3EwwW+pEAwfNc7g9yM5RFHAXjpkQJYPsjNrHm+MFetY8e0+o16A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6789.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4FkIwRZXn0VRN3Bpv4D8LAS+sdHpPBe10GwYw0aYJ90U8eAgvww7ijs5Y5?=
 =?iso-8859-1?Q?0E+C0lnJznf0lVppYc5ki+HI9yP7UeJTzHmJ6KFnvrXtK113hwa3fkHlSd?=
 =?iso-8859-1?Q?uVxTgAVGmPqgAXsGEaHdVAmHBpb6xNtQfu0/61u4mz/w8v6OgldY9w1as1?=
 =?iso-8859-1?Q?54rGqExL9L9P8gnkqSnp7dasnlTm03jv7zPrjJq1D5mLGAduPPkQycTTyJ?=
 =?iso-8859-1?Q?RQ8lTOir5QkR+B7p0xhLhRksK1QOoo9z2h11bJ029TdSmiz61NyPPlbNbQ?=
 =?iso-8859-1?Q?5q93YGkDPJLtXaUj9cq6SSWdXVfOwr7NES+3NYl0eEi/8LhEhuo1NQwmEu?=
 =?iso-8859-1?Q?V5fbjZp6elcpwoPk3zTTbClxUg2jb4eb6k6hkh2Xw3/nzIXevs1TTzbkFA?=
 =?iso-8859-1?Q?44mAjnGcvXSwTrrxGXLqDycv12ZK7fytA3azkJbtFl+8LPGc3W2pl/5WLM?=
 =?iso-8859-1?Q?sMqhzHZXim1YXO8iFrBz2YUOacDz7gnNnJsqE1aVLONbAJS+XXvNMo/Qwg?=
 =?iso-8859-1?Q?SdPjD0jxfAfP8Djcl7t2A1RtnjgCkh+NhMH01f0KOMBt+SqF01RgN5It1z?=
 =?iso-8859-1?Q?DMZnBKiopsgcQiASqEeJq8Lz022r1CrLiDlLULLW22TVywRz2VV1Na37ZH?=
 =?iso-8859-1?Q?2mij7vfR6qBfZqdiRaIZjmMdEszzsQIvJVdM02YJ1eJdbCfd7Qoxq177zW?=
 =?iso-8859-1?Q?/DwfG2KuWZiMmP/4ipGcww6JuCAiZtn98P0Ft9IsWQW4jzYmWKl6rCbKGd?=
 =?iso-8859-1?Q?m9jR9UBLO5CnOt890qoivL+yIndB3TxxyxrmgMPeWPE4CgA8NOlUH42qkO?=
 =?iso-8859-1?Q?CNmDU2h9rKO1x4EvnwMRatMMSDZsa+8u1osw6KUbIZ/Wol4ZZqTnCCxw85?=
 =?iso-8859-1?Q?tnK2kO1PaLru5kU9I/wPPZqA01Mo8iT2pAxP/Byjg7uNgmNDU73ESZRBO4?=
 =?iso-8859-1?Q?R6tQ9pPxC8ztOc0fOg5PjRBdylsawDahSLCoLM6qu+NMCtgyQ5pSpr/nsv?=
 =?iso-8859-1?Q?iyyz8+9fStpZpoNWO1d13Y3gdfE/xmwlkORhnK1ooJbeg/ZwbYa2UMU8/O?=
 =?iso-8859-1?Q?WIDDmcf0ef4rV4cKg+UrRSNrGn1rEEg46nbB7WGJsW2eU/j+jMvcC0gSNy?=
 =?iso-8859-1?Q?pzY12n0Z2SNoQRzKFF317R6MOjdwvUn0/Y7rJI9B1diFXJ6pSaTU5q8rpz?=
 =?iso-8859-1?Q?r04pKZPHLETLqG74GzZiVRmBbLG40+gJGK5J+GHBfVPhjRw5YjIGe7vg3D?=
 =?iso-8859-1?Q?eKX/WVfRzwIwIwxG7EebWGP3F8Tn1jO1UNsNMZGGgmo93NPHZ9/2dBuN87?=
 =?iso-8859-1?Q?tsjpLb0f6mfG388JA6wcytpNHyw0j5mNXjOVfNnMgHhlcrO5koxn3G8MwX?=
 =?iso-8859-1?Q?yEJXCwvfc0t693Ld+YbCjmcQYs1+YbwMIdBTxXa5HQLeBzxBDtqgDt0K0C?=
 =?iso-8859-1?Q?SSk0z2MXP5IaweeTwYwkFfwKSHwAVAn8VPEnqVXW2HUJGQh5a+0JlHtOe3?=
 =?iso-8859-1?Q?a+VKFkNT+bzRpwW7Kg6bzMARHxMQMHl1Ud1rP0NIeB5//xOGeU+K7+zj2o?=
 =?iso-8859-1?Q?dvgG9IUEmCNctB5R1AFSAVoaJZzK706vUzv0/zBbPTUn0jf5nuUgjcNVqt?=
 =?iso-8859-1?Q?F8HF2qHlSnALINxr5p2aVBZdK5JJW98Frpr05Jako/62MeMpnmUzQfuw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f8169c-f1cc-48c3-8fbc-08dc44b82d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 06:21:40.5908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /VHXuDa7pLsOrDWsRNdzIIZmTSWqE3zzHqmIogLAAjxB0rj8Nym7HPK05hGrzswbRfa+DPsgr0xnqLgFAbiYotnNPl5eC8XzkqnKFhxFq8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6308
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

Thanks Ville and JP for you feedback.
After further analysis, I found that on some platforms after first mmap, up=
dating the pixels take longer.
I have sent out a series to reuse already mmaped buffer since we are using =
only 2 buffers here in this test.
[PATCH i-g-t 0/3] Add support to paint already mmaped buffer, I have seen i=
t help reduce the time during my testing.

-Vandita
> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Thursday, February 8, 2024 10:43 PM
> To: Kulkarni, Vandita <vandita.kulkarni@intel.com>
> Cc: juhapekka.heikkila@gmail.com; igt-dev@lists.freedesktop.org; B S,
> Karthik <karthik.b.s@intel.com>
> Subject: Re: [PATCH i-g-t] tests/kms_async_flip: Reduce the clobbering ar=
ea
> used for CRC test
>=20
> On Thu, Feb 08, 2024 at 04:03:49PM +0000, Kulkarni, Vandita wrote:
> > > -----Original Message-----
> > > From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > Sent: Thursday, February 8, 2024 7:39 PM
> > > To: Kulkarni, Vandita <vandita.kulkarni@intel.com>; igt-
> > > dev@lists.freedesktop.org
> > > Cc: ville.syrjala@linux.intel.com; B S, Karthik
> > > <karthik.b.s@intel.com>
> > > Subject: Re: [PATCH i-g-t] tests/kms_async_flip: Reduce the
> > > clobbering area used for CRC test
> > >
> > > Hi Vandita,
> > >
> > > On 8.2.2024 14.10, Vandita Kulkarni wrote:
> > > > On some platforms wc_mmap write takes longer to paint the fb,
> > > > which we are using to clobber the already scanned buffer for CRC.
> > > > Hence reducing the clobbered area.
> > > >
> > > > Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> > > > ---
> > > >   tests/kms_async_flips.c | 4 ++--
> > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> > > > index
> > > > a0349fa03..2e5960943 100644
> > > > --- a/tests/kms_async_flips.c
> > > > +++ b/tests/kms_async_flips.c
> > > > @@ -589,7 +589,7 @@ static void test_crc(data_t *data)
> > > >
> > > >   	while (clock_ms() - start < 2000) {
> > > >   		/* fill the next fb with the expected color */
> > > > -		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
> > > > +		paint_fb(data, &data->bufs[frame], 10, 10, 0xff0000ff);
> > >
> > > Here really is needed to be painted full height of the framebuffer
> > > and that width can be kept at 1 as any number higher will just increa=
se
> the work.
> > >
> > > For async flip part of fb which will become visible is not known
> > > here so the full height of the fb need to be painted on to catch if
> > > there was something going wrong.
> > Thanks JP for the feedback, you are right, for async flip we might not
> > know if the previous fb is still being scanned until we check the last =
line.
> > This might not be the solution then.
> >
> > Other option(on non fixed panels) where we can optimize is by
> > selecting the smallest mode, where as  now mode[0] is being picked.
>=20
> I already did that once, but it broke something, and was reverted.
> See commit 79483e9ae4fe ("Revert "tests/kms_async_flips: Make the crc tes=
t
> faster"")
>=20
> Hmm. Looking at that revert maybe the problem was that I just used that
> hardcoded 1024x768 mode, which perhaps didn't work due to i915 still
> missing the PLL algorithm for the newer platforms. Picking a smallish mod=
e
> from the connector's mode list might work better.
>=20
> > Incase we pick the smallest mode we might have to write a new case to
> > test async flips with bigjoiner.
> > Also it is really not clear on which platforms and drivers, how much
> > time it would take to paint 1xh fb. I will try to check further on this=
.
> >
> > Thanks,
> > Vandita
> > >
> > > >
> > > >   		data->flip_pending =3D true;
> > > >   		ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> > > > data->bufs[frame].fb_id, @@ -600,7 +600,7 @@ static void
> > > > test_crc(data_t *data)
> > > >
> > > >   		/* clobber the previous fb which should no longer be
> > > scanned out */
> > > >   		frame =3D !frame;
> > > > -		paint_fb(data, &data->bufs[frame], 1, height, rand());
> > > > +		paint_fb(data, &data->bufs[frame], 10, 10, rand());
> > > >   	}
> > > >
> > > >   	igt_pipe_crc_stop(data->pipe_crc);
> >
>=20
> --
> Ville Syrj=E4l=E4
> Intel
