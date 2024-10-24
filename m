Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5229ED0BB5E
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 05:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3AF10E070;
	Thu, 24 Oct 2024 05:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsbsuZQp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8732F10E070
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 05:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729748757; x=1761284757;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=X5i3lmUsyLA6FVAPBsBomxrRu2+0YwWx/BQMnpqSyIA=;
 b=FsbsuZQpw3J923ImntgZK4meNfRRnt3B9Ce9GerfA6h4JvJnINtKIWaR
 TgzEy9JZkyFB457qRf7oaF+h4pw3Chyv7V7lzaw29qKd98ofF1m3sTRPj
 A/HlRYlYnRw9L02oU9yyeqdHdOUI50UNRlrV7YkJW+0DOZqjL/HT65CG8
 jpbaK8bGR8ruOmydHc21ues6er2oQ2tjDWIIoRCijtHAOdKBnXg6PGkw4
 VvcfaP/Al3Gkw6jg6cQDksdqak4bGPnhyS1PYrxlaK3V0ktS9PxXSHaud
 FHXYWwGX6ikqXKSagqp8SP50bXmYyJYzfqnKM7CSNhwukbCkKVdqr/4NC g==;
X-CSE-ConnectionGUID: MF0tp9+TRnewxkLQvrvjFQ==
X-CSE-MsgGUID: TFXPNQ+5SL6G3ofolYmJRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28824339"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="28824339"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 22:45:57 -0700
X-CSE-ConnectionGUID: 7M1I/moJTw+xZfT2vev3nA==
X-CSE-MsgGUID: 6YOZkqIOR1mRUbNh68sglA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="111298362"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 22:45:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 22:45:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 22:45:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 22:45:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKyt5WqXBByl3/hOMvwbb5divbD5DjcbHqGm+kNgOYBr6Y8CWyvBEbsZ6gBYOvBijMEVfmBzKT6vDY3yQZnAEi7iqvQExmFRVQPVrR5PtZ4qJZxqGNyRZjWVSIms8Oe10AHPd64vf66KD0xNfWhkwx+btGQFQqc0QTPrTwYxTwGu5riCNtVTu3U9h7ziOzEiibcTJRuapLM0OmetrFIAfFId12UT3den5uCmk81XLa8n13KZzztwW3dKafXNfDxdJQfeNnfyWGIv9p2LWTpTgRuNPrUUm/dnqNpKmw8dMeD5DKMhCYsfJj6R4mGnHLJaYv/lpYKXBlGbEZmy21rWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkoDtHngd1cYZXyWFS2b6o9yUKEYKH15ciKQsAWlfN8=;
 b=k28ghSbTw2yE9Yz8wXTg5syjvWpwPskRmbXo49cSk3poXaN09+q0UTLpOtWAwPTS8r9keffbf44r3r1cIq3mqkU/ceH59Aa+IFaP2WMVCP26PxXFCofzwDQzTbABCxkVXTso6czrnTgVca8e6DItYD4DZ5jIdjyrx8pcq8qNsw6ClPDMMar5jAJGFU0hjy7V5o9qrzai1UyUoOoVnYsZ3QXUxvXJHmkPfRZ1B6pgGPhIifFq3RhxmdRiK0oIhPNettrC45kyvcsughNezQtcxcNPprZCYMZ3CTU8fj/N5J9KaNnzlKn82F3Q2Xgtdj0+NUKWXaQJWm5vONMI9YIRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5508.namprd11.prod.outlook.com (2603:10b6:610:d7::16)
 by PH8PR11MB8288.namprd11.prod.outlook.com (2603:10b6:510:1c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 05:45:54 +0000
Received: from CH0PR11MB5508.namprd11.prod.outlook.com
 ([fe80::6ecc:ebf2:5d20:80bd]) by CH0PR11MB5508.namprd11.prod.outlook.com
 ([fe80::6ecc:ebf2:5d20:80bd%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 05:45:53 +0000
From: "Srikanth V, NagaVenkata" <nagavenkata.srikanth.v@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/3] lib/igt_kms: Add
 kmstest_wait_for_pageflip_timeout()
Thread-Topic: [PATCH i-g-t 2/3] lib/igt_kms: Add
 kmstest_wait_for_pageflip_timeout()
Thread-Index: AQHbJJp7IkhJVwBDzECU1wtnwbE1sLKVZqXQ
Date: Thu, 24 Oct 2024 05:45:53 +0000
Message-ID: <CH0PR11MB55080151951EF2E65DDB12ACC24E2@CH0PR11MB5508.namprd11.prod.outlook.com>
References: <20241022155311.2797257-1-imre.deak@intel.com>
 <20241022155311.2797257-3-imre.deak@intel.com>
In-Reply-To: <20241022155311.2797257-3-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5508:EE_|PH8PR11MB8288:EE_
x-ms-office365-filtering-correlation-id: c0891300-6efc-4462-4ae9-08dcf3ef1fc0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QmdFVCdQCDhCOOwGefxCetOS6YCPY7l9420tFe4nccM4/U7IZezUwVzWpyRc?=
 =?us-ascii?Q?583zXRODJ5AY+ndWtFMFNPIl9HPEhPXuaFAuN1B14kbq/KktE/LvOK/HM3YM?=
 =?us-ascii?Q?JRBxdw9ByKCYB7oqBb71zDsQPj3hHNRyys4grrAubqi+AzWdWqk5a6rBkCNJ?=
 =?us-ascii?Q?J723kjBXmIIdxOs07EHdFXvHNnQMauQfKldIr1JX9MrpOSjhHLoXOglEPglA?=
 =?us-ascii?Q?DaPxvpJEkxvdYUGE7QGxFI9EZ4TjIoFQWpSajjg2wkjaIQ9vQ4jq45iKFnbK?=
 =?us-ascii?Q?ulnb03zWz5foIKlugJhYQEkPvxgku5mCDUIhTLy76/f13PyvydpJzxEnWT17?=
 =?us-ascii?Q?h5K4lndplDZsezUCXHzNlhTqwYigM/YOkbOgge1K9nlY7h4u/tyKV+7OBbnx?=
 =?us-ascii?Q?CkzfJK3oP2+xgfaTmBq2tU7kU/QTpmOYxokhiQBtlFeI70kr6As+WdHrgczX?=
 =?us-ascii?Q?FDVi/ynH6LRCNnVvxcoagy116UUcpldlGfgACrLepV6xEH/En6hYFN9JAySB?=
 =?us-ascii?Q?9moNG4p7r68ut5kQ2TVUyUo8jDliKp4K35Mm9t0xKbahT8EHh+JlgO4Eh/lZ?=
 =?us-ascii?Q?j6tX18hKlrLnmbl531QlFr/De2szEGbsyEzE0uibDN6AtD6VyrCGnK1fGnTN?=
 =?us-ascii?Q?vsseW9prU7XvmEAVRwTZoGptnZdqrT+Vn8jc56Nn4H3jPsjtos6tT3Ih6Qyi?=
 =?us-ascii?Q?KJNzpnO/GswVyycqheR9mOSSAIHs1J2Op8UY+KSHTVkegneIa2MSIJ0Ie2B+?=
 =?us-ascii?Q?Q5UjFkqvTR9meSLHrOYcI3ubba6Y9ctuSS8IJt8Fb0HkdSP52fnd/lPrTgT3?=
 =?us-ascii?Q?wP7/mah8R//mkc47/Bycnt5bQwmWN+vPql76bFrsmHtInzsiVGXA+v5kzaiV?=
 =?us-ascii?Q?JuwVSlYpQd08XaRf8FX/mDCjbn4ajGWvV+BWKItvzOqsx5gd0ipThQ5Cw6Mr?=
 =?us-ascii?Q?1ltm9OHK7gZAga1gKKX1NkP4+YJXzXa75KDuCGvdQseLRmoZA0WniorBYXB9?=
 =?us-ascii?Q?cLjXctIP2MHtXyKufTjg0RFK/GzqnwbqMUSFweJBv1h54E1LSUrFdKIt1JgY?=
 =?us-ascii?Q?o25j7oFMucgYMcbz7bEp3qIOo6HB90AugGSXe4LaM47pbT6tMiuokZhuw1YC?=
 =?us-ascii?Q?FszBU8W4GB5/Hoei+ZDTPi4BI1h/jeHCGi6P9vaHqQ9mUoSzIzmLZhDHwR9C?=
 =?us-ascii?Q?uzvcQu0PmIbaw4shVjmfc/YT3zHHuLZ0qkuz3SxHgr0SpsGnvvFpIjR4/ucx?=
 =?us-ascii?Q?1u4aUkSxt7gIAkFyWedS/mISX4cQxIB0LMPVqVKKp/wYvmyiH2hDaJKiUbvP?=
 =?us-ascii?Q?AePLvokBy/nkoV/2zvl8NZhTGvg/hCYg2PRZckvHNpfnP81sQWxKMdiStjYh?=
 =?us-ascii?Q?yqMSeI4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zGcF5oXPbdTtveTr924+QnpIcxXBq7Cpyhl9LtBqTENTWTbUevTM5eGxXnu3?=
 =?us-ascii?Q?lJEqvPSo9Nmy/GL9P+wegZ5iPrPTHDn38t7R/uhUW/wR2rjyYK1HHonNvxGx?=
 =?us-ascii?Q?qRQ8ItsigOGndnexZy5b8lE1or2mir3lA5PD5yWqdzJEhAJn4kbLSK5kXqOy?=
 =?us-ascii?Q?C9lN+/GnZg2LgbFxxohfHRUX8u2TKxZg5vYF02JTjLnxFbYXgDKTguGpWjSd?=
 =?us-ascii?Q?+fVTUyKpU4214v/A1qj+75o5dyrT/XWaMofa8NXWdLjbf1ZRCDD4q1arYwdL?=
 =?us-ascii?Q?YCEoU86q1Eovp3zfZLcWbSkmRR2RcnVtYHkKM0MRnAYa+wkvX1OnsTn6+koV?=
 =?us-ascii?Q?JvTGJePNag56eTERos9jB5GTjlsxDAdwKCuTGrFHLXJlEnWFCJ6y/+DuHLKj?=
 =?us-ascii?Q?RnYjJpj822fbF7dqoArtvGKhpILDY4DxXUmuCK7tQbICprD8R6b0WZQjgdXN?=
 =?us-ascii?Q?V4HvINA6UaC7YCmsTUNoTQ8dp/faj0XPfmmWsjl7RQ2nSFyJkLctdgZznAoV?=
 =?us-ascii?Q?BdYqtI3wldcuATEWoUnm9dB8J4tS5s3JxIf80iltv6kcnRu2ISxh4I9WQ1+7?=
 =?us-ascii?Q?NnC3KtXA0omy2VaJwQWHOF6XHGf3GvS7geiJ3SoFHjRRfCglWSzgFFiBK7ug?=
 =?us-ascii?Q?kQ/7H/AI5xdX2WTU2wIbXdOOXepy0JJPY5oXGKv58K8cEKUKZ/w12/fmraG4?=
 =?us-ascii?Q?T4ao9pjgdjKOAGN5PtD4nuc+nwc8ai4pAI9ZAeU0P2u7CJYpm0pka23BffDQ?=
 =?us-ascii?Q?4q9OrU9UYaUfYn1WleUPY0wiN2A8hBLwNIYTGMsE4koeY7cMOexXKM/rwBl4?=
 =?us-ascii?Q?WmffOYrp0jBwK6sCfBYf9BkhmPbuAV69DuCZs/JJQsNY0iaGqIgvr88Q/rct?=
 =?us-ascii?Q?0ty+P7eABaMkjkHA5Mp2ssYl8XKtCY+Ksqru3uJ0P7X1wKhAlKXgd7vogFia?=
 =?us-ascii?Q?Sn6hHdrWGSAYbuW5mjl1uQ5ZIbuodpQg0+TqqDJgTuoHeRruA0behSZVJP1R?=
 =?us-ascii?Q?StVDuYiECiotxAgKyeYRYQ8AI67dOGnRsvVWDx2dErVvi0KGfnB+d4HRuQo7?=
 =?us-ascii?Q?d/y6sh9WAz/PMZfqF+p+3pvNRkphCQv8itqruDTi7TtQ/1UIwE1HK3tW+WSI?=
 =?us-ascii?Q?ZlsnH4a/DY3UzVPeM/FHSCM25qTIUWMkht0BcbqwmFhUyTh7ybmba6FsFnpD?=
 =?us-ascii?Q?r+BUcjPHvZ61IqX/S59DnnBgYO5+kpzUMHzc0DSz8isiKmham5IHXJjcSdKv?=
 =?us-ascii?Q?59J9DVekOEoo6yHnxVzAS5RRjXEiBRdZo/reki49Wkdk36nh2kYFOWr33jZK?=
 =?us-ascii?Q?+rr8CVngTIhRHPQY95QAEOZpbk2zbly1wU+0KowYXU8zAtZyUatcqarH60OI?=
 =?us-ascii?Q?sTzlhMwKpgGaufY0GZ5uLp51mIeg8Hu383ibXzjnRCsA9cfNyyVxpAhyZrVH?=
 =?us-ascii?Q?XtHJvVoNFuqx1WLaaZKVZ5Rv+OQILu+vA3tUtCrz3LiRoMZcE1Dt9oOWKqbQ?=
 =?us-ascii?Q?RdcdIpE+jkfWeD3OBSGHN8neGlIc7jU3SJsizPN3afAq7wJvOVfQV4SskwQ8?=
 =?us-ascii?Q?eC2o8+SS6VeloJjV/O1lio9JVjA8+qgzDzH3inTjfrgj3pLKaal6UtcNNC+g?=
 =?us-ascii?Q?2w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0891300-6efc-4462-4ae9-08dcf3ef1fc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 05:45:53.4973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GWUmLkEGXSk8W6X0YcglvRfTeTHJonSH66ndPhWh2PtparDUbYS7Q2E0mkfj05rbGTjW8iw5XEj4zmQTj7w4f87RmdJajHewRnb8jdypkJwafvhoSOGHc92Qw3xLlvGF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8288
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Imre
> Deak
> Sent: Tuesday, October 22, 2024 9:23 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t 2/3] lib/igt_kms: Add
> kmstest_wait_for_pageflip_timeout()
>=20
> Add a function to wait for a page flip completion providing the timeout
> duration. This is required by the next patch, using an Intel HW specific
> pageflip timeout.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  lib/igt_kms.c | 21 +++++++++++++++++----  lib/igt_kms.h |  1 +
>  2 files changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 99231d6e7..81a9930a2 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2377,15 +2377,16 @@ unsigned int kmstest_get_vblank(int fd, int pipe,
> unsigned int flags)  }
>=20
>  /**
> - * kmstest_wait_for_pageflip:
> + * kmstest_wait_for_pageflip_timeout:
>   * @fd: Opened drm file descriptor
> + * @timeout_us: timeout used for waiting
>   *
>   * Blocks until pageflip is completed
>   */
> -void kmstest_wait_for_pageflip(int fd)
> +void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us)
>  {
>  	drmEventContext evctx =3D { .version =3D 2 };
> -	struct timeval timeout =3D { .tv_sec =3D 0, .tv_usec =3D 50000 };
> +	struct timeval timeout =3D { .tv_sec =3D 0, .tv_usec =3D timeout_us };
>  	fd_set fds;
>  	int ret;
>=20
> @@ -2398,7 +2399,8 @@ void kmstest_wait_for_pageflip(int fd)
>  	} while (ret < 0 && errno =3D=3D EINTR);
>=20
>  	igt_fail_on_f(ret =3D=3D 0,
> -		     "Exceeded timeout (50ms) while waiting for a pageflip\n");
> +		     "Exceeded timeout (%" PRIu64 " us) while waiting for a
> pageflip\n",
> +		     timeout_us);
>=20
>  	igt_assert_f(ret =3D=3D 1,
>  		     "Waiting for pageflip failed with %d from
> select(drmfd)\n", @@ -2407,6 +2409,17 @@ void
> kmstest_wait_for_pageflip(int fd)
>  	igt_assert(drmHandleEvent(fd, &evctx) =3D=3D 0);  }
>=20
> +/**
> + * kmstest_wait_for_pageflip:
> + * @fd: Opened drm file descriptor
> + *
> + * Blocks until pageflip is completed using a 50 ms timeout.
> + */
> +void kmstest_wait_for_pageflip(int fd)
> +{
> +	kmstest_wait_for_pageflip_timeout(fd, 50000); }
> +

Do we still need this definition of this function ?

>  /**
>   * kms_has_vblank:
>   * @fd: DRM fd
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index fc7e4cda1..57e62d86c 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -310,6 +310,7 @@ void *kmstest_dumb_map_buffer(int fd, uint32_t
> handle, uint64_t size,
>  			      unsigned prot);
>  void kmstest_dumb_destroy(int fd, uint32_t handle);  void
> kmstest_wait_for_pageflip(int fd);
> +void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
>  unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
>=20
>  bool kms_has_vblank(int fd);
> --
> 2.44.2

