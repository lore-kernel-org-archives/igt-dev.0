Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4A5C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8567410E173;
	Thu, 27 Jun 2024 07:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2lKGMN0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB95D10E173
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 07:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719471938; x=1751007938;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oRQMDEMi4uw+8sMMVum5M9p3AOLELY3FpsqlD5YzLZg=;
 b=j2lKGMN0Zx9agz8YEzKOPuuyf5xnrd35ozFYqcPa4Frl3jppPqewF1k5
 EiCcuEALye5gGdd6cj5lrtlTknh9o1k8q2yJyEDAT7WRRiSBTizXnFqxa
 C1TrLRVTTTxJNVfdZRYDUeUoKXPwhVP7nTkPb+JHhma0vPO1niQHR5K4e
 oNWlFwKJ6p8sWJ176FsfVAEtewatrYTZNr264LmHch09X9pIKYB3utXMt
 xO/FaMdsPE97ZVuzz/RZib/dIKCkKvIQC+s/qrw3ofvvzqjfiRvoc9tjZ
 oOsE5MdNu8XLe5pWFdt/EE8iV+vFGjTC1lQSWveh5e5EwIXhz0KH9YASl Q==;
X-CSE-ConnectionGUID: 3KkKa2LPS06SAD2ejuU2YA==
X-CSE-MsgGUID: jo/+oNV0Qya292zkBFx+NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27715480"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="27715480"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:05:37 -0700
X-CSE-ConnectionGUID: bjX9c3NgRkKCARGtgFEdBA==
X-CSE-MsgGUID: JLh1V2UHRYCs+LbFznHYWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="49452939"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 00:05:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 00:05:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 00:05:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 00:05:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 00:05:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIOWaXACi6WkQE17lAvnEDsU4Gy6tNQ7CwQelWLGsrNy2/sE8utlIVtMQ6ShW7HYKR/+Ggewg+w986IaVm15AJvo9dW2e5qirDF2C2VwoRbHXvzz2j2QAX1B2Hqz7/YNw5Y1IofWoR9nQ4+1ShPAuCXAvDQu19CTiwah7/9WrPm2T4x5qCRSSauEN6Q6FtqLOpuZOTxeEHjxMx1we9I5t2T0abS5aZowXBI1Wda51/zEAXYRcgNaz8dRrbinjMWGtlGSG769VBCu3c+D2czI7cQAy4dg0g/Nry5oy5WaK8V7m33T+M36T0fCBtPnCxiJLEpkGvoxqNd9ZJuhkAxvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcWNofI4u7X09s8YH5WUM2RhUaO7E5zBpqUYzxcPuqA=;
 b=BbHs9meM8lufCIKiNFwBnElezNcPyIL0/Is5Z38KDlcpVmWmBxYzXM2OBoehjniLQCqLU5OGdN6GwHxYX6mTIYh9D+TuHq/LY2l/BQyKWDREKOWXQ7rPoN0QptAHHqFU4yH9BPY4XVZJpmfQ9xZWVIvFbZFdZ6ByDIlAP6tnmTYZF1O7rYRC+9IcU474TxZlUhBFp+RAgu/MAbTXQW0qQIRO9GvZNleFFmErUJeGktcANxd4ht8KTZOWJ9up9PZHI75Os5zEmmxozpWJPqm8J03PFmUvSKJDiqagHKHC8BbupJEgWCUPTnuX74FDsgG5yiwTNe2QdkJrhXqE+0IoKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Thu, 27 Jun 2024 07:05:29 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 07:05:29 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [i-g-t V6 7/8] tests/kms_setmode: Force joiner support in
 bigjoiner checks
Thread-Topic: [i-g-t V6 7/8] tests/kms_setmode: Force joiner support in
 bigjoiner checks
Thread-Index: AQHawVnj2FOWUOfmvUW3A7O86EDyCLHbPfqA
Date: Thu, 27 Jun 2024 07:05:29 +0000
Message-ID: <DM4PR11MB6312CFB9FF56795F65D3DEE490D72@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
 <20240618082248.4070611-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20240618082248.4070611-8-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW5PR11MB5859:EE_
x-ms-office365-filtering-correlation-id: e6848378-cbcb-4856-e33d-08dc96778722
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HBtQ0irSv1c97l0vaynlPf0wLmFCA43XWR/ooXO0n9PYP3R7Bh6718W5wVCK?=
 =?us-ascii?Q?0OZJXLbfYxkM6FW8H58z+1KifTmJSjJNBzE4wQdJE1Em4okVHTs46S/SUbEf?=
 =?us-ascii?Q?wVNQJctqeY1Gra35bOp/pcI8C1FoRKVoQCUYDjFqi38c7YBhBSd5wchAecUD?=
 =?us-ascii?Q?pSzwef1FIMYv/T00sDouA6jE6yuWHz5ZGZdEI1LWSvKoCIjFU6oISYVBi6dF?=
 =?us-ascii?Q?bWBOrEIXB6V2534yFu8cRBphOyFnYTJgIH4kFclFx//TRiW+3oD6kCZIIa+y?=
 =?us-ascii?Q?0qI8/iRpjXLnKsyLWIjehIETI9vKxthhU+F/TzJnuqGVrt2kxUd4bfq0e3vj?=
 =?us-ascii?Q?YUg5vn7K49HS+0v32OEUpSUFMe/DqvN0pdVCa54bhUNuKNUm+vvkbDLE7rW6?=
 =?us-ascii?Q?+T/m5h5WzfuBeyDELM0yJShO1uuZCWII1Pfnr4HLqlNqou2T4rvPOPbS+rXv?=
 =?us-ascii?Q?qYS7iYMPENFTUu+R8vmhg/HT67262PGMxmgs7LptxyrSG+2QpKoqVfshTHzM?=
 =?us-ascii?Q?4nsa+Hyt5ppkJf/h0ok0JtRAlmxtB6989Eehn9yX8DU1EHN2IO0StkmtSCmB?=
 =?us-ascii?Q?8Y/EAtZGUvpoXlsBQki2u0gzNnfQK7IlCdDUAJg+Y0/vTMLsO8fSRzW0Iwrh?=
 =?us-ascii?Q?+AkN+iM8uvTFmmbFNLjEp0954k9m72O1O1NM5rHBF6A+aJ3zvr4zRMvLN4uK?=
 =?us-ascii?Q?GP7M9GC2TbZya9dcfyR+eZUhDlGdFHnsF0v/m5J+PQCCSPbo5g7qFaK95dMd?=
 =?us-ascii?Q?mHARBIOhd6poh3rc3mjodexNk3INlNua7Vd+Wet8cm23JwQoZd2ryu8ZmzkM?=
 =?us-ascii?Q?Yq1bP6gxP8S+cqcy/LJElbXFCZnck/vDc3z6djCQVAjsWWZ3PcIXSX5eva/i?=
 =?us-ascii?Q?PQ6DdkTBqs3ArTb5Ijt7gwST5FMVyC+G/vA5v4VXaayfkB3h7fiS/gJ/oYeC?=
 =?us-ascii?Q?NVQK4tfkj8D+m7A5ecw0XObMJ6qGQOJXrRySJo7AvQDnstReTmq2Pc9JXVK4?=
 =?us-ascii?Q?N1E3RtHdHl+YZE+4VUAthtetFRX2M8RPS1ogYTH9A2mLd1vXF2U7VrHA+/sW?=
 =?us-ascii?Q?7tIkU+okD0crxu2iHTO+y/x21La5vF4OGgLK/Vf58+9nVdD4Rh/blbPrPaKb?=
 =?us-ascii?Q?esRQYJeT+hoOFe3C+H3TffLMBa3Qka1NIRUhiz1RwVZsiUyUoZkZNxAsKmQd?=
 =?us-ascii?Q?667reXtKHw40l/ZnCpUqVPJJ5mpnzFn9X5XFasjMpgYjtnBxmtjVdW6zuVat?=
 =?us-ascii?Q?yBK4apeP3QQyrbQK4xPW1L+RZC+2bfKaG9y3H6iW+lszTPZ0qimOBC5gxgow?=
 =?us-ascii?Q?LTgCgL1W+cvsW10KYNeX8OON3VDT0BIf4voh8yIocjJ9ewNrILYmp1RM6gRS?=
 =?us-ascii?Q?n1ymJjFrCjT7vEyC7Zipwqytf1Rrk71aJpa3w1ot7SXDk4P4Gg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hebl1hPAV8pbWRuDdDdHcLtm3hS2t5AzgVzzIodacL2KcTOkP3Il3bXy4xd6?=
 =?us-ascii?Q?0JrxeACKbPIlKI4pPMWNSSLBR7lcTRqd5VtZnwzockyLRuvHTjFTOHPx+3AQ?=
 =?us-ascii?Q?VWXDJGY5JwA41zo3HLoKtLYsSDnTjWa8g5Y3keGx8qp7SYsCYifjZyzkBxw0?=
 =?us-ascii?Q?irLJHCJP1AVpCI0FU9eEfoZcA8aBDVWP5QPmd6jvaU//h2s8x5pqH27tena7?=
 =?us-ascii?Q?iqv2GOplarPpgFN6LqE8QKgfqW1DJflefnhBa+4G4QC6PNAcWjxZU8y6ym1F?=
 =?us-ascii?Q?fuvHTNt55XI3g8lolPv0J0bzTHatN3X3GB+nHV9+JA94SuO9f7Z5zm70M/1b?=
 =?us-ascii?Q?M4ZuHSccfTb04KLjOjb1B87TvtLr1Pqr+UfigumLm9hAh5d+/kn9lAm1YGse?=
 =?us-ascii?Q?Of8yWV5p6x9D1OYwRDClZ4rkaGOa1OdSuDanR8cbU6uUvqutVuYIVbirpC+N?=
 =?us-ascii?Q?SDdQ59IzL4TB/A/toHfSyjqED3pQKbmf+fvjsKqV6f47m46mfbhRsNESvUa5?=
 =?us-ascii?Q?doyepzLdzHdcOlw/YYkIgkZWW5N2PYcDJ3Gl/nH6r4JiwaBvVvWl0LceLg2p?=
 =?us-ascii?Q?hUqt5x974qGvFK+VrGbWPWggQgFeQdxvCrkC4HCD6lxdqEFGAFY51uP28APq?=
 =?us-ascii?Q?zeisngpWrXGFwwBpZ3e4YmTBWx+Jsgus6YrGczSfURdeN+7GYJr5ZQOEkSDc?=
 =?us-ascii?Q?P2eOiMmhBFkTPl6PUL6zkxJp5RWd8OLvFQe45hCWiyH4N42WH+mYTS76G2zo?=
 =?us-ascii?Q?PcZ2+H4q3x8iM25/pf2G3kAKK76v3zJgG+lpaXAwsPeQJ5OKvt4CJfcH/f75?=
 =?us-ascii?Q?cXRYwJkJIy1mC5v0z3Wg41Nh3LS2u3FpKVRzhmfNNMJlf2IelU/O+w4ngI16?=
 =?us-ascii?Q?SGBvY3DGYn4qOwAAv9+ZOYH2QaY6tS3qd4pKA+otzOkE5TF2qm36EeFHxcqc?=
 =?us-ascii?Q?M181PZa6UQOF8sV71Dwctsuq7xSDXS11pxuY4ZTUQDZc6vTQDEq0j079krKy?=
 =?us-ascii?Q?nF8lVBw2OQ62lczNZKbdR42Yhr1Hd3QZksSixos6sRc1DLMhda/AT+Hutry9?=
 =?us-ascii?Q?i7wTHp/TdjChFIamKjiHpFF7QHO/35mlrFx4hv84Pj7iXOtKyWSBn4cdbm8U?=
 =?us-ascii?Q?YVrv2OO+PznKVoU72B0j0LsJPM8Viv58SLejjxs4gH4A3R0t0w+KbVOR5lEV?=
 =?us-ascii?Q?AneOLORfZdQY7YjMqmXJCwy/KkfBg6sGzf0w4wnSpJ2px9f/zo8i9y3p4dEu?=
 =?us-ascii?Q?HutIKq8AiNn1vf/a6oEouGX09XPQHlrgleVqZIO9D+nsUAGUjWQ+XK+1Rncy?=
 =?us-ascii?Q?q0ybwXaQzaKF75mzKSutZT3abK+2bt7wISZowd9/ERR4OAAhEMhS9Ojfk/RT?=
 =?us-ascii?Q?RosgFB32fYGB7MU/DxUrA1gYwBeixO44U7B3cEgdrtVH8mRBaAR/pBObXSwq?=
 =?us-ascii?Q?3tR4Bz4qHIElpcwtqONUmnY/lTnXw1eWQW5pEkoJtj0I0Wfl2QsfnDZ4D5XC?=
 =?us-ascii?Q?mLjPayzEUEZeIyrRTswnwar0iAYorv3AqW1MzPeeBqaKThAKVzZygBR8W8D/?=
 =?us-ascii?Q?G+346R6gr+hq2E4ha7o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6848378-cbcb-4856-e33d-08dc96778722
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 07:05:29.1766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XL4xmSyrM6bJWoEtQeSp97zVrDQFfPeWhLzvBnptOSrHJ8peKueok2K/kxR2A0/0IPSkAqJpXDp4T3ROyLi3/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
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
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 18, 2024 1:53 PM
> To: igt-dev@lists.freedesktop.org; B, Jeevan <jeevan.b@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>
> Subject: [i-g-t V6 7/8] tests/kms_setmode: Force joiner support in bigjoi=
ner
> checks
>=20
> As we recently introduced the option (through debugfs) to force the bigjo=
iner,
> needs to extend the support in bigjoiner checks to handle the force joine=
r.
>=20
> V2: - Fix connector name
>=20
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_setmode.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index
> 490bfd3dd..95c5bfadc 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -709,24 +709,38 @@ static void test_one_combination(const struct
> test_config *tconf,
>=20
>  		for (i =3D 0; i < crtc_count; i++) {
>  			struct crtc_config *crtc =3D &crtcs[i];
> +			char conn_name[24], prev_conn_name[24];
> +
> +			snprintf(conn_name, sizeof(conn_name),
> +				 "%s-%d",
> +				 kmstest_connector_type_str(crtcs[i].cconfs-
> >connector->connector_type),
> +				 crtcs[i].cconfs->connector-
> >connector_type_id);
> +
> +			if (i > 0)
> +				snprintf(prev_conn_name,
> sizeof(prev_conn_name),
> +					 "%s-%d",
> +					 kmstest_connector_type_str(crtcs[i -
> 1].cconfs->connector->connector_type),
> +					 crtcs[i - 1].cconfs->connector-
> >connector_type_id);
Same here...=20
>=20
>  			/*
>  			 * Handle BW limitations on intel hardware:
>  			 *
> -			 * if mode resolution > 5K (or) mode clock >
> max_dotclock,
> +			 * if force joiner (or) mode resolution > 5K (or) mode
> clock >
> +max_dotclock,
>  			 * then ignore
>  			 *   - last crtc in single/multi-connector config
>  			 *   - consecutive crtcs in multi-connector config
>  			 *
>  			 * in multi-connector config ignore if
> -			 *   - previous crtc (mode resolution > 5K (or)
> +			 *   - previous crtc (force joiner (or) mode resolution >
> 5K (or)
>  			 *     mode clock > max_dotclock) and
>  			 *   - current & previous crtcs are consecutive
>  			 */
> -			if ((igt_bigjoiner_possible(&crtc->mode, max_dotclock)
> &&
> +			if (((igt_check_force_joiner_status(drm_fd, conn_name)
> ||
> +			      igt_bigjoiner_possible(&crtc->mode, max_dotclock))
> &&
>  			     ((crtc->crtc_idx >=3D (tconf->resources->count_crtcs -
> 1)) ||
>  			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx -
> crtc->crtc_idx) <=3D 1)))) ||
> -			    ((i > 0) && igt_bigjoiner_possible(&crtc[i - 1].mode,
> max_dotclock) &&
> +			    ((i > 0) && (igt_check_force_joiner_status(drm_fd,
> prev_conn_name) ||
> +					 igt_bigjoiner_possible(&crtc[i -
> 1].mode, max_dotclock)) &&
>  			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <=3D 1))) {
>  				igt_info("Combo: %s is not possible with
> selected mode(s).\n", test_name);
>  				goto out;
> --
> 2.43.2

