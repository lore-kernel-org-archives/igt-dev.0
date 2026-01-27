Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E6FCA6C9D
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 08:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D1510E01F;
	Tue, 27 Jan 2026 08:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBRFHj5a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C64010E01F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 08:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769503866; x=1801039866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R9887Sy5A7gudcTKcX/uZ4PQDGacbaCdEoLmU3g+7Og=;
 b=mBRFHj5aKtaWtpVHR8mujGrkhgJKsWoxHg12JpdgU7OP9DwQZjjbivwk
 u8sQaxhQnNd12oip7jvbFJVewBraPJVCmiF1SWvi3Nh29P0aCD/LoMGlm
 HvVv4a73r8IuF7n/tAWVi17TZGZJ7pwU55RluggYYvoJBr7ZL7thhGks2
 PiXeFfB3QGgLW8CzMGrGYy2ohVn1ePbMPAIwcrQaTwKRYSdR+uWyMXg19
 Nu/mvBE+wiG2w5ccLvHGy7a3ARJJSu8OybVmzkIFRCoISZXMIUVasVaGu
 h8NBQONw0DYDTHcTiUY46qXVpXgqdHvsDrjNveXN/cEhnp/B586SjwZPK A==;
X-CSE-ConnectionGUID: N9bV3I+EQBaC5mw8z1R7pA==
X-CSE-MsgGUID: 2xKTWfy2Tnmnq+gk2eZypA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70751942"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70751942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:51:05 -0800
X-CSE-ConnectionGUID: xO30ORW6Qwic10URyPDLGg==
X-CSE-MsgGUID: sblhQ2cUR7m7RMrNlr8fIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207720803"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 00:51:05 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:51:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 00:51:04 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 00:51:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FK7Vo1/R89Z1lbrtaEnDzppBYkkRyW7yXY6iVcOt2EIRTcRTnzyTN5scizuNVTCjFAMmnT5xtvEBi98ZztR/DOt8xeIYdQyn2/wnm/Qk2UHxhYFjooa7oVaaIocBQNz0UYU9VV9un4hX4aZu96ON2rSe2igoWqjEDBrHtBDdCAWj7b9s1qpeog21QIbGo8981sVeffbJMBqBP1XGX/utdIGstmKxKT1lCLDKAXHLUuk5lcUBqQZFHwvG2N48lmiVKHPBdsEzsaY13FQuRJicR/4235JrTCiAK1rkheEDBTWzwtMZLgjPmVNYwlN2C9BukT6hLH65pGuQzhlHZSAkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YaOXn6yBHU9rAcy2Qgkm0f+kQ1CNMC5tjEKQyPFUPg=;
 b=GtxzAKljFjAFgDkZWFGjnZrdCfZuR3UvY506iQA1xOabDOX+NtUGGdDg6MF7D6i64F9ANDOnbMkRr44kVGRub3D67RoL38HbTSUHmaz6JOGGuSFomPwaMyrcHibnFZ97S56XctAaDWPtNgbl6uSmCChK2DSP0iutbS7In8B5NU14W/7289+nMokP5DpP5xwJWWu2jhJYImBit7s7bG/7QUanDJ5Mv0/9k4TvJ5ZhNd6Sq41Q3q7UhF1939BO1xJ6UE0a5vAT/4A4AjgJgA5/n6VIGUnifCt31p6ZqlFGHcqgs3XoSpk0DSf10oYBwAbmdNIzPtSAtH34FXiCZig74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 08:51:01 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 08:51:01 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHcj0M4jC0jI4QLS0KEjhrkYbyGcbVls+8Q
Date: Tue, 27 Jan 2026 08:51:01 +0000
Message-ID: <MN0PR11MB6034A3B5821AA60936C59C8E8190A@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
 <20260127043233.254107-7-sowmiya.s@intel.com>
In-Reply-To: <20260127043233.254107-7-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|CYXPR11MB8754:EE_
x-ms-office365-filtering-correlation-id: 0ebedc8f-b80a-4b0e-ba6c-08de5d813270
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RO7+uhyqOXfqv8o0wqXEiyeHzh5M1xFfk1NNYj/Voj4FLfDB6e+2JOTyjx6o?=
 =?us-ascii?Q?rsHcVWhVusCazV2Fexj0gjLJl+GETAWuuOog1/y6v6Hwf1ui0XQyrQRlFr/A?=
 =?us-ascii?Q?3C3c97UTJZKAFlBGxkakjUPx349dpV1k5k6sgBjC5Z03ypHH1iFioDI3CuwR?=
 =?us-ascii?Q?PetHqV5qY12uIYFdvnx7ewa+xT/t3lIc+1bTHE5LOQ0FXXDIt4wZ0m265TNL?=
 =?us-ascii?Q?aLgHMdEPJ7TLzAi2T3CmjNiKCi2CRY9A0gc65xGutT628AtuYv7V0jhtKP+A?=
 =?us-ascii?Q?5cIh7MLH9qprE3mhINzMg+NWUWGWhsRP2mXeJQJnSwlsO3yazyIRj/OXcZQR?=
 =?us-ascii?Q?fbi0Ztloz8WC7aG3FO6FXHgVEWaC4fVstFeKKbCrY6XhbFPSSbbNPpbhn0dK?=
 =?us-ascii?Q?NL9aOHJdFsXjXDJEwFQOR1I675ecXAfUAtKIS/IzaL6kHJK/iqOVoZYjs5YL?=
 =?us-ascii?Q?XwpqODlZsGOFMnkpPjL5qou57vao1Io5GcWofE7Jf7v1cIK0SXccT75dU1XY?=
 =?us-ascii?Q?EsFUhDj9H4XqLF2RiB0V0D9R6qzCy9qfI7CR/2yS9vxIt1dN2ScBtom9XwPn?=
 =?us-ascii?Q?eBlGnKiX4E9zdKiJmnLR+pKuMJxNCoWm2CB5zYTaxp4jiBOOq2ahJQU/Rcw/?=
 =?us-ascii?Q?tz1U/zvq2AvoTiSU753cDBjtvswjC+NkzQ7vAKo1TPIFNdPMtElpDc+6hYvh?=
 =?us-ascii?Q?8tBa33gZunQtByhUlIkjN1tXoLXKca1eVKEt/EmLR1MBugLlY2gbwMcgV84a?=
 =?us-ascii?Q?gekhihJdWr47mjKtfk+XWtrJybXkMpHAttOmfiJowD2wT0fPfzSCpGyfHMnZ?=
 =?us-ascii?Q?3FuQsDRqLAvAJisfUoGSRqnRs75pVbfdutMXVl7di6aGtVcb3cSzaGamItGA?=
 =?us-ascii?Q?W1lLlEFJgROnpvAspJXDGMdB0FYgb6M6gXbBBlLkwY0If8i7gZmHKrci3dHH?=
 =?us-ascii?Q?8dpvSSKD9beAL4bkJseoGFFuteSca+rpD518B47odmAb/F25+6S5bXYgpM8R?=
 =?us-ascii?Q?WdJjOKcoByl+c7LRnyZfTpTgM1qZ5D1ZEXEcjGLZLpJCXtP/OQ/NrW4XWjwd?=
 =?us-ascii?Q?7A+T4Of1YbeOTduCXNu3YzPp+w4JW55ki7PRgZjsXzuYfWcFHbIsBBv3c8Xl?=
 =?us-ascii?Q?nF+ACdluNNG1NYsz3DW/YlEG9Um8NaFGG81Ucns7sBvITV2j0uayfyowhFsi?=
 =?us-ascii?Q?vfuyyYuiGUHHgtxoTgj5lRIqiLp1NJ94RfVDmxxJDRZt1ycNeQd5/4bgffPi?=
 =?us-ascii?Q?LfyQbi0D6nEqJkBdw2lilq/QVC2y+FgX2+82CTeeGxV7zc78qE1YjhIdR1c6?=
 =?us-ascii?Q?C4e5KlF86fskdq5TqjqlnN9FkGEpKM4mHtI0tqF4iyVoo8E2ZiMLFOf+HvFi?=
 =?us-ascii?Q?a2TczThMsfn1aLUrYFds58aN8nByWrFxqOz019iCr20Mkv6bS8owRti7aU41?=
 =?us-ascii?Q?DdrqrHXtIB7bPEDR60z8z+WtmO5Tk8/ohuJKhrp5bMan3qIR0AoD3PBMKKq+?=
 =?us-ascii?Q?ob72CWJsuEiZhfsQg1Wb6zUSduGDm7KJqQvKm4h/rrhXsmfQPH+aRjMSfWi3?=
 =?us-ascii?Q?E7YG/b2b6JO29PDr7KFUXFhw5RnxU5M4Ch6oAYb8NuIt5BSaAtcAR3jBerhX?=
 =?us-ascii?Q?Iizzd+5PrPVynUgcUXhlu0c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qsr4dlB1Fwh+e4OzL4NDS4Ve/UUOs/I2Bvqaq4dMTxPBKqSXE0bNpl0MApQK?=
 =?us-ascii?Q?/szBE9inoFv1h0ApiKtQvh6yqBfxVadqjq7MZyqaDTh6qPTkkae+IVCWuUKd?=
 =?us-ascii?Q?t+g9U4fQ+xi+sqgsjes93JaVSTGXdK40vBUqrHRg9Ca2Cf0I8a7qG/u169ys?=
 =?us-ascii?Q?qljQebFLoE7cv1L2WgIrBbt4p98OAeNhDg3teg89xHEHbhFSHxKcJ2w68xqG?=
 =?us-ascii?Q?hc+Bvleo16zwvGHjQ+REoZbH40og4ezKOi46MuFmC7NLRFKklnPvzVkzOE+p?=
 =?us-ascii?Q?vmepsh6CUUr+RnKhqzjXibiRa7/vJd5DXgoJAAMkQl6NXg8BCHHMoKYSQsgJ?=
 =?us-ascii?Q?yimV/tXg25fmPk04rniq70klbTpngKODGb3C5odp1+c93+nZoMoerPT8ElOI?=
 =?us-ascii?Q?FaNxz6KzVRtclpBXdf7co6JCp3HQ0Ni2kGrkXC3sQuSSuI+hnTkn/sD1GwpU?=
 =?us-ascii?Q?xGWP0Aiy2QoeDNCdANGOG9+cjcaXiAD/MKXHf5vQtezfKN9zjDkSAiZB2RbL?=
 =?us-ascii?Q?hiIFkALxkGsrO1u7Nw3iY9OUofBi1QGUVVxfVshz2yiHA88G5Q5ygwx6Qm5j?=
 =?us-ascii?Q?3L/PDDVp05B7346o0TraiQD/hanj4U1Ow0aXzM5wmq+9r97BNdtCSkUJudPs?=
 =?us-ascii?Q?aQMmUbwPsoGulxDbFM5fXw6jhm+Em9foycR6vv1f4911J6WAOMX2UNftKFwV?=
 =?us-ascii?Q?6AfLjtZETVyGqcDh79O3uVzisDSpYFSJ6tlwcu4gto+hESREF2TmW88RiYvV?=
 =?us-ascii?Q?FMrvrhjvvTpS1O3NXgAx69HiBQZC/CnhK5mk/6JKnRCj7eGuYEFZ4C5p+wJh?=
 =?us-ascii?Q?FuPCctzRKyNEPpVapmiGPsFH3xTuQxGkJh+kwnoJiOUERq981M6CyaMyfYtU?=
 =?us-ascii?Q?K/rtEgdT7uZASO6N2P+x5kta80cyQ1CntXMatz1ogZFqmrwTM3QES+HJrgWK?=
 =?us-ascii?Q?goCgIHCV7ypUIcdDnBi1yv7HAITQ7BmDkeLg0EOrUUFgiLsvxMaIwp/2CrMY?=
 =?us-ascii?Q?InNdMXQA0vRGjHADTY5zo8otrlYR7f66j1rAmtm3ngHRB342STE3Fzx/uLiv?=
 =?us-ascii?Q?qvxcYPQ1KCcBB9dyafVdHQAR6qrAuXZR0udqIKyPhVN4PySYvHROb4BvajRg?=
 =?us-ascii?Q?15FA8KMojxpdsS0LY5bAyN22hc0vU7srI4OtrebFl06RCxga/622aXU1/+si?=
 =?us-ascii?Q?lSUv4pK9KSiU2cdLk1DoCSPPnf2YAHSMAbLqkMmXkGq1iSC9lNdWW6WuVV+a?=
 =?us-ascii?Q?L0yd6WhdpwDxGgBiq9tIHoY13YVQPj0E5wO2aKrVjqGDjAxMsF2N74Je5OMr?=
 =?us-ascii?Q?m7j1VBCmQl9NzyJ7xe1pFVSB70IoGMvh2CwTVdNOx+ah3OFGzSzAkSna5Dc+?=
 =?us-ascii?Q?atBzjTbkbwtegwtG8ePKAnmeKQflMMr9uXwLLNvmWJMvD16+QnmJZaB4T8PJ?=
 =?us-ascii?Q?J46VJG7HBpvBY4RpICPKdMqJ91ICP8hjRtrFy9e1KtOjf5KkXRWpXnB1wq8D?=
 =?us-ascii?Q?pwR7NUrMh+t/BRZhk/azQgDJxCoazH/U1YzCTf+GsPrrQQfir2YrDQcnJCrf?=
 =?us-ascii?Q?8Dv/uIJ9tZTFAUibW5YTA5I6k9f1sbCEa7LHpcNZTiW/AY2rybgJlSqac7Nv?=
 =?us-ascii?Q?QG+GMwfaVOCrj/eYBcopaponG3OQXujKuuxaLm+uqO2t+MQMNjgMjLydg74I?=
 =?us-ascii?Q?SbaxiCGWllgvaX6DOKv9boVVRawjFnFVEFy6qlKIef1+V7eqoAHiUKwhU0Os?=
 =?us-ascii?Q?oAhUHahyJw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebedc8f-b80a-4b0e-ba6c-08de5d813270
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 08:51:01.1416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2FuZ8GgZtMKrsfhqqOi0glY6YCzCiEgY4mg8u6lxDcjNNZgeXFs0paeJkFD3ia76ZPcc1KP+WqM3ChozJ0TI2cYyKvdHez99IQvo+8hQlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
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

Hi Sowmiya ,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sowmiy=
a S
> Sent: 27 January 2026 10:03
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor writeback-fb-=
id
> subtest
>=20
> Remove individual tests for each format for the test writeback-fb-id and
> introduce dynamic subtest generation based on the formats supported.
> Framebuffer creation was now part of the subtest level based on format.
>=20
> v4: squashed the FB creation function with this commit (Suraj)
> v5: -Update dynamic subtest documentation (Suraj)
>     -Rename input_fb to in_fb
>     -Set plane to in_fb and remove unused input_fb as an arg to
>      writeback-fb-id function.
> v6: -Remove in_fb inside subtest and reuse input_fb from
>      fixture (Suraj)
> v7: -Join nested if conditions (Suraj)
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 56 ++++++++++++++++++-------------------------
>  1 file changed, 23 insertions(+), 33 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 63917bf4f..58118b8da 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -51,9 +51,6 @@
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
>   *
> - * SUBTEST: writeback-fb-id-XRGB2101010
> - * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> - *
>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options
>   *
> @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options, help_st=
r,
> opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> options");
> -	igt_subtest("writeback-fb-id") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
> +			int bpc =3D igt_drm_format_get_bpc(test_format);
>=20
> -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid and
> invalid options");
> -	igt_subtest("writeback-fb-id-XRGB2101010") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +			if (is_intel_device(display.drm_fd) &&
> +			    (!strstr(igt_format_str(test_format), "BGR")))
> +				continue;
> +			igt_dynamic_f("writeback-fb-id-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
> +
> +				fb_id =3D igt_create_fb(display.drm_fd,
> mode.hdisplay, mode.vdisplay,
> +
> get_default_fb_format(&display, bpc),
> +						      igt_fb_mod_to_tiling(0),
> +						      &output_fb);
> +

Framebuffer created before skip checks. If test skips,=20
igt_remove_fb() won't be called and framebuffer leaks. Suggest checking=20
skip conditions first.

> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
> +				writeback_fb_id(output, &input_fb,
> &output_fb);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> --
> 2.43.0

Regards ,
Mohammed Bilal.

