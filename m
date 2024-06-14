Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4F2C27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 05:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D3C10E055;
	Fri, 14 Jun 2024 05:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmYHUK0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D6610E055
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 05:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718343940; x=1749879940;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xb4DltRP1v4HtbTMVAQ7YUu5LvdS/vkiZ8kWldNjU+U=;
 b=FmYHUK0AMlrxGi72rgHG9wxGRz8kGfd+3+utKWQOZ1+jz7ZkGJUe8kGh
 r5JkBlBy23/BWSa4EUtlFzZBq+HXTEmulgJ+s0lTkzYS2PG35fuxvnjYb
 tH66tXYc/H2wM5MAREJcJCszq4k8/mGqGRkgV2989iVTDSgu2w+rhBXLr
 LmWjSl3DCjPodHYr9Ogfa2uQq5GX4yL43IR3yqiCuCTmweH01kBQe59ty
 67fmh2GL96WZpG38Gfijsd1/7Fh5mD98eOYHLRE75xXbjdl7hgo1CxYaS
 WLx/MSHnE0TpwcwLI6X0LRpJpxO5yIpwrC3V10W4hx5qzT8+XQw4kDiOv A==;
X-CSE-ConnectionGUID: 1jRVHInKSey/9NHgytJo4Q==
X-CSE-MsgGUID: n6F/p3J/TQ2rPwW21/j49Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18137300"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="18137300"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:45:35 -0700
X-CSE-ConnectionGUID: fIRcVXLnSE+RU0urNcfJ1g==
X-CSE-MsgGUID: H88etcghRYeyZs5lphw6ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="40356980"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 22:45:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 22:45:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 22:45:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 22:45:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 22:45:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIyi6BsPWF+1riZn9ZZCnl1lHI/e3K78XrC1EwEYgJGtNS9XOSBpHDLxwAe/YayHKxPGQcSRWctSVx3Mpul5uCe3yWcv+XkazsJWnkvM+m5Ai5KKSxpA8uokaAOEI/FxHM99I44I7ulbcLMlvDdevdiPKzrhd0DUk/QhsIliveS5UDjQPBA/hRt3Fms3wVMkSjZbuNvqOmNI8ee07Gblx0CmA6/fWFIfKBEpq45cxLg+FiAzxxBI5G29bwo9vZfRt+qNL17CYkpCBo9OuwKe9ZZl5/DfZIr7ic0sQXWZ1/WbUt1gikiggiXqnPxf9QYe4jiSstbyMLRznFblqlFBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0aBnbnW0/R/GULdEwMZ4LICBhAT8Hl5XBFUmcdTKjw=;
 b=KU6yDHi7m/KCW972LShH7Rv26y1HpLq/XnD5OXHp44JE35sMAVEKdzK4iMQfvjp0cWH5BA0uZkjAa/SOZfgRAMDh4pxclr1Y756u13VkcrLXVMXuFpEKXdCynSKzWVCCkaPF6f9exfrmgM7eKiR+z+lh6BV3qRbMSkcOwueLIU9OfL0ymIJuCGW9t/B+sD7leNeJUTnbK/03rCGL3iEp7K6l/sykgzHrYq3dWVOTyqF9yiNPrdUoIhrIz5so0B2Q2RUK9YNBVjP9e9QIo2CMebToyRj/FWPjIyIRJBXGgP4ustxYCdznx9JwqCi0dmCg0aAFfTmF4WRi5LRZNwJ+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Fri, 14 Jun
 2024 05:45:29 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Fri, 14 Jun 2024
 05:45:28 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t 5/5] tests/kms: Use lib helper to check the
 pipe/output combo validity
Thread-Topic: [PATCH i-g-t 5/5] tests/kms: Use lib helper to check the
 pipe/output combo validity
Thread-Index: AQHaiXyf9W4QC48pakG3oWXBGQqwurHHKEFg
Date: Fri, 14 Jun 2024 05:45:28 +0000
Message-ID: <DM4PR11MB631229019FB78CC78B43763F90C22@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
 <20240408061221.291523-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20240408061221.291523-6-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH0PR11MB7422:EE_
x-ms-office365-filtering-correlation-id: bc0125ad-64e0-4ad6-04e7-08dc8c353293
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230035|1800799019|366011|376009|38070700013;
x-microsoft-antispam-message-info: =?us-ascii?Q?uKnv4R+j1NaUb4xrY+Yuxb/6Nb7OXCVXe/Sp8JcOq7S8oKRah+bQvpWCaONI?=
 =?us-ascii?Q?yKUU7OPeGAampdgMeEeNTnq4XuOaZLqqcQElTzZgEuXO6C/qBTF0/4hCA3yC?=
 =?us-ascii?Q?sxX15l6tGVl8vc7Igx3F4iboZP2+h0rc0Ca3gqvBhfv4Wo9Zn7zhZ51fwbsv?=
 =?us-ascii?Q?lKeFcbrjvwCwR371MlR95Q5yib3ojw7ZQi8c415/N3k6OPLvnXuFSfnb4An1?=
 =?us-ascii?Q?LjkxZ49WVO3eUMSKGitcozt7BpCWjeXJsxsVzRx6lkmFwYp2hvRVaKqKS/AI?=
 =?us-ascii?Q?wCEnkHNenV9mF4ddPoMm1RPvUuHeB7sQEgkwVTYKzoYHx2d4pBi2mPurtRto?=
 =?us-ascii?Q?iV3gWZGNtrgr85G2ETnfjCshimGUz6/Evtg1JL84c4pesTC68/FkuCO4EgvW?=
 =?us-ascii?Q?K7mpWSrjBY2N2spFS4w7hnC0QB9Vn5rHuFJD+4g+baUTS1nOnWhZIw4EpFGv?=
 =?us-ascii?Q?6xNgoy9RpXGTiqwTB7Rvgw8jI9+USZY2deLmSzhpr3lR2IFPZPJdTFpUTu9P?=
 =?us-ascii?Q?NLv9wWEMJRJoQ3GrSzRHy4rcQEGCPCi79K0beHZTm6bXZ+5tjBkFcNeOTqrZ?=
 =?us-ascii?Q?oHxl1Fsdca3nSfGBtqu6ocQrYqGHuWi/2+oIZhP9wT4P9ldVKtCvhQ5vRyLk?=
 =?us-ascii?Q?Wh0NzZ+oRVBfVMMsJZ3QpBhmI8BS5rtLXsuAZC6b9I+pFmo/yaKan2O/iprJ?=
 =?us-ascii?Q?B3UrK+moWF6XlnwrzTcaJIzyBG7JuUnBkAK3W6RNB8PQCbbVIag5qoBMshJ4?=
 =?us-ascii?Q?nTmqiT25m55RSZCzRzPwPIdZlJ0xWtURx/yAea7vHAtHWda3D/4be/vA2Vwv?=
 =?us-ascii?Q?n1X8N3fxP6KsI2Jppa3VC+fA7nkVu9XjhmRxBYIf2DD4Cf0ycSwvOA3NucDR?=
 =?us-ascii?Q?Za++ocO9PKUAdIy7CfcLFME8qFtVb60/tzlQp3tDYDuRG0IIc89YIqwb6m8R?=
 =?us-ascii?Q?9MYgU58ezEVvV7xZe+wlXb+NCuWzNA26cMRCsrTexYdNM743AyYUjgltB9Nj?=
 =?us-ascii?Q?JSsZkycFuzXUUuycS0M45b6V7FKDZxKyNYYNEra+VivjhIljhgiTMXYyvuWf?=
 =?us-ascii?Q?yJr+bc8K8829Np/GJu5oSrO8VvoNOIGVoeLerLEOAW4Hgwrtm/wqX/28Ihr4?=
 =?us-ascii?Q?7AHZ+ddxUj9TEFR2GgnsHFik7XYxqovZHzIGtQyhL0fZyWDMrr0W4BnUg+LN?=
 =?us-ascii?Q?KvZ4W4D1U9DI4MUVQPnbdfd4NiXtXWTxB8tPEH/AMxNOt0V6iSmGJEkqiWEf?=
 =?us-ascii?Q?1o6Nl7tGuBBh/khf9jUWwRAQ6RJScsoUmBr4WR2DddFO0s/IJ4IWZdw2NLC+?=
 =?us-ascii?Q?63HoFydoOHW8LCWZ6luMooEbPNIshezSS3EfsB02d46VKVtzzfHM/v5BEC1r?=
 =?us-ascii?Q?fc3UtxM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009)(38070700013); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9Ol1+4+kDqCTpGkgaL368uGwVXvyVyLuGYq1t3oZPOskikxxo+wgR+/zzbZM?=
 =?us-ascii?Q?6QCKhuv4TJKB8hT/eR7mXY2RJ/SsjyDWei0N6tjSYVAzvTiclMGOYumCEtV6?=
 =?us-ascii?Q?vqvGKBd03t7L0YO94GXU/se+3TAcCnCAa2ByjVNZukyAwoLSUcOwxpWLajE+?=
 =?us-ascii?Q?2D+giaUBZXtt2MKO/KB/Eq/6y7QHN9jI4DYybn4cbxsojqOEyuye7Yx4uzQj?=
 =?us-ascii?Q?z+ycGMJOaRTC/s8NIbBdCB5awn84YScESOj78CRf8QH5NLFdWFcSMmHYb20g?=
 =?us-ascii?Q?82TPqQlZGjLbcwQhXM9zL6f6MQEm0g3uCeMnyNhiajhgi5YIy1YCtYF92UK7?=
 =?us-ascii?Q?HR3VryjhTBCrGFrIqaGyrKAP6/3Vk/TIhObgDO3WP5fJywJ3N9WrEFWenCJP?=
 =?us-ascii?Q?zeiFI38EW9ZSWASx3y4GNMl1p7xY+WJpJOcKOxZQa2iHZV5eH0fjNC8Sk6TJ?=
 =?us-ascii?Q?bnXounK7CsmntNgp+AWCqa3SatqLGsjiAgL8fHbd1S87R60TC/tu44ufx3uC?=
 =?us-ascii?Q?H+egBVCyWLeriCDKa8SB2sPVQNN2L6ta6ncD+7WYZ3AUa25pV+dPKjCKsjkQ?=
 =?us-ascii?Q?6BwndLwDUxiH+qjuI/439skBpo7alsgIGwtQjuibKEa9nRvrLIJAkp+XpOrE?=
 =?us-ascii?Q?n3Axnba1wicag0NXqNrgC1tNL2isT+2Us3CV4HFAlL9+ZrM3GTrX47y6LQGT?=
 =?us-ascii?Q?IWVD71W0mCOkBzN0ad++4MMr3ty9ZNWKP0VmH/MOR05OrTgVNK2j28LO8L1t?=
 =?us-ascii?Q?0Fe48h9eKRliB3otpqGuCHN35IxPnFuTgMRkBqDIwHpAy4ZmHT1kl1M0T4CG?=
 =?us-ascii?Q?MpvWR2woor4AoWFGtbpXpGq1EbKxwIZLIkpGg+/3AEZZS+C3xEbxByY39YB/?=
 =?us-ascii?Q?lcQUv4ANbS+wkVcvNSaZ2hK6BqvpE29Xz9OVnF7oGaGNVBa+TQy9uKioahoq?=
 =?us-ascii?Q?CseFJGezw/qVl0OwPkZMlq6dgkHFIeFbc7aTE7mimb4xTOcNCXqdJV68b+Cz?=
 =?us-ascii?Q?SxKa1lBj6H/OFs4Wn6eacbj+nouGFBmQqEnIvi7h+k8kzoZLL2AZw6zUN9oY?=
 =?us-ascii?Q?Hw3C3TKJh6564CRgZvvf/iTlEYD5pahc08SdESBfJmNBxk3kf8/bQjIocRdb?=
 =?us-ascii?Q?hG9nrvDlK3mY7/CgUu3FcsuNaGIT7pDSOr9/kIr2un4nuV3n7FdLjU/xcWmE?=
 =?us-ascii?Q?o9uiUp/nJJTBnjLqov2TQwan8XQpFMIJGnDsHf0SWXcDugxVlkwyJnEygMxR?=
 =?us-ascii?Q?G2SgDzhmE0RlVLmWuchYlL76r/pqBKTIp7R40QhQkU6N/BM7O+VsbG7dzM0m?=
 =?us-ascii?Q?7YXuYShBEVsS7HaZw8rYUqXZCPQBJL1MPGj8rv0DtCfBtqhXgdosiDzh9jSq?=
 =?us-ascii?Q?kq0VQUq/n0zLILcu6wAoNOwsrvGWDDmV43UdVTv1EkFmd0l0W5rwIK4WmI4x?=
 =?us-ascii?Q?VLwUrj4TBP3xPruvX2ZVknveQ53kDDPFm9T/mvFQN1qghQWXEDjVltQ/nIve?=
 =?us-ascii?Q?wjC1DeL/FrymPICFgKVnczjOozOayIlzOJJIAIPjd7XF+s/jxumZ3VXAzNcy?=
 =?us-ascii?Q?kFhTi3b5UVe20FErG+SUPED2nGe74yx+qHCMiFDQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0125ad-64e0-4ad6-04e7-08dc8c353293
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 05:45:28.9197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +cxD1shUqcpQOYBlBfDTibTu6SMHwzFGfkJcgZ0qhi0apDZ5H7Mw5P1bp/IUkM16uoMHnylpb7V9FoL287siFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
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
> Bhanuprakash Modem
> Sent: Monday, April 8, 2024 11:42 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 5/5] tests/kms: Use lib helper to check the pipe/ou=
tput
> combo validity
>=20
> Use IGT lib helper intel_pipe_output_combo_valid() to make sure the selec=
ted
> pipe/output/mode combo is valid.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_dither.c | 24 +++++++------
>  tests/kms_hdr.c    | 90 ++++++++++++++++++++++++++--------------------
>  2 files changed, 65 insertions(+), 49 deletions(-)
>=20
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c index af7b7f05c..21b=
1210b4
> 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -76,13 +76,10 @@ typedef struct {
>  /* Prepare test data. */
>  static void prepare_test(data_t *data, igt_output_t *output, enum pipe p=
)  {
> -	igt_display_t *display =3D &data->display;
>  	igt_pipe_t *pipe =3D &data->display.pipes[p];
>=20
>  	igt_assert(pipe);
>=20
> -	igt_display_reset(display);
> -
>  	data->primary =3D
>  		igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>=20
> @@ -205,6 +202,8 @@ run_dither_test(data_t *data, int fb_bpc, int fb_form=
at,
> int output_bpc)
>  	igt_output_t *output;
>  	igt_display_t *display =3D &data->display;
>=20
> +	igt_display_reset(display);
> +
>  	for_each_connected_output(display, output) {
>  		enum pipe pipe;
>=20
> @@ -215,15 +214,20 @@ run_dither_test(data_t *data, int fb_bpc, int
> fb_format, int output_bpc)
>  			continue;
>=20
>  		for_each_pipe(display, pipe) {
> -			if (igt_pipe_connector_valid(pipe, output)) {
> -				igt_dynamic_f("pipe-%s-%s",
> -					      kmstest_pipe_name(pipe), output-
> >name)
> -					test_dithering(data, pipe, output,
> fb_bpc,
> -							fb_format,
> output_bpc);
> +			igt_output_set_pipe(output, pipe);
>=20
> -				/* One pipe is enough */
> -				break;
> +			if (!intel_pipe_output_combo_valid(display)) {
> +				igt_output_set_pipe(output, PIPE_NONE);
> +				continue;
>  			}
> +
> +			igt_dynamic_f("pipe-%s-%s",
> +					      kmstest_pipe_name(pipe), output-
> >name)
> +				test_dithering(data, pipe, output, fb_bpc,
> +							   fb_format,
> output_bpc);
> +
> +			/* One pipe is enough */
> +			break;
>  		}
>  	}
>  }

Overall patch looks fine, can we split these to 2 patches to simplify.=20

> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index 99b78f7ef..475463c21
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -261,6 +261,8 @@ static void test_bpc_switch(data_t *data, uint32_t fl=
ags)
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
>=20
> +	igt_display_reset(display);
> +
>  	for_each_connected_output(display, output) {
>  		enum pipe pipe;
>=20
> @@ -271,26 +273,30 @@ static void test_bpc_switch(data_t *data, uint32_t
> flags)
>  			continue;
>=20
>  		for_each_pipe(display, pipe) {
> -			if (igt_pipe_connector_valid(pipe, output)) {
> -				prepare_test(data, output, pipe);
> -
> -				if (is_intel_device(data->fd) &&
> -				    !igt_max_bpc_constraint(display, pipe, output,
> 10)) {
> -					test_fini(data);
> -					break;
> -				}
> -
> -				data->mode =3D igt_output_get_mode(output);
> -				data->w =3D data->mode->hdisplay;
> -				data->h =3D data->mode->vdisplay;
> +			igt_output_set_pipe(output, pipe);
> +			if (intel_pipe_output_combo_valid(display)) {
> +				igt_output_set_pipe(output, PIPE_NONE);
> +				continue;
> +			}
>=20
> -				igt_dynamic_f("pipe-%s-%s",
> -					      kmstest_pipe_name(pipe), output-
> >name)
> -					test_bpc_switch_on_output(data, pipe,
> output, flags);
> +			prepare_test(data, output, pipe);
>=20
> -				/* One pipe is enough */
> +			if (is_intel_device(data->fd) &&
> +			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
> +				test_fini(data);
>  				break;
>  			}
> +
> +			data->mode =3D igt_output_get_mode(output);
> +			data->w =3D data->mode->hdisplay;
> +			data->h =3D data->mode->vdisplay;
> +
> +			igt_dynamic_f("pipe-%s-%s",
> +				      kmstest_pipe_name(pipe), output->name)
> +				test_bpc_switch_on_output(data, pipe, output,
> flags);
> +
> +			/* One pipe is enough */
> +			break;
>  		}
>  	}
>  }
> @@ -614,6 +620,8 @@ static void test_hdr(data_t *data, uint32_t flags)
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
>=20
> +	igt_display_reset(display);
> +
>  	for_each_connected_output(display, output) {
>  		enum pipe pipe;
>=20
> @@ -635,32 +643,36 @@ static void test_hdr(data_t *data, uint32_t flags)
>  			continue;
>=20
>  		for_each_pipe(display, pipe) {
> -			if (igt_pipe_connector_valid(pipe, output)) {
> -				prepare_test(data, output, pipe);
> +			igt_output_set_pipe(output, pipe);
> +			if (!intel_pipe_output_combo_valid(display)) {
> +				igt_output_set_pipe(output, PIPE_NONE);
> +				continue;
> +			}
>=20
> -				if (is_intel_device(data->fd) &&
> -				    !igt_max_bpc_constraint(display, pipe, output,
> 10)) {
> -					test_fini(data);
> -					break;
> -				}
> -
> -				data->mode =3D igt_output_get_mode(output);
> -				data->w =3D data->mode->hdisplay;
> -				data->h =3D data->mode->vdisplay;
> -
> -				igt_dynamic_f("pipe-%s-%s",
> -					      kmstest_pipe_name(pipe), output-
> >name) {
> -					if (flags & (TEST_NONE | TEST_DPMS |
> TEST_SUSPEND | TEST_INVALID_HDR))
> -						test_static_toggle(data, pipe,
> output, flags);
> -					if (flags & TEST_SWAP)
> -						test_static_swap(data, pipe,
> output);
> -					if (flags &
> TEST_INVALID_METADATA_SIZES)
> -
> 	test_invalid_metadata_sizes(data, output);
> -				}
> -
> -				/* One pipe is enough */
> +			prepare_test(data, output, pipe);
> +
> +			if (is_intel_device(data->fd) &&
> +			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
> +				test_fini(data);
>  				break;
>  			}
> +
> +			data->mode =3D igt_output_get_mode(output);
> +			data->w =3D data->mode->hdisplay;
> +			data->h =3D data->mode->vdisplay;
> +
> +			igt_dynamic_f("pipe-%s-%s",
> +				      kmstest_pipe_name(pipe), output->name) {
> +				if (flags & (TEST_NONE | TEST_DPMS |
> TEST_SUSPEND | TEST_INVALID_HDR))
> +					test_static_toggle(data, pipe, output,
> flags);
> +				if (flags & TEST_SWAP)
> +					test_static_swap(data, pipe, output);
> +				if (flags & TEST_INVALID_METADATA_SIZES)
> +					test_invalid_metadata_sizes(data,
> output);
> +			}
> +
> +			/* One pipe is enough */
> +			break;
>  		}
>  	}
>  }
> --
> 2.43.2

