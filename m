Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40D6CA0EE6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 06:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E91110E103;
	Tue, 19 Aug 2025 06:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APpHLZ5a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E8510E103
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 06:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755583579; x=1787119579;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SCVZ3V1cogyegGW5z5e2Y8ZKjgUEaW6hq+8Ep3oXQig=;
 b=APpHLZ5aiaBdYc0YBLo9Hl6I05AKQw7s79SElAF3dLWHmtOdNXLLNbR7
 rydttrnQ3f7qWkQK83HjMg9eOW5SMgvzmHYZO+QKVhFYMmozRjJs2CEdf
 0H0Y0vyuJy4y/3hMQKYOv7s76+TgCfdY2UTAams5iNx09Pfckm3/4JuKa
 2I5gUJAKQyF1QoQFwt7Cn3DdRA3y+NE9vtjOPRU4FQIrMb+RNgVc1tE0I
 MSEPH96D4FHy9nWI4UefHoOflQ846DWduT/gQb4UsDXE4TtpMivUROa8z
 hY12gls1P3vMwglY3eP7G1tJapDvi2BqTqNmjvagpz0r+FlFj7LaukzY5 Q==;
X-CSE-ConnectionGUID: 0gV6cvmzTAeQWzGjfCwUag==
X-CSE-MsgGUID: 5ri25lL9R3WsMtDT6tVx4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69191874"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="69191874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:06:18 -0700
X-CSE-ConnectionGUID: PbJplew2S3a3XLu+6LuGGA==
X-CSE-MsgGUID: WkmZVySjQ0yIqk1MHmoB2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="171985659"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:06:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 23:06:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 23:06:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.82)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 23:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfkLVchWQc6XpgsOIw7BG/FmAYhgjl/fEErKCr8XN58N4W15ysti5V5BPhAdzmeYm8xN1VF+VnmheKWIu5ziDu3n8fS//iyNr2/bZC5HI11h6Tt60xGlko1fDeaR47HwhTBLZcygVUDBcAADWP21eCe/2UBcptWBJVKMi5u4YW5FVRB56tGjuK8k1pTuJwDF0MONbbQDuiKSNhKA1LCcxXCY6+NJzQ5R0Vi2Nw//vxpQF+hTiMRFDc7OG+ITEWaV/6VuW2w3+6Dz61QIfzS2x5+5nb4xocDzgU3UEwvc5a8fRt3uGvJVldTF1ZZMqReHKw8sRAuM0K4tbTg/+zBRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+A7Av2OKj26cy1Hs03661uf/6NgH05Hmqkpv2Ls0K4M=;
 b=obF4RcIFjLn9c4FcHS4Cciq9LgqFbmF2zjrMZ9K4BKelTA3uGcb2Y+TGxWOrm9TPst8bf73W7lvrQy7xbNiw8W8fW6tnij3gl0IHfUUQp5Xep77oBrjUJ2kAZwdBHnynp63ngvDSWnivCXXpXigRpIaSqsxdYtnxQXoqVov4I/Fjr/Owv1lD8tyadUZdaXLnaeVvLXU7bGaBCnNtbJHFryBXKkYpIkjVM5Uax7gpOBBQBeb3euQbWicM5iATBBiTGnT6CFsun4aqlK46zqMJYvG9s/ugwsGQTvAdJCVgHHdd5mGQnHRkiV7I3DTOtRYZanCsqAKVlqHBcMpt8eLGwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Tue, 19 Aug
 2025 06:06:07 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 06:06:07 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_vm: Unify bind-flag-invalid and
 bind-array-flag-invalid test functions
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_vm: Unify bind-flag-invalid and
 bind-array-flag-invalid test functions
Thread-Index: AQHcC4lYNTD35drNIkKDZgGZNq97krRph3tA
Date: Tue, 19 Aug 2025 06:06:07 +0000
Message-ID: <CH3PR11MB8434A5479CB62F4709B12E4F8D30A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250812130142.37988-1-christoph.manszewski@intel.com>
 <20250812130142.37988-3-christoph.manszewski@intel.com>
In-Reply-To: <20250812130142.37988-3-christoph.manszewski@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CH0PR11MB5281:EE_
x-ms-office365-filtering-correlation-id: cac6f023-9885-43ef-d092-08dddee67cf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zZZEG4NfM/ssg5cUs8sDB8DvL7Gb06kc54eszDUdxJq5a1kGs5SRuStO0sVn?=
 =?us-ascii?Q?S3W3zkz3yxkr8IjGP7ZyS6D6OyAKVm4trWjcm5s9TjxKW2Osg3N/FWspfxr/?=
 =?us-ascii?Q?HxewhjyfwmCDTavc32mXorhoOR/VTcktL6/QLzgfRZ7Dx49FGOlGtI+1Mpiv?=
 =?us-ascii?Q?fMOACHOUezsDn+EtVBle4CBj3Bqfsoa1vwiyzkM2B5OVG6da33BSJeS9Z4Iv?=
 =?us-ascii?Q?3k9460A2c1c65Q1dXg08au315S9FN6jUr/lckFu1vIrnhCwkMiPBfNbihQ+a?=
 =?us-ascii?Q?op0tmTXPxE3UoXQisaD9WOmue0BzTq2RJ19E/PfH1Zu63368ExGCRk4cEGdf?=
 =?us-ascii?Q?pf5eNzy3K+2GOadTTpyn2cJ/LnA+IPziUhPKuJMXiIXAJ93G7lEUK+AkLypt?=
 =?us-ascii?Q?Ucpfuq6GJdX4wj0wi3o/QnsQPan9O5s3vYZbmee/3mOT02eNLMDT5t43XKAi?=
 =?us-ascii?Q?e/Fn4QSjAzx82JHoEy8E1jYikKvTZ9FxQ5Wanb16f7KghwcqolV49MnTJcjw?=
 =?us-ascii?Q?pAWyskBMWRGugXJiCiwuo4cGLwMSGpP8BNGvdy0fQOA9NUFgQXJTk/IqAAsq?=
 =?us-ascii?Q?Dm1k8QLZO2KVkrTelceyAiTJXIaLJs06qeXpXuSDX8hz+yrxTG8XM2hZCXAq?=
 =?us-ascii?Q?XLJjkFmANt9Nz7gmMO5ATJUzN01r9mEIfe/f4wyBXdqL6YMRkSH6BuMDwl9T?=
 =?us-ascii?Q?C58bvu1HvAkcYBxssHRx2M/W7x7LCi24waU+qcUojWqc7KoBlc/265TCZldw?=
 =?us-ascii?Q?eya/D6zw0XxRp2Fyh2Yzplo/mXVHgyARKSBjuVDJdC+JIS5TYJaCbRr3tCHA?=
 =?us-ascii?Q?5OxqHH753wDKYVz7I8fFhRiCTHRTlQZkeLI65ro/g+6JkiLIuE25XuefpK2d?=
 =?us-ascii?Q?AM4q/IWp8OtnQLQYrBL+HlhaJu1Lmtlm9E5QilpQyAve9qBiTYtLH6iZVhy4?=
 =?us-ascii?Q?TDeYdqBYyhKklUBq4/MQ5yHE/sHhQ6Isl8w004F9dYqAWO38PuZStD0VWuPr?=
 =?us-ascii?Q?84DM7qYTI4VCn0PeX4cCkC4rTP/h7jeEJSleEfdePLzyau6cMxwtYAAXKehX?=
 =?us-ascii?Q?dqR6xcf4Jq5y4+VSeas7znoKHkgKNuYeNo/jvTAcz/XVU60+PmSH3ur2Kokm?=
 =?us-ascii?Q?KuI43HTZc+WmJ31xdqhRHK8uVObO/NPYWECm06jGBg3pFk+6mF01kKu/MRyn?=
 =?us-ascii?Q?OuYUNObibEA/PNIuk/yyg8G//FxGDlJfY9BRO2nSQ9cb4HtBh8Q6mEmaU1N/?=
 =?us-ascii?Q?CGB3AV4b556+WWwfEG308JKmZao/mXyDXkWwMva5mBAGzeJfCSysau8PGCDD?=
 =?us-ascii?Q?T9mSVBRSsofm2EMSDhczBRrFpIFbljN9adpJfNSzG6tg8KTa4n6c1rpbHCIT?=
 =?us-ascii?Q?sa4K8FtAIxxBQOlgwR6P+8caRns6i8IifmeGNcC2AWL88MuiOaLTToCoiWkV?=
 =?us-ascii?Q?ceqoL8i9+AImxKAAhUY8FccE/8CKjckf+p8Hv549kCHtXJZiYDBDqg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U8V7tWiUwbvMDgTYXrszJC7C0h9FiVn2aHnLQuxjthltFsKOobsI7p0SpoXG?=
 =?us-ascii?Q?j/Fs6gQeX3g3ZbrmDeGOG2gT+NB3jVvmS/sRxCyvgGa3Bpj8Dxy+dpxcLvQ6?=
 =?us-ascii?Q?Ze5UBesaA1iQkTFTDxLOY17jiETDRkb1i7TXZK/alL1f6dfnv/4h0D4UnOFL?=
 =?us-ascii?Q?2uRUL7t9PZcN87yyJ708hcxWtE68ppeIwl7rX2qpnxhX0CBw0pShRJLIiXzC?=
 =?us-ascii?Q?shWspjT6Mj4jVTW/mUNg1RTxFtfA4CoeRUPktbEWK1I8+FGEY7KyaOx6Oj7I?=
 =?us-ascii?Q?WO0GirIfq7l0yyBNWtDComPnQQFBu+LGI9/fN6ZAQjctxETm3dJs/+eETAXI?=
 =?us-ascii?Q?kQfNhopYsGTQ0QzLBxcRwJ+0ZmBkYoL0To5Y+jW3NJLgU0SVFKIwv6n/VzX2?=
 =?us-ascii?Q?RSILpIq5yx6oUq3F+PteiG8ckEkUMCuFM0uLvH9r7ybgjY5lvXhkNC4P6xz5?=
 =?us-ascii?Q?9bA0luU2MJXrYcQImcfy8FJIDwfsKUYfWtCEa3WR384+xZEckduB7HWMr7GW?=
 =?us-ascii?Q?LNKNZhmeTKH+jVIaVVRQIZMQVjjzVMW5+tNQ8fGtgZvuuxvNoK5+kd4yAFAN?=
 =?us-ascii?Q?xnLoD0luNFLuvnKe6I6KvFD80tGFQ/wScoFzRusHPr+IUqtiEIAb4MKkgPFn?=
 =?us-ascii?Q?M6/EENME+moZVkwCphBIePrHfpGvBTnpOWtwZkfQFE30Z7stpWuIfWT7nbSz?=
 =?us-ascii?Q?TwJVXkPNBiD+hcKfZyYOOA8c0QCOyNCLNoTydcMkUXO7tpjS1IrsYihyEove?=
 =?us-ascii?Q?vs+1C45+isryAfaNb26eITC/ZZtYbNgzwHXpTOAlOpVVJkvrCOa7jwYbCarN?=
 =?us-ascii?Q?vFDKVW+loJAzOZEbxRsvgGmv2pGWLxeQ1P/Z3zmNiuRVQWZZrnVt6rVCkyem?=
 =?us-ascii?Q?xArGq95FK/duC60X+C7tPZxXZvbJMIYtx/4oTpQwWeUyKDvCsbkOQkkUwerd?=
 =?us-ascii?Q?MIvxZGKkScq1Jw90k+fQS/tHNmCwKW8Lx+4FKGYU1i1835zFw522qnYdH+M7?=
 =?us-ascii?Q?UVxChv0GIXhRqHNONORQnTzpnjLmOjbChO/kTA4YukAVvsFN3r9JAWVURP8p?=
 =?us-ascii?Q?MVnrd4rMJU1f+lFDZW4FprNrIYMixnOfWEMk6ueX81y/2dnJHIdtJ61L5p46?=
 =?us-ascii?Q?6vm2+T8XUrEBqMul0JA+KKVIC8la73Bm82bb0chUN+0MO5wRRh++MP9UXEd+?=
 =?us-ascii?Q?jFm96tQdAw+sQAqhFqhDmRXs1Posjp4VH7KvjnSgpQR9nRy0zmp+XLh8Yf6p?=
 =?us-ascii?Q?6WTmUmu721X0SoZBm7YCSJajrHYptPb7neUazySHsPkOMcShb81pZQUAw2T0?=
 =?us-ascii?Q?xyW77DxccMJxpx8OIBfyuboOc6lHtLh+aEoQIBj39zHnd4V66zg4hEriK8A2?=
 =?us-ascii?Q?7w55m01BOjQ3Jkw8V3O8mwAWWmI/gdBwhD5HISvVxPtwFKb95en+QTANGQ2T?=
 =?us-ascii?Q?kKN1P1MFyUAaZsL1XFfAkh92ZDmnaGv2wflMIgC2uZ5562D62G3mTc7uhBae?=
 =?us-ascii?Q?aXen7zbQMzOclkD363HMv+IDuGm8bjFXn5Lj0fJKoIlS128KjZOJ7sEPzB6M?=
 =?us-ascii?Q?Gn9EpQ6PDy/XIhRXrGD4pXvuObsOh9OCFVIBiK9uc8lipMj9yQUeYxV8pbVm?=
 =?us-ascii?Q?qQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac6f023-9885-43ef-d092-08dddee67cf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 06:06:07.6385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lWo0FfebjTnkYFLPuX6/7PP6IUfqRdzkD3bOsYApNp8NX/73esJq8pY3xr9Fsko6GwvPDPWO3Qq4vylhkxmnenLp3ZrEEEYWPV3rWw5Me4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Christoph Manszewski
> Sent: 12 August 2025 06:32 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Dugast, Francois <francois.dugast@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Manszewski, Christoph
> <christoph.manszewski@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/xe_vm: Unify bind-flag-invalid and=
 bind-
> array-flag-invalid test functions
>=20
> Unify the single bind and array bind invalid flag subtests by using a com=
mon
> test function which parametrizes the number of bind operations to perform=
.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_vm.c | 98 +++++++--------------------------------------
>  1 file changed, 15 insertions(+), 83 deletions(-)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c index
> 236494407..7a37bfe05 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2191,86 +2191,6 @@ static bool pxp_interface_supported(int fd)
>  	return ret !=3D -EINVAL;
>  }
>=20
> -/**
> - * SUBTEST: bind-flag-invalid
> - * Functionality: bind
> - * Description: Ensure invalid bind flags are rejected.
> - * Test category: negative test
> - */
> -static void bind_flag_invalid(int fd)
> -{
> -	uint32_t bo, bo_size =3D xe_get_default_alignment(fd);
> -	uint64_t addr =3D 0x1a0000;
> -	uint32_t vm;
> -	struct drm_xe_vm_bind bind;
> -	struct drm_xe_sync sync[1] =3D {
> -		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, },
> -	};
> -
> -	vm =3D xe_vm_create(fd, 0, 0);
> -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
> -	sync[0].handle =3D syncobj_create(fd, 0);
> -
> -	memset(&bind, 0, sizeof(bind));
> -	bind.vm_id =3D vm;
> -	bind.num_binds =3D 1;
> -	bind.bind.obj =3D bo;
> -	bind.bind.range =3D bo_size;
> -	bind.bind.addr =3D addr;
> -	bind.bind.op =3D DRM_XE_VM_BIND_OP_MAP;
> -	bind.bind.pat_index =3D intel_get_pat_idx_wb(fd);
> -	bind.num_syncs =3D 1;
> -	bind.syncs =3D (uintptr_t)sync;
> -
> -	/* Using valid flags should work */
> -	bind.bind.flags =3D 0;
> -	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -	syncobj_reset(fd, &sync[0].handle, 1);
> -
> -	bind.bind.flags =3D DRM_XE_VM_BIND_FLAG_READONLY;
> -	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -	syncobj_reset(fd, &sync[0].handle, 1);
> -
> -	bind.bind.flags =3D DRM_XE_VM_BIND_FLAG_IMMEDIATE;
> -	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -	syncobj_reset(fd, &sync[0].handle, 1);
> -
> -	if (pxp_interface_supported(fd)) {
> -		bind.bind.flags =3D DRM_XE_VM_BIND_FLAG_CHECK_PXP;
> -		igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> -		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
> NULL));
> -		syncobj_reset(fd, &sync[0].handle, 1);
> -	}
> -
> -	bind.bind.flags =3D DRM_XE_VM_BIND_FLAG_NULL;
> -	bind.bind.obj =3D 0;
> -	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -	syncobj_reset(fd, &sync[0].handle, 1);
> -	bind.bind.obj =3D bo;
> -
> -	bind.bind.flags =3D DRM_XE_VM_BIND_FLAG_DUMPABLE;
> -	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -	syncobj_reset(fd, &sync[0].handle, 1);
> -
> -	/* Using invalid flags should not work */
> -	bind.bind.flags =3D 1 << 5;
> -	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> -	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
> -
> -	/* Using valid flags should still work */
> -	bind.bind.flags =3D 0;
> -	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> -
> -	syncobj_destroy(fd, sync[0].handle);
> -	xe_vm_destroy(fd, vm);
> -}
> -
>  static void __bind_flag_valid(int fd, uint32_t bo, struct drm_xe_vm_bind=
 bind,
>  			      struct drm_xe_vm_bind_op *bind_ops, int
> num_binds)  { @@ -2293,6 +2213,9 @@ static void __bind_flag_valid(int fd,
> uint32_t bo, struct drm_xe_vm_bind bind,
>  			bind_ops[j].obj =3D valid_flags[i] =3D=3D
> DRM_XE_VM_BIND_FLAG_NULL ? 0 : bo;
>  		}
>=20
> +		if (num_binds =3D=3D 1)
> +			bind.bind =3D bind_ops[0];
> +
>  		igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
>  		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
> NULL));
>  		syncobj_reset(fd, &sync[0].handle, 1); @@ -2300,6 +2223,11
> @@ static void __bind_flag_valid(int fd, uint32_t bo, struct drm_xe_vm_bi=
nd
> bind,  }
>=20
>  /**
> + * SUBTEST: bind-flag-invalid
> + * Functionality: bind
> + * Description: Ensure invalid bind flags are rejected.
> + * Test category: negative test
> + *
>   * SUBTEST: bind-array-flag-invalid
>   * Functionality: bind
>   * Description: Ensure invalid bind flags are rejected when submitting a=
n
> array of binds.
> @@ -2317,7 +2245,7 @@ static void test_bind_flag_invalid(int fd, int
> num_binds)
>  		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, },
>  	};
>=20
> -	igt_assert(num_binds > 1);
> +	igt_assert(num_binds > 0);
>=20
>  	vm =3D xe_vm_create(fd, 0, 0);
>  	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0); @@ -
> 2333,7 +2261,8 @@ static void test_bind_flag_invalid(int fd, int num_bind=
s)
>  	}
>=20
>  	memset(&bind, 0, sizeof(bind));
> -	bind.vector_of_binds =3D to_user_pointer(bind_ops);
> +	if (num_binds > 1)
> +		bind.vector_of_binds =3D to_user_pointer(bind_ops);
>  	bind.num_binds =3D num_binds;
>  	bind.syncs =3D to_user_pointer(sync);
>  	bind.num_syncs =3D 1;
> @@ -2348,6 +2277,9 @@ static void test_bind_flag_invalid(int fd, int
> num_binds)
>  		bind_ops[i].obj =3D bo;
>  	}
>=20
> +	if (num_binds =3D=3D 1)
> +		bind.bind =3D bind_ops[0];
> +
>  	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
>=20
>  	/* Using valid flags should still work */ @@ -2676,7 +2608,7 @@
> igt_main
>  		userptr_invalid(fd);
>=20
>  	igt_subtest("bind-flag-invalid")
> -		bind_flag_invalid(fd);
> +		test_bind_flag_invalid(fd, 1);
>=20
>  	igt_subtest("compact-64k-pages")
>  		xe_for_each_engine(fd, hwe) {
> --
> 2.47.1
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

