Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFB6CCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 08:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E231B10E55D;
	Wed, 18 Sep 2024 08:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU622Uud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DC110E561
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 08:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726647013; x=1758183013;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q369q4MzTryorwOyZGmRVeAS3KS9elb1ZjhTOlM6K2I=;
 b=HU622UudEM1Ddx3nL/xbbG3S+V33+omUi3lb33BVsitfA1GyzRHOFgai
 I2+bV4Fgez+wFo+JYaW+hjEW1SMJNDZyBoHqcQXY7ZqBxG1rf+Vhs1k6S
 gCa2G0sinasCOFKiu4k9sXIqcrVA+7Tii02lUEH1PpWkXLUhrB7ozoYnh
 rP7INUK7u4ySurw2rPFx3nFSK+ggr7l8W85JK2zbSoVa+U4wuGw0r83Tt
 OmF+LO+8eHkQsMzXEiopxcu7Fl/CpYEA4E4ZEpwfaAHSZmukkO/n156h+
 0MYTRonWI5cLvNAWzKSkmb2KUIGEg+01lcoWA22w2kApwlmDni8Of6zfZ w==;
X-CSE-ConnectionGUID: nWsNiDkQR9GAut0fg9U4vg==
X-CSE-MsgGUID: etNaKYkKTcaWW/xKtk6Spw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36114385"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="36114385"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 01:10:11 -0700
X-CSE-ConnectionGUID: xh5D+NvgRC2VxNtkVbSiaQ==
X-CSE-MsgGUID: JU9b1F/5SDax2mcfY1IXag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="74459003"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 01:10:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:10:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 01:10:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 01:10:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ngp/j5ZgagAJQyze2kU8tbF8XDzYaBhfCtlc21d569XIwp+NTtFh6/U8yRjH6drGa/UnP15crR9t+uWGyJM1PFVpDx5feYdNsSzZuB4UO6+MHDTQephEGNjE8VyC3zd81dGvH228sLFVNRVCfG0RCW1Sb4XNt3cFHn+qEhWZDCI+fuWWTx5V7VCyZ5ETLvVOAIaSp8Wckaifh7Q9GmgFN4i+IuAfn9FKfuMMf+Oh7TM+KtCihpg7Puhc2sqI8YUxrkLRYxbNPCsXI9Mcfgbswos1Zo3GHLXiRSJql+YRZWWY7s7NZtSzUfdfoBrWyXyY+fgwJsgRFilfDH3omMS7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pI2svx9PZElKPqHnGTU89hAoyuacVjWtADOQHHbAyIo=;
 b=SjsURxqamWcnDGGmMjI6/Zso5wS/DcWYg4TAcyZftGIv+In1rs/L93BBLaskgZWO1PbcbodGXcr/xpQmzaTiEQmR5y5SeFVnLA4q1RRHZ+f6G8fljct8fNC41tND4KmOAx+5oHu9GNmZYXSS83pSoU3zeKcV+0WliRpP8OdslcPiHTA6W+W7UEQ8XCMV43ZM4cwHd9OHEowMNIQprPQyBaT6ViLaJUyC8DDFvlFJiSicmAe7xNB1mIa3AZTSSrZLD5lsJp8sZgC2a9sWO37t4+P9fL9a8bAsfUAVvV/OnISDSQLxcapksPf7lDVhxTNHhOpenKrjVq0dCz8j4/iN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 08:10:08 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%7]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 08:10:08 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [i-g-t 1/2] lib/igt_kms: Add a debug log for invalid pipe/output
 combo
Thread-Topic: [i-g-t 1/2] lib/igt_kms: Add a debug log for invalid pipe/output
 combo
Thread-Index: AQHbCOeXIcSfNqSSJUSZqtYo+meSwLJdMnNg
Date: Wed, 18 Sep 2024 08:10:08 +0000
Message-ID: <PH7PR11MB6053896ED006BD0FD31BFDA8E7622@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240917094422.938032-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240917094422.938032-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CYYPR11MB8331:EE_
x-ms-office365-filtering-correlation-id: 84ab9e53-96de-44a9-59fa-08dcd7b94f8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+Q9/nuNlZVkstjYIs44iefOr8WjzX+Y/PUcpU3qsPolk/0ITFgSHFminTShq?=
 =?us-ascii?Q?k+Z1S5qYkkV9pUIZYSjcYdh72/Uw1mYpAjDiHlk3vKzKEnDhD2WvDNCfsgOE?=
 =?us-ascii?Q?KoAlCMB1MZhTY1kn911DVYooKRE/qpwAGV8SPVJYnOea7v8HvQQY6KjUwmhA?=
 =?us-ascii?Q?+rqLEHgyqef9x4JfKk51HzUllgBfp7toQtnj8cA9lZlmuMZYBmApfrdG9hji?=
 =?us-ascii?Q?ldaADD9cecP433PBol0vV8KVcL/lTID79reqPq5rBcdf0HNKrmaVkxTGoV90?=
 =?us-ascii?Q?LT+jQy3Hp+pqno+hyj8IhoQKciOcXSp0AAZNak9jZT5P40PrI03IN4ZfyfLY?=
 =?us-ascii?Q?VTpiuwUnKrL9lOR/Zt22Mz6rSHZT3zmUy9pauFR+MJkf8SmIx/IheXR7Q4XJ?=
 =?us-ascii?Q?C3eMfl1sypk0oohLk/fPzVNvoHTN3X+VO1zRKWp8igy7aWZ29ypNSI1tbvvt?=
 =?us-ascii?Q?cQKCoCO6d98o1ppwW/xNkFb6iNoEcaB0SzGQn514tkzlNsInI9IgR9L3goj1?=
 =?us-ascii?Q?uvIMy2Le66EasOCMnPThHT5bVdWwjZcBbdpve57mfhKm0LCE1hmCSvFXV47Y?=
 =?us-ascii?Q?1wkMTXQlBaZqAaHXFxf5AMxOgFiioVNGX4M+OxJe0n28UFIffV+9iDbEY4Rd?=
 =?us-ascii?Q?MB+bETa3njswOR5ql1d5aC6+hCSlZaUfEYNugHjGNx3tkMFkwTWv23LQKmMy?=
 =?us-ascii?Q?OzKzfmEW3IQQj/6KBINTdL6YEcr3lcUglx5WF0Whq6wzHOw8TRezx/OACJt4?=
 =?us-ascii?Q?SsK6l1fhj0dcYB//1R90FldRa5jjXsE1Y9vaTmmUL8TaIUmiRty3KAjZPoUQ?=
 =?us-ascii?Q?sdVsP1LZHuV8ykgsF74a3ezE50W3wzvm0vELN/0RzL6qBCVSAU9f2vCuRAEy?=
 =?us-ascii?Q?xrE4HHuFrCS9i3OfPBpORRdYXq8sgIULJOHxQkWFoyoVrkdRrKvqF/6pY21w?=
 =?us-ascii?Q?E4+HxZADJiwBARwKDSLZd/WcqXQiIFEdoj8VcmBUemf5G+pri/Ya4RKY3SA0?=
 =?us-ascii?Q?LU0x/ZV5pIOijz66BdBiOXId3ZGmxZw2Ot/QxxFzI6qmphxZUocPvZJrhfSY?=
 =?us-ascii?Q?KNYcCEFYJ5zFTAVulAFNoSvAppfyKdhwjZA8RTDoGyXUwX4nDAiP8+iDdr6X?=
 =?us-ascii?Q?JEGqPStLXVWPunsGyAKMYsYKbInKZPDyrOmmFoX6cRxruebQqpFvxml7XARC?=
 =?us-ascii?Q?BGddVTeXaCkYY79ppeAVBETOpVMVSpfnw6FolADgjtrxaT/TFOOBKTezn2JA?=
 =?us-ascii?Q?SaBeuuGAqSvHF/5p0wYbcx41KLoCFfneDdoDGDnrXRnBYjJnF76O4RKXTO9y?=
 =?us-ascii?Q?X73AGs/ovApFylNv9ZDuvk8/xn/W9WI0nr7JMPrroaUqRcQ+gaKAowzeFyWY?=
 =?us-ascii?Q?L93R/vEwNvazblppatrNumgJYkZAqRi71ATYhqhsT0ncfSdXqQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EZHsNR74L/ZCNaLaFJd1S6HWKAla64tcqhUMHa09SyRuqis8mj+CB6ys5Apr?=
 =?us-ascii?Q?caiWeleDfXRGXjAojb/T9yKBAXFuWpsGeVaohP0y/rHMG+TqgOU4Q8cW+qBY?=
 =?us-ascii?Q?6NgcyWLB9AWchqKekshwR0r7gPWXwIqOvPqmsufZvm3Yc7CD2XQImUW+8Sq6?=
 =?us-ascii?Q?DbfODu7tF+q4QkqiJyZ5X7cBmItI1jb8qdQG/pjjp/6BqVh3duQnnf/jD1+K?=
 =?us-ascii?Q?mCImu1jsP46CWfan9aHfWs4GVXlHI7ShYMjifsVaKmHnyEFxbO+2ZStSmOzz?=
 =?us-ascii?Q?EuQyGSH/hjw8V878wemMt7ffpE7IwSrycRzEWm5OAhjDT7aA0QkdE4jVAOZr?=
 =?us-ascii?Q?lhsIOAK/yIdut8itqCzPJilOJ85nYSg1Se6rVUMXSKJc45HiDU58AUA2uY6i?=
 =?us-ascii?Q?xgXnWd5Ji8j0PRCLp0rdj+ZpGYn9e9iEQUGkcPGopzWouEEjOgV/NKRRqkZW?=
 =?us-ascii?Q?siF2y2eojN/C3Tr4gUhuX8K0cBWTt4uU+dmEalnbTyyFJr+RXpn4BMDBjx0l?=
 =?us-ascii?Q?ySDjrZ4YE0i623kUBCwwiFamj1ZKVZObu+zvnSbOz6Zcs3flNZhyVTZ+Lq/B?=
 =?us-ascii?Q?eODXsBVj6i0BTSr10IYB3ubIGBD6HO1R32Vu9Ft+iQ0/KzktLLt8rrRObsn+?=
 =?us-ascii?Q?lg4gyeu00ih5wKK9gRYvpx1br9fd+5STN4eqZupIi2QssyuFzPFIxVkT4+E3?=
 =?us-ascii?Q?OoDTpjEHnVSkYL5gIAfxl+0527H8pzB2nk2ZNwq4XYyd9Yslcfn8cPVYJjgO?=
 =?us-ascii?Q?6GxBVa3qujDTS0GgOQnZXzi2xQF/J29XizEsWjB1l3+//W3yZrwMi2gCC1JV?=
 =?us-ascii?Q?AfFcYoy30fkzvxBPUqfsxn4nb0/3ejR7bFov0U5XeTZrO4kqBOXtPP0yHBHZ?=
 =?us-ascii?Q?E+i4Laq59yYfIWZq/ED6nYZygRf0AonkgfVKJZ2/7kmbPDWg4QK4/IZOScIz?=
 =?us-ascii?Q?H+UxN4cLL5V44KPQfBiIFSVJuIN/VirMJ6MQsRBGyKs9PmFCz7v8nAg2B4cL?=
 =?us-ascii?Q?BI9Bsd8cMFMwANQhZOzcnln7Sfwd6CyCVpIASftdz2gFut7RAhKIXnlZs2I9?=
 =?us-ascii?Q?3nF8M67IkziBH/PVgyT7n2Sb8fM2yyz/wQXAHXXwQlumRcnRJoZlS4gqYvrj?=
 =?us-ascii?Q?GmP7L/8/l7CU9FcKMDyMMmrJEeKHNaV/YycJAUWVcqybyXaNZxbwET1ZnYu5?=
 =?us-ascii?Q?IWtXtFBKREGmwo3v6jcvMQHyVPvQv3N1MpHYbvobv00sH6gZchLsFfjC+dnv?=
 =?us-ascii?Q?eGz0soW0d/oYyD/UzehQolD36DLskqEsUJjL0+oPawho6n7NQeTMxfQXIfki?=
 =?us-ascii?Q?rkEpBLLoqtXAG/YGd5NsEsUCAneYsvqffxTZ/IoD9hmSS7yo5WLSxarnUMJj?=
 =?us-ascii?Q?oSE/mdY21LBEqzgVbv6MPGVc3e67lGyjwTRuS+w7GCizI1Pi7Wwn23Rax48B?=
 =?us-ascii?Q?Yrgl+c6eH3wSX9zNkaDieGwJZiNVqTOCYj3ko6V/sQRa6M1pBBk8CTz1Duyb?=
 =?us-ascii?Q?MA4gWlm1V9SwGFC+bJDASkwhI/sNv8hrMnEeK2IH9u4BmKuTsSjEs3HPXtMh?=
 =?us-ascii?Q?xNmGQjTx0dqh2XRQw1dRmpyePgtBiDstSW4rIzT/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ab9e53-96de-44a9-59fa-08dcd7b94f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 08:10:08.2955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: damL+mkUs4OhiDcpow2VeS4RfdUbBdFpHlYqgnXI6onK+v8pQWu8lyFa7HgQV4nBtjRukJABvTI1mzvORj6sMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
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
> Sent: Tuesday, September 17, 2024 3:14 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t 1/2] lib/igt_kms: Add a debug log for invalid pipe/output=
 combo
>=20
> Add some meaningful logs in case of invalid pipe/output combo.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_kms.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index dd530dbab..9313e4c27 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6585,8 +6585,13 @@ bool intel_pipe_output_combo_valid(igt_display_t
> *display)
>  		if (output->pending_pipe =3D=3D PIPE_NONE)
>  			continue;
>=20
> -		if (!igt_pipe_connector_valid(output->pending_pipe, output))
> +		if (!igt_pipe_connector_valid(output->pending_pipe, output)) {
> +			igt_info("Output %s is disconnected (or) pipe-%s & %s
> cannot be used together\n",
> +				 igt_output_name(output),
> +				 kmstest_pipe_name(output->pending_pipe),
> +				 igt_output_name(output));
>  			return false;
> +		}
>=20
>  		combo++;
>  	}
> --
> 2.43.0

