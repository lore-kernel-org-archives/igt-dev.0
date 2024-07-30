Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6918BC49EA1
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 19:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2931410E313;
	Tue, 30 Jul 2024 19:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7YIvmL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DFC10E313
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 19:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722369097; x=1753905097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pg3I9thX6jletpV/GQXRudmbCdBoxkJZbAvRlWnAjpc=;
 b=l7YIvmL+A2DTuZICK9vDc27Nsih7eqw6KuM2v5sycY8ep6LZSfjy1AdN
 QwP5OyzOsbnesz1Q6H1ZG9tT2R+ilO+HHaYGogJR2hDA/FHEluQiiWkqe
 oFo+y1yk9LfBW3HNNrN9869rwdp1KjE2vJxBshoMZQQvQl4W565xCkGs5
 Cu4a1qAlaY3XXB2aXCJC/3t/ZMVXztin8ibKKaGJ9cmYMccygExNLZItz
 KzaYEpJmRhQrRQVmINl7iJErhiBlIuZoj0uwBjHwyuSU2IIeonlU+8K31
 EKixo9KMDQDpQ948TNmqPUpiF0xm7LsxhBLgn9Zo1nseVcUqWUZelgOpE A==;
X-CSE-ConnectionGUID: 9wDEgOKwT8WJVfl/iIcvFQ==
X-CSE-MsgGUID: nqKrIzWvSmKpUixibsJ5sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20098153"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20098153"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 12:51:37 -0700
X-CSE-ConnectionGUID: 0YJyr+NkSDq6j59jKwitww==
X-CSE-MsgGUID: o9pFm8M+RNC6kGetXctenA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="85375750"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 12:51:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 12:51:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 12:51:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 12:51:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEKFelIzqYzbVK1Pt3qZ+Zdv/jnl66fWRGGo1q4Zr+f4/4Peugrn8O2IASKdJKA6c7Zi0V9cZSVUOwlLKXDmQpYykcdLOKTEGc6ptEsPEpfodisy0QRp/MwCH0d6xK+kM2A5BulcnP+PvSTWuQVmu7a4BuC5XTjeV7rIGM6Mn42KnTfTtrmw46A3+Woo0CY705mqlSGokZPb3znRSP6+8BhNkSLD8Zpay6MPk2ThNGKeOgrsLxGK1Q78e/cFz7c16Olgipow2lLZw0mYNOXgobSwUCn64NFBGr4i1gYn9WuSoRYDH8c7AoeYGOMIof6vPYyyCkb0JEX+hpxH5LFJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlHzHfZw6DkDzE+ljVWWWN/tHaq5fT9cALMckAOYXzM=;
 b=MnB3aQbHUvhCp63cpGWF1d3a5Z5TRMgPReMU6st4xJb17NE85ZqjqnKlgvI6cG9Rh7N3YCEYU3bvJ9LgOd9TJP2KyRDfDD3J52c0dDOMOq4iCxmWuqjTfNQumQVTVTKikDebz9RWPZmALzGPlXMiEKzY++jRmO/z6/dP0gIIcz8jCwAaPq4ChMKWPnjB7D7Q46hr8q9oPgzZPnNCLSROrlYz/5mWtKY0/YAKj3IeyR7Gu8SkWa6HNRNS79QGM25kz96H8pa/bucXwkvxCzDplsI6jzAXtfFLhRx63MzXcYCRo5Ez2byEHs6MDaDkKHEUhH8ltTAjS7XGvGh7Ixeh4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 19:51:32 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 19:51:32 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
Subject: RE: [PATCH i-g-t 1/3] lib/igt_sysfs: Add xe_sysfs_gt_has_attr to
 check attribute existence
Thread-Topic: [PATCH i-g-t 1/3] lib/igt_sysfs: Add xe_sysfs_gt_has_attr to
 check attribute existence
Thread-Index: AQHa4qCHUx6yIMfyiEqKak7YIxhwSrIPqwqA
Date: Tue, 30 Jul 2024 19:51:31 +0000
Message-ID: <CH0PR11MB5444A1163E292111D55A95ACE5B02@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
 <20240730164232.286232-2-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240730164232.286232-2-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB8254:EE_
x-ms-office365-filtering-correlation-id: eee853f1-c600-46b3-734e-08dcb0d102c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4c+dmMVetsh67uQ2VujGNGam6hfw3SqfeKP5LZkRlpM9hFShHoXaieDmpphu?=
 =?us-ascii?Q?GYmD4Qj2Qz2Wdntj0duu43ESngonkx9B0if3KTAZ6tyx/Nzc35LWawImJmFA?=
 =?us-ascii?Q?mIFokJvpj6Q/ML8eYOrQ71EjyEP3Fr1H0V0k6kVXDD1OaTsABPY0C9f5lE0E?=
 =?us-ascii?Q?CUUJfNlUWq9i9TgOgs7rmJwDjO0E3P3Uex8yiYBi1YHIFO4LjTjVTTjEBeaI?=
 =?us-ascii?Q?Qq7cNC0IxaqyABnLnfzNP+Gffk3sueTc8q7ZFqBQF+yluIZh7F6lHMjkOoln?=
 =?us-ascii?Q?JBz+fAhpHgOBjqe/+wQTPnqTuy7gCHdji+rxKXDxcCo0FpTaMOUWUWFix6H6?=
 =?us-ascii?Q?tbqyN2JKyae2cs5rqZ37UuG2P5+16QLppRt8/y/1uAXKxy/bDXl/nw5lHtyR?=
 =?us-ascii?Q?3Esifs3ZCdubTRP6O820d8pm1GtaOTLrran31SFIS1vreTh0bn2b3bZCoYPS?=
 =?us-ascii?Q?RbAqurNUZ+h/lcWkyPu8f3Rg5JAGWdAfjH28BpOQ3sUcb3ycJqwxWwWjJkLh?=
 =?us-ascii?Q?QlMNn5MUko0sT7reJJ0b01ISRUw/kn4f/nqfOpyqAilZvX6+1WDLGOqANidZ?=
 =?us-ascii?Q?6huSZMEoEw9nPbRS+W8mmjJQmDEG0f/OWknfptEYwkFbPmJklX77PqCjoeET?=
 =?us-ascii?Q?MOioLzi8N+TXkkwEJRvX70RY7729u8C3Zu10dA8bn62vX096OAgnlw1RZouG?=
 =?us-ascii?Q?1APnMOcxMzXwNHMvQ2stXZZMwRk6Z4LJn0V7EM0WvpXIlN5tDeesaH4PxOJm?=
 =?us-ascii?Q?7bQZPwLj8V8ydwznEj8r3XkvWWIgkh3DG4bRj9tdzKVXirC4xDJCK4qLbiFX?=
 =?us-ascii?Q?2ASeMGfAU5E3x7AiXWYkgkD+cAPAJhNGvpZ/rnzU/3QnzQ3F32vdtW0Faz3G?=
 =?us-ascii?Q?EQSVXPV3sa1URIf3AE6GsQaYy51aBzMP7M/dcWbo7t8KgJTfS+ht6rd00nWp?=
 =?us-ascii?Q?QrIoeuP4UngOSsAD0R3QG1aPOYjSk/SAgMkamaBd8ehIZZGNlZ0xx9RDmRqt?=
 =?us-ascii?Q?K1KnvKgqhLbzxnpQYJugW313VezhOuZAOqckixJ7DmkXnaUF3y12YfYW2ZmN?=
 =?us-ascii?Q?PfRoSdzJCJ8fBjzzZbgMAma3TyaDa3jYvZllKoGsSf1YcV0VWsbtPlRzY3Ta?=
 =?us-ascii?Q?RswzRV/uF70dd7xKR51tzkAlvQb2Y/sVsTBvEJt9Fw8Hc1yZWqpXEUzUMtTW?=
 =?us-ascii?Q?LwHGjxVTWtZr44ONE9QNew6pJ+Bx6CFdKmF8253zzCgNU7Fo/Dl9OJFIIvWM?=
 =?us-ascii?Q?b4/n+DPN3gAIg3aQ9pNg9KE3ZVO8lmvvUOVhbkONWIj0wN58dgsUYpQRAMEW?=
 =?us-ascii?Q?G97vpRg9SD9di049r6OlhFiMYJijWEPS1eIqbgy0mtIu82wJLOTQVVmfifVG?=
 =?us-ascii?Q?KuBtXxy7B+C1o4QUYSRpRXwAq07H+AQx6bfhptqvzK8DoPX98w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VRG2DbhcMo4cJNm84KKsrGknvIJPe91JuX2X1Dn7MU5I4dCIX1/ocqaYu7Hj?=
 =?us-ascii?Q?9jOvioK5e0vupon5QtqgFlR2yimTHaAEqXwTwC+4iig7u1gT7vDKtDEPToHQ?=
 =?us-ascii?Q?uh3zXPFTzMj3TtXdoFG64WGfDRyOzjNd3tX0HVI8Dq2/u8TuOokZWQAW9K9T?=
 =?us-ascii?Q?Z1rBDLYOSTOvjPeGKJxkMtMymLyHtvyP9XZLcSy2xfZVP6qMaec2nJYwPWg+?=
 =?us-ascii?Q?t5VWzdarpuUOpfP1WV+dZDv/XhTW9jh9IdzDH6dimg05FZoYncn7wuZVtm9z?=
 =?us-ascii?Q?xiZsjRAlzinYDtFfsK6OaXUifm+5GoxsWidyh2dZubIUhYsZ4OXpGKyOUH+T?=
 =?us-ascii?Q?09qL5KtgwfIh5F1zI4NgW3cXu8FW/U4bR+7ETTrEZEd5zzivJ0Maf2AfXxP9?=
 =?us-ascii?Q?94nYmOMTExJwGBz+ajr9kkRf2AzGdR9xD0ruD0uqITHtdfHFlHsIx1BtMBVN?=
 =?us-ascii?Q?Sen80TSOu6eZ2ocORZUwukXVnY8Bx61SPZ2WKgdvPHMEDq28ewTWhBQ8laS0?=
 =?us-ascii?Q?npopqnDsDuT8cb1zh9m4RVr+j0JHHkUgdQztrC68XfHfYPH8IBc0/JDol0Tq?=
 =?us-ascii?Q?l9MpLdO2kJK81Uoc9sDsEyDeyzXpNyIbIEWxKggj5T9dGe0GHyQK7JGr2gvi?=
 =?us-ascii?Q?Ce6WsVvOKtDwU1S/KS1Yhx2CY9LxG+2pJwEgzQQWV0gyQE/4xH4f6xNsT00D?=
 =?us-ascii?Q?GctV8owry1TYpl10vn0zQRrdnHhhs4NwXn+Do9mQQ2I2gSNpw4OOQWtEeJ1R?=
 =?us-ascii?Q?Rk40e4zm6CIwvg+yOvg1sRnChev96UsheY/sqXEQVagIMWuRn+jByjp6y9gJ?=
 =?us-ascii?Q?uy8jrbJDydS1TMViUTkG4yxtDpPzkybu9AbPFi/kTLgf1Rt4jlgsWXC6k3w4?=
 =?us-ascii?Q?oZV7NBP9lReIpb9BAqmF9/XusR99lvxpUUhpRmLrI9pM4HwK5aZ+8/NG495D?=
 =?us-ascii?Q?oiwlqomZ+eE8loUpzW9Y1D/6xTtV66g0g6xWfZJnFScDHLAvw3MkMxVXaMkP?=
 =?us-ascii?Q?21gfKaL/CkEwH4eDkuoRGZ2kqcT7DhBCanYOS9wIsX/YjRvzAjjnu2P7hinR?=
 =?us-ascii?Q?UEkKK3c9o+U3+jbWa/GNyf3pWhU0/4OhYtEbXl1/eSVKRadlzgpXDYkfN68F?=
 =?us-ascii?Q?o7VrkrgbNBkhuFYVZOssJAd1U0S5DAbQ01VV90L1VIbeCssSAC7LVPpHAN0H?=
 =?us-ascii?Q?afhZYyVXr9gP3LSFwmLn/P6uL6ysNZqE/flio70Uz6Db6RV2Y0audJnX3QO8?=
 =?us-ascii?Q?CZS+cH0JQp2TgrP5cAtLiQ4j66IviDfotrNlkXxLEFQZ0XuBfVn8KS7MgxRh?=
 =?us-ascii?Q?eau+eiR1hPy/9cp34R95dtUpQlyDS3v1Euxfnv1lYYCEFi5xa0t0BLcBWyLb?=
 =?us-ascii?Q?giv/GnQb4IempYxGlG8qXwUNvP4dkrz0QCDNnJfXXGkxePE9FLyWy6Lc+y3v?=
 =?us-ascii?Q?4U14fRjNjMp7L9VsNF/QXVVoN1HlpRl+JiWw4tiWd1hao0t0eN5K7BC9kVbt?=
 =?us-ascii?Q?ih1AlZ2eBpr92WG6eZabe6udKQPFb1oZq6fA/TVW+jl1tts2XuXBUkgP2UFf?=
 =?us-ascii?Q?PrW6sj5FbqsZAeImSHWO20l2HYKPa0jaex+TPYR6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee853f1-c600-46b3-734e-08dcb0d102c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 19:51:32.0182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5y3FJF6f2pSq5q6RQzzDe1QDY74WeB0qTOUIs6IsyYwo+eS+mXqqRebvIGgLWOESXFbK8K5bI+cHfjvQUm7iS9d/aKJSL7cs0eWIOa58qKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Marcin B=
ernatowicz
Sent: Tuesday, July 30, 2024 9:43 AM
To: igt-dev@lists.freedesktop.org
Cc: Tauro, Riana <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel=
.com>; kamil.konieczny@linux.intel.com; Laguna, Lukasz <lukasz.laguna@intel=
.com>; Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_sysfs: Add xe_sysfs_gt_has_attr to check=
 attribute existence
>=20
> Introduce xe_sysfs_gt_has_attr to verify if a specified attribute
> exists within the sysfs gt directory of a device.
>=20
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  lib/igt_sysfs.c | 25 +++++++++++++++++++++++++
>  lib/igt_sysfs.h |  1 +
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 550472d81..bcfd9fad1 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -265,6 +265,31 @@ int xe_sysfs_gt_open(int xe_device, int gt)
>  	return open(path, O_RDONLY);
>  }
> =20
> +/**
> + * xe_sysfs_gt_has_attr:
> + * @xe_device: fd of the device
> + * @gt: gt number
> + * @attr: attr inside sysfs gt dir that needs to be checked for existenc=
e
> + *
> + * This checks if specified attr exists in device sysfs gt directory.
> + *
> + * Returns:
> + * true if attr exists in sysfs, false otherwise.
> + */
> +bool xe_sysfs_gt_has_attr(int xe_device, int gt, const char *attr)
> +{
> +	bool has_attr;
> +	int gt_fd;
> +
> +	gt_fd =3D xe_sysfs_gt_open(xe_device, gt);
> +	if (gt_fd < 0)
> +		return false;
> +
> +	has_attr =3D igt_sysfs_has_attr(gt_fd, attr);
> +	close(gt_fd);
> +	return has_attr;
> +}
> +
>  static const char *xe_engine_class_to_str(__u16 class)
>  {
>  	static const char * const str[] =3D {
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 5d050c786..b0288fe36 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -168,6 +168,7 @@ void igt_sysfs_engines(int xe, int engines, const cha=
r **property,
> =20
>  char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int pathlen);
>  int xe_sysfs_gt_open(int xe_device, int gt);
> +bool xe_sysfs_gt_has_attr(int xe_device, int gt, const char *attr);
>  char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int pathle=
n);
>  int xe_sysfs_tile_open(int xe_device, int tile);
>  int xe_sysfs_get_num_tiles(int xe_device);
> --=20
> 2.31.1
>=20
>=20
