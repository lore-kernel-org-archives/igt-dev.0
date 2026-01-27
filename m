Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274CED2D8FA
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C974310E0C5;
	Tue, 27 Jan 2026 11:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIv8Npw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E95110E0C5
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769511707; x=1801047707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KyX75CcZKjdYpZ5VHekmN7lb2Z7g2B6rmQPtCmnqMww=;
 b=cIv8Npw9LFcOH4A5IX/fUR/zZyVvWtOVKdjgxZNjVXA62lNRz8Ha8rmQ
 Q61ctQxV5HLN+tTrs+jcVzrclFdFPyLg+r6SDqSO+mayKPZIAZ7PEriow
 XQVIR5dbY4pnLi97vGlLCfjLRDFaF5Jt1nuVjB0qod+1QXo2OjQaZS97i
 jQsDk/vpjj5b4HkIzi3g2unxZXJIw0GsU/aUcA2xcrmb9CUBJiU8K25F4
 0jZWMI1cxR170jj6a67pUBulZNuwDuk1AFbconCZfnkn7/EwO45iO6X5w
 /ARZZ4dI5fzKwBRAMUJcMc4UH/hS9macy4i2zwTQuhJ3xd9UqOXAoiv8s A==;
X-CSE-ConnectionGUID: lVzDToZPQN2jm8rWb2Fprw==
X-CSE-MsgGUID: wmZ8qmBfSEyPE+6u0gr/0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96168388"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="96168388"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:01:46 -0800
X-CSE-ConnectionGUID: SRpPfGfpS6+qoXONIwLFhA==
X-CSE-MsgGUID: ZOOq7BE8SlSX/wFgXmXr4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207740497"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:01:47 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:01:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 03:01:45 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:01:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPT7b1x138DHHZOz//jj/U8iw/uCbWxRtpACFYqbHN6wq+9fJmvI1UIXl1hXe2rZ2iE8M5k3HrIZsL3oi+DOfPsnftOIKstOoEWc5Cp/yCv2HoVbpDfQsvzVFewuuTT0zw5SiB3QVi9JdKF3TCe3KGdauMstx7JpSotZmgQfF5C1zc7NMWwhDbHkmLiGktNR/LHWs61et3LKCqVdp7ahcSVo3b6SKhLpk5SKCh3UGVtAZ07RE5kUMMEaYDCEuBqtJmFnaD8jFIwNVQq8d9qfnBRczV48J+9JUoKTBGsdrpc3Az6oxy1XqmG4iZA/G0C6uQSuBQdhoE9gWENaNwlevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9YJrxKUgsbmfqZlW9hCiXLjRVGNe0LCLp1A+fiHEXY=;
 b=kHyrCSqpAtPiLPppiSO3Ob90HoyY0FFQeDCxOmctT0liikkbFxVoLl5V9/63I9NqxYJiYcv4Vi1ZIBfz88+fRxcw3+oTIjUQRCTL9Nmc33RpBfj+mCV+b2FeGnx8IzO9azapU0T1TPzIAYPXttx3Xf+oobwX7XGWR0XECzM5mXffX4ASYekA8ZTuJNGWJqsDAEJJ2S4PesPBhqgRp7OPi2T+xS5T7J4pOOB6kFlqmfmb8nYWL+6mJV9Oo+knLGHPJ2c+TT/lPH8grZOCeAMlHIqkvyDNE9iKJcbIyjc/O7VHxgPdK6lXurJBzxZXuXIjnmw7xNr4Y1WNaruOMZnk3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CY8PR11MB6963.namprd11.prod.outlook.com
 (2603:10b6:930:58::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 27 Jan
 2026 11:01:40 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 11:01:40 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v9 03/11] tools/intel_hdcp: Function to get valid
 HDCP output
Thread-Topic: [PATCH i-g-t v9 03/11] tools/intel_hdcp: Function to get valid
 HDCP output
Thread-Index: AQHcj3Hirq5v5HMwckKYnTxVJQNrUbVl2YFQ
Date: Tue, 27 Jan 2026 11:01:40 +0000
Message-ID: <DM3PPF208195D8D8903EEE28A745279003CE390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
 <20260127094257.572736-4-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260127094257.572736-4-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CY8PR11MB6963:EE_
x-ms-office365-filtering-correlation-id: d702857b-614a-4748-d46a-08de5d9372d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?ACu1RDC6ZhVo/XPdCDgHIcpAwJlgFGo5KQF3qXt5zMdaJCbhe/hw5P3TBJyQ?=
 =?us-ascii?Q?WuqO8mQ8Hq6DqZrsfTaoVVVTccrfZH4Ga7hNP28ebPGkoqakMHEC3pUguWAu?=
 =?us-ascii?Q?e4F1IQARJbeOWaQ4v1Fq0hfMm0g7EzxN6XlZFN8oDrH65U4QrV1KEhz71djC?=
 =?us-ascii?Q?668o9zy5EZrdJDAUB6M8pymodxIdlfUbOyHyLx/1X8rj9bvrwcsdW+f61zJA?=
 =?us-ascii?Q?6Lm8VjfwqCpiiKSWQR+7MJ8VTf90V7SzMriGZv4v3gHdrv7c+OWXfKIzTRM3?=
 =?us-ascii?Q?VdlQ2vqFUFFQwTOFomgaAmBqv17yVjAYYJXMbJvQaYcbQJLdst/4c9/T1h3S?=
 =?us-ascii?Q?rzQsYB0if7iuixY2BVuwACWBx7Xd2Kiio1Nwo7xtOBOuUkiQmjNWSsDZtmAO?=
 =?us-ascii?Q?ZLt+m4XIUhhM4H7QtlFoI7M/BKpHa+Zz06RPK4S10J5Giv+at4VIbAw5oxXC?=
 =?us-ascii?Q?pcbbsKzr1/Q+iWqxorkFxcJT8P4NiCf9QZDc3ifuB7PI5etE7k6dSsgqkrA9?=
 =?us-ascii?Q?yuBvr/4xSpE+51WiNi07xI9OvCtOFsb09sjanbTeQq8DpqqsazrPIn4rX9hR?=
 =?us-ascii?Q?rjhPW+naYGvLuvzRg1oH6YCylXid2Xa+c5f7ssRnuv4K5PaCT2FflfsaWo9k?=
 =?us-ascii?Q?atr5/7YS3IvvDosUQXMjQiVk/F9BITEmvTUDH3zsoNvXV7lcYEaJEzYVnxa4?=
 =?us-ascii?Q?9FaVekGZARsvakKFzfFSYu9cVUn1x3+qhzN+1aU3stzOL5oXiVi1hTNeZCAj?=
 =?us-ascii?Q?SlsLqJqS3KdJg24QuWQ1bY2/zuo68k6/q0H9BehSg0DpXg4UeZXb4GAX8RSc?=
 =?us-ascii?Q?cz6FtZtsbx9KnxJUpnzkte+rV9x0b5j73PR1KORveT7bSB04s72n0RxVz31v?=
 =?us-ascii?Q?oUgevNa+YlV+puSArHP8qQt/9H+To0UjTAdxheLgfmvlKfaGtj3JfZxHyJyu?=
 =?us-ascii?Q?uFZiXSqE71/jH26Q6IQWDa/rMgme7+FNheFwPeEzw+f6S+W5sz28I5QvKE6v?=
 =?us-ascii?Q?nMTfZ3Oa3C34O0EsR2pcRV189liprzZticANFV4UFycTTTWpMMY90PTIJmqO?=
 =?us-ascii?Q?ANKIHb/lrsinv1FdX6tVTBLByAUFpfD3r5SmzGJ4fBuHNhp76yhhZHV1oqd4?=
 =?us-ascii?Q?4N4pWvl92jdz7iyq79PcOVZ/UsOI755cvm3WNN64u+8QROBG0JK/jjxWDlRh?=
 =?us-ascii?Q?nYeKMngCyLmaxUPcZULgxHIaOsbuPfema0SPlfoiGb+H+1pwWW0wKueBIZGN?=
 =?us-ascii?Q?WK2bYGejfjTZ+L0NR5onwCVKxfv8YIWuYuen3mvvLIzunS9z+riZlH3BlXvk?=
 =?us-ascii?Q?6xtyUqWkP1qQh7bohrwk2WfmHuF+B81/21YNN83oGuXy4ScKiLMoVEAXDOv7?=
 =?us-ascii?Q?/vk17pmJEgrtcn7rAdOfGMaUv1QmSp7FOF1cPPRwOZkO8ERwTvcsRbB7RR3+?=
 =?us-ascii?Q?ZZ7bueFwQbvxt/ZZTlWsbE1mDlnx/11sDmSSQreBUj1pWdmiYTCMLNpFEFNw?=
 =?us-ascii?Q?a3RBvZZDXmS1Kflbs5ePAqCTUxvnhKeBEYGOnRtBcDlYYUkJ5VH/v3wBlXSU?=
 =?us-ascii?Q?F+uH6mVF6yg8WggEKbC9/HyD+xGNcviX+DcOlrfj3Zl6LZ71QZscrlYpoZAe?=
 =?us-ascii?Q?w0Ee9xhuQuUz5svMxYxQh1c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RV52O14dPoLOZ7LiHbxMp4QGy+0z+gn94Of0YuXitaPIr6hMzrncBkueW2J6?=
 =?us-ascii?Q?JoMEuhyIUTBktZz7VOzse0VsapiyPH6UfcGzb+viV/95BmujzcFTb9MU9tpn?=
 =?us-ascii?Q?Wjy1VlZSfvQr5SVa1lAsXSWJpKF8efGWTwoTLUvwmEp7j8u8jwCBCzlE6Ub6?=
 =?us-ascii?Q?PUrSG7WFqpObadYtigiR5tKhm3naIasfcsjHpid93J9ncwCS2jauIpJpZ8ig?=
 =?us-ascii?Q?AG9JHMhuqn+OK1d/N2OqIVcPIRRWk5zdFNSD+vrSGGo1jKvIgy2R88vkoAGy?=
 =?us-ascii?Q?NwNjtAi6E01x+zTnx54GZlSxC/mDO5+Rn3sbPBKW44VGwvpdIhGtEZYNM3oN?=
 =?us-ascii?Q?rl5S1KZZvMOOeTLvFrE/p0fgMP8x4DD44ZkpGWJnJQu46E7J7pByYPsSVmbC?=
 =?us-ascii?Q?85HaOYCJRGLJfWlFq8XrCQO1kphZOOsgAiwTezr2YiaXzl2ZhofKE2ewH3/N?=
 =?us-ascii?Q?opaVTgdnJj5CPMBmDJRJwYqKFnIvpQhkQqsC7lsk6o5nDTJJFC5mHPQd2sJv?=
 =?us-ascii?Q?zPiFtgNWF+XrReh38PBVs8n4fstlJIujvJSeeIueJFPjV7ueRMOickV1caR5?=
 =?us-ascii?Q?Fo4x3pkc+nOXBU6GCXJczz/RAvFyQsDnOdlZMJ0zZ6m65npi4I3PRFHC23vF?=
 =?us-ascii?Q?wAUQ/sKS/PRmAikS5IFDIWysb+DX7XuJCkNVkb6EGl4CzaTy0N1BlIieEfvW?=
 =?us-ascii?Q?gOw5fBF8vo+KhC/N3skCh6DPj2h4GE/2ZhPW0cPacnSSuuSikVjErHkzFnxF?=
 =?us-ascii?Q?6g1s76j82MIv1GqaMwQonOzogD6CyB0SjGxp4EoeypC7P33wv7XYnFFNUuzw?=
 =?us-ascii?Q?Nz+JmWTQzKMpuQrf4ka3uel6xXAmjx7J67f9AbZySZv3INP/RzyGDkI0WslC?=
 =?us-ascii?Q?EE4nTfmUHRPkSpcCXueaHAflRdR990AMW+y4NfMYtgt3T2OQxybrYFplbUXB?=
 =?us-ascii?Q?Q0u4wL21l40cxkXjW1OSzgAoyPHH4ZJYFUBUqeYBM9Z5OKrRxyVLIso8d+Ml?=
 =?us-ascii?Q?k3ptHAFVARP/ThJTWNzCAKpkgbizR+8Yob6egQ2OUFBbcuIBWYhnr+Xk3CXi?=
 =?us-ascii?Q?wVa5FulTb/bwn5Ar8pl5BBHZL7mcofs1zrsbAdsWqIQYzcAtGtTQcSvnG4/P?=
 =?us-ascii?Q?tRPBkT1aPVGS4oC+TqLiV58RJudKplUD0FKHVwAfnfevULCApSwILZ8WEzcE?=
 =?us-ascii?Q?7SAD9ZEWEOhv8th7LKR29IWccc5CXuaNbYi4Wh9VCd33bPuIq3R3oHifOYUg?=
 =?us-ascii?Q?bSe+7Qg3TtMKdUWxf609cdhZIWm5pCX29IVEi9izcMigf9WF+8myz8cAJTl9?=
 =?us-ascii?Q?4v5a9Bcyib/+GJhByaeERcDJ6u/6nmlZDb3a9fErnbdgjRd6i3a1Vz6lTisD?=
 =?us-ascii?Q?pjVweMOwj7LEWPB4b6i2feLc2aar0/meDQQHeKZo64uRV1b9Cvx7KKQHN9z+?=
 =?us-ascii?Q?cwRreGT+ByDSfofUq54VwXC119s1FpsuLl+4EI4uSxYmndIzmBxzsX4lfEGX?=
 =?us-ascii?Q?2GkAY6Ls32A32aHVVfzwuXyq8lPr9EBjKN27K/tJ0SWpd/gshXIS8us8Esh4?=
 =?us-ascii?Q?vlcLmwjUXHOW/7/g38qZleHecvHgWx+muXPSX5XG881V6n8+dkijus3XfuTV?=
 =?us-ascii?Q?5XDPrpO4oH/xlKFxSwaX6lqXMUm4IQHmitHTIMTEfU4QqGwtVMj5eh8nCUqa?=
 =?us-ascii?Q?S9ZCw59j19jLTkCHx28ji/8LxiAta7rMOeDbzXgLPPwJzP8uOUIYjfSPI61L?=
 =?us-ascii?Q?Atx6RTWKZA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d702857b-614a-4748-d46a-08de5d9372d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 11:01:40.1605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y8F3pvfPFLVpTeJ1qd3Zum6khrN9ikOFuuApJ1eNIcRSK3GuNinfLMgNlhIkKuGLQMQWKlovB3RQGsJOjLqwMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6963
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

> Subject: [PATCH i-g-t v9 03/11] tools/intel_hdcp: Function to get valid H=
DCP
> output
>=20
> Add a function to get valid HDCP output for a given connector
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index 6ca067b41..2b3=
8c8cf2
> 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -31,6 +31,32 @@ typedef struct data {
>  	enum hdcp_type hdcp_type;
>  } data_t;
>=20
> +static igt_output_t *get_hdcp_output(data_t *data, uint32_t
> +connector_id, bool *is_valid) {
> +	drmModeConnector *connector =3D
> drmModeGetConnectorCurrent(data->fd, connector_id);
> +	igt_output_t *output;
> +
> +	*is_valid =3D false;
> +

Extra line not required=20

Other than that LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> +	if (!connector)
> +		return NULL;
> +
> +	output =3D igt_output_from_connector(&data->display, connector);
> +	if (!output) {
> +		drmModeFreeConnector(connector);
> +		return NULL;
> +	}
> +
> +	if (connector->connection !=3D DRM_MODE_CONNECTED || connector-
> >encoder_id =3D=3D 0) {
> +		drmModeFreeConnector(connector);
> +		return NULL;
> +	}
> +
> +	drmModeFreeConnector(connector);
> +	*is_valid =3D true;
> +	return output;
> +}
> +
>  static const char *get_hdcp_version(int fd, char *connector_name)  {
>  	char buf[MAX_HDCP_BUF_LEN];
> --
> 2.34.1

