Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24700C87FCD
	for <igt-dev@archiver.kernel.org>; Fri, 25 Jul 2025 09:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEB710E164;
	Fri, 25 Jul 2025 09:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaaaErQZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DEA10E0C1
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jul 2025 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753437049; x=1784973049;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=JuAy8T/qdOLj4ZsCOBbDzdgno1qYZH2twwnEvPfjKeY=;
 b=UaaaErQZS6BEJrBz5DsqJkvIgS5kN8jwHRXtmCAFXNydgwaASOvNkFd2
 pYA3MGs547vcePK9M/DkoiDtJxn+Kzfcg10ZoyekhPPvA7sfFqpholdJk
 J9IMWkgH3cx4NJo8Qk2MbNMvCa7+tn12TcS7An9FwNubKfo6IIyt0xFLR
 HwaMBgqn033Jrm/acttvB56afQADrhLs/Q3OunC1siRTuTmWy3uUBWjTk
 SX6fUG05hFLDL1IbnElnuIJW+1h0pO8wxTuEwLKfIHA7zVv57SYXLwliM
 uvSTRD4P5TLFL4IA+6m7zldYnT9gxlmfPRIWsjcxiyY/wQqLm+ShQfyul A==;
X-CSE-ConnectionGUID: /qVq/VodQ4eMabvSrlZfdg==
X-CSE-MsgGUID: HK9b+TFnSY6K/VaGta7CEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66843826"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208,217";a="66843826"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 02:50:48 -0700
X-CSE-ConnectionGUID: ciPtbo0fRfWA1uZQoTODsg==
X-CSE-MsgGUID: 9/kSKlDyTNC6w2znwnyoRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
 d="scan'208,217";a="161561634"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 02:50:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 02:50:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 02:50:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 02:50:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSnax/w2sln3s1v8Zlt641KrX4sG9pgeUxTziZB29l31VxJrxKyaZ3jK4IXlTVL4DT6+2VC0V2WIle/MMm0soFWCNKT3ewns76+pTSqS0BQc5UNUeJkuiLfQBx0E4kbtkh4+dDQSBsmEVkIPu80yPiU2LiwZAJqGIRRgiKajaqu350NepjlxBXhhzGHaK3PTnsw2w4NzWjPaODgW0EcGiG1J9Bpsp2w2UJGA2wmYYR6Zq2LpQw6/axYpk4INp7+WqfmVSOGvnUkbfMd+ljF8BFeLpO5I8pnhvgHOrk/SCcWcvGwskcymSl3ztfzTrgRQVMThINvX5pKcGlx9OmFgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh7WM+7vLk1RG692H9F9Tg3ET3ZajY8/gOj1uyBIKfo=;
 b=XvZPFK0MuxySjVq0xhpDALHnpz2I5JRKcgII1JlIPpTUnH//Ty+1KLhVU7Y4cRN6evMBOK8RvKJVtef3cn7E/PAxCVsNknUFBLDjr7LzfWzUOiMEGVfeYdjQDln9U1DhPQ3+UsPuoqlCwvxoV4O4f+ZA4z5TWSIccXDSdno2EsF1twjmD4Yu8BQ94+QEo839u/UtI74S5We5sQf6jLhMNlNKNWfo3ObOzOY0tTM9U8fJqruXbBkdwlAXEUHHRIDIvxlBiG1jl7H/x8gluhO0oy/IbeI0i6PYB4VYOUIfwogHzEpJqZOeGpk1MQg0MEuw4U0CS26PqLM1aNYwBOFxGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DM6PR11MB4515.namprd11.prod.outlook.com (2603:10b6:5:2a9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Fri, 25 Jul 2025 09:50:30 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%3]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 09:50:30 +0000
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v3 4/5] lib/igt_pm: Move check_dpms to igt_pm lib
Thread-Topic: [PATCH i-g-t v3 4/5] lib/igt_pm: Move check_dpms to igt_pm lib
Thread-Index: AQHb+5YzPule/uTh9UOgfxl7wG/q8rRCm2N0
Date: Fri, 25 Jul 2025 09:50:30 +0000
Message-ID: <DM4PR11MB53099000D44AA53800050124DB59A@DM4PR11MB5309.namprd11.prod.outlook.com>
References: <20250723055353.1137242-1-karthik.b.s@intel.com>
 <20250723055353.1137242-4-karthik.b.s@intel.com>
In-Reply-To: <20250723055353.1137242-4-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5309:EE_|DM6PR11MB4515:EE_
x-ms-office365-filtering-correlation-id: f34c83cc-ec69-445b-688b-08ddcb60b0dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700018|7053199007|8096899003;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?lVDK/pFcOWfS37yAZjmXtu5VUg1TIub5DMY+SIdvQtXsYpJSeNdCq6bOsx?=
 =?iso-8859-1?Q?1PANOqlXBLV05ZAwjQXNtCdmECJR7fgKDub7oxrg44v6VAgnlMbdD55t57?=
 =?iso-8859-1?Q?KRcgWgX8x4tpMqVhZNzsMVmUVu+Kv2EuiR03/m4qFb1eT6TW8BquAeRDi4?=
 =?iso-8859-1?Q?/zRCKKZUEUhMB9S6eiSp0fN4Q6zEtZ6vRVcShKBGhLeX3R1HYBGYWFwMDZ?=
 =?iso-8859-1?Q?+26uaGJtCEtfaHHZNHdjFBbd2//PplfsEuF9xKugDa7K9Q/q/x5NiTQCcu?=
 =?iso-8859-1?Q?3ORnm0noQ+UnrWXdErUfgOAxGT0U0ReBSvjfhq8oA8l7fQotiMpeUhWs99?=
 =?iso-8859-1?Q?7B47Tz3ehHe9P5sKZcHwu4gg9oHSdoSip5tcXawamSen/tHXm2OiVwp8wp?=
 =?iso-8859-1?Q?yKLRKTSLtefRXF1zm193+2DHpledKCbQ/g1N6Vm2b9vkCFxT4WsbULgdo9?=
 =?iso-8859-1?Q?37OzWaTBvm0CleGna4SCHgSfEaQEiRvgRsawalyu3nqgMT+YbQBScN8lG8?=
 =?iso-8859-1?Q?YYsGdSKqjiQ7Z2yp8zb9hlflWABOZopn80YP9csQO1f3hfemqJDf5Xa+JM?=
 =?iso-8859-1?Q?+4E0+5mJv0Z9BDUOXYXU/xZa7j4LzYiRi+fQfn/GFxWwdRouWttITUHira?=
 =?iso-8859-1?Q?T2H/gUk3Eq6p7Pm/lYFDoKCZjun4+weE1R6ZPLS2xL4JRJIaLp5wbLwFhp?=
 =?iso-8859-1?Q?KvaQMhwxEEwSTqoGS8Ch2FqPo5fZGiqSjfoJ8/BwKAV7fUfs4jKZK5lvpn?=
 =?iso-8859-1?Q?WIOO/ASH1hR+Dqmjyh7r6bsNm8RJmGrnsjezTkvekh9dKmhkJJYIpGWrNU?=
 =?iso-8859-1?Q?SjWlPrk1Nmgpv+TTCkd2quscB7B7p/mi1tc0eUOEMelRFEBgih2XxZqO1d?=
 =?iso-8859-1?Q?wBQ+EOj7POty6JRe8UvUyjh88DwyXbYU0EjyZ8Lo0Q2AbXuRBLWseAic32?=
 =?iso-8859-1?Q?K5pCuKHzfuIiYA7G061D2gbK+kuz7NWpJgCSA4SdPeU0im4ZK/HieUbGdM?=
 =?iso-8859-1?Q?bn7cBYdx5bfxeNFNX1RDVBqkAHyiIs6W3j8C2+dlBt/v9kEHofuEtFH8QE?=
 =?iso-8859-1?Q?p/DcQTaZv2gxAbWwNpBAbSOX1u5ZQ5fL77/Tv97ZDlD+z+Uhy8n+kjoB0r?=
 =?iso-8859-1?Q?tcFlvJKRWF+y2+y+ALk0cMW7nGIN6GYj/ZNSWc75acVMhgCCK8s5LeikU+?=
 =?iso-8859-1?Q?lv2bwjJB6PTrrnDOso/HX7wxiCmyXSbMOW456rSLaegVIhbAQV0UfEp7Hq?=
 =?iso-8859-1?Q?zkEeAu+LF52qh679s8aMBJrhngpuxyI0ZqNI5uKU/4nkqgRj7t4sI6mq6/?=
 =?iso-8859-1?Q?zyJ4GR6q26bLjFQnLspmfy1XpyPvb5ipwW0gqc//40BalP3y8OU+BdkbjU?=
 =?iso-8859-1?Q?/xp1rMJvKuYZsPMjcKMHuBmarWHF2wMVpizYaeOI6t1I884adz/s5NqkUi?=
 =?iso-8859-1?Q?NGL3c5AGVWAi6L7oYdVFdLkMSb2KBYVbXEVLNlLN8huP/jtRcywI6NX1eO?=
 =?iso-8859-1?Q?0lrBVH8mdxZKVjotRJCt4YcEN8futKYTTWwGh3tUjHgQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RCheLTqKhHmMdyk1PI/EmYpthWuVQIqjl/D1om+3H/uqPmZ4D2vs9WPc8O?=
 =?iso-8859-1?Q?PtARnUW/bIum+/aXp3HnbgUJt+v6G8ckelpQ0hHFSwqrq+ijdQZlBoLDrE?=
 =?iso-8859-1?Q?mo6h5vVUxQNE+7v4ICN5ZHGUQ31ouiyDm74hUM0rskZvttvrFF2Qc3PjAC?=
 =?iso-8859-1?Q?lPCzcSuFCb7fQAcEnAQ3RKmpSqlOHv2a+22IToy1BH2BOwvFPv8Rn3sao1?=
 =?iso-8859-1?Q?wU/Dm+HYeC8/h31FvmDyrFL2a7VHJUCH4QPCczz0892Jot7ITywqd67i2L?=
 =?iso-8859-1?Q?Qre7q6hhCLvX8hAHduYCxGFSikJi+e6BTeCpS8y3vXva09mLrwFCUfwRz4?=
 =?iso-8859-1?Q?5WcdUPlfeN2Wd2vq6Q27XYu6RMhuOHAEZKCEWXYccxO6FTLQTt7B7x8WXl?=
 =?iso-8859-1?Q?VaSXeqLN6BNPIeFNm0RA1vfDUOKlx7E2b327HQl+Py1eU4T2KVUq109ZzC?=
 =?iso-8859-1?Q?UHr25snPXQjA3KmmLYoYX9JNnUDIBoEBN/2i5Lb9HAE5z8VcHIu/Vi+C+z?=
 =?iso-8859-1?Q?67qSEN9KNbc8dSD6mSGxk/DwtKMjtoe1RUOS29zP5cQg/6b4ROFgu5sdbh?=
 =?iso-8859-1?Q?HAilXhzPGogVGoxc017Gr3JTlDsqH5Dw8KrUHO+6xFWuQnuTZzBcYtmd+j?=
 =?iso-8859-1?Q?Vl+8275Nc0ZLyS4OP6E5JgKapmV44WfWTduY3TsEl6ERqJhuYYvYlwwVvJ?=
 =?iso-8859-1?Q?f6u9XBvyVL84Q5uc2dn7uaKkunchcsxrY7SxNs7sNaI31G3tK2GZFpkO24?=
 =?iso-8859-1?Q?/BHQ3cgjcXfdlzrKh9jyJtQkXYuCcGhfyV7pO7uGdy7SSekgX817VEnwzN?=
 =?iso-8859-1?Q?JIVM1Alt5Zy/k6hK7d1MJueOnkFzZ8EdaBj+Swemx9C/63704A95yDchgv?=
 =?iso-8859-1?Q?G44h/1be5+CwUOiBSKbdOEDyS6+AFjSUdLKf9tTs8cJQrbQ7pJQN5/dtS4?=
 =?iso-8859-1?Q?UgRDr3AFV8oPKOZl9pg+rxjZnnDZ2NAl/5DsHu5rT0iW5yZfoNIVM3gLgk?=
 =?iso-8859-1?Q?wHyh0AK8j+Eahfs+opORRNaQ6PqYhu4vAc3FGUgF77P1RCFktEku3u28Da?=
 =?iso-8859-1?Q?YLY1/MddvN4SD0Tht6YYvTe3Uob/IkdnpTKxUWqSySCvsk4QE91WptZ37F?=
 =?iso-8859-1?Q?NGj94glxCgBtrMFtZTU+jZ+CTj+0UCD2AZCwd5IWVAy7Pb2n1xch+p3RDV?=
 =?iso-8859-1?Q?AuIPjEDT992YkZpBhEEd7gtnwwMFV5wBeLrzpijR41+zXdlIjrinMydLzz?=
 =?iso-8859-1?Q?GBAnp2rjPNGabP52yB+r4RmgUHHDd8BASYygPw+6DIZ1DEPCLg76cq/zsw?=
 =?iso-8859-1?Q?l1Z3VrqY7QhgJbfONd4XCnc8A/+ilaAanhj6VU13dF5OVQVgpjcYCgI5Ja?=
 =?iso-8859-1?Q?Ck+38kJHKlVud0cTASX533N31OxHcbhwu7OXmCdMWzMof1daX4mLkKlEAc?=
 =?iso-8859-1?Q?2ObDuSg0Auk2gqE+3uKfkT1Mq1bcrsRXH3l4fZkCNxQ4pWqKvMeFYY9O5+?=
 =?iso-8859-1?Q?5fWFGNMzegnGidUzmarHuCLKEsUVHl2Sg1DKlSfeqwJ1iw7Hj68pxjVqCw?=
 =?iso-8859-1?Q?pSEbwCR0L4bkEtztCPKA7jTvS72CBRNtIioS55YU6SJiMckykugaSuuoAY?=
 =?iso-8859-1?Q?efwxG90qv9xnf5Yp5hO2VVNYXi8MfhcD5FY0KRit60Aw+qLPgB4/JanROx?=
 =?iso-8859-1?Q?e7WDL3Ccs4CQmlnJurtmWp12BpUGH8LEBbIHXtZmdGViZUZYdlwbeCsnKS?=
 =?iso-8859-1?Q?uLKQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR11MB53099000D44AA53800050124DB59ADM4PR11MB5309namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34c83cc-ec69-445b-688b-08ddcb60b0dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 09:50:30.0819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8753QGO0MgRd6Yo+CYLbdO+ZEvHWGKhYueu4psY+XRXOf2FBBnocevVW32bYNbw0ezyEmTT1lcLEVtxVq6d+0Y3aSlX/Uo1d1GjLipx3xl3h6WuvxtCMnFzd74opdprw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4515
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

--_000_DM4PR11MB53099000D44AA53800050124DB59ADM4PR11MB5309namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: B S, Karthik <karthik.b.s@intel.com>
Sent: Wednesday, July 23, 2025 11:23 AM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Murthy, Aru=
n R <arun.r.murthy@intel.com>; B, Jeevan <jeevan.b@intel.com>; B S, Karthik=
 <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 4/5] lib/igt_pm: Move check_dpms to igt_pm lib

The check_dpms function in kms_pm_backlight.c is moved to igt_pm lib
to make it accessible to other subtests which need to perform a
simple DPMS toggle.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_pm.c                   | 21 +++++++++++++++++++++
 lib/igt_pm.h                   |  1 +
 tests/intel/kms_pm_backlight.c | 20 ++------------------
 3 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 7f9cbd69a..cf1c442f8 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1487,3 +1487,24 @@ bool igt_has_pci_pm_capability(struct pci_device *pc=
i_dev)

         return (offset > 0);
 }
+
+/**
+ * igt_pm_dpms_toggle:
+ * @output: igt output for which DPMS toggle has to be performed
+ *
+ * Toggles the DPMS state of output to OFF and then back ON.
+ */
+void igt_pm_dpms_toggle(igt_output_t *output)
+{
+       igt_require(igt_setup_runtime_pm(output->display->drm_fd));
+
+       kmstest_set_connector_dpms(output->display->drm_fd,
+                                  output->config.connector,
+                                  DRM_MODE_DPMS_OFF);
+       igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)=
);
+
+       kmstest_set_connector_dpms(output->display->drm_fd,
+                                  output->config.connector,
+                                  DRM_MODE_DPMS_ON);
+       igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index c73972f2a..e931e51af 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -98,5 +98,6 @@ uint64_t igt_pm_get_runtime_active_time(struct pci_device=
 *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
+void igt_pm_dpms_toggle(igt_output_t *output);

LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

 #endif /* IGT_PM_H */
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.=
c
index 9b341c73a..a0ecf2b0e 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -142,22 +142,6 @@ static void test_fade(igt_backlight_context_t *context=
)
         }
 }

-static void
-check_dpms(igt_output_t *output)
-{
-       igt_require(igt_setup_runtime_pm(output->display->drm_fd));
-
-       kmstest_set_connector_dpms(output->display->drm_fd,
-                                  output->config.connector,
-                                  DRM_MODE_DPMS_OFF);
-       igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)=
);
-
-       kmstest_set_connector_dpms(output->display->drm_fd,
-                                  output->config.connector,
-                                  DRM_MODE_DPMS_ON);
-       igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
-}
-
 static void check_dpms_cycle(igt_backlight_context_t *context)
 {
         int max, val_1, val_2;
@@ -168,7 +152,7 @@ static void check_dpms_cycle(igt_backlight_context_t *c=
ontext)
         igt_backlight_write(max / 2, "brightness", context);
         igt_backlight_read(&val_1, "actual_brightness", context);

-       check_dpms(context->output);
+       igt_pm_dpms_toggle(context->output);

         igt_backlight_read(&val_2, "actual_brightness", context);
         igt_assert_eq(val_1, val_2);
@@ -310,7 +294,7 @@ igt_main
                                 test_setup(display, &contexts->output[j]);

                                 if (tests[i].flags =3D=3D TEST_DPMS)
-                                       check_dpms(contexts[j].output);
+                                       igt_pm_dpms_toggle(contexts[j].outp=
ut);

                                 if (tests[i].flags =3D=3D TEST_SUSPEND)
                                         check_suspend(contexts[j].output);
--
2.43.0


--_000_DM4PR11MB53099000D44AA53800050124DB59ADM4PR11MB5309namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;B S, Karthik &lt;karthik.b.s@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, July 23, 2025 11:23 AM<br>
<b>To:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;<br>
<b>Cc:</b>&nbsp;Reddy Guddati, Santhosh &lt;santhosh.reddy.guddati@intel.co=
m&gt;; Murthy, Arun R &lt;arun.r.murthy@intel.com&gt;; B, Jeevan &lt;jeevan=
.b@intel.com&gt;; B S, Karthik &lt;karthik.b.s@intel.com&gt;<br>
<b>Subject:</b>&nbsp;[PATCH i-g-t v3 4/5] lib/igt_pm: Move check_dpms to ig=
t_pm lib</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">The check_dpms function in kms_pm_backlight=
.c is moved to igt_pm lib<br>
to make it accessible to other subtests which need to perform a<br>
simple DPMS toggle.<br>
<br>
Signed-off-by: Karthik B S &lt;karthik.b.s@intel.com&gt;<br>
---<br>
&nbsp;lib/igt_pm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 21 ++++++++++++++++++=
+++<br>
&nbsp;lib/igt_pm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;tests/intel/kms_pm_backlight.c | 20 ++------------------<br>
&nbsp;3 files changed, 24 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/lib/igt_pm.c b/lib/igt_pm.c<br>
index 7f9cbd69a..cf1c442f8 100644<br>
--- a/lib/igt_pm.c<br>
+++ b/lib/igt_pm.c<br>
@@ -1487,3 +1487,24 @@ bool igt_has_pci_pm_capability(struct pci_device *pc=
i_dev)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (offset &gt; 0);<br=
>
&nbsp;}<br>
+<br>
+/**<br>
+ * igt_pm_dpms_toggle:<br>
+ * @output: igt output for which DPMS toggle has to be performed<br>
+ *<br>
+ * Toggles the DPMS state of output to OFF and then back ON.<br>
+ */<br>
+void igt_pm_dpms_toggle(igt_output_t *output)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(igt_setup_runtime_pm(outp=
ut-&gt;display-&gt;drm_fd));<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(output-&gt=
;display-&gt;drm_fd,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;config.connect=
or,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_DPMS_OFF);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(igt_wait_for_pm_status(IG=
T_RUNTIME_PM_STATUS_SUSPENDED));<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(output-&gt=
;display-&gt;drm_fd,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;config.connect=
or,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_DPMS_ON);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(igt_wait_for_pm_status(IGT=
_RUNTIME_PM_STATUS_ACTIVE));<br>
+}<br>
diff --git a/lib/igt_pm.h b/lib/igt_pm.h<br>
index c73972f2a..e931e51af 100644<br>
--- a/lib/igt_pm.h<br>
+++ b/lib/igt_pm.h<br>
@@ -98,5 +98,6 @@ uint64_t igt_pm_get_runtime_active_time(struct pci_device=
 *pci_dev);<br>
&nbsp;int igt_pm_get_runtime_usage(struct pci_device *pci_dev);<br>
&nbsp;void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);=
<br>
&nbsp;bool igt_has_pci_pm_capability(struct pci_device *pci_dev);<br>
+void igt_pm_dpms_toggle(igt_output_t *output);</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">LGTM,</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Reviewed-by: Santhosh Reddy Guddati &lt;santhosh.reddy.guddati@intel.com=
&gt;</div>
<div style=3D"font-size: 11pt;">&nbsp;<br>
&nbsp;#endif /* IGT_PM_H */<br>
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.=
c<br>
index 9b341c73a..a0ecf2b0e 100644<br>
--- a/tests/intel/kms_pm_backlight.c<br>
+++ b/tests/intel/kms_pm_backlight.c<br>
@@ -142,22 +142,6 @@ static void test_fade(igt_backlight_context_t *context=
)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
&nbsp;<br>
-static void<br>
-check_dpms(igt_output_t *output)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(igt_setup_runtime_pm(outp=
ut-&gt;display-&gt;drm_fd));<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(output-&gt=
;display-&gt;drm_fd,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;config.connect=
or,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_DPMS_OFF);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_require(igt_wait_for_pm_status(IG=
T_RUNTIME_PM_STATUS_SUSPENDED));<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_set_connector_dpms(output-&gt=
;display-&gt;drm_fd,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;config.connect=
or,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_DPMS_ON);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(igt_wait_for_pm_status(IGT=
_RUNTIME_PM_STATUS_ACTIVE));<br>
-}<br>
-<br>
&nbsp;static void check_dpms_cycle(igt_backlight_context_t *context)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max, val_1, val_2;<br>
@@ -168,7 +152,7 @@ static void check_dpms_cycle(igt_backlight_context_t *c=
ontext)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_backlight_write(max / =
2, &quot;brightness&quot;, context);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_backlight_read(&amp;va=
l_1, &quot;actual_brightness&quot;, context);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_dpms(context-&gt;output);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pm_dpms_toggle(context-&gt;output=
);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_backlight_read(&amp;va=
l_2, &quot;actual_brightness&quot;, context);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(val_1, val_2=
);<br>
@@ -310,7 +294,7 @@ igt_main<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_setup(display, &amp;context=
s-&gt;output[j]);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tests[i].flags =3D=3D TEST_D=
PMS)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; check_dpms(contexts[j].output);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; igt_pm_dpms_toggle(contexts[j].output);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tests[i].flags =3D=3D TEST_S=
USPEND)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; check_suspend(contexts[j].output);<br>
--<br>
2.43.0<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB53099000D44AA53800050124DB59ADM4PR11MB5309namp_--
