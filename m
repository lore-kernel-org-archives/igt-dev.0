Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F2CC5B56A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 16:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8D110E442;
	Wed, 12 Aug 2026 16:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jcf1EwsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A6C10E442
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786552890; x=1818088890;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rlKmcKffBP8z/ISwvU+pf+cYNPU4Jlzsm9bKp1oySnw=;
 b=jcf1EwsSk3kepOuJK+ZMxBH037gXyOgJbDFznM2F4RbJhjhh/4TiRr8f
 cDHa5R+5J3EfwsPq1c9mI2pXg2RboNBc5hlITDaAm+nAne+8WduiLmLjd
 4QkeaPB3dfDKEUFlmdD32F3xLASlpWrgkvFFTfJqAFqhAOq+F8XoO0d+L
 Bc6gMiDNcBXEXTqLIFs14SYWvxLq/tTEI62y07qCEWhY+S/szRoEPEgs3
 Wbc3lbfvmwqrhw8/McJptcw2H8yuB0V2w7KXr/ya9DObDfoND43GcyPTg
 KyXec8gJVfvOJi6OCjwjq8q4LHqw/S84bWk2yzD8lePE/0vrWagRulgmx g==;
X-CSE-ConnectionGUID: f64RhqbvSE2NIzHNQDqg3Q==
X-CSE-MsgGUID: fXxO37s9TquECs4a4bhhZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104500575"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104500575"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 09:41:29 -0700
X-CSE-ConnectionGUID: 3y7SmTmOT2ytrbo2hxnThQ==
X-CSE-MsgGUID: QdZO8qLJSkS5ybMZolqT8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="261069903"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 09:41:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 09:41:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 09:41:28 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 09:41:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akQivQAmLZ0DHwChJsL4asrLjq8dolsNVDyTFUb3kXqtZ2MAeAxHGB18rlw+ynuwRHayZamOOOrbJDSJqfeRbUPF8e8yAnCJXZwC6zdckKVAWzVFx9JcLxbJDJ+Qo1jQ92RwOIDbLRRiC+Ct6mH4vRoRY4rq027d6jAw13V9N7yrhxVJOxZ4w2E/AkyBF/m4H3otkls1L/j1nTZNQ5s23Ux7Wb5HfAkERGtiBKLdxSk9khQNPB6BkyZVDBujrmTeP6P9tv7YoS2oH+0f9VbVMZiNdEF5fYIUE5TWoeRpLV77DinpR1OACGdRJ5SoEksmikfQduGOKFJwesnoPT1w2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQJ1E5f/S9wERndQ+ZQz7LVsDhp1R4xPIfEClU+uCEg=;
 b=Uc2KxttmjJBElnFX7s2K54tCdEpPCmI1Hj/Zt02+G6uPFX2l/c3ivVt4B0pBETdXRwXyknMmRRaNVlzdfwtKVDWZhik39mASctJPAhUsCbqrVJt+1s7d5MM30oCirEqp6uuaXnobgykNGjF3bNfOQ7TEzYjZefWxyplxKVXUhp2WL8k2bK9PU7KQjm92pQTSkxGsUYudFK0EyCeBFTl1/0nbaTeZPjp9V163Ii5QMulRp96bho/mKwEJ5XD+NUSdcxQzSWlFvylQfhbqBhy8zgXrQQXT7WVr9aF9VpWZIkWLFm7BRZO7tIMCpZrRINe9Mvni6yXX5q5ZapiULJ2SXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by PH7PR11MB6772.namprd11.prod.outlook.com (2603:10b6:510:1b6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 16:41:21 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%3]) with mapi id 15.21.0315.014; Wed, 12 Aug 2026
 16:41:21 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Chauhan, Aditya" <aditya.chauhan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Add xe.nvl.core.blocklist to config.json
Thread-Topic: [PATCH i-g-t] intel-ci: Add xe.nvl.core.blocklist to config.json
Thread-Index: AQHdKnkEeb3hhL7HIUiSLwVVR3dd9raanaAw
Date: Wed, 12 Aug 2026 16:41:21 +0000
Message-ID: <CH0PR11MB55642D71DE5BA3630A2748BF98DC2@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20260812163821.1485347-1-aditya.chauhan@intel.com>
In-Reply-To: <20260812163821.1485347-1-aditya.chauhan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|PH7PR11MB6772:EE_
x-ms-office365-filtering-correlation-id: 68fe9120-97c9-4b81-fa60-08def8908a39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|23010399003|366016|38070700021|11063799006|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: /jVxHp1gkJZ1JLx23H+vESsm7f+QHt4J/RCDnayaQtWVQzrHdQWD88RJxqeRDb+pcyo2Bba+IupuO1lTnvUhKRqEdRT5AU1EAkhaJ8Irs9qh7wX2lnlV7+pCOEJcxiorXe4RPT/Dv5QWxhyNLGUQBBpqH2WRqKMxzVgRg9vEOOekWRAqPaYbGQRO4s6K4j3gCynXbgnoIZ/RFEZtj7WKPHmCRFclVjWJhCqlaHSQX932jc8uYEzrnG4a/x1kEdyQglJTSPJ9zLdbMXePU1HQtJJSzoTj9rqEqEzFknBkG7Bqxduq8o57s9v6P53s1GHbZGpreXNR3QJih7FjCDxiaa4LsTSIRP+r5Rqrj//mk/z5Ok7Cb7zx6gqx7V+7n/lQj4viMixpUNl+q0JXPmc1XtQys1m7J/fFYjH0p+wQIKCtcmeEyz2BxqeQ6MameAMxwyxyuNC7unGMspeZEyKRwlO+BHHkxt3VHDn3f+Y+KcWxa4glkxZuD6YWKHZl7EDjcB4F25vX2toAwNCLn36+0M+Fy/xyW0Hj+ELfphyfkUZaQgKMFpIt+6sWbjDwetu5KX01HDhM/KHGHIFnCaGUIaPQN+qViQHRO0bFP4Bn3/qfGdIdUX8WDQhgQIAtPHK52Ps+Ig3KYjvZjrrv0QBayIbSj7USG9MFMSAnAZCWiNU+us4CkS3buwaCF05MYC7hHmdwUIFTisl7UpmYRa60PlYpi5mJa7DHmts5JiIVQYg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(23010399003)(366016)(38070700021)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d8OuqwkWa5x1D18fs3dqUJJhPWDWa6ir5ODtctULp0fwsc6c57O791FkDC+d?=
 =?us-ascii?Q?YhG342QVpOFRhfMDBPhSd+LRv2DlZ//p+v1Wsa/Mnhvoci4qYBfTOvyX9gqc?=
 =?us-ascii?Q?GYPYWZtRFFz4RPVoDkwStjQH9zeVCSVWuabKoqWenNIb6EPAD/1X89zw4RTc?=
 =?us-ascii?Q?l8r6jcVIX3a8zfw+80/skw8948Nyulillhu2JWRQudd7K9xNLEeum51od3Mq?=
 =?us-ascii?Q?xMxzFISC/XvuNhw3t9Z/iupWwk3IEWD8X88LSNy08zRTuduVA4eYr0ZOelcq?=
 =?us-ascii?Q?rjNrqYcvYfFGO4qKP9DS4UJgym2MVVUtDt5hfHCFOICbb/1emFgdT3q0RFdi?=
 =?us-ascii?Q?zzY1nbrT/5iYQk1cvr88cbAdIHPwTIWIbIRPzHib+wkm5prAelW6bVIzmXBQ?=
 =?us-ascii?Q?S4A/P/GdhMWV4W04hL6AMqHqC8xw3nd+zgTdLDRSMVPCME7OBZhgTnLZfjcO?=
 =?us-ascii?Q?qySYSx0J/pms6vMS/gMJdUjPm+zLuezK33mF9s0f4iglByBgZsk8tDzAtGn/?=
 =?us-ascii?Q?iMb9JGilVmmRN/Q2Z2TV7iV8hVJFOOhjz5GK605NSjHevezBvL2oiVLUVjIq?=
 =?us-ascii?Q?nkWEikiLsN9+5aZQCQBAtLknqDUJyKVdP6tjnfm/uAwpCgs0mVLbvD0zW1Ci?=
 =?us-ascii?Q?Jk0OwKXkQKpriCF1F4B5tsHCU1PGzVVISaj+x6OdpfQuJGfHEbU9PbAa5TFZ?=
 =?us-ascii?Q?l20JwuHmdMW+Hx+I18tR6j+evTDUedzTj4FqKdnyWq6VwjgTbqgbxIm0YHaw?=
 =?us-ascii?Q?5MpsqzUnVyRVri8XkDiYffDAN49Eay70b9jLJe/H1w4gKB9EoTjil07CEi2N?=
 =?us-ascii?Q?9Wo3H0VQMZ8MobNJXNN5VcIm/5cSQf97HapGLXVHZc+HIkEcIfJEQQ8YavC1?=
 =?us-ascii?Q?SoEzr7IeQwk0W5m5PcTh4RnYG2F/GrxlBo0ycfKFtiCR5mlhb9mH+xkbUH9D?=
 =?us-ascii?Q?voYLEtS6Mg6GWjnA5BW8t4IxfRGqn0XZyihAJMg2pf4u4yzK1OYKE9AGGP+y?=
 =?us-ascii?Q?8iAVpLMWNzefWxhzMjuU0kRrnySIDvK9tNgR/caNLNDI7aW8jWiv3jZE63BB?=
 =?us-ascii?Q?LELryvK6Ovpq/qqkAqiM5IP4pX+kcc2nYa066ZvmP+iJHRDKAplJqrO1mwiJ?=
 =?us-ascii?Q?eOSo6PHBFu04wFpOOk3uuurziOLEnxbhV4bTS3YVA05zaqx2h0UnIw4U6FwJ?=
 =?us-ascii?Q?TT73Rveo1E46w21WL905f9hMFAKvavf79sH/ELvTGK7qFcCXhCzhSB5IOJi6?=
 =?us-ascii?Q?GKYvkIsukaOX4k9UGdT0OkEpI163+YfipUV6+G/FA49J1vkquHbP7jcHdk6z?=
 =?us-ascii?Q?DmyKdVU08MuJ31BiKy+EAtzJXz1UffnUm064UxpqH794Jz639I/uT2kalk/O?=
 =?us-ascii?Q?phi6NG405ls4+IwvsVJ+HKAVk+UIwgqrQRXhIaO7onCQXXsOPvu4p3gF+UQE?=
 =?us-ascii?Q?iuXhNZO8mteMovYD/awhXr+YyWKyn49RKnaoaActCLQJ2tPNVFMOPix2jWsv?=
 =?us-ascii?Q?/K8/uac8XYr30pCUV78u4FCQYthvrs2dtwGRff9cjk2yWp2BcLH5GjYwYxHZ?=
 =?us-ascii?Q?Rva1waO0yHJJPV5E9PfNt72832CmuMi0RBk5Z+w3L277Kae46sLfN/WOH80v?=
 =?us-ascii?Q?aE1w7g4af85RnPh8MrZzJGVDIs974MUSSguY3/S9ln4JtKJMAa0PoD+YtOc/?=
 =?us-ascii?Q?n7msegtRSQ3Spgk46UwNWKoJMAVeorCvtYz3tmXggeu7ATqqBOvjvt5j4aaA?=
 =?us-ascii?Q?TfDLQA1nVmt4Y8NSQAnJNhqR3fz+uxQoSZEuFRX/OuKR9nHcnHmPQc1tarI1?=
x-ms-exchange-antispam-messagedata-1: 5ucNE3NlErZBww==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Q3BmxVJKBHtEh3RvQIGO6HUNGhDFHurGAip0XJkBoy+pVhXpbpl7MIdX5nh6MJXCt8WrI6Fgrn9UkzS2i26NbqSq+YnItu4bGVL/k9gchHAmfolfyT6lN2QCMe9PL8xaQD2GQo0P+BjMX5Ccl547FAwkYPkw1fsVo5MMuoIa0ycg4T4yw2K08O97HeOqeQqUM8mGRLi7+WjFYGcK4O3Hq6T8K9ov+iZUImnvGliNl+3wUnBG4TT7RuYiyGH7pVdgAAf/TGm3HUl02+8LM5lRvIZ2/0W3dO5nz6DM/17CQjnAHlvHQOqe8Uo41RuaDAAAWLu3XaZbrxxdRBLUh+JpTA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fe9120-97c9-4b81-fa60-08def8908a39
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 16:41:21.0862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5BQxzNGfniB6gX4iY8j/kH+gZgWQO4waKpOr4JN+a2EVWdJL/ahSGIRFC8KXG8tjmY/aiI23uz+WhPofWuheof9dso7kk9OZllUfenDOVqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6772
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
> From: Chauhan, Aditya <aditya.chauhan@intel.com>
> Sent: 12 August 2026 22:08
> To: igt-dev@lists.freedesktop.org
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Girotra, Himanshu
> <himanshu.girotra@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Add xe.nvl.core.blocklist to config.json
>=20
> From: Aditya Chauhan <aditya.chauhan@intel.com>
>=20
> Add xe.nvl.core.blocklist to xe_test_config.json file so that core testli=
sts can be
> generated for NVL as well. Currently they are not being generated due to =
missing
> NVL entry in config file.
>=20
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel/xe_test_config.json | 1 +
>  1 file changed, 1 insertion(+)
>=20
Reviewed-by: Himanshu Girotra <himanshu.girotra@intel.com>

> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config=
.json index
> cfdb369b8..55542655c 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -79,6 +79,7 @@
>  		    "include": [
>  			{ "LNL": "../intel-ci/xe.lnl.core.blocklist.txt" },
>  			{ "BMG": "../intel-ci/xe.bmg.core.blocklist.txt" },
> +			{ "NVL": "../intel-ci/xe.nvl.core.blocklist.txt" },
>  			{ "PTL": "../intel-ci/xe.ptl.core.blocklist.txt" },
>  			{ "WCL": "../intel-ci/xe.wcl.core.blocklist.txt" },
>  			{ "all": "../intel-ci/xe.blocklist.txt" }
> --
> 2.34.1

