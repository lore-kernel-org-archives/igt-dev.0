Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE21FE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 22:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EE410E24C;
	Wed, 18 Dec 2024 22:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UTP2z3Xl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F38310E24C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 22:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734559533; x=1766095533;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v2y9/3hT72Se3B7g7Q+TrSS0jEYowFTzkVYm/1bJcpw=;
 b=UTP2z3XlofTugxWUjSQtoHbs9MSg4QiZCEyobD7x+GQlkyj+u4qNC/qD
 7qHzBb4Kbc8ixeg2HjsEIfMHjBXIH3FCXg0ThiMIft1F2MG4HBM+0hYOw
 LWcY7g/ysLXyzNf0hBi3qCc+p1PGr4CU+yFFOUR2S3D1MrVpi68AZyd90
 wRiN5QNwQGEo5ZlWPvia0VpsgBqsWM3uvUffNyB1b/d++w0u/gOSgM9uK
 QL+2Arn6BkTq0UydXVBAsbJ3SipmzZ1KpA90+uTwUg8V+p3RpFQBJN5+5
 V0rNEt7PmHbjKJhaOyZWZt1SG4CDyKIVQsCSYSzU7Bj3eKG6ZFzreF9c3 w==;
X-CSE-ConnectionGUID: CZaZUN1HSlilNTq14BhMew==
X-CSE-MsgGUID: /qVAtK8HQWiMFe/r2nHYwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38732321"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="38732321"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 14:05:33 -0800
X-CSE-ConnectionGUID: nQiI/CyeSpOlKPzUvp6NkQ==
X-CSE-MsgGUID: pu9pftyGS3+C5YcOevYXpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="102828792"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 14:05:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 14:05:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 14:05:32 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 14:05:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5q1Q3DausvWx/fzhohSRafNVGepl1lxaAkZQtwXLBKIsxvEIyCusV+bSbgTfwBmBA7f7HECimvuHI4+D554C8yxIdj4f16VaiOXPoqWJsKgs4VmPXPjLb00ItyxRsLGJ4Iqf0Bbn9jAj16FMsOPim7OI4qzCSNBMgL9kYSUVS0OUT1ry7b4tcMWUfVaX1/E4jqkM4yv+DRxyA6vS3/fOrVoUOwGhIn1bnokX69o8dVF4jJPdm/KltVImClnyUyGBZ/Cn2T20ipYo6kYeMjaTfU+AyulRqwOOTtpLs7R3oy/wIYGCCknrVB3L4hSga2DHTSzEuSkZA2zVovFNCgy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpJKt6CEM2ML0CT21o0v57vmVPtLGEsPWxoskldqXhc=;
 b=dI9/jOpdK4L9zfvgf6+j+hK3PH9yXxtV1h0PMf3AzQSw9v/2diFb0pIZpGOKGBmAIZldtRgyAmoo2xB64o65mivEPMZ7z+U4sKAKhlgRDIOYSD/Rj8gWFgwnOUgTzI4WwydGa0y2LK2hkMJbsiLMDmi8v4N4g6OU1CrCFVDl1stTagGFAnWFb+p1g9kfc0cdXaNBpdk+psYCiX29x2mXsqbpwI0wr50tOjiZ9T2CpDLfp/NpvAYNcZs1FMFwKFIyfhR6HByAvZqi9nwAAseFgZSoS6fHIf/Q24AeQJbRYo3nju7JkTeibKBasLTn/a1m98BH4GXDcpr1nc82oRN9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7803.namprd11.prod.outlook.com (2603:10b6:8:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 22:05:30 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 22:05:30 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v5 4/7] tests/kms_addfb_basic: fix x-tiled tests for
 case when there is no x-tile
Thread-Topic: [PATCH i-g-t v5 4/7] tests/kms_addfb_basic: fix x-tiled tests
 for case when there is no x-tile
Thread-Index: AQHbUZUETmGnGLJasEW1I0iwJGjxh7LsiDUA
Date: Wed, 18 Dec 2024 22:05:30 +0000
Message-ID: <CH0PR11MB54446543D4CF8368C36C3A63E5052@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <20241218213654.2734573-5-clinton.a.taylor@intel.com>
In-Reply-To: <20241218213654.2734573-5-clinton.a.taylor@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7803:EE_
x-ms-office365-filtering-correlation-id: bd669f03-06ff-467b-3586-08dd1fb01634
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?42kfaU5SzXTLCEYVVYLO9LOPpaOOwhV1/f9kAPBblpYtatTvm0yD8G5Jsy7+?=
 =?us-ascii?Q?AMmfWFjpc3/J9xTU1l34dNZa5DfMQvOEsS65m43HMB9hdQxD6Du2FsrDQBj3?=
 =?us-ascii?Q?xellmN30WbhCHcjd9jKWGu4m8liUFfrVHoJpaPYSwsLvlQCej8u5K1ptucEA?=
 =?us-ascii?Q?lQAmG4tJsmakKtOmJ3rY7JDpFo11+EK/AGHktzfNJ/EzAq2GuEutlvxP5ISg?=
 =?us-ascii?Q?ycmqT0zmIWylO8yBBI0ehQt3u5teKQ/AiWydh//Cws/BfZ1YTM1vVNB9Ua4R?=
 =?us-ascii?Q?qmYwT+IwGEKqb89327iXwBysvD8HbT4CHerqzbpG30FetowFGugY5kvVHaac?=
 =?us-ascii?Q?p5Q6vVv2dncOT92yL0DK6NSQ9dufaPJYOy8EDaheGfzvJY7vnRyx2CaPCVfs?=
 =?us-ascii?Q?pCn9HVHrU+GMFtPHAqTXd/MTYvmIVTMAXsx10TtGSglJAQKTUfb/OnyRfKEk?=
 =?us-ascii?Q?AU/N8cbx7DwkkiHeTH+0fdG/J4Bckvz9AH3JlfyIjdevHOxujixwUArEkela?=
 =?us-ascii?Q?0da/7bINg6IyG3bfZMKfqZYDwCxcdJIqRFRZGT/qOlfKxdyTEeUhuv+lcdVI?=
 =?us-ascii?Q?/7jShX0706iDsMuJM0MXwrqSAOxSz5WlvgF5htUq9Z7Ax1yz8pb/jj41dYM1?=
 =?us-ascii?Q?4jFkctH0AbOlx0oHf7uClzGDBiOfnEMpwDbbVHt7TdYPRuivfqM7hgPzLb8B?=
 =?us-ascii?Q?P03I7yNcMzyVDG+mWNAXyadk54/scoI9NwEOmOA71j2pR+xqvjAp9pv4G5nB?=
 =?us-ascii?Q?ZVfcESPehlN/q/JjBMKZD38qJeIKs+wmYWPPIY8f42hTSUSkRYkAq/VKet8n?=
 =?us-ascii?Q?YU4hwytTYFIfF+9KoN2NGo5a1VkGcQFfie6WcrqP39+jtRaijboM4FZwCAGk?=
 =?us-ascii?Q?1h0vQiv8jfX+5IGNWQK6ppR8+eVOoQvZjoke+ygmpCYdLyBNOGWU+2gXUT6E?=
 =?us-ascii?Q?Qdsq++1OGSr48lV9zDNg9Gr9PPLncVL5TwV022Oh8SnVfi7G8FOkhJbho63v?=
 =?us-ascii?Q?LJ1EbeSPBV6yK0HnimyfVa9YFXNKCD9szUppL/NP0TQqrIvm61ehmYtN0ijd?=
 =?us-ascii?Q?LrqO7G4dp9EelKoPA0xijbiZBVu2uJKXw1v2GXJ8oJhnw/VK1+3GHFEMm6Od?=
 =?us-ascii?Q?aOk30fw1y2rYZdlpngwCNDhT0beJCjyB1Gcl10NraQy852fBUCLh9MCCUGsR?=
 =?us-ascii?Q?Y+3EvBdy/9Dw/P5tEHQm/zOPfnc8ptNt2OzpmP4dgxXtyNytnYydxVbsj2G8?=
 =?us-ascii?Q?PvKz1f1DWbtfyAf2QfbVvWk3LHpCnNJJUqQKReSTpOLwpvvpxNchnGs/UUTm?=
 =?us-ascii?Q?nczmL0Ko07bAJHyNpMLHT8M94T05eCBHCFmRKEVXJ6wRanDXhugB60NvXrB4?=
 =?us-ascii?Q?szkB+sGyNunJ3233amQJ+spUphUUJMe8lAeeU4gAYPjuM5TkjV3H2YdrdsiH?=
 =?us-ascii?Q?yn/e2K7Nf9EYoid2sKveJTUkzgrmzcNK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OyBRQWao+72mXuC0w5Z6TE030sBATfQH8FPFqcJ6Wdf/zKk0e2r7J6oafpXQ?=
 =?us-ascii?Q?DI4bZIw8gXyHnWPLQVMT0CL7dTIEAuC3EHZSXkvlk+wcevuonrJ/g1Tw4f6r?=
 =?us-ascii?Q?ZoHoCbv5sl8B7QOY7S9BZfEv6OhkrW5mP+yTAbCFBGnPYqXckyaa+YJL1L4r?=
 =?us-ascii?Q?lmJb+TIoQiCCSV8/PCeqmRJKGt1n9zDxlWenvsW6DN7f1hs+Vv7CJHMFxuC8?=
 =?us-ascii?Q?J/R9Ry5SeiUf5D23Rbe1/P0nmlNJmdb+uZk3W1VGMr1jrFhcqOZialXYPIhD?=
 =?us-ascii?Q?mxIoqPFD1FxgcTNMVoAFg/D54rwXnssxufHjLtmC6h+j3vWYT/+9ZxhNC72A?=
 =?us-ascii?Q?1IvV+J7BQyIoPOl/lAMDT6eD7cvol7FFCMofSd8sae15LPmyqp31ZYvT79DE?=
 =?us-ascii?Q?boN4UEMJFDbye4WKW6FFXJUD39VP58Ayq4kTWQLIPRZ5xfV/2mZ+i3YaNgqs?=
 =?us-ascii?Q?ofulB+GmtEENI9wdI5WDKOrYVzXVz3UUPp4Oo5HXIsP+pOySLRFTYh1dv+GQ?=
 =?us-ascii?Q?467d9rzry5fKT04Hn8jc/EDG8MQAGGDYMum4vLQdaJbGqTNv3mp1bkmNnXlQ?=
 =?us-ascii?Q?n3cJabEo2r5KTEUWg0kyKKLUcKhwJoDUuBV5um8bA8Wl6Q25Tyjywbo5ZliG?=
 =?us-ascii?Q?G+McAmPzQJSWbSozauQVQ0ahy/JkXxXmdbHx881/lPTVlG7xxggyXMox3Aiu?=
 =?us-ascii?Q?8HIhsvt1MFcLhF1Z664e/L07JoxBeNnZxOZ384C75x6GCYbXsnl/tOqjuxxv?=
 =?us-ascii?Q?AiSvXGOkjkgOPfXstILmnLEahf/34ncviSa0tnz8aanoDpgV2ptXJGmsEno2?=
 =?us-ascii?Q?MOR0LN67Fri0F/Nen5jgbA7jJ2Q0K/4+RIVuFf/sLdgoaxF7mgvQlfjHCWS9?=
 =?us-ascii?Q?BTflMcRYQE6gLVpQ9Yg7RlwophSUxQm0+f3gIPiJ/oj+K5wnSBVg2x6NhnRQ?=
 =?us-ascii?Q?b6VC0nLbn9yhhyGpIndwaLGP7GpNmgW5fmnAUr6ZSD1+6YZmDiXcliJBPxmq?=
 =?us-ascii?Q?ytDNMmi9mn3KqyxPELZOgFroyhyleRu0eLfojAxi96Llh3c4eez3KIdas6O8?=
 =?us-ascii?Q?z+0ZVIg0mn2RSbSo2G5x391Nb0xOa2BO2NciOBZkzFPIm9gwPqoUjAUxOHRr?=
 =?us-ascii?Q?R5Z58n5lbHKsToWUB/nfgEa9cV5e3AOw0lANE79o7qQV6QMbXGBqyYNWtpkA?=
 =?us-ascii?Q?AOBqifEKRXn66t2SyagS6PZW2pkOwOQMClBY8T5nddZBMAkAvzjCUfA03R5g?=
 =?us-ascii?Q?c9c93uTTIGZLOgJscUCAAbdYWX1PEiCpb5f1GoXslkczhP0/x3RqRb/vMbVV?=
 =?us-ascii?Q?FmHm+h7RIXftSnln0KN19Zkufo/C75DVDFDeaHzW4Kty7GE/vIstcD4AfDEV?=
 =?us-ascii?Q?HR5ctUX/ttWgAz3rRmw7Ko0vC4KYaBRiJ6vMKvJ2cWL8bcxTJa9+R5c14vD3?=
 =?us-ascii?Q?LZiAIqHvbC7VQ3OiBiM9btjKlhMZA2zNmn5FSLsfz/9oJ1xuZ2OnxmO4wty5?=
 =?us-ascii?Q?6n7h8KCwyx4m2JiMfW8udZIDxLRZL0Sy/H1EababoSjjpollQEbzsqNMhkd6?=
 =?us-ascii?Q?q9PL5/JX5IvuVSpof+zGTvcFqZa/oYL9VrB1fle3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd669f03-06ff-467b-3586-08dd1fb01634
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 22:05:30.3507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xTmAa2znNjmC0oATTQMBuCy6LPTw23PoY6rOKBWW118l6otpP9GqagmbLNAreQOCBUWKkEfxLz+3mNAAq4ZkyQTL0LYjEKgt6j3dVQ638iE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7803
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Clint Ta=
ylor
Sent: Wednesday, December 18, 2024 1:37 PM
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 4/7] tests/kms_addfb_basic: fix x-tiled tests for =
case when there is no x-tile
>=20
> From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
>=20
> On Xe3 display no more support x-tile and will disable such framebuffers
>=20
> Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> ---
>  tests/kms_addfb_basic.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index b22818592..3ba87117b 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -217,6 +217,12 @@ static int legacy_addfb(int fd, struct drm_mode_fb_c=
md *arg)
>  	return err;
>  }
> =20
> +static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cm=
d2 *f)
> +{
> +	return igt_display_has_format_mod(disp, f->pixel_format,
> +					  f->modifier[0]) ? 0 : -1;
> +}
> +
>  static void invalid_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f =3D {};
> @@ -735,8 +741,10 @@ static void addfb25_tests(int fd)
>  		igt_describe("Check if addfb2 call works for x-tiling");
>  		igt_subtest("addfb25-x-tiled-legacy") {
>  			f.modifier[0] =3D I915_FORMAT_MOD_X_TILED;
> -			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> -			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
> +			igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
> +				      addfb_expected_ret(&display, &f));
> +			if (!addfb_expected_ret(&display, &f))
> +				do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);

If I'm understanding correctly, what we were doing before was we were perfo=
rming
a DRM_IOCTL_MODE_ADDFB2, then subsequently clearing the action with a
DRM_IOCTL_MODE_RMFB.  However, now that we occasionally expect the first ca=
ll
to report being unsupported, we no longer want to perform the RMFB uncondit=
ionally
as it is supposed to mirror the ADDFB2 call prior, and in the unsupported c=
ase, the
latter does not need RMFB to clear it because it did not run.

It might read better if we did this slightly differently.  Maybe something =
like:
"""
		igt_subtest("addfb25-x-tiled-legacy") {
			f.modifier[0] =3D I915_FORMAT_MOD_X_TILED;
			if (addfb_expected_ret(&display, &f)) { /* x-tile unsupported */
				igt_asser_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -1);
			} else {
				do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &fd);
				do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
			}
			...
"""
Though this is just a suggestion.  I won't block on it.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  			f.fb_id =3D 0;
>  		}
> =20
> @@ -756,12 +764,6 @@ static void addfb25_tests(int fd)
>  		gem_close(fd, gem_bo);
>  }
> =20
> -static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cm=
d2 *f)
> -{
> -	return igt_display_has_format_mod(disp, f->pixel_format,
> -					  f->modifier[0]) ? 0 : -1;
> -}
> -
>  static void addfb25_ytile(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f =3D {};
> @@ -1012,8 +1014,6 @@ igt_main
> =20
>  	master_tests(fd);
> =20
> -	addfb25_tests(fd);
> -
>  	tiling_tests(fd);
> =20
>  	igt_subtest_group {
> @@ -1025,6 +1025,8 @@ igt_main
>  		igt_fixture
>  			igt_require_intel(fd);
> =20
> +		addfb25_tests(fd);
> +
>  		addfb25_ytile(fd);
> =20
>  		addfb25_4tile(fd);
> --=20
> 2.25.1
>=20
>=20
