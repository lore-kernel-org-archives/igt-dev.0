Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB71F44844
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 12:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48AF10E952;
	Fri, 10 Apr 2026 12:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGEUJb6O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E45210E21F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 12:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775822655; x=1807358655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B7ZMeEQQ2nPy5xp2vQv/d0RYqVudS4uvUtGzMkkRB8E=;
 b=VGEUJb6OSx+sfgQDlhqGmZojtdS5UFC+w/xirQWj3a7RNkKxHVWQolQ0
 8ycNXW6BuY01uvCdyntQwCKf791FFCMeh/mlV5zvkMiY3+eSSd5zk7gVu
 Bi3d+0+fKxnh4Egk7DftD3x/hqO+tqDnmQhbyTOxfeKHTw8zZNML1rtAk
 L7MCx2OHitno+WhC+Px9i5u/M4dQjWwTnn7E7YFiaADJb/xoc2uDmyvC3
 9K2fMCbseEwlOZW7huNpeMA2Fa38/GHVch0l2zgkbb4rb8jdlNcMusKhF
 2zSP4VIsgVw1B62Dbv5Kd1cV75Op17ZJk67Jj7BWw0n3lITQTEpDUpm/c Q==;
X-CSE-ConnectionGUID: 8lY2WlMVQpGKYwbyktu2kw==
X-CSE-MsgGUID: cHw9HTVzSxqFEWc3WDK5OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76962042"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76962042"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 05:04:15 -0700
X-CSE-ConnectionGUID: KcQpsaeeRTy3xU/bP01LcQ==
X-CSE-MsgGUID: wxHAHIquSa6tLE7vvlaecQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="259534044"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 05:04:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 05:04:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 05:04:14 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 05:04:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gB5W4hmDKc3i1ycbL+PvjeyQOWx6Xboqaqv8J7mIJsD6ACalvgEO3mn76LB9NStneXxfOPkKb/g+k03h1RpY5oh7QWvJ7uCqy/ng4/6kvXeN5m265XN/VQ76jjwEm5Ku7dcy42kepvowveHIWJ67IrIO4ZXVntxP96GvT2eU6Cozhgx0mkiLnrOUdE2XoYXzJR32/+3SO06nYpdNv6tG3++YYAVTGJW1mzQxkCTxso8/9A3TCjLTWncJ0d4nI0Dq4OYq1F2xMC0LeB3891PfFcaSkVczU41o0EqCzOuJ9wmfwSet4Rwi6OJ0L33m472hKU/Bz0IVHdaXVFwMNmURFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Arai2C3dFtuzmm4V3UhFStgpkdAywqtLtnCif4LFFN4=;
 b=MH+ZtAQF9+G6m/aASugh5UHufuUoLpmSliJPFyJhcwQ++SCYcDzZsIAi0tpCW0d7GPYiQk5hdpTaIhwuPkNz0sOEMKttDZ6WYw3dviYCc72a184/wXUe9XhswOl02+DOcY9j2KhurZO74dC5iVGzx5xBNO6nSdzAD36Kg0+Ai1Jwap9Ty4oD+jDREifFRNq5SFtDnA4I0X9fGLqYCktwah1y22yAPSEgueTD7UPP732Arzlo2eGyIRowJuHJ0bu3AE2dz/h9xvO6HKBjB3Rh6Cw0atpFeX4BpqQlrhoVoz4/JIxoYb/7o87o5JVsuyUDwBFz062/J94VJujaq5Tvjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB7907.namprd11.prod.outlook.com (2603:10b6:8:db::13) by
 CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.35; Fri, 10 Apr 2026 12:04:10 +0000
Received: from DS7PR11MB7907.namprd11.prod.outlook.com
 ([fe80::12f4:5e22:c1b2:3809]) by DS7PR11MB7907.namprd11.prod.outlook.com
 ([fe80::12f4:5e22:c1b2:3809%6]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 12:04:09 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Sokolowski, Jan" <jan.sokolowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>, "Rudnicki,
 Piotr" <piotr.rudnicki@intel.com>, "Kuoppala, Mika"
 <mika.kuoppala@intel.com>, "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t 1/1] lib/xe/xe_eudebug: Remove unnecessary debug
 message
Thread-Topic: [PATCH i-g-t 1/1] lib/xe/xe_eudebug: Remove unnecessary debug
 message
Thread-Index: AQHcyMDXhk692piWm0uFR9pfwhp5LbXYMnmw
Date: Fri, 10 Apr 2026 12:04:09 +0000
Message-ID: <DS7PR11MB79073EC035F5FA6FFF931457D9592@DS7PR11MB7907.namprd11.prod.outlook.com>
References: <20260410081044.783673-1-jan.sokolowski@intel.com>
In-Reply-To: <20260410081044.783673-1-jan.sokolowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB7907:EE_|CH0PR11MB8086:EE_
x-ms-office365-filtering-correlation-id: b10dc3c3-6199-49f6-062c-08de96f945e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 2AK4uv6Tsv49wRjBYqE5VWFji/MkUnE501cHcPp7vVZ+rKha3s1+DvN2fZAO6Lb3iMw9hIx1zdGnce8MiiUsrl9C7bORH0IyL7Irh6TZzOH2MhYHp+Ug3Zv8lFB9BfMYd0dUoXzN3ofDlK1/KD4Mm5vUdAKPA/RsnGEXRUuNXkGM3AvRc+AgTdVv3ZZ0ork43BJjfKkrwAvbXFRN2uaX5fukWBSErsudA0wPtME+zejbCJZFNIOiHua2WqMYXu76wf0gZJsVQE9Gj25tiQqkgAvWULn4OuvytJv45daHKLy96XtJ/ClGXGUHJDwJl3Nc6S0XIs0PoY4sDM0FJykmHjudIpAw8vH1s7eIT9MjQ+CNA/bPMnxT7Pe4L3PmY6GmiHa9C4Sih4B6k7VCrOJTm0fqALoiXaWrLNWFnqSl/wXQdw93VBzajgpC99PHbRVNhv/hoKZrEc/4TvgXmoOIq54Or+diimVkKeu9FQIWTZolIEpz5TeVPzD4IeBXpj//918InOu/ND3bkLdbY5rPgjwr86KVpho3NDdm6DoCHY9kJUOEf2CEQdumJGxw54MHCGX7l3OkWyC0IHPIZSiAOuM/G32lpghusKYLammQaxGlV/JnXyesnCAeSoMGq9qOeq9srXAPpfhHLSCwwwen6e+4vf0YD86JAzf+Jieay3ER9hERz0RxBFMEvHRhTuwlb/nal+Ef6t7YI/zpxXW8pnZu1I25VXW9Bhm7D8WHJsBJnxvoalaeGvRFc6uC2w7VPSzuIB4lsQxPTT+cEFoPL7T/q0igKrR3MlQt06HSUVk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?sNzenkoFmSMiwZQbXb7+T5JckqiWcZU1G+5q+zh35ksysW6vo2c5lKy2fc?=
 =?iso-8859-2?Q?sOYX1Jc31syZFB0d0E6pOJ6U6Vu2Gy7aP29RWz0MAgKCj6CsJIWGCWr4zR?=
 =?iso-8859-2?Q?2ZQYdcivwM7GUlrgLb5OwyRxfl43NAP4iTHlYKSd+mLL1NbEbxhvjPHkm4?=
 =?iso-8859-2?Q?9RTdW3CkuOI2uEl3Amqd+RezD9mDtnUzNeq6YCcSdAOetxkOcZxvcqjALN?=
 =?iso-8859-2?Q?5wuC/jUtHAknCZ+g9r14eUC34PF66sDqJgLDBzBs4nGb2XX9vhQz7Dh8eH?=
 =?iso-8859-2?Q?4+CDnKH4w4J4cjfrxwgH3Zk5YmhYkV21U208FqgaBNEYdhBO46oWTe697Z?=
 =?iso-8859-2?Q?RAr1JuG3lgYg+6+vjzQU+GCpWpn1GZFkh9EDA83qUtf+QOn8stCtIPQI9s?=
 =?iso-8859-2?Q?Y/ekm7SQMcNbnz4buk2HY3dUyMHjk7+1QcAcAdzpoTFmU9cQJefMpnoyhp?=
 =?iso-8859-2?Q?hCeS+h2bE/TEenWO+xFQ+lklE6rXy3khUOMq19hqCzQNhPWy2rIUd3yJLW?=
 =?iso-8859-2?Q?8LAwrTP7tn3CyCBkCBf1UqDT29VGwxrCYWngbfzsn3j2VSu2lACPOO5N2u?=
 =?iso-8859-2?Q?WbskFtVXFgUoTqDIsA0uRmijVSHj0RkTUhLn8bjGb/WSbo1N3cF5ayfezn?=
 =?iso-8859-2?Q?3mxXJDeBnRiOvlYXFqFT6GZ+hrSweFJZn+CmLFxRYWCi1A0dLADuvua3Pn?=
 =?iso-8859-2?Q?gv11hObi6SplSTU0EXdLQupmTtWYWP29HtNSgfxSnB+NAXNnKJEO7PMDRh?=
 =?iso-8859-2?Q?UP0/wsN+axRKAcLKx19hJr6yrV3W3fHeRJ9IrB5st/1/+ZABKL4fWkfEbg?=
 =?iso-8859-2?Q?a5gsymlVctdVjdelBg1wbhiePwFePqb2XjmbJm7/7SY2JJ+cDuCymy/qip?=
 =?iso-8859-2?Q?c/2gXSkFSpfcHQkVv9CNe+FyUx2lfNSLJnVSwJZEq65Qlm7mdTjc06gmXs?=
 =?iso-8859-2?Q?cs+3XHsWw2GNHVtipLi+xfONcfbphna+nlVnO4qABYtymoLobVE/XX7eWU?=
 =?iso-8859-2?Q?eig+k1Gbtla5e2/ZTe+P5PIEG2sjarPXtZNNStyyG7P3xvqCiQ02igxN0Q?=
 =?iso-8859-2?Q?5NvIDjO4qHar0mpSa4EmCEi9ZWkz+t8rgMGLmH1Q8jpkZJjjG9byUeiTO0?=
 =?iso-8859-2?Q?Lzxa9qD2qBAJf2HFPnmgIA3JQaDHExLKrV3kemnRtJwlUI7RXAwWMeh4Df?=
 =?iso-8859-2?Q?8Je/X22/Zq4Wk8Vo7qAMDnw+kPhNn41GcFJNttNWhbTTr1sf8sQZzKNEkv?=
 =?iso-8859-2?Q?p/19DXXMT37KMbNkp9raBpGJRUEcL13tT9uRwk76kaZ9d77Pmh4y531xUd?=
 =?iso-8859-2?Q?KH8QaX1pjoJt/kALJUm1lpAOlHr+KOcqqqkgmIKcXYKKLpvC1Rv/aE/K2t?=
 =?iso-8859-2?Q?6R8wm8LagZkbdVccpAPblUSHrzDY9rSCxrTANBO0k/3n2YZba2T8JzjcLL?=
 =?iso-8859-2?Q?sUEOTALB3gYTrp8UgMykOIPrAR6I3zmHVe2WHWn3OuzmKeIq+PyJR7d6gz?=
 =?iso-8859-2?Q?EpMfM9gt9NofKXjpGwMWhTdK5WSi5vrxLObYn7M6A7wTXqlo9iK9xSLHSK?=
 =?iso-8859-2?Q?Tj1y2tHxRGUXich1nkdnifqATgsgK1MKdMj2dWYZFcNKPa97gK4cBgM9vU?=
 =?iso-8859-2?Q?AiFCmsW8XIdUcIJrZqzWBShu6Pxb+jgf8soKaYZ5SEs+Lek3NVtw1zaiY+?=
 =?iso-8859-2?Q?1A4il1tFNiEe1jedaBsOW28ZlLRH4nX+QnakfnHiGPqxPqjSHSS/p6NUO1?=
 =?iso-8859-2?Q?/d1QbmCzIPZCC1HyPUuemJ24TuVrCbGYp+9gOsz1uNs+YBYrUhRtylpx0m?=
 =?iso-8859-2?Q?OrqG6UaGOIIR9J3270po6/2iUpRY8OI=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZPs8+qyl8vhPNZzEnCkSCIoxACxzkdhjG+9PQIxZonf+o5x3g44zjc0ZHdvkXwvppUB6Qv3wxmwhsw6FFMsfca2U4lMApcHxd036vjNhfZJiffAHkMLgCLqIoEJeujKDghql0ahGXOpm4FGJxVF4FrNbXMKdemhlR68e8g2fpCR2S6N2C4z+wuIa/YrIEd6zglfcPIo+Nh6Qavb4e7Qr/FzND3JC8TPj9lJ0zaXYW6/p52lRQFhWZrC7YAwtVIwrRSv3MSZgcBk/F92cg0OtJMwszHAgJwbTNT5uIk3Fdrh+Db858jQ+cijDaQ+UdJPM9qWRmFYLaZetN5UrvHUDUA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10dc3c3-6199-49f6-062c-08de96f945e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 12:04:09.6520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0HAYn4jWwPUv6HLPhcqJXkADxbYl9feoFQiItX8aiCAFL4ipS4EMnDiVcZw+VbG5NtYuEF2K4E30OXhqgUR1lVKiJloyHLcXGUylzNXsTXrU/iAUH+sUJLCsgtJwNUz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8086
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jan
> Sokolowski
> Sent: Friday, April 10, 2026 10:11 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>;
> peter.senna@linux.intel.com; Rudnicki, Piotr <piotr.rudnicki@intel.com>;
> Kuoppala, Mika <mika.kuoppala@intel.com>; Sokolowski, Jan
> <jan.sokolowski@intel.com>
> Subject: [PATCH i-g-t 1/1] lib/xe/xe_eudebug: Remove unnecessary debug
> message
>=20
> "poll: timeout" message is a leftover development
> artifact that no longer points to any problems
> and makes output less readable.
>=20
> Remove it.
>=20
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 3bffda561..1d9cb8289 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -325,7 +325,6 @@ static int safe_pipe_read(int pipe[2], void *buf, int
> nbytes, int timeout_ms)
>=20
>  		ret =3D poll(&r, 1, interval_ms);
>  		if (!ret) {
> -			igt_debug("poll: timeout\n");
>  			catch_child_failure();
>  			t +=3D interval_ms;
>  		} else if (ret =3D=3D -1) {
> --
> 2.43.0

