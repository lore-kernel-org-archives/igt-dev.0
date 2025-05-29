Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BAFC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 14:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694E710E1FB;
	Thu, 29 May 2025 14:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8a9+fXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECFF10E1FB
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748528571; x=1780064571;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VSIdZE1j+UpsGEYH5+Daoty0NWu0PEmEmQV13kRLcRE=;
 b=e8a9+fXk0PReUd4WbGxO1DQ7wpiOhTuvdZUFhWhu/nxht1wj265eA7JD
 mFkRPMGz/uum58GdEDyRMjF/hIlkjM8t5rAzR49U/m7587FwaAaDzAtnF
 uvdVz8NpF3SKoy0VMYQU8fLd6WqEjKyGKpT02amUJ1A50U8UBy2NQ4Wj0
 ZRg4U2nvegCTFqrukpihGD4jyFMECbrFqiky5Ed3RjzyqL2nJcncTydVx
 IbLnuzYhuygo9fRyYXbEwgm2HwSAG0RhR4GM4ihPgDDvNhM2CZMPhSAP3
 fTxTmXekwrWTrPKowqAy12XybeFC443W0wW+AzWC45TkbF4Tm0tR/JGjf g==;
X-CSE-ConnectionGUID: BRhVBwgIQSq3u5Ec5MKDVA==
X-CSE-MsgGUID: Fl5/vKXKQdi+tRzhZsEukQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50743390"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50743390"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:22:49 -0700
X-CSE-ConnectionGUID: NZxageFpS0ipGuZTIvPd5w==
X-CSE-MsgGUID: wJFQR9mYQeOjAerhk7k4Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143534521"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:22:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 07:22:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 07:22:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.60) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 07:22:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlXnGyb/nyI5Gk5sUURAHksxfXDmDY7uOFebCg+DiYP9WSwBXe+Z0ML9QnIkD03Ewbde4xY1LSoUf05p9NM6/kMAmeJuvWKJfLCMFE98Zl9oLphG3HWylwjHn5ssbRXi2HS5gjAZz0sH8w74Snbuy+8176pF/ont9ml/CxdbM+It1v8yk3LLKyz4DQRbUkPWorc9JBGJcWyzHQQNLu1o/z51TzlcvKgaObtPasC7ZJ2uE/bf1Y+EnyHQ3BvdQQRsar6FwUjf+24w8ciTlga6GKZLHIyUOoTHdf1tIWebprgfbE+9RvsRF2zavaPyByHAzDNQp+iGXG6T6hQwJt6Z5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPZ9nkeNWNkiezQ8YpnJjqTqiQwWmAL5RmHDF8VWp3I=;
 b=K9TvfcjzdnZW9FO010eXxY4T/vYiF6/Xd4aKHTcWMPIoolHZXGllWVoGpknAZxisxkBjK7fW6RdHEtSzt5ymrrhRyJ+xA49UfYaDb0GXreXmuMHbEZe9zXdm5E+nRjjD5tgYWN7xo54FJiCZB9aQmo5yVRhEkvM5+QMDLpjfdbQrAqayO84iur2bLHSKLSNtkbccSPNIBjFj7tHP8e78x9/wlFjJ3TIaanmgA2mraVNUhS35Hu+vBUg6ICZmr5Kt45uKgKPpfk0fj8DAxkyfazx8CU9OR/bAeByR4wAilUrHflan7CI4jpEWQFy5JBb64eoBGAE6TTsrGYO9GPmBBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 14:22:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 14:22:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Topic: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Index: AQHb0JvCnpB9WjrebkeSiFKJEHnUQrPpqCbg
Date: Thu, 29 May 2025 14:22:16 +0000
Message-ID: <CH0PR11MB5444011C3169C962E729DB12E566A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB5102:EE_
x-ms-office365-filtering-correlation-id: 815eda26-3bed-4d21-928b-08dd9ebc36f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?r0r0ZeOB2XG6B93Vl7OpqB1yor8GAxwnN5ORERsZRRODF2Yf5I1X1WFIskts?=
 =?us-ascii?Q?GZ72X7Myv7dws7B/0Ma/HXyXhnELCPtunrnM9l8DyIJjBK06kEo1WfJvG3D7?=
 =?us-ascii?Q?23hcA3u75W8Qh8b7MABvArx52gAQ4v76ywdc48pY/UneGtch38n018Khxhos?=
 =?us-ascii?Q?3L/nM96HdFQjgPHUlQISj364OG95YKnOWrKvXj5zrCE62WXn3njdtGtdnS54?=
 =?us-ascii?Q?0uTIlz/6aveCL4+frjzaSXLt8U/DTcQzMo2Vc+YbBmuT6IRjtau2s5xTMtXi?=
 =?us-ascii?Q?rPrx9wlbIQxv/8aZ5p3RVVdy1WJxL7eFhbsl8WOB5ftN2Do3MZukPrj+uhOD?=
 =?us-ascii?Q?TeT3hn/heD5IHzpIKgtDL+45FIkKhrmBzBt+lvr6hie/KFozjTokCfps9qUq?=
 =?us-ascii?Q?N9im4WnAP4SYoOAjN1H1c6en7EKrOQ11gC8clpzQvw3WqVrUmkHZjWIuFukG?=
 =?us-ascii?Q?tQy2tqiN+DGTzSKa/p2unb4grrRgcAAsncFmDtw1MNBUSzgdyv7ipfVp6jJF?=
 =?us-ascii?Q?Et5ZhjspLkT0kYF+ZjTkfYwfIPKxRI797VsDBdrSgkmymW5heA/L5SE9pimP?=
 =?us-ascii?Q?IQifI7t64ZDndQ8YqGO7phB/0/uIQEFLE78cRbd89iVLbZ9GomQNrUlJGds4?=
 =?us-ascii?Q?r02oBYTz1l5+subaZJf3RPCPOWs9/iBpGRCs9DLbBmPJXIz+DZG/hlOPKzv3?=
 =?us-ascii?Q?00vFe4EQlfvuXVZd2ujHFqjIiNYp/DdHaPe0oUJEPJBSnM0RYlTOhXpyRiT1?=
 =?us-ascii?Q?XZ9AOIZ3XDqYMi5rMUcTfSU3lyfgARogNa+PuKXHVUeNNj6sxxdLQEvnb+nk?=
 =?us-ascii?Q?hUF0MTUNTjDUWCWrU43h8K9AqYe1mdbmmsOJbDpP/ZhGpEVKjbAwG8HKhCqb?=
 =?us-ascii?Q?Uh0S3tD3eDDABi4xNQNoVWLekXgTUSN2uwNOwjG6x7um9fR59KaBMmaz2id8?=
 =?us-ascii?Q?uTqyPSND4VrWI+yZbmAhHqR0PT8RmkzFjH+a8rXLknHyefKVdK8KxZEpM7aP?=
 =?us-ascii?Q?RZwwnr6u1FhA6IcwaYEELzAA2HJ3KkJXrovR0ZzpsMg8bKbrHfmEiCmUw9Py?=
 =?us-ascii?Q?bGMtoCIT8vMLCjbk05+EstffZnBtENdBdynxOZv7BEkM3jlsdwfnnXofBB33?=
 =?us-ascii?Q?FMhnsF6TGWyle5FRU9QUqX2zKJr1hAdmyYpE6gziM7r27LXRMHDX/PFA6J+z?=
 =?us-ascii?Q?48iUkYtMQW2+FBSoyT7uPUmbEdGRZlJ78N6OQeGRLVY1yIgrXKHVSUw2uf7L?=
 =?us-ascii?Q?L6RT4tTW7IylT4pj+QhJ6bxZ4QVDz3RwoKArH4+3aYGDyg4FemQgI1BMV5ux?=
 =?us-ascii?Q?jj05kxTZkN1jaRJxwNHcUR6ll4phx1vglhNOOogYR1r9a0c1uJsLtoFNGSWy?=
 =?us-ascii?Q?jycjpYju6TKJlQQFQEmxMHCb99Pjwx8/9nz3wAtZqVXty3rV5eNtnUGKiRJB?=
 =?us-ascii?Q?RoFL/EX9zSBcEcXLwc9esZWZms5dLMYCGhDni7QgyWa8BuNStCB/pkYPogre?=
 =?us-ascii?Q?7BesmjAixWGK7rY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JcVfpbkcAtMMRIwBzd+CXk1E2Rqsv0I9EuSU/HD/fEtaH8DWYLIAQ2fyvTaa?=
 =?us-ascii?Q?28fDzzUunXGF/9DpL7vrl72eXGuOZHNYyXPjpjwV5sNomyKC2JZXYJncIfLO?=
 =?us-ascii?Q?gv3fc1n4B0RjH0gRHX2IcP2/+sUAbDbJUc6ruI/uJ9J+Xg/10Bn56tu9C1DY?=
 =?us-ascii?Q?fmrLSkiENJmlv0Sv2kTdSKL1/fLTlZUmkYdWQE7iwLJ0ZgDf3rZisp7H2LpO?=
 =?us-ascii?Q?daVJ06URfpIcoMfySydZL25Q7VdBEByTgSLAqItOddon7HN/rLedDmJYtwSs?=
 =?us-ascii?Q?IJZaVODfXmrqNGfsz1T6tZ9uvRajZMon9HkWgFUFBVJHL7BajLOZtH3yknPh?=
 =?us-ascii?Q?VY32TYmU+8yRC7dfWF3TlTI1ffkpCBY1TAzAALuOk1uZh95Pq3Ed89ENfYnQ?=
 =?us-ascii?Q?o1O/TrGICSkWW1+bsQwIRzVNdm9Ntld/tEsRMg2/JsecDpgHbOABFk1D6EGC?=
 =?us-ascii?Q?q5Lolw0QNzO4jGOQlivXvyBYlrxInSc8l7eozFs6Fhc3SYUAlWuSLWWkXgV7?=
 =?us-ascii?Q?IjdR8oBsDs3UTPoXtsNiCGnxcS/aIu26BJDlWPFW74IghyiyxSH0JJ7B+HUO?=
 =?us-ascii?Q?DHqd/l3hTw0xET+XNznEucfHQI3XDWJsJW4P2R0FMPTqWj/4uyUqXaK7pWyC?=
 =?us-ascii?Q?vCCG6Pc7ncw/kobAyWMRBX8AXsjOAXW9vBrsZdiBvuYjeiB+sKn0ALSLTIhe?=
 =?us-ascii?Q?LRlwcyFcqN0tdEoWKfq/PSCegnmTWiXP1D95Wft+p6vVfwg1Rc189tSzbBL7?=
 =?us-ascii?Q?qfzEcGdvQJ1t+mCAkoaCbrEG5f0OLsxvVeFospoC8qtcWd8G+B8IhCAeicn2?=
 =?us-ascii?Q?C0w07DJ78yzH384wv5bdFayH/73A5XBOS4hj94MT820E6PqhkiEObtX+hUy+?=
 =?us-ascii?Q?QQOcLc++DRuXEA1iP5Jf9dadJffP/NoCj8ZcrlqpyH0IbVjrrMgacX9/JaYu?=
 =?us-ascii?Q?8FOy9cGFNvaHH4oPhDnNUXK7BMc65KBecm5ayTY+j3sg4vvEUh/b/+KhFphc?=
 =?us-ascii?Q?h0aZcqd14l7CPUtxsz9tsRoYBZRUw17J5ezpnGMB6Srlj5xLJJ91vdyyNWPC?=
 =?us-ascii?Q?eUgT+TSI6sX/Abhh0D2NQR9yV1KONZVQh7hQteRITtV+GeMIhEaAYXzBBn6l?=
 =?us-ascii?Q?79S1bWwlSwStrF6XfvuRt4VAn3cyafFIjXTApfq88P7SLcdjt3KiFmc7mFlu?=
 =?us-ascii?Q?8XQ2NyQxJnOzPWoDH14+kuI9G6JcqWB2J3TpLnh7iQ0EjfbTwD6DsSI/JfIV?=
 =?us-ascii?Q?Ot3iJyslTukSjtyRS01OJCCAWPk8KSBGy9rHH9CYnkcnuCNAWNLA+ijqwL3X?=
 =?us-ascii?Q?OsH6c+crJZ6qAUsBqiV2/eB2xrmNdBeNEXGshEn7+0vBs+HSRmStEYLf64AR?=
 =?us-ascii?Q?lTMCzUx2gURLoI14j6wZrDjfteRToTG8gzFZulbRi5Urm55d7NuvzZWUeino?=
 =?us-ascii?Q?sxD6NeYJwZdDoAAT/X8+msWVNz8ECjkIQUwLihNFnsfiT1rt4GYGM0qDU/cl?=
 =?us-ascii?Q?PbkZovvgGQjydypLm57hIsAgecDQMgM5+EhlCqCYBQkvaNQvTErpaFm4bF0t?=
 =?us-ascii?Q?Mnr4MYQyHmqr7jCpzp4xqN/AO+A90NWxobuwE0TO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815eda26-3bed-4d21-928b-08dd9ebc36f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 14:22:16.9581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P81KUztBXTis2U8K8CtFHvysycK17VQn7QBPOat2Um6wadUyCUSwsIZZ/xCsBUSNjyD0Ue8AjdnnKrjdpVRpKcZ3prNzYmbfJ5mLRE5Xcrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
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

-----Original Message-----
From: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>=20
Sent: Thursday, May 29, 2025 6:32 AM
To: igt-dev@lists.freedesktop.org
Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Wajdeczko, Michal=
 <Michal.Wajdeczko@intel.com>; Dugast, Francois <francois.dugast@intel.com>=
; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Harrison, John C <john.c.ha=
rrison@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors wh=
ile injecting fault
>=20
> Currently, numerous fault messages have been included in the dmesg ignore=
 list,
> and this list continues to expand. Each time a new fault injection point =
is
> introduced or a new feature is activated, additional fault messages appea=
r,
> making it cumbersome to manage the dmesg ignore list.
>=20
> This new patch automatically ignores all error messages from dmesg, elimi=
nating
> the need to add or maintain a dmesg ignore message list.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

You can add my
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
to this patch, but lets wait to see what everyone else has to say about
it before proceeding with a merge.
-Jonathan Cavitt

> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 35 +++++++-------------------------
>  1 file changed, 7 insertions(+), 28 deletions(-)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index f9bd5c761..0dffbe5da 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -64,30 +64,9 @@ static int fail_function_open(void)
>  	return debugfs_fail_function_dir_fd;
>  }
> =20
> -static bool function_is_part_of_guc(const char function_name[])
> +static void ignore_faults_in_dmesg(void)
>  {
> -	return strstr(function_name, "_guc_") !=3D NULL ||
> -	       strstr(function_name, "_uc_") !=3D NULL ||
> -	       strstr(function_name, "_wopcm_") !=3D NULL;
> -}
> -
> -static void ignore_faults_in_dmesg(const char function_name[])
> -{
> -	/* Driver probe is expected to fail in all cases, so ignore in igt_runn=
er */
> -	char regex[1024] =3D "probe with driver xe failed with error -12";
> -
> -	/*
> -	 * If GuC module fault is injected, GuC is expected to fail,
> -	 * so also ignore GuC init failures in igt_runner.
> -	 */
> -	if (function_is_part_of_guc(function_name)) {
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOME=
M");
> -	}
> -
> -	igt_emit_ignore_dmesg_regex(regex);
> +	igt_emit_ignore_dmesg_regex(".*");
>  }
> =20
>  /*
> @@ -234,7 +213,7 @@ inject_fault_probe(int fd, char pci_slot[], const cha=
r function_name[])
>  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>  		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
> =20
> @@ -299,7 +278,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_c=
lass_instance *instance,
>  	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_q=
ueue_id), 0);
>  	xe_exec_queue_destroy(fd, exec_queue_id);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queu=
e_id) !=3D 0);
> @@ -334,7 +313,7 @@ vm_create_fail(int fd, const char function_name[], un=
signed int flags)
>  {
>  	igt_assert_eq(simple_vm_create(fd, flags), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_create(fd, flags) !=3D 0);
> @@ -397,7 +376,7 @@ vm_bind_fail(int fd, const char function_name[])
> =20
>  	igt_assert_eq(simple_vm_bind(fd, vm), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_bind(fd, vm) !=3D 0);
> @@ -445,7 +424,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, cons=
t char function_name[])
>  	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) =3D=3D =
1);
>  	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONF=
IG, &config_id), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG,=
 &config), 0);
> --=20
> 2.43.0
>=20
>=20
