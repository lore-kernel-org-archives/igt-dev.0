Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A87D358E0
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 08:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E5810E33C;
	Thu, 29 Jan 2026 08:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9y6kSZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E4410E33C
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 08:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769675058; x=1801211058;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0wQOU1TTS8GFCHpFHb0Z4nHCzR9dTZfbXmhgpkK+tmo=;
 b=d9y6kSZ8FFR5XyYFXWsDkmpz/5tgIhYZXuQQ2JrIwq7ITc2sskGpzA9o
 HfmbEdHA/2l7ALUsyLq5R8BHEsvZBBrwvHcGI5YURBUt036zaDSplETpw
 WT/Im4vP4Xo0aPWj0FkSgdAv201N0LrJmgDpYW7hJTGbEl8qT1j13/eJr
 uNgrIGLtBlI/js9q934MoAnqEmJphC6KzDWKChijyx+B3cuurepGIi9BF
 feOTqwXzXCFpCmlaQX6O4OEQTzJlDSuItDCx6a+vV5nMjDxJS6Dvn8gyF
 ohhRme+RqTAeAjUYaHjc4Vi53OnF1FDK07sLNpukxTA6jQwaGd3hgyA8+ w==;
X-CSE-ConnectionGUID: C77Lgn5pSJeytO3scrx5oQ==
X-CSE-MsgGUID: rV1T0cEuSYCDrFGGjZdFlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82273028"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="82273028"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:24:18 -0800
X-CSE-ConnectionGUID: 8hSp1AxhSXmn0QDKOr6ptg==
X-CSE-MsgGUID: 3How2gZEQYiLgzv9s8BZSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208405599"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:24:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:24:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 00:24:16 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:24:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+WQxIOx+WvXiQjsXAzsuA/ccktpzqqy0u3lz3pTT1gLdmRTy1KckDyFVKyyw+dLEeO3dWkyW7SPN3Nrab4E//h5IcMEIxXJrXPtoFuBFoYlwIEWTdgKjcAwdg9vmndsdc7FGjr4R5QhthU9GH/sUiz+WP2ESaVM5axBplNEk9b0NfMOsuEXvrsIurJUliepox8EFb4A38uVuD8C0TrXzML3tnD/uKk9Xgw06XXzCPO0sC5iEt2MNFSAymTq40jdMsXnd587mjZZTbtiSMjWlAtagQGusQXw+465KOct3BLtvLoLj8UMG3YzPmLPpqLAg47SDlzINKeuX6m7+5S+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqkA9GtDUJ3hyB1/iv99XPOdTnnKQSBcbSEH0W2GlSE=;
 b=MSWAsCsuGhpbdgVEiypWuw2f07AkOVQ6ps9cy3Tgevx2Lr5142ad30Sg9G1Vcx87pTaf9hC9MzVkw2fzdCvGGT4rkf32Gu/GXL6cjkWodaJPjNHC5SWXKp9Ys5HIba87Kx2Z4CaJLwl32IFhtfBWAe+huUgZXnJtJaMx6GDtjMDdfwadxOSWrgTwD53Q4lgXWOtLd6JH72O6eQ+3F0gEKMX8UL1o0rUBXgYUWtJfHjEToGYBFeiWo3RA9iy1JhHSpS+6YZzXJMkX8gpsQ1kDjhSBPYZK6sApL5Hh/LPPDjEsfnfEQOI8ZxaM6VkxGqfkJmjjoYEZZoUM/VBSduhqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 08:24:09 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 08:24:09 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_pipe_crc_basic: add mst suspend-resume
 test
Thread-Topic: [PATCH i-g-t] tests/kms_pipe_crc_basic: add mst suspend-resume
 test
Thread-Index: AQHcj2oRo9DJm6WFkE2Nl/H0y1ijXrVoz7LQ
Date: Thu, 29 Jan 2026 08:24:09 +0000
Message-ID: <MN0PR11MB6034C2CF1CE55D82266416BD819EA@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260127091146.2212514-1-kunal1.joshi@intel.com>
In-Reply-To: <20260127091146.2212514-1-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|BY1PR11MB7983:EE_
x-ms-office365-filtering-correlation-id: 9aaac8bd-93f0-45c4-7b27-08de5f0fc67b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pe0asL9dB48MbJgIaErlpM40T7zrHRmamvshrjpGbouHvy5fF8Pb0B4BEyAA?=
 =?us-ascii?Q?fT80rfs3jdqqtIHhExQTzKkwRy8qTnifLYtbLIG0k4uIFhzgkkKwIJdphK6k?=
 =?us-ascii?Q?aDF7w6riGesOvbd8EUPfozCSzr2H1CvN8GDTKSUoeLGcBkOSTOpmrrtgqB2R?=
 =?us-ascii?Q?GI0fQqrTG+cdfTdH6vX69NmY62SPOdy7eqHMvmCZf8bqqMbPlDC06oecjx5i?=
 =?us-ascii?Q?RYIqa+TGg+WbSZxIg2ONy1PlVz2ilQWef5BANbhDmMgytt8OlqWnTqZmjNOR?=
 =?us-ascii?Q?8nPQZtT0dfRPe9gAz/nuSod39louA8q2TZkX4UeSxNOozRfIBW3TuLAKVuLU?=
 =?us-ascii?Q?zKQSTbdWXuBrX/w9Gx6O56lRB9G9I3+tDK8/bzFlh5iEyLKfI+O//j9PmBl+?=
 =?us-ascii?Q?sFRJ2iVQoI/5L4x+4/4Z2+0dG2DEsoixxJiPFwtbaMvvl9BM2vYK/NVn42GJ?=
 =?us-ascii?Q?rwEeg6TbcQzLu61k7+c2k/3sgozfg3dYuho5Qp1mDFf8TtYuTxRDKRDjQe4Q?=
 =?us-ascii?Q?kOsFsGvn5rxn1VSBL4KBVRueQiXxHN3+wCsDVsis8flCL+A4qtVT2ViphyJD?=
 =?us-ascii?Q?peOUBhaCnoDiXwEmfss3Zv3xwdEfW+ivo7gTEE+HSb4WFY4Oyo+dHYycFFyS?=
 =?us-ascii?Q?z3LyG0QF+eTAuYD2m1AS2FXMM0tEvW0wxeU26a4blKiJbpA4HgCH9UcWdQyF?=
 =?us-ascii?Q?aPwmoOGNS3pPvflSnT2A2JVh/hUSflVkIWH1Bd7U87gf7g3pFOkq93KFRS8S?=
 =?us-ascii?Q?y3wDsg9DTFivK/vxzCDtcISeET/HUIo+yQqo9cLYMmGV1vKK02sIyY/ltZgb?=
 =?us-ascii?Q?CjgUOii/mBJkX2QAYBSDc1t/wig2ibpxzpZ5L6BqPoueZXL1Mfm8bkI2tuie?=
 =?us-ascii?Q?BGdi5pAiUaXbpof3xfXxOVlKc4ZT5haiar40GH8oto9nb18CuK7aUJDjqMhf?=
 =?us-ascii?Q?zV8ZavR2CO9gfjymTXweLVx8v91y8D18tYsOhPQrHtHkd2Y0eU73qAHInheE?=
 =?us-ascii?Q?kCVtzSX6cbGujxSOoiezaBoAAm7IjjeM1+7UjZ3W4bfjOAcK4Nh0zhyPZUAV?=
 =?us-ascii?Q?thd/3XAD/aqB+9UXa0+NrCDTdvPRryS3kWHuSmoXDXw9gXOVtQdMrAhlUBtq?=
 =?us-ascii?Q?Y1fzq73HDTO1KvJlGBVi2UKkgPQWwbIlan+QUsOU4XYmPBTLG1fTYGBCfSrj?=
 =?us-ascii?Q?BnJlVmnhXAAN/FgBIn1Kjd6/+pJu4Mu+NZN/FYVOrXacw9rc7DumP4Qr1uwm?=
 =?us-ascii?Q?WM0zxiNYcuvPI51BmtsWBr/krqyVAePD2F0eKlnksA6pq6eghyhmqUIEvUxb?=
 =?us-ascii?Q?y9WdAQOZQBktl6qhhGqsmiyxr8ot7/E1h2af46k16RzyiY1fEEgD6qyrdDJA?=
 =?us-ascii?Q?ZYglza0TORSoNYjiAxxtN9tljed327+THx7GfVOAgtcHTSjvfA20lroQjaTP?=
 =?us-ascii?Q?1jruYyD9LABGM7MHaWs8ucwBGyAerSCC/eJPl7wxB8LH0ubIcWGMio4Z2UAB?=
 =?us-ascii?Q?MBbu1Oyhym06YQ3aAfvyRTEs9ljuXrX8MN9K0vfjjgWMAuX8ouNI90AuTILq?=
 =?us-ascii?Q?JJ018wTkacZNtMLaB395ikNGtzRIze6enSmt6L8oXXGYbSg5rIGrjY5VyZ+j?=
 =?us-ascii?Q?XGWUM2gZrtVNIfOEJXGZyPA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EJCmeBAvrz50UgNY73N+s//ros0Ic7inj/xog+ZzyI+6tNLVa4m31ZCwZxTh?=
 =?us-ascii?Q?3vosaBvQ0+Sv9ySEjUeCPFJksY7OVh4nAWrDQ1rM/s/kLixeqOLbk8hEVZ+N?=
 =?us-ascii?Q?YKLhPD74gKpbA+SUlmbAJyfTMmjEWq6+Tx00aTO28L0RsVZiVgl+ZF62mMNS?=
 =?us-ascii?Q?3/GMuRaLjF+QLFUszHT41jL2mwYoV3wZQEFnESzp7ZsOeGz0LWq37+Iwow2R?=
 =?us-ascii?Q?VhN4z83eNf0mWxNViVOvqtr1AcC5qgBlfaUKSP9PlI/YHEE1h6PHPTdeDMNM?=
 =?us-ascii?Q?NRB/AVuerbDheLnK+rFVN5unjTWVmHySkH1Jt5HExPV/fjLrrNcnzCZxKNOE?=
 =?us-ascii?Q?RBR0oQMts3QpT3s0uOVNqNL9sev9q43c6OMplogbYNAclTCIdKKHG57zZZtx?=
 =?us-ascii?Q?b6Cy5/VJT91MOqr+HeaQtH1hZDi+3VWw6B1ALZVBA4IQWaCt+D/TexCjve5d?=
 =?us-ascii?Q?nIMuHMvt4MQquSshJnAoCMYkG6Zw1Rs7zgvF9d1ZGuBhVrfCnW3PbzcoO5a/?=
 =?us-ascii?Q?8Wv66uF1pK1uX/N7Wgl+khyD1Cmbfe/iUiFx4lpS4CdZjGChXDaiOJZ9ibYY?=
 =?us-ascii?Q?v54dRV8glMMtoN0y9u4GYHw53jrzmWfr8svRxz/XSMfhqkiDI8zQWsMx7nMQ?=
 =?us-ascii?Q?AE3/4LoWXo89xRd9a2ygEg+HpiQN354dqQQbzqfWYu9pkto8WNN0FXfmO1YK?=
 =?us-ascii?Q?IOkKvWroJye/jE93M3gKg1rh+K7F5Lrgp4T8mfJpoEeXyQWKBnGHLg+P7OS5?=
 =?us-ascii?Q?CiMRAUVprk1cnWFDC2QW65aqY7+PZq2dB/kUFHLKb5/cZ1ciKcA7PHrC771s?=
 =?us-ascii?Q?PHiofdK88aad6Vt85vZfJSmqBoDaw8doUcl32uEAg5Jr1Bb6UleLaKCOlsBk?=
 =?us-ascii?Q?oVQe4dcpzhNUx+Qql3pQiINDBNy8mqFa7esKRCWozcqEOD9r5Dio4qCtMqEr?=
 =?us-ascii?Q?6dvhkA8G6BaztpaJNViXfCQ4bLTXEVq83UFPrbq8E5h8rzqBiVLbFvhernhB?=
 =?us-ascii?Q?AzESofFTXJvxL2AZMsNYKt7ddp7WmrYeqJpjB5XOGY2ABWnB9oTX1T3z3xjK?=
 =?us-ascii?Q?nIFa1RtSjMH+x9W/MJXUviC4CKJT29QBBq71gYw5XneVEvHCeb6931VjXGE4?=
 =?us-ascii?Q?aLv40BrW5ZPhi+P/CN8YzmpoqjwdyB5YqUf5s48L30ce6RNK/9eelgLaxsMb?=
 =?us-ascii?Q?Z2ZIrOVrVVphtutHl3OrZVSMySiF9MCIXMYVPACFvjGNUw3cpv/nUUDcGVRu?=
 =?us-ascii?Q?U/yON2sB/nQgFFESn6ooUWZW2lSvPzEzKDG1X3PQb7qINAEgaZT30JaX4w1v?=
 =?us-ascii?Q?kRacLqMmCbqVdC032aF33coI8SMt+DXZ0mI7b0EBHahMOYBxBaNxQ+g52lT6?=
 =?us-ascii?Q?wJy9W7iU3f4+1C8B8lBm7zlnU0VAvuCKK+fDD+8AfMYOoCvqjyQCJdybc8sR?=
 =?us-ascii?Q?niRtqgkMlQWPOJ1RYlI5L2ctPubVTa4/IZ2yxy+nBjYMkCBjafVzmBqZZ0EQ?=
 =?us-ascii?Q?5V36VXxkbHp7bTgknNBokfFzZL6NgWP9Q32iuZEe2r1ZYCZoVROnXBJMrz38?=
 =?us-ascii?Q?p/LP/PVQlO/A05+GPyGNKOvRJRZVIkAn1xKFBJoMEp83TXtYgrZQj2+9oQ/C?=
 =?us-ascii?Q?ewtzE9UU19OoICeSbz3QQo6OR704MlRJRM+SqnDK/5Bkq5g4gqlj7Xzr0sz/?=
 =?us-ascii?Q?hgxTAKtrg4euUGLVSSL5sk7eh+IAoqNdcx58+PrT07niKcQIDyffb0Q7PPxi?=
 =?us-ascii?Q?uDqnDpRhAg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaac8bd-93f0-45c4-7b27-08de5f0fc67b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 08:24:09.1800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Q+eLW5ADvmgF7NhuvmkO29cvHlkJ2hE3hbI6qYGV36UA2ticok6VkYTBTYfIb+ekotrAxN5/AUouLA/PNgbX6KKIxEd01AaDSKzwcr9L/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
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

Hi Kunal ,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal =
Joshi
> Sent: 27 January 2026 14:42
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t] tests/kms_pipe_crc_basic: add mst suspend-resume t=
est
>=20
> Extend kms_pipe_crc_basic with an MST-specific suspend-resume subtest.
>=20
> mst-suspend-read-crc subtest does below:
> -> Enumerates MST topologies using the PATH-based helpers.
> -> Builds all non-empty subsets of up to MAX_MST_OUTPUT
>    outputs per topology.
> -> Assigns pipes in a joiner-aware way and enforces
>    link bandwidth limits.
> -> Asserts that pre and post-suspend CRCs match for each
>    tested subset.
>=20
> v2:
> - Add error handling for igt_pipe_crc_new (Thasleem)
> - Improve log format with index for clarity (Thasleem)
> - Order declarations in decreasing line length (Thasleem)
> - Add print message when no MST found (Thasleem)
> - Add bounds check for idx in subset loop (Thasleem)
> - Use igt_crtc_crc_new() instead of igt_pipe_crc_new() (Ville)
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_pipe_crc_basic.c | 217 +++++++++++++++++++++++++++++++++++++
>  tests/meson.build          |   3 +
>  2 files changed, 220 insertions(+)
>=20
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c inde=
x
> fb2f5f8eb..6a4c3d9aa 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -32,6 +32,8 @@
>=20
>  #include "igt.h"
>  #include "igt_sysfs.h"
> +#include "intel/kms_mst_helper.h"
> +#include "intel/kms_joiner_helper.h"
>  #include <errno.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> @@ -77,6 +79,11 @@
>   *              CRTC does not cause issues.
>   */
>=20
> +/**
> + * SUBTEST: mst-suspend-read-crc
> + * Description: MST suspend test for pipe CRC reads.
> + */
> +
>  static bool extended;
>  static enum pipe active_pipes[IGT_MAX_PIPES];  static uint32_t last_pipe=
; @@ -
> 96,6 +103,205 @@ static struct {
>  	{ .r =3D 0.0, .g =3D 1.0, .b =3D 1.0 },
>  };
>=20
> +#define MAX_MST_OUTPUT 3
> +
> +static void collect_single_crc(igt_crtc_t *crtc, igt_crc_t *crc) {
> +	igt_pipe_crc_t *pipe_crc;
> +
> +	pipe_crc =3D igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
> +	igt_assert(pipe_crc);
> +	igt_pipe_crc_collect_crc(pipe_crc, crc);
> +	igt_pipe_crc_free(pipe_crc);
> +}
> +
> +static void collect_crc_for_active_outputs(igt_display_t *display,
> +					   igt_output_t **outputs,
> +					   int num_outputs,
> +					   igt_crc_t *crcs)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < num_outputs; i++) {
> +		igt_output_t *output =3D outputs[i];
> +		enum pipe pipe =3D output->pending_pipe;
> +		igt_crtc_t *crtc;
> +
> +		igt_assert(pipe >=3D 0 && pipe < IGT_MAX_PIPES);
> +		crtc =3D igt_crtc_for_pipe(display, pipe);
> +		collect_single_crc(crtc, &crcs[i]);
> +	}
> +}
> +
> +static void run_mst_subset_and_verify(igt_display_t *display,
> +				      igt_output_t **active_outputs,
> +				      int num_active,
> +				      int n_pipes,
> +				      uint32_t master_pipes_mask,
> +				      uint32_t valid_pipes_mask)
> +{
> +	int a;
> +	igt_crc_t pre_crcs[IGT_MAX_PIPES];
> +	igt_crc_t post_crcs[IGT_MAX_PIPES];
> +	uint32_t used_pipes_mask =3D 0;
> +	enum igt_suspend_test stest =3D SUSPEND_TEST_NONE;
> +	int drm_fd =3D display->drm_fd;
> +
> +	igt_require_f(num_active <=3D n_pipes,
> +		      "Not enough pipes for MST subset\n");
> +
> +	igt_require(igt_assign_pipes_for_outputs(drm_fd,
> +						 active_outputs,
> +						 num_active,
> +						 n_pipes,
> +						 &used_pipes_mask,
> +						 master_pipes_mask,
> +						 valid_pipes_mask));
> +
> +	igt_require_f(igt_fit_modes_in_bw(display),
> +		      "Unable to fit modes in bw\n");

It may be better to create a framebuffer before CRC collection,=20
since planes are currently empty and CRC values could be unreliable.

Regards ,
Mohammed Bilal

> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_info("MST subset: %d outputs, n_pipes=3D%d\n",
> +		 num_active, n_pipes);
> +	for (a =3D 0; a < num_active; a++) {
> +		igt_output_t *o =3D active_outputs[a];
> +		drmModeModeInfo *m =3D igt_output_get_mode(o);
> +
> +		igt_info("[%d] PRE-SUSPEND: output %s -> pipe %s, mode
> %dx%d@%d\n",
> +			 a, o->name,
> +			 kmstest_pipe_name(o->pending_pipe),
> +			 m ? m->hdisplay : -1,
> +			 m ? m->vdisplay : -1,
> +			 m ? m->vrefresh : 0);
> +	}
> +
> +	collect_crc_for_active_outputs(display,
> +				       active_outputs,
> +				       num_active,
> +				       pre_crcs);
> +
> +	for (a =3D 0; a < num_active; a++) {
> +		char *s =3D igt_crc_to_string(&pre_crcs[a]);
> +
> +		igt_info(" pre: output %s CRC %s\n",
> +			 active_outputs[a]->name, s);
> +		free(s);
> +	}
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, stest);
> +
> +	collect_crc_for_active_outputs(display,
> +				       active_outputs,
> +				       num_active,
> +				       post_crcs);
> +
> +	for (a =3D 0; a < num_active; a++) {
> +		igt_output_t *o =3D active_outputs[a];
> +		drmModeModeInfo *m =3D igt_output_get_mode(o);
> +		char *s_post =3D igt_crc_to_string(&post_crcs[a]);
> +
> +		igt_info("[%d] POST-SUSPEND: output %s -> pipe %s, CRC %s,
> mode %dx%d@%d\n",
> +			 a, o->name,
> +			 kmstest_pipe_name(o->pending_pipe),
> +			 s_post,
> +			 m ? m->hdisplay : -1,
> +			 m ? m->vdisplay : -1,
> +			 m ? m->vrefresh : 0);
> +		free(s_post);
> +	}
> +
> +	for (a =3D 0; a < num_active; a++)
> +		igt_assert_crc_equal(&pre_crcs[a], &post_crcs[a]); }
> +
> +static void mst_suspend_read_crc(igt_display_t *display) {
> +	int n_pipes =3D igt_display_n_crtcs(display);
> +	igt_output_t *active_outputs[MAX_MST_OUTPUT];
> +	igt_output_t *mst_outputs[MAX_MST_OUTPUT];
> +	int traversed_roots[IGT_MAX_PIPES];
> +	int drm_fd =3D display->drm_fd;
> +	uint32_t valid_pipes_mask =3D 0;
> +	int num_mst, i, num_active;
> +	uint32_t master_pipes_mask;
> +	igt_output_t *output;
> +	int num_roots =3D 0;
> +
> +	for (i =3D 0; i < IGT_MAX_PIPES; i++) {
> +		if (display->pipes[i].valid)
> +			valid_pipes_mask |=3D BIT(i);
> +	}
> +
> +	igt_set_all_master_pipes_for_platform(display, &master_pipes_mask);
> +
> +	for_each_connected_output(display, output) {
> +		int root_id;
> +		bool root_seen =3D false;
> +
> +		root_id =3D igt_get_dp_mst_connector_id(output);
> +		if (root_id < 0) {
> +			igt_info("Skipping non-mst output %s\n", output-
> >name);
> +			continue;
> +		}
> +
> +		for (i =3D 0; i < num_roots; i++)
> +			if (traversed_roots[i] =3D=3D root_id)
> +				root_seen =3D true;
> +
> +		if (root_seen)
> +			continue;
> +
> +		num_mst =3D 0;
> +		igt_require(igt_find_all_mst_output_in_topology(drm_fd, display,
> +								output,
> mst_outputs,
> +								&num_mst) =3D=3D
> 0);
> +		if (num_mst =3D=3D 0) {
> +			igt_info("No MST outputs found in topology for output
> %s\n",
> +				 output->name);
> +			igt_skip("No MST outputs found in topology\n");
> +		}
> +
> +		if (num_roots < IGT_MAX_PIPES)
> +			traversed_roots[num_roots++] =3D root_id;
> +
> +		if (num_mst > MAX_MST_OUTPUT)
> +			num_mst =3D MAX_MST_OUTPUT;
> +
> +		/* In future if we can print name of MST hub will be great */
> +		igt_dynamic_f("mst-topo-%d", num_roots) {
> +			int mask;
> +
> +			for (mask =3D 1; mask < (1 << num_mst); mask++) {
> +				int bit, idx =3D 0;
> +
> +				/* build subset for this bitmask */
> +				for (bit =3D 0; bit < num_mst; bit++) {
> +					if (!(mask & (1 << bit)))
> +						continue;
> +
> +					if (idx >=3D MAX_MST_OUTPUT)
> +						break;
> +
> +					active_outputs[idx++] =3D
> mst_outputs[bit];
> +				}
> +
> +				num_active =3D idx;
> +				if (!num_active)
> +					continue;
> +
> +				igt_display_reset(display);
> +
> +				run_mst_subset_and_verify(display,
> active_outputs,
> +							  num_active, n_pipes,
> +							  master_pipes_mask,
> +							  valid_pipes_mask);
> +			}
> +		}
> +	}
> +}
> +
>  static bool simulation_constraint(enum pipe pipe)  {
>  	if (igt_run_in_simulation() && !extended && @@ -456,6 +662,17 @@ int
> igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		}
>  	}
>=20
> +	igt_describe("MST suspend test for pipe CRC reads.");
> +	igt_subtest_with_dynamic("mst-suspend-read-crc") {
> +		bool found_mst_output =3D false;
> +
> +		for_each_connected_output(&data.display, output)
> +			found_mst_output =3D found_mst_output |
> +					   igt_check_output_is_dp_mst(output);
> +		igt_require_f(found_mst_output, "Need at least 1 MST
> output\n");
> +		mst_suspend_read_crc(&data.display);
> +	}
> +
>  	igt_describe("Check that disabling CRCs on a CRTC after having disabled
> the CRTC "
>  		     "does not cause issues.");
>  	igt_subtest_with_dynamic("disable-crc-after-crtc") { diff --git
> a/tests/meson.build b/tests/meson.build index 0ad728b87..0675e2dfd 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -398,6 +398,9 @@ extra_sources =3D {
>  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>  	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
>  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +        'kms_pipe_crc_basic': [
> +           join_paths ('intel', 'kms_mst_helper.c'),
> +           join_paths ('intel', 'kms_joiner_helper.c') ],
>  }
>=20
>  # Extra dependencies used on core and Intel drivers
> --
> 2.25.1

