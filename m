Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0D7D4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 05:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8120810E35C;
	Mon, 19 Jan 2026 05:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTw9ZgsO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182D010E35C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 05:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768800385; x=1800336385;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MD4N+Cv1Lwp/MKgA1ZflcGJ53wwfdO6eX9+cNMKZx7A=;
 b=MTw9ZgsO8YLWYcY3DPUCSyABFmF/cGAZ+T6k/eGiGwSngMqXGMk0ZeXh
 +dSf65x1UgJGrLmrUbOPEITJwnKR/fUV0/nv8KqIjL/XbFJ/fYqniLAS2
 inkM/RpXS9LFQLAgWxoajBnIHzG2xDw1+qfEU73fyStknu/4Yl0By5lnJ
 laP352nh7e81otew2XzyAM4o0gvBOcCkiVuwrVgv/YE6rxIxNBcSqlsII
 D6xIcGnyiDmEhDiVh7LPQomic33uZBa3h9jO74TpBLEs+Ke5gWREbg+Xg
 5mN2h41uMS8MwCd4ZE2R0iiVsj3jT33puaAPhF49dDKc56wYhQ2fDz+1g A==;
X-CSE-ConnectionGUID: zyo7OFQvRWWDVPzat8T4Gw==
X-CSE-MsgGUID: QCe35wamQbO8c6moyivuYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="72596126"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="72596126"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:26:24 -0800
X-CSE-ConnectionGUID: pJ81XDnOSHaiYw1lSN+wAw==
X-CSE-MsgGUID: wb6WDU9uTT6Kfp0Vdt6LNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="236463406"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:26:24 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:26:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 18 Jan 2026 21:26:22 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:26:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVL/TWzUrKsmD0LDo812WT/UZV8vLv3Ok0EXhMyN37bim/v0Zqy3Jfr0c1bnmK/wU6AaR4OXZHr0mnGfkBNz3COuInhfVw0JMaBhI6RBBgy0eZ3bNZAcjWR6JnqU+u5B30hPdRbuod7w5/DuPFb72P1lDDpVblim7vwzuExr8sHHANCROHQwxM58lrH80YI9f1xuTJ9OqdExhHhkkYxq8aZddSgwH5WPUXWThXK8/sqSmjYeM+bcQyQGz12ntjGhsHMuUeKWXqTDM00WKo7ZqqQVdn4clNdSLH1oV0/Myz3C6p2/E2Dw3JmUmN4N975TOknqh4XAUPWvUPHB8VvJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BY+HAweniQ8YF7GMxHqoF8in9VmtQB1tem9LIWrrIVY=;
 b=PqxLXCrcAuxI4Y8VljSmTVOYTXtvr2nGk3g5cwn889kh/7ZZSFwlnoajJ4hDVwrbXmhRHfveMXntlDYyl5rfr5eUhPUEPamxe/Lsn/3UlUqzDr119hRwLG2zllyWqeXZ/eHqn3NsvpWPoqC0k0QJwc5gBekj+lN3B62YgOaX5wW9HMB7R6lXdGNQit7tjCMS4TK5PrlcQ5aAxYlZTPU86EClg6jhWbZCGyVAs96c/KVnXMqh7ssx78lGAZNddDOrPew5RbFqzzo5UEzqLbU2fMy48Ed0g9og0NIccMF667rWmtjzDcM+3gt1z784Mi2GfGMzm8yZtspTRV8xWJckWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ2PR11MB7504.namprd11.prod.outlook.com
 (2603:10b6:a03:4c5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 05:26:15 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 05:26:15 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHciP7XkgC+KpYm20eTttXamoODnrVY7eyAgAAFwoCAAAHHUA==
Date: Mon, 19 Jan 2026 05:26:15 +0000
Message-ID: <DM3PPF208195D8D0552C8F23DF60C038F18E388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-7-sowmiya.s@intel.com>
 <DM3PPF208195D8DB744E4298B2AFECE6145E388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <PH7PR11MB6796D832928BA5A82936C14CE588A@PH7PR11MB6796.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6796D832928BA5A82936C14CE588A@PH7PR11MB6796.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ2PR11MB7504:EE_
x-ms-office365-filtering-correlation-id: df1817c7-3c5c-4c48-85df-08de571b443c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BwLjvNx6weSZRCEITYNF0aDbf2NyV0ktoLfVtYuv2l6P8Uv0/kfHDKWqdL45?=
 =?us-ascii?Q?ZSBnMmBCTg6eQXqMKRfdkk1QVbA5+ldcMSjGO9NG9PwGVUYTZhWYDBTpU6Al?=
 =?us-ascii?Q?s9zo3shT2U0TrncFHoUFicmT9En7u0DK9kepddOxdVzTbPt8j1i7nI+KRpXT?=
 =?us-ascii?Q?Exij04C3fI3dTjSy/GUuJXWoNDepz4pCJt3dR1/KweV99M4uP6bWsyNYqLEi?=
 =?us-ascii?Q?o2a9vjzrqlECUbyjwkdkNm1T/denk8tp6ass5w4PgEOUsWjBFUXdKYinrQHS?=
 =?us-ascii?Q?uevvg87+ALPknMDhIZnDu91soRKREUK9zZEMMBd1EnSYPUvV4GwDTZN/wIfo?=
 =?us-ascii?Q?f5qTEBFwzCPhdJfXwAwmyghbsAHQ7wYREJyfFzZ3z3UGO/i7jH8lFZtpxU3n?=
 =?us-ascii?Q?fZBX5opOAT2TZkMevSTFESrWZFlQnWZY+rB3mzgPCfy7aTMRidHkTNBA06Ok?=
 =?us-ascii?Q?KH0UUmE3Bp4stjv1MuUxYnxL76Ja43PrxsjiRdQI0oFOvpvAP6p7CvMVlU+3?=
 =?us-ascii?Q?E1Nau5xSn3AnIjbsrCWhME7eYHLmWxIL7e27pFhr7cFzW+kw44bhRwTl7sUq?=
 =?us-ascii?Q?LqmrIZrdTgUbPm9GK+iftNFGWN62b3jjkxJnNvO+6M8MI1a93ZCGkZyFTn6n?=
 =?us-ascii?Q?p41dgWTVFEvSZ4uudSY3C0gQmzBx2HG1WrqXE1aaqC/Duv5YifcFy11im9ho?=
 =?us-ascii?Q?28ryUZpuHRi8lBP8zfzfnx2UpE5LkOGRYbisA1zK/5nwbqJ0oGYPeMaEHvtg?=
 =?us-ascii?Q?0lTP5g3f/25vn/LHWekEMppq/QoMytK7xA+HYyn2GGF+6GbtyRqT/6Llif2P?=
 =?us-ascii?Q?JtBkjBxdGWXjy7Ylxnll3cj8ytW9PkufCbAxRnW2LFqdvdq2y1Mf+fsKKzFk?=
 =?us-ascii?Q?x5ACDDjkI+FXXaUMRJwElTc8xkk9lYld/fUyb0lpvAM4LhUnfKZ+DTY8/CPs?=
 =?us-ascii?Q?eLtCKXyX+3egYjxfVTGq+pJwZWGxDV8dpt4UPcsw9jx6K2XCI36sP1r9VmMv?=
 =?us-ascii?Q?b95S+2MJ6O32hdgrZhtZk2kNysunUK32c+ocNNWSiUb4Ie/8dZpuQHn+AzYf?=
 =?us-ascii?Q?t/0TU6j+HD2hLIp4myrj7fhML92E+YFMBBsfplizLPBrz0fCU36nZZ7QTtz3?=
 =?us-ascii?Q?rfQOxyWhRhybTKhDsX5bXDPvozNo5aNxQyscGGPzc1SC/0oNvYUgcR5rqPmU?=
 =?us-ascii?Q?6Fl3EkGUUbS2J2nlE13KkKhQvHrl65YzBIr4Kgn8Z3d4126JW+XVpzku+Zwz?=
 =?us-ascii?Q?oCjj/upxNFVMEPM9e5yYp6yALAphgS0VQaaEE3q5cIylLuZmfy/NsuvOa1oC?=
 =?us-ascii?Q?5eFkVMyBJzwsRNvgVafotlvJ+HLtyx58A/am+Hfou88QLyg6HYrKf7IwTMR9?=
 =?us-ascii?Q?bBB/Q12VVinS6G2Wi7ckiz0JnX0xYHin5BamTcQDjnsqUPwYh8YMFcJ0gW+k?=
 =?us-ascii?Q?LSPauLbYjtusBGlKJhiaEUNR9gF9RA+QqmiolhFQ8JGisEHhMcQB7WryejYi?=
 =?us-ascii?Q?4eBoXf89UEXFAiqz9YrXBzNbJSl+UtMR0edmWRH4ffnPpzZVXcmYIDILRJYu?=
 =?us-ascii?Q?WjwJvl8/vDUP2aPlYR74ONUv/q4xFh91AGZAAnitFW8tNnrudLXIMdVp9o9d?=
 =?us-ascii?Q?zONeEo/C3qVNtQSao7g5R7s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vv/kDdZP7pva4InVLsBwLlFvhO0piFHyH/cHosyBUmm9pWmorE9ieNbLQWij?=
 =?us-ascii?Q?hwXNEeuSBZjvvlB567vI9Vu7/dynkb3JDnVxj0C+qc75tC9X5Izc7obGJo29?=
 =?us-ascii?Q?QzYVXCrUEHOBtCNVta/uPCGK+VX5+giarPFG7MYhFXVvuQw58FJcPFgAPtqu?=
 =?us-ascii?Q?OYYvVeGi94ZFHeKTvm/shIM9DAVJmPRytg3qHGnBKvJFZAB+hVgP++bsxHiF?=
 =?us-ascii?Q?q5WaFT/7Ic4EZaqj2neTFEi+YrtSvuYtePqNCtgOvFCcQ70O+CWXJi07OnRo?=
 =?us-ascii?Q?bJB+qdXJQxir/CBYQbCOJcoPFbTsq15U19xwbv5kLepwICHGeTUsJfqVzS4k?=
 =?us-ascii?Q?eoodRNwdDjUeqByXslYoYhGSavWaRxb/DCTkERf96U3jUp1eku17c4CYiNz0?=
 =?us-ascii?Q?z7H3ijNnihl+zGfNVN047S1cWF8ZTKxdXImxbmh1jGMs5jJrVS2nwHjFJ+cx?=
 =?us-ascii?Q?0prolVXVGawwTHfImZHvv5WdOuixmLeN2K75dTVC64k7p5xk+byiWStebOsT?=
 =?us-ascii?Q?8wmNCnu0c+xDnYTKOiFGA5CXONYMsz5ujrKS3/G7keVMuYfgI2ihlEF/DYxy?=
 =?us-ascii?Q?MTv33wzEGKs8OvzXZ/tqnNDXf/QqUcEUoFEfv1UvDeBX5ai6flkVADtbuMOD?=
 =?us-ascii?Q?vMW+hYDpPa+v19+90U+rdKknA2QghaBPe8iMi1EE216HjauSFxlIGLmBpnU1?=
 =?us-ascii?Q?fpG95/3AaPy2Ip2dA/5aghI7SrUYOC2iZTx1zu4a6kS92JqLNWf3nH8xq3Ib?=
 =?us-ascii?Q?xnkG+dnE9Ys85adtj20FS1dxO+DAfdour6EEkZtm0JR7gGhwEJG8xk5PWLJ/?=
 =?us-ascii?Q?/fi2TlvFjTs64DQRcYyyOGFbz21YkJoJ9WMyEmOuFBDkIM1Fu3sk0JrNB/Qc?=
 =?us-ascii?Q?yburTDl8Y7zD3Nqf39krN1wRvm/GP/qww3UVPojUWsSJ1JzBrbRNJrJZ3YRV?=
 =?us-ascii?Q?9i42/6bE7MwO5i9+x+TMHM99mxDBpIM2cc+G+rN6FC61y7lJIb6FbfHl5yU9?=
 =?us-ascii?Q?hRBJTTXECNwL2QCx9Auv7DHEnkXOyHsw9fxPyrcW2M6c2ZnZBRhc8dKWBwev?=
 =?us-ascii?Q?rT1/lnjIUDQfBoviZdGKXYVa/Qgq9lEvgPJjixzoH/jfnwrJQGmXXsz7D9Sm?=
 =?us-ascii?Q?GOchtv6YdXWYFjopCkyi57ln+l0GIXik7gXyQ58jm/2/jGx+AyP58AxZg6OQ?=
 =?us-ascii?Q?2WQ/lqMbWaV/KGAXu5abcXM2B/jFWzLxmrcMAC7PZJ66EJ26C7OPCvUmDo5s?=
 =?us-ascii?Q?Tr4yBZWA2uinBgq9eVI/vJVwMfQGstjiqSJUGvLFOvBit7RzkXHWCl8bJFqz?=
 =?us-ascii?Q?cNs2HLxJGV3+G4h8NlUTgHnuyEkbCE4Yb8PTNuVuENBByseUWEmPOWeUi2d9?=
 =?us-ascii?Q?4ESyYgQcIvb4BrSlFnb/P/V78YgsR0wewen/j50ojO74WB5o463r+NRkD7Mk?=
 =?us-ascii?Q?fyC81i3c/K9Erw6+b8N2lrdknfgJSO0WA1qX9bnKueOwt+asyAbdC99Bi8OM?=
 =?us-ascii?Q?ZBiXaNuSo4defDMxRtEo5M8S//u4onjUYhuLsXxx7zcddrUYmqcdESjm4s1q?=
 =?us-ascii?Q?ODOClb/oeGSc7daC4HZNZZYZRHImrC4PnO62smB6SjaLaRgMfSPN8cDOBehZ?=
 =?us-ascii?Q?c2t6xEO/IOqMp7JI8dXLzY4shlgaIS8ZCtH+FT0MetXPUxcNd0Rou5ciD33b?=
 =?us-ascii?Q?7qzeLzFwCf8ibB4Q/ae5dox7cFpoS+8mBK3yzLxqZ4p3o1XIgBaiziAM/AVM?=
 =?us-ascii?Q?BdNnodTxxg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1817c7-3c5c-4c48-85df-08de571b443c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 05:26:15.3704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0TKlwCd9rwzVgqlDvEMn53CUZZBtbkRsWQ5eIRwVXNtq72m2sPuZUMx6akkQBxJQrJ1prug020i/KB0R8M2RHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
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
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Monday, January 19, 2026 10:47 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor writeback=
-fb-
> id subtest
>=20
> Hi Suraj,
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: 19 January 2026 10:28
> > To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> > Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
> > writeback-fb-id subtest
> >
> > > Subject: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
> > > writeback-fb-id subtest
> > >
> > > Remove individual tests for each format for the test writeback-fb-id
> > > and introduce dynamic subtest generation based on the formats
> supported.
> > > Framebuffer creation was now part of the subtest level based on forma=
t.
> > >
> > > v4: squashed the FB creation function with this commit (Suraj)
> > > v5: -Update dynamic subtest documentation (Suraj)
> > >     -Rename input_fb to in_fb
> > >     -Set plane to in_fb and remove unused input_fb as an arg to
> > >      writeback-fb-id function.
> > > v6: -Remove in_fb inside subtest and reuse input_fb from
> > >      fixture (Suraj)
> > >
> > > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > > ---
> > >  tests/kms_writeback.c | 60
> > > ++++++++++++++++++-------------------------
> > >  1 file changed, 25 insertions(+), 35 deletions(-)
> > >
> > > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > > 63917bf4f..0ed86c865 100644
> > > --- a/tests/kms_writeback.c
> > > +++ b/tests/kms_writeback.c
> > > @@ -51,9 +51,6 @@
> > >   * SUBTEST: writeback-check-output
> > >   * Description: Check writeback output with CRC validation
> > >   *
> > > - * SUBTEST: writeback-fb-id-XRGB2101010
> > > - * Description: Validate WRITEBACK_FB_ID with valid and invalid
> > > options
> > > - *
> > >   * SUBTEST: writeback-fb-id
> >
> >
> > This is the an example of the documentation that needs to be done for
> > dynamic tests
> > * SUBTEST: %s
> >  * Description: Test content protection with %arg[1]
> >  *
> >  * arg[1]:
> >  *
> >  * @atomic:         atomic modesetting
> >  * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
> >  * @legacy:         legacy style commit
> >  * @type1:          content type 1 that can be handled only through HDC=
P2.2.
> >  * @suspend-resume: Suspend and resume the system
> >  * @legacy-hdcp14:  Test HDCP1.4 content protection with legacy style
> commit.
> >  * @atomic-hdcp14:  Test HDCP1.4 content protection with atomic
> > modesetting.
> >  * @atomic-dpms-hdcp14: Test HDCP1.4 content protection with atomic
> > modesetting and DPMS.
> >
> > Regards,
> > Suraj Kandpal
> >
>=20
> Here we have one subtest "writeback-check-output" under that two dynamic
> subtest will be listing "writeback-check-output-XBGR8888" and "writeback-
> check-output-XBGR2101010". It is enough to add documentation for subtest
> not required for dynamic subtest.
>=20

Hmm okay.

> Regards,
> Sowmiya
>=20
> > >   * Description: Validate WRITEBACK_FB_ID with valid and invalid opti=
ons
> > >   *
> > > @@ -300,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> > > *output, igt_fb_t *valid_fb, ig
> > >  	}
> > >  }
> > >
> > > -static void writeback_fb_id(igt_output_t *output, igt_fb_t
> > > *valid_fb, igt_fb_t
> > > *invalid_fb)
> > > +static void writeback_fb_id(igt_output_t *output, igt_fb_t
> > > +*valid_fb)
> > >  {
> > >
> > >  	int ret;
> > > @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options,
> > > help_str, opt_handler, NULL)
> > >  	}
> > >
> > >  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> > > options");
> > > -	igt_subtest("writeback-fb-id") {
> > > -		igt_fb_t output_fb;
> > > -
> > > -		igt_skip_on(data.dump_check || data.list_modes);
> > > -		igt_skip_on_f(!(data.supported_colors &
> > > XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> > > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > > mode.vdisplay,
> > > -				      DRM_FORMAT_XRGB8888,
> > > -				      DRM_FORMAT_MOD_LINEAR,
> > > -				      &output_fb);
> > > -		igt_require(fb_id > 0);
> > > -
> > > -		writeback_fb_id(output, &input_fb, &output_fb);
> > > -
> > > -		igt_remove_fb(display.drm_fd, &output_fb);
> > > -	}
> > > -
> > > -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid
> > > and invalid options");
> > > -	igt_subtest("writeback-fb-id-XRGB2101010") {
> > > -		igt_fb_t output_fb;
> > > -
> > > -		igt_skip_on(data.dump_check || data.list_modes);
> > > -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> > > "DRM_FORMAT_XRGB2101010 is unsupported\n");
> > > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > > mode.vdisplay,
> > > -				      DRM_FORMAT_XRGB2101010,
> > > -				      DRM_FORMAT_MOD_LINEAR,
> > > -				      &output_fb);
> > > -		igt_require(fb_id > 0);
> > > -
> > > -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> > > -
> > > -		igt_remove_fb(display.drm_fd, &output_fb);
> > > +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> > > +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> > > +			uint32_t test_format =3D fourcc[i];
> > > +			int bpc =3D igt_drm_format_get_bpc(test_format);
> > > +
> > > +			if (is_intel_device(display.drm_fd))
> > > +				if (!strstr(igt_format_str(test_format), "BGR"))
> > > +					continue;
> > > +			igt_dynamic_f("writeback-fb-id-%s",
> > > igt_format_str(test_format)) {
> > > +				igt_fb_t output_fb;
> > > +
> > > +				fb_id =3D igt_create_fb(display.drm_fd,
> > > mode.hdisplay, mode.vdisplay,
> > > +
> > > get_default_fb_format(&display, bpc),
> > > +						      igt_fb_mod_to_tiling(0),
> > > +						      &output_fb);
> > > +
> > > +				igt_skip_on(data.dump_check ||
> > > data.list_modes);
> > > +				igt_skip_on_f(!(data.supported_colors & (1 <<
> > > i)),
> > > +					      "DRM_FORMAT_%s is not
> > > supported\n",
> > > +					      igt_format_str(test_format));
> > > +				writeback_fb_id(output, &output_fb);
> > > +				igt_remove_fb(display.drm_fd, &output_fb);
> > > +			}
> > > +		}
> > >  	}
> > >
> > >  	igt_describe("Check writeback output with CRC validation");
> > > --
> > > 2.43.0

