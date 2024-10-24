Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1693D0BB59
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 04:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E1110E89A;
	Thu, 24 Oct 2024 04:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/Vpq0tJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A7D10E89A
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 04:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729742528; x=1761278528;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ey/V/8h3FvA0JE/0utnQi+Z9GzHkOunlBFVov2T9ztA=;
 b=B/Vpq0tJh9RUa6nHHLYNf3+59QgT4sTF3ZBDnsYDKUtHrqIPziKxKlf9
 cPnXh8jIxn+ALewN4f8tYcO8sWmkZ6WFPTh3rLOvjJDP3o/KRhP0dzw8n
 ypDwYIhSlRT6AZS02xMMn7TSWnAKuWarYFzovzdaGPk7Zqn7EmkZbi4Lo
 eNcesUTC9EjjFKnqjdNnrsE5OYeE6PFaaGhRSl3RYaYa8AHzQQL5SZpPq
 fmV7vFiuOzb99BdFQuDd7zaiW5WuDPbMZjYoEcVLqWy87WMoZVRJiuwd6
 61q3w4BRrmPphRuUoU6E09O3a4FmMtKp5M9RGfDGu+fm22u0XESr0mOeU A==;
X-CSE-ConnectionGUID: jy899Dk2SGOmvizsVHc/Ng==
X-CSE-MsgGUID: +tsz+Sh+Q4WN/Wo5K68Y6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39900521"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39900521"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 21:02:07 -0700
X-CSE-ConnectionGUID: R/L35ggtSr2E4vMEnjWGLA==
X-CSE-MsgGUID: eyGVyi1KTnK5YKQ1K1YD0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80042484"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 21:01:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 21:01:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 21:01:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 21:01:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0AsHlUCw1Wm0SYWUPPAx+SIKSbeJwAw/Ui25kvowBEfA1Y/v4iWlzLkK6WgO4XxYoaz8EZyU8rHeg5O2ufl8ElHNkZ8imjNu4FlunnXO9cWTtcwSt8Rm3jt/2bb/9py73VrxELhhWMV6Y1yD9oWlyKrZUhj6rbAVJBh5q7e1J5VLJg9yE1PnzJUc1SHSxdIKF2Gcoq7BShIsGf3Ly7yNeLToIMAV9AjWOU/+kF9JV+bAXsfZ1mAWoJiuVMqcIbKIxvQnD0gewnL2nlpsIY+NNKrZXqlUexZ7p3mSbc9Xu7iCZ+DufLcssZq2MKB6jqos9X3njfIm3XCB6dIlAgSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fRMr7zf4KM9var7yz9jgpwhfmElqmozek1q1MHOJEw=;
 b=CBulFp0Q1o7xIFw+gK/JpY7iGsmBqdSYYV/woJMeIEDfojsOXEACbkuBjnDB7+Cudf9EGviw44vtCrv5D5htaAk6f8BUtyqTyoMc4SQC9e0S42FXYsfvQvzUUuOKuFT2AFnNUXJFZcakQLMBjqRJZHiSW4SWp8WYXWejxF1+ShsLehMVGTrSftwRiyl84u6dkqnEcOEc40pQg8QCuBYhsIl1F/e7PBRbAjBXGpce4E9H0DkjTGWOTY7tOjf5cBOTM6I6V6FAd6DMvQUtnICFFiUWTpdqSqOl6ZV0pgozncpEOAnfy3r7nmLYxF1kD16UBk3tHSg0rKg0QjYwsr8O3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 24 Oct
 2024 04:01:36 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 04:01:35 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v3 1/3] lib/igt_kms: Move backlight read and write
 to lib
Thread-Topic: [PATCH i-g-t v3 1/3] lib/igt_kms: Move backlight read and write
 to lib
Thread-Index: AQHbJHvIIkr81UBmJ0CMowJZzNKJcrKVSYuA
Date: Thu, 24 Oct 2024 04:01:35 +0000
Message-ID: <SN7PR11MB6750F6FEB0D195CC0964F029E34E2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241022121042.2295042-1-santhosh.reddy.guddati@intel.com>
 <20241022121042.2295042-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241022121042.2295042-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|LV3PR11MB8554:EE_
x-ms-office365-filtering-correlation-id: 2b6eb27e-ee66-4773-667a-08dcf3e08dde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?KdJm1zEGEz2QZJ3JYEBNbAeRS+X9eOlJOBaLTpywy82D1G/4tnhtDjjTZNrm?=
 =?us-ascii?Q?HrwWXwRZROahov6Arc9WySqR35hybbu6xjmt3iJQJC0zFtGyD2aEj6cuyzB7?=
 =?us-ascii?Q?fr6Rb8Y7+XLuvsseHegeZq3gHYaZ/nfK+j+XOdXZkRU+eyUd2nFcipV5xvTB?=
 =?us-ascii?Q?nqZ4hlLH5sVrJiY3F9bTf2MjoQE+/cGDJeI/5iN7Z02nZwntTueFPcai1KAF?=
 =?us-ascii?Q?ZR6hcWhwlyGO9SASr9+bX25lPWH1rqCOyHqApnID+LkRLX+dX4IFAEiyTLy6?=
 =?us-ascii?Q?mB79es5QE6qYAD5/gJ75N29/Y4vEJOg3uG8vvlvArXU5rYQcS0Z1KxG/4+Gq?=
 =?us-ascii?Q?IL8LI4Ce4623uq22YqZNSoYboUT2m93gpN4nuBfxVWFyNffKV8MbOILrHo3i?=
 =?us-ascii?Q?vP2gQs3bM0NyECxuAYnIjUqLajESKxhzT4CdK5tDNw005jXWVz4FKdZnH2zG?=
 =?us-ascii?Q?dKl/6yQCGPoUKm3SpF9Xvi/K7MhiBna25VLFbpGevk743+7QyQCUJkAFGv+h?=
 =?us-ascii?Q?ke3/hfn1wOL1eTDtv0E8oSGGLLCtPsCm8O+6pAw2X4VnEMrBlHfb9K9UGdsj?=
 =?us-ascii?Q?wF8xslXbyyaAQ2Pjl4AcVtMzLOnI75vlwvaVLogeiKfqQKy17VVTBp+mSCA/?=
 =?us-ascii?Q?F+1FHOVBRV4rjskucEjQzwZUYFi/BO9fZjDKrwo8+H4MnabpMVvPaezmmADG?=
 =?us-ascii?Q?QYNmHZvn5T9ynRdo0bQUhhtQHgtlNJYrN8yA+j8i3Y4+OSlGl2NgHssLbdsF?=
 =?us-ascii?Q?anAoTAxfraVAPCOK+j/QYKgW/yf+ol70dmMCKwPPTT/W9vpt4ZSFDRtht24n?=
 =?us-ascii?Q?djRM5ncrAl9jTUpC/T6c9tT77siMVq5SuMnXJ1M4gSJMJHHtvIVxUEP71wLh?=
 =?us-ascii?Q?afhD1MrweSor1JPn1T+UQwaarpLH1ASx26eXKqp/+MlaKQ8/vvrrB06uMvNT?=
 =?us-ascii?Q?bMw3c0lS79bNFvn2SHsHidSHiecwVDVt9UnvkUI34NCxC4CtgtMSMcv3yxq6?=
 =?us-ascii?Q?L4ezj65taALEsZPgNCKQAsHc63aws8h5ca5tPA1me6EomRVFnYRfCkkI3ypf?=
 =?us-ascii?Q?q7q3W3LDGKHjqvBGhvtnBLs/N+Et8CxvufVmmod6rNTETSxGVm0izz0c8OPl?=
 =?us-ascii?Q?v2a4NC4PxT2j4nA2ehZR3VOJunrkh6Prd8Wh9DkFCUG3qxG6iwvsHnYhin3k?=
 =?us-ascii?Q?0GB43IJfPN4gnhTDxLCpUNfK2j/K1jeNIcX843OExKpww9pU6N+mEu3K0B74?=
 =?us-ascii?Q?hUsGu+rWOXUNdtuPvO8Uq/VOzpZPeSwJqPEspho6ppbQJ0oedJDEH2Cs1uRy?=
 =?us-ascii?Q?+CQPMJFbtQ1HPPL+yJZvY07VOGxi1WzhTcHzQbWop5srkm7lE21LvQHbGmWU?=
 =?us-ascii?Q?a+MlP9o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NKoBrrS4vJLJm+1RYUAONjXelbiTMh533BhvRmVIPIGZdPePoX8ceBewpLU6?=
 =?us-ascii?Q?fR509krGfjaAvqHrfRS5YB/IJizcAHjoBjMJc5tbPzWEMbmM28MF6W18p+Ja?=
 =?us-ascii?Q?UAsoTrUfTqwMNID3bIWl2QI0bJf492ZLAArY1Kxy6fllB95LKocaKao3ZzYI?=
 =?us-ascii?Q?3i8QuXyNaunm4rCKfv0Q+L0BVjo05I4ffNENhYX6vy3JI9KCTQt4I0fzZYP0?=
 =?us-ascii?Q?bwTLl7iUdyYXpxKqgPEmBtaN1NfZOwNyYaGyJ4Apwxdot5lqxpg+AD+lllc1?=
 =?us-ascii?Q?1CD/Dvd0HVhJCXJdun11vFUUyAalhCN/J1awN6rrrxbVOUDYoetmG3LqiN5t?=
 =?us-ascii?Q?4cTyE1DiOHJH7Oil8FtA/fvahw8ISSo3RzCBDtpK9MPYHpvz3ZdDYthCv1tF?=
 =?us-ascii?Q?y033+2ddlM5Hzoz6qKKucUUxVHDI8R3JPj33ou2Oeh6/3F96SyklLEdH5f6w?=
 =?us-ascii?Q?6MD1teJw5F0TvAcactAExgKjgPsd64C30ykmf/MACb25GhIsv4ORBJYU4R3x?=
 =?us-ascii?Q?eV9c1rX/wgRrPqXTRdWy17YVtXKVHJiIoJ70tBS+AxUE1lwpfz91+2X93POI?=
 =?us-ascii?Q?63+zWvFKr9ZcDi778RFJgA4OFf7aJXE4WJJH/6EHqReVMDpir/RPkfsJZHAZ?=
 =?us-ascii?Q?P0ZFNdz3ZDC97MappvHVAzGXre0nTyym/53BdjKCI0EkBpTxYlVFlui5CXN1?=
 =?us-ascii?Q?0eLfjJfk2nfZ6rMKY62TVooRQMWG0rcdrj6Pq9dFb/YroP10TjcAujvwy+Fy?=
 =?us-ascii?Q?KmO4l7egmyJ+fhW2kwveipFa8nyqD7Q9Fh/9gSMUF2ux2+8CMtFu10JIZnLT?=
 =?us-ascii?Q?uhBiqB0rKD44+NgJxv5niMiAtdFwpYHh/ecQ9q6r5Qt4VfTg9jUnK0UWp3uT?=
 =?us-ascii?Q?x1Z21GSj7S/eZMxyZSGqPzzHucqHFH8UkOPQC+dhN2tCbLk5otGbJby7aG0w?=
 =?us-ascii?Q?7Bo6ld6G6lcvvKxrdoEXL2uqbjDdo/4QdrfKuSekSnWC6c+rIz2IDDoJtktt?=
 =?us-ascii?Q?4NY1g/fbgVDHoqyqzeVDRUxmLB7SMdy8FS7coGsZDs++wdi7WHZoZS2SpQty?=
 =?us-ascii?Q?+bYAMk+hdOv7UTlz4FQtaK6dBN70wdeT70jTAo3Glio+kB3ZD5E2fEsvq/Ia?=
 =?us-ascii?Q?hVTnKTH8DW8Z5ygfvI0gmW6nPbs7seLyzhgIRGK/VxMOVnbmCdtZWU/1FOec?=
 =?us-ascii?Q?Dk7N1sDj1fO8nDyfKH8Ffn6Y4wO4STdOqBaFUCbLbj4UBVTB/DxeahSDvqoL?=
 =?us-ascii?Q?sY6lYu4u0imB2SeTo94ZGVzZ126VREgxgwsjqauvwubg8Ps/YuNCGgdK9G5D?=
 =?us-ascii?Q?LCi8kFiaIT9ovr0mpLJsHNMvruvAY3sjLaJJqYH/okeFaAfPS3QmGbMEOXJ3?=
 =?us-ascii?Q?K/d+S1WpGzl1nM7y5Q4nr5utZhn7O/pPKWfrNfByRNfU+Ygd44xzsrgYHEyf?=
 =?us-ascii?Q?0upJIspi/m7yt+2+dskzNCxNIv5ndRAr39gKrW+HxKbYVuEYSExM2Y6482dC?=
 =?us-ascii?Q?6+BUTMCRY67eQwjBj5XN9Y9Euer+UinxLFAXP+MnuLHQtAJCLI0IDdB13HrZ?=
 =?us-ascii?Q?ObXK3WOzYDlR9cU5AAc/rkitTLeU6YWt6CJ1hK+X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6eb27e-ee66-4773-667a-08dcf3e08dde
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 04:01:35.7607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oyK7FstzxRP89SStnAcwKkE5d+TuB+1rXA0+gA8Q1Y0vU52NYNJ1FhpLY09ooyux4sMzsAW7OWlTS9o/ObEuFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Tuesday, October 22, 2024 5:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Samala, Pranay <pranay.samala@intel.com>;
> Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v3 1/3] lib/igt_kms: Move backlight read and write =
to lib
>=20
> move backlight_read and backlight_write functions from kms_pm_backlight
> to library to reuse in other tests.
>=20
> move and rename struct context to intel_backlight_context_t.
>=20

Remove the extra space here otherwise=20
LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> v2: Rename backlight_read to igt_backlight_read and backlight_write to
> backlight_write (Suraj).
> Add a new member to intel_backlight_context_t to cache vendor specific
> backlight path.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_kms.c | 66
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h | 12 ++++++++++
>  2 files changed, 78 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index bb35d4b82..5d8096a17 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7119,3 +7119,69 @@ void igt_reset_link_params(int drm_fd,
> igt_output_t *output)
>  	temp =3D drmModeGetConnector(drm_fd, output->config.connector-
> >connector_id);
>  	drmModeFreeConnector(temp);
>  }
> +
> +/**
> + * igt_backlight_read:
> + * @result:	Pointer to store the result
> + * @fname:	Name of the file to read
> + * @context:	Pointer to the context structure
> + */
> +int igt_backlight_read(int *result, const char *fname,
> +igt_backlight_context_t *context) {
> +	int fd;
> +	char full[PATH_MAX];
> +	char dst[64];
> +	int r, e;
> +
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
> +			    context->backlight_dir_path,
> +			    context->path,
> +			    fname) < PATH_MAX);
> +
> +	fd =3D open(full, O_RDONLY);
> +	if (fd =3D=3D -1)
> +		return -errno;
> +
> +	r =3D read(fd, dst, sizeof(dst));
> +	e =3D errno;
> +	close(fd);
> +
> +	if (r < 0)
> +		return -e;
> +
> +	errno =3D 0;
> +	*result =3D strtol(dst, NULL, 10);
> +	return errno;
> +}
> +
> +/**
> + * igt_backlight_write:
> + * @value:		Value to write
> + * @fname:		Name of the file to write
> + * @context:	Pointer to the context structure
> + */
> +int igt_backlight_write(int value, const char *fname,
> +igt_backlight_context_t *context) {
> +	int fd;
> +	char full[PATH_MAX];
> +	char src[64];
> +	int len;
> +
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
> +			    context->backlight_dir_path,
> +			    context->path,
> +			    fname) < PATH_MAX);
> +
> +	fd =3D open(full, O_WRONLY);
> +	if (fd =3D=3D -1)
> +		return -errno;
> +
> +	len =3D snprintf(src, sizeof(src), "%i", value);
> +	len =3D write(fd, src, len);
> +	close(fd);
> +
> +	if (len < 0)
> +		return len;
> +
> +	return 0;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 2b26d2bbf..bd154d1c1 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -33,6 +33,7 @@
>  #include <stdint.h>
>  #include <stddef.h>
>  #include <assert.h>
> +#include <limits.h>
>=20
>  #include <xf86drmMode.h>
>=20
> @@ -513,6 +514,15 @@ typedef struct {
>  	uint16_t tile_h_size, tile_v_size;
>  } igt_tile_info_t;
>=20
> +/* Backlight context*/
> +typedef struct {
> +	int max;
> +	int old;
> +	igt_output_t *output;
> +	char path[PATH_MAX];
> +	char backlight_dir_path[PATH_MAX];
> +} igt_backlight_context_t;
> +
>  void igt_display_reset_outputs(igt_display_t *display);  void
> igt_display_require(igt_display_t *display, int drm_fd);  void
> igt_display_fini(igt_display_t *display); @@ -1253,5 +1263,7 @@ bool
> igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *outp=
ut
> int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);  in=
t
> igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);  void
> igt_reset_link_params(int drm_fd, igt_output_t *output);
> +int igt_backlight_read(int *result, const char *fname,
> +igt_backlight_context_t *context); int igt_backlight_write(int value,
> +const char *fname, igt_backlight_context_t *context);
>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.34.1

