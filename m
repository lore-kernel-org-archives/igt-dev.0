Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4108C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 16:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A8310E74B;
	Wed, 30 Apr 2025 16:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/oykMZS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAD410E74B
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746031693; x=1777567693;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d6T+gjChmuRt7wZLrsGwrwogb7AZb8a7nJ24kPAqxYw=;
 b=f/oykMZSQrHaZ4kydMXVOcObWIeTVZ4FfglevPqBHOyPAnoXcrPNgXVd
 4OPzgCoU6WsWPCWW5Kw+k3jlmvWHb9yxYKivkRKK7JPBdUv8mHLlFGg3p
 xNkvV04Jd347LFAnsE4wB/LajYwIPn79J5JVuCXnqGAGTtl3VTlh9arH3
 0vRaKXJOH0ghWphP7aaQ7BoI2Th1dklCxFjUOzlXtjIAlQ2FOLXwsFgfC
 5Q3BgB3wcZBrIKbs5SlaIT/bsqwwm13KBPPg3eysiYcKsXyKa7R+ZLvXb
 BQFDHBS41ls6VfJG9jh4LaIMaajiLl6z+ogsW2ZACB0R3oOW4GIG8UjaL Q==;
X-CSE-ConnectionGUID: 5jlb/94fQd2v1REageNf7g==
X-CSE-MsgGUID: oKPNHdqYS+G8ydlDLrG/Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47582418"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="47582418"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 09:48:12 -0700
X-CSE-ConnectionGUID: 1B4DwzbKTU2JMUbtfsIM9g==
X-CSE-MsgGUID: U9eHk4jAQWSKL0SoofAEPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="133903305"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 09:48:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 09:48:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 09:48:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 09:48:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OF7a8H/vQCemjxtjkrkdD31ie6iXUylNbGkVA5YgQQ6n4Pj80W5ZwdzIvlcHYmVf0w+qrJwKZuQlKrJgbL1pDiBXJYNQeq20ttFkG9CdptuJ40z+2R1S2ZB49coZv8y62NGr0oJpTIdd/bQKtFO9ABa/++iBMORPfAXqZidYWm820piO2MwpcWtb2GuxyQ2ujaGGUYBKSmTaMVRq5VxlfTwmtYnix0WveyXaeFoLIcuGBAGTJ6nDzjE9ue+sJ7p9YyhMBd7p4dCE0wunclpdr3YHri+P/59Z8JSznXdSZdmUxvUTSSC2aaTxgQWXmNybUkGrfSNGdhlidXuOHDpSRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6T+gjChmuRt7wZLrsGwrwogb7AZb8a7nJ24kPAqxYw=;
 b=ADIS0fCAPdSiqbhzNLILTDUAYGp4Zs1727bdlAtiQvCa/ZGF6F3YSSwKM7MbKAUqKl4xB2A+31ydeO50mxxmwktF/8bHrcuDZo1wlu7sPqzdnQIK2ftPcpIXjmPt5JMbEHxbiKiFDkh245e75eRc3V0KER2afdIC/nocmxEG0qqsIMErWcwJhLWioQBM6Jx76i+71iPzfojoXq02XZI/WNFGAQSEO6xO1LrkO77qA3vq089+mgZAMjRnznJH4+niPBiipTaFWe0Gwo6MHJAf5wmBiVcDbLNq4CBpZ6Y2qGmeC7Boh3Utgke/XWCGxmg5qFyUsgjVHpZJOGEyjMdiOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7338.namprd11.prod.outlook.com (2603:10b6:930:9e::21)
 by CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 16:48:03 +0000
Received: from CY8PR11MB7338.namprd11.prod.outlook.com
 ([fe80::e575:2f4b:61aa:2357]) by CY8PR11MB7338.namprd11.prod.outlook.com
 ([fe80::e575:2f4b:61aa:2357%3]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 16:48:03 +0000
From: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
To: Ryszard Knop <rk@dragonic.eu>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Singh, Sapna1" <sapna1.singh@intel.com>, "markyacoub@google.com"
 <markyacoub@google.com>, "seanpaul@google.com" <seanpaul@google.com>, "Santa, 
 Carlos" <carlos.santa@intel.com>
Subject: Re: [PATCH v2 0/5] Extend IGT to support Android
Thread-Topic: [PATCH v2 0/5] Extend IGT to support Android
Thread-Index: AQHbuUcN4fFDO9Jbp0Gp8yBPjMtIebO8OmoAgAAxkvk=
Date: Wed, 30 Apr 2025 16:48:03 +0000
Message-ID: <CY8PR11MB7338717E09ED4C3179E7986EED832@CY8PR11MB7338.namprd11.prod.outlook.com>
References: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
 <28db0d07c99de4d76d9679084fdfb58060447b56.camel@dragonic.eu>
In-Reply-To: <28db0d07c99de4d76d9679084fdfb58060447b56.camel@dragonic.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7338:EE_|CY8PR11MB7134:EE_
x-ms-office365-filtering-correlation-id: 48f1784d-6f11-44d4-0fd5-08dd8806c676
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?4XSOr/fadUJoauuCSyTDuHag2PcqZ4uEYG/I7YIVd0UVJwC5AJ13A8sVbL?=
 =?iso-8859-1?Q?ibuCGPUkNoeH9KETmtcFJwE2uqwjZZXtMV/6XwUICp455wECcdHVl3Owai?=
 =?iso-8859-1?Q?vJTBq4kw0kWvkWUvnmXS5lZ8NSz+0nTl1p+f6EWTSc7eesZDcRKR21mayt?=
 =?iso-8859-1?Q?d+edzSs8eUPllFBM4c7asUPh508r9bnKUOIQ0LKBL/SgASm30YW5S4qPen?=
 =?iso-8859-1?Q?QvDyRi52SpL/+tY8rEYjW4t5khrYKBeJ+X7vjHUx99Tuh0To6BxImlvxsZ?=
 =?iso-8859-1?Q?jGhI404tJUr8oLfJLk0nz5WE3h1QoKzz2TP4P/MIC9n10wlkGMdepCld+4?=
 =?iso-8859-1?Q?evqybr87NR+9zFyaB4PXjRxN4CyVbHa4DTBNEnwUXWPRxa57Z/iHn0Rlaa?=
 =?iso-8859-1?Q?NmNflAd8kOcopamkKBF1ICwCiOFotEAfdJVhUB0vqftRWOoL/9jRunn2RV?=
 =?iso-8859-1?Q?aPPdaGSyDRrJ5tI42Q5mDLxZhtaCnCCnTsMzGSutV6QLO83xZoEWuHZvFb?=
 =?iso-8859-1?Q?gp1gs5k9b+cbhWf9/rrTOMKGrYHWlkO23go+sHv3kcXJUs0CPxK3lyf5HW?=
 =?iso-8859-1?Q?BnIucS66sZXi4FlADglt18rv6doxC2WVVM7OGAQQ6zIYSp3ORXOInBM23g?=
 =?iso-8859-1?Q?gm8PGsaeu4CQWEGYxpvcUtiOcxxl+Cjn8wNyKZvbA91+jqRK1iLazw4/4+?=
 =?iso-8859-1?Q?uZkAK1mxNlYWiSb3zkgHhaM8AEg4rc43LWc25XiI13cZkvt37XvQlJoQP5?=
 =?iso-8859-1?Q?V5XJfmR67gRp4MTEtd+h27DqAYZn7YhNdXHjzbN6ztgFnHWG6z1LNRfN8X?=
 =?iso-8859-1?Q?YA3acXrQqToOk/gebmAoJaftZwszI6Ij/S0Fc50y64qeRhsQM8tEYD0msl?=
 =?iso-8859-1?Q?AHTY/zujbbVTuvISGABYIu5uEY7DpBZLJOK6CMg2e4tObqasvUyZLuJ5vv?=
 =?iso-8859-1?Q?7J7g8yzPziBL2E/FDYXE2ZVPfbJcLtn8Q7Mynab+v1vwB6f0BxagIi6Owz?=
 =?iso-8859-1?Q?wa2TRSYYi8jvHpXNX0WWQSoxGZjY2gq18ih7v3s3nf9D4MoW4GqsXx8Eww?=
 =?iso-8859-1?Q?q6Z05XVy3tu8WZDD4XsDT7cXhFTp89zjgTIoojbR1HvExrdpEpyA9JThOi?=
 =?iso-8859-1?Q?avRdc3GeHfTPWSj4qtvdRA+Mf1y/KoLmuAKdCM+zGozvo9otuZZjIUDwPx?=
 =?iso-8859-1?Q?2PX4JnMKi8tltSvEDUz9h0/kfvUX04U8z1CjQxY/cuof0qMuvSAmcNBzY/?=
 =?iso-8859-1?Q?2+5dZn2/Riw0NMdbIi7BufsELeKLjvNqvoB7uVX0DyZoU8sVTSrurV9Rpp?=
 =?iso-8859-1?Q?eF1l7WAFbUfT6IfR5W+C0LzazH0QeN2mBekEaq5eUrrFktfwmZXgZ44qBp?=
 =?iso-8859-1?Q?nOKTzVcrKuGDMlqmqr17ghEiGy/JkbW1g5ukAE7HiK0j/QeynLIm6N79fm?=
 =?iso-8859-1?Q?tCwvfpCUjBjBVmjI0VQwJtlRPnzRUAGFMjE/DMKorjTYtFYSkQQ06LgscZ?=
 =?iso-8859-1?Q?+U6HJbMM/u0SmG5NBfb9akmTKqix+xztdjP8pnobqMBQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7338.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GVYIELDoOfGm+99pQNKcsL8DgxhCFmCITl8jT+MOOoxK/i7ICSc1z6a4iX?=
 =?iso-8859-1?Q?ZRcBQymPyC5TrYA0Um61+JaNUUrGFe4ecErj0AtRxleF8GPkaKQ5f4RbGv?=
 =?iso-8859-1?Q?47hB2kuXcw+wo4XI7IaKNVbzrmE0LHpizK9bNRuEaz/LZAgvELKr2ezFKQ?=
 =?iso-8859-1?Q?lML9pbYlNVS+8hAtbwbF4/IUAFCJ9HZqZ1gHoKXoR5A8loQQ1zGYt0dBj1?=
 =?iso-8859-1?Q?rStBmx6k/RH7kp1aykyHyVp4yxveeJCpKSJufYQZzn7l4W2BAhzkqaEiW2?=
 =?iso-8859-1?Q?KDNrESuRYc62DWTcfiKHdS9aCMYQY1xj1rKsiPJlHIREOhVZiAlZLkiOiM?=
 =?iso-8859-1?Q?w09GsD1n5gq2Rdjrb8ZBSW3QKJJh01yJBAMcOWHOGhwZwEVCs3hQ5ftAwD?=
 =?iso-8859-1?Q?e5k5dv/FEElDsJ3onVn2rYu0OD7NE9kWLwBQqqWC+IKWZeDIMuE0c+ZUhH?=
 =?iso-8859-1?Q?G0Syq/iS2sGwxPZ7a4j0tiaszrHbbwXLwfh8p0HO1az8BvvA7EH0AfVMQ4?=
 =?iso-8859-1?Q?TfN1JMVLTb6VNj8ik/Fwe4jr7P05m6ScS7pBiZCGtClMAz+B8s8QId4k+S?=
 =?iso-8859-1?Q?vQlT31AqXQug5318TlczZim2xuARxOGjH406lhkUlHoOLQUr2Gvz53CZfm?=
 =?iso-8859-1?Q?w3FlzFHZVuX7OmwiXpjDxNz5bO8iZuzpt3sQZbVZZ/Qz8+bjumsFiT3whA?=
 =?iso-8859-1?Q?QZ0GffoOU5BiyHCsQRwq85iOK6Fy1zL3hNoIMXmHOZaJqaxStNNB8EO4zT?=
 =?iso-8859-1?Q?9AiBfP5aKqE7hR9XTn6AbRbPOiTDj9ZacQKffESw2Gioy/3kWncrp0Rf8b?=
 =?iso-8859-1?Q?ZDD3H61x+5Crg9CzVGjRBkSt2TikFwV5VrmLGjKttvPzafu6O9A2URZ4zF?=
 =?iso-8859-1?Q?JN7IcNXCPE7Pv9U5lypj4uuHzd1FHojPOkxCSzvRV6Z8T/fbM2YHGU1Bxa?=
 =?iso-8859-1?Q?GRDa8OClHLvdDVtQvGznMO6A8Jr/2qzfJsurBMY5w5bUoIDdloaz463Lmc?=
 =?iso-8859-1?Q?9lT6lpBInrWhxJHWVcojNmj6RKhU253A8Y9XGysOD64KBfWSqvALpuqiWp?=
 =?iso-8859-1?Q?i/0XXq1xWjUhlydXqdNzWhDNiYQeHzfSADKrwvpHhgAa4F2hNyN6UpuPRg?=
 =?iso-8859-1?Q?rp5NMZxw3xIExifqAdNeGstt34I024RpztNN4Yz+6GEM/PeJs8NAWwaPDD?=
 =?iso-8859-1?Q?mO0IRXozsf2f0iEFzJzAhUDAutJDEX/GKIg227wkIrz4dQcjD0mCik6Kcm?=
 =?iso-8859-1?Q?aX8GTo7xBf9kH1uMuuGL038nxNgne5HPZvuUFTJM4BCd6yywTWU/5m0lXI?=
 =?iso-8859-1?Q?gHG1qIGrr37Uq9j+BKy4L4yreyHDiXmnXlJ2KDRkm1hCGSm3itdXFhaMa7?=
 =?iso-8859-1?Q?8OArKHprPMxcreKRbLk7MfQcAWzASf6IumL5+lNQsQ2PsgU3NM+O9ugPej?=
 =?iso-8859-1?Q?R0dFdGcmRbKPyQN3qKw6z5bFaZfVZKbCI/6C0sYLvE+EaPcq5yZ9RVTKvi?=
 =?iso-8859-1?Q?oUl9oaxBOaBx55Q96/9feVDS+jy9/vQnaDP+a3HwaJqanVqa5NhbuZuFTx?=
 =?iso-8859-1?Q?sloYCAQfKC9ZdjAi1f20q51g+06azdGDZ+m8w974qJk/JrcYdWF8jp4AXb?=
 =?iso-8859-1?Q?58q5r69RPtRbXjiUFFHvHeYsM9tAkKaXPG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7338.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f1784d-6f11-44d4-0fd5-08dd8806c676
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 16:48:03.7125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /aIOl6L0FDalaGPzTvob//lgW6JjGA3nTvnIU5hx85qd/Rj6c9no5UwJq0+cLKrsj/PTb5kKUeX6LHFvXBHuBfZDS+SCeXXRWc25lsw2Tmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7134
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

Hi,=0A=
=0A=
> Hey there,=0A=
=0A=
> Are you planning to add Meson changes and docs on how to build this? Whil=
e for Linux itself it's=0A=
> pretty clear if you look at the Dockerfiles/CI, Android probably needs ND=
K installed and some magic=0A=
> in the build system to make it work. You likely have these changes done a=
lready, if you tested this.=0A=
=0A=
IGT will be integrated as part of Android source tree and built using Soong=
 build system. Neither Meson nor NDK will be used to build igt.=0A=
=0A=
Thanks, Jeevaka=0A=
=0A=
On Tue, 2025-04-29 at 20:39 +0000, Jeevaka Prabu Badrappan wrote:=0A=
> The primary objective of this proposal is to extend the functionality of=
=0A=
> IGT to Android environments.=0A=
>=0A=
> Enabling IGT on Android will allow developers to perform comprehensive=0A=
> testing of graphics drivers, ensuring robustness and reliability across=
=0A=
> different platforms.=0A=
>=0A=
> By providing stub implementations for libraries that are not natively=0A=
> supported on Android, we will bridge the gap between Android and Linux=0A=
> environments, promoting code reuse and reducing development time.=0A=
>=0A=
> Changes done:=0A=
> - Create stub implementations of GLib, libunwind, libprocps, and=0A=
> other necessary libraries to satisfy IGT dependencies on Android.=0A=
> - Replace glib hash table with generic hash table implementation=0A=
>=0A=
> Note:=0A=
> - Incase of linux systems, system libraries will be used whereas for=0A=
> Android stubs will be used with reduced test coverage.=0A=
> - Support will be provided to maintain Android support.=0A=
>=0A=
> Jeevaka Prabu Badrappan (4):=0A=
> =A0 Replace program_invocation_short_name with prog_name from command lin=
e=0A=
> =A0 Avoid use of pthread_cancel by introducing an exit flag=0A=
> =A0 Replace glib hash table with c specific implementation=0A=
> =A0 igt-gpu-tools: Changes to compile for Android=0A=
>=0A=
> Sapna (1):=0A=
> =A0 Add stub for libunwind, procps and glib=0A=
>=0A=
> =A0include/stub/glib.h=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 43 +++++++++++++=
=0A=
> =A0include/stub/libproc2/pids.h |=A0 41 ++++++++++++=0A=
> =A0include/stub/libunwind.h=A0=A0=A0=A0 |=A0 20 ++++++=0A=
> =A0lib/igt_core.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 4 ++=
=0A=
> =A0lib/igt_core.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +=
=0A=
> =A0lib/igt_device_scan.c=A0=A0=A0=A0=A0=A0=A0 | 118 +++++++++++++++++++++=
+++++---------=0A=
> =A0lib/igt_dummyload.c=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 6 +-=0A=
> =A0lib/igt_dummyload.h=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 2 +=0A=
> =A0lib/igt_kmod.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 10 +++=
=0A=
> =A0lib/xe/xe_spin.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 2 +-=0A=
> =A0tests/intel/xe_create.c=A0=A0=A0=A0=A0 |=A0=A0 1 +=0A=
> =A0tools/gputop.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 6 +-=
=0A=
> =A0tools/intel_gpu_top.c=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 2 +-=0A=
> =A013 files changed, 220 insertions(+), 36 deletions(-)=0A=
> =A0create mode 100644 include/stub/glib.h=0A=
> =A0create mode 100644 include/stub/libproc2/pids.h=0A=
> =A0create mode 100644 include/stub/libunwind.h=
