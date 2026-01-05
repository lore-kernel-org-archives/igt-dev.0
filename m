Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A842C2A062
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 05:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DC310E0E1;
	Mon,  5 Jan 2026 05:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKsV0gw+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E449510E0E1
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 05:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767589505; x=1799125505;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k7Cmk28VaTFti22IYQsdxnnotFsYkmG7uhn8kVeL3/U=;
 b=dKsV0gw+EoYVBM8BmlPD/pIp1+Aq8raL8M3r6KnSlWfYoztFu9Ld60ef
 5VBg/jzAqHKMFNXS5oWr4W9eJoDbxqGldLJ6EpnnI+0x1nV3NG4CTDVJD
 Lc602Ic6P8QCLrMzkjQrYB7UnLUb4W3jv7cFyORllKb9/FfMCJSiLYSYF
 l9GjF2Jp+r6fbEghpGGW96O0hSHfi5uXur9J1UGwOrGZAQoxOGR7qWW8w
 ayrtvvLknl7OUrxwxNXg3lWJYOsvvVmY/d9ScrR8sljDmiaX8Cr1V2ndg
 4ps6nODvwdNOUXvtLZya0YjD9KTcY5RsjYeeOBE3g+Q0D64usxy8nWLjo A==;
X-CSE-ConnectionGUID: AA3zDVwUSxeWDHsQcK7rzg==
X-CSE-MsgGUID: HI6LYbOWSOq8wZzwiffP5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79588649"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="79588649"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:05:05 -0800
X-CSE-ConnectionGUID: CkhdPsaJSQa3gPt5Wmf3Nw==
X-CSE-MsgGUID: liwlv1xNQuu1Xy80WurtfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202348718"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 21:05:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:05:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 21:05:03 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 21:05:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMYueYfaQzKR/mdcNjJSvCq9Y5zInoo7ykZu/wA3kYX2R3LJchGduS5YUvZ/p+imc8RyoKL9Wmsf+fdpSPi8JMyPaCDZpy0AD0cH/qdycXttdivDXW5MvTQVdKKmvF6SdZcj0827vtVZGNvwB/sqIfbka5IPFU/rJnFujJk+bJL2yiycJuXR3FZjmCPNZKQ4veza1OT+bKanOFDS1k4fZDCEIE1F8E8WKxTSvXhZWv5y8lbecET/3UnG5KiaS6KgSkeqcw2dp6R5N0Q7yGM/XsWlEqR6vSaVdMZPQ+Z4HluX8OP2PobgIG6SeRNMjQgFzZwJeeqoFkmZNoK1OuWPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hlV4z0X9kd1yTi1TN5Y7MrhnZ1EEf+aNQA2+0o7li4=;
 b=xvxEDtYE7jVazPHRJyfqZRMNTDG2MblAtY6kRdj90i6vIbpOHUliMvtMiD35WXrlH9m1ZeLpWJucUi8J71zWQZ6MHtqWJEkFQ/O6iRSu3/Ny2jAXWjvI4IYvrYGkWVmWeH0gytmNFIT6joVU1+yUpAERxVQcdD0XUBEOI+zi0HpalqCBKzt0ZAGsTXuVPqzGsluS7wuKu1Rg0g7WiU0dd1tnTq3EaoIj0o8/M4TNh5lrhY/UBthjalz8Zp79yCyw6GOokO09Ar11FUFU1WLZjQGQQ/lbjG2Ti1685p8LjD+EnOrraTMQeK3DsmxG2e14cTSG/mIkmhgkjXOeWwR9OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH8PR11MB7071.namprd11.prod.outlook.com
 (2603:10b6:510:215::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 05:05:01 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 05:05:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v7 2/6] tools/intel_hdcp: Helpers to get/set HDCP
 and report info
Thread-Topic: [PATCH i-g-t v7 2/6] tools/intel_hdcp: Helpers to get/set HDCP
 and report info
Thread-Index: AQHce66IBEl1XT0WwEyom0kUT5smRLVDCYQw
Date: Mon, 5 Jan 2026 05:05:01 +0000
Message-ID: <DM3PPF208195D8DB924537F3F6EBEFD0237E386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
 <20260102060835.89725-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260102060835.89725-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH8PR11MB7071:EE_
x-ms-office365-filtering-correlation-id: 940ffb62-f10e-4a3f-4fd0-08de4c17fb54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?+6xP9bTnqGNHlg2ON4wdQnkT3m4Ic5AiX59+M3bmGRuil4bA57XGgRy6cYBH?=
 =?us-ascii?Q?5yoW9LK+Bj8ZAoXfd7+Dl4QKeP8RQE3JPQPV5fTEoEJNUNtU1/0Gb+tSXJoz?=
 =?us-ascii?Q?DueSWesufBBrfEdx0DVaSVzV0Mccrs4CyVKj/YqW7gSk6B9bRy4rvBEA/Ut8?=
 =?us-ascii?Q?gypsdVvHFn9xrclD7DUZ8cZNMikBK9cD4gQ6I2So+Z4zZNb2pwJjDbBaeosP?=
 =?us-ascii?Q?ms08D46jwh6sbvM/mKBuIOiKyH/lzs00tvjcarT2qNVwxkFck4QImeMN1YTT?=
 =?us-ascii?Q?3LURrffC7KBQt/OkWnB36GC+SUO+v45u66KGwc/U2K3+YhBCOtuu9N34Y5gF?=
 =?us-ascii?Q?4FsLVVvGHo5lUIS+UKPCLs75ATm3N84k8i8FQ7/7Hj4rx3YNQVUfYKt7qhO4?=
 =?us-ascii?Q?f+rsuwyIOvvqueZaY0Q6iVZ3A7wT9gefdPk5sb7h4usEgJvEKNqXtzz5+rRE?=
 =?us-ascii?Q?kVIr9zB0k2KH87FEXC4N8D/wv9QaIfKAnC189TfEUuuBy0w5UVhzKkDte3aH?=
 =?us-ascii?Q?LUtxHc/siKzmserA9sRVY0QpQ7G3lYFieOVWbu4BnpLRmoSHJA0+bIAmFzk8?=
 =?us-ascii?Q?V6Zk4DPBfTbupvUd5OMhJbmTpfv8XSz71vRR91e+WBYKHljsIrOjArVYGiZh?=
 =?us-ascii?Q?PJbAY6G4KPRes1ltgBr9PAHNDUILrv6oRoYgn9C4yIagKoEzMQMCGLy234kV?=
 =?us-ascii?Q?rcwKUa2IM0yC6B3xi1w8A+9hem5on2i7PAM+Kb0GtAkQVAsiaqC7GovE3gLI?=
 =?us-ascii?Q?TCeI8qI4uhOT/wId9kU6Tv+vkWU++7hzX9HwQxKIUE1AYGjsa8aUbXnWEwYc?=
 =?us-ascii?Q?03br3erKw/JiOH5CkjVzd40qp+BXRdVekggohMwmnoBaaId/ubDJm1fvPQU0?=
 =?us-ascii?Q?zqG8D0P/mOaV32z+KpZ+tio/qVpJ+x65+NTqVbpIFqQfvw7atj9MznJ1s74U?=
 =?us-ascii?Q?pIli6AoN1Ud9kNcFWN7ZutvSpYN3F3HTkZ9SVkSXyU/Q4MYmZBJ1+5mewGXc?=
 =?us-ascii?Q?JCkkW7E6MKfQZt9ToPVCaL966yqWWHs72ZFrume02nTipLbxInonhNJzVESg?=
 =?us-ascii?Q?0GGAYMxCdLey8FdwUwUQZQnE3wNo2xthKjGKqIBLy7NJAhh5vCbEdKGyXNko?=
 =?us-ascii?Q?ntw9SN7QBP1lK2Y0xE+zmYv3dnGBM8zI/TCmW9PgZMp2LbKT45aDYoy8GuFF?=
 =?us-ascii?Q?ePdzSh2ijslN9b9WtcWy/bCmn1Ml1mN7khFTp1jWP29t30cAQSMAgvPV9LWd?=
 =?us-ascii?Q?Pq/8vyFjp0mFDmUFuWEquOmJemv+08s95HhTtWfnHRswj317aRAexaP12NKI?=
 =?us-ascii?Q?ODtwn4XAOMEAdMVBQOwDv2cQcxTn3kQNRGgaveRcxmHDcdL44iHp/iEWTxcA?=
 =?us-ascii?Q?Sbf5PF0Uzqz7fX8/HLBDUfByPUmvoWLAIN0gEsTreuOURhUvdawq0HJKqP12?=
 =?us-ascii?Q?M8jbo4mYE+LlDjmT9KfgpZ+7RyeynPBpWnekQQxucnPjeIeCztU4cX5YjiZw?=
 =?us-ascii?Q?1tx3dMTud01uLeHjVtRe6ykBSLxO5dnH4I47?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?djZvtW+//Bnyj7YL+Y4jzlwRUbJKPMfTlKBcMsisKaGvqsR+7Ke+9Rg0IS7B?=
 =?us-ascii?Q?4FMHmsvOmlh49rr1f/Z5vOtRTUhuk0u/lxHX+UqUGFlCyb41OkbaTMiUnFYi?=
 =?us-ascii?Q?GPiuwHlCyu8WBKjxY8dw7DbFBYex/Q3bgTv8SDHOd/72rm0ZfBxc18JDSny6?=
 =?us-ascii?Q?/i7k+0AEpqu19CGeGPTe1ZOkFTmPbIKY8LnSS3VFZEliUy3u6IIif27LdVfo?=
 =?us-ascii?Q?+05A695g9iTdNv6ADrJnrWyXvLx4vbWrgqC1GiH/XzKdWtdaaux34SMpKE9S?=
 =?us-ascii?Q?2+x5GfvSLj2HWV0GcPju8eJOCqFkHNR1zaV+H9K+DfezIFR6Ovb7xQuqVEE2?=
 =?us-ascii?Q?X7tgPnjFp++WkJGxZkJRQ5XW53qcMEVTSr9i9Pw4612v1YkXcBN8EG+LV/O+?=
 =?us-ascii?Q?rVy+kto6BKs15JbtHB9BoFpP7Jeka9kg9iLqxpD3JEJKtV+phj9mFJm4iFQ0?=
 =?us-ascii?Q?ziquJ2iBMGys0mqblbVtr+cEOTcmSsX6xKzWlUHpS+17uHpA0P1N9xC7RJLg?=
 =?us-ascii?Q?yQ14TbusM9byPJzXjnthlYN/5iuRxXrmPXAJSdh8ZbyrmxFzAeZE3Z7P2PYL?=
 =?us-ascii?Q?aJz/GxI+BqNwQdY2UQ6aOniexe/TQDo95Pd0rt+43Fa/kAKYlsognT+bWKUw?=
 =?us-ascii?Q?sxDsYLyOXbY5y6s7UjirbY5enWyw9NsFcSNzg3qYCrW1kp3bpBr/qdTwJmi7?=
 =?us-ascii?Q?ypW3WwwDrJB5Vw2kt7tyODY/ZsPdxX/jlQb+vrrkrqfgXoLs3qaMBlrDOD7B?=
 =?us-ascii?Q?9EfAZyh6yt4cSVl1fQ3JptyoPdScPcwjFDshhkI3GuB8TxkZ3i3DAiihl/dC?=
 =?us-ascii?Q?oh9494TcU3vKWoTaWOK8A1Xq+oz1aA9zge3qxRCtWEcuCHTybZ3w+pfleZu4?=
 =?us-ascii?Q?ptFQnS7t95t/G0irKMXzOtf5SXnFWNletrqQ1crwe+UVsiZ7ig0YtN0uFUud?=
 =?us-ascii?Q?9I51AOcLoh3+AOptBvUXWU9dD55NpzGMZZOQEj9+RHcL+jI6ouymSpg1hAbc?=
 =?us-ascii?Q?Uz9IohIMZqWjQ6ygHeAgtFA6lfrkeDxfgRSzyYM13sYHMuVZaStlodafMW2P?=
 =?us-ascii?Q?s3fvwADJLIIg2iTz6Yv38MSpqOTzwcykkyq/oMSyPRjyRuamHrGg2SqyDv0X?=
 =?us-ascii?Q?kWsIn/swKAWdXlq055bys+aKg5EXFUYzZXc17UfPZMhPdPWwIwXoPmHqr7wu?=
 =?us-ascii?Q?icSbuJ75h94RyxA8TEMd0MQsJKhXCO8UZJjNlX2lxO2EkgrHGbKHGt2iorFC?=
 =?us-ascii?Q?7MxqbGAJE6agM8PrLSf4rvWjj0uF3iT/knFXM4hnvr31QLnkDJH5jW//Hm1b?=
 =?us-ascii?Q?FNJFejsPypP3wfFpbEiqR/6P8TmjfzRpuKZlY9DMU6tkMQnP4lJ1va1HqhG5?=
 =?us-ascii?Q?kXs+/sELmk2w2YRCHf0Hsz6E8+DJDGioh2flaCpA5qO32NEVti6i/Xd7L2c6?=
 =?us-ascii?Q?5JkFJ47bZ36N9uID2X5ttbYnHuzLu+VqpQtWpDeCLsEMLwVUBcx3G8BV+NWX?=
 =?us-ascii?Q?zcIDa497BtuUrT6IWrcjNesDWEcgenFGxgS7pPXkZTN/eAi9JY7JQ3YsT1Fp?=
 =?us-ascii?Q?CDX/Qoe7wKzFy0VvJgsufyHOqUfo1WbXqRpigc+1DJLbuyZ4Sbqsvb5vqC80?=
 =?us-ascii?Q?1PZ7CjFiAyBTh1NcovM7/tt6xD0LAT6C1CRiywGC+HQwnzHhjRaUV8hmqJzF?=
 =?us-ascii?Q?7nIpb37zEA9H8BuKRHHDkQWYfh43QiT9MF+DcWh84e/pBurTHze/Hprrvyo+?=
 =?us-ascii?Q?5FRI01yupw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 940ffb62-f10e-4a3f-4fd0-08de4c17fb54
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 05:05:01.7522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OBjRzmJ5znVAxUeYfw5ZNjrERffqTNfj+6OBgcKhDOkLy7qppB3E5BD0GiHmyMSPKy6ryeuxo6Xk38jcu+i3fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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

> Subject: [PATCH i-g-t v7 2/6] tools/intel_hdcp: Helpers to get/set HDCP a=
nd
> report info
>=20
> Add helpers to set content protection and content type and retrieve the
> current HDCP status. Enhance HDCP info formatting to include HDCP status
> along with version.

Three different things happening in same patch can be broken down to three =
separate patches=20
1) to change variable name from c to connector
2) add helper for set_hdcp_prop_data
3) add helper for get_hdcp_status

>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 114 ++++++++++++++++++++++++++++++++++++++++---
> --
>  1 file changed, 102 insertions(+), 12 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index
> ae2520b03..129968b7a 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -31,6 +31,90 @@ typedef struct data {
>  	enum hdcp_type hdcp_type;
>  } data_t;
>=20
> +static void set_hdcp_prop(data_t *data, int property, int type, int
> +connector_id) {
> +	drmModeConnector *drm_connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id);
> +	igt_output_t *output;
> +
> +	if (!drm_connector) {
> +		fprintf(stderr, "Connector %d not found\n", connector_id);
> +		return;
> +	}
> +
> +	output =3D igt_output_from_connector(&data->display, drm_connector);
> +	if (!output) {
> +		fprintf(stderr, "No igt output for connector %d\n",
> connector_id);
> +		drmModeFreeConnector(drm_connector);
> +		return;
> +	}
> +
> +	switch (property) {
> +	case CP_UNDESIRED:
> +		igt_output_set_prop_value(output,
> IGT_CONNECTOR_CONTENT_PROTECTION, CP_UNDESIRED);
> +		break;
> +	case CP_DESIRED:
> +		igt_output_set_prop_value(output,
> IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> +		switch (type) {
> +		case HDCP_TYPE_1_4:
> +		case HDCP_TYPE_2_2_TYPE_0:
> +			igt_output_set_prop_value(output,
> IGT_CONNECTOR_HDCP_CONTENT_TYPE, 0);
> +			break;
> +		case HDCP_TYPE_2_2_TYPE_1:
> +			igt_output_set_prop_value(output,
> IGT_CONNECTOR_HDCP_CONTENT_TYPE, 1);
> +			break;
> +		default:
> +			fprintf(stderr, "Invalid HDCP type\n");
> +			drmModeFreeConnector(drm_connector);
> +			return;
> +		}
> +		break;
> +	default:
> +		fprintf(stderr, "Invalid property value\n");
> +		drmModeFreeConnector(drm_connector);
> +		return;
> +	}
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	drmModeFreeConnector(drm_connector);
> +}
> +
> +static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
> +{
> +	drmModeConnector *drm_connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id);
> +	igt_output_t *output;
> +	uint64_t prop_value;
> +
> +	if (!drm_connector)
> +		return "N/A";
> +
> +	output =3D igt_output_from_connector(&data->display, drm_connector);
> +	if (!output) {
> +		drmModeFreeConnector(drm_connector);
> +		return "Unknown";
> +	}
> +
> +	/* Only treat disconnected connectors as N/A */
> +	if (drm_connector->connection !=3D DRM_MODE_CONNECTED ||
> drm_connector->encoder_id =3D=3D 0) {
> +		drmModeFreeConnector(drm_connector);
> +		return "N/A";
> +	}
> +
> +	drmModeFreeConnector(drm_connector);
> +
> +	prop_value =3D igt_output_get_prop(output,
> IGT_CONNECTOR_CONTENT_PROTECTION);
> +	switch (prop_value) {
> +	case CP_UNDESIRED:
> +		return "Disabled";
> +	case CP_DESIRED:
> +		return "Desired";
> +	case CP_ENABLED:
> +		return "Enabled";
> +	default:
> +		return "Unknown";
> +	}
> +}
> +
>  static const char *get_hdcp_version(int fd, char *connector_name)  {
>  	char buf[MAX_HDCP_BUF_LEN];
> @@ -69,27 +153,33 @@ static void get_hdcp_info(data_t *data)
>  	}
>=20
>  	fprintf(stderr, "Connectors:\n");
> -	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
> +	fprintf(stderr, "%-4s %-8s %-12s %-8s %-20s %-12s\n",
> +		"ID", "Encoder", "Status", "Type", "HDCP Support", "HDCP
> Status");
> +	fprintf(stderr, "---- -------- ------------ --------
> +-------------------- ------------\n");
> +
>  	for (int i =3D 0; i < res->count_connectors; i++) {
> -		drmModeConnector *c;
> +		drmModeConnector *connector;
>=20
> -		c =3D drmModeGetConnectorCurrent(data->fd, res-
> >connectors[i]);
> +		connector =3D drmModeGetConnectorCurrent(data->fd, res-
> >connectors[i]);
>=20
> -		if (!c)
> +		if (!connector)
>  			continue;
>=20
>  		asprintf(&output_name, "%s-%d",
> -			 kmstest_connector_type_str(c->connector_type),
> -			 c->connector_type_id);
> +			 kmstest_connector_type_str(connector-
> >connector_type),
> +			 connector->connector_type_id);
>=20
> -		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
> -			c->connector_id, c->encoder_id,
> -			kmstest_connector_status_str(c->connection),
> -			kmstest_connector_type_str(c->connector_type),
> -			get_hdcp_version(data->fd, output_name));
> +		fprintf(stderr, "%-4d %-8d %-12s %-8s %-20s %-12s\n",
> +			connector->connector_id, connector->encoder_id,
> +			kmstest_connector_status_str(connector-
> >connection),
> +			kmstest_connector_type_str(connector-
> >connector_type),

Why don't we get the current content type by getting the HDCP_CONTENT_TYPE =
property
Like we do for status

Regards,
Suraj Kandpal

> +			get_hdcp_version(data->fd, output_name),
> +			get_hdcp_status(data, connector->connector_id));
>=20
> -		drmModeFreeConnector(c);
> +		free(output_name);
> +		drmModeFreeConnector(connector);
>  	}
> +	fprintf(stderr, "---- -------- ------------ --------
> +-------------------- ------------\n");
>=20
>  	drmModeFreeResources(res);
>  }
> --
> 2.34.1

