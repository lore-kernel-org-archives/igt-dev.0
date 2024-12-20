Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F570E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 10:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37FB10EF52;
	Fri, 20 Dec 2024 10:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeeReHQo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CD310EF52
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 10:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734689201; x=1766225201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=sAyE+yj7gdtTB3hRLPhBisfqhUub46VRicFdBGFr2HI=;
 b=jeeReHQolE1EOXrEUiPed//cjMen8ZX3Fxk3+J7LKulVulFGTjyDZVUH
 eDggvXpd2zS1BBWD68Bplul9SJh96In+q13gvhU+HuwDHLOTnGGJ1d1dz
 aQZ1vw8xVE3+hIPsHTK6DKVGUTGZel2QaiRUMZrJy1LVOD9T6lbUnQg2x
 ikEwMsYdS5mn9TN22zCDynxhGYG4x+iOtjkiYJY29gz2Au0DKw0V08oSk
 WfOLW2WVbib1JJ3Z2PokYlvr8C4/GdJE4Q/0UBpnlJB/j0aoh2Owtz7N5
 eH7u+7VxYCLYj6fpcEOc174xOqOmJicXuhzGU/LWzO9UK/3fbm1oNKrqk w==;
X-CSE-ConnectionGUID: 1DFZs4/nRDqeKfVF+3gbIQ==
X-CSE-MsgGUID: FOEwBZG8Sm6W917q9CuK1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46615590"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208,217";a="46615590"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 02:06:41 -0800
X-CSE-ConnectionGUID: ZTTtAaY9RVyXwCWMn9YdUA==
X-CSE-MsgGUID: zTrxUq4RSzCq8222wq8uMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208,217";a="99294630"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 02:06:40 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 02:06:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 02:06:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 02:06:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfjEhLizYeWadYTTogGelNCisICETU97nQgBqXN3KKaiBUKlSG5eEoE6+uPIl6OpCSiS7yL0eBOBx8mU9B1BlCVclpUzeBkCGYK/vebVj7qp20ftVcIXTQ57apbo5xvd2Ono29PVqKii9d3ztPLXR8Pr3w2TkJ/gosGQmxalHiuan6LslQyQGITaIXaZYC7oMBjs0RAnKlKVf7bxn8NqpRuohijtPwKhAUFUkSg6jNVEyj97cp+PAeGulO7QdEIxxAZ0onYcn7j8uGK88moUSULiJiifzRDUginZR31gC0sF3I5E0r1qc83Zwu8/j+5XM5GCtn83IJWm4Lzt4ghYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzZ56OeWsz/amvlW4CABKacCIuyG8E7NK108WRXAkv4=;
 b=A2d12/qHil4j8FAVVt4VYNuzTZ6acloemeEQKVA1Ma0bly+LRxBq+9pgCe4caCMtNkDkO3cW7tvSa7kpCWdIKywq34tOO7d2OM6oOGIBBKDsDDyU5VGYa35uWy0tG37xn5oMmH6hazT5AxLkUdkmYLM4ouOTjaVkyRlK05TLc4I6RHbO7eKYwS6nYyO4CBwiLJrwHpWms6CoZhxmGLjmzjsUJoH6bqbnz5EMub9f5+QNa1VuQ4exs9NWL6LkFw6QAsMTHeiZE71lwgXlTXCbQ/2el9xyGG4KI6drKF5vi+ntPJMbg8CU10d0DoPkqmO/i8lw1rLA6vLwEcJ9EXRLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 10:06:08 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 10:06:07 +0000
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
To: Luca Coelho <luca@coelho.fi>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: Re: [PATCH i-g-t v1] lib/igt_kms: Backup connector modes before
 sorting
Thread-Topic: [PATCH i-g-t v1] lib/igt_kms: Backup connector modes before
 sorting
Thread-Index: AQHbUi5pR1iUq2M7D0KvyY5ZxSP7wLLu4s4AgAADnLo=
Date: Fri, 20 Dec 2024 10:06:07 +0000
Message-ID: <SN6PR11MB2704BA34578734826B3A656ADB072@SN6PR11MB2704.namprd11.prod.outlook.com>
References: <20241219155453.24946-1-santhosh.reddy.guddati@intel.com>
 <b53da129da1f2eafb7733ac7eb0f22b1246a6178.camel@coelho.fi>
In-Reply-To: <b53da129da1f2eafb7733ac7eb0f22b1246a6178.camel@coelho.fi>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2704:EE_|MN0PR11MB6302:EE_
x-ms-office365-filtering-correlation-id: 7ed2e1e7-31d7-4682-c373-08dd20ddec27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?N+jI/OzXwQt1qRYpZui2ucdAMMx6x7CZvxhgkzXWnW3uOInhmPv/deFivt?=
 =?iso-8859-1?Q?P7933kmlWjFx25p6UXb18EwOPS3Oalg3AbGob2KrS3clThX7+/Q5i/3sP9?=
 =?iso-8859-1?Q?fajtTBcUg5eN20apcUv95tMWO3Rr9WCULxV53MJJN8XAnYgc8AuHl8wJpY?=
 =?iso-8859-1?Q?NegN5UwzSWhiFdtzuh2DK+rIcZbDhaMt8Jkw6GLI7+zBXEXG4Rzfqo0WfW?=
 =?iso-8859-1?Q?rvkjjdxI78Kegr0u7bEHSgb0vY6sYSDIXXFbTutRaYmS11w8WWQ8yjcIxg?=
 =?iso-8859-1?Q?qNHYaN+reIGMnDVHfk9b0CIdn11rh08B76msHJa6FS0iUV/oU11iLw757R?=
 =?iso-8859-1?Q?aJo1ptLZZ2qVthtph4P23qlQNorbW0jWacuzVZ6UgdXv4MylaQT8YCVGmA?=
 =?iso-8859-1?Q?FJkHXf6+LdItGSBFC/h43sGxaYAxKqXBhJm5Sdfy85Upz3W6cl3SbKQggW?=
 =?iso-8859-1?Q?N4W6Kqpl0Eri+FqR+Is3tsSaqbrDgJcSGGNm5mxN2aZhyYkiSKpvNjoppS?=
 =?iso-8859-1?Q?Wbpy59VttBKKWrB8H/KLWUGCitwMF3A96T87oV/Fnl2EdhdAJA9gIQQ4ni?=
 =?iso-8859-1?Q?PgDhbINBvRl20Dq3Y4SvM+ZxLo0u46QX7YCgmQHt0XAS0NUmvAdOatZq8k?=
 =?iso-8859-1?Q?teZapCmN9BOTx5LvN7jUUWRUjTznttSgoLQVKj9xWhdYNgH96951bNPzMm?=
 =?iso-8859-1?Q?+ReFcT95tG9dNBJI+YU32kRCMk+ADeSWDzL0g7dn5QbmK+mugpq6kgYp50?=
 =?iso-8859-1?Q?QhN3xV7ZW3AcngNGWel3dU48eRpucXUynBTMG12EQ+dukZQqaOSo17ec+I?=
 =?iso-8859-1?Q?+UW0ly8gggO+5QwSASYHs47hdR9YVMWMhOYTfiuw/6K3NZlD8Gqj025+HC?=
 =?iso-8859-1?Q?PP/Ku7/qzqlyn5esFTazfuDo1BvkDANuX5FHNQdfrVL0GkMb8oKwByQidn?=
 =?iso-8859-1?Q?yVu7d+Qx9k2Sttdsokp9dCij0WrfIdzOweUKkF4P/N8DkaY9Rci6MRlV3r?=
 =?iso-8859-1?Q?KoYUqgFLaF/CrJJISvM4ZmxYUWlmcSYPkXo9NZEigAxX/Tb3YCc50qgeLJ?=
 =?iso-8859-1?Q?mQJS/Oi+MFMIYMSbR7MUAy5aUWePc4ViIJ9XkTeG8u4SGQLsFj1nXQTTyi?=
 =?iso-8859-1?Q?b+4s7qgpBov0LiQoXr8TsLKANtlWbMgmwD+2amGrgfTC1IjmCloKnDaIcM?=
 =?iso-8859-1?Q?xdb44WcMdSMvhg3d/EJso8LfmZnuevyeLrGQelcm2AslVp8s8G1y8ns6Jv?=
 =?iso-8859-1?Q?tV+w300TxT4GNQO6a7dVFEpRcnLI3Utggl/XXT8Zbwlm1jKAEw1iIpqoUS?=
 =?iso-8859-1?Q?R0S+sEs/veDfMByN2zQSTW2JzQg3SE6JRi8UZ+flnPxqiXlMvht8p9qVwl?=
 =?iso-8859-1?Q?/nVbqDSWrLN2NgD1d1MM/vcRs1WO2LNvDcdP/paT4HULfQZ7lSf+qtZzQy?=
 =?iso-8859-1?Q?51cy3T9KqnQvn2vQZJi3duUxiJIKYL/YSSYy9g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xq5H+ty/42bv4CfnFbgjjAzYMUMLYVz+55XaO9Xxj9hrgOVDdQCIwcH+P0?=
 =?iso-8859-1?Q?tHux+qKv5GaaEamCdvg/RtVP5FfD56hE/0rEBW4chWj8IjiYlwAbK1iJtc?=
 =?iso-8859-1?Q?Ru8mBv5YpUFqgedTSkJxAm0qz4bFjfQiIm9PjWGSffzm7oXhXWfYv2NMxV?=
 =?iso-8859-1?Q?XCqAAr5byqTPaKN8hHqBN/UruJiaFRRFPsOwOCJQCI8QGRQD+s59aapQlt?=
 =?iso-8859-1?Q?i1S5GGXpeMju1/kGfNwb9dAcNl3i6i3YCEuxjhJQTXLhFdXQRtDKOm2e+/?=
 =?iso-8859-1?Q?U3NPnini0zFUUZy722KBgHgh/ZQFm7SDmCAn344ITuKHL/+IBDmsSywpeE?=
 =?iso-8859-1?Q?MF7jbmi+bQROvLYnZQo7LyEmH0dcbZujCdhf+Xr35Ziag+oyhs5loOf0Nl?=
 =?iso-8859-1?Q?sbVH1aEEe069D0/R6sd3Tg+O5A4nHdlWMfAmb9L3Hnz/u40OXststvZOTn?=
 =?iso-8859-1?Q?7+/FqxD0GTxgExJnQSk2yKikt/EqASv8rGg6WC8trCLRP3S1kg9bDVgykp?=
 =?iso-8859-1?Q?3Np7y1CcFFqpGP6IY20N5jFdFXl2Qv5Iv9wh4X+xSqfWhUMnLrVPq77h/U?=
 =?iso-8859-1?Q?K7LzzGPKYYBrC1rj3a1bS+o3sVpU71Fc+se71FDNgf2YPxGv3m1f0iOGMU?=
 =?iso-8859-1?Q?gpM6Wl8dWxarQObuXGpYAMNiOuXQLC9LPaJAyQYU4JSbRH3Zm12IctQ47V?=
 =?iso-8859-1?Q?ADMSZ5eAe6ERAWqI5kcquand4sB+amnWbDeMF7jrpXR3XsMh4x/2o/O7L+?=
 =?iso-8859-1?Q?GPTUlShoXthUGLFZntzlw8gedPoOHWZ9A1DV0P0d0c2M4/VbELb9XT31jk?=
 =?iso-8859-1?Q?Afu4+F5WYOe6Xsry63y5vyrVvfULv0nQbN8LW1bTXe0al9MQQ+B2d0lK8Y?=
 =?iso-8859-1?Q?w43AmTF5Xq11QwNGj+cFgTsiYKRnrq5AtArdpa67Tv6hD4A6wO4dVfDYMq?=
 =?iso-8859-1?Q?7uW1I+GNAEMyGiUxwQAZrhxZoWYtzHUXiQ+3YEcJLNVsNkiFDvksk2KksP?=
 =?iso-8859-1?Q?B6dGPUsoYMuNS8t7cMt8IydHNbS43JNTyLnyNHXplDIE/HcgAYP3MbUdsc?=
 =?iso-8859-1?Q?ImReZG/1BhhRrPhZQMZPs0K8E03wO1rQRH0BvEm9AtYzt1bfY/htOWnZ4O?=
 =?iso-8859-1?Q?3EHN9TpUGNchCYKLxmB9UbRydxNYYIi9+MEOBQQlEV+3pwpvcJIvFRA0xr?=
 =?iso-8859-1?Q?79ICoFGcygwxLNEYhjIRiR2WIJaLsY7Ha3IshffQJZQIiJb+PNX+LeEZYv?=
 =?iso-8859-1?Q?G3qYI65TpXpeiw6UA39XiNHPKuEcP9fm2stPdVfSQemylwis2Y3jLGMCmn?=
 =?iso-8859-1?Q?SbIWNgQ74w/gdE3RIAamx9DjZ+yvn4tYY/N5oyJLuj4Bgmc9x3joKcBmKp?=
 =?iso-8859-1?Q?0U4l0ub5fV4sHKOv5UwjdilOckKzA6Fi0wOfzNtZTAPOTZwr0Cexfe4LqL?=
 =?iso-8859-1?Q?8+HDR+mHUT5PN3Lc+b7PTnlYiDYykaVDdRTeA7m/XNdnPc2ldrPP7DUzsY?=
 =?iso-8859-1?Q?d+2E3/liz3cbvNBU7USFGp96UdtgAfLnRF2GnpTForqbnJ/YXQtqL/fLOp?=
 =?iso-8859-1?Q?CRsFeTGzW++OSDhA5kDq4WVby5U1nIXCnnKmNlh1uL+0mu6Tn+O8pHdCqk?=
 =?iso-8859-1?Q?GFTDUGCMwK6ZXLMt9HC7iPhFXLSK8o/f5Wgn2zbsESoOdeuV9y23+GFQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB2704BA34578734826B3A656ADB072SN6PR11MB2704namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed2e1e7-31d7-4682-c373-08dd20ddec27
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 10:06:07.7841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wRqS/OWOzCJ+K48QTTsm3zVrrTWIQFYLMr9RaRktdXp1FWtJgWsgbSsEgRsiJbY82TXFpMwESEgcz+yQ/vjpPrucOo7x77T1gTHUjvBJauN+cTM9isNu1p0ukZzU2FD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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

--_000_SN6PR11MB2704BA34578734826B3A656ADB072SN6PR11MB2704namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Luca Coelho <luca@coelho.fi>
Sent: Friday, December 20, 2024 3:13 PM
To: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; igt-dev@lis=
ts.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>;=
 Murthy, Arun R <arun.r.murthy@intel.com>
Subject: Re: [PATCH i-g-t v1] lib/igt_kms: Backup connector modes before so=
rting

On Thu, 2024-12-19 at 21:24 +0530, Santhosh Reddy Guddati wrote:
> Backup connector modes before sorting to ensure the original mode
> is not changed if the joiner is not found.This will skip updating
> connector->mode[0] if joiner is not available.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13287
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_kms.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 3d061abc5..21a6a4639 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6394,6 +6394,11 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConne=
ctor *connector,
>                          int max_dotclock, drmModeModeInfo *mode)
>  {
>        bool found =3D false;
> +     drmModeModeInfo *modes_backup;
> +
> +     modes_backup =3D malloc(connector->count_modes * sizeof(drmModeMode=
Info));
> +     igt_assert(modes_backup);
> +     memcpy(modes_backup, connector->modes, connector->count_modes * siz=
eof(drmModeModeInfo));

It's usually considered safer to use the size of the instance and not
of the structure itself (though in practice it doesn't make much
difference): sizeof(*modes_backup).


>        igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
>        found =3D igt_bigjoiner_possible(drm_fd, &connector->modes[0], max=
_dotclock);
> @@ -6401,8 +6406,14 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConne=
ctor *connector,
>                igt_sort_connector_modes(connector, sort_drm_modes_by_clk_=
dsc);
>                found =3D igt_bigjoiner_possible(drm_fd, &connector->modes=
[0], max_dotclock);
>        }
> -     if (found)
> +     if (found) {
>                *mode =3D connector->modes[0];
> +     } else {
> +             memcpy(connector->modes, modes_backup,
> +                    connector->count_modes * sizeof(drmModeModeInfo));
> +     }
> +
> +     free(modes_backup);
>        return found;
>  }
>
> @@ -6438,6 +6449,11 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeCon=
nector *connector,
>                          int max_dotclock, drmModeModeInfo *mode)
>  {
>        bool found =3D false;
> +     drmModeModeInfo *modes_backup;
> +
> +     modes_backup =3D malloc(connector->count_modes * sizeof(drmModeMode=
Info));
> +     igt_assert(modes_backup);
> +     memcpy(modes_backup, connector->modes, connector->count_modes * siz=
eof(drmModeModeInfo));
>
>        igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
>        found =3D igt_ultrajoiner_possible(&connector->modes[0], max_dotcl=
ock);
> @@ -6445,8 +6461,14 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeCon=
nector *connector,
>                igt_sort_connector_modes(connector, sort_drm_modes_by_clk_=
dsc);
>                found =3D igt_ultrajoiner_possible(&connector->modes[0], m=
ax_dotclock);
>        }
> -     if (found)
> +     if (found) {
>                *mode =3D connector->modes[0];
> +     } else {
> +             memcpy(connector->modes, modes_backup,
> +                    connector->count_modes * sizeof(drmModeModeInfo));
> +     }
> +
> +     free(modes_backup);
>        return found;
>  }
>

Generally this looks okay to fix the bug, but IMHO the actual problem
is that we shouldn't really be sorting the modes in order to find them.
Maybe it would be better to use an find_max_res_mode() or something
similar instead of using the sort function to find the mode you want?

The intention of the original change was to identify if the output supports=
 joiner, as part of this we are checking this is_joiner_mode, While doing s=
o identified the problem to be sorting all the modes on the connector insid=
e `ultrajoiner_mode_found`, this change avoids sorting the passed connector=
 modes.

Please let me know your thoughts or questions.

https://patchwork.freedesktop.org/patch/627125/?series=3D141614&rev=3D6

Thanks,
Santhosh

--
Cheers,
Luca.

--_000_SN6PR11MB2704BA34578734826B3A656ADB072SN6PR11MB2704namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Luca C=
oelho &lt;luca@coelho.fi&gt;<br>
<b>Sent:</b>&nbsp;Friday, December 20, 2024 3:13 PM<br>
<b>To:</b>&nbsp;Reddy Guddati, Santhosh &lt;santhosh.reddy.guddati@intel.co=
m&gt;; igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<=
br>
<b>Cc:</b>&nbsp;B, Jeevan &lt;jeevan.b@intel.com&gt;; Joshi, Kunal1 &lt;kun=
al1.joshi@intel.com&gt;; Murthy, Arun R &lt;arun.r.murthy@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v1] lib/igt_kms: Backup connector mod=
es before sorting</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">On Thu, 2024-12-19=
 at 21:24 +0530, Santhosh Reddy Guddati wrote:<br>
&gt; Backup connector modes before sorting to ensure the original mode<br>
&gt; is not changed if the joiner is not found.This will skip updating<br>
&gt; connector-&gt;mode[0] if joiner is not available.<br>
&gt;<br>
&gt; Closes: <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13287" id=3D"OWAb8421631-352b-be0e-a191-416176034536" class=3D"OWAAuto=
Link" data-auth=3D"NotApplicable">
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13287</a><br>
&gt; Signed-off-by: Santhosh Reddy Guddati &lt;santhosh.reddy.guddati@intel=
.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; lib/igt_kms.c | 26 ++++++++++++++++++++++++--<br>
&gt;&nbsp; 1 file changed, 24 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/lib/igt_kms.c b/lib/igt_kms.c<br>
&gt; index 3d061abc5..21a6a4639 100644<br>
&gt; --- a/lib/igt_kms.c<br>
&gt; +++ b/lib/igt_kms.c<br>
&gt; @@ -6394,6 +6394,11 @@ bool bigjoiner_mode_found(int drm_fd, drmModeCo=
nnector *connector,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; int max_dotclock, drmModeModeInfo *mode)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool found =3D false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *modes_backup;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; modes_backup =3D malloc(connector-&gt;count_=
modes * sizeof(drmModeModeInfo));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(modes_backup);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memcpy(modes_backup, connector-&gt;modes, co=
nnector-&gt;count_modes * sizeof(drmModeModeInfo));<br>
<br>
It's usually considered safer to use the size of the instance and not<br>
of the structure itself (though in practice it doesn't make much<br>
difference): sizeof(*modes_backup).<br>
<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_sort_connector_modes(con=
nector, sort_drm_modes_by_res_dsc);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; found =3D igt_bigjoiner_poss=
ible(drm_fd, &amp;connector-&gt;modes[0], max_dotclock);<br>
&gt; @@ -6401,8 +6406,14 @@ bool bigjoiner_mode_found(int drm_fd, drmModeCo=
nnector *connector,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_sort_connector_modes(connector, sort_drm_modes_by_c=
lk_dsc);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; found =3D igt_bigjoiner_possible(drm_fd, &amp;connector=
-&gt;modes[0], max_dotclock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (found)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (found) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; *mode =3D connector-&gt;modes[0];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; memcpy(connector-&gt;modes, modes_backup,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector-&gt;count_modes * s=
izeof(drmModeModeInfo));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; free(modes_backup);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return found;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; @@ -6438,6 +6449,11 @@ bool ultrajoiner_mode_found(int drm_fd, drmMode=
Connector *connector,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; int max_dotclock, drmModeModeInfo *mode)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool found =3D false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *modes_backup;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; modes_backup =3D malloc(connector-&gt;count_=
modes * sizeof(drmModeModeInfo));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(modes_backup);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memcpy(modes_backup, connector-&gt;modes, co=
nnector-&gt;count_modes * sizeof(drmModeModeInfo));<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_sort_connector_modes(con=
nector, sort_drm_modes_by_res_dsc);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; found =3D igt_ultrajoiner_po=
ssible(&amp;connector-&gt;modes[0], max_dotclock);<br>
&gt; @@ -6445,8 +6461,14 @@ bool ultrajoiner_mode_found(int drm_fd, drmMode=
Connector *connector,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_sort_connector_modes(connector, sort_drm_modes_by_c=
lk_dsc);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; found =3D igt_ultrajoiner_possible(&amp;connector-&gt;m=
odes[0], max_dotclock);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (found)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (found) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; *mode =3D connector-&gt;modes[0];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; memcpy(connector-&gt;modes, modes_backup,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; connector-&gt;count_modes * s=
izeof(drmModeModeInfo));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; free(modes_backup);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return found;<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
<br>
Generally this looks okay to fix the bug, but IMHO the actual problem<br>
is that we shouldn't really be sorting the modes in order to find them.<br>
Maybe it would be better to use an find_max_res_mode() or something<br>
similar instead of using the sort function to find the mode you want?</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">The intention of t=
he original change was to identify if the output supports joiner, as part o=
f this we are checking this is_joiner_mode, While doing so identified the p=
roblem to be sorting all the modes on
 the connector inside `<span style=3D"font-family: Aptos, Aptos_EmbeddedFon=
t, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0)=
;">ultrajoiner_mode_found`</span>, this change avoids sorting the passed co=
nnector modes.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
Please let me know your thoughts or questions.<br>
<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><span style=3D"col=
or: rgb(0, 0, 0);"><a href=3D"https://patchwork.freedesktop.org/patch/62712=
5/?series=3D141614&amp;rev=3D6" id=3D"LPlnk822311">https://patchwork.freede=
sktop.org/patch/627125/?series=3D141614&amp;rev=3D6</a><br>
</span><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt; color: rgb(0, 0, 0)=
;">Thanks,<br>
Santhosh</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
--<br>
Cheers,<br>
Luca.</div>
</body>
</html>

--_000_SN6PR11MB2704BA34578734826B3A656ADB072SN6PR11MB2704namp_--
