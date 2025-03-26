Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2A5C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 12:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A9010E123;
	Wed, 26 Mar 2025 12:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jxz1bFjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049A510E123
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 12:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742991789; x=1774527789;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IoGoyZO81EnFkBBxN+ulMotwyhfgT/L6ZNxteq1ZDS8=;
 b=Jxz1bFjtlB+kEc1JG67uKqMNQLe8YGBFM0gFudvZUTByc2HeMbRLQb/J
 S+sGRqB1PCmTR5l87qa7KxqNf2lSRfBQEX7zH1yS0Z1fDxahxq5XTr+DS
 mqSYavGCZBhqQyUCfLvYMwe4Ou1X7ubgzpr7X4wWbPyo2YLzNrHbNiXPz
 00/p2vcAa2khMnWuNTw+N+dgAJx/o3pBR/uln8ic9WD/pNVwTCljRok2h
 KCEZP4Q5NwnoU2JcL5IcQ18mt28uXlzBZGiTjs4PTQ3x6nc9CRwLZXWRy
 MW2FlilEil1nzAFKgABmIuy4kUCI6or+BkTktTJ3DsxTaBB1a20nQfPIm A==;
X-CSE-ConnectionGUID: 1p5W+2JXTveLHZAgiy2z3A==
X-CSE-MsgGUID: bnkaNetRSoisXR0FosFHrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="61669977"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="61669977"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:23:08 -0700
X-CSE-ConnectionGUID: c6eKKpseQoOmpu2/NYkmWQ==
X-CSE-MsgGUID: /Z8yNQqKTmiHrIoRo0xpvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="129593000"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:23:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Mar 2025 05:23:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 05:23:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 05:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FK0ZFBEf4bHpchXrogaiQsSEfhsSy4AxhkwHc2sFOdW6nlAIPdWwxYgajej3mnmfyAjwoy/g9JSR3XUc54MQZzLVSXM5tPlswFYsiKRi5gcLFpdBGRr0HOnY6iAqwh6FIrPclPfhBEhElYn82sseE3yY/FfM/vyNQpNbJNnsYTJdik+kxCwlh+GIqUgmwSLLqyKQu5HZacD5yz5zhLIOukCQp33MryzPfe+eMsq7lsIk5MHF+uUe3LQVndtxTT6iuRyHv53yBWJlRS+6d7uIDxhvXURhxy+kjTZv0TOIoDcOFtIlrHOIMrgAIUF3JkHlFTXE9VK917vX8mFFeoKVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wo73WYHdh2HDsvv1frshSg1WDqx9A829Ukr5Tr/jTy4=;
 b=zWiwgtiXA9b2GMKOc4zJU1M1mlT5tOAcsB4eCfMbDY5nj1ehahajfmo6h9CM7ozmRavZxuREFyF5vu4t0p8i0hYojtT1uwvRekL/yVCvFIDxM0DNT7h/glr7MsxjiqVYm6wRK1zUb8UCHfY7HdyI/IaH78/SgDh8mVl8S/7pN40j9qWkcjUxQFe/DEdQLF5U97EygF1/VN0d0H74ESsD+AnT/3Mzm9gxVOUN+xG4kXeQn9ywq7mIk8vHe0vUt7pHOvcbBCVUyTuNcYSgxnUrrE6VifShtZgOaoymsnZichSitVDSUCBVPuzjB7w5I1nj5o7P+/2wQx3tDjDU5Xdw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ0PR11MB5023.namprd11.prod.outlook.com (2603:10b6:a03:2de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 12:23:05 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 12:23:05 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 1/3] lib/igt_chamelium: Add
 chamelium_frame_match_or_dump_frame_pair()
Thread-Topic: [PATCH i-g-t 1/3] lib/igt_chamelium: Add
 chamelium_frame_match_or_dump_frame_pair()
Thread-Index: AQHbnJvM4Q5uXTKr0U+DAzOkF05CFrOFV1nw
Date: Wed, 26 Mar 2025 12:23:05 +0000
Message-ID: <SJ1PR11MB61292493C9C6D0F30ACAA8E9B9A62@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250324090949.614233-1-swati2.sharma@intel.com>
 <20250324090949.614233-2-swati2.sharma@intel.com>
In-Reply-To: <20250324090949.614233-2-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SJ0PR11MB5023:EE_
x-ms-office365-filtering-correlation-id: 42b1c722-2fec-4b06-9786-08dd6c60f5e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3pOXym58vbMjTc4HhtVz3fRR4H5pcPutPe94lkR6rq22QT6s0lFqPBlGm/M4?=
 =?us-ascii?Q?JbPuc+pHrYbTK9Ksm68UJhaUVHB+IQr0Ls/CUHug16lcmPrWy2yKANb06WKn?=
 =?us-ascii?Q?vlbH3VcRCv3Pasr5RzYC3PZg/IZDRwXT8vT9UTLKqnrAL1b27ran2OMj2Sga?=
 =?us-ascii?Q?mMd1SYymei3gXaI87ZW8Ds4FlFu9Ai9Kl/aT4LUkdvuXVwanvZ3EEcnaDIag?=
 =?us-ascii?Q?wRVMYzVnTTXIFfsCi2CYWmVtdpioHiPcRAQQj9cAd3knc3p7waRbORFPsVNp?=
 =?us-ascii?Q?8yRGEDXJDRh1lP+yrfQQh8hmVZ+u3nZV1NLEC0NIYSX3dAUaPrcyDefR5eh8?=
 =?us-ascii?Q?kurqHe2W7J2PoWi+W/nlMLhO3y4YSBhUO2algd8QhzjuSrILkKe4HtlT/8Uz?=
 =?us-ascii?Q?NDnkUOh68VGyMkm19GB/FvOyHUvoEJoS8aOhLcghCDEpIqTU36/e5jeKHTr4?=
 =?us-ascii?Q?7ycDg2Pg/0vkWOa1mshztY+IFm3w5IqZegDJs1TU1EGkVOdq7FhN+isAw+vl?=
 =?us-ascii?Q?MVjqw3SPXZKDa3h/p/x/OwMaAFvIuyJosTHOZhAZYeccTO0v4LqrDv1IGAaQ?=
 =?us-ascii?Q?wYA5CFiPDazbiPuj+UCR2cAJtdTC41xP/G02/kRK9X4gKuZwYUHELIg+yW/c?=
 =?us-ascii?Q?qQQw7NSs7VXg1k5SV2kxz9BDJ1H/TtzrNEWd255r5Z6lDTMGwX34FwCGYZUV?=
 =?us-ascii?Q?XSzC56WatPQif2m9cfsX9bss2dRm7D5Xg4mMl9ruWiwTgmlCIOQvotHsgaET?=
 =?us-ascii?Q?IOcq500P9uI/+CXYMfZmQXjgdKmJyqW+26fygJ0ccawMeVOMszjebIrXQyAX?=
 =?us-ascii?Q?tlVDXQ3IHdIlsrfOgH+ja0f8FTQ8iHBxbf8P+DTASExd8wHUs9ojr8m6k1TF?=
 =?us-ascii?Q?Ik44DHuYgdwJ0d2wuGENnxqOtKe+7c4A14NfI+kfTxOsX9pMW/eGyXvj7vME?=
 =?us-ascii?Q?YRLV+NLrrsK+aCPang08UXDg/vtcs+IRq698nS+KGcRjWmfO/MMn8qG62MVg?=
 =?us-ascii?Q?qniAtTeiKAdTfsAFjudhAuKi+spIQ6u6qfhazwkb4kHc19hMngsT2pjncCNX?=
 =?us-ascii?Q?Pdl/Ho58+6WmI042fpoqpuTbPHRUbg3dyiS+W4Tru+uhD0lv+sm0hIDBprvs?=
 =?us-ascii?Q?bq5g16DckY7xl1/F1VPzqkhPmi/cDVLPPk2q9VnfUDc0+m+/IHLBTx8uedCa?=
 =?us-ascii?Q?okrweu+Vglpb1yjk/wwBJ/X2jyBt6Bg1g73Whkl4D6kKRR5JOSJu9Io8Yh2q?=
 =?us-ascii?Q?7ElBGQIkCMZybtBwutqjCKLlgRX3Dc1Dz+UTB/cAuDlMIqtFISzY7yWyPK7z?=
 =?us-ascii?Q?uSlaJB3PwRDUQyq0RwSRol9vXrsSK6p84CGMTMCnX8MvzG28RhvwxiHLHDJE?=
 =?us-ascii?Q?lSfJdvdLes2WcbP3ian8gillaEkZBcjs8IhCudzUb5j1DbDamHCsarawaOrg?=
 =?us-ascii?Q?fWgKYe47jLJ3Ie7Euq3pu5oUeLQeZ4hx+9BdRiRxiHEiiNs8rfJ0Ww=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H07uleiwikB3pEmLrfqbEbnlBS2O/I89E+PwSYmDd+Nn+r72XTOxa4o6DYeI?=
 =?us-ascii?Q?uHiwOBkisD9cLFm9ZkqI4MM9oWuSqsrjCtNzBIxaT5KMFLtv2my14uWItCD0?=
 =?us-ascii?Q?o4o+yzOoRqzo+h/z2l0bsp67iFKEQujXw9MWzORpU3Ph097KnrfyxUzoMZoW?=
 =?us-ascii?Q?6fiIL3YYqiq3BUnd89OzHvBjo3XEocoQIsRlUE7MFkInGRgl11n3Xbgi5V10?=
 =?us-ascii?Q?fJJ2WRAVYyeaRhcXCGaCiM7+ncNBuLPXE/9xqPOo9uOTogrX+tY9f99z4biv?=
 =?us-ascii?Q?a4Hf95qfXmODRMCxDnDwS6MSpl0JznqYc1F4zcY1IVYAfwBpnyyPX8wc1+p+?=
 =?us-ascii?Q?9D6Wr9+3MVSQaVeov3rgHICnbwGccCyXzSIoZ6HqpgKKy57ESYfXrEirtL6W?=
 =?us-ascii?Q?3EW5cjeXKKBEsSdfdI7MeG8KMFLZra+wGQVZEyHjg7vDITH2OdYyJz6lz2yM?=
 =?us-ascii?Q?IVqbSF2q/V6GtUfS0psCvokY5aRzv+M0IgYl2WlnnC/z3efemxtqI2NrxV/U?=
 =?us-ascii?Q?o3scWlCIsFCvOUWmrodvXbP+7oPvEDkQFLjTQEHqWSwZpNjYUY5VUw8r3yJW?=
 =?us-ascii?Q?7uXsiEOQmE0MdOqKr64IHKnCJFSOtFiYNH4O+WsFvx1whLmc67Yvb3h+WC02?=
 =?us-ascii?Q?qTe1JEUYL9pWpWpUOyaxqv6cYw6+zROmR7lSbdHXqTME2odsTV/Z9QCnXBgk?=
 =?us-ascii?Q?6PC+/8nxC9ap3YuuJZXk88XtpC6w/n/mVelkqwqe5wUhbZFVFyoEdbTojSN/?=
 =?us-ascii?Q?nPMZsvkqttTRFvhDBnV5HF+xhCEr+0RhQIzp+qCsUI5LWBxgmCbuO6WULJuQ?=
 =?us-ascii?Q?vSrTZiD1qg17sOqfzuoTb2PwYEH8E9ClZHokcnIwxFdMltySofnf2ujqvyQ6?=
 =?us-ascii?Q?cuD269fhUfGmH2W2mGLej7/JUQ+2JCSqy8wD1ZSaXQqL1JhVjZ/PFm9eE60J?=
 =?us-ascii?Q?qXhj9TJ3NMvzZ/JgLjVkxabHi+fi69k+R0ZTU/O5safOiHckVx5KGESJzq5k?=
 =?us-ascii?Q?uyYva82aRH8eH8POegyeQZ0xEjccE3rNfFeQlJ3PnhTttd6xV5UszhyVKtm0?=
 =?us-ascii?Q?el7aJlv+UV/kHdZ80efI+vg9yURzKGj6MrncWF6v86Vl1RyqH+L+iy8TOPnl?=
 =?us-ascii?Q?eIV8dlm4NfHtAtIF0pVzyO20bRDRZ/ykDMxyLatCwWBExp/RneMHVksUSV7b?=
 =?us-ascii?Q?DJeVN7a8dqwqi942+d1A5HvQ6fljiVBMtJshRmsTP8Td1NEvgkjSrEH/nB0H?=
 =?us-ascii?Q?tnFfG6z4xTYg8FCI1ftSQM5hswfV2+lioLwRruEZx1A6986siR/fMFpgcrEp?=
 =?us-ascii?Q?8Midlne2oVrRdeuNDEEYYYla2x8hIVBbvU/Gs6DxTIlIinztjUbKCNxnKtpS?=
 =?us-ascii?Q?rIs3W4V6vE4orQjcGMXr+pfR/uLn1SdZ3QUZIhqPiV+3ZKBYz5OILDQNxegK?=
 =?us-ascii?Q?25Q6zF6cc3RakktQcD4YRJqlfs0H9xbIIDsbYf+lYqmSZ7h2SbhvXiDJT1Yj?=
 =?us-ascii?Q?6tJA5BLudO9rtEhAO8/nJulRPEdDb4uZu4iUAeRcbqDVWp9bNP89JzuEmlFY?=
 =?us-ascii?Q?5wCWTnRu3dxWR33Tf4Z+qKjZWAnzx7XIeKA0i6HzYsUAJnWeR2jCZi5MaoVT?=
 =?us-ascii?Q?OQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b1c722-2fec-4b06-9786-08dd6c60f5e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 12:23:05.4568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BkmKJ6hhzMMS3bKkWDLVC47j0xy0D1CaNXV9hv8xgY6EfAHInpBBq/JsU11fOFEn/zJqEqOiyOanY1zl7ejlQ0KIAHWHRcYJtvWwhZu3BSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5023
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

Hello Swati,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Monday, March 24, 2025 2:40 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 1/3] lib/igt_chamelium: Add
> chamelium_frame_match_or_dump_frame_pair()
>=20
> Add chamelium_frame_match_or_dump_frame_pair() to compare frame
> dumps captured from chamelium.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_chamelium.c | 60
> +++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_chamelium.h |  6 +++++
>  2 files changed, 66 insertions(+)
>=20
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c index
> 620fbbf7d..44a169b29 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2070,6 +2070,66 @@ bool chamelium_frame_match_or_dump(struct
> chamelium *chamelium,
>  	return match;
>  }
>=20
> +/**
> + * chamelium_frame_match_or_dump:
> + * @chamelium: The chamelium instance the frame dump belongs to
> + * @frame0: The chamelium reference frame dump to match
> + * @frame1: The chamelium capture frame dump to match
> + * @reference_crc: CRC of chamelium reference frame
> + * @check: the type of frame matching check to use
> + *
> + * Returns bool that the provided captured frame matches the reference
> + * frame from the framebuffer. If they do not, this saves the reference
> + * and captured frames to a png file.
> + */
> +bool chamelium_frame_match_or_dump_frame_pair(struct chamelium
> *chamelium,
> +					      struct chamelium_port *port,
> +					      const struct
> chamelium_frame_dump *frame0,
> +					      const struct
> chamelium_frame_dump *frame1,
> +					      igt_crc_t *reference_crc,

The asymmetry in the arguments (reference_crc and not capture_crc) is bothe=
r me a bit.=20

...

> +					      enum chamelium_check check)
> +{
> +	cairo_surface_t *reference;
> +	cairo_surface_t *capture;
> +	igt_crc_t *capture_crc;
> +	bool match;
> +
> +	/* Grab the captured reference frame from chamelium */
> +	reference =3D convert_frame_dump_argb32(frame0);
> +
> +	/* Grab the captured frame from chamelium */
> +	capture =3D convert_frame_dump_argb32(frame1);
> +
> +	switch (check) {
> +	case CHAMELIUM_CHECK_ANALOG:
> +		match =3D igt_check_analog_frame_match(reference, capture);
> +		break;
> +	case CHAMELIUM_CHECK_CHECKERBOARD:
> +		match =3D igt_check_checkerboard_frame_match(reference,
> capture);
> +		break;
> +	default:
> +		igt_assert(false);
> +	}
> +
> +	if (!match && igt_frame_dump_is_enabled()) {
> +		/* Get the captured frame CRC from the Chamelium. */
> +		capture_crc =3D chamelium_get_crc_for_area(chamelium, port,
> 0, 0,
> +							 0, 0);

Does this mean that chamelium should be displaying the image when this comp=
arison is done?
If so, It will defeat the purpose of using the frame dump for comparison.


> +		igt_assert(capture_crc);
> +
> +		compared_frames_dump(reference, capture, reference_crc,
> +				     capture_crc);

Since compared_frames_dump() calculates the crc if not passed by the caller=
 we should let it.
That way we can remove the need of passing the reference_crc to this helper=
. (and also not calculate capture_crc)

Regards

Chaitanya


> +
> +		free(reference_crc);
> +		free(capture_crc);
> +	}
> +
> +	cairo_surface_destroy(reference);
> +	cairo_surface_destroy(capture);
> +
> +	return match;
> +}
> +
>  /**
>   * chamelium_analog_frame_crop:
>   * @chamelium: The Chamelium instance to use diff --git
> a/lib/igt_chamelium.h b/lib/igt_chamelium.h index d979de4a2..140d52c95
> 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -257,6 +257,12 @@ bool chamelium_frame_match_or_dump(struct
> chamelium *chamelium,
>  				   const struct chamelium_frame_dump
> *frame,
>  				   struct igt_fb *fb,
>  				   enum chamelium_check check);
> +bool chamelium_frame_match_or_dump_frame_pair(struct chamelium
> *chamelium,
> +					      struct chamelium_port *port,
> +					      const struct
> chamelium_frame_dump *frame0,
> +					      const struct
> chamelium_frame_dump *frame1,
> +					      igt_crc_t *reference_crc,
> +					      enum chamelium_check check);
>  void chamelium_crop_analog_frame(struct chamelium_frame_dump *dump,
> int width,
>  				 int height);
>  void chamelium_destroy_frame_dump(struct chamelium_frame_dump
> *dump);
> --
> 2.25.1

