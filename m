Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D989CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 04:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B0F10FA7B;
	Thu,  8 Oct 2026 04:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzTk80Yp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A45210E733
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 04:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791433038; x=1822969038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AFnSbybSt3iPzpCcAgLG/UZt+wbENEH0d6QtAk233UA=;
 b=FzTk80YpzG4jg99Fmmuu8RWRsAU2dDZALKWUuzffn3wxMq984/xaJiSR
 fRj/bWTJYrYrHQBVHJL0/hsBfM8aTdxZfPrfVV2d87ycKQw4wv6heQUDL
 spI2UQSCvvMO5C8e/Bz81X8k31FZ3Awb6MUQ8/JK8DGeoB13aCYvBrBwD
 uQsLEps+M+2RUVH9ysEuYzGpLMvEidvyiJAzlfJJiQFnJoV21nb5MrZYf
 KvX9Apxi8QbDlBwEPclmqyJV/xbz7C1oU0+9qpVCQfLf7IQpVls38MnAw
 6UMdV7nMKd+8WhjRfwOZVFNLxLg4KMjKOx8AFcaJQSZu9dusQUDgioqXG Q==;
X-CSE-ConnectionGUID: nPC6VaxES1WxlzDsXcWZ7w==
X-CSE-MsgGUID: yUNYnnb8Tpe3qp9QIWBzYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="104320"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="104320"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 21:17:18 -0700
X-CSE-ConnectionGUID: kyJY6y73TAOAmQ1tI5fTmg==
X-CSE-MsgGUID: P7SHpf+7TO2QGZ6EqEXQoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="338169"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 21:17:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 21:17:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 21:17:17 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 21:17:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgQJ3jhfPKNgKuyOSdLlBIOyRUAWephW41cSqJCeipBxc8koOKbF3eUeP/3vBbcakVq20wCzzXiyG7jcnioNLVY16xgsNlfQKB3S63oX2m5H3svIYyL/E5R32C0BAlHFomp53/PhEiYrYNpoP2rPqm1djMCmfCUgc4hvQfDghWhVzLGzP2xrQFJ0jeNz2keAjj6AmlEvTGAY743g8Ark1euJ+Dd9He1qlZCob3ewt5jY3jAJ8eO01iv2tur0Rtk/6IehVXrbV72Bnn60uFQpXMm5Nr3VYo3frJJBP0bnNVisa9KypVqNP2D7gNk37ln0NV5uy3wIqNitljnUdWt0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1110Klqdipl3aUdNgBM5H2UZvCB+DxgQwwl1gJFAFJE=;
 b=qe/TRIwN20xrf5U5rtqRrR8d3Sh3HjkE0JPwlzdRpA9EDV0yox7FaNLr50sMK/H/r5g6SPoNn9no8m7JEXG+BOvdBzzVlgMymml0xHcSPIK9xppDcx9Cc88rXh/0xxUXPlX/2LWEjKTujRBU6btKt4ZlEjtVT6oWFt0VomdaOQUCw4OP4aLs863zOmgcqoVduFRW18qrOGvVyZKg+m/Va+JzR0wnG1l+V5GxrnygIe6+pg25wzA0Hu8+pk679mQDyl0+4bEINk5AVo9iHOPIlImyO71UfMxyEZ3nCbacGiqrC7kPBn2jxd8TbGJAY+40dfQVcXgSkd7WrXDab8BbTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3293.namprd11.prod.outlook.com (2603:10b6:805:be::11)
 by LV2PR11MB206272.namprd11.prod.outlook.com (2603:10b6:408:417::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 8 Oct
 2026 04:17:10 +0000
Received: from SN6PR11MB3293.namprd11.prod.outlook.com
 ([fe80::6eaf:49d7:7bb1:2793]) by SN6PR11MB3293.namprd11.prod.outlook.com
 ([fe80::6eaf:49d7:7bb1:2793%4]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 04:17:10 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_vrr: Limit LOBF FPS to half the panel
 refresh rate
Thread-Topic: [PATCH i-g-t v1] tests/kms_vrr: Limit LOBF FPS to half the panel
 refresh rate
Thread-Index: AQHdVks5RCMfLtjGZkaGgDheEPCn6bbzCd5g
Date: Thu, 8 Oct 2026 04:17:09 +0000
Message-ID: <SN6PR11MB3293D2E426FADAE555F7EA8C90932@SN6PR11MB3293.namprd11.prod.outlook.com>
References: <20261007110108.1041866-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20261007110108.1041866-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB3293:EE_|LV2PR11MB206272:EE_
x-ms-office365-filtering-correlation-id: 56087e57-7aeb-4f06-7f55-08df24f305ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|38070700021|22082099003|18002099003|10067099003|11063799006|3023799007|56012099006;
x-microsoft-antispam-message-info: RJFYbqvL/I3kGrTFX4iTDWSW+NqU38AnMlHlBbsCBb3wx1k8LUXR8L6blZWmUVgKG9V08uwFVdkL5dKjljM6jScqTxyBpq7oZ0faq7a8/ZIxUkqln/wo130wLVwziGqF/Fzyp6mM4MkDg3EeF+e44W6DbjLyIaJoook/wcRD3E3JA+iwkEo/LGCOwLY2QSbEcd1EPRNXlEtc+wwq/YxmZW+f+77bZk7+YK7M+s6PBux9cCGzI10wcRojd05mNNo77WJPLBa6o+IQOJ4GZ7CrwBvNNaP6CPq1xdOkk+I1L8lk7/3ZLsAJE2mRKpwh5XQv3a0ohN1TxoxRMCHgfclk5i/ZE/4l0dZpTOjv7KX74BNd5FKnwyPRAWC78DzQxXS5fELFtinzpPix0ZPl47zldt4UeuNDaJl3297DcgAucD75dRtWwuGrXe1tpAaxVQaYIDRg+3O1QUEJgjboQe76iKRGu/WW+405vBST72oxhvQTwW98iIFL13Y+yYQDm+dUWr4QJvcOOXIWT62V5w2ArrPK6sR3RNaW89xTtInuFgM+8QxeLWef2g5CgGbBoni8uthp/4OFhb36Rjh/pO/s3ISSP1pFDSNsTbzLzcTIh6N6YaTcWXtQOyIwm4fvzrTZ0enefYZZ8bP/s2CjHWwHwJBR7N+114f1np+Brj9OBUkyYRqbtQMg08oR+dDE87/BXOqgdoGooMp60QLsmA3kbWOGhMNt0sjGZOX1jXpFkWk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(22082099003)(18002099003)(10067099003)(11063799006)(3023799007)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Bqum2gWX8zyKVa3URkICAJkHesR2FoTJX/bBUDltsO+CXhCpDQaizhfRVzyn?=
 =?us-ascii?Q?QhFvg5W6ZEb/19DRX0jqH4wUtwng5kqWKOvViMvwvx4diTSPm14CcfVjEYbt?=
 =?us-ascii?Q?7hwkPtsBW5wJyX48LvAAgUv0J2l0/90QwQ7VGYrtrDB8bQNiwI/sA31dqmqX?=
 =?us-ascii?Q?zalnWqRaLYgWfywOog50B2+QKNdAd7Gd4xjI4s8IPYxkxn2+i6bD7uq2rZgM?=
 =?us-ascii?Q?KonWiq7AERZKgn3l4JzmVZSd81Av9ZMnX7jVF/CZLwT8TyD9Q7FaFY6Mr3WR?=
 =?us-ascii?Q?tusaZ6Zqmtpmi5h7/xxxZNqQRznkBUGzS47XiyEFWfW3LqKXt9MtcGQ73BhG?=
 =?us-ascii?Q?0naUVeSMkrPCTVqVuty/A39fOsfAXEFezE4R8CfqEZXeQg7h817JMQexuNbT?=
 =?us-ascii?Q?pv0XMSEHaXSi/qOQe5ZJ6U44ZxfhyiodmFafVb3/Qqr27Tg2RmSzP4p+XiP+?=
 =?us-ascii?Q?9r6jk6J3/zFJHprQPo8EEc7kcbdwNnArkidirABniw+ArBMumVriewgTArpe?=
 =?us-ascii?Q?BeYSTpm/3lRcgcNfa2wS7m/T02fddXy6Fi3Q48pwiA82xW1UzmiuCTHBhCTZ?=
 =?us-ascii?Q?urI4Z+8jNLdMpg0Bf40SCI7VPxX1i0hWVU/zjgfILEp+WNRA9M5PW0mK5RBq?=
 =?us-ascii?Q?6WmgJVQT1wUfHu0y3hY6qm2kjaO6dl7Th67i4HHXQ5Hx3n4jT3x+mWWA8aYb?=
 =?us-ascii?Q?jYCYwfpM64qW2YqgL2aBDLwoyyKKzES+F9oDu/n9RU/KzLxEjq3JhbkWVUNA?=
 =?us-ascii?Q?gvr/Jh8phZvqA6Cpsb2Ee/tg+ua35aQX9A+WLRWYWwW1hX910uttOf+fEgxv?=
 =?us-ascii?Q?SZoWgKDnQR/8FOzXIebh5bEdwyk8Zzd8uC8iLI5NxXXLhuEs6klERtCXCv2G?=
 =?us-ascii?Q?76BvXIqV/cRC3U0NqwwTbIHRVA4wfnLVKIyvtmOpBNgVSnS70fj6lF5jefzQ?=
 =?us-ascii?Q?j/rk9us8c/ZbnkUeGAgiipnlrGKt8N8d4h31OPev3SR0VUx0u0Fzm2jp1fyu?=
 =?us-ascii?Q?TEpr7eMN00Q95UgHtqn9ChbUs5z5WsHQccc3gAJTWq+42ttRvC6BtDy06bmH?=
 =?us-ascii?Q?TeKTTk/mp4Ie8YMaF6kC5iV25N91iVWvNlpCK/EFWpZTcAerLAez/Kykuj5N?=
 =?us-ascii?Q?CrLyTNY4mF9qk14Z3+YDFgN0reEgIk2iThQI5PpIpWPKNkMsWCwduEmTiypK?=
 =?us-ascii?Q?oleylNAcr18d50bCmbNqyOJEkVTZbFk++iuFj/bteAsOv/Bf/SAPYIhWclMJ?=
 =?us-ascii?Q?9bO/xFhTPDV1fA+BtEibYiwx9tZfMeMQIP67WCZOCod1EUTAfaYPkzhPgaAg?=
 =?us-ascii?Q?eVE0gwIbztAezo4BjevpzUcXWrx9u8vO+nUmxEw6NO0onmnQzAtxlwWWVl9z?=
 =?us-ascii?Q?6vgiDthQRIhjAOpgVp39yvn7Vr8t60EcOon4u+dQQjWLXrGFA8MS9C0XJvXO?=
 =?us-ascii?Q?Lzd1EOgrabCW26r/522so1NsGH4oKiQnJAnQtSuALTlyG1dgmfIIzgbgognT?=
 =?us-ascii?Q?CpI3K59ZCJQTnGmbk/sUFUOxOqNmRFJIzAMauLmYmtIVkNSkPEPQ7lSj7r+A?=
 =?us-ascii?Q?RzScz5QHjxIi5t6JnMPo3Wq1t7LUZQkYBPxSOLVXJ2N/x9fwhp3nmKLXVoDz?=
 =?us-ascii?Q?MJcpkVaGjV9+6qWLcf7ST2ZJYDCux8ZC9ejLoVpz5yM94TtRtcJaZTNehxWH?=
 =?us-ascii?Q?i/77Rvtfe84y9FJ3uvXvn4wFJQynN4QtZ6XOntd2lKNwhh+a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OmBYDZT9pf+2Y1ldpvVXL0jFa6CegdC5zFW3cOXdK2+HDATp+XKmkqoQ3dw52t0dllZS3GePBST8lN9aO+2y+oV4kqp5V4kh/qi7h5jAIur9t7SYZ4GD5hPK1p+H/0V0Vr1PSj8qWRNP49zQuh2ljAZnmDV8wnvjX2ukT3s+ER1sGpnmiLNbxDdo4oLYXPBAR3rB7h7+NEN7oV39oC00omFIrFbGMIak0rlgtW3Cbf2taxQP7GF2ayZ5aXOEkIQCFSDLYHqYk4Ya9uXKRY4G7M9bsruVJmfSPZHnHQCxnXUVYNokUYgO50fBbmWt49KtXjHVkQcLpN2rsHJFHRdoLg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56087e57-7aeb-4f06-7f55-08df24f305ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 04:17:10.0809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6DMO+g/JPOy/NyfiPy2LnGiY+WYZJ9LnmFBjBFD58B60RcDfjogyLkrE5X/WILfL9dXoCB4zogg5Xe3c2gZ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB206272
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Wednesday, October 7, 2026 4:31 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; B, Jeevan
> <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_vrr: Limit LOBF FPS to half the panel
> refresh rate
>=20
> DC3CO transitions require sufficient time between consecutive flips.
> Using flip rates close to the panel refresh rate can leave too little idl=
e time for
> the display to reliably enter and exit the low-power state during LOBF te=
sting.
>=20
> Restrict the selected flip rates to at most half of the mode refresh rate=
. This
> provides enough margin for DC3CO transitions and ensures that the test
> exercises LOBF under conditions.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 9c71ab9e7..b41c58539
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1068,7 +1068,7 @@ lobf_flip_video_timing_fps(data_t *data,
> igt_output_t *output,
>  	for (int i =3D igt_vrr_standard_video_timing_fps_count - 1; i >=3D 0; i=
--) {
>  		uint32_t fps =3D igt_vrr_standard_video_timing_fps[i];
>=20
> -		if (fps > mode->vrefresh)
> +		if (fps > (mode->vrefresh / 2))
>  			continue;
>=20
>  		igt_info("Testing LOBF with a %u hz flip rate on %u hz panel
> refresh rate: ",
> --
> 2.43.0

