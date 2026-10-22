Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D267606A32F
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b9LeDavp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA86B112422;
	Thu, 22 Oct 2026 09:22:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35424112422
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792660901; x=1824196901;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TvWDv/4UycPW+/iqCFy/NIM/hb3smJdqU76JEch39CE=;
 b=b9LeDavpLAjYOkokYbdvUtaaYCJbFrUW6+nsNC8g8E54K2v4tLDPMOtj
 wuVwI/4fiS2U+yxo7Qsp88wKfhreFjJlKOvrrLXtmiqOtBh0XyoOd/X9N
 EPob5xFhRrlOryozMrJcNvuLuiPzurQHs37nOJ9Ng5wYxQfJSCk/qe7Um
 tBa8vudWu9EhYEnNavCXxnId5I6IMn8hCReXX8eXgmfULxy09EozGTZ7O
 Gliz1kmjkxhpHk6NI8h55ViYQmg3IPbQQlsHEFo7+Mrb0kz73lldz9OS7
 Ibozt0PJ9dDJO4Na++X+xCdb/OCMsjJhjlCsTZtb+GaWx7TFK0hWRvlWp A==;
X-CSE-ConnectionGUID: v0Io2kphQQ6hPi05K90zUQ==
X-CSE-MsgGUID: H9MsABW3QpOI7YI+XfrCvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1413720"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1413720"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 02:21:40 -0700
X-CSE-ConnectionGUID: MGMJExXpSXa7XghJnLSHyw==
X-CSE-MsgGUID: WyABHagtR1yBxbfmXtQDbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3310929"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 02:21:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 02:21:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 02:21:39 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 02:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1CdSich4vsOui2w971/tAwaWdSWwlxT0RR87axRxY3jhUIxxC4E9evuQXNCmm5Ff85WnBkXTSZmf0AZa9NffwlUXV9JFP77MNQ/R8Ufq6HSsKPmBdAG/mchitRww0zx8YYq5EHKxCPfrrOHgQowhPMNy5UBqEAjfUrS0EiaEebawHofvhukqS90S3PYySGp8ZWxCvnl4kzlkBsVS42NHYR8xAApvanj7Y0C1OUKaU9HJOqk9ThWkVXRqM4nojtbBO3dJjfSFRJMe3UvwwCoslK+LdvT3NBkPiRoaNlBLz3b8qSfymW9nz+ueZp82IeoWHO/2i4qJ2xFkCvZApZiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lzl1o1yBXjQZJ1nmI7s8G1hNSNv0DGEO65Tpnxp9UhI=;
 b=xXBgmMdsdQ9N73Jd1i5js3nXToasjzaj2r0JCuzpetw1zXhSu1N6koN9kpu5GFgSm9SLjKeG9vlS9GWMAre9Sn4MMgS5NsW6FJKEQJczOZuiQkzoq5bLO3uet0w2W0AiDQyHIYqOkHpZBRpbgmHpcwVld407C+IMaJ4ilFWa/8DCbZWEyQ5kjP571IES8n2nhIjxowwGcLZUqcoOBhmjSmcgG+lakN3m8T6W+g7gWzHGf/J5uf/vhZn3FcEeke3+hvPf5ZdvgdxhqyElTYKO/QpVrM3dmS/xWwQrBZ7pZWYwpd8Fr+r3CxuaNg+3/6q+jiHUBa1pLbT6exCYKRzOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS4PPF7A0031045.namprd11.prod.outlook.com (2603:10b6:f:fc02::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 09:21:31 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 09:21:31 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_eld: Avoid asserting on malformed SAD fields
Thread-Topic: [PATCH i-g-t] lib/igt_eld: Avoid asserting on malformed SAD
 fields
Thread-Index: AQHdYSLk+9U0NrllgEm22i6bQq+bDrcJSMsg
Date: Thu, 22 Oct 2026 09:21:31 +0000
Message-ID: <PH7PR11MB6053A98E76C5E9242ED51603E7652@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20261021054606.2731711-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261021054606.2731711-1-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS4PPF7A0031045:EE_
x-ms-office365-filtering-correlation-id: f4e065c4-a801-47c2-5812-08df301ddc02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|10067099003|261021121427099003|3023799007|22082099003|261021123027099003|11063799006|5023799004|56012099006|261009223027099003|38070700021;
x-microsoft-antispam-message-info: H4U1x+cuvOgHrS8P/k4CaukTwOdrpZzMAZzpEDqU+Iiw6hS+sFFzQVBYB4wVu4Aa1S4IPwECn6TntjsqA9WuUs1ggCIHzs9JW7ItvpucmqBunTl6GBYzPRU3JX2znUaBR+Lf8nraYNJ3o107rtyzpim9bDadfmYSanPHXk+EFp2DeAuq6QXnmPC7UNkg4C3hPxh4nRXsP6rSmXJ9e5dVgnU19rzd9VTpYlzane9BWrweolDlgUeDSB5UZWcld9Zr8nREIpPgMFkj1lzb/aJJfckyeKbFj4M095GBHh8dAt8g06fnY5XLbQBSdzdH+PQg8Vx85n7NO8LGv2qZta4YM48+Df4rX/If0BqGFwtlgfKlBGfgLigm18y5DkRrIVLzJPFkAyhFZ1ce5ZTjmLB8H4igFFvWoQXvGrS3Q0H4K+jpr00BEKLSlP4tOyEkkHm5BvRftdM61R8an79VTkAmURC2zsY4JXOF4VwoE2XxJWmRWAMgZRy4xmElMJnc2W3SIwkkVz4HksRL3dqZHxa7BG0Pfi3ACmHFgcIc0cwvjHnwuzvrHdyze0sw9mZM9mIERdT3oGi+Z2DWEHrfHUaz8p0+WFSQb8l3fCSzQf+i/SNLLxmJzHjK4vVJSfcuoQKafwN01q69kV+sCkMYzBbqUeoRl40sqT4sYhdyZL+31qEpFOZIRPg3GcI9NcQsYIJy+PUtu4s6xRBV22ECbN/iIfMaIau5oLhGGLd96EY80aI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(10067099003)(261021121427099003)(3023799007)(22082099003)(261021123027099003)(11063799006)(5023799004)(56012099006)(261009223027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o/WeWmqNRVR9RwYcC5afKJ+YDLdRsrR10X9tuUnwGApJsxTtchBPXVeqkWkV?=
 =?us-ascii?Q?FQ3REPT2EwbekjSNQuOdPRFOe8YREKCiMlfoZSzhq71H0jRv0GLLrE1FUVcR?=
 =?us-ascii?Q?fk91fWSa+OGmkDm59s+V2/TzaZcyv+BZlqyt07dtVrbk9+KfWqnc5+g7jv+m?=
 =?us-ascii?Q?21GVPNFrgoiGQBnZ06r9NxuGkYu5zhSZFS8YV+bC0Usf2KDm7vwqcQ6SGeZA?=
 =?us-ascii?Q?OeWlndQVYeIDNAamHqlokumQ6nrJgw6qrKiv2TdK+XPL709Iwv8GGMF/coIc?=
 =?us-ascii?Q?2fg5ZlnvJB7MSkNgyvyVa9ReSGHZ+d4rJWMqoSD2j3k+d63dX4S/X7tg+0pB?=
 =?us-ascii?Q?JIEKfqq5zJcSBlVQDjWBw5HtedzS4XusMFTYviW+02CVAVUKdyi62QQxOdlm?=
 =?us-ascii?Q?n42NKlQN/uMMSC2gN+2rOecWKKXkFL7LGQpI8A7JFyBEHBcBaoK7MUKhlcHi?=
 =?us-ascii?Q?4ju13rmS+uZI6/T+X4UQTBsPbDwx/SQ3FHRXboC9dyPlP0VbdDxOtrdqjD+8?=
 =?us-ascii?Q?bMfZerjy6psEhgtCj4zIC5nI3wLN8vFXtUN8gchEIN0OlFNu7hrP8VC6OSTj?=
 =?us-ascii?Q?NODwXnxOzLseZl1bzx8/X5vXlewd90JTKwmAP00MUS66SZq7282zo1I/QUkk?=
 =?us-ascii?Q?pIPHAMl2mkksfgGkTJHHwsh93fqBmEUC9oKKfBjDzueypKRZZVgZIUF7QTX3?=
 =?us-ascii?Q?fjdz2UGpo6o6kkWXdKGjYU2/7M4YgFXFfUshzHyesxHx9BwhIPIn6fmV+fnp?=
 =?us-ascii?Q?xSEPUmyqoMXAHEFiZmfnEhXHH+hmZdMlC1xx6/x3cpHSdO/2opfCXFTSdo0N?=
 =?us-ascii?Q?Omu6EVaUvjb5R3feoxQMe7KdZ/0cAwUCFlKlv2RHjEBX0Dy7yDfbjHc/7Io+?=
 =?us-ascii?Q?uYEReegc/bAUV7sVb2zGEJNoTOOmG0FUT/U/QPdjB68xjhccx01mz8q0aBz6?=
 =?us-ascii?Q?nrj5/S6nK1KQgcZwrH+KCex5vV7pirW6WflZi2dqiUR4i7H7Vu+JeMicCT76?=
 =?us-ascii?Q?Lyomxk4Df/bNniSGX5Iortve/0d2Vi12gLxgQwf5oPKjlVl97eOb6bFj8MlV?=
 =?us-ascii?Q?Ek2UOOoykyD2NFukBvxu/5KrLGU3xzBnH5kKv4tAXJQSLHd+f12fjlJtnFfF?=
 =?us-ascii?Q?Sq2Q9CbkX1eNJvX3njcrdPlzYNs1IqpbyGUxbzdSQj2X1srT3U11oOqIL0NJ?=
 =?us-ascii?Q?gMud7c/5CIA12GDZMWcHOD/y5kv0mEr6rTYp/pMjnadiZrOZSIkGwQ+6zONM?=
 =?us-ascii?Q?dbg+0O/DukKLZ+ytEE0vVGfmlWAsI4qsNzXtsQNxj6HGmCjxmBNPak5stvjg?=
 =?us-ascii?Q?/86+Zgx0jyl+6occfbF9ViFWzNL8W2AdBeCYD4YXo+iLMT6JbgnSnZAYNmWD?=
 =?us-ascii?Q?S9+s6Nwf3mCxe8m8LZRBy8ZppovIuBdhc/VuYXeH49tmrCheW/rN7EvILE0x?=
 =?us-ascii?Q?GEz0hi9VnUh/7sy6TS3scJ6/qGV6XieCHV9lWOIFMV7IeHCfvojpdt0vTDn/?=
 =?us-ascii?Q?zHzoUobHTHw5LeUGQwINWcvaF3/zoj98um1PXH4z/ip74JcTFcsuUKl2CF+L?=
 =?us-ascii?Q?mVcfy7M0ize5+cJ3Q4Rc8c/8/c1zCcIr13ooCkc30sxXM4729FzZzyQN84FW?=
 =?us-ascii?Q?Ss++TD/cuTfUa1lBn+ZgjswuJWKByZ5/WGDSabo0mtaFJHuw/lJ1vfTQZ7SO?=
 =?us-ascii?Q?+88XU7P6mpJzqyySfvTWi1TVMgINf6Rs83NSDLM7bXDCoDoHX4rurcrna120?=
 =?us-ascii?Q?AVke6kGbHw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: o/LOtD/33nfBO0jw3ju2doWGP7DXkBrqpwhi9epqu/gY8tr0G9pJRP8J0pSXqwAHRBqKPh35qUqOD2GwIRD7RWsNjNkQjutg/ZSFWCF7DjJomOCrvTxaq3up2KUdv46dmFOad5LUnDYgptvDuPfygvXoQfZN9uxd7pVYsWPZb4j0zUFvu2/XJcyrj9jus69rHHjR67hnBFhJnQllsXRWI+zzuust6w5+uQSkawC6TC3bzxUFl6jwSIq/T9786kTxfmsu65uYYdToWrqAZPQ+m80/ixTjxx2rAccXRycAkt9+NvD5AT9+ehleA5wG0sm6CPG6BWjRZ5jW9CRidd5ncA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e065c4-a801-47c2-5812-08df301ddc02
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 09:21:31.3138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s4PTql+BF7tnN7MamsllfyL4/JAzMYIL4qwTIEKfBqBA4IZPlLUUGs/pdcbEj5wvjGPnXCzIK1avNWjLn493xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7A0031045
X-OriginatorOrg: intel.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chaitanya,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Chaitanya Kumar Borah
> Sent: Wednesday, October 21, 2026 11:16 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; B, Jeevan
> <jeevan.b@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] lib/igt_eld: Avoid asserting on malformed SAD fiel=
ds
>=20
> eld_get_igt() parses every /proc/asound/card*/eld#* node before filtering=
 by
> monitor name, so a malformed ELD on an unrelated, non-IGT device can
> abort a test that only cares about its own injected "IGT"
> EDID.
>=20
> parse_sad_field() strips the "[0x..]" prefix from sad%d_rates/bits via
> strchr(value, ' ') + 1 and asserts that a space exists before the prefix.

I think here it should be "after the prefix".=20

> But the kernel may not always print one if the ELD of a monitor is malfor=
med,
> which aborts unrelated audio subtests.
>=20
> Skip the malformed SAD entry instead of asserting, propagating the failur=
e up
> through eld_parse_entry() so eld_get_igt()'s existing continue logic move=
s on
> to the next ELD node.
>=20
> While at it, fix a pre-existing fd leak on the ferror(f) path in eld_pars=
e_entry().
>=20
> Cc: Jeevan B <jeevan.b@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  lib/igt_eld.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_eld.c b/lib/igt_eld.c index 896ab0e6b..0de9ba3f8 100=
644
> --- a/lib/igt_eld.c
> +++ b/lib/igt_eld.c
> @@ -103,14 +103,21 @@ static enum cea_sad_pcm_sample_size
> parse_sad_bit(const char *value)
>  	}
>  }
>=20
> -static void parse_sad_field(struct eld_sad *sad, const char *key, char *=
value)
> +static bool parse_sad_field(struct eld_sad *sad, const char *key, char
> +*value)
>  {
>  	char *tok;
>=20
> -	/* Some fields are prefixed with the raw hex value, strip it */
> +	/*
> +	 * Some fields are prefixed with the raw hex value, strip it. The
> +	 * kernel doesn't always emit a space after the bracketed value
> +	 * (e.g. a SAD on a real, unrelated monitor's ELD). Treat that as
> +	 * "nothing to parse" instead of asserting, since we have no
> +	 * control over third-party EDID content.
> +	 */
>  	if (value[0] =3D=3D '[') {
>  		value =3D strchr(value, ' ');
> -		igt_assert(value !=3D NULL);
> +		if (!value)
> +			return false;
>  		value++; /* skip the space */
>  	}
>=20
> @@ -130,6 +137,8 @@ static void parse_sad_field(struct eld_sad *sad, cons=
t
> char *key, char *value)
>=20
>  		tok =3D strtok(NULL, " ");
>  	}
> +
> +	return true;
>  }
>=20
>  /** eld_parse_entry: parse an ELD entry @@ -198,13 +207,20 @@ static
> bool eld_parse_entry(const char *path, struct eld_entry *eld)
>  		else if (sscanf(key, "sad%d_%ms", &sad_index, &sad_key) =3D=3D
> 2) {
>  			igt_assert(sad_index < ELD_SADS_CAP);
>  			igt_assert(sad_index < eld->sads_len);
> -			parse_sad_field(&eld->sads[sad_index], sad_key,
> value);
> +			if (!parse_sad_field(&eld->sads[sad_index], sad_key,
> value)) {
> +				igt_debug("Failed to parse ELD field %s in %s:
> %s\n",
> +					  key, path, value);
> +				free(sad_key);
> +				fclose(f);
> +				return false;
> +			}
>  			free(sad_key);

Nit: free(sad_key) is called in two places. Saving the result first avoids =
that:

ok =3D parse_sad_field(&eld->sads[sad_index], sad_key, value);
free(sad_key);
if (!ok) {
	igt_debug(...);
	fclose(f);
	return false;
}

Regards,
Pranay.

>  		}
>  	}
>=20
>  	if (ferror(f) !=3D 0) {
>  		igt_debug("Failed to read ELD file %s: %d\n", path, ferror(f));
> +		fclose(f);
>  		return false;
>  	}
>=20
> --
> 2.50.1

