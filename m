Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62950C5474A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 05:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0577F10E49C;
	Wed, 28 Aug 2024 05:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZ+GLkX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF37F10E49C
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 05:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724824099; x=1756360099;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wRh9fcNiz/O2LE9YuFLCG3x5SG4Sry4v/kjpVyfK/Ss=;
 b=WZ+GLkX6PIQea9YBiNbM7d8/zAQNiwdaK6S6Cz6+7D1PhzqW/7VG44Kb
 VhZiGcr/Qam9Uz+WKyEQrPM0EGupgYdjLIVO1XYCAP4KWuNOXFZU89BZK
 gnR6W7fod+OqZwzamglWs83VzG8Ec1xuiDopxN5f4fDCMjlBMKYEgKw6d
 hCGD7KMy0ozW/U1VBjYJrjnNFSsZ2zEzeaGwyMvMTpUfcn36pvJ3cmp3R
 HIBJc6q6Y0FhBmX3u84SZ5axrJRCCvydGxHVwNUeE2B6BhYz5yPllyFgk
 ihrw6jzguPYSzAy5FNXZH/edw08HjAjTeQhGNpLP4T3Z/xIR+RUegRsNR Q==;
X-CSE-ConnectionGUID: zN1GqZ5rR9ydamHzz2kaRw==
X-CSE-MsgGUID: 5QWmx1HgRziBpOyyQn8M8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27214360"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="27214360"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 22:48:18 -0700
X-CSE-ConnectionGUID: 3ffrOalJQQ2Eo1ggdvI2BA==
X-CSE-MsgGUID: tXgVUbd4TEq+eEv0yOoHiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67993482"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 22:48:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 22:48:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 22:48:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 22:48:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 22:48:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwzPcLkXOrtPe46Qjq2YdeM8d/Chdz4WJvJUK/Pm5HkZIeyjTIsos0I31gdd4QmHU2RL4LdoSaMgjW0JkblOCdFbf+3Mp73vkVCDjczUvpJAfuNwSWD0m8cQM8anGWjTuGaMZnzjOqtXJaq7NE0wyObMkMlJPNdJSttUUngxfAU0oI/ZfX8GRvmeooaxS6Ho8y0x6Hog9Q9tf89ue36mHHHDxtAC8/oqRZJn/+FOIq8nHDrgsYJfr/kEp+hJV4zobsNRE96bmJ6IftwDunR6uNd0JWbRa2O6yKm1YkDD7d/q4lOY/yJcg6FOmidGhe8eymLpF12ItQVCXdlb849ajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qRSPiFk0OwP5fgdFJQ0BzezuGkOXwI4PpWcB8j5Xv0=;
 b=L9R4mtq+yJsZygEf74jqVR8nh3B1Y6FdT8vfK19EdrbpX99mJi/mCtDbcTaFUCJ5E0i5+iRmUnZD3wYZxlF+Fy/L0fFhOwslFoa7Vp4l3O7+5UljmPHfAdwfFLco9OJW+SBCes7m1K2Ug1RDd5mbHkq50LsA33n2bDCmlO8V4W3xeLJm8urSVbbptBL9HrwxLb2VP0yvn0GHH7zyA0y4sqHwyVvxnSEaFdP1A9YAmHVYY0kPcFeS7w3tB15jSo5Y8pAh04XbLkwD6O+W8LqLNQYraLb42RE8z+vIUeZJJU+6lcJ4pGaS9MtN6N+0p+dBRFsDd4xx3GgUCtFKX6a3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 05:48:15 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 05:48:15 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t v5 0/4] Improvise-the-deep-pkgc
Thread-Topic: [PATCH i-g-t v5 0/4] Improvise-the-deep-pkgc
Thread-Index: AQHa+H5pOb8T9aT6Dk6dD7MZWeKJn7I8KnsA
Date: Wed, 28 Aug 2024 05:48:15 +0000
Message-ID: <SN7PR11MB67503425F71BB85B71A9C562E3952@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CY8PR11MB6962:EE_
x-ms-office365-filtering-correlation-id: 44c75782-4855-4af7-45d0-08dcc72502c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Z3NCztzeuNdtetY0+/7E1rwhDk39omF179tVxgKp5rZtOyKYIrl6IJel9qir?=
 =?us-ascii?Q?TYYIkPmsDp4oovQ1WTCDMSl8ksSLzh2sXhVq8ABLXydpb8JtaZg1QF/rZi4f?=
 =?us-ascii?Q?vXJb01XHvksNiMmEKf19kutIjflkkaRUJXUXfz/JtLeHvqHU/CoUvMsgbxGQ?=
 =?us-ascii?Q?LbCLxAbKE85ojTVvyPqKLqoZRuddtEkFAgvqRN1tZ/72k52rbJluko+csgAw?=
 =?us-ascii?Q?sbuifIe8KcuI8FhloKRz22E1zRbJoKmOUp/RUSoSgSNO9bmkNCYLQygZadFY?=
 =?us-ascii?Q?8U/lM8U3U023m2VB2uBfq9l60Xy3USSBFMU7V/JjHj62ooKGY5S8UNXTcT1U?=
 =?us-ascii?Q?9iR20vFwlxGARACSqvm6d7BTCWjipuEVTiNbBiKycdZhUeVeumT2aF49bJ+m?=
 =?us-ascii?Q?sqkFT9Bk0Uyv8EHKZ87EtGlQuh/HDcZD14Q3u6WHyjonnKCVNM7M5jTicL+a?=
 =?us-ascii?Q?dKOECs/L+eEwYMrDPsGPDZdZwoTbCwKQsPdMeL2G4qhGCKd8ocs60K0FpZTY?=
 =?us-ascii?Q?Nn/RM1mld/4XuRCGnAxucbCtRqAZmA+5IBGfPOBhT0iGZu16mEHXDqVu+Ms5?=
 =?us-ascii?Q?34nuc4pGnD4TK5SrTyKD4J8BpywXjGYD/+qV+MnTwk9S2JPxV387dBVVt2T/?=
 =?us-ascii?Q?28b2QPGZ1mj8XsXBcHAc5iS0y5B6opnO9MPe0WvJiLrV6Jbhu0pYTsRWOAUT?=
 =?us-ascii?Q?dPPshbk9lo8GR2Oh1HXryeiohUEV/POJ5OfAUaTdaqjFlUy48xuqDZU4Dix1?=
 =?us-ascii?Q?v7bH3W33aUImzq72LE0TKxjAy9xLzGVUCehyoqwZp7SIiopTKsmBAgnZ7q19?=
 =?us-ascii?Q?DyW30GW9ISP1uHYrYSX8tyMj+ULQi+/FI3+rUNPQKL9B7tonxuGrDrWRuwXN?=
 =?us-ascii?Q?mO1tU7YU2akf3HdEfkMId0ZvR3ZUTK9Qdx77LqA3a+o9m1R1eLQ3R5NjSLZb?=
 =?us-ascii?Q?nPO+MJ1UGp7N67pMaexBliMGKOuD6pW+m8yFpNHFc4CnoHmyCmxBAPj7rCLn?=
 =?us-ascii?Q?Gq11co9dPbN4sPxV/6BNiE/Scm7PCUsIZEEoU3bfjYJCwGy58pf5oIuNVEzK?=
 =?us-ascii?Q?rW9eWf+dGa7j6ZwkQMpyDaTR+0UeWa2NzJKK2r+TZjLHtGF4M+33smSEs5QK?=
 =?us-ascii?Q?L4JBzH3KInu7TaXvB//jfcjprXyx1/jgLaxwLn8ZiLcqw+ahV219dxHw1Gez?=
 =?us-ascii?Q?IjWOQ3cNZXgjnft1VS34bulw1iwQM/+wXTam2AAUSZKbAKTEKPA82ZG6F995?=
 =?us-ascii?Q?AHgUVITnC6ibPVmfCtJHGUs5VB29GVF8G27kYMxoW/gtxB96WhDS4sMnu1nE?=
 =?us-ascii?Q?tIcRjPKVRb0VO4RKTSa/xR1bkO+kaVqM2BAyU9eypoeZ9YHvKDgKh+w+5N8/?=
 =?us-ascii?Q?ESoUb8DRCFBhcxNlPvV2aLn+kwPXGx9a/e2zgHtY7RQ8At6Hjg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UKqyjpQmGUYJYaXWM0OtmvVZj6hx2uG19ZnZ0SEi8+CQKEPrjg5Gh3YAav+B?=
 =?us-ascii?Q?tII88enKWTPV78mX11iCZNj1QeeBx0YB7bQP50MVSyBXAvy14kJteKOgp2qc?=
 =?us-ascii?Q?aPYYzPByRlanCYM71UPx+WzdGkunU49EdXiiF9kcSugjs+D7mkwpfX4qkCgS?=
 =?us-ascii?Q?FoEZSv7kgJGssSBVIRhRtoZF1lC5a3L5ohRFsJiRAHFOUQAVOdrcgaqg6GWg?=
 =?us-ascii?Q?EOQEUl7nRls6ebU/j2MDOmCPhKFKOoSv+q2D1HFui8E00F/qL24vVwcJpSzU?=
 =?us-ascii?Q?RaFiSr1pS5nmldmnNmlYI8LsJPdN2HwrSjTyeh94f+j3HTjw0qKSJ3kqW+PP?=
 =?us-ascii?Q?C/ntVwTlEUTDdDA0ncCk1UTo6OIUb6ueRsYKrp1plj2wvoOrsRL+HJoikxou?=
 =?us-ascii?Q?SyKmVdB0MwpUpgB2h1719yQNWhB1gnlwT4U0ZMHbZEY4TGQbS6O8VxXCgb3b?=
 =?us-ascii?Q?2HB61jN9G+dWTg0Pdc5EkUj9KBhi8IoVCOR/zlorocaeewpYn291omq10Dhb?=
 =?us-ascii?Q?5Fzxr5F4L6llUyGVsAsy6IRY4TcXaGUPTDPt4isWwlodKloJF/02iyHS9HbB?=
 =?us-ascii?Q?WBQjsdaGrAnoeu/t4spXC5qCBICwKTi9i5WHwA2DmJpYENf5wmmKZGbU3cxh?=
 =?us-ascii?Q?w/Sf7hd8Qhegh2tFX9gO4zXGmE8Nn2L8hHXQ/oJOY34yZ5T/R/LjWKOGNtBP?=
 =?us-ascii?Q?EBDLXjjvjzmXtplfjjl3nOo780k7yo9BE/Tw3AzLgXKLz9Bi+AfdR4Kb3KzD?=
 =?us-ascii?Q?DAYn93Ql3Z1C9lA4SU3RqAKEyeKtrAYV5EsMXtsSlIU7fCybdaviSn2SjRPi?=
 =?us-ascii?Q?rxz/OzVwZ8ir70770cP3i8UPSTVqcQUndjnc9Y2BIj6jDECEcEoFMHX6pUy/?=
 =?us-ascii?Q?v9xt2CVdbrmSowkCL56MiW7UuKuDGGuBPzaW3bER+kcMMO/vJmTYUpcMsuci?=
 =?us-ascii?Q?4vMePm/n1IaovqEmJSsPkwFrv/4KJqrWGR2jHA1DZKHgFpc/GHKNIxi9m7B4?=
 =?us-ascii?Q?xIIcnANxjjqFLpkCumFns8brwkVtSBguo8C13WyelE/pyB8/q94LLbXPxyTp?=
 =?us-ascii?Q?wpSQ8mqoTcohkr9yLRTvc/i/b8ID4Avefgj1HnotaskbJAh2v9cy73xWbes4?=
 =?us-ascii?Q?FEtQNZa6FpJrzicLXhtUdPnkVPmP0Ad8iylopLChXmJGt0u5iJPl74iR7tYo?=
 =?us-ascii?Q?nZtTKlj2YRLz7fdg3H5X4fl6o5k/d4nF600gSlyS95OyMTwMfKw6ZQnGGpsu?=
 =?us-ascii?Q?irkDr2pu1IkbMhso3XsQQpvflni2rLyyuTHoCiBlWYnYo9pxzoy3TYeh7LEP?=
 =?us-ascii?Q?wy/jW3JDOUSAmmdEtwuRbZQPQ/0FeYE989jyDN5sOPvrQdDPAMjsmPA2lXTa?=
 =?us-ascii?Q?IPo21V3gdD/Clr3+rtVkM1hp78xV0XyaqLIwcu+X6lOUwaLRQtOz8dqwELAT?=
 =?us-ascii?Q?aBCAiOnDhfq5p1Y3nD8B0VF/Knup2ZyHQpRL2hs4F+vgLZAaIgdE72/sH6nD?=
 =?us-ascii?Q?DeNTLEee+4T2ag2YIB+LdV3CUzJZ0SzprnomVm+5u9XXYx6sa0y5farVWI7t?=
 =?us-ascii?Q?pqyjmXrk5dca62i2T2uBamLgvt9OEM8ayQ+t7+X0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c75782-4855-4af7-45d0-08dcc72502c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 05:48:15.3704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D9FyiJAJ63ge7ZIv5OQlls0kNjr+3Hc5Rnyk5iLkgCt2euhvRhid+wU/0OYKFwJaHXkPrZ5UjfVz3ZaesPeejg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Tuesday, August 27, 2024 6:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; B, Jeevan
> <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v5 0/4] Improvise-the-deep-pkgc

Should be improve deep pkgc I had already commented on this=20

Regards,
Suraj Kandpal

>=20
> This update improve deep pkgc. Add a check for the eDP connector to ensur=
e
> proper connector handling. Increase the test duration to 4 seconds. Modif=
y
> the loop to use igt_wait for better handling of the package C-state count=
er
> read.
>=20
> Naladala Ramanaidu (4):
>   tests/intel/kms_pm_dc: Add time unit macros and update delay
>     calculation
>   tests/intel/kms_pm_dc: Update VRR handling and eDP output check
>   tests/intel/kms_pm_dc: Update test duration to 4 seconds
>   tests/intel/kms_pm_dc: Add polling for deep-pkgc
>=20
>  tests/intel/kms_pm_dc.c | 51 +++++++++++++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 15 deletions(-)
>=20
> --
> 2.43.0

